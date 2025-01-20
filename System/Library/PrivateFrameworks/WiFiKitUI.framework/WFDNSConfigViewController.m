@interface WFDNSConfigViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isChinaDevice;
- (BOOL)shouldShowPrivacyRelayHeader;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (NSArray)originalDomains;
- (NSArray)originalServers;
- (NSMutableArray)domains;
- (NSMutableArray)servers;
- (UIBarButtonItem)saveButton;
- (WFAppearanceProxy)appearanceProxy;
- (WFDNSConfigViewController)initWithConfig:(id)a3;
- (WFDNSConfigViewController)initWithConfig:(id)a3 appearanceProxy:(id)a4;
- (double)_configCellLeadingInset;
- (id)saveHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)deviceCapability;
- (int64_t)dnsConfig;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)originalDNSConfig;
- (int64_t)sectionForSectionNumber:(int64_t)a3;
- (int64_t)sectionNumberForSection:(int64_t)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addDomainAtIndexPath:(id)a3;
- (void)_addServerAtIndexPath:(id)a3;
- (void)_updateSaveEnabled;
- (void)save:(id)a3;
- (void)setAppearanceProxy:(id)a3;
- (void)setDeviceCapability:(int64_t)a3;
- (void)setDnsConfig:(int64_t)a3;
- (void)setDomains:(id)a3;
- (void)setOriginalDNSConfig:(int64_t)a3;
- (void)setOriginalDomains:(id)a3;
- (void)setOriginalServers:(id)a3;
- (void)setSaveButton:(id)a3;
- (void)setSaveHandler:(id)a3;
- (void)setServers:(id)a3;
- (void)setShouldShowPrivacyRelayHeader:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFDNSConfigViewController

- (WFDNSConfigViewController)initWithConfig:(id)a3
{
  id v4 = a3;
  v5 = +[WFAppearanceProxy defaultAppearanceProxy];
  v6 = [(WFDNSConfigViewController *)self initWithConfig:v4 appearanceProxy:v5];

  return v6;
}

- (WFDNSConfigViewController)initWithConfig:(id)a3 appearanceProxy:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)WFDNSConfigViewController;
  v8 = -[WFDNSConfigViewController initWithStyle:](&v36, sel_initWithStyle_, [v7 tableViewStyle]);
  v9 = v8;
  if (v6)
  {
    if (v8)
    {
      v8->_originalDNSConfig = [v6 dnsConfig];
      v9->_dnsConfig = [v6 dnsConfig];
      v9->_deviceCapability = WFCurrentDeviceCapability();
      if ([v6 privacyProxyTierStatus] == 2) {
        char v10 = [v6 privacyProxyEnabled];
      }
      else {
        char v10 = 0;
      }
      v9->_shouldShowPrivacyRelayHeader = v10;
      uint64_t v11 = [v6 dnsServerAddresses];
      originalServers = v9->_originalServers;
      v9->_originalServers = (NSArray *)v11;

      v13 = [v6 dnsServerAddresses];
      uint64_t v14 = [v13 mutableCopy];
      servers = v9->_servers;
      v9->_servers = (NSMutableArray *)v14;

      if (!v9->_servers)
      {
        uint64_t v16 = [MEMORY[0x263EFF980] array];
        v17 = v9->_servers;
        v9->_servers = (NSMutableArray *)v16;
      }
      uint64_t v18 = [v6 dnsSearchDomains];
      originalDomains = v9->_originalDomains;
      v9->_originalDomains = (NSArray *)v18;

      v20 = [v6 dnsSearchDomains];
      uint64_t v21 = [v20 mutableCopy];
      domains = v9->_domains;
      v9->_domains = (NSMutableArray *)v21;

      if (!v9->_domains)
      {
        uint64_t v23 = [MEMORY[0x263EFF980] array];
        v24 = v9->_domains;
        v9->_domains = (NSMutableArray *)v23;
      }
      objc_storeStrong((id *)&v9->_appearanceProxy, a4);
      v25 = WFLogForCategory(0);
      os_log_type_t v26 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v25)
      {
        v27 = v25;
        if (os_log_type_enabled(v27, v26))
        {
          v28 = [v6 ssid];
          *(_DWORD *)buf = 138412290;
          v38 = v28;
          _os_log_impl(&dword_2257EC000, v27, v26, "show DNS config view controller for network='%@'", buf, 0xCu);
        }
      }

      v29 = WFLogForCategory(0);
      os_log_type_t v30 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v29 && os_log_type_enabled(v29, v30))
      {
        v31 = v9->_servers;
        *(_DWORD *)buf = 138412290;
        v38 = v31;
        _os_log_impl(&dword_2257EC000, v29, v30, "DNS servers='%@'", buf, 0xCu);
      }

      p_super = WFLogForCategory(0);
      os_log_type_t v33 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && p_super && os_log_type_enabled(p_super, v33))
      {
        v34 = v9->_domains;
        *(_DWORD *)buf = 138412290;
        v38 = v34;
        _os_log_impl(&dword_2257EC000, p_super, v33, "DNS domains='%@'", buf, 0xCu);
      }
    }
    else
    {
      p_super = 0;
    }
  }
  else
  {
    p_super = &v8->super.super.super.super.super;
    v9 = 0;
  }

  return v9;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)WFDNSConfigViewController;
  [(WFDNSConfigViewController *)&v20 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"kWFLocSettingsDNSConfigureTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  [(WFDNSConfigViewController *)self setTitle:v4];

  v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:3 target:self action:sel_save_];
  [(WFDNSConfigViewController *)self setSaveButton:v5];

  id v6 = [(WFDNSConfigViewController *)self saveButton];
  [v6 setEnabled:0];

  id v7 = [(WFDNSConfigViewController *)self saveButton];
  v8 = [(WFDNSConfigViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  v9 = (void *)MEMORY[0x263F829D0];
  char v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v11 = [v9 nibWithNibName:@"WFTextFieldCell" bundle:v10];

  v12 = [(WFDNSConfigViewController *)self tableView];
  [v12 registerNib:v11 forCellReuseIdentifier:@"kWFTextFieldCellIdentifier"];

  v13 = [(WFDNSConfigViewController *)self tableView];
  [v13 setAllowsSelectionDuringEditing:1];

  double v14 = *MEMORY[0x263F839B8];
  v15 = [(WFDNSConfigViewController *)self tableView];
  [v15 setRowHeight:v14];

  uint64_t v16 = [(WFDNSConfigViewController *)self tableView];
  [v16 setEstimatedRowHeight:44.0];

  v17 = [(WFDNSConfigViewController *)self tableView];
  [v17 setEstimatedSectionHeaderHeight:0.0];

  uint64_t v18 = [(WFDNSConfigViewController *)self tableView];
  [v18 setEstimatedSectionFooterHeight:0.0];

  if ([(WFDNSConfigViewController *)self dnsConfig] == 1) {
    [(WFDNSConfigViewController *)self setEditing:1];
  }
  if ([MEMORY[0x263F82670] currentIsIPad])
  {
    v19 = [(WFDNSConfigViewController *)self tableView];
    objc_msgSend(v19, "_setSectionContentInset:", 0.0, 20.0, 0.0, 20.0);
  }
}

- (int64_t)sectionNumberForSection:(int64_t)a3
{
  return self->_shouldShowPrivacyRelayHeader + a3 - 1;
}

- (int64_t)sectionForSectionNumber:(int64_t)a3
{
  if (self->_shouldShowPrivacyRelayHeader) {
    return a3;
  }
  else {
    return a3 + 1;
  }
}

- (void)save:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = [(WFDNSConfigViewController *)self saveHandler];

  if (v4)
  {
    v5 = [(WFDNSConfigViewController *)self servers];
    if ([v5 count])
    {
      id v6 = [(WFDNSConfigViewController *)self servers];
      id v7 = [v6 arrayAfterFilteringOutEmptyStrings];
    }
    else
    {
      id v7 = 0;
    }

    v8 = [(WFDNSConfigViewController *)self domains];
    if ([v8 count])
    {
      v9 = [(WFDNSConfigViewController *)self domains];
      char v10 = [v9 arrayAfterFilteringOutEmptyStrings];
    }
    else
    {
      char v10 = 0;
    }

    uint64_t v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_2257EC000, v11, v12, "saving DNS servers and domains", (uint8_t *)&v22, 2u);
    }

    v13 = WFLogForCategory(0);
    os_log_type_t v14 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, v14))
    {
      servers = self->_servers;
      int v22 = 138412290;
      uint64_t v23 = servers;
      _os_log_impl(&dword_2257EC000, v13, v14, "DNS servers='%@'", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v16 = WFLogForCategory(0);
    os_log_type_t v17 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v16 && os_log_type_enabled(v16, v17))
    {
      domains = self->_domains;
      int v22 = 138412290;
      uint64_t v23 = domains;
      _os_log_impl(&dword_2257EC000, v16, v17, "DNS domains='%@'", (uint8_t *)&v22, 0xCu);
    }

    v19 = [(WFDNSConfigViewController *)self saveHandler];
    ((void (**)(void, int64_t, void *, void *))v19)[2](v19, [(WFDNSConfigViewController *)self dnsConfig], v7, v10);
  }
  objc_super v20 = [(WFDNSConfigViewController *)self navigationController];
  id v21 = (id)[v20 popViewControllerAnimated:1];
}

- (void)_updateSaveEnabled
{
  v3 = [(WFDNSConfigViewController *)self originalServers];
  id v4 = [(WFDNSConfigViewController *)self servers];
  if ([v3 isEqualToArray:v4]
    && (int64_t v5 = [(WFDNSConfigViewController *)self dnsConfig],
        v5 == [(WFDNSConfigViewController *)self originalDNSConfig]))
  {
    id v6 = [(WFDNSConfigViewController *)self originalDomains];
    id v7 = [(WFDNSConfigViewController *)self domains];
    if ([v6 isEqualToArray:v7])
    {
      BOOL v8 = 0;
    }
    else
    {
      v9 = [(WFDNSConfigViewController *)self originalDomains];
      if (v9)
      {
        BOOL v8 = 1;
      }
      else
      {
        char v10 = [(WFDNSConfigViewController *)self domains];
        BOOL v8 = [v10 count] != 0;
      }
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  id v11 = [(WFDNSConfigViewController *)self saveButton];
  [v11 setEnabled:v8];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_shouldShowPrivacyRelayHeader) {
    return 4;
  }
  else {
    return 3;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v6 = [(WFDNSConfigViewController *)self sectionForSectionNumber:a4];
  int64_t v7 = [(WFDNSConfigViewController *)self sectionNumberForSection:1];
  if (v6 == 3)
  {
    v9 = [(WFDNSConfigViewController *)self domains];
  }
  else
  {
    if (v6 != 2)
    {
      if (v6 == 1) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 0;
      }
      goto LABEL_9;
    }
    v9 = [(WFDNSConfigViewController *)self servers];
  }
  char v10 = v9;
  uint64_t v8 = [v9 count];

LABEL_9:
  unsigned int v11 = [(WFDNSConfigViewController *)self isEditing];
  if (v7 < a4) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  return v8 + v12;
}

- (BOOL)_isChinaDevice
{
  uint64_t v2 = [(WFDNSConfigViewController *)self deviceCapability];
  return WFCapabilityIsChinaDevice(v2);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[v7 row];
  int64_t v9 = -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", [v7 section]);
  switch(v9)
  {
    case 3:
      uint64_t v16 = [(WFDNSConfigViewController *)self domains];
      if ((unint64_t)v8 >= [v16 count])
      {
        int v27 = [(WFDNSConfigViewController *)self isEditing];

        if (v27)
        {
          char v10 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
          [v10 setAccessoryType:0];
          [(WFDNSConfigViewController *)self _configCellLeadingInset];
          objc_msgSend(v10, "setLayoutMargins:", 0.0, v28, 0.0, 0.0);
          v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          os_log_type_t v30 = [v29 localizedStringForKey:@"kWFLocSettingsDNSAddSearchDomain" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
          v31 = [v10 textLabel];
          [v31 setText:v30];

          [v10 setSelectionStyle:1];
          [v10 setIndentationLevel:5];
          break;
        }
      }
      else
      {
      }
      char v10 = [v6 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v7];
      [v10 setHideLabel:1];
      objc_msgSend(v10, "setEditable:", -[WFDNSConfigViewController isEditing](self, "isEditing"));
      v32 = [(WFDNSConfigViewController *)self domains];
      os_log_type_t v33 = [v32 objectAtIndexedSubscript:v8];
      v34 = [v10 textField];
      [v34 setText:v33];

      v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      objc_super v36 = [v35 localizedStringForKey:@"kWFLocSettingsDNSSearchDomainPlaceholder" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
      v37 = [v10 textField];
      [v37 setPlaceholder:v36];

      [(WFDNSConfigViewController *)self _configCellLeadingInset];
      objc_msgSend(v10, "setLayoutMargins:", 0.0, v38, 0.0, 0.0);
      objc_initWeak(&location, self);
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __61__WFDNSConfigViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
      v50[3] = &unk_264756860;
      objc_copyWeak(v51, &location);
      v51[1] = v8;
      [v10 setTextChangeHandler:v50];
      objc_destroyWeak(v51);
      objc_destroyWeak(&location);
      break;
    case 2:
      os_log_type_t v17 = [(WFDNSConfigViewController *)self servers];
      if ((unint64_t)v8 >= [v17 count]
        && [(WFDNSConfigViewController *)self isEditing])
      {
        char v10 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:0];
        [v10 setAccessoryType:0];
        uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v19 = [v18 localizedStringForKey:@"kWFLocSettingsDNSAddServer" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        objc_super v20 = [v10 textLabel];
        [v20 setText:v19];

        [v10 setSelectionStyle:1];
        [(WFDNSConfigViewController *)self _configCellLeadingInset];
        objc_msgSend(v10, "setLayoutMargins:", 0.0, v21, 0.0, 0.0);
        [v10 setIndentationLevel:5];
      }
      else
      {
        char v10 = [v6 dequeueReusableCellWithIdentifier:@"kWFTextFieldCellIdentifier" forIndexPath:v7];
        [v10 setHideLabel:1];
        objc_msgSend(v10, "setEditable:", -[WFDNSConfigViewController isEditing](self, "isEditing"));
        int v22 = [v17 objectAtIndexedSubscript:v8];
        uint64_t v23 = [v10 textField];
        [v23 setText:v22];

        uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d.%d", 0, 0, 0, 0);
        v25 = [v10 textField];
        [v25 setPlaceholder:v24];

        [(WFDNSConfigViewController *)self _configCellLeadingInset];
        objc_msgSend(v10, "setLayoutMargins:", 0.0, v26, 0.0, 0.0);
        objc_initWeak(&location, self);
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __61__WFDNSConfigViewController_tableView_cellForRowAtIndexPath___block_invoke;
        v52[3] = &unk_264756860;
        objc_copyWeak(v53, &location);
        v53[1] = v8;
        [v10 setTextChangeHandler:v52];
        objc_destroyWeak(v53);
        objc_destroyWeak(&location);
      }

      break;
    case 1:
      char v10 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
      if ([v7 row])
      {
        if ([v7 row] != 1) {
          break;
        }
        unsigned int v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v12 = [v11 localizedStringForKey:@"kWFLocSettingsDNSConfigureManual" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v13 = [v10 textLabel];
        [v13 setText:v12];

        if ([(WFDNSConfigViewController *)self dnsConfig] == 1) {
          uint64_t v14 = 3;
        }
        else {
          uint64_t v14 = 0;
        }
        [v10 setAccessoryType:v14];
        BOOL v15 = [(WFDNSConfigViewController *)self dnsConfig] == 1;
      }
      else
      {
        uint64_t v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v40 = [v39 localizedStringForKey:@"kWFLocSettingsDNSConfigureAutomatic" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
        v41 = [v10 textLabel];
        [v41 setText:v40];

        if ([(WFDNSConfigViewController *)self dnsConfig]) {
          uint64_t v42 = 0;
        }
        else {
          uint64_t v42 = 3;
        }
        [v10 setAccessoryType:v42];
        BOOL v15 = [(WFDNSConfigViewController *)self dnsConfig] == 0;
      }
      if (v15) {
        uint64_t v43 = 3;
      }
      else {
        uint64_t v43 = 0;
      }
      [v10 setEditingAccessoryType:v43];
      break;
    default:
      char v10 = 0;
      break;
  }
  v44 = [(WFDNSConfigViewController *)self appearanceProxy];
  v45 = [v44 cellTextLabelFont];

  if (v45)
  {
    v46 = [(WFDNSConfigViewController *)self appearanceProxy];
    v47 = [v46 cellTextLabelFont];
    v48 = [v10 textLabel];
    [v48 setFont:v47];
  }
  return v10;
}

void __61__WFDNSConfigViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  unint64_t v5 = *(void *)(a1 + 40);
  id v6 = [WeakRetained servers];
  unint64_t v7 = [v6 count];

  uint64_t v8 = [WeakRetained servers];
  int64_t v9 = v8;
  if (v5 >= v7) {
    [v8 addObject:v4];
  }
  else {
    [v8 setObject:v4 atIndexedSubscript:*(void *)(a1 + 40)];
  }

  [WeakRetained _updateSaveEnabled];
}

void __61__WFDNSConfigViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  unint64_t v5 = [WeakRetained domains];
  [v5 setObject:v4 atIndexedSubscript:*(void *)(a1 + 40)];

  [WeakRetained _updateSaveEnabled];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v7 = a5;
  int64_t v8 = -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", [v7 section]);
  if (a4 != 2)
  {
    if (a4 != 1) {
      goto LABEL_17;
    }
    if (v8 == 3)
    {
      int64_t v9 = [(WFDNSConfigViewController *)self domains];
    }
    else
    {
      if (v8 != 2)
      {
LABEL_11:
        id v11 = v7;
        uint64_t v12 = [(WFDNSConfigViewController *)self tableView];
        uint64_t v13 = objc_msgSend(v12, "numberOfRowsInSection:", objc_msgSend(v11, "section"));

        if (v13 >= 1)
        {
          if ([v11 row] >= v13)
          {
            uint64_t v14 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", v13 - 1, objc_msgSend(v11, "section"));

            id v11 = (id)v14;
          }
          BOOL v15 = [(WFDNSConfigViewController *)self tableView];
          v17[0] = v11;
          uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
          [v15 deleteRowsAtIndexPaths:v16 withRowAnimation:100];

          [(WFDNSConfigViewController *)self _updateSaveEnabled];
        }

        goto LABEL_17;
      }
      int64_t v9 = [(WFDNSConfigViewController *)self servers];
    }
    char v10 = v9;
    objc_msgSend(v9, "removeObjectAtIndex:", objc_msgSend(v7, "row"));

    goto LABEL_11;
  }
  if (v8 == 3)
  {
    [(WFDNSConfigViewController *)self _addDomainAtIndexPath:v7];
  }
  else if (v8 == 2)
  {
    [(WFDNSConfigViewController *)self _addServerAtIndexPath:v7];
  }
LABEL_17:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  int64_t v8 = WFLogForCategory(0);
  os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
  {
    char v10 = v8;
    if (os_log_type_enabled(v10, v9))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v106 = [v7 section];
      __int16 v107 = 2048;
      uint64_t v108 = [v7 row];
      _os_log_impl(&dword_2257EC000, v10, v9, "tapped DNS config s=%ld r=%ld", buf, 0x16u);
    }
  }
  int64_t v11 = -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", [v7 section]);
  unint64_t v12 = [v7 row];
  int64_t v13 = [(WFDNSConfigViewController *)self sectionNumberForSection:1];
  int64_t v14 = [(WFDNSConfigViewController *)self sectionNumberForSection:2];
  int64_t v15 = [(WFDNSConfigViewController *)self sectionNumberForSection:3];
  if (v11 != 1)
  {
    os_log_type_t v30 = [(WFDNSConfigViewController *)self servers];
    if (v12 >= [v30 count] && -[WFDNSConfigViewController isEditing](self, "isEditing"))
    {
      uint64_t v31 = [v7 section];

      if (v31 == v14)
      {
        [(WFDNSConfigViewController *)self _addServerAtIndexPath:v7];
        goto LABEL_47;
      }
    }
    else
    {
    }
    v32 = [(WFDNSConfigViewController *)self domains];
    if (v12 >= [v32 count] && -[WFDNSConfigViewController isEditing](self, "isEditing"))
    {
      uint64_t v33 = [v7 section];

      if (v33 == v15)
      {
        [(WFDNSConfigViewController *)self _addDomainAtIndexPath:v7];
        goto LABEL_47;
      }
    }
    else
    {
    }
    v34 = [v6 cellForRowAtIndexPath:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v34 becomeFirstResponder];
    }
    goto LABEL_46;
  }
  if (v12 != [(WFDNSConfigViewController *)self dnsConfig])
  {
    uint64_t v16 = [(WFDNSConfigViewController *)self tableView];
    [v16 beginUpdates];

    if (v12)
    {
      if ([v7 row] != 1)
      {
LABEL_45:
        [(WFDNSConfigViewController *)self _updateSaveEnabled];
        v34 = [(WFDNSConfigViewController *)self tableView];
        [v34 endUpdates];
LABEL_46:

        goto LABEL_47;
      }
      [(WFDNSConfigViewController *)self setDnsConfig:1];
      [(WFDNSConfigViewController *)self setEditing:1 animated:1];
      os_log_type_t v17 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:v13];
      uint64_t v18 = [v6 cellForRowAtIndexPath:v17];
      [v18 setAccessoryType:0];

      v19 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:v13];
      objc_super v20 = [v6 cellForRowAtIndexPath:v19];
      [v20 setEditingAccessoryType:0];

      double v21 = [v6 cellForRowAtIndexPath:v7];
      [v21 setAccessoryType:3];

      int v22 = [v6 cellForRowAtIndexPath:v7];
      [v22 setEditingAccessoryType:3];

      uint64_t v23 = (void *)MEMORY[0x263F088C8];
      uint64_t v24 = [(WFDNSConfigViewController *)self servers];
      v25 = objc_msgSend(v23, "indexPathForRow:inSection:", objc_msgSend(v24, "count"), v14);
      double v26 = (void *)MEMORY[0x263F088C8];
      int v27 = [(WFDNSConfigViewController *)self domains];
      double v28 = objc_msgSend(v26, "indexPathForRow:inSection:", objc_msgSend(v27, "count"), v15);
      v99[1] = v28;
      v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:2];
      [v6 insertRowsAtIndexPaths:v29 withRowAnimation:100];
    }
    else
    {
      [(WFDNSConfigViewController *)self setDnsConfig:0];
      [(WFDNSConfigViewController *)self setEditing:0 animated:1];
      v35 = [(WFDNSConfigViewController *)self tableView];
      [v35 beginUpdates];

      objc_super v36 = [v6 cellForRowAtIndexPath:v7];
      [v36 setAccessoryType:3];

      v37 = [v6 cellForRowAtIndexPath:v7];
      [v37 setEditingAccessoryType:3];

      double v38 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:v13];
      uint64_t v39 = [v6 cellForRowAtIndexPath:v38];
      [v39 setAccessoryType:0];

      v40 = [MEMORY[0x263F088C8] indexPathForRow:1 inSection:v13];
      v41 = [v6 cellForRowAtIndexPath:v40];
      [v41 setEditingAccessoryType:0];

      uint64_t v42 = (void *)MEMORY[0x263F088C8];
      uint64_t v43 = [(WFDNSConfigViewController *)self servers];
      v44 = objc_msgSend(v42, "indexPathForRow:inSection:", objc_msgSend(v43, "count"), v14);
      v104[0] = v44;
      v45 = (void *)MEMORY[0x263F088C8];
      v46 = [(WFDNSConfigViewController *)self domains];
      v47 = objc_msgSend(v45, "indexPathForRow:inSection:", objc_msgSend(v46, "count"), v15);
      v104[1] = v47;
      v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:2];
      [v6 deleteRowsAtIndexPaths:v48 withRowAnimation:100];

      v49 = [(WFDNSConfigViewController *)self servers];
      unint64_t v50 = [v49 count];
      v51 = [(WFDNSConfigViewController *)self originalServers];
      unint64_t v52 = [v51 count];

      if (v50 <= v52)
      {
        v61 = [(WFDNSConfigViewController *)self servers];
        unint64_t v62 = [v61 count];
        v63 = [(WFDNSConfigViewController *)self originalServers];
        unint64_t v64 = [v63 count];

        if (v62 < v64)
        {
          v65 = [(WFDNSConfigViewController *)self servers];
          unint64_t v66 = [v65 count];

          while (1)
          {
            v67 = [(WFDNSConfigViewController *)self originalServers];
            unint64_t v68 = [v67 count];

            if (v66 >= v68) {
              break;
            }
            v69 = [MEMORY[0x263F088C8] indexPathForRow:v66 inSection:v14];
            v102 = v69;
            v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v102 count:1];
            [v6 insertRowsAtIndexPaths:v70 withRowAnimation:0];

            ++v66;
          }
        }
      }
      else
      {
        v53 = [(WFDNSConfigViewController *)self originalServers];
        unint64_t v54 = [v53 count];

        v55 = [(WFDNSConfigViewController *)self servers];
        unint64_t v56 = [v55 count];

        if (v54 < v56)
        {
          do
          {
            v57 = [MEMORY[0x263F088C8] indexPathForRow:v54 inSection:v14];
            v103 = v57;
            v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v103 count:1];
            [v6 deleteRowsAtIndexPaths:v58 withRowAnimation:0];

            ++v54;
            v59 = [(WFDNSConfigViewController *)self servers];
            unint64_t v60 = [v59 count];
          }
          while (v54 < v60);
        }
      }
      v71 = [(WFDNSConfigViewController *)self domains];
      unint64_t v72 = [v71 count];
      v73 = [(WFDNSConfigViewController *)self originalDomains];
      unint64_t v74 = [v73 count];

      if (v72 <= v74)
      {
        v81 = [(WFDNSConfigViewController *)self domains];
        unint64_t v82 = [v81 count];
        v83 = [(WFDNSConfigViewController *)self originalDomains];
        unint64_t v84 = [v83 count];

        if (v82 < v84)
        {
          v85 = [(WFDNSConfigViewController *)self domains];
          unint64_t v86 = [v85 count];

          while (1)
          {
            v87 = [(WFDNSConfigViewController *)self originalDomains];
            unint64_t v88 = [v87 count];

            if (v86 >= v88) {
              break;
            }
            v89 = [MEMORY[0x263F088C8] indexPathForRow:v86 inSection:v15];
            v100 = v89;
            v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v100 count:1];
            [v6 insertRowsAtIndexPaths:v90 withRowAnimation:0];

            ++v86;
          }
        }
      }
      else
      {
        v75 = [(WFDNSConfigViewController *)self originalDomains];
        unint64_t v76 = [v75 count];

        while (1)
        {
          v77 = [(WFDNSConfigViewController *)self domains];
          unint64_t v78 = [v77 count];

          if (v76 >= v78) {
            break;
          }
          v79 = [MEMORY[0x263F088C8] indexPathForRow:v76 inSection:v15];
          v101 = v79;
          v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v101 count:1];
          [v6 deleteRowsAtIndexPaths:v80 withRowAnimation:0];

          ++v76;
        }
      }
      v91 = [(WFDNSConfigViewController *)self originalServers];
      v92 = (void *)[v91 mutableCopy];
      [(WFDNSConfigViewController *)self setServers:v92];

      v93 = [(WFDNSConfigViewController *)self servers];

      if (!v93)
      {
        v94 = [MEMORY[0x263EFF980] array];
        [(WFDNSConfigViewController *)self setServers:v94];
      }
      v95 = [(WFDNSConfigViewController *)self originalDomains];
      v96 = (void *)[v95 mutableCopy];
      [(WFDNSConfigViewController *)self setDomains:v96];

      v97 = [(WFDNSConfigViewController *)self domains];

      if (!v97)
      {
        v98 = [MEMORY[0x263EFF980] array];
        [(WFDNSConfigViewController *)self setDomains:v98];
      }
      uint64_t v24 = [(WFDNSConfigViewController *)self tableView];
      [v24 endUpdates];
    }

    goto LABEL_45;
  }
LABEL_47:
}

- (void)_addServerAtIndexPath:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(WFDNSConfigViewController *)self servers];
  id v6 = [v5 lastObject];
  int v7 = [v6 isEqualToString:&stru_26D8F6070];

  if (v7)
  {
    objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v4, "row") - 1, objc_msgSend(v4, "section"));
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    int64_t v8 = [(WFDNSConfigViewController *)self tableView];
    os_log_type_t v9 = [v8 cellForRowAtIndexPath:v15];

    if (v9) {
      [v9 becomeFirstResponder];
    }
  }
  else
  {
    char v10 = [(WFDNSConfigViewController *)self servers];
    [v10 addObject:&stru_26D8F6070];

    int64_t v11 = [(WFDNSConfigViewController *)self tableView];
    v16[0] = v4;
    unint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v11 insertRowsAtIndexPaths:v12 withRowAnimation:100];

    [(WFDNSConfigViewController *)self _updateSaveEnabled];
    int64_t v13 = [(WFDNSConfigViewController *)self tableView];
    int64_t v14 = [v13 cellForRowAtIndexPath:v4];

    [v14 becomeFirstResponder];
  }
}

- (void)_addDomainAtIndexPath:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(WFDNSConfigViewController *)self domains];
  id v6 = [v5 lastObject];
  int v7 = [v6 isEqualToString:&stru_26D8F6070];

  if (v7)
  {
    objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v4, "row") - 1, objc_msgSend(v4, "section"));
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    int64_t v8 = [(WFDNSConfigViewController *)self tableView];
    os_log_type_t v9 = [v8 cellForRowAtIndexPath:v15];

    [v9 becomeFirstResponder];
  }
  else
  {
    char v10 = [(WFDNSConfigViewController *)self domains];
    [v10 addObject:&stru_26D8F6070];

    int64_t v11 = [(WFDNSConfigViewController *)self tableView];
    v16[0] = v4;
    unint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v11 insertRowsAtIndexPaths:v12 withRowAnimation:100];

    [(WFDNSConfigViewController *)self _updateSaveEnabled];
    int64_t v13 = [(WFDNSConfigViewController *)self tableView];
    int64_t v14 = [v13 cellForRowAtIndexPath:v4];

    [v14 becomeFirstResponder];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", [v5 section]);
  if (v6 == 1 || (int64_t v7 = v6, ![(WFDNSConfigViewController *)self isEditing]))
  {
    int64_t v11 = 0;
  }
  else if (v7 == 3)
  {
    unint64_t v13 = [v5 row];
    int64_t v14 = [(WFDNSConfigViewController *)self domains];
    LOBYTE(v13) = v13 >= [v14 count];

    if (v13) {
      int64_t v11 = 2;
    }
    else {
      int64_t v11 = 1;
    }
  }
  else if (v7 == 2 {
         && (unint64_t v8 = [v5 row],
  }
             [(WFDNSConfigViewController *)self servers],
             os_log_type_t v9 = objc_claimAutoreleasedReturnValue(),
             unint64_t v10 = [v9 count],
             v9,
             v8 >= v10))
  {
    int64_t v11 = 2;
  }
  else
  {
    int64_t v11 = 1;
  }

  return v11;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ([(WFDNSConfigViewController *)self sectionForSectionNumber:a4])
  {
    id v5 = 0;
  }
  else
  {
    BOOL v6 = [(WFDNSConfigViewController *)self _isChinaDevice];
    int64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v8 = v7;
    if (v6) {
      os_log_type_t v9 = @"kWFLocSettingsDNSPrivateRelayFooterCH";
    }
    else {
      os_log_type_t v9 = @"kWFLocSettingsDNSPrivateRelayFooter";
    }
    id v5 = [v7 localizedStringForKey:v9 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
  }
  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v4 = [(WFDNSConfigViewController *)self sectionForSectionNumber:a4];
  if (v4 == 3)
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v6 = v5;
    int64_t v7 = @"kWFLocSettingsSearchDomainsSectionHeader";
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v6 = v5;
    int64_t v7 = @"kWFLocSettingsDNSSectionHeader";
LABEL_5:
    unint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    goto LABEL_7;
  }
  unint64_t v8 = 0;
LABEL_7:
  return v8;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return -[WFDNSConfigViewController sectionForSectionNumber:](self, "sectionForSectionNumber:", objc_msgSend(a4, "section", a3)) != 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)_configCellLeadingInset
{
  uint64_t v2 = [MEMORY[0x263F82B60] mainScreen];
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

- (int64_t)originalDNSConfig
{
  return self->_originalDNSConfig;
}

- (void)setOriginalDNSConfig:(int64_t)a3
{
  self->_originalDNSConfig = a3;
}

- (int64_t)dnsConfig
{
  return self->_dnsConfig;
}

- (void)setDnsConfig:(int64_t)a3
{
  self->_dnsConfig = a3;
}

- (NSArray)originalServers
{
  return self->_originalServers;
}

- (void)setOriginalServers:(id)a3
{
}

- (NSMutableArray)servers
{
  return self->_servers;
}

- (void)setServers:(id)a3
{
}

- (NSArray)originalDomains
{
  return self->_originalDomains;
}

- (void)setOriginalDomains:(id)a3
{
}

- (NSMutableArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
}

- (WFAppearanceProxy)appearanceProxy
{
  return self->_appearanceProxy;
}

- (void)setAppearanceProxy:(id)a3
{
}

- (BOOL)shouldShowPrivacyRelayHeader
{
  return self->_shouldShowPrivacyRelayHeader;
}

- (void)setShouldShowPrivacyRelayHeader:(BOOL)a3
{
  self->_shouldShowPrivacyRelayHeader = a3;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (void)setDeviceCapability:(int64_t)a3
{
  self->_deviceCapability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceProxy, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_originalDomains, 0);
  objc_storeStrong((id *)&self->_servers, 0);
  objc_storeStrong((id *)&self->_originalServers, 0);
  objc_storeStrong(&self->_saveHandler, 0);
}

@end