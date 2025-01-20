@interface WFNANDataSessionsTableViewController
- (NSOrderedSet)sections;
- (WFNANDataSessionsTableViewController)initWithContext:(id)a3 forPublisher:(id)a4;
- (WFNANDataSessionsTableViewDataSource)dataSource;
- (WFNANTableViewContext)context;
- (WiFiAwarePublisher)publisher;
- (id)_defaultSections;
- (id)_identifierForSection:(unint64_t)a3;
- (void)_configureDataSource;
- (void)_handleDataSessionsChangedNotification:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setSections:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WFNANDataSessionsTableViewController

- (WFNANDataSessionsTableViewController)initWithContext:(id)a3 forPublisher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F86368] defaultAppearanceProxy];
  v17.receiver = self;
  v17.super_class = (Class)WFNANDataSessionsTableViewController;
  v10 = -[WFNANDataSessionsTableViewController initWithStyle:](&v17, sel_initWithStyle_, [v9 tableViewStyle]);

  if (v10)
  {
    v11 = (void *)MEMORY[0x263EFF9D8];
    v12 = [(WFNANDataSessionsTableViewController *)v10 _defaultSections];
    uint64_t v13 = [v11 orderedSetWithArray:v12];
    sections = v10->_sections;
    v10->_sections = (NSOrderedSet *)v13;

    objc_storeStrong((id *)&v10->_context, a3);
    objc_storeStrong((id *)&v10->_publisher, a4);
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v10 selector:sel__handleDataSessionsChangedNotification_ name:@"WFNANDataSessionsForPublishChangedNotification" object:0];

    [(WFInsetTableViewController *)v10 setReloadDataOnUpdateSectionContentInset:0];
  }

  return v10;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)WFNANDataSessionsTableViewController;
  [(WFNANDataSessionsTableViewController *)&v10 viewDidLoad];
  v3 = NSString;
  v4 = [(WiFiAwarePublisher *)self->_publisher configuration];
  v5 = [v4 serviceName];
  v6 = [(WiFiAwarePublisher *)self->_publisher configuration];
  id v7 = [v6 serviceSpecificInfo];
  id v8 = [v7 instanceName];
  v9 = [v3 stringWithFormat:@"%@ [%@]", v5, v8];
  [(WFNANDataSessionsTableViewController *)self setTitle:v9];

  [(WFNANDataSessionsTableViewController *)self _configureDataSource];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFNANDataSessionsTableViewController;
  [(WFNANDataSessionsTableViewController *)&v3 viewDidDisappear:a3];
}

- (id)_defaultSections
{
  return &unk_26D9E2158;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"WFNANDataSessionsSection_%lu", a3);
}

- (void)_configureDataSource
{
  v29[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [WFNANDataSessionsTableViewDataSource alloc];
  v4 = [(WFNANDataSessionsTableViewController *)self tableView];
  v5 = [(WFNANDataSessionsTableViewController *)self context];
  v6 = [(WFNANDataSessionsTableViewController *)self publisher];
  id v7 = [(WFNANDataSessionsTableViewController *)self sections];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __60__WFNANDataSessionsTableViewController__configureDataSource__block_invoke;
  v28[3] = &unk_26478E270;
  v28[4] = self;
  id v8 = [(WFNANDataSessionsTableViewDataSource *)v3 initWithTableView:v4 context:v5 publisher:v6 sections:v7 cellProvider:v28];
  [(WFNANDataSessionsTableViewController *)self setDataSource:v8];

  id v9 = objc_alloc_init(MEMORY[0x263F1C328]);
  objc_super v10 = [MEMORY[0x263EFF980] array];
  v11 = [(WFNANDataSessionsTableViewController *)self sections];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      v14 = [(WFNANDataSessionsTableViewController *)self sections];
      v15 = [v14 objectAtIndexedSubscript:v13];
      uint64_t v16 = [v15 unsignedIntegerValue];

      objc_super v17 = [(WFNANDataSessionsTableViewController *)self _identifierForSection:v16];
      [v10 addObject:v17];

      ++v13;
      v18 = [(WFNANDataSessionsTableViewController *)self sections];
      unint64_t v19 = [v18 count];
    }
    while (v19 > v13);
  }
  [v9 appendSectionsWithIdentifiers:v10];
  context = self->_context;
  v21 = [(WFNANDataSessionsTableViewController *)self publisher];
  uint64_t v22 = [(WFNANTableViewContext *)context getDataSessionsCountForPublisher:v21];

  if (v22)
  {
    v23 = self->_context;
    v24 = [(WFNANDataSessionsTableViewController *)self publisher];
    v25 = [(WFNANTableViewContext *)v23 getDataSessionsForPublisher:v24];
    v26 = [(WFNANDataSessionsTableViewController *)self _identifierForSection:0];
    [v9 appendItemsWithIdentifiers:v25 intoSectionWithIdentifier:v26];
  }
  else
  {
    v29[0] = @"WFNANDataSessionsNoActiveSessionsIdentifier";
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
    v25 = [(WFNANDataSessionsTableViewController *)self _identifierForSection:0];
    [v9 appendItemsWithIdentifiers:v24 intoSectionWithIdentifier:v25];
  }

  v27 = [(WFNANDataSessionsTableViewController *)self dataSource];
  [v27 applySnapshot:v9 animatingDifferences:1];
}

id __60__WFNANDataSessionsTableViewController__configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 sections];
  id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  uint64_t v10 = [v9 unsignedIntegerValue];

  v11 = [v7 dequeueReusableCellWithIdentifier:@"WFNANTableViewTextCellIdentifier"];

  if (!v11) {
    v11 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"WFNANTableViewTextCellIdentifier"];
  }
  [v11 setSelectionStyle:0];
  if (!v10)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 1040) getDataSessionsCountForPublisher:*(void *)(*(void *)(a1 + 32) + 1048)])
    {
      uint64_t v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "getDataSessionAtIndex:forPublisher:", objc_msgSend(v5, "row"), *(void *)(*(void *)(a1 + 32) + 1048));
      unint64_t v13 = [v12 initiatorDataAddress];
      v14 = [v13 ipv6LinkLocalAddress];
      v15 = stringForIpv6LinkLocalAddress(v14);
      uint64_t v16 = [v11 textLabel];
      [v16 setText:v15];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      unint64_t v13 = [v12 localizedStringForKey:@"kWFLocNANNoActiveDataSessions" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
      v14 = [v11 textLabel];
      [v14 setText:v13];
    }
  }
  return v11;
}

- (void)_handleDataSessionsChangedNotification:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFNANDataSessionsTableViewController *)self dataSource];
  v6 = [v5 snapshot];

  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"WFNANTableViewContextChangedPublisherKey"];

  id v9 = [v4 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"WFNANTableViewContextChangedDataSessionKey"];

  v11 = [v4 userInfo];

  uint64_t v12 = [v11 objectForKeyedSubscript:@"WFNANTableViewContextChangedOperationTypeKey"];

  unint64_t v13 = [(WFNANDataSessionsTableViewController *)self publisher];
  if (v8 != v13 || v12 == 0)
  {
  }
  else
  {

    if (v10)
    {
      uint64_t v15 = [v12 unsignedIntegerValue];
      if (v15 == 1)
      {
        v23 = v10;
        unint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
        [v6 deleteItemsWithIdentifiers:v19];

        if ([(WFNANTableViewContext *)self->_context getDataSessionsCountForPublisher:self->_publisher])
        {
LABEL_15:
          v21 = [(WFNANDataSessionsTableViewController *)self dataSource];
          [v21 applySnapshot:v6 animatingDifferences:1];

          goto LABEL_16;
        }
        uint64_t v22 = @"WFNANDataSessionsNoActiveSessionsIdentifier";
        v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
        v20 = [(WFNANDataSessionsTableViewController *)self _identifierForSection:0];
        [v6 appendItemsWithIdentifiers:v18 intoSectionWithIdentifier:v20];
      }
      else
      {
        if (v15) {
          goto LABEL_15;
        }
        v25[0] = v10;
        uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
        objc_super v17 = [(WFNANDataSessionsTableViewController *)self _identifierForSection:0];
        [v6 appendItemsWithIdentifiers:v16 intoSectionWithIdentifier:v17];

        if ([(WFNANTableViewContext *)self->_context getDataSessionsCountForPublisher:self->_publisher] != 1)goto LABEL_15; {
        v24 = @"WFNANDataSessionsNoActiveSessionsIdentifier";
        }
        v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
        [v6 deleteItemsWithIdentifiers:v18];
      }

      goto LABEL_15;
    }
  }
LABEL_16:
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (WFNANTableViewContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (WiFiAwarePublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (WFNANDataSessionsTableViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end