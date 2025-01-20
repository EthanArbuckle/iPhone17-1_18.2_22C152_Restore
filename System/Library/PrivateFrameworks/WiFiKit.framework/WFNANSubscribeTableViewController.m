@interface WFNANSubscribeTableViewController
- (NSOrderedSet)sections;
- (NSString)serviceName;
- (WFNANSubscribeTableViewController)initWithContext:(id)a3;
- (WFNANSubscribeTableViewDataSource)dataSource;
- (WFNANTableViewContext)context;
- (id)_defaultSections;
- (id)_identifierForSection:(unint64_t)a3;
- (void)_configureDataSource;
- (void)_handleAddSubscriber;
- (void)_handleDiscoveryResultsChangedNotification:(id)a3;
- (void)_handleSubscribersChangedNotification:(id)a3;
- (void)clearInputFields;
- (void)dismissKeyboard;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setSections:(id)a3;
- (void)setServiceName:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WFNANSubscribeTableViewController

- (WFNANSubscribeTableViewController)initWithContext:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x263F86368] defaultAppearanceProxy];
  v15.receiver = self;
  v15.super_class = (Class)WFNANSubscribeTableViewController;
  v7 = -[WFNANSubscribeTableViewController initWithStyle:](&v15, sel_initWithStyle_, [v6 tableViewStyle]);

  if (v7)
  {
    v8 = (void *)MEMORY[0x263EFF9D8];
    v9 = [(WFNANSubscribeTableViewController *)v7 _defaultSections];
    uint64_t v10 = [v8 orderedSetWithArray:v9];
    sections = v7->_sections;
    v7->_sections = (NSOrderedSet *)v10;

    objc_storeStrong((id *)&v7->_context, a3);
    [(WFNANSubscribeTableViewController *)v7 clearInputFields];
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v7 selector:sel__handleSubscribersChangedNotification_ name:@"WFNANSubscribersChangedNotification" object:0];

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v7 selector:sel__handleDiscoveryResultsChangedNotification_ name:@"WFNANDiscoveryResultsChangedNotification" object:0];

    [(WFInsetTableViewController *)v7 setReloadDataOnUpdateSectionContentInset:0];
  }

  return v7;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)WFNANSubscribeTableViewController;
  [(WFNANSubscribeTableViewController *)&v9 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"kWFLocNANSubscribe" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
  [(WFNANSubscribeTableViewController *)self setTitle:v4];

  id v5 = (void *)MEMORY[0x263F1C808];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v5 nibWithNibName:@"WFTextFieldCell" bundle:v6];

  v8 = [(WFNANSubscribeTableViewController *)self tableView];
  [v8 registerNib:v7 forCellReuseIdentifier:@"kWFTextFieldCellIdentifier"];

  [(WFNANSubscribeTableViewController *)self _configureDataSource];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFNANSubscribeTableViewController;
  [(WFNANSubscribeTableViewController *)&v3 viewDidDisappear:a3];
}

- (void)dismissKeyboard
{
  id v2 = [(WFNANSubscribeTableViewController *)self view];
  [v2 endEditing:1];
}

- (id)_defaultSections
{
  return &unk_26D9E2248;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"WFNANSubscribeSection_%lu", a3);
}

- (void)_configureDataSource
{
  v29[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [WFNANSubscribeTableViewDataSource alloc];
  v4 = [(WFNANSubscribeTableViewController *)self tableView];
  id v5 = [(WFNANSubscribeTableViewController *)self context];
  v6 = [(WFNANSubscribeTableViewController *)self sections];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __57__WFNANSubscribeTableViewController__configureDataSource__block_invoke;
  v26[3] = &unk_26478E270;
  v26[4] = self;
  v7 = [(WFNANSubscribeTableViewDataSource *)v3 initWithTableView:v4 context:v5 sections:v6 cellProvider:v26];
  [(WFNANSubscribeTableViewController *)self setDataSource:v7];

  id v8 = objc_alloc_init(MEMORY[0x263F1C328]);
  objc_super v9 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = [(WFNANSubscribeTableViewController *)self sections];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [(WFNANSubscribeTableViewController *)self sections];
      v14 = [v13 objectAtIndexedSubscript:v12];
      uint64_t v15 = [v14 unsignedIntegerValue];

      v16 = [(WFNANSubscribeTableViewController *)self _identifierForSection:v15];
      [v9 addObject:v16];

      ++v12;
      v17 = [(WFNANSubscribeTableViewController *)self sections];
      unint64_t v18 = [v17 count];
    }
    while (v18 > v12);
  }
  [v8 appendSectionsWithIdentifiers:v9];
  v29[0] = @"WFNANSubscribeServiceNameIdentifier";
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  v20 = [(WFNANSubscribeTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v19 intoSectionWithIdentifier:v20];

  v28 = @"WFNANSubscribeAddIdentifier";
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  v22 = [(WFNANSubscribeTableViewController *)self _identifierForSection:0];
  [v8 appendItemsWithIdentifiers:v21 intoSectionWithIdentifier:v22];

  if ([(WFNANTableViewContext *)self->_context getSubscribersCount] <= 0)
  {
    v27 = @"WFNANSubscribeNoSubscribersIdentifier";
    [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  }
  else
  {
    [(WFNANTableViewContext *)self->_context getSubscribers];
  v23 = };
  v24 = [(WFNANSubscribeTableViewController *)self _identifierForSection:1];
  [v8 appendItemsWithIdentifiers:v23 intoSectionWithIdentifier:v24];

  v25 = [(WFNANSubscribeTableViewController *)self dataSource];
  [v25 applySnapshot:v8 animatingDifferences:1];
}

id __57__WFNANSubscribeTableViewController__configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) sections];
  uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  uint64_t v12 = [v11 unsignedIntegerValue];

  if (v12 == 1)
  {
    v13 = [v7 dequeueReusableCellWithIdentifier:@"WFNANTableViewTextCellIdentifier"];
    if (!v13) {
      v13 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"WFNANTableViewTextCellIdentifier"];
    }
    if ([*(id *)(*(void *)(a1 + 32) + 1040) getSubscribersCount])
    {
      v14 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "getSubscriberAtIndex:", objc_msgSend(v8, "row"));
      unint64_t v18 = [v14 configuration];
      v19 = [v18 serviceName];
      v20 = [v13 textLabel];
      [v20 setText:v19];

      v21 = objc_msgSend(NSString, "stringWithFormat:", @"%ld results", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "getDiscoveryResultsCountForSubscriber:", v14));
      v22 = [v13 detailTextLabel];
      [v22 setText:v21];

      [v13 setAccessoryType:1];
      [v13 setSelectionStyle:1];
LABEL_13:

      goto LABEL_16;
    }
    v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"kWFLocNANNoSubscribers" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
    v30 = [v13 textLabel];
    [v30 setText:v29];

    [v13 setSelectionStyle:0];
  }
  else
  {
    if (v12) {
      goto LABEL_8;
    }
    if ([v8 row])
    {
      if ([v8 row] == 1)
      {
        v13 = [v7 dequeueReusableCellWithIdentifier:@"WFNANTableViewTextCellIdentifier"];
        if (!v13) {
          v13 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"WFNANTableViewTextCellIdentifier"];
        }
        [v13 setSelectionStyle:0];
        v14 = [MEMORY[0x263F1C488] buttonWithType:1];
        [v14 setTitle:@"Add" forState:0];
        uint64_t v15 = [v13 textLabel];
        v16 = [v15 font];
        v17 = [v14 titleLabel];
        [v17 setFont:v16];

        [v14 sizeToFit];
        [v14 addTarget:*(void *)(a1 + 32) action:sel__handleAddSubscriber forControlEvents:64];
        [v13 setAccessoryView:v14];
        goto LABEL_13;
      }
LABEL_8:
      v13 = 0;
      goto LABEL_16;
    }
    v13 = [v7 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v8];
    [v13 setHideLabel:1];
    [v13 setEditable:1];
    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 1056);
    v24 = [v13 textField];
    [v24 setText:v23];

    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"kWFLocNANServiceName" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
    v27 = [v13 textField];
    [v27 setPlaceholder:v26];

    objc_initWeak(&location, *(id *)(a1 + 32));
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __57__WFNANSubscribeTableViewController__configureDataSource__block_invoke_2;
    v32[3] = &unk_26478F2A0;
    objc_copyWeak(&v33, &location);
    [v13 setTextChangeHandler:v32];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
LABEL_16:

  return v13;
}

void __57__WFNANSubscribeTableViewController__configureDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setServiceName:v3];
}

- (void)_handleSubscribersChangedNotification:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFNANSubscribeTableViewController *)self dataSource];
  v6 = [v5 snapshot];

  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"WFNANTableViewContextChangedSubscriberKey"];

  id v9 = [v4 userInfo];

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
      v22 = v8;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
      [v6 deleteItemsWithIdentifiers:v16];

      if ([(WFNANTableViewContext *)self->_context getSubscribersCount])
      {
LABEL_12:
        [(WFNANSubscribeTableViewController *)self clearInputFields];
        v20 = @"WFNANSubscribeServiceNameIdentifier";
        unint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
        [v6 reconfigureItemsWithIdentifiers:v18];

        v19 = [(WFNANSubscribeTableViewController *)self dataSource];
        [v19 applySnapshot:v6 animatingDifferences:1];

        goto LABEL_13;
      }
      v21 = @"WFNANSubscribeNoSubscribersIdentifier";
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
      v17 = [(WFNANSubscribeTableViewController *)self _identifierForSection:1];
      [v6 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:v17];
    }
    else
    {
      if (v12) {
        goto LABEL_12;
      }
      v24[0] = v8;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
      v14 = [(WFNANSubscribeTableViewController *)self _identifierForSection:1];
      [v6 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:v14];

      if ([(WFNANTableViewContext *)self->_context getSubscribersCount] != 1) {
        goto LABEL_12;
      }
      uint64_t v23 = @"WFNANSubscribeNoSubscribersIdentifier";
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
      [v6 deleteItemsWithIdentifiers:v15];
    }

    goto LABEL_12;
  }
LABEL_13:
}

- (void)_handleDiscoveryResultsChangedNotification:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFNANSubscribeTableViewController *)self dataSource];
  v6 = [v5 snapshot];

  id v7 = [v4 userInfo];

  id v8 = [v7 objectForKeyedSubscript:@"WFNANTableViewContextChangedSubscriberKey"];

  if (v8)
  {
    v11[0] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    [v6 reconfigureItemsWithIdentifiers:v9];

    uint64_t v10 = [(WFNANSubscribeTableViewController *)self dataSource];
    [v10 applySnapshot:v6 animatingDifferences:1];
  }
}

- (void)clearInputFields
{
  self->_serviceName = (NSString *)&stru_26D9BFD58;
  MEMORY[0x270F9A758]();
}

- (void)_handleAddSubscriber
{
  id v3 = objc_alloc(MEMORY[0x263F86460]);
  id v4 = [(WFNANSubscribeTableViewController *)self serviceName];
  id v7 = (id)[v3 initWithServiceName:v4];

  [v7 setAuthenticationType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F86468]) initWithConfiguration:v7];
  [v5 setDelegate:self->_context];
  [(WFNANSubscribeTableViewController *)self clearInputFields];
  v6 = [(WFNANSubscribeTableViewController *)self context];
  [v6 addSubscriber:v5];

  [(WFNANSubscribeTableViewController *)self dismissKeyboard];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  id v5 = [(WFNANSubscribeTableViewController *)self sections];
  v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7 == 1 && [(WFNANTableViewContext *)self->_context getSubscribersCount] >= 1)
  {
    id v8 = [WFNANDiscoveryResultsTableViewController alloc];
    context = self->_context;
    uint64_t v10 = -[WFNANTableViewContext getSubscriberAtIndex:](context, "getSubscriberAtIndex:", [v13 row]);
    BOOL v11 = [(WFNANDiscoveryResultsTableViewController *)v8 initWithContext:context forSubscriber:v10];

    uint64_t v12 = [(WFNANSubscribeTableViewController *)self navigationController];
    [v12 pushViewController:v11 animated:1];
  }
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

- (WFNANSubscribeTableViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end