@interface WFDiagnosticsTableViewController
- (BOOL)networkQualitySpinning;
- (BOOL)useInsetGroupedTableView;
- (NSDate)networkQualityFooterDate;
- (NSOrderedSet)sections;
- (UITableViewCell)networkQualityCell;
- (WFAppearanceProxy)appearanceProxy;
- (WFDetailsProviderContext)detailsContext;
- (WFDiagnosticsProviderContext)context;
- (WFDiagnosticsTableViewController)initWithDiagnosticsContext:(id)a3 detailsProviderContext:(id)a4;
- (WFDiagnosticsTableViewController)initWithDiagnosticsContext:(id)a3 detailsProviderContext:(id)a4 appearanceProxy:(id)a5;
- (WFHyperlinkFooterView)linkFooterView;
- (WFHyperlinkFooterView)networkQualityFooterView;
- (WFNetworkSettingsCellFactory)cellFactory;
- (id)_defaultSections;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fillNetworkQualityCell:(id)a3;
- (void)_networkQualityOpenURL;
- (void)_openNetworkQualityDetails:(id)a3;
- (void)_refresh;
- (void)_reloadNetworkQualityCell;
- (void)_runNetworkQuality;
- (void)_updateNetworkQualityFooterText;
- (void)donePressed;
- (void)setAppearanceProxy:(id)a3;
- (void)setCellFactory:(id)a3;
- (void)setContext:(id)a3;
- (void)setDetailsContext:(id)a3;
- (void)setLinkFooterView:(id)a3;
- (void)setNetworkQualityCell:(id)a3;
- (void)setNetworkQualityFooterDate:(id)a3;
- (void)setNetworkQualityFooterView:(id)a3;
- (void)setNetworkQualitySpinning:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)setUseInsetGroupedTableView:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WFDiagnosticsTableViewController

- (WFDiagnosticsTableViewController)initWithDiagnosticsContext:(id)a3 detailsProviderContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[WFAppearanceProxy defaultAppearanceProxy];
  v9 = [(WFDiagnosticsTableViewController *)self initWithDiagnosticsContext:v7 detailsProviderContext:v6 appearanceProxy:v8];

  return v9;
}

- (WFDiagnosticsTableViewController)initWithDiagnosticsContext:(id)a3 detailsProviderContext:(id)a4 appearanceProxy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)WFDiagnosticsTableViewController;
  v12 = -[WFDiagnosticsTableViewController initWithStyle:](&v25, sel_initWithStyle_, [v11 tableViewStyle]);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_detailsContext, a4);
    objc_initWeak(&location, v13);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __102__WFDiagnosticsTableViewController_initWithDiagnosticsContext_detailsProviderContext_appearanceProxy___block_invoke;
    v22 = &unk_2647565E0;
    objc_copyWeak(&v23, &location);
    [(WFDiagnosticsProviderContext *)v13->_context setRefreshHandler:&v19];
    v14 = (void *)MEMORY[0x263EFF9D8];
    v15 = [(WFDiagnosticsTableViewController *)v13 _defaultSections];
    uint64_t v16 = [v14 orderedSetWithArray:v15];
    sections = v13->_sections;
    v13->_sections = (NSOrderedSet *)v16;

    objc_storeStrong((id *)&v13->_appearanceProxy, a5);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __102__WFDiagnosticsTableViewController_initWithDiagnosticsContext_detailsProviderContext_appearanceProxy___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refresh];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)WFDiagnosticsTableViewController;
  [(WFDiagnosticsTableViewController *)&v6 viewDidLoad];
  [(WFDiagnosticsTableViewController *)self setTitle:@"Diagnostics"];
  v3 = [WFNetworkSettingsCellFactory alloc];
  v4 = [(WFDiagnosticsTableViewController *)self tableView];
  v5 = [(WFNetworkSettingsCellFactory *)v3 initWithTableView:v4];
  [(WFDiagnosticsTableViewController *)self setCellFactory:v5];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFDiagnosticsTableViewController;
  [(WFDiagnosticsTableViewController *)&v5 viewDidDisappear:a3];
  v4 = [(WFDiagnosticsTableViewController *)self context];
  [v4 cancel];
}

- (void)_refresh
{
  id v2 = [(WFDiagnosticsTableViewController *)self tableView];
  [v2 reloadData];
}

- (id)_defaultSections
{
  return &unk_26D9121F0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(WFDiagnosticsTableViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5 = [(WFDiagnosticsTableViewController *)self sections];
  objc_super v6 = [v5 objectAtIndexedSubscript:a4];
  unint64_t v7 = [v6 unsignedIntegerValue];

  if (v7 > 5) {
    return 0;
  }
  else {
    return qword_225888D10[v7];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  objc_super v5 = [(WFDiagnosticsTableViewController *)self sections];
  objc_super v6 = [v5 objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 unsignedIntegerValue];

  switch(v7)
  {
    case 5:
      v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v9 = v8;
      id v10 = @"kWFLocDiagnosticsCoexistence";
      goto LABEL_7;
    case 4:
      v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v9 = v8;
      id v10 = @"kWFLocDiagnosticsLinkLayer";
      goto LABEL_7;
    case 3:
      v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v9 = v8;
      id v10 = @"kWFLocDiagnosticsConnectivity";
LABEL_7:
      id v11 = [v8 localizedStringForKey:v10 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

      goto LABEL_9;
  }
  id v11 = 0;
LABEL_9:
  return v11;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  objc_super v6 = [(WFDiagnosticsTableViewController *)self sections];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a4];
  uint64_t v8 = [v7 unsignedIntegerValue];

  switch(v8)
  {
    case 5:
      id v9 = [(WFDiagnosticsTableViewController *)self context];
      uint64_t v10 = [v9 coexFooter];
      goto LABEL_7;
    case 3:
      id v9 = [(WFDiagnosticsTableViewController *)self context];
      uint64_t v10 = [v9 probeFooter];
      goto LABEL_7;
    case 1:
      id v9 = [(WFDiagnosticsTableViewController *)self context];
      uint64_t v10 = [v9 cca];
LABEL_7:
      id v11 = (void *)v10;

      goto LABEL_9;
  }
  id v11 = 0;
LABEL_9:
  return v11;
}

- (WFHyperlinkFooterView)networkQualityFooterView
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (self->_networkQualityFooterView)
  {
    v3 = [(WFDiagnosticsTableViewController *)self context];
    int64_t v4 = [v3 networkQualityDate];
    if (!v4)
    {

      goto LABEL_16;
    }
    objc_super v5 = v4;
    if (self->_networkQualityFooterDate)
    {
      objc_super v6 = [(WFDiagnosticsTableViewController *)self context];
      uint64_t v7 = [v6 networkQualityDate];
      char v8 = [v7 isEqual:self->_networkQualityFooterDate];

      if (v8) {
        goto LABEL_16;
      }
    }
    else
    {
    }
  }
  id v9 = WFLogForCategory(0);
  os_log_type_t v10 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v9)
  {
    id v11 = v9;
    if (os_log_type_enabled(v11, v10))
    {
      v12 = [(WFDiagnosticsTableViewController *)self context];
      v13 = [v12 networkQualityDate];
      v14 = [(WFDiagnosticsTableViewController *)self context];
      [v14 networkQualityResponsiveness];
      networkQualityFooterView = self->_networkQualityFooterView;
      v17 = "YES";
      networkQualityFooterDate = self->_networkQualityFooterDate;
      *(void *)&v23[4] = "-[WFDiagnosticsTableViewController networkQualityFooterView]";
      *(_DWORD *)id v23 = 136316162;
      *(_WORD *)&v23[12] = 2112;
      if (!networkQualityFooterView) {
        v17 = "NO";
      }
      *(void *)&v23[14] = v13;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      __int16 v26 = 2080;
      v27 = v17;
      __int16 v28 = 2112;
      v29 = networkQualityFooterDate;
      _os_log_impl(&dword_2257EC000, v11, v10, "NetQuality: %s: Date is %@, responsiveness %.3f, existing view? %s existing date? %@", v23, 0x34u);
    }
  }

  uint64_t v19 = objc_alloc_init(WFHyperlinkFooterView);
  uint64_t v20 = self->_networkQualityFooterView;
  self->_networkQualityFooterView = v19;

LABEL_16:
  [(WFDiagnosticsTableViewController *)self _updateNetworkQualityFooterText];
  v21 = self->_networkQualityFooterView;
  return v21;
}

- (void)_networkQualityOpenURL
{
  id v6 = [MEMORY[0x263F82438] sharedApplication];
  id v2 = NSURL;
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int64_t v4 = [v3 localizedStringForKey:@"kWFLocNetworkQualityKBURL" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  objc_super v5 = [v2 URLWithString:v4];
  [v6 openURL:v5 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (void)_openNetworkQualityDetails:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F5B908]);
  objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  id v30 = (id)[v4 initWithTitle:v6 detailText:0 symbolName:0 contentLayout:2];

  uint64_t v7 = WFCurrentDeviceCapability();
  LODWORD(v5) = WFCapabilityIsChinaDevice(v7);
  char v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection1Title" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  os_log_type_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v11 = v10;
  if (v5) {
    v12 = @"kWFLocNetworkQualityLearnMoreSection1TextCH";
  }
  else {
    v12 = @"kWFLocNetworkQualityLearnMoreSection1Text";
  }
  v13 = [v10 localizedStringForKey:v12 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v30 addSectionWithHeader:v9 content:v13];

  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection2Title" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  uint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection2Text" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v30 addSectionWithHeader:v15 content:v17];

  v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v19 = [v18 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection3Title" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection3Text" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v30 addSectionWithHeader:v19 content:v21];

  v22 = [MEMORY[0x263F5B900] accessoryButton];
  id v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v24 = [v23 localizedStringForKey:@"kWFLocNetworkQualityKBURL" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v22 setTitle:v24 forState:0];

  [v22 addTarget:self action:sel__networkQualityOpenURL forControlEvents:64];
  uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  __int16 v26 = [v25 localizedStringForKey:@"kWFLocNetworkQualityLearnMoreSection4Text" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [v30 addSectionWithHeader:0 content:v26 accessoryButton:v22];

  v27 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_donePressed];
  __int16 v28 = [v30 navigationItem];
  [v28 setRightBarButtonItem:v27];

  v29 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v30];
  [(WFDiagnosticsTableViewController *)self presentViewController:v29 animated:1 completion:0];
}

- (void)donePressed
{
  id v2 = [(WFDiagnosticsTableViewController *)self presentedViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = [(WFDiagnosticsTableViewController *)self sections];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a4];
  uint64_t v8 = [v7 unsignedIntegerValue];

  if (v8 == 3)
  {
    id v9 = [(WFDiagnosticsTableViewController *)self networkQualityFooterView];
  }
  else if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [(WFDiagnosticsTableViewController *)self linkFooterView];
  }
  return v9;
}

- (WFHyperlinkFooterView)linkFooterView
{
  linkFooterView = self->_linkFooterView;
  if (!linkFooterView)
  {
    id v4 = objc_alloc_init(WFHyperlinkFooterView);
    objc_super v5 = self->_linkFooterView;
    self->_linkFooterView = v4;

    [(WFHyperlinkFooterView *)self->_linkFooterView setText:@"File a radar here."];
    -[WFHyperlinkFooterView setLinkRange:](self->_linkFooterView, "setLinkRange:", 0, [@"File a radar here." length]);
    [(WFHyperlinkFooterView *)self->_linkFooterView setTarget:self];
    linkFooterView = self->_linkFooterView;
  }
  return linkFooterView;
}

- (void)_reloadNetworkQualityCell
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = [(WFDiagnosticsTableViewController *)self sections];
  uint64_t v4 = [v3 indexOfObject:&unk_26D911C80];

  objc_super v5 = [(WFDiagnosticsTableViewController *)self tableView];
  id v6 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:v4];
  v8[0] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  [v5 reloadRowsAtIndexPaths:v7 withRowAnimation:5];
}

- (void)_updateNetworkQualityFooterText
{
  v3 = [(WFDiagnosticsTableViewController *)self context];
  uint64_t v4 = [v3 networkQualityDate];

  if (v4)
  {
    objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v22 = [v5 localizedStringForKey:@"kWFLocNetworkQualityFooterKnown" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"kWFLocNetworkQualityFooterLink" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"kWFLocNetworkQualityFooterLastChecked" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    os_log_type_t v10 = objc_opt_new();
    [v10 setDateStyle:1];
    [v10 setTimeStyle:1];
    [v10 setDoesRelativeDateFormatting:1];
    id v11 = [NSString stringWithFormat:@"%@ %@", v22, v7];
    v12 = NSString;
    v13 = [(WFDiagnosticsTableViewController *)self context];
    v14 = [v13 networkQualityDate];
    uint64_t v15 = [v10 stringFromDate:v14];
    uint64_t v16 = [v12 stringWithFormat:@"%@\n%@ %@", v11, v9, v15];

    v17 = [(WFDiagnosticsTableViewController *)self context];
    v18 = [v17 networkQualityDate];
    uint64_t v19 = (NSDate *)[v18 copy];
    networkQualityFooterDate = self->_networkQualityFooterDate;
    self->_networkQualityFooterDate = v19;

    [(WFHyperlinkFooterView *)self->_networkQualityFooterView setText:v16];
    -[WFHyperlinkFooterView setLinkRange:](self->_networkQualityFooterView, "setLinkRange:", [v11 length] - objc_msgSend(v7, "length"), objc_msgSend(v7, "length"));
    [(WFHyperlinkFooterView *)self->_networkQualityFooterView setTarget:self];
    [(WFHyperlinkFooterView *)self->_networkQualityFooterView setAction:sel__openNetworkQualityDetails_];
  }
  else
  {
    networkQualityFooterView = self->_networkQualityFooterView;
    [(WFHyperlinkFooterView *)networkQualityFooterView setText:0];
  }
}

- (void)_runNetworkQuality
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (![(WFDiagnosticsTableViewController *)self networkQualitySpinning])
  {
    v3 = WFLogForCategory(0);
    os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFDiagnosticsTableViewController _runNetworkQuality]";
      _os_log_impl(&dword_2257EC000, v3, v4, "NetQuality: %s: User scheduled a run", buf, 0xCu);
    }

    objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"kWFLocSettingNetworkQualityAlertTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"kWFLocSettingNetworkQualityAlertText" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    os_log_type_t v10 = [v9 localizedStringForKey:@"kWFLocSettingNetworkQualityAlertContinue" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"kWFLocSettingNetworkQualityAlertCancel" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    v13 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v8 preferredStyle:1];
    v14 = [MEMORY[0x263F82400] actionWithTitle:v12 style:1 handler:&__block_literal_global_2];
    [v13 addAction:v14];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_113;
    v16[3] = &unk_264756658;
    v16[4] = self;
    uint64_t v15 = [MEMORY[0x263F82400] actionWithTitle:v10 style:0 handler:v16];
    [v13 addAction:v15];
    [v13 setPreferredAction:v15];
    [(WFDiagnosticsTableViewController *)self presentViewController:v13 animated:1 completion:0];
  }
}

void __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = WFLogForCategory(0);
  os_log_type_t v1 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v0 && os_log_type_enabled(v0, v1))
  {
    int v2 = 136315138;
    v3 = "-[WFDiagnosticsTableViewController _runNetworkQuality]_block_invoke";
    _os_log_impl(&dword_2257EC000, v0, v1, "NetQuality: %s: User canceled test-run", (uint8_t *)&v2, 0xCu);
  }
}

void __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_113(uint64_t a1)
{
  [*(id *)(a1 + 32) setNetworkQualitySpinning:1];
  [*(id *)(a1 + 32) _reloadNetworkQualityCell];
  int v2 = [*(id *)(a1 + 32) detailsContext];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_2;
  v3[3] = &unk_264756630;
  v3[4] = *(void *)(a1 + 32);
  [v2 runNetworkQualityWithCompletionHandler:v3];
}

void __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_2(uint64_t a1, int a2, void *a3, double a4)
{
  char v4 = a2;
  if (a2)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = a3;
    id v9 = [v7 context];
    [v9 setNetworkQualityResponsiveness:a4];

    os_log_type_t v10 = [*(id *)(a1 + 32) context];
    [v10 setNetworkQualityDate:v8];
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_3;
  v11[3] = &unk_264756608;
  char v12 = v4;
  v11[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

uint64_t __54__WFDiagnosticsTableViewController__runNetworkQuality__block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40) && [*(id *)(a1 + 32) networkQualitySpinning])
  {
    int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v3 = [v2 localizedStringForKey:@"kWFLocSettingNetworkQualityFailureTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    char v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v5 = [v4 localizedStringForKey:@"kWFLocSettingNetworkQualityFailureText" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"kWFLocSettingNetworkQualityFailureOK" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v8 = [MEMORY[0x263F82418] alertControllerWithTitle:v3 message:v5 preferredStyle:1];
    id v9 = [MEMORY[0x263F82400] actionWithTitle:v7 style:0 handler:0];
    [v8 addAction:v9];
    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
  }
  [*(id *)(a1 + 32) setNetworkQualitySpinning:0];
  [*(id *)(a1 + 32) _updateNetworkQualityFooterText];
  os_log_type_t v10 = *(void **)(a1 + 32);
  return [v10 _reloadNetworkQualityCell];
}

- (void)_fillNetworkQualityCell:(id)a3
{
  id v4 = a3;
  if ([(WFDiagnosticsTableViewController *)self networkQualitySpinning])
  {
    id v26 = (id)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v4 setAccessoryView:v26];

    [v26 startAnimating];
    goto LABEL_15;
  }
  objc_super v5 = [(WFDiagnosticsTableViewController *)self context];
  [v5 networkQualityResponsiveness];
  double v7 = v6;

  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = v8;
  if (v7 != 0.0)
  {
    os_log_type_t v10 = [v8 localizedStringForKey:@"kWFLocSettingNetworkQualityRPM" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    id v11 = (void *)MEMORY[0x263F8C648];
    char v12 = [(WFDiagnosticsTableViewController *)self context];
    [v12 networkQualityResponsiveness];
    uint64_t v14 = [v11 ratingForResponsivenessScore:(uint64_t)v13];

    if (v14 == 2)
    {
      uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v16 = v15;
      v17 = @"kWFLocSettingNetworkQualityHigh";
    }
    else if (v14 == 1)
    {
      uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v16 = v15;
      v17 = @"kWFLocSettingNetworkQualityMedium";
    }
    else
    {
      if (v14)
      {
        v18 = 0;
        goto LABEL_13;
      }
      uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v16 = v15;
      v17 = @"kWFLocSettingNetworkQualityLow";
    }
    v18 = [v15 localizedStringForKey:v17 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

LABEL_13:
    uint64_t v19 = NSString;
    uint64_t v20 = [(WFDiagnosticsTableViewController *)self context];
    [v20 networkQualityResponsiveness];
    id v26 = [v19 stringWithFormat:@"%@ (%u %@)", v18, v21, v10];

    goto LABEL_14;
  }
  id v26 = [v8 localizedStringForKey:@"kWFLocSettingNetworkQualityNoData" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  os_log_type_t v10 = v9;
LABEL_14:

  id v22 = [MEMORY[0x263F824E8] buttonWithType:1];
  [v22 setTitle:v26 forState:0];
  [v4 setAccessoryView:v22];
  id v23 = [v4 textLabel];

  __int16 v24 = [v23 font];
  uint64_t v25 = [v22 titleLabel];
  [v25 setFont:v24];

  [v22 sizeToFit];
  [v22 addTarget:self action:sel__runNetworkQuality forControlEvents:64];

LABEL_15:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v5 = a4;
  double v6 = [(WFDiagnosticsTableViewController *)self sections];
  double v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  uint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
  [v9 setSelectionStyle:0];
  switch(v8)
  {
    case 0:
      os_log_type_t v10 = [(WFDiagnosticsTableViewController *)self cellFactory];
      id v11 = [v10 recommendationCellAtIndexPath:v5];

      char v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v13 = [v12 localizedStringForKey:@"kWFLocDiagnosticsDiagnosis" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      uint64_t v14 = [v11 titleLabel];
      [v14 setText:v13];

      uint64_t v15 = [(WFDiagnosticsTableViewController *)self context];
      uint64_t v16 = [v15 adviceString];
      v17 = [v11 descriptionLabel];
      [v17 setText:v16];

      id v9 = v11;
      goto LABEL_57;
    case 1:
      if (![v5 row])
      {
        v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v49 = [v48 localizedStringForKey:@"kWFLocDiagnosticsBSSID" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v50 = [v9 textLabel];
        [v50 setText:v49];

        double v21 = [(WFDiagnosticsTableViewController *)self context];
        uint64_t v22 = [v21 BSSID];
        goto LABEL_55;
      }
      if ([v5 row] == 1)
      {
        v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v19 = [v18 localizedStringForKey:@"kWFLocDiagnosticsChannel" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        uint64_t v20 = [v9 textLabel];
        [v20 setText:v19];

        double v21 = [(WFDiagnosticsTableViewController *)self context];
        uint64_t v22 = [v21 channelString];
        goto LABEL_55;
      }
      if ([v5 row] == 2)
      {
        v66 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v67 = [v66 localizedStringForKey:@"kWFLocDiagnosticsSignalStrength" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v68 = [v9 textLabel];
        [v68 setText:v67];

        v69 = [(WFDiagnosticsTableViewController *)self context];
        v70 = [v69 rssi];
        v71 = [v9 detailTextLabel];
        [v71 setText:v70];

        v72 = [(WFDiagnosticsTableViewController *)self context];
        v73 = [v72 rssi];
        LODWORD(v71) = [v73 containsString:@"Weak"];

        v74 = (void *)MEMORY[0x263F825C8];
        if (!v71) {
          goto LABEL_49;
        }
        goto LABEL_51;
      }
      goto LABEL_57;
    case 2:
      if (![v5 row])
      {
        v51 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v52 = [v51 localizedStringForKey:@"kWFLocDiagnosticsSecurity" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v53 = [v9 textLabel];
        [v53 setText:v52];

        double v21 = [(WFDiagnosticsTableViewController *)self context];
        uint64_t v22 = [v21 security];
        goto LABEL_55;
      }
      if ([v5 row] == 1)
      {
        id v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        __int16 v24 = [v23 localizedStringForKey:@"kWFLocDiagnosticsCaptive" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        uint64_t v25 = [v9 textLabel];
        [v25 setText:v24];

        id v26 = [(WFDiagnosticsTableViewController *)self context];
        LODWORD(v24) = [v26 captive];
        v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        __int16 v28 = v27;
        if (v24) {
          v29 = @"kWFLocDiagnosticsIsCaptive";
        }
        else {
          v29 = @"kWFLocDiagnosticsIsNotCaptive";
        }
        id v30 = [v27 localizedStringForKey:v29 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v31 = [v9 detailTextLabel];
        [v31 setText:v30];
      }
      else
      {
        if ([v5 row] == 2)
        {
          v75 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v76 = [v75 localizedStringForKey:@"kWFLocDiagnosticsDeployment" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
          v77 = [v9 textLabel];
          [v77 setText:v76];

          double v21 = [(WFDiagnosticsTableViewController *)self context];
          uint64_t v22 = [v21 deployment];
          goto LABEL_55;
        }
        if ([v5 row] == 3)
        {
          v99 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v100 = [v99 localizedStringForKey:@"kWFLocDiagnosticsMotion" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
          v101 = [v9 textLabel];
          [v101 setText:v100];

          double v21 = [(WFDiagnosticsTableViewController *)self context];
          uint64_t v22 = [v21 motion];
          goto LABEL_55;
        }
      }
      goto LABEL_57;
    case 3:
      if (![v5 row])
      {
        v54 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v55 = [v54 localizedStringForKey:@"kWFLocDiagnosticsGateway" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v56 = [v9 textLabel];
        [v56 setText:v55];

        v57 = [(WFDiagnosticsTableViewController *)self context];
        v58 = [v57 gateway];
        v59 = [v9 detailTextLabel];
        [v59 setText:v58];

        v38 = [(WFDiagnosticsTableViewController *)self context];
        v39 = [v38 gateway];
        if (![v39 containsString:@"Fast"])
        {
          v40 = [(WFDiagnosticsTableViewController *)self context];
          v41 = [v40 gateway];
LABEL_47:
          v95 = v41;
          int v96 = [v41 containsString:@"Expected"];

          if (!v96)
          {
            v74 = (void *)MEMORY[0x263F825C8];
LABEL_51:
            uint64_t v97 = [v74 systemRedColor];
            goto LABEL_52;
          }
LABEL_48:
          v74 = (void *)MEMORY[0x263F825C8];
LABEL_49:
          uint64_t v97 = [v74 systemGreenColor];
LABEL_52:
          double v21 = (void *)v97;
          v98 = [v9 detailTextLabel];
          [v98 setTextColor:v21];
          goto LABEL_56;
        }
LABEL_25:

        goto LABEL_48;
      }
      if ([v5 row] == 1)
      {
        v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v33 = [v32 localizedStringForKey:@"kWFLocDiagnosticsInternet" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v34 = [v9 textLabel];
        [v34 setText:v33];

        v35 = [(WFDiagnosticsTableViewController *)self context];
        v36 = [v35 internet];
        v37 = [v9 detailTextLabel];
        [v37 setText:v36];

        v38 = [(WFDiagnosticsTableViewController *)self context];
        v39 = [v38 internet];
        if (![v39 containsString:@"Fast"])
        {
          v40 = [(WFDiagnosticsTableViewController *)self context];
          v41 = [v40 internet];
          goto LABEL_47;
        }
        goto LABEL_25;
      }
      if ([v5 row] == 2)
      {
        v78 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v79 = [v78 localizedStringForKey:@"kWFLocSettingNetworkQualityText" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v80 = [v9 textLabel];
        [v80 setText:v79];

        v81 = WFLogForCategory(0);
        os_log_type_t v82 = OSLogForWFLogLevel(3uLL);
        if ((unint64_t)WFCurrentLogLevel() >= 3 && v81)
        {
          v83 = v81;
          if (os_log_type_enabled(v83, v82))
          {
            v84 = [(WFDiagnosticsTableViewController *)self context];
            [v84 networkQualityResponsiveness];
            uint64_t v86 = v85;
            BOOL v87 = [(WFDiagnosticsTableViewController *)self networkQualitySpinning];
            v88 = "NO";
            *(void *)&v109[4] = "-[WFDiagnosticsTableViewController tableView:cellForRowAtIndexPath:]";
            *(_DWORD *)v109 = 136315650;
            if (v87) {
              v88 = "YES";
            }
            *(_WORD *)&v109[12] = 2048;
            *(void *)&v109[14] = v86;
            __int16 v110 = 2080;
            v111 = v88;
            _os_log_impl(&dword_2257EC000, v83, v82, "NetQuality: %s: Responsiveness is %.1f, execution running? %s", v109, 0x20u);
          }
        }

        [(WFDiagnosticsTableViewController *)self _fillNetworkQualityCell:v9];
      }
LABEL_57:
      v103 = [(WFDiagnosticsTableViewController *)self appearanceProxy];
      v104 = [v103 cellTextLabelFont];

      if (v104)
      {
        v105 = [(WFDiagnosticsTableViewController *)self appearanceProxy];
        v106 = [v105 cellTextLabelFont];
        v107 = [v9 textLabel];
        [v107 setFont:v106];
      }
      return v9;
    case 4:
      if (![v5 row])
      {
        v60 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v61 = [v60 localizedStringForKey:@"kWFLocDiagnosticsBeaconPER" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v62 = [v9 textLabel];
        [v62 setText:v61];

        double v21 = [(WFDiagnosticsTableViewController *)self context];
        uint64_t v22 = [v21 beaconPER];
        goto LABEL_55;
      }
      if ([v5 row] == 1)
      {
        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v43 = [v42 localizedStringForKey:@"kWFLocDiagnosticsTransmitPER" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v44 = [v9 textLabel];
        [v44 setText:v43];

        double v21 = [(WFDiagnosticsTableViewController *)self context];
        uint64_t v22 = [v21 transmitPER];
        goto LABEL_55;
      }
      if ([v5 row] != 2) {
        goto LABEL_57;
      }
      v89 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v90 = [v89 localizedStringForKey:@"kWFLocDiagnosticsReceivedFrames" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v91 = [v9 textLabel];
      [v91 setText:v90];

      double v21 = [(WFDiagnosticsTableViewController *)self context];
      uint64_t v22 = [v21 recvFrames];
      goto LABEL_55;
    case 5:
      if ([v5 row])
      {
        if ([v5 row] == 1)
        {
          v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v46 = [v45 localizedStringForKey:@"kWFLocDiagnosticsBluetooth" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
          v47 = [v9 textLabel];
          [v47 setText:v46];

          double v21 = [(WFDiagnosticsTableViewController *)self context];
          uint64_t v22 = [v21 bluetooth];
        }
        else
        {
          if ([v5 row] != 2) {
            goto LABEL_57;
          }
          v92 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v93 = [v92 localizedStringForKey:@"kWFLocDiagnosticsScan" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
          v94 = [v9 textLabel];
          [v94 setText:v93];

          double v21 = [(WFDiagnosticsTableViewController *)self context];
          uint64_t v22 = [v21 scan];
        }
      }
      else
      {
        v63 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v64 = [v63 localizedStringForKey:@"kWFLocDiagnosticsAWDLMode" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v65 = [v9 textLabel];
        [v65 setText:v64];

        double v21 = [(WFDiagnosticsTableViewController *)self context];
        uint64_t v22 = [v21 awdl];
      }
LABEL_55:
      v98 = (void *)v22;
      v102 = [v9 detailTextLabel];
      [v102 setText:v98];

LABEL_56:
      goto LABEL_57;
    default:
      goto LABEL_57;
  }
}

- (WFDiagnosticsProviderContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (WFDetailsProviderContext)detailsContext
{
  return self->_detailsContext;
}

- (void)setDetailsContext:(id)a3
{
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (WFNetworkSettingsCellFactory)cellFactory
{
  return self->_cellFactory;
}

- (void)setCellFactory:(id)a3
{
}

- (void)setLinkFooterView:(id)a3
{
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
}

- (void)setNetworkQualityFooterView:(id)a3
{
}

- (NSDate)networkQualityFooterDate
{
  return self->_networkQualityFooterDate;
}

- (void)setNetworkQualityFooterDate:(id)a3
{
}

- (UITableViewCell)networkQualityCell
{
  return self->_networkQualityCell;
}

- (void)setNetworkQualityCell:(id)a3
{
}

- (BOOL)networkQualitySpinning
{
  return self->_networkQualitySpinning;
}

- (void)setNetworkQualitySpinning:(BOOL)a3
{
  self->_networkQualitySpinning = a3;
}

- (BOOL)useInsetGroupedTableView
{
  return self->_useInsetGroupedTableView;
}

- (void)setUseInsetGroupedTableView:(BOOL)a3
{
  self->_useInsetGroupedTableView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkQualityCell, 0);
  objc_storeStrong((id *)&self->_networkQualityFooterDate, 0);
  objc_storeStrong((id *)&self->_networkQualityFooterView, 0);
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_linkFooterView, 0);
  objc_storeStrong((id *)&self->_cellFactory, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_detailsContext, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end