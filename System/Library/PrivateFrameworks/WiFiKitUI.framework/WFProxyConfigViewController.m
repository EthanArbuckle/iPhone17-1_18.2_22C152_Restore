@interface WFProxyConfigViewController
- (BOOL)_canShowWhileLocked;
- (UISwitch)authSwitch;
- (WFAppearanceProxy)appearanceProxy;
- (WFNetworkSettingsConfig)modifiedConfig;
- (WFNetworkSettingsConfig)originalConfig;
- (WFProxyConfigViewController)initWithConfig:(id)a3;
- (WFProxyConfigViewController)initWithConfig:(id)a3 appearanceProxy:(id)a4;
- (WFTextFieldCell)passwordCell;
- (WFTextFieldCell)portCell;
- (WFTextFieldCell)serverCell;
- (WFTextFieldCell)urlCell;
- (WFTextFieldCell)userCell;
- (double)_configCellLeadingInset;
- (id)saveHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_changeProxyAuthentication:(id)a3;
- (void)_setFirstResponderAfterCell:(id)a3;
- (void)_updateSaveEnabled;
- (void)save:(id)a3;
- (void)setAppearanceProxy:(id)a3;
- (void)setAuthSwitch:(id)a3;
- (void)setModifiedConfig:(id)a3;
- (void)setOriginalConfig:(id)a3;
- (void)setPasswordCell:(id)a3;
- (void)setPortCell:(id)a3;
- (void)setSaveHandler:(id)a3;
- (void)setServerCell:(id)a3;
- (void)setUrlCell:(id)a3;
- (void)setUserCell:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFProxyConfigViewController

- (WFProxyConfigViewController)initWithConfig:(id)a3
{
  id v4 = a3;
  v5 = +[WFAppearanceProxy defaultAppearanceProxy];
  v6 = [(WFProxyConfigViewController *)self initWithConfig:v4 appearanceProxy:v5];

  return v6;
}

- (WFProxyConfigViewController)initWithConfig:(id)a3 appearanceProxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFProxyConfigViewController;
  v9 = -[WFProxyConfigViewController initWithStyle:](&v16, sel_initWithStyle_, [v8 tableViewStyle]);
  v10 = v9;
  if (v7)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v9->_originalConfig, a3);
      uint64_t v11 = [v7 copy];
      modifiedConfig = v10->_modifiedConfig;
      v10->_modifiedConfig = (WFNetworkSettingsConfig *)v11;

      v13 = (WFAppearanceProxy *)v8;
      appearanceProxy = v10->_appearanceProxy;
      v10->_appearanceProxy = v13;
    }
    else
    {
      appearanceProxy = 0;
    }
  }
  else
  {
    appearanceProxy = v9;
    v10 = 0;
  }

  return v10;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)WFProxyConfigViewController;
  [(WFProxyConfigViewController *)&v19 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"kWFLocSettingsProxyConfigureTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [(WFProxyConfigViewController *)self setTitle:v4];

  v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:3 target:self action:sel_save_];
  v6 = [(WFProxyConfigViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  id v7 = [(WFProxyConfigViewController *)self navigationItem];
  id v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:0];

  v9 = (void *)MEMORY[0x263F829D0];
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v9 nibWithNibName:@"WFTextFieldCell" bundle:v10];

  v12 = [(WFProxyConfigViewController *)self tableView];
  [v12 registerNib:v11 forCellReuseIdentifier:@"kWFTextFieldCellIdentifier"];

  double v13 = *MEMORY[0x263F839B8];
  v14 = [(WFProxyConfigViewController *)self tableView];
  [v14 setRowHeight:v13];

  v15 = [(WFProxyConfigViewController *)self tableView];
  [v15 setEstimatedRowHeight:44.0];

  objc_super v16 = [(WFProxyConfigViewController *)self tableView];
  [v16 setEstimatedSectionHeaderHeight:0.0];

  v17 = [(WFProxyConfigViewController *)self tableView];
  [v17 setEstimatedSectionFooterHeight:0.0];

  if ([MEMORY[0x263F82670] currentIsIPad])
  {
    v18 = [(WFProxyConfigViewController *)self tableView];
    objc_msgSend(v18, "_setSectionContentInset:", 0.0, 20.0, 0.0, 20.0);
  }
}

- (void)_updateSaveEnabled
{
  v3 = [(WFProxyConfigViewController *)self modifiedConfig];
  id v4 = [(WFProxyConfigViewController *)self originalConfig];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [(WFProxyConfigViewController *)self modifiedConfig];
    uint64_t v6 = [v7 validProxyConfiguration];
  }
  id v9 = [(WFProxyConfigViewController *)self navigationItem];
  id v8 = [v9 rightBarButtonItem];
  [v8 setEnabled:v6];
}

- (void)save:(id)a3
{
  id v4 = [(WFProxyConfigViewController *)self saveHandler];

  if (v4)
  {
    char v5 = [(WFProxyConfigViewController *)self saveHandler];
    uint64_t v6 = [(WFProxyConfigViewController *)self modifiedConfig];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
  id v8 = [(WFProxyConfigViewController *)self navigationController];
  id v7 = (id)[v8 popViewControllerAnimated:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = [(WFProxyConfigViewController *)self modifiedConfig];
  if ([v4 httpProxyConfig] == 1)
  {

    return 2;
  }
  char v5 = [(WFProxyConfigViewController *)self modifiedConfig];
  uint64_t v6 = [v5 httpProxyConfig];

  if (v6 == 2) {
    return 2;
  }
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 1)
    {
      id v7 = [(WFProxyConfigViewController *)self modifiedConfig];
      uint64_t v8 = [v7 httpProxyConfig];

      id v9 = [(WFProxyConfigViewController *)self modifiedConfig];
      v10 = v9;
      if (v8 == 1)
      {
        int v11 = [v9 httpProxyAuthenticationRequired];

        if (v11) {
          int64_t v12 = 5;
        }
        else {
          int64_t v12 = 3;
        }
      }
      else
      {
        int64_t v12 = [v9 httpProxyConfig] == 2;
      }
    }
    else
    {
      int64_t v12 = 0;
    }
  }
  else
  {
    int64_t v12 = 3;
  }

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (![v5 section])
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
    if ([v5 row])
    {
      if ([v5 row] == 1)
      {
        v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v11 = [v10 localizedStringForKey:@"kWFLocSettingsProxyConfigManualTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        int64_t v12 = [v9 textLabel];
        [v12 setText:v11];

        double v13 = [(WFProxyConfigViewController *)self modifiedConfig];
        BOOL v14 = [v13 httpProxyConfig] == 1;
      }
      else
      {
        if ([v5 row] != 2) {
          goto LABEL_30;
        }
        v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v21 = [v20 localizedStringForKey:@"kWFLocSettingsProxyConfigAutomaticTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v22 = [v9 textLabel];
        [v22 setText:v21];

        double v13 = [(WFProxyConfigViewController *)self modifiedConfig];
        BOOL v14 = [v13 httpProxyConfig] == 2;
      }
    }
    else
    {
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = [v17 localizedStringForKey:@"kWFLocSettingsProxyConfigOffTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      objc_super v19 = [v9 textLabel];
      [v19 setText:v18];

      double v13 = [(WFProxyConfigViewController *)self modifiedConfig];
      BOOL v14 = [v13 httpProxyConfig] == 0;
    }
    if (v14) {
      uint64_t v23 = 3;
    }
    else {
      uint64_t v23 = 0;
    }
    [v9 setAccessoryType:v23];
    goto LABEL_20;
  }
  if ([v5 section] != 1) {
    goto LABEL_29;
  }
  id v6 = [(WFProxyConfigViewController *)self modifiedConfig];
  uint64_t v7 = [v6 httpProxyConfig];

  if (v7 != 2)
  {
    v15 = [(WFProxyConfigViewController *)self modifiedConfig];
    uint64_t v16 = [v15 httpProxyConfig];

    if (v16 != 1) {
      goto LABEL_29;
    }
    if (![v5 row])
    {
      uint64_t v8 = [(WFProxyConfigViewController *)self serverCell];
      goto LABEL_22;
    }
    if ([v5 row] == 1)
    {
      uint64_t v8 = [(WFProxyConfigViewController *)self portCell];
      goto LABEL_22;
    }
    if ([v5 row] != 2)
    {
      if ([v5 row] == 3)
      {
        uint64_t v8 = [(WFProxyConfigViewController *)self userCell];
        goto LABEL_22;
      }
      if ([v5 row] == 4)
      {
        uint64_t v8 = [(WFProxyConfigViewController *)self passwordCell];
        goto LABEL_22;
      }
      goto LABEL_29;
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
    v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"kWFLocSettingsProxyAuthenticationCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    v26 = [v9 textLabel];
    [v26 setText:v25];

    id v27 = objc_alloc(MEMORY[0x263F82C40]);
    double v13 = objc_msgSend(v27, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v28 = [(WFProxyConfigViewController *)self modifiedConfig];
    objc_msgSend(v13, "setOn:", objc_msgSend(v28, "httpProxyAuthenticationRequired"));

    [v13 addTarget:self action:sel__changeProxyAuthentication_ forControlEvents:4096];
    [v9 setAccessoryView:v13];
    [v9 setSelectionStyle:0];
LABEL_20:

    goto LABEL_30;
  }
  if (![v5 row])
  {
    uint64_t v8 = [(WFProxyConfigViewController *)self urlCell];
LABEL_22:
    id v9 = (void *)v8;
    goto LABEL_30;
  }
LABEL_29:
  id v9 = 0;
LABEL_30:
  v29 = [(WFProxyConfigViewController *)self appearanceProxy];
  v30 = [v29 cellTextLabelFont];

  if (v30)
  {
    v31 = [(WFProxyConfigViewController *)self appearanceProxy];
    v32 = [v31 cellTextLabelFont];
    v33 = [v9 textLabel];
    [v33 setFont:v32];
  }
  return v9;
}

- (void)_setFirstResponderAfterCell:(id)a3
{
  id v11 = a3;
  id v4 = [(WFProxyConfigViewController *)self serverCell];

  id v5 = [(WFProxyConfigViewController *)self portCell];
  id v6 = v11;
  if (v4 != v11)
  {

    if (v5 == v11)
    {
      uint64_t v8 = [(WFProxyConfigViewController *)self modifiedConfig];
      int v9 = [v8 httpProxyAuthenticationRequired];

      if (v9)
      {
        uint64_t v10 = [(WFProxyConfigViewController *)self userCell];
LABEL_9:
        id v5 = (id)v10;
        id v6 = v11;
        goto LABEL_10;
      }
    }
    else
    {
      id v7 = [(WFProxyConfigViewController *)self userCell];

      id v5 = [(WFProxyConfigViewController *)self passwordCell];
      id v6 = v11;
      if (v7 == v11) {
        goto LABEL_10;
      }

      id v6 = v11;
      if (v5 != v11) {
        goto LABEL_12;
      }
    }
    uint64_t v10 = [(WFProxyConfigViewController *)self serverCell];
    goto LABEL_9;
  }
LABEL_10:
  if (v5)
  {
    [v5 becomeFirstResponder];

    id v6 = v11;
  }
LABEL_12:
}

- (WFTextFieldCell)serverCell
{
  serverCell = self->_serverCell;
  if (!serverCell)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
    id v6 = [v5 objectAtIndex:0];

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"kWFLocSettingsProxyServerCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    int v9 = [(WFTextFieldCell *)v6 label];
    [v9 setText:v8];

    [(WFProxyConfigViewController *)self _configCellLeadingInset];
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    id v11 = [(WFTextFieldCell *)v6 textField];
    [v11 setTextAlignment:2];

    int64_t v12 = [(WFTextFieldCell *)v6 textField];
    [v12 setKeyboardType:3];

    double v13 = [(WFProxyConfigViewController *)self modifiedConfig];
    BOOL v14 = [v13 httpProxyServerAddress];
    v15 = [(WFTextFieldCell *)v6 textField];
    [v15 setText:v14];

    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __41__WFProxyConfigViewController_serverCell__block_invoke;
    v25[3] = &unk_264756118;
    objc_copyWeak(&v26, &location);
    [(WFTextFieldCell *)v6 setTextChangeHandler:v25];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __41__WFProxyConfigViewController_serverCell__block_invoke_2;
    v23[3] = &unk_264756948;
    objc_copyWeak(&v24, &location);
    [(WFTextFieldCell *)v6 setReturnKeyHandler:v23];
    uint64_t v16 = [(WFProxyConfigViewController *)self appearanceProxy];
    v17 = [v16 cellTextLabelFont];

    if (v17)
    {
      v18 = [(WFProxyConfigViewController *)self appearanceProxy];
      objc_super v19 = [v18 cellTextLabelFont];
      v20 = [(WFTextFieldCell *)v6 textLabel];
      [v20 setFont:v19];
    }
    v21 = self->_serverCell;
    self->_serverCell = v6;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    serverCell = self->_serverCell;
  }
  return serverCell;
}

void __41__WFProxyConfigViewController_serverCell__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setHttpProxyServerAddress:v4];

  [WeakRetained _updateSaveEnabled];
}

void __41__WFProxyConfigViewController_serverCell__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

- (WFTextFieldCell)portCell
{
  portCell = self->_portCell;
  if (!portCell)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
    id v6 = [v5 objectAtIndex:0];

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"kWFLocSettingsProxyPortCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    int v9 = [(WFTextFieldCell *)v6 label];
    [v9 setText:v8];

    [(WFProxyConfigViewController *)self _configCellLeadingInset];
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    id v11 = [(WFTextFieldCell *)v6 textField];
    [v11 setTextAlignment:2];

    int64_t v12 = [(WFProxyConfigViewController *)self modifiedConfig];
    double v13 = [v12 httpProxyServerPort];
    BOOL v14 = [(WFTextFieldCell *)v6 textField];
    [v14 setText:v13];

    v15 = [(WFTextFieldCell *)v6 textField];
    [v15 setKeyboardType:4];

    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __39__WFProxyConfigViewController_portCell__block_invoke;
    v25[3] = &unk_264756118;
    objc_copyWeak(&v26, &location);
    [(WFTextFieldCell *)v6 setTextChangeHandler:v25];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __39__WFProxyConfigViewController_portCell__block_invoke_2;
    v23[3] = &unk_264756948;
    objc_copyWeak(&v24, &location);
    [(WFTextFieldCell *)v6 setReturnKeyHandler:v23];
    uint64_t v16 = [(WFProxyConfigViewController *)self appearanceProxy];
    v17 = [v16 cellTextLabelFont];

    if (v17)
    {
      v18 = [(WFProxyConfigViewController *)self appearanceProxy];
      objc_super v19 = [v18 cellTextLabelFont];
      v20 = [(WFTextFieldCell *)v6 textLabel];
      [v20 setFont:v19];
    }
    v21 = self->_portCell;
    self->_portCell = v6;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    portCell = self->_portCell;
  }
  return portCell;
}

void __39__WFProxyConfigViewController_portCell__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setHttpProxyServerPort:v4];

  [WeakRetained _updateSaveEnabled];
}

void __39__WFProxyConfigViewController_portCell__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

- (WFTextFieldCell)userCell
{
  userCell = self->_userCell;
  if (!userCell)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
    id v6 = [v5 objectAtIndex:0];

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"kWFLocSettingsProxyUsernameCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    int v9 = [(WFTextFieldCell *)v6 label];
    [v9 setText:v8];

    [(WFProxyConfigViewController *)self _configCellLeadingInset];
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    id v11 = [(WFTextFieldCell *)v6 textField];
    [v11 setTextAlignment:2];

    int64_t v12 = [(WFTextFieldCell *)v6 textField];
    [v12 setTextContentType:*MEMORY[0x263F83AA8]];

    double v13 = [(WFProxyConfigViewController *)self modifiedConfig];
    BOOL v14 = [v13 httpProxyUsername];
    v15 = [(WFTextFieldCell *)v6 textField];
    [v15 setText:v14];

    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __39__WFProxyConfigViewController_userCell__block_invoke;
    v25[3] = &unk_264756118;
    objc_copyWeak(&v26, &location);
    [(WFTextFieldCell *)v6 setTextChangeHandler:v25];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __39__WFProxyConfigViewController_userCell__block_invoke_2;
    v23[3] = &unk_264756948;
    objc_copyWeak(&v24, &location);
    [(WFTextFieldCell *)v6 setReturnKeyHandler:v23];
    uint64_t v16 = [(WFProxyConfigViewController *)self appearanceProxy];
    v17 = [v16 cellTextLabelFont];

    if (v17)
    {
      v18 = [(WFProxyConfigViewController *)self appearanceProxy];
      objc_super v19 = [v18 cellTextLabelFont];
      v20 = [(WFTextFieldCell *)v6 textLabel];
      [v20 setFont:v19];
    }
    v21 = self->_userCell;
    self->_userCell = v6;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    userCell = self->_userCell;
  }
  return userCell;
}

void __39__WFProxyConfigViewController_userCell__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setHttpProxyUsername:v4];

  [WeakRetained _updateSaveEnabled];
}

void __39__WFProxyConfigViewController_userCell__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

- (WFTextFieldCell)passwordCell
{
  passwordCell = self->_passwordCell;
  if (!passwordCell)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
    id v6 = [v5 objectAtIndex:0];

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"kWFLocSettingsProxyPasswordCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    int v9 = [(WFTextFieldCell *)v6 label];
    [v9 setText:v8];

    [(WFProxyConfigViewController *)self _configCellLeadingInset];
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    id v11 = [(WFTextFieldCell *)v6 textField];
    [v11 setTextAlignment:2];

    int64_t v12 = [(WFTextFieldCell *)v6 textField];
    [v12 setTextContentType:*MEMORY[0x263F83A70]];

    double v13 = [(WFProxyConfigViewController *)self modifiedConfig];
    BOOL v14 = [v13 httpProxyPassword];
    v15 = [(WFTextFieldCell *)v6 textField];
    [v15 setText:v14];

    uint64_t v16 = [(WFTextFieldCell *)v6 textField];
    [v16 setSecureTextEntry:1];

    objc_initWeak(&location, self);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __43__WFProxyConfigViewController_passwordCell__block_invoke;
    v26[3] = &unk_264756118;
    objc_copyWeak(&v27, &location);
    [(WFTextFieldCell *)v6 setTextChangeHandler:v26];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __43__WFProxyConfigViewController_passwordCell__block_invoke_2;
    v24[3] = &unk_264756948;
    objc_copyWeak(&v25, &location);
    [(WFTextFieldCell *)v6 setReturnKeyHandler:v24];
    v17 = [(WFProxyConfigViewController *)self appearanceProxy];
    v18 = [v17 cellTextLabelFont];

    if (v18)
    {
      objc_super v19 = [(WFProxyConfigViewController *)self appearanceProxy];
      v20 = [v19 cellTextLabelFont];
      v21 = [(WFTextFieldCell *)v6 textLabel];
      [v21 setFont:v20];
    }
    v22 = self->_passwordCell;
    self->_passwordCell = v6;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    passwordCell = self->_passwordCell;
  }
  return passwordCell;
}

void __43__WFProxyConfigViewController_passwordCell__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setHttpProxyPassword:v4];

  [WeakRetained _updateSaveEnabled];
}

void __43__WFProxyConfigViewController_passwordCell__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

- (WFTextFieldCell)urlCell
{
  urlCell = self->_urlCell;
  if (!urlCell)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
    id v6 = [v5 objectAtIndex:0];

    [(WFProxyConfigViewController *)self _configCellLeadingInset];
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v7, 0.0, 0.0);
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v9 = [v8 localizedStringForKey:@"kWFLocSettingsProxyURLCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    double v10 = [(WFTextFieldCell *)v6 label];
    [v10 setText:v9];

    id v11 = [(WFTextFieldCell *)v6 textField];
    [v11 setKeyboardType:3];

    int64_t v12 = [(WFTextFieldCell *)v6 textField];
    [v12 setTextAlignment:2];

    double v13 = [(WFProxyConfigViewController *)self modifiedConfig];
    BOOL v14 = [v13 httpProxyConfigPAC];
    v15 = [(WFTextFieldCell *)v6 textField];
    [v15 setText:v14];

    objc_initWeak(&location, self);
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    id v25 = __38__WFProxyConfigViewController_urlCell__block_invoke;
    id v26 = &unk_264756118;
    objc_copyWeak(&v27, &location);
    [(WFTextFieldCell *)v6 setTextChangeHandler:&v23];
    uint64_t v16 = [(WFProxyConfigViewController *)self appearanceProxy];
    v17 = [v16 cellTextLabelFont];

    if (v17)
    {
      v18 = [(WFProxyConfigViewController *)self appearanceProxy];
      objc_super v19 = [v18 cellTextLabelFont];
      v20 = [(WFTextFieldCell *)v6 textLabel];
      [v20 setFont:v19];
    }
    v21 = self->_urlCell;
    self->_urlCell = v6;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    urlCell = self->_urlCell;
  }
  return urlCell;
}

void __38__WFProxyConfigViewController_urlCell__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained modifiedConfig];
  [v4 setHttpProxyConfigPAC:v3];

  [WeakRetained _updateSaveEnabled];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v62[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  if (![v7 section])
  {
    uint64_t v9 = [v7 row];

    double v10 = [(WFProxyConfigViewController *)self modifiedConfig];
    uint64_t v11 = [v10 httpProxyConfig];

    if (v11 == v9) {
      goto LABEL_31;
    }
    int64_t v12 = [(WFProxyConfigViewController *)self modifiedConfig];
    uint64_t v13 = [v12 httpProxyConfig];

    BOOL v14 = [(WFProxyConfigViewController *)self modifiedConfig];
    int v15 = [v14 httpProxyAuthenticationRequired];

    uint64_t v16 = [(WFProxyConfigViewController *)self modifiedConfig];
    [v16 setHttpProxyConfig:v9];

    if (v15 && v9 != 1)
    {
      v17 = [(WFProxyConfigViewController *)self modifiedConfig];
      [v17 setHttpProxyAuthenticationRequired:0];
    }
    if (v9 == 2)
    {
      id v27 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
      v28 = [v6 cellForRowAtIndexPath:v27];
      [v28 setAccessoryType:0];

      v29 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:0];
      v30 = [v6 cellForRowAtIndexPath:v29];
      [v30 setAccessoryType:0];

      v31 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:0];
      v32 = [v6 cellForRowAtIndexPath:v31];
      [v32 setAccessoryType:3];

      if (v13)
      {
        if (v13 == 1)
        {
          [v6 beginUpdates];
          v33 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
          v57 = v33;
          v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v57 count:1];
          [v6 reloadRowsAtIndexPaths:v34 withRowAnimation:0];

          v35 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:1];
          v56[0] = v35;
          v36 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:1];
          v56[1] = v36;
          v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
          [v6 deleteRowsAtIndexPaths:v37 withRowAnimation:0];

          if (v15)
          {
            v38 = [MEMORY[0x263F088C8] indexPathForRow:3 inSection:1];
            v55[0] = v38;
            v39 = [MEMORY[0x263F088C8] indexPathForRow:4 inSection:1];
            v55[1] = v39;
            v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
            [v6 deleteRowsAtIndexPaths:v40 withRowAnimation:0];
          }
          [v6 endUpdates];
          v41 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
          [v6 reloadSections:v41 withRowAnimation:5];
        }
        goto LABEL_30;
      }
      [v6 beginUpdates];
      v52 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
      [v6 insertSections:v52 withRowAnimation:0];

      id v25 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
      v54 = v25;
      id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
      [v6 insertRowsAtIndexPaths:v26 withRowAnimation:0];
      goto LABEL_28;
    }
    if (v9 == 1)
    {
      v42 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
      v43 = [v6 cellForRowAtIndexPath:v42];
      [v43 setAccessoryType:0];

      v44 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:0];
      v45 = [v6 cellForRowAtIndexPath:v44];
      [v45 setAccessoryType:3];

      v46 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:0];
      v47 = [v6 cellForRowAtIndexPath:v46];
      [v47 setAccessoryType:0];

      [v6 beginUpdates];
      if (v13)
      {
        if (v13 != 2) {
          goto LABEL_29;
        }
        v48 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
        v60 = v48;
        v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
        [v6 reloadRowsAtIndexPaths:v49 withRowAnimation:0];

        id v25 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:1];
        v59[0] = v25;
        id v26 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:1];
        v59[1] = v26;
        v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:2];
        [v6 insertRowsAtIndexPaths:v50 withRowAnimation:0];
LABEL_27:

        goto LABEL_28;
      }
      v53 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
      [v6 insertSections:v53 withRowAnimation:0];

      id v25 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
      v58[0] = v25;
      id v26 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:1];
      v58[1] = v26;
      v50 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:1];
      v58[2] = v50;
      v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:3];
      [v6 insertRowsAtIndexPaths:v51 withRowAnimation:0];
    }
    else
    {
      if (v9)
      {
LABEL_30:
        [(WFProxyConfigViewController *)self _updateSaveEnabled];
        goto LABEL_31;
      }
      v18 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
      objc_super v19 = [v6 cellForRowAtIndexPath:v18];
      [v19 setAccessoryType:3];

      v20 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:0];
      v21 = [v6 cellForRowAtIndexPath:v20];
      [v21 setAccessoryType:0];

      v22 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:0];
      uint64_t v23 = [v6 cellForRowAtIndexPath:v22];
      [v23 setAccessoryType:0];

      [v6 beginUpdates];
      uint64_t v24 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
      [v6 deleteSections:v24 withRowAnimation:0];

      if (v13 != 1)
      {
        if (v13 == 2)
        {
          id v25 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
          v62[0] = v25;
          id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:1];
          [v6 deleteRowsAtIndexPaths:v26 withRowAnimation:0];
LABEL_28:
        }
LABEL_29:
        [v6 endUpdates];
        goto LABEL_30;
      }
      id v25 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
      v61[0] = v25;
      id v26 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:1];
      v61[1] = v26;
      v50 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:1];
      v61[2] = v50;
      v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:3];
      [v6 deleteRowsAtIndexPaths:v51 withRowAnimation:0];
    }

    goto LABEL_27;
  }
  uint64_t v8 = [v6 cellForRowAtIndexPath:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 becomeFirstResponder];
  }

LABEL_31:
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 == 1
    && ([(WFProxyConfigViewController *)self modifiedConfig],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 httpProxyAuthenticationRequired],
        v4,
        v5))
  {
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"kWFLocProxyAuthenticationWarningFooter" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)_changeProxyAuthentication:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  int v4 = [a3 isOn];
  int v5 = [(WFProxyConfigViewController *)self modifiedConfig];
  id v6 = v5;
  if (v4)
  {
    [v5 setHttpProxyAuthenticationRequired:1];

    id v7 = [(WFProxyConfigViewController *)self tableView];
    uint64_t v8 = [MEMORY[0x263F088C8] indexPathForRow:3 inSection:1];
    v14[0] = v8;
    uint64_t v9 = [MEMORY[0x263F088C8] indexPathForRow:4 inSection:1];
    v14[1] = v9;
    double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    [v7 insertRowsAtIndexPaths:v10 withRowAnimation:0];
  }
  else
  {
    [v5 setHttpProxyAuthenticationRequired:0];

    id v7 = [(WFProxyConfigViewController *)self tableView];
    uint64_t v8 = [MEMORY[0x263F088C8] indexPathForRow:3 inSection:1];
    v13[0] = v8;
    uint64_t v9 = [MEMORY[0x263F088C8] indexPathForRow:4 inSection:1];
    v13[1] = v9;
    double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    [v7 deleteRowsAtIndexPaths:v10 withRowAnimation:0];
  }

  [(WFProxyConfigViewController *)self _updateSaveEnabled];
  uint64_t v11 = [(WFProxyConfigViewController *)self tableView];
  int64_t v12 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
  [v11 reloadSections:v12 withRowAnimation:5];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)_configCellLeadingInset
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double v4 = v3;

  int v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 bounds];
  double v7 = v6;

  if (v4 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v4;
  }
  BOOL v9 = v8 >= 414.0 && v8 <= 428.0;
  double result = 20.0;
  if (!v9) {
    return 16.0;
  }
  return result;
}

- (id)saveHandler
{
  return self->_saveHandler;
}

- (void)setSaveHandler:(id)a3
{
}

- (WFNetworkSettingsConfig)originalConfig
{
  return self->_originalConfig;
}

- (void)setOriginalConfig:(id)a3
{
}

- (WFNetworkSettingsConfig)modifiedConfig
{
  return self->_modifiedConfig;
}

- (void)setModifiedConfig:(id)a3
{
}

- (UISwitch)authSwitch
{
  return self->_authSwitch;
}

- (void)setAuthSwitch:(id)a3
{
}

- (void)setServerCell:(id)a3
{
}

- (void)setPortCell:(id)a3
{
}

- (void)setUserCell:(id)a3
{
}

- (void)setPasswordCell:(id)a3
{
}

- (void)setUrlCell:(id)a3
{
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_urlCell, 0);
  objc_storeStrong((id *)&self->_passwordCell, 0);
  objc_storeStrong((id *)&self->_userCell, 0);
  objc_storeStrong((id *)&self->_portCell, 0);
  objc_storeStrong((id *)&self->_serverCell, 0);
  objc_storeStrong((id *)&self->_authSwitch, 0);
  objc_storeStrong((id *)&self->_modifiedConfig, 0);
  objc_storeStrong((id *)&self->_originalConfig, 0);
  objc_storeStrong(&self->_saveHandler, 0);
}

@end