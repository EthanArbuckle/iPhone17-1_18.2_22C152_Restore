@interface STDisableScreenTimeGroupSpecifierProvider
- (BOOL)isHidden;
- (PSSpecifier)disableScreenTimeSpecifier;
- (STDisableScreenTimeGroupSpecifierProvider)init;
- (id)disableScreenTimeConfirmationPrompt;
- (id)passcodeGatedDeleteButtonSpecifierWithName:(id)a3 action:(SEL)a4;
- (void)confirmDisableScreenTime:(id)a3;
- (void)disableScreenTime:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setDisableScreenTimeSpecifier:(id)a3;
- (void)updateDisableScreenTimeSpecifier;
@end

@implementation STDisableScreenTimeGroupSpecifierProvider

- (id)passcodeGatedDeleteButtonSpecifierWithName:(id)a3 action:(SEL)a4
{
  v4 = [MEMORY[0x263F5FC40] deleteButtonSpecifierWithName:a3 target:self action:a4];
  [v4 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  objc_msgSend(v4, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F60228]];

  [v4 setObject:&unk_26D967060 forKeyedSubscript:*MEMORY[0x263F60320]];
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
  [v4 setObject:&unk_26D967078 forKeyedSubscript:*MEMORY[0x263F5FEF0]];
  if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
    [v4 setButtonAction:sel_showStoreDemoAlert];
  }

  return v4;
}

- (STDisableScreenTimeGroupSpecifierProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)STDisableScreenTimeGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(STGroupSpecifierProvider *)v2 setIsHidden:1];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"DisableScreenTimeButtonName" value:&stru_26D9391A8 table:0];

    v6 = [(STDisableScreenTimeGroupSpecifierProvider *)v3 passcodeGatedDeleteButtonSpecifierWithName:v5 action:sel_confirmDisableScreenTime_];
    [(STDisableScreenTimeGroupSpecifierProvider *)v3 setDisableScreenTimeSpecifier:v6];

    v7 = [(STGroupSpecifierProvider *)v3 mutableSpecifiers];
    v8 = [(STDisableScreenTimeGroupSpecifierProvider *)v3 disableScreenTimeSpecifier];
    [v7 addObject:v8];
  }
  return v3;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  v6 = v5;
  if (v5 != v4)
  {
    [v5 removeObserver:self forKeyPath:@"viewModel.canStopScreenTime" context:"STDisableScreenTimeGroupSpecifierProviderObservationContext"];
    [v6 removeObserver:self forKeyPath:@"viewModel.canStopScreenTimeWithoutPasscode" context:"STDisableScreenTimeGroupSpecifierProviderObservationContext"];
    v7.receiver = self;
    v7.super_class = (Class)STDisableScreenTimeGroupSpecifierProvider;
    [(STRootGroupSpecifierProvider *)&v7 setCoordinator:v4];
    [v4 addObserver:self forKeyPath:@"viewModel.canStopScreenTime" options:4 context:"STDisableScreenTimeGroupSpecifierProviderObservationContext"];
    [v4 addObserver:self forKeyPath:@"viewModel.canStopScreenTimeWithoutPasscode" options:4 context:"STDisableScreenTimeGroupSpecifierProviderObservationContext"];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (a6 == "STDisableScreenTimeGroupSpecifierProviderObservationContext")
  {
    [(STRootGroupSpecifierProvider *)self coordinator];

    int v11 = [v10 isEqualToString:@"viewModel.canStopScreenTime"];
    v12 = [(STRootGroupSpecifierProvider *)self coordinator];
    v13 = v12;
    if (v11)
    {
      v14 = [v12 viewModel];
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v14 canStopScreenTime] ^ 1);
    }
    else
    {

      if ([v10 isEqualToString:@"viewModel.canStopScreenTimeWithoutPasscode"]) {
        [(STDisableScreenTimeGroupSpecifierProvider *)self updateDisableScreenTimeSpecifier];
      }
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STDisableScreenTimeGroupSpecifierProvider;
    [(STDisableScreenTimeGroupSpecifierProvider *)&v15 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)confirmDisableScreenTime:(id)a3
{
  v12[4] = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  id v5 = +[STScreenTimeSettingsUIBundle bundle];
  v11[0] = *MEMORY[0x263F60018];
  v6 = [v5 localizedStringForKey:@"DisableScreenTimeButtonName" value:&stru_26D9391A8 table:0];
  v12[0] = v6;
  v11[1] = *MEMORY[0x263F60010];
  objc_super v7 = [(STDisableScreenTimeGroupSpecifierProvider *)self disableScreenTimeConfirmationPrompt];
  v12[1] = v7;
  v11[2] = *MEMORY[0x263F60008];
  v8 = [v5 localizedStringForKey:@"DisableScreenTimeButtonName" value:&stru_26D9391A8 table:0];
  v12[2] = v8;
  v11[3] = *MEMORY[0x263F5FFF8];
  v9 = [v5 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
  v12[3] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  [v4 setupWithDictionary:v10];

  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60000]];
  [v4 setTarget:self];
  [v4 setConfirmationAction:sel_disableScreenTime_];
  [(STGroupSpecifierProvider *)self showConfirmationViewForSpecifier:v4];
}

- (void)updateDisableScreenTimeSpecifier
{
  id v8 = [(STDisableScreenTimeGroupSpecifierProvider *)self disableScreenTimeSpecifier];
  v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 viewModel];
  int v5 = [v4 canStopScreenTimeWithoutPasscode];

  if (v5)
  {
    [v8 removePropertyForKey:*MEMORY[0x263F60228]];
    [v8 removePropertyForKey:*MEMORY[0x263F60320]];
    [v8 removePropertyForKey:0x26D940308];
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    objc_super v7 = NSStringFromClass(v6);
    [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x263F60228]];

    [v8 setObject:&unk_26D967060 forKeyedSubscript:*MEMORY[0x263F60320]];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
  }
}

- (id)disableScreenTimeConfirmationPrompt
{
  v2 = [(STRootGroupSpecifierProvider *)self coordinator];
  v3 = [v2 viewModel];
  id v4 = [v3 me];

  int v5 = +[STScreenTimeSettingsUIBundle bundle];
  if ([v4 isRemoteUser])
  {
    v6 = [v4 name];

    if (v6)
    {
      objc_super v7 = objc_opt_new();
      id v8 = [v4 name];
      v9 = [v7 personNameComponentsFromString:v8];

      id v10 = [v9 givenName];
      if ([v10 length])
      {
        int v11 = NSString;
        v12 = [v5 localizedStringForKey:@"DisableScreenTimeRemoteConfirmPrompt" value:&stru_26D9391A8 table:0];
        v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);

        goto LABEL_9;
      }
    }
    v14 = @"DisableScreenTimeRemoteGenericConfirmPrompt";
  }
  else
  {
    v14 = @"DisableScreenTimeConfirmPrompt";
  }
  v13 = [v5 localizedStringForKey:v14 value:&stru_26D9391A8 table:0];
LABEL_9:

  return v13;
}

- (void)disableScreenTime:(id)a3
{
  id v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v3 setScreenTimeEnabled:0 completionHandler:&__block_literal_global_8];
}

void __63__STDisableScreenTimeGroupSpecifierProvider_disableScreenTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = +[STUILog persistence];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __85__STDisableAppAndWebsiteActivityGroupSpecifierProvider_disableAppAndWebsiteActivity___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (BOOL)isHidden
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)STDisableScreenTimeGroupSpecifierProvider;
  return [(STGroupSpecifierProvider *)&v4 isHidden];
}

- (PSSpecifier)disableScreenTimeSpecifier
{
  return self->_disableScreenTimeSpecifier;
}

- (void)setDisableScreenTimeSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end