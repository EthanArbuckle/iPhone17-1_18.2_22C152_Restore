@interface WFDiagnosticsViewController
- (BOOL)saving;
- (BOOL)showNANUI;
- (NSOrderedSet)sections;
- (NSString)comment;
- (WFDiagnosticsViewController)initWithNANUI:(BOOL)a3;
- (id)_defaultSections;
- (id)saveHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setComment:(id)a3;
- (void)setSaveHandler:(id)a3;
- (void)setSaving:(BOOL)a3;
- (void)setSections:(id)a3;
- (void)setShowNANUI:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFDiagnosticsViewController

- (WFDiagnosticsViewController)initWithNANUI:(BOOL)a3
{
  v4 = [(WFDiagnosticsViewController *)self initWithStyle:1];
  v4->_showNANUI = a3;
  v5 = (void *)MEMORY[0x263EFF9D8];
  v6 = [(WFDiagnosticsViewController *)v4 _defaultSections];
  uint64_t v7 = [v5 orderedSetWithArray:v6];
  sections = v4->_sections;
  v4->_sections = (NSOrderedSet *)v7;

  return v4;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)WFDiagnosticsViewController;
  [(WFDiagnosticsViewController *)&v15 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"kWFLocWiFiDiagnosticsTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [(WFDiagnosticsViewController *)self setTitle:v4];

  v5 = (void *)MEMORY[0x263F829D0];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v5 nibWithNibName:@"WFTextFieldCell" bundle:v6];

  v8 = [(WFDiagnosticsViewController *)self tableView];
  [v8 registerNib:v7 forCellReuseIdentifier:@"kWFTextFieldCellIdentifier"];

  v9 = [(WFDiagnosticsViewController *)self tableView];
  [v9 setCellLayoutMarginsFollowReadableWidth:0];

  double v10 = *MEMORY[0x263F839B8];
  v11 = [(WFDiagnosticsViewController *)self tableView];
  [v11 setRowHeight:v10];

  v12 = [(WFDiagnosticsViewController *)self tableView];
  [v12 setEstimatedRowHeight:44.0];

  v13 = [(WFDiagnosticsViewController *)self tableView];
  [v13 setEstimatedSectionHeaderHeight:0.0];

  v14 = [(WFDiagnosticsViewController *)self tableView];
  [v14 setEstimatedSectionFooterHeight:0.0];
}

- (void)setSaving:(BOOL)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  self->_saving = a3;
  v3 = [(WFDiagnosticsViewController *)self tableView];
  v4 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
  v6[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 reloadRowsAtIndexPaths:v5 withRowAnimation:100];
}

- (id)_defaultSections
{
  if ([(WFDiagnosticsViewController *)self showNANUI]) {
    return &unk_26D912220;
  }
  else {
    return &unk_26D912238;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(WFDiagnosticsViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFDiagnosticsViewController *)self sections];
  v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  uint64_t v10 = [v9 unsignedIntegerValue];

  switch(v10)
  {
    case 2:
      if (![(WFDiagnosticsViewController *)self showNANUI])
      {
LABEL_10:
        v11 = 0;
        goto LABEL_19;
      }
      uint64_t v19 = WFCurrentDeviceCapability();
      BOOL IsChinaDevice = WFCapabilityIsChinaDevice(v19);
      v11 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
      v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v22 = v21;
      if (IsChinaDevice) {
        v23 = @"kWFLocDiagnosticsNAN_CH";
      }
      else {
        v23 = @"kWFLocDiagnosticsNAN";
      }
      v24 = [v21 localizedStringForKey:v23 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v25 = [v11 textLabel];
      [v25 setText:v24];

      [v11 setAccessoryType:1];
      v26 = v11;
      uint64_t v27 = 1;
      break;
    case 1:
      v11 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
      BOOL v28 = [(WFDiagnosticsViewController *)self saving];
      v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v30 = v29;
      if (v28) {
        v31 = @"kWFLocDiagnosticsSavingInProgressTitle";
      }
      else {
        v31 = @"kWFLocDiagnosticsSaveLogTitle";
      }
      v32 = [v29 localizedStringForKey:v31 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v33 = [v11 textLabel];
      [v33 setText:v32];

      if ([(WFDiagnosticsViewController *)self saving]) {
        [MEMORY[0x263F825C8] systemGrayColor];
      }
      else {
      v34 = [MEMORY[0x263F825C8] systemBlueColor];
      }
      v35 = [v11 textLabel];
      [v35 setTextColor:v34];

      uint64_t v27 = [(WFDiagnosticsViewController *)self saving] ^ 1;
      v26 = v11;
      break;
    case 0:
      v11 = [v6 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v7];
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"kWFLocDiagnosticsCommentTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v14 = [v11 label];
      [v14 setText:v13];

      objc_super v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"kWFLocDiagnosticsCommentPlaceholder" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v17 = [v11 textField];
      [v17 setPlaceholder:v16];

      v18 = [v11 textField];
      [v18 setTextAlignment:0];

      objc_initWeak(&location, self);
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __63__WFDiagnosticsViewController_tableView_cellForRowAtIndexPath___block_invoke;
      v37[3] = &unk_264756118;
      objc_copyWeak(&v38, &location);
      [v11 setTextChangeHandler:v37];
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
      goto LABEL_19;
    default:
      goto LABEL_10;
  }
  [v26 setSelectionStyle:v27];
LABEL_19:

  return v11;
}

void __63__WFDiagnosticsViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setComment:v3];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFDiagnosticsViewController *)self sections];
  v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  uint64_t v10 = [v9 unsignedIntegerValue];

  if (v10 == 2)
  {
    v17 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v17 && os_log_type_enabled(v17, v18))
    {
      int v22 = 136315138;
      v23 = "-[WFDiagnosticsViewController tableView:didSelectRowAtIndexPath:]";
      _os_log_impl(&dword_2257EC000, v17, v18, "%s: tapped on NAN row", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v19 = objc_alloc_init(WFNANTableViewController);
    v20 = [(WFDiagnosticsViewController *)self navigationController];
    [v20 pushViewController:v19 animated:1];
    goto LABEL_21;
  }
  if (!v10 && ![(WFDiagnosticsViewController *)self saving])
  {
    v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v11)
    {
      v13 = v11;
      if (os_log_type_enabled(v13, v12))
      {
        v14 = [(WFDiagnosticsViewController *)self comment];
        uint64_t v15 = [v14 length];
        if (v15)
        {
          v16 = [(WFDiagnosticsViewController *)self comment];
        }
        else
        {
          v16 = @"<nil>";
        }
        int v22 = 138412290;
        v23 = (const char *)v16;
        _os_log_impl(&dword_2257EC000, v13, v12, "Saving logs with comment %@", (uint8_t *)&v22, 0xCu);
        if (v15) {
      }
        }
    }

    v21 = [(WFDiagnosticsViewController *)self saveHandler];

    if (v21)
    {
      uint64_t v19 = [(WFDiagnosticsViewController *)self saveHandler];
      v20 = [(WFDiagnosticsViewController *)self comment];
      ((void (*)(WFNANTableViewController *, void *))v19->super.super.super.super.__layeringSceneIdentity)(v19, v20);
LABEL_21:
    }
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  v5 = [(WFDiagnosticsViewController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v9 localizedStringForKey:@"kWFLocDiagnosticsCommentFooter" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }
  return v8;
}

- (id)saveHandler
{
  return self->_saveHandler;
}

- (void)setSaveHandler:(id)a3
{
}

- (BOOL)saving
{
  return self->_saving;
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (BOOL)showNANUI
{
  return self->_showNANUI;
}

- (void)setShowNANUI:(BOOL)a3
{
  self->_showNANUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong(&self->_saveHandler, 0);
}

@end