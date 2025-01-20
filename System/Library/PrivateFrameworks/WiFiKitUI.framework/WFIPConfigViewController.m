@interface WFIPConfigViewController
- (BOOL)_canShowWhileLocked;
- (WFAppearanceProxy)appearanceProxy;
- (WFIPConfigViewController)initWithConfig:(id)a3 ipType:(int64_t)a4;
- (WFIPConfigViewController)initWithConfig:(id)a3 ipType:(int64_t)a4 appearanceProxy:(id)a5;
- (WFNetworkSettingsConfig)modifiedConfig;
- (WFNetworkSettingsConfig)originalConfig;
- (WFTextFieldCell)clientIDCell;
- (WFTextFieldCell)ipAddressCell;
- (WFTextFieldCell)prefixCell;
- (WFTextFieldCell)routerCell;
- (WFTextFieldCell)subnetMaskCell;
- (double)_configCellLeadingInset;
- (id)saveHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)type;
- (void)_setFirstResponderAfterCell:(id)a3;
- (void)_updateSaveEnabled;
- (void)didReceiveMemoryWarning;
- (void)save:(id)a3;
- (void)setAppearanceProxy:(id)a3;
- (void)setClientIDCell:(id)a3;
- (void)setIpAddressCell:(id)a3;
- (void)setModifiedConfig:(id)a3;
- (void)setOriginalConfig:(id)a3;
- (void)setPrefixCell:(id)a3;
- (void)setRouterCell:(id)a3;
- (void)setSaveHandler:(id)a3;
- (void)setSubnetMaskCell:(id)a3;
- (void)setType:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFIPConfigViewController

- (WFIPConfigViewController)initWithConfig:(id)a3 ipType:(int64_t)a4
{
  id v6 = a3;
  v7 = +[WFAppearanceProxy defaultAppearanceProxy];
  v8 = [(WFIPConfigViewController *)self initWithConfig:v6 ipType:a4 appearanceProxy:v7];

  return v8;
}

- (WFIPConfigViewController)initWithConfig:(id)a3 ipType:(int64_t)a4 appearanceProxy:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFIPConfigViewController;
  v10 = -[WFIPConfigViewController initWithStyle:](&v17, sel_initWithStyle_, [a5 tableViewStyle]);
  v11 = v10;
  if (v9 && v10)
  {
    objc_storeStrong((id *)&v10->_originalConfig, a3);
    uint64_t v12 = [v9 copy];
    modifiedConfig = v11->_modifiedConfig;
    v11->_modifiedConfig = (WFNetworkSettingsConfig *)v12;

    if (!a4 && [(WFNetworkSettingsConfig *)v11->_modifiedConfig ipv4Config] == -1)
    {
      v14 = WFLogForCategory(0);
      os_log_type_t v15 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v14 && os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[WFIPConfigViewController initWithConfig:ipType:appearanceProxy:]";
        _os_log_impl(&dword_2257EC000, v14, v15, "%s: previous ipv4Config is unknown", buf, 0xCu);
      }

      [(WFNetworkSettingsConfig *)v11->_modifiedConfig setIpv4Config:0];
    }
    v11->_type = a4;
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)WFIPConfigViewController;
  [(WFIPConfigViewController *)&v16 viewDidLoad];
  if ([(WFIPConfigViewController *)self type])
  {
    if ([(WFIPConfigViewController *)self type] != 1) {
      goto LABEL_6;
    }
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    v5 = @"kWFLocSettingsIPV6ConfigureTitle";
  }
  else
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    v5 = @"kWFLocSettingsIPV4ConfigureTitle";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [(WFIPConfigViewController *)self setTitle:v6];

LABEL_6:
  v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:3 target:self action:sel_save_];
  v8 = [(WFIPConfigViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  id v9 = [(WFIPConfigViewController *)self navigationItem];
  v10 = [v9 rightBarButtonItem];
  [v10 setEnabled:0];

  double v11 = *MEMORY[0x263F839B8];
  uint64_t v12 = [(WFIPConfigViewController *)self tableView];
  [v12 setRowHeight:v11];

  v13 = [(WFIPConfigViewController *)self tableView];
  [v13 setEstimatedRowHeight:44.0];

  v14 = [(WFIPConfigViewController *)self tableView];
  [v14 setEstimatedSectionHeaderHeight:0.0];

  if ([MEMORY[0x263F82670] currentIsIPad])
  {
    os_log_type_t v15 = [(WFIPConfigViewController *)self tableView];
    objc_msgSend(v15, "_setSectionContentInset:", 0.0, 20.0, 0.0, 20.0);
  }
  [(WFIPConfigViewController *)self _updateSaveEnabled];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)WFIPConfigViewController;
  [(WFIPConfigViewController *)&v2 didReceiveMemoryWarning];
}

- (void)_updateSaveEnabled
{
  v3 = [(WFIPConfigViewController *)self modifiedConfig];
  v4 = [(WFIPConfigViewController *)self originalConfig];
  char v5 = [v3 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  if (![(WFIPConfigViewController *)self type])
  {
    v7 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v8 = [v7 validIPv4Configuration];
    goto LABEL_7;
  }
  if ([(WFIPConfigViewController *)self type] == 1)
  {
    v7 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v8 = [v7 validIPv6Configuration];
LABEL_7:
    uint64_t v6 = v8;

    goto LABEL_9;
  }
  uint64_t v6 = 1;
LABEL_9:
  id v10 = [(WFIPConfigViewController *)self navigationItem];
  id v9 = [v10 rightBarButtonItem];
  [v9 setEnabled:v6];
}

- (void)save:(id)a3
{
  v4 = [(WFIPConfigViewController *)self saveHandler];

  if (v4)
  {
    char v5 = [(WFIPConfigViewController *)self saveHandler];
    uint64_t v6 = [(WFIPConfigViewController *)self modifiedConfig];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
  id v8 = [(WFIPConfigViewController *)self navigationController];
  id v7 = (id)[v8 popViewControllerAnimated:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(WFIPConfigViewController *)self type])
  {
    if ([(WFIPConfigViewController *)self type] == 1)
    {
      v4 = [(WFIPConfigViewController *)self modifiedConfig];
      uint64_t v5 = [v4 ipv6Config];

      if (v5 == 1) {
        return 2;
      }
      else {
        return 1;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    id v7 = [(WFIPConfigViewController *)self modifiedConfig];
    if ([v7 ipv4Config] == 1) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = 2;
    }
  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 != 1)
  {
    if (!a4)
    {
      if ([(WFIPConfigViewController *)self type])
      {
        BOOL v7 = [(WFIPConfigViewController *)self type] == 1;
        goto LABEL_8;
      }
LABEL_13:
      int64_t v10 = 3;
      goto LABEL_17;
    }
LABEL_16:
    int64_t v10 = 0;
    goto LABEL_17;
  }
  if (![(WFIPConfigViewController *)self type])
  {
    double v11 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v12 = [v11 ipv4Config];

    if (!v12)
    {
      int64_t v10 = 1;
      goto LABEL_17;
    }
    v13 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v14 = [v13 ipv4Config];

    if (v14 == 2) {
      goto LABEL_13;
    }
    os_log_type_t v15 = [(WFIPConfigViewController *)self modifiedConfig];
    [v15 ipv4Config];

    goto LABEL_16;
  }
  if ([(WFIPConfigViewController *)self type] != 1) {
    goto LABEL_16;
  }
  id v8 = [(WFIPConfigViewController *)self modifiedConfig];
  uint64_t v9 = [v8 ipv6Config];

  BOOL v7 = v9 == 1;
LABEL_8:
  if (v7) {
    int64_t v10 = 3;
  }
  else {
    int64_t v10 = 0;
  }
LABEL_17:

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    if ([v5 section] == 1)
    {
      if ([(WFIPConfigViewController *)self type])
      {
        if ([(WFIPConfigViewController *)self type] == 1)
        {
          id v6 = [(WFIPConfigViewController *)self modifiedConfig];
          uint64_t v7 = [v6 ipv6Config];

          if (v7 == 1)
          {
            if ([v5 row])
            {
              if ([v5 row] == 1)
              {
                uint64_t v8 = [(WFIPConfigViewController *)self prefixCell];
LABEL_39:
                uint64_t v9 = (void *)v8;
                goto LABEL_41;
              }
LABEL_37:
              if ([v5 row] == 2)
              {
                uint64_t v8 = [(WFIPConfigViewController *)self routerCell];
                goto LABEL_39;
              }
              goto LABEL_40;
            }
            goto LABEL_36;
          }
        }
      }
      else
      {
        uint64_t v20 = [(WFIPConfigViewController *)self modifiedConfig];
        uint64_t v21 = [v20 ipv4Config];

        if (!v21)
        {
          if (![v5 row])
          {
            uint64_t v8 = [(WFIPConfigViewController *)self clientIDCell];
            goto LABEL_39;
          }
          goto LABEL_40;
        }
        v22 = [(WFIPConfigViewController *)self modifiedConfig];
        uint64_t v23 = [v22 ipv4Config];

        if (v23 == 2)
        {
          if ([v5 row])
          {
            if ([v5 row] == 1)
            {
              uint64_t v8 = [(WFIPConfigViewController *)self subnetMaskCell];
              goto LABEL_39;
            }
            goto LABEL_37;
          }
LABEL_36:
          uint64_t v8 = [(WFIPConfigViewController *)self ipAddressCell];
          goto LABEL_39;
        }
      }
    }
LABEL_40:
    uint64_t v9 = 0;
    goto LABEL_41;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
  [v9 setAccessoryType:0];
  if ([(WFIPConfigViewController *)self type])
  {
    if ([(WFIPConfigViewController *)self type] != 1) {
      goto LABEL_41;
    }
    if ([v5 row])
    {
      if ([v5 row] == 1)
      {
        int64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        double v11 = [v10 localizedStringForKey:@"kWFLocSettingsIPV6ConfigureManual" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        uint64_t v12 = [v9 textLabel];
        [v12 setText:v11];

        v13 = [(WFIPConfigViewController *)self modifiedConfig];
        uint64_t v14 = [v13 ipv6Config];
        goto LABEL_28;
      }
      if ([v5 row] != 2) {
        goto LABEL_41;
      }
      v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v38 = [v37 localizedStringForKey:@"kWFLocSettingsIPV6ConfigureLinkLocal" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v39 = [v9 textLabel];
      [v39 setText:v38];

      v18 = [(WFIPConfigViewController *)self modifiedConfig];
      uint64_t v19 = [v18 ipv6Config];
LABEL_34:
      uint64_t v40 = v19;

      if (v40 != 2) {
        goto LABEL_41;
      }
      goto LABEL_35;
    }
    v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v30 = [v29 localizedStringForKey:@"kWFLocSettingsIPV6ConfigureAutomatic" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    v31 = [v9 textLabel];
    [v31 setText:v30];

    v27 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v28 = [v27 ipv6Config];
LABEL_24:
    uint64_t v32 = v28;

    if (v32) {
      goto LABEL_41;
    }
    goto LABEL_35;
  }
  if (![v5 row])
  {
    v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"kWFLocSettingsIPV4ConfigureAutomatic" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    v26 = [v9 textLabel];
    [v26 setText:v25];

    v27 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v28 = [v27 ipv4Config];
    goto LABEL_24;
  }
  if ([v5 row] == 1)
  {
    os_log_type_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v16 = [v15 localizedStringForKey:@"kWFLocSettingsIPV4ConfigureManual" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    objc_super v17 = [v9 textLabel];
    [v17 setText:v16];

    v18 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v19 = [v18 ipv4Config];
    goto LABEL_34;
  }
  if ([v5 row] != 2) {
    goto LABEL_41;
  }
  v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v34 = [v33 localizedStringForKey:@"kWFLocSettingsIPV4ConfigureBootP" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  v35 = [v9 textLabel];
  [v35 setText:v34];

  v13 = [(WFIPConfigViewController *)self modifiedConfig];
  uint64_t v14 = [v13 ipv4Config];
LABEL_28:
  uint64_t v36 = v14;

  if (v36 == 1) {
LABEL_35:
  }
    [v9 setAccessoryType:3];
LABEL_41:
  v41 = [(WFIPConfigViewController *)self appearanceProxy];
  v42 = [v41 cellTextLabelFont];

  if (v42)
  {
    v43 = [(WFIPConfigViewController *)self appearanceProxy];
    v44 = [v43 cellTextLabelFont];
    v45 = [v9 textLabel];
    [v45 setFont:v44];
  }
  return v9;
}

- (void)_setFirstResponderAfterCell:(id)a3
{
  id v10 = a3;
  id v4 = [(WFIPConfigViewController *)self ipAddressCell];

  if (v4 == v10)
  {
    if ([(WFIPConfigViewController *)self type])
    {
      if ([(WFIPConfigViewController *)self type] != 1) {
        goto LABEL_14;
      }
      uint64_t v8 = [(WFIPConfigViewController *)self prefixCell];
    }
    else
    {
      uint64_t v8 = [(WFIPConfigViewController *)self subnetMaskCell];
    }
  }
  else
  {
    id v5 = [(WFIPConfigViewController *)self prefixCell];
    if (v5 == v10)
    {
    }
    else
    {
      id v6 = [(WFIPConfigViewController *)self subnetMaskCell];

      if (v6 != v10)
      {
        id v7 = [(WFIPConfigViewController *)self routerCell];

        if (v7 != v10) {
          goto LABEL_14;
        }
        uint64_t v8 = [(WFIPConfigViewController *)self ipAddressCell];
        goto LABEL_12;
      }
    }
    uint64_t v8 = [(WFIPConfigViewController *)self routerCell];
  }
LABEL_12:
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 becomeFirstResponder];
  }
LABEL_14:
}

- (WFTextFieldCell)ipAddressCell
{
  ipAddressCell = self->_ipAddressCell;
  if (ipAddressCell) {
    goto LABEL_12;
  }
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
  id v6 = [v5 objectAtIndex:0];

  id v7 = [(WFTextFieldCell *)v6 textField];
  [v7 setTextAlignment:2];

  objc_initWeak(&location, self);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __41__WFIPConfigViewController_ipAddressCell__block_invoke;
  v45[3] = &unk_264756948;
  objc_copyWeak(&v46, &location);
  [(WFTextFieldCell *)v6 setReturnKeyHandler:v45];
  if (![(WFIPConfigViewController *)self type])
  {
    uint64_t v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"kWFLocSettingsIPV4AddressCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    v25 = [(WFTextFieldCell *)v6 label];
    [v25 setText:v24];

    v26 = [(WFIPConfigViewController *)self modifiedConfig];
    v27 = [v26 ipv4AddressManual];
    uint64_t v28 = [(WFTextFieldCell *)v6 textField];
    [v28 setText:v27];

    [(WFIPConfigViewController *)self _configCellLeadingInset];
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v29, 0.0, 0.0);
    v30 = [(WFTextFieldCell *)v6 textField];
    [v30 setKeyboardType:2];

    objc_initWeak(&from, self);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __41__WFIPConfigViewController_ipAddressCell__block_invoke_2;
    v42[3] = &unk_264756118;
    v22 = &v43;
    objc_copyWeak(&v43, &from);
    [(WFTextFieldCell *)v6 setTextChangeHandler:v42];
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d.%d", 0, 0, 0, 0);
    uint64_t v32 = [(WFTextFieldCell *)v6 textField];
    [v32 setPlaceholder:v31];

LABEL_8:
    objc_destroyWeak(v22);
    objc_destroyWeak(&from);
    goto LABEL_9;
  }
  if ([(WFIPConfigViewController *)self type] == 1)
  {
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"kWFLocSettingsIPV6AddressCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    id v10 = [(WFTextFieldCell *)v6 label];
    [v10 setText:v9];

    double v11 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v12 = [v11 ipv6AddressManual];
    v13 = [(WFTextFieldCell *)v6 textField];
    [v13 setText:v12];

    [(WFIPConfigViewController *)self _configCellLeadingInset];
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v14, 0.0, 0.0);
    os_log_type_t v15 = [(WFIPConfigViewController *)self modifiedConfig];
    objc_super v16 = [v15 ipv6Addresses];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      v18 = [(WFIPConfigViewController *)self modifiedConfig];
      uint64_t v19 = [v18 ipv6Addresses];
      uint64_t v20 = [v19 objectAtIndexedSubscript:0];
      uint64_t v21 = [(WFTextFieldCell *)v6 textField];
      [v21 setPlaceholder:v20];
    }
    objc_initWeak(&from, self);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __41__WFIPConfigViewController_ipAddressCell__block_invoke_3;
    v40[3] = &unk_264756118;
    v22 = &v41;
    objc_copyWeak(&v41, &from);
    [(WFTextFieldCell *)v6 setTextChangeHandler:v40];
    goto LABEL_8;
  }
LABEL_9:
  v33 = [(WFIPConfigViewController *)self appearanceProxy];
  v34 = [v33 cellTextLabelFont];

  if (v34)
  {
    v35 = [(WFIPConfigViewController *)self appearanceProxy];
    uint64_t v36 = [v35 cellTextLabelFont];
    v37 = [(WFTextFieldCell *)v6 textLabel];
    [v37 setFont:v36];
  }
  v38 = self->_ipAddressCell;
  self->_ipAddressCell = v6;

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
  ipAddressCell = self->_ipAddressCell;
LABEL_12:
  return ipAddressCell;
}

void __41__WFIPConfigViewController_ipAddressCell__block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

void __41__WFIPConfigViewController_ipAddressCell__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setIpv4AddressManual:v4];

  [WeakRetained _updateSaveEnabled];
}

void __41__WFIPConfigViewController_ipAddressCell__block_invoke_3(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setIpv6AddressManual:v4];

  [WeakRetained _updateSaveEnabled];
}

- (WFTextFieldCell)subnetMaskCell
{
  subnetMaskCell = self->_subnetMaskCell;
  if (!subnetMaskCell)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
    id v6 = [v5 objectAtIndex:0];

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"kWFLocSettingsSubnetMaskCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    uint64_t v9 = [(WFTextFieldCell *)v6 label];
    [v9 setText:v8];

    [(WFIPConfigViewController *)self _configCellLeadingInset];
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    double v11 = [(WFTextFieldCell *)v6 textField];
    [v11 setTextAlignment:2];

    uint64_t v12 = [(WFIPConfigViewController *)self modifiedConfig];
    v13 = [v12 ipv4SubnetMaskManual];
    double v14 = [(WFTextFieldCell *)v6 textField];
    [v14 setText:v13];

    os_log_type_t v15 = [(WFTextFieldCell *)v6 textField];
    [v15 setKeyboardType:2];

    objc_super v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d.%d", 255, 255, 0, 0);
    uint64_t v17 = [(WFTextFieldCell *)v6 textField];
    [v17 setPlaceholder:v16];

    objc_initWeak(&location, self);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __42__WFIPConfigViewController_subnetMaskCell__block_invoke;
    v27[3] = &unk_264756118;
    objc_copyWeak(&v28, &location);
    [(WFTextFieldCell *)v6 setTextChangeHandler:v27];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __42__WFIPConfigViewController_subnetMaskCell__block_invoke_2;
    v25[3] = &unk_264756948;
    objc_copyWeak(&v26, &location);
    [(WFTextFieldCell *)v6 setReturnKeyHandler:v25];
    v18 = [(WFIPConfigViewController *)self appearanceProxy];
    uint64_t v19 = [v18 cellTextLabelFont];

    if (v19)
    {
      uint64_t v20 = [(WFIPConfigViewController *)self appearanceProxy];
      uint64_t v21 = [v20 cellTextLabelFont];
      v22 = [(WFTextFieldCell *)v6 textLabel];
      [v22 setFont:v21];
    }
    uint64_t v23 = self->_subnetMaskCell;
    self->_subnetMaskCell = v6;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    subnetMaskCell = self->_subnetMaskCell;
  }
  return subnetMaskCell;
}

void __42__WFIPConfigViewController_subnetMaskCell__block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setIpv4SubnetMaskManual:v4];

  [WeakRetained _updateSaveEnabled];
}

void __42__WFIPConfigViewController_subnetMaskCell__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

- (WFTextFieldCell)prefixCell
{
  prefixCell = self->_prefixCell;
  if (!prefixCell)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
    id v6 = [v5 objectAtIndex:0];

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"kWFLocSettingsIPV6ConfigurePrefixLength" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    uint64_t v9 = [(WFTextFieldCell *)v6 label];
    [v9 setText:v8];

    [(WFIPConfigViewController *)self _configCellLeadingInset];
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    double v11 = [(WFTextFieldCell *)v6 textField];
    [v11 setTextAlignment:2];

    uint64_t v12 = [(WFIPConfigViewController *)self modifiedConfig];
    v13 = [v12 ipv6PrefixLengthManual];
    double v14 = [(WFTextFieldCell *)v6 textField];
    [v14 setText:v13];

    os_log_type_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 64);
    objc_super v16 = [(WFTextFieldCell *)v6 textField];
    [v16 setPlaceholder:v15];

    objc_initWeak(&location, self);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __38__WFIPConfigViewController_prefixCell__block_invoke;
    v26[3] = &unk_264756118;
    objc_copyWeak(&v27, &location);
    [(WFTextFieldCell *)v6 setTextChangeHandler:v26];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __38__WFIPConfigViewController_prefixCell__block_invoke_2;
    v24[3] = &unk_264756948;
    objc_copyWeak(&v25, &location);
    [(WFTextFieldCell *)v6 setReturnKeyHandler:v24];
    uint64_t v17 = [(WFIPConfigViewController *)self appearanceProxy];
    v18 = [v17 cellTextLabelFont];

    if (v18)
    {
      uint64_t v19 = [(WFIPConfigViewController *)self appearanceProxy];
      uint64_t v20 = [v19 cellTextLabelFont];
      uint64_t v21 = [(WFTextFieldCell *)v6 textLabel];
      [v21 setFont:v20];
    }
    v22 = self->_prefixCell;
    self->_prefixCell = v6;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    prefixCell = self->_prefixCell;
  }
  return prefixCell;
}

void __38__WFIPConfigViewController_prefixCell__block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setIpv6PrefixLengthManual:v4];

  [WeakRetained _updateSaveEnabled];
}

void __38__WFIPConfigViewController_prefixCell__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

- (WFTextFieldCell)routerCell
{
  routerCell = self->_routerCell;
  if (routerCell) {
    goto LABEL_10;
  }
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
  id v6 = [v5 objectAtIndex:0];

  id v7 = [(WFTextFieldCell *)v6 textField];
  [v7 setTextAlignment:2];

  [(WFIPConfigViewController *)self _configCellLeadingInset];
  -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v8, 0.0, 0.0);
  objc_initWeak(&location, self);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __38__WFIPConfigViewController_routerCell__block_invoke;
  v39[3] = &unk_264756948;
  objc_copyWeak(&v40, &location);
  [(WFTextFieldCell *)v6 setReturnKeyHandler:v39];
  if (![(WFIPConfigViewController *)self type])
  {
    uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v20 = [v19 localizedStringForKey:@"kWFLocSettingsIPV4RouterCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    uint64_t v21 = [(WFTextFieldCell *)v6 label];
    [v21 setText:v20];

    v22 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v23 = [v22 ipv4RouterAddressManual];
    v24 = [(WFTextFieldCell *)v6 textField];
    [v24 setText:v23];

    id v25 = [(WFTextFieldCell *)v6 textField];
    [v25 setKeyboardType:2];

    id v26 = [(WFTextFieldCell *)v6 textField];
    [v26 setPlaceholder:&stru_26D8F6070];

    objc_initWeak(&from, self);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __38__WFIPConfigViewController_routerCell__block_invoke_2;
    v36[3] = &unk_264756118;
    v18 = &v37;
    objc_copyWeak(&v37, &from);
    [(WFTextFieldCell *)v6 setTextChangeHandler:v36];
    goto LABEL_6;
  }
  if ([(WFIPConfigViewController *)self type] == 1)
  {
    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v10 = [v9 localizedStringForKey:@"kWFLocSettingsIPV6RouterCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    double v11 = [(WFTextFieldCell *)v6 label];
    [v11 setText:v10];

    uint64_t v12 = [(WFIPConfigViewController *)self modifiedConfig];
    v13 = [v12 ipv6RouterAddressManual];
    double v14 = [(WFTextFieldCell *)v6 textField];
    [v14 setText:v13];

    os_log_type_t v15 = [(WFIPConfigViewController *)self modifiedConfig];
    objc_super v16 = [v15 ipv6RouterAddress];
    uint64_t v17 = [(WFTextFieldCell *)v6 textField];
    [v17 setPlaceholder:v16];

    objc_initWeak(&from, self);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __38__WFIPConfigViewController_routerCell__block_invoke_3;
    v34[3] = &unk_264756118;
    v18 = &v35;
    objc_copyWeak(&v35, &from);
    [(WFTextFieldCell *)v6 setTextChangeHandler:v34];
LABEL_6:
    objc_destroyWeak(v18);
    objc_destroyWeak(&from);
  }
  id v27 = [(WFIPConfigViewController *)self appearanceProxy];
  id v28 = [v27 cellTextLabelFont];

  if (v28)
  {
    double v29 = [(WFIPConfigViewController *)self appearanceProxy];
    v30 = [v29 cellTextLabelFont];
    v31 = [(WFTextFieldCell *)v6 textLabel];
    [v31 setFont:v30];
  }
  uint64_t v32 = self->_routerCell;
  self->_routerCell = v6;

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
  routerCell = self->_routerCell;
LABEL_10:
  return routerCell;
}

void __38__WFIPConfigViewController_routerCell__block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setFirstResponderAfterCell:v3];
}

void __38__WFIPConfigViewController_routerCell__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setIpv4RouterAddressManual:v4];

  [WeakRetained _updateSaveEnabled];
}

void __38__WFIPConfigViewController_routerCell__block_invoke_3(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setIpv6RouterAddressManual:v4];

  [WeakRetained _updateSaveEnabled];
}

- (WFTextFieldCell)clientIDCell
{
  clientIDCell = self->_clientIDCell;
  if (!clientIDCell)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 loadNibNamed:@"WFTextFieldCell" owner:self options:0];
    id v6 = [v5 objectAtIndex:0];

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v8 = [v7 localizedStringForKey:@"kWFLocSettingsClientIDCell" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
    uint64_t v9 = [(WFTextFieldCell *)v6 label];
    [v9 setText:v8];

    [(WFIPConfigViewController *)self _configCellLeadingInset];
    -[WFTextFieldCell setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v10, 0.0, 0.0);
    double v11 = [(WFTextFieldCell *)v6 textField];
    [v11 setTextAlignment:2];

    uint64_t v12 = [(WFIPConfigViewController *)self modifiedConfig];
    v13 = [v12 dhcpClientID];
    double v14 = [(WFTextFieldCell *)v6 textField];
    [v14 setText:v13];

    objc_initWeak(&location, self);
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __40__WFIPConfigViewController_clientIDCell__block_invoke;
    id v25 = &unk_264756118;
    objc_copyWeak(&v26, &location);
    [(WFTextFieldCell *)v6 setTextChangeHandler:&v22];
    os_log_type_t v15 = [(WFIPConfigViewController *)self appearanceProxy];
    objc_super v16 = [v15 cellTextLabelFont];

    if (v16)
    {
      uint64_t v17 = [(WFIPConfigViewController *)self appearanceProxy];
      v18 = [v17 cellTextLabelFont];
      uint64_t v19 = [(WFTextFieldCell *)v6 textLabel];
      [v19 setFont:v18];
    }
    uint64_t v20 = self->_clientIDCell;
    self->_clientIDCell = v6;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    clientIDCell = self->_clientIDCell;
  }
  return clientIDCell;
}

void __40__WFIPConfigViewController_clientIDCell__block_invoke(uint64_t a1, void *a2)
{
  objc_super v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [WeakRetained modifiedConfig];
  [v5 setDhcpClientID:v4];

  [WeakRetained _updateSaveEnabled];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1
    && ![(WFIPConfigViewController *)self type]
    && ([(WFIPConfigViewController *)self modifiedConfig],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 ipv4Config],
        v5,
        v6 == 2))
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v8 = [v7 localizedStringForKey:@"kWFLocSettingsIPV4ConfigureManualSectionHeader" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v58[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  if ([v7 section])
  {
    double v8 = [v6 cellForRowAtIndexPath:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 becomeFirstResponder];
    }

    goto LABEL_5;
  }
  if ([(WFIPConfigViewController *)self type])
  {
    if ([(WFIPConfigViewController *)self type] != 1) {
      goto LABEL_5;
    }
    if (![v7 row]) {
      goto LABEL_20;
    }
    if ([v7 row] == 1)
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 1;
      uint64_t v12 = 1;
      goto LABEL_21;
    }
    if ([v7 row] == 2)
    {
      int v11 = 0;
      int v9 = 0;
      int v10 = 1;
      uint64_t v12 = 2;
    }
    else
    {
LABEL_20:
      int v11 = 0;
      int v10 = 0;
      uint64_t v12 = 0;
      int v9 = 1;
    }
LABEL_21:
    uint64_t v20 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v21 = [v20 ipv6Config];

    if (v12 == v21) {
      goto LABEL_5;
    }
    uint64_t v22 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v23 = [v22 ipv6Config];

    v24 = [(WFIPConfigViewController *)self modifiedConfig];
    [v24 setIpv6Config:v12];

    if (v11)
    {
      id v25 = [(WFIPConfigViewController *)self tableView];
      [v25 beginUpdates];

      id v26 = [(WFIPConfigViewController *)self tableView];
      id v27 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
      [v26 insertSections:v27 withRowAnimation:0];

      id v28 = [(WFIPConfigViewController *)self tableView];
      double v29 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
      v58[0] = v29;
      v30 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:1];
      v58[1] = v30;
      v31 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:1];
      v58[2] = v31;
      [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:3];
      LODWORD(v26) = v9;
      v33 = int v32 = v10;
      [v28 insertRowsAtIndexPaths:v33 withRowAnimation:0];

      int v10 = v32;
      int v9 = (int)v26;
      uint64_t v34 = 3;

      id v35 = [(WFIPConfigViewController *)self tableView];
      [v35 endUpdates];

      uint64_t v36 = [(WFIPConfigViewController *)self ipAddressCell];
      [v36 becomeFirstResponder];
    }
    else
    {
      uint64_t v34 = 0;
      if ((v9 | v10) != 1 || v23 != 1)
      {
LABEL_28:
        if (v9) {
          uint64_t v45 = 3;
        }
        else {
          uint64_t v45 = 0;
        }
        id v46 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
        v47 = [v6 cellForRowAtIndexPath:v46];
        [v47 setAccessoryType:v45];

        v48 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:0];
        v49 = [v6 cellForRowAtIndexPath:v48];
        [v49 setAccessoryType:v34];

        if (v10) {
          uint64_t v50 = 3;
        }
        else {
          uint64_t v50 = 0;
        }
        v51 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:0];
        v52 = [v6 cellForRowAtIndexPath:v51];
        [v52 setAccessoryType:v50];

        goto LABEL_5;
      }
      id v37 = [(WFIPConfigViewController *)self tableView];
      [v37 beginUpdates];

      v38 = [(WFIPConfigViewController *)self tableView];
      v39 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
      [v38 deleteSections:v39 withRowAnimation:0];

      id v40 = [(WFIPConfigViewController *)self tableView];
      id v41 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
      v57[0] = v41;
      v42 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:1];
      v57[1] = v42;
      id v43 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:1];
      v57[2] = v43;
      v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:3];
      [v40 deleteRowsAtIndexPaths:v44 withRowAnimation:0];

      uint64_t v36 = [(WFIPConfigViewController *)self tableView];
      [v36 endUpdates];
      uint64_t v34 = 0;
    }

    goto LABEL_28;
  }
  if ([v7 row])
  {
    if ([v7 row] == 1) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = [v7 row] == 2;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  double v14 = [(WFIPConfigViewController *)self modifiedConfig];
  uint64_t v15 = [v14 ipv4Config];

  if (v13 != v15)
  {
    objc_super v16 = [(WFIPConfigViewController *)self modifiedConfig];
    uint64_t v17 = [v16 ipv4Config];

    v18 = [(WFIPConfigViewController *)self modifiedConfig];
    [v18 setIpv4Config:v13];

    uint64_t v19 = [(WFIPConfigViewController *)self tableView];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __62__WFIPConfigViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v53[3] = &unk_2647569C8;
    uint64_t v55 = v13;
    uint64_t v56 = v17;
    v53[4] = self;
    id v54 = v6;
    [v19 performBatchUpdates:v53 completion:&__block_literal_global_3];
  }
LABEL_5:
  [(WFIPConfigViewController *)self _updateSaveEnabled];
}

void __62__WFIPConfigViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  v56[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  switch(v2)
  {
    case 0:
      uint64_t v11 = *(void *)(a1 + 56);
      if (v11 == 2)
      {
        uint64_t v21 = [*(id *)(a1 + 32) tableView];
        uint64_t v22 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:1];
        v52[0] = v22;
        uint64_t v23 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:1];
        v52[1] = v23;
        v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
        [v21 deleteRowsAtIndexPaths:v24 withRowAnimation:0];

        id v25 = [*(id *)(a1 + 32) tableView];
        id v26 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
        v51 = v26;
        id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
        [v25 reloadRowsAtIndexPaths:v27 withRowAnimation:5];

        double v14 = [*(id *)(a1 + 32) tableView];
        uint64_t v15 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
        [v14 _reloadSectionHeaderFooters:v15 withRowAnimation:0];
        goto LABEL_15;
      }
      if (v11 != 1) {
        break;
      }
      uint64_t v12 = [*(id *)(a1 + 32) tableView];
      uint64_t v13 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
      [v12 insertSections:v13 withRowAnimation:0];

      double v14 = [*(id *)(a1 + 32) tableView];
      uint64_t v15 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
      v53 = v15;
      objc_super v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
      [v14 insertRowsAtIndexPaths:v16 withRowAnimation:0];

LABEL_15:
      break;
    case 1:
      double v14 = [*(id *)(a1 + 32) tableView];
      uint64_t v15 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
      [v14 deleteSections:v15 withRowAnimation:0];
      goto LABEL_15;
    case 2:
      uint64_t v3 = *(void *)(a1 + 56);
      if (v3)
      {
        if (v3 != 1)
        {
LABEL_13:
          double v14 = [*(id *)(a1 + 32) ipAddressCell];
          uint64_t v15 = [v14 textField];
          [v15 performSelector:sel_becomeFirstResponder withObject:0 afterDelay:0.1];
          goto LABEL_15;
        }
        id v4 = [*(id *)(a1 + 32) tableView];
        id v5 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
        [v4 insertSections:v5 withRowAnimation:0];

        id v6 = [*(id *)(a1 + 32) tableView];
        id v7 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
        v56[0] = v7;
        double v8 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:1];
        v56[1] = v8;
        int v9 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:1];
        v56[2] = v9;
        int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:3];
        [v6 insertRowsAtIndexPaths:v10 withRowAnimation:0];
      }
      else
      {
        uint64_t v17 = [*(id *)(a1 + 32) tableView];
        v18 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:1];
        v55[0] = v18;
        uint64_t v19 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:1];
        v55[1] = v19;
        uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
        [v17 insertRowsAtIndexPaths:v20 withRowAnimation:0];

        id v6 = [*(id *)(a1 + 32) tableView];
        id v7 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
        id v54 = v7;
        double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
        [v6 reloadRowsAtIndexPaths:v8 withRowAnimation:5];
      }

      goto LABEL_13;
  }
  id v28 = WFLogForCategory(0);
  os_log_type_t v29 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v28 && os_log_type_enabled(v28, v29))
  {
    uint64_t v31 = *(void *)(a1 + 48);
    uint64_t v30 = *(void *)(a1 + 56);
    int v45 = 136315650;
    id v46 = "-[WFIPConfigViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    __int16 v47 = 2048;
    uint64_t v48 = v30;
    __int16 v49 = 2048;
    uint64_t v50 = v31;
    _os_log_impl(&dword_2257EC000, v28, v29, "%s: IP Config -- previous config: %ld new config: %ld.", (uint8_t *)&v45, 0x20u);
  }

  int v32 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 48)) {
    uint64_t v33 = 0;
  }
  else {
    uint64_t v33 = 3;
  }
  uint64_t v34 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  id v35 = [v32 cellForRowAtIndexPath:v34];
  [v35 setAccessoryType:v33];

  uint64_t v36 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 48) == 2) {
    uint64_t v37 = 3;
  }
  else {
    uint64_t v37 = 0;
  }
  v38 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:0];
  v39 = [v36 cellForRowAtIndexPath:v38];
  [v39 setAccessoryType:v37];

  uint64_t v41 = a1 + 40;
  id v40 = *(void **)(a1 + 40);
  if (*(void *)(v41 + 8) == 1) {
    uint64_t v42 = 3;
  }
  else {
    uint64_t v42 = 0;
  }
  id v43 = [MEMORY[0x263F088C8] indexPathForRow:2 inSection:0];
  v44 = [v40 cellForRowAtIndexPath:v43];
  [v44 setAccessoryType:v42];
}

void __62__WFIPConfigViewController_tableView_didSelectRowAtIndexPath___block_invoke_80()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = WFLogForCategory(0);
  os_log_type_t v1 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v0 && os_log_type_enabled(v0, v1))
  {
    int v2 = 136315138;
    uint64_t v3 = "-[WFIPConfigViewController tableView:didSelectRowAtIndexPath:]_block_invoke";
    _os_log_impl(&dword_2257EC000, v0, v1, "%s: Finished inserting and deleting cells for IP Config.", (uint8_t *)&v2, 0xCu);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)_configCellLeadingInset
{
  int v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double v4 = v3;

  id v5 = [MEMORY[0x263F82B60] mainScreen];
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

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setIpAddressCell:(id)a3
{
}

- (void)setSubnetMaskCell:(id)a3
{
}

- (void)setRouterCell:(id)a3
{
}

- (void)setPrefixCell:(id)a3
{
}

- (void)setClientIDCell:(id)a3
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
  objc_storeStrong((id *)&self->_clientIDCell, 0);
  objc_storeStrong((id *)&self->_prefixCell, 0);
  objc_storeStrong((id *)&self->_routerCell, 0);
  objc_storeStrong((id *)&self->_subnetMaskCell, 0);
  objc_storeStrong((id *)&self->_ipAddressCell, 0);
  objc_storeStrong((id *)&self->_modifiedConfig, 0);
  objc_storeStrong((id *)&self->_originalConfig, 0);
  objc_storeStrong(&self->_saveHandler, 0);
}

@end