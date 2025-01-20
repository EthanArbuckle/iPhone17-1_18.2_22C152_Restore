@interface STStopSharingScreenTimeGroupSpecifierProvider
- (PSSpecifier)stopSharingScreenTimeSpecifier;
- (STStopSharingScreenTimeGroupSpecifierProvider)init;
- (id)stopSharingScreenTimeButtonName;
- (id)stopSharingScreenTimeConfirmationPrompt;
- (id)stopSharingScreenTimeFooterText;
- (void)confirmStopSharingScreenTime:(id)a3;
- (void)dealloc;
- (void)disableManagement:(id)a3;
- (void)disableScreenTime:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setCoordinator:(id)a3;
- (void)setStopSharingScreenTimeSpecifier:(id)a3;
- (void)updateStopSharingScreenTimeSpecifier;
@end

@implementation STStopSharingScreenTimeGroupSpecifierProvider

- (STStopSharingScreenTimeGroupSpecifierProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)STStopSharingScreenTimeGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(STGroupSpecifierProvider *)v2 setIsHidden:1];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"StopSharingScreenTimeButtonName" value:&stru_26D9391A8 table:0];

    v6 = [MEMORY[0x263F5FC40] deleteButtonSpecifierWithName:v5 target:v3 action:sel_confirmStopSharingScreenTime_];
    [v6 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v6, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x263F60228]];

      [v6 setObject:&unk_26D9673C0 forKeyedSubscript:*MEMORY[0x263F60320]];
      [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
    }
    [v6 setObject:&unk_26D9673D8 forKeyedSubscript:*MEMORY[0x263F5FEF0]];
    [(STStopSharingScreenTimeGroupSpecifierProvider *)v3 setStopSharingScreenTimeSpecifier:v6];
    v9 = [(STGroupSpecifierProvider *)v3 mutableSpecifiers];
    [v9 addObject:v6];
    v10 = [MEMORY[0x263F53C50] sharedConnection];
    [v10 registerObserver:v3];
  }
  return v3;
}

- (void)dealloc
{
  v5.receiver = self;
  v5.super_class = (Class)STStopSharingScreenTimeGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v5 invalidate];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STStopSharingScreenTimeGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.canStopSharingScreenTime" context:@"STStopSharingScreenTimeGroupSpecifierProviderObservationContext"];
  if (_os_feature_enabled_impl()) {
    [v5 removeObserver:self forKeyPath:@"viewModel.me.isRemoteUser" context:@"STStopSharingScreenTimeGroupSpecifierProviderObservationContext"];
  }
  v6.receiver = self;
  v6.super_class = (Class)STStopSharingScreenTimeGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"viewModel.canStopSharingScreenTime" options:4 context:@"STStopSharingScreenTimeGroupSpecifierProviderObservationContext"];
  if (_os_feature_enabled_impl()) {
    [v4 addObserver:self forKeyPath:@"viewModel.me.isRemoteUser" options:4 context:@"STStopSharingScreenTimeGroupSpecifierProviderObservationContext"];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (a6 == @"STStopSharingScreenTimeGroupSpecifierProviderObservationContext")
  {
    [(STRootGroupSpecifierProvider *)self coordinator];

    int v11 = [v10 isEqualToString:@"viewModel.canStopSharingScreenTime"];
    int v12 = _os_feature_enabled_impl();
    if (v11)
    {
      if (v12)
      {
        v13 = [MEMORY[0x263F53C50] sharedConnection];
        int v14 = [v13 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

        v15 = [(STRootGroupSpecifierProvider *)self coordinator];
        v16 = [v15 viewModel];
        unsigned int v17 = [v16 canStopSharingScreenTime] ^ 1;
        if (v14 == 2) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = v17;
        }
        [(STGroupSpecifierProvider *)self setIsHidden:v18];
      }
      else
      {
        v15 = [(STRootGroupSpecifierProvider *)self coordinator];
        v19 = [v15 viewModel];
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v19 canStopSharingScreenTime] ^ 1);
      }
    }
    else if (v12)
    {
      [(STRootGroupSpecifierProvider *)self coordinator];

      if ([v10 isEqualToString:@"viewModel.me.isRemoteUser"]) {
        [(STStopSharingScreenTimeGroupSpecifierProvider *)self updateStopSharingScreenTimeSpecifier];
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)STStopSharingScreenTimeGroupSpecifierProvider;
    [(STStopSharingScreenTimeGroupSpecifierProvider *)&v20 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    objc_super v5 = [MEMORY[0x263F53C50] sharedConnection];
    int v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    id v10 = [(STRootGroupSpecifierProvider *)self coordinator];
    v7 = [v10 viewModel];
    unsigned int v8 = [v7 canStopSharingScreenTime] ^ 1;
    if (v6 == 2) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    [(STGroupSpecifierProvider *)self setIsHidden:v9];
  }
}

- (void)confirmStopSharingScreenTime:(id)a3
{
  v23[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_super v5 = objc_opt_new();
    int v6 = +[STScreenTimeSettingsUIBundle bundle];
    v22[0] = *MEMORY[0x263F60018];
    v7 = [(STStopSharingScreenTimeGroupSpecifierProvider *)self stopSharingScreenTimeButtonName];
    v23[0] = v7;
    v22[1] = *MEMORY[0x263F60010];
    unsigned int v8 = [(STStopSharingScreenTimeGroupSpecifierProvider *)self stopSharingScreenTimeConfirmationPrompt];
    v23[1] = v8;
    v22[2] = *MEMORY[0x263F60008];
    uint64_t v9 = [(STStopSharingScreenTimeGroupSpecifierProvider *)self stopSharingScreenTimeButtonName];
    v23[2] = v9;
    v22[3] = *MEMORY[0x263F5FFF8];
    id v10 = [v6 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
    v23[3] = v10;
    int v11 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    [v5 setupWithDictionary:v11];

    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60000]];
    [v5 setTarget:self];
    [v5 setConfirmationAction:sel_disableManagement_];
    [(STGroupSpecifierProvider *)self showConfirmationViewForSpecifier:v5];
  }
  else
  {
    objc_super v5 = +[STScreenTimeSettingsUIBundle bundle];
    int v12 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v13 = objc_msgSend(v12, "sf_isiPad");

    int v6 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:v13];
    int v14 = (void *)MEMORY[0x263F82400];
    v15 = [v5 localizedStringForKey:@"StopSharingScreenTimeButtonName" value:&stru_26D9391A8 table:0];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __78__STStopSharingScreenTimeGroupSpecifierProvider_confirmStopSharingScreenTime___block_invoke;
    v20[3] = &unk_264767368;
    v20[4] = self;
    id v21 = v4;
    v16 = [v14 actionWithTitle:v15 style:2 handler:v20];
    [v6 addAction:v16];

    unsigned int v17 = (void *)MEMORY[0x263F82400];
    uint64_t v18 = [v5 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
    v19 = [v17 actionWithTitle:v18 style:1 handler:0];
    [v6 addAction:v19];

    [(STGroupSpecifierProvider *)self presentViewController:v6 animated:1 completion:0];
  }
}

uint64_t __78__STStopSharingScreenTimeGroupSpecifierProvider_confirmStopSharingScreenTime___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) disableScreenTime:*(void *)(a1 + 40)];
}

- (id)stopSharingScreenTimeConfirmationPrompt
{
  v2 = [(STRootGroupSpecifierProvider *)self coordinator];
  v3 = [v2 viewModel];
  id v4 = [v3 me];

  objc_super v5 = +[STScreenTimeSettingsUIBundle bundle];
  if ([v4 isRemoteUser])
  {
    int v6 = [v4 name];

    if (v6)
    {
      v7 = objc_opt_new();
      unsigned int v8 = [v4 name];
      uint64_t v9 = [v7 personNameComponentsFromString:v8];

      id v10 = [v9 givenName];
      if ([v10 length])
      {
        int v11 = NSString;
        int v12 = [v5 localizedStringForKey:@"StopSharingScreenTimeRemoteFooterText" value:&stru_26D9391A8 table:0];
        uint64_t v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);

        goto LABEL_9;
      }
    }
    int v14 = @"StopSharingScreenTimeRemoteGenericFooterText";
  }
  else
  {
    int v14 = @"StopSharingScreenTimeFooterText";
  }
  uint64_t v13 = [v5 localizedStringForKey:v14 value:&stru_26D9391A8 table:0];
LABEL_9:

  return v13;
}

- (void)updateStopSharingScreenTimeSpecifier
{
  id v15 = [(STStopSharingScreenTimeGroupSpecifierProvider *)self stopSharingScreenTimeSpecifier];
  v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 viewModel];
  objc_super v5 = [v4 me];
  char v6 = [v5 isRemoteUser];

  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    unsigned int v8 = NSStringFromClass(v7);
    [v15 setObject:v8 forKeyedSubscript:*MEMORY[0x263F60228]];

    [v15 setObject:&unk_26D9673C0 forKeyedSubscript:*MEMORY[0x263F60320]];
    [v15 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
  }
  else
  {
    [v15 removePropertyForKey:*MEMORY[0x263F60228]];
    [v15 removePropertyForKey:*MEMORY[0x263F60320]];
    [v15 removePropertyForKey:0x26D940308];
  }
  uint64_t v9 = [(STStopSharingScreenTimeGroupSpecifierProvider *)self stopSharingScreenTimeButtonName];
  id v10 = [v15 name];
  if (([v10 isEqualToString:v9] & 1) == 0) {
    [v15 setName:v9];
  }
  if (_os_feature_enabled_impl())
  {
    int v11 = [(STStopSharingScreenTimeGroupSpecifierProvider *)self stopSharingScreenTimeFooterText];
    int v12 = [(STGroupSpecifierProvider *)self groupSpecifier];
    uint64_t v13 = *MEMORY[0x263F600F8];
    int v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F600F8]];
    if (([v14 isEqualToString:v11] & 1) == 0)
    {
      [v12 setObject:v11 forKeyedSubscript:v13];
      [(STGroupSpecifierProvider *)self reloadSpecifier:v12 animated:1];
    }
  }
}

- (id)stopSharingScreenTimeButtonName
{
  v2 = [(STRootGroupSpecifierProvider *)self coordinator];
  uint64_t v3 = [v2 viewModel];
  id v4 = [(id)v3 me];

  LOBYTE(v3) = [v4 isRemoteUser];
  objc_super v5 = +[STScreenTimeSettingsUIBundle bundle];
  if (v3)
  {
    char v6 = [v4 name];

    if (v6)
    {
      v7 = objc_opt_new();
      unsigned int v8 = [v4 name];
      uint64_t v9 = [v7 personNameComponentsFromString:v8];

      id v10 = [v9 givenName];
      if ([v10 length])
      {
        int v11 = NSString;
        int v12 = [v5 localizedStringForKey:@"StopSharingScreenTimeRemoteButtonName" value:&stru_26D9391A8 table:0];
        uint64_t v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);

        goto LABEL_9;
      }
    }
    int v14 = @"StopSharingScreenTimeRemoteGenericButtonName";
  }
  else
  {
    int v14 = @"StopSharingScreenTimeButtonName";
  }
  uint64_t v13 = [v5 localizedStringForKey:v14 value:&stru_26D9391A8 table:0];
LABEL_9:

  return v13;
}

- (id)stopSharingScreenTimeFooterText
{
  v2 = [(STRootGroupSpecifierProvider *)self coordinator];
  uint64_t v3 = [v2 viewModel];
  id v4 = [(id)v3 me];

  LOBYTE(v3) = [v4 isRemoteUser];
  objc_super v5 = +[STScreenTimeSettingsUIBundle bundle];
  if (v3)
  {
    char v6 = [v4 name];

    if (v6)
    {
      v7 = objc_opt_new();
      unsigned int v8 = [v4 name];
      uint64_t v9 = [v7 personNameComponentsFromString:v8];

      id v10 = [v9 givenName];
      if ([v10 length])
      {
        int v11 = NSString;
        int v12 = [v5 localizedStringForKey:@"StopSharingScreenTimeRemoteFooterText" value:&stru_26D9391A8 table:0];
        uint64_t v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);

        goto LABEL_9;
      }
    }
    int v14 = @"StopSharingScreenTimeRemoteGenericFooterText";
  }
  else
  {
    int v14 = @"StopSharingScreenTimeFooterText";
  }
  uint64_t v13 = [v5 localizedStringForKey:v14 value:&stru_26D9391A8 table:0];
LABEL_9:

  return v13;
}

- (void)disableManagement:(id)a3
{
  id v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v3 setManagementEnabled:0 completionHandler:&__block_literal_global_18];
}

void __67__STStopSharingScreenTimeGroupSpecifierProvider_disableManagement___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __67__STStopSharingScreenTimeGroupSpecifierProvider_disableManagement___block_invoke_cold_1((uint64_t)v2);
  }
}

- (void)disableScreenTime:(id)a3
{
  id v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v3 setScreenTimeEnabled:0 completionHandler:&__block_literal_global_63];
}

void __67__STStopSharingScreenTimeGroupSpecifierProvider_disableScreenTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __67__STStopSharingScreenTimeGroupSpecifierProvider_disableScreenTime___block_invoke_cold_1((uint64_t)v2);
  }
}

- (PSSpecifier)stopSharingScreenTimeSpecifier
{
  return self->_stopSharingScreenTimeSpecifier;
}

- (void)setStopSharingScreenTimeSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

void __67__STStopSharingScreenTimeGroupSpecifierProvider_disableManagement___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to set management disabled: %{public}@", (uint8_t *)&v1, 0xCu);
}

void __67__STStopSharingScreenTimeGroupSpecifierProvider_disableScreenTime___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to set screen time disabled: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end