@interface WFNANDiscoveryResultsTableViewController
- (NSOrderedSet)sections;
- (NSString)passphrase;
- (WFNANDiscoveryResultsTableViewController)initWithContext:(id)a3 forSubscriber:(id)a4;
- (WFNANDiscoveryResultsTableViewDataSource)dataSource;
- (WFNANTableViewContext)context;
- (WiFiAwareSubscriber)subscriber;
- (id)_defaultSections;
- (id)_identifierForSection:(unint64_t)a3;
- (void)_configureDataSource;
- (void)_handleDataSessionsChangedNotification:(id)a3;
- (void)_handleDiscoveryResultsChangedNotification:(id)a3;
- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5;
- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)dataSessionRequestStarted:(id)a3;
- (void)passphraseTextFieldDidChange:(id)a3;
- (void)setContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setPassphrase:(id)a3;
- (void)setSections:(id)a3;
- (void)setSubscriber:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WFNANDiscoveryResultsTableViewController

- (WFNANDiscoveryResultsTableViewController)initWithContext:(id)a3 forSubscriber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263F86368] defaultAppearanceProxy];
  v19.receiver = self;
  v19.super_class = (Class)WFNANDiscoveryResultsTableViewController;
  v10 = -[WFNANDiscoveryResultsTableViewController initWithStyle:](&v19, sel_initWithStyle_, [v9 tableViewStyle]);

  if (v10)
  {
    v11 = (void *)MEMORY[0x263EFF9D8];
    v12 = [(WFNANDiscoveryResultsTableViewController *)v10 _defaultSections];
    uint64_t v13 = [v11 orderedSetWithArray:v12];
    sections = v10->_sections;
    v10->_sections = (NSOrderedSet *)v13;

    objc_storeStrong((id *)&v10->_context, a3);
    objc_storeStrong((id *)&v10->_subscriber, a4);
    passphrase = v10->_passphrase;
    v10->_passphrase = (NSString *)&stru_26D9BFD58;

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v10 selector:sel__handleDiscoveryResultsChangedNotification_ name:@"WFNANDiscoveryResultsChangedNotification" object:0];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v10 selector:sel__handleDataSessionsChangedNotification_ name:@"WFNANDataSessionsForSubscribeChangedNotification" object:0];

    [(WFInsetTableViewController *)v10 setReloadDataOnUpdateSectionContentInset:0];
  }

  return v10;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WFNANDiscoveryResultsTableViewController;
  [(WFNANDiscoveryResultsTableViewController *)&v7 viewDidLoad];
  v3 = NSString;
  v4 = [(WiFiAwareSubscriber *)self->_subscriber configuration];
  v5 = [v4 serviceName];
  v6 = [v3 stringWithFormat:@"%@", v5];
  [(WFNANDiscoveryResultsTableViewController *)self setTitle:v6];

  [(WFNANDiscoveryResultsTableViewController *)self _configureDataSource];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFNANDiscoveryResultsTableViewController;
  [(WFNANDiscoveryResultsTableViewController *)&v3 viewDidDisappear:a3];
}

- (id)_defaultSections
{
  return &unk_26D9E2188;
}

- (id)_identifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"WFNANDiscoveryResultsSection_%lu", a3);
}

- (void)_configureDataSource
{
  v37[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [WFNANDiscoveryResultsTableViewDataSource alloc];
  v4 = [(WFNANDiscoveryResultsTableViewController *)self tableView];
  v5 = [(WFNANDiscoveryResultsTableViewController *)self context];
  v6 = [(WFNANDiscoveryResultsTableViewController *)self subscriber];
  objc_super v7 = [(WFNANDiscoveryResultsTableViewController *)self sections];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __64__WFNANDiscoveryResultsTableViewController__configureDataSource__block_invoke;
  v35[3] = &unk_26478E270;
  v35[4] = self;
  id v8 = [(WFNANDiscoveryResultsTableViewDataSource *)v3 initWithTableView:v4 context:v5 subscriber:v6 sections:v7 cellProvider:v35];
  [(WFNANDiscoveryResultsTableViewController *)self setDataSource:v8];

  id v9 = objc_alloc_init(MEMORY[0x263F1C328]);
  v10 = [MEMORY[0x263EFF980] array];
  v11 = [(WFNANDiscoveryResultsTableViewController *)self sections];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      v14 = [(WFNANDiscoveryResultsTableViewController *)self sections];
      v15 = [v14 objectAtIndexedSubscript:v13];
      uint64_t v16 = [v15 unsignedIntegerValue];

      v17 = [(WFNANDiscoveryResultsTableViewController *)self _identifierForSection:v16];
      [v10 addObject:v17];

      ++v13;
      v18 = [(WFNANDiscoveryResultsTableViewController *)self sections];
      unint64_t v19 = [v18 count];
    }
    while (v19 > v13);
  }
  [v9 appendSectionsWithIdentifiers:v10];
  context = self->_context;
  v21 = [(WFNANDiscoveryResultsTableViewController *)self subscriber];
  uint64_t v22 = [(WFNANTableViewContext *)context getDiscoveryResultsCountForSubscriber:v21];

  if (v22 <= 0)
  {
    v37[0] = @"WFNANDiscoveryResultsNoDiscoveryResultsIdentifier";
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
    v25 = [(WFNANDiscoveryResultsTableViewController *)self _identifierForSection:0];
    [v9 appendItemsWithIdentifiers:v24 intoSectionWithIdentifier:v25];
  }
  else
  {
    v23 = self->_context;
    v24 = [(WFNANDiscoveryResultsTableViewController *)self subscriber];
    v25 = [(WFNANTableViewContext *)v23 getDiscoveryResultsForSubscriber:v24];
    v26 = [(WFNANDiscoveryResultsTableViewController *)self _identifierForSection:0];
    [v9 appendItemsWithIdentifiers:v25 intoSectionWithIdentifier:v26];
  }
  v27 = self->_context;
  v28 = [(WFNANDiscoveryResultsTableViewController *)self subscriber];
  uint64_t v29 = [(WFNANTableViewContext *)v27 getDataSessionsCountForSubscriber:v28];

  if (v29 < 1)
  {
    v36 = @"WFNANDiscoveryResultsNoDataSessionsIdentifier";
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
    v32 = [(WFNANDiscoveryResultsTableViewController *)self _identifierForSection:1];
    [v9 appendItemsWithIdentifiers:v31 intoSectionWithIdentifier:v32];
  }
  else
  {
    v30 = self->_context;
    v31 = [(WFNANDiscoveryResultsTableViewController *)self subscriber];
    v32 = [(WFNANTableViewContext *)v30 getDataSessionsForSubscriber:v31];
    v33 = [(WFNANDiscoveryResultsTableViewController *)self _identifierForSection:1];
    [v9 appendItemsWithIdentifiers:v32 intoSectionWithIdentifier:v33];
  }
  v34 = [(WFNANDiscoveryResultsTableViewController *)self dataSource];
  [v34 applySnapshot:v9 animatingDifferences:1];
}

id __64__WFNANDiscoveryResultsTableViewController__configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  objc_super v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 sections];
  v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  uint64_t v11 = [v10 unsignedIntegerValue];

  uint64_t v12 = [v8 dequeueReusableCellWithIdentifier:@"WFNANTableViewTextCellIdentifier"];

  if (!v12) {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:1 reuseIdentifier:@"WFNANTableViewTextCellIdentifier"];
  }
  [v12 setSelectionStyle:0];
  if (v11 == 1)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 1040) getDataSessionsCountForSubscriber:*(void *)(*(void *)(a1 + 32) + 1048)] >= 1)
    {
      unint64_t v13 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "getDataSessionAtIndex:forSubscriber:", objc_msgSend(v6, "row"), *(void *)(*(void *)(a1 + 32) + 1048));
      v28 = [v13 discoveryResult];
      v17 = [v28 serviceSpecificInfo];
      v18 = [v17 instanceName];
      uint64_t v19 = [v18 length];
      if (v19)
      {
        v20 = [v13 discoveryResult];
        objc_super v3 = [v20 serviceSpecificInfo];
        [v3 instanceName];
      }
      else
      {
        v20 = [v13 localDataAddress];
        [v20 description];
      v21 = };
      v26 = [v12 textLabel];
      [v26 setText:v21];

      if (v19)
      {

        v21 = v3;
      }

      v14 = [v13 localDataAddress];
      v15 = [v14 ipv6LinkLocalAddress];
      uint64_t v16 = stringForIpv6LinkLocalAddress(v15);
      v24 = [v12 detailTextLabel];
      [v24 setText:v16];
      goto LABEL_20;
    }
    uint64_t v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v13 = v22;
    v23 = @"kWFLocNANNoActiveDataSessions";
  }
  else
  {
    if (v11) {
      goto LABEL_22;
    }
    if ([*(id *)(*(void *)(a1 + 32) + 1040) getDiscoveryResultsCountForSubscriber:*(void *)(*(void *)(a1 + 32) + 1048)])
    {
      unint64_t v13 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "getDiscoveryResultAtIndex:forSubscriber:", objc_msgSend(v6, "row"), *(void *)(*(void *)(a1 + 32) + 1048));
      v14 = [v13 serviceSpecificInfo];
      v15 = [v14 instanceName];
      if ([v15 length])
      {
        uint64_t v16 = [v13 serviceSpecificInfo];
        [v16 instanceName];
      }
      else
      {
        uint64_t v16 = [v13 publisherAddress];
        [v16 description];
      v24 = };
      v25 = [v12 textLabel];
      [v25 setText:v24];

LABEL_20:
      goto LABEL_21;
    }
    uint64_t v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v13 = v22;
    v23 = @"kWFLocNANNoDiscoveryResults";
  }
  v14 = [v22 localizedStringForKey:v23 value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
  v15 = [v12 textLabel];
  [v15 setText:v14];
LABEL_21:

LABEL_22:
  return v12;
}

- (void)_handleDiscoveryResultsChangedNotification:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFNANDiscoveryResultsTableViewController *)self dataSource];
  id v6 = [v5 snapshot];

  objc_super v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"WFNANTableViewContextChangedSubscriberKey"];

  id v9 = [v4 userInfo];
  v10 = [v9 objectForKeyedSubscript:@"WFNANTableViewContextChangedDiscoveryResultKey"];

  uint64_t v11 = [v4 userInfo];

  uint64_t v12 = [v11 objectForKeyedSubscript:@"WFNANTableViewContextChangedOperationTypeKey"];

  unint64_t v13 = [(WFNANDiscoveryResultsTableViewController *)self subscriber];
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
        uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
        [v6 deleteItemsWithIdentifiers:v19];

        if ([(WFNANTableViewContext *)self->_context getDiscoveryResultsCountForSubscriber:v8])
        {
LABEL_15:
          v21 = [(WFNANDiscoveryResultsTableViewController *)self dataSource];
          [v21 applySnapshot:v6 animatingDifferences:1];

          goto LABEL_16;
        }
        uint64_t v22 = @"WFNANDiscoveryResultsNoDiscoveryResultsIdentifier";
        v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
        v20 = [(WFNANDiscoveryResultsTableViewController *)self _identifierForSection:0];
        [v6 appendItemsWithIdentifiers:v18 intoSectionWithIdentifier:v20];
      }
      else
      {
        if (v15) {
          goto LABEL_15;
        }
        v25[0] = v10;
        uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
        v17 = [(WFNANDiscoveryResultsTableViewController *)self _identifierForSection:0];
        [v6 appendItemsWithIdentifiers:v16 intoSectionWithIdentifier:v17];

        if ([(WFNANTableViewContext *)self->_context getDiscoveryResultsCountForSubscriber:v8] != 1)goto LABEL_15; {
        v24 = @"WFNANDiscoveryResultsNoDiscoveryResultsIdentifier";
        }
        v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
        [v6 deleteItemsWithIdentifiers:v18];
      }

      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)_handleDataSessionsChangedNotification:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFNANDiscoveryResultsTableViewController *)self dataSource];
  id v6 = [v5 snapshot];

  objc_super v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"WFNANTableViewContextChangedSubscriberKey"];

  id v9 = [v4 userInfo];
  v10 = [v9 objectForKeyedSubscript:@"WFNANTableViewContextChangedDataSessionKey"];

  uint64_t v11 = [v4 userInfo];

  uint64_t v12 = [v11 objectForKeyedSubscript:@"WFNANTableViewContextChangedOperationTypeKey"];

  unint64_t v13 = [(WFNANDiscoveryResultsTableViewController *)self subscriber];
  if (v8 != v13 || v12 == 0)
  {
  }
  else
  {

    if (v10)
    {
      if ([v12 unsignedIntegerValue] == 1)
      {
        v20[0] = v10;
        uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
        [v6 deleteItemsWithIdentifiers:v15];

        if (![(WFNANTableViewContext *)self->_context getDataSessionsCountForSubscriber:self->_subscriber])
        {
          uint64_t v19 = @"WFNANDiscoveryResultsNoDataSessionsIdentifier";
          uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
          v17 = [(WFNANDiscoveryResultsTableViewController *)self _identifierForSection:1];
          [v6 appendItemsWithIdentifiers:v16 intoSectionWithIdentifier:v17];
        }
      }
      v18 = [(WFNANDiscoveryResultsTableViewController *)self dataSource];
      [v18 applySnapshot:v6 animatingDifferences:1];
    }
  }
}

- (void)passphraseTextFieldDidChange:(id)a3
{
  id v4 = [a3 text];
  passphrase = self->_passphrase;
  self->_passphrase = v4;
  MEMORY[0x270F9A758](v4, passphrase);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(WFNANDiscoveryResultsTableViewController *)self sections];
  objc_super v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (!v8
    && [(WFNANTableViewContext *)self->_context getDiscoveryResultsCountForSubscriber:self->_subscriber] >= 1)
  {
    id v9 = (void *)MEMORY[0x263F1C3F8];
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"kWFLocNANPassphrasePopupTitle" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
    uint64_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v13 = [v12 localizedStringForKey:@"kWFLocNANPassphrasePopupMessage" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
    v14 = [v9 alertControllerWithTitle:v11 message:v13 preferredStyle:1];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    void v20[2] = __78__WFNANDiscoveryResultsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v20[3] = &unk_26478E468;
    v20[4] = self;
    [v14 addTextFieldWithConfigurationHandler:v20];
    uint64_t v15 = [MEMORY[0x263F1C3F0] actionWithTitle:@"Cancel" style:0 handler:&__block_literal_global_0];
    [v14 addAction:v15];
    uint64_t v16 = (void *)MEMORY[0x263F1C3F0];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __78__WFNANDiscoveryResultsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
    v18[3] = &unk_26478E4B0;
    v18[4] = self;
    id v19 = v5;
    v17 = [v16 actionWithTitle:@"Continue" style:0 handler:v18];
    [v14 addAction:v17];
    [(WFNANDiscoveryResultsTableViewController *)self presentViewController:v14 animated:1 completion:0];
  }
}

void __78__WFNANDiscoveryResultsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)MEMORY[0x263F086E0];
  id v6 = a2;
  id v4 = [v3 bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"kWFLocNANPassphrase" value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];
  [v6 setPlaceholder:v5];

  [v6 addTarget:*(void *)(a1 + 32) action:sel_passphraseTextFieldDidChange_ forControlEvents:0x20000];
}

void __78__WFNANDiscoveryResultsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "getDiscoveryResultAtIndex:forSubscriber:", objc_msgSend(*(id *)(a1 + 40), "row"), *(void *)(*(void *)(a1 + 32) + 1048));
  objc_super v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
  {
    id v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      id v6 = [v2 description];
      int v11 = 138412290;
      uint64_t v12 = v6;
      _os_log_impl(&dword_226071000, v5, v4, "Establishing a data session with discovery result %@", (uint8_t *)&v11, 0xCu);
    }
  }

  objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F86428]) initWithDiscoveryResult:v2 serviceType:0 serviceSpecificInfo:0 passphrase:*(void *)(*(void *)(a1 + 32) + 1056)];
  [v7 setDelegate:*(void *)(a1 + 32)];
  [v7 start];
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = (void *)v8[130];
  v10 = [v8 subscriber];
  [v9 addDataSession:v7 forSubscriber:v10];
}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = WFLogForCategory(0);
  os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v11)
  {
    uint64_t v13 = v11;
    if (os_log_type_enabled(v13, v12))
    {
      v14 = [v8 description];
      uint64_t v15 = [v9 description];
      uint64_t v16 = [v10 description];
      *(_DWORD *)buf = 138412802;
      v26 = v14;
      __int16 v27 = 2112;
      v28 = v15;
      __int16 v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_226071000, v13, v12, "NAN data session %@ confirmed for peer (address: %@, serviceSpecificInfo: %@)", buf, 0x20u);
    }
  }

  v17 = [(WFNANDiscoveryResultsTableViewController *)self dataSource];
  v18 = [v17 snapshot];

  id v24 = v8;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v20 = [(WFNANDiscoveryResultsTableViewController *)self _identifierForSection:1];
  [v18 appendItemsWithIdentifiers:v19 intoSectionWithIdentifier:v20];

  if ([(WFNANTableViewContext *)self->_context getDataSessionsCountForSubscriber:self->_subscriber] == 1)
  {
    v23 = @"WFNANDiscoveryResultsNoDataSessionsIdentifier";
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    [v18 deleteItemsWithIdentifiers:v21];
  }
  uint64_t v22 = [(WFNANDiscoveryResultsTableViewController *)self dataSource];
  [v22 applySnapshot:v18 animatingDifferences:1];
}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      id v10 = [v6 description];
      int v13 = 138412546;
      v14 = v10;
      __int16 v15 = 2048;
      int64_t v16 = a4;
      _os_log_impl(&dword_226071000, v9, v8, "NAN data session %@ failed to start with error %ld", (uint8_t *)&v13, 0x16u);
    }
  }

  [v6 stop];
  context = self->_context;
  os_log_type_t v12 = [(WFNANDiscoveryResultsTableViewController *)self subscriber];
  [(WFNANTableViewContext *)context removeDataSession:v6 forSubscriber:v12];
}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      id v10 = [v6 description];
      int v13 = 138412546;
      v14 = v10;
      __int16 v15 = 2048;
      int64_t v16 = a4;
      _os_log_impl(&dword_226071000, v9, v8, "NAN data session %@ terminated with reason %ld", (uint8_t *)&v13, 0x16u);
    }
  }

  [v6 stop];
  context = self->_context;
  os_log_type_t v12 = [(WFNANDiscoveryResultsTableViewController *)self subscriber];
  [(WFNANTableViewContext *)context removeDataSession:v6 forSubscriber:v12];
}

- (void)dataSessionRequestStarted:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4)
  {
    id v6 = v4;
    if (os_log_type_enabled(v6, v5))
    {
      objc_super v7 = [v3 description];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_226071000, v6, v5, "NAN data session %@ started", (uint8_t *)&v8, 0xCu);
    }
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

- (WiFiAwareSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(id)a3
{
}

- (WFNANDiscoveryResultsTableViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end