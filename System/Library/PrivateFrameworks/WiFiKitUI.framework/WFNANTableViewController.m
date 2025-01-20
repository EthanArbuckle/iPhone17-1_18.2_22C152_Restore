@interface WFNANTableViewController
- (BOOL)_isNANEnabled;
- (NSOrderedSet)sections;
- (WFNANTableViewContext)context;
- (WFNANTableViewController)init;
- (WFNANTableViewDataSource)dataSource;
- (id)_defaultSections;
- (id)_identifierForSection:(unint64_t)a3;
- (void)_configureDataSource;
- (void)_handlePublishersChangedNotification:(id)a3;
- (void)_handleSubscribersChangedNotification:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setSections:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WFNANTableViewController

- (WFNANTableViewController)init
{
  v3 = +[WFAppearanceProxy defaultAppearanceProxy];
  v14.receiver = self;
  v14.super_class = (Class)WFNANTableViewController;
  v4 = -[WFNANTableViewController initWithStyle:](&v14, sel_initWithStyle_, [v3 tableViewStyle]);

  if (v4)
  {
    v5 = (void *)MEMORY[0x263EFF9D8];
    v6 = [(WFNANTableViewController *)v4 _defaultSections];
    uint64_t v7 = [v5 orderedSetWithArray:v6];
    sections = v4->_sections;
    v4->_sections = (NSOrderedSet *)v7;

    v9 = objc_alloc_init(WFNANTableViewContext);
    context = v4->_context;
    v4->_context = v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v4 selector:sel__handlePublishersChangedNotification_ name:@"WFNANPublishersChangedNotification" object:0];

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v4 selector:sel__handleSubscribersChangedNotification_ name:@"WFNANSubscribersChangedNotification" object:0];

    [(WFInsetTableViewController *)v4 setReloadDataOnUpdateSectionContentInset:0];
  }
  return v4;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)WFNANTableViewController;
  [(WFNANTableViewController *)&v9 viewDidLoad];
  uint64_t v3 = WFCurrentDeviceCapability();
  BOOL IsChinaDevice = WFCapabilityIsChinaDevice(v3);
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = v5;
  if (IsChinaDevice) {
    uint64_t v7 = @"kWFLocNAN_CH";
  }
  else {
    uint64_t v7 = @"kWFLocNAN";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [(WFNANTableViewController *)self setTitle:v8];

  [(WFNANTableViewController *)self _configureDataSource];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFNANTableViewController;
  [(WFNANTableViewController *)&v3 viewDidDisappear:a3];
}

- (id)_defaultSections
{
  return &unk_26D912208;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"WFNANSection_%lu", a3);
}

- (void)_configureDataSource
{
  v28[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [WFNANTableViewDataSource alloc];
  v4 = [(WFNANTableViewController *)self tableView];
  v5 = [(WFNANTableViewController *)self sections];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __48__WFNANTableViewController__configureDataSource__block_invoke;
  v25[3] = &unk_264756140;
  v25[4] = self;
  v6 = [(WFNANTableViewDataSource *)v3 initWithTableView:v4 sections:v5 cellProvider:v25];
  [(WFNANTableViewController *)self setDataSource:v6];

  id v7 = objc_alloc_init(MEMORY[0x263F82358]);
  v8 = [MEMORY[0x263EFF980] array];
  objc_super v9 = [(WFNANTableViewController *)self sections];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    do
    {
      v12 = [(WFNANTableViewController *)self sections];
      v13 = [v12 objectAtIndexedSubscript:v11];
      uint64_t v14 = [v13 unsignedIntegerValue];

      v15 = [(WFNANTableViewController *)self _identifierForSection:v14];
      [v8 addObject:v15];

      ++v11;
      v16 = [(WFNANTableViewController *)self sections];
      unint64_t v17 = [v16 count];
    }
    while (v17 > v11);
  }
  [v7 appendSectionsWithIdentifiers:v8];
  v28[0] = @"WFNANTableViewControllerNANState";
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
  v19 = [(WFNANTableViewController *)self _identifierForSection:0];
  [v7 appendItemsWithIdentifiers:v18 intoSectionWithIdentifier:v19];

  v27 = @"WFNANTableViewControllerSubscribersCount";
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  v21 = [(WFNANTableViewController *)self _identifierForSection:2];
  [v7 appendItemsWithIdentifiers:v20 intoSectionWithIdentifier:v21];

  v26 = @"WFNANTableViewControllerPublishersCount";
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  v23 = [(WFNANTableViewController *)self _identifierForSection:1];
  [v7 appendItemsWithIdentifiers:v22 intoSectionWithIdentifier:v23];

  v24 = [(WFNANTableViewController *)self dataSource];
  [v24 applySnapshot:v7 animatingDifferences:1];
}

id __48__WFNANTableViewController__configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = [v6 sections];
  objc_super v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  uint64_t v10 = [v9 unsignedIntegerValue];

  unint64_t v11 = [v7 dequeueReusableCellWithIdentifier:@"WFNANTableViewTextCellIdentifier"];

  if (!v11) {
    unint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"WFNANTableViewTextCellIdentifier"];
  }
  if (v10 == 2)
  {
    if ([v5 row])
    {
      v19 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "getSubscriberAtIndex:", objc_msgSend(v5, "row") - 1);
      v20 = [v19 configuration];
      v21 = [v20 serviceName];
      v22 = [v11 textLabel];
      [v22 setText:v21];

LABEL_15:
      goto LABEL_20;
    }
    v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:@"kWFLocNANSubscribers" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    v31 = [v11 textLabel];
    [v31 setText:v30];

    v32 = NSString;
    uint64_t v33 = [*(id *)(*(void *)(a1 + 32) + 1040) getSubscribersCount];
LABEL_18:
    v37 = objc_msgSend(v32, "stringWithFormat:", @"%ld", v33);
    v38 = [v11 detailTextLabel];
    [v38 setText:v37];

    [v11 setAccessoryType:1];
    unint64_t v17 = v11;
    uint64_t v18 = 1;
LABEL_19:
    [v17 setSelectionStyle:v18];
    goto LABEL_20;
  }
  if (v10 == 1)
  {
    if ([v5 row])
    {
      v19 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "getPublisherAtIndex:", objc_msgSend(v5, "row") - 1);
      v23 = NSString;
      v20 = [v19 configuration];
      v21 = [v20 serviceName];
      v24 = [v19 configuration];
      v25 = [v24 serviceSpecificInfo];
      v26 = [v25 instanceName];
      v27 = [v23 stringWithFormat:@"%@ [%@]", v21, v26];
      v28 = [v11 textLabel];
      [v28 setText:v27];

      goto LABEL_15;
    }
    v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v35 = [v34 localizedStringForKey:@"kWFLocNANPublishers" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    v36 = [v11 textLabel];
    [v36 setText:v35];

    v32 = NSString;
    uint64_t v33 = [*(id *)(*(void *)(a1 + 32) + 1040) getPublishersCount];
    goto LABEL_18;
  }
  if (!v10 && ![v5 row])
  {
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"kWFLocNANState" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    uint64_t v14 = [v11 textLabel];
    [v14 setText:v13];

    if ([*(id *)(a1 + 32) _isNANEnabled]) {
      v15 = @"Enabled";
    }
    else {
      v15 = @"Disabled";
    }
    v16 = [v11 detailTextLabel];
    [v16 setText:v15];

    unint64_t v17 = v11;
    uint64_t v18 = 0;
    goto LABEL_19;
  }
LABEL_20:

  return v11;
}

- (void)_handlePublishersChangedNotification:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFNANTableViewController *)self dataSource];
  v6 = [v5 snapshot];

  id v7 = [v4 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"WFNANTableViewContextChangedPublisherKey"];

  objc_super v9 = [v4 userInfo];

  uint64_t v10 = [v9 objectForKeyedSubscript:@"WFNANTableViewContextChangedOperationTypeKey"];

  if (v10) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    uint64_t v12 = [v10 unsignedIntegerValue];
    if (v12 == 1)
    {
      uint64_t v18 = v8;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
      [v6 deleteItemsWithIdentifiers:v13];
    }
    else
    {
      if (v12)
      {
LABEL_10:
        v17[0] = @"WFNANTableViewControllerNANState";
        v17[1] = @"WFNANTableViewControllerPublishersCount";
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
        [v6 reconfigureItemsWithIdentifiers:v15];

        v16 = [(WFNANTableViewController *)self dataSource];
        [v16 applySnapshot:v6 animatingDifferences:1];

        goto LABEL_11;
      }
      v19[0] = v8;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      uint64_t v14 = [(WFNANTableViewController *)self _identifierForSection:1];
      [v6 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:v14];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_handleSubscribersChangedNotification:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFNANTableViewController *)self dataSource];
  v6 = [v5 snapshot];

  id v7 = [v4 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"WFNANTableViewContextChangedSubscriberKey"];

  objc_super v9 = [v4 userInfo];

  uint64_t v10 = [v9 objectForKeyedSubscript:@"WFNANTableViewContextChangedOperationTypeKey"];

  if (v10) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    uint64_t v12 = [v10 unsignedIntegerValue];
    if (v12 == 1)
    {
      uint64_t v18 = v8;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
      [v6 deleteItemsWithIdentifiers:v13];
    }
    else
    {
      if (v12)
      {
LABEL_10:
        v17[0] = @"WFNANTableViewControllerNANState";
        v17[1] = @"WFNANTableViewControllerSubscribersCount";
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
        [v6 reconfigureItemsWithIdentifiers:v15];

        v16 = [(WFNANTableViewController *)self dataSource];
        [v16 applySnapshot:v6 animatingDifferences:1];

        goto LABEL_11;
      }
      v19[0] = v8;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      uint64_t v14 = [(WFNANTableViewController *)self _identifierForSection:2];
      [v6 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:v14];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)_isNANEnabled
{
  int64_t v3 = [(WFNANTableViewContext *)self->_context getPublishersCount];
  int64_t v4 = [(WFNANTableViewContext *)self->_context getSubscribersCount];
  return !((v4 + v3 < 0) ^ __OFADD__(v4, v3) | (v4 + v3 == 0));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  id v5 = [(WFNANTableViewController *)self sections];
  v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v11, "section"));
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7 == 2)
  {
    if ([v11 row]) {
      goto LABEL_8;
    }
    v8 = WFNANSubscribeTableViewController;
    goto LABEL_7;
  }
  if (v7 == 1 && ![v11 row])
  {
    v8 = WFNANPublishTableViewController;
LABEL_7:
    objc_super v9 = (void *)[[v8 alloc] initWithContext:self->_context];
    uint64_t v10 = [(WFNANTableViewController *)self navigationController];
    [v10 pushViewController:v9 animated:1];
  }
LABEL_8:
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

- (WFNANTableViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end