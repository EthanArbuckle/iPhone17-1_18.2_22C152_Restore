@interface STDisableAppAndWebsiteActivityGroupSpecifierProvider
- (BOOL)isHidden;
- (PSSpecifier)disableAppAndWebsiteActivitySpecifier;
- (STDisableAppAndWebsiteActivityGroupSpecifierProvider)init;
- (id)disableAppAndWebsiteActivityConfirmationPrompt;
- (id)passcodeGatedDeleteButtonSpecifierWithName:(id)a3 action:(SEL)a4;
- (void)confirmDisableAppAndWebsiteActivity:(id)a3;
- (void)disableAppAndWebsiteActivity:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setDisableAppAndWebsiteActivitySpecifier:(id)a3;
- (void)updateDisableAppAndWebsiteActivitySpecifier;
@end

@implementation STDisableAppAndWebsiteActivityGroupSpecifierProvider

- (id)passcodeGatedDeleteButtonSpecifierWithName:(id)a3 action:(SEL)a4
{
  v4 = [MEMORY[0x263F5FC40] deleteButtonSpecifierWithName:a3 target:self action:a4];
  [v4 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  objc_msgSend(v4, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F60228]];

  [v4 setObject:&unk_26D966E80 forKeyedSubscript:*MEMORY[0x263F60320]];
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
  [v4 setObject:&unk_26D966E98 forKeyedSubscript:*MEMORY[0x263F5FEF0]];
  if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
    [v4 setButtonAction:sel_showStoreDemoAlert];
  }

  return v4;
}

- (STDisableAppAndWebsiteActivityGroupSpecifierProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)STDisableAppAndWebsiteActivityGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(STGroupSpecifierProvider *)v2 setIsHidden:1];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"DisableAppAndWebsiteActivityFooterText" value:&stru_26D9391A8 table:0];
    v6 = [(STGroupSpecifierProvider *)v3 groupSpecifier];
    [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F600F8]];

    v7 = [v4 localizedStringForKey:@"DisableAppAndWebsiteActivityButtonName" value:&stru_26D9391A8 table:0];
    v8 = [(STDisableAppAndWebsiteActivityGroupSpecifierProvider *)v3 passcodeGatedDeleteButtonSpecifierWithName:v7 action:sel_confirmDisableAppAndWebsiteActivity_];
    [(STDisableAppAndWebsiteActivityGroupSpecifierProvider *)v3 setDisableAppAndWebsiteActivitySpecifier:v8];

    v9 = [(STGroupSpecifierProvider *)v3 mutableSpecifiers];
    v10 = [(STDisableAppAndWebsiteActivityGroupSpecifierProvider *)v3 disableAppAndWebsiteActivitySpecifier];
    [v9 addObject:v10];
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
    [v5 removeObserver:self forKeyPath:@"viewModel.canStopScreenTime" context:"STDisableAppAndWebsiteActivityGroupSpecifierProviderObservationContext"];
    [v6 removeObserver:self forKeyPath:@"viewModel.canStopScreenTimeWithoutPasscode" context:"STDisableAppAndWebsiteActivityGroupSpecifierProviderObservationContext"];
    v7.receiver = self;
    v7.super_class = (Class)STDisableAppAndWebsiteActivityGroupSpecifierProvider;
    [(STRootGroupSpecifierProvider *)&v7 setCoordinator:v4];
    [v4 addObserver:self forKeyPath:@"viewModel.canStopScreenTime" options:4 context:"STDisableAppAndWebsiteActivityGroupSpecifierProviderObservationContext"];
    [v4 addObserver:self forKeyPath:@"viewModel.canStopScreenTimeWithoutPasscode" options:4 context:"STDisableAppAndWebsiteActivityGroupSpecifierProviderObservationContext"];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (a6 == "STDisableAppAndWebsiteActivityGroupSpecifierProviderObservationContext")
  {
    [(STRootGroupSpecifierProvider *)self coordinator];

    int v11 = [v10 isEqualToString:@"viewModel.canStopScreenTime"];
    objc_super v12 = [(STRootGroupSpecifierProvider *)self coordinator];
    v13 = v12;
    if (v11)
    {
      v14 = [v12 viewModel];
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v14 canStopScreenTime] ^ 1);
    }
    else
    {

      if ([v10 isEqualToString:@"viewModel.canStopScreenTimeWithoutPasscode"]) {
        [(STDisableAppAndWebsiteActivityGroupSpecifierProvider *)self updateDisableAppAndWebsiteActivitySpecifier];
      }
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STDisableAppAndWebsiteActivityGroupSpecifierProvider;
    [(STDisableAppAndWebsiteActivityGroupSpecifierProvider *)&v15 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)confirmDisableAppAndWebsiteActivity:(id)a3
{
  v12[4] = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  id v5 = +[STScreenTimeSettingsUIBundle bundle];
  v11[0] = *MEMORY[0x263F60018];
  v6 = [v5 localizedStringForKey:@"DisableAppAndWebsiteActivityButtonName" value:&stru_26D9391A8 table:0];
  v12[0] = v6;
  v11[1] = *MEMORY[0x263F60010];
  objc_super v7 = [(STDisableAppAndWebsiteActivityGroupSpecifierProvider *)self disableAppAndWebsiteActivityConfirmationPrompt];
  v12[1] = v7;
  v11[2] = *MEMORY[0x263F60008];
  v8 = [v5 localizedStringForKey:@"DisableAppAndWebsiteActivityButtonName" value:&stru_26D9391A8 table:0];
  v12[2] = v8;
  v11[3] = *MEMORY[0x263F5FFF8];
  v9 = [v5 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
  v12[3] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  [v4 setupWithDictionary:v10];

  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60000]];
  [v4 setTarget:self];
  [v4 setConfirmationAction:sel_disableAppAndWebsiteActivity_];
  [(STGroupSpecifierProvider *)self showConfirmationViewForSpecifier:v4];
}

- (void)updateDisableAppAndWebsiteActivitySpecifier
{
  v3 = [(STDisableAppAndWebsiteActivityGroupSpecifierProvider *)self disableAppAndWebsiteActivitySpecifier];
  id v4 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v5 = [v4 viewModel];
  int v6 = [v5 canStopScreenTimeWithoutPasscode];

  if (v6)
  {
    [v3 removePropertyForKey:*MEMORY[0x263F60228]];
    [v3 removePropertyForKey:*MEMORY[0x263F60320]];
    [v3 removePropertyForKey:0x26D940308];
    objc_super v7 = +[STUILog persistence];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_225B06000, v7, OS_LOG_TYPE_DEFAULT, "User can disable screen time without passcode authentication. No blueprints are configured.", v10, 2u);
    }
  }
  else
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x263F60228]];

    [v3 setObject:&unk_26D966E80 forKeyedSubscript:*MEMORY[0x263F60320]];
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
  }
}

- (id)disableAppAndWebsiteActivityConfirmationPrompt
{
  v2 = [(STRootGroupSpecifierProvider *)self coordinator];
  v3 = [v2 viewModel];
  id v4 = [v3 me];

  id v5 = +[STScreenTimeSettingsUIBundle bundle];
  if ([v4 isRemoteUser])
  {
    int v6 = [v4 name];

    if (v6)
    {
      objc_super v7 = objc_opt_new();
      v8 = [v4 name];
      v9 = [v7 personNameComponentsFromString:v8];

      id v10 = [v9 givenName];
      if ([v10 length])
      {
        int v11 = NSString;
        objc_super v12 = [v5 localizedStringForKey:@"DisableAppAndWebsiteActivityRemoteConfirmPrompt" value:&stru_26D9391A8 table:0];
        v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);

        goto LABEL_9;
      }
    }
    v14 = @"DisableAppAndWebsiteActivityRemoteGenericConfirmPrompt";
  }
  else
  {
    v14 = @"DisableAppAndWebsiteActivityConfirmPrompt";
  }
  v13 = [v5 localizedStringForKey:v14 value:&stru_26D9391A8 table:0];
LABEL_9:

  return v13;
}

- (void)disableAppAndWebsiteActivity:(id)a3
{
  id v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v3 setScreenTimeEnabled:0 completionHandler:&__block_literal_global_4];
}

void __85__STDisableAppAndWebsiteActivityGroupSpecifierProvider_disableAppAndWebsiteActivity___block_invoke(uint64_t a1, void *a2)
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
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)STDisableAppAndWebsiteActivityGroupSpecifierProvider;
  return [(STGroupSpecifierProvider *)&v4 isHidden];
}

- (PSSpecifier)disableAppAndWebsiteActivitySpecifier
{
  return self->_disableAppAndWebsiteActivitySpecifier;
}

- (void)setDisableAppAndWebsiteActivitySpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

void __85__STDisableAppAndWebsiteActivityGroupSpecifierProvider_disableAppAndWebsiteActivity___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "failed to set screen time disabled: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end