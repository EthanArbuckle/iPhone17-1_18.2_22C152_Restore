@interface STEnableRemoteManagementGroupSpecifierProvider
+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4;
- (BOOL)isHidden;
- (PSSpecifier)enableRemoteManagementSpecifier;
- (STEnableRemoteManagementGroupSpecifierProvider)init;
- (UIViewController)rootViewController;
- (id)enableRemoteManagementButtonName;
- (id)enableRemoteManagementFooterText;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setCoordinator:(id)a3;
- (void)setEnableRemoteManagementSpecifier:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)showChildOnboardingFlow:(id)a3;
@end

@implementation STEnableRemoteManagementGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4
{
  id v5 = a4;
  v6 = +[STRootGroupSpecifierProvider providerWithCoordinator:a3];
  [v6 setRootViewController:v5];

  return v6;
}

- (STEnableRemoteManagementGroupSpecifierProvider)init
{
  v13.receiver = self;
  v13.super_class = (Class)STEnableRemoteManagementGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F53C50] sharedConnection];
    BOOL v4 = [v3 effectiveBoolValueForSetting:*MEMORY[0x263F53890]] != 2;

    id v5 = +[STScreenTimeSettingsUIBundle bundle];
    v6 = [v5 localizedStringForKey:@"EnableRemoteManagementGenericButtonName" value:&stru_26D9391A8 table:0];

    uint64_t v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v6 target:v2 set:0 get:0 detail:0 cell:13 edit:0];
    enableRemoteManagementSpecifier = v2->_enableRemoteManagementSpecifier;
    v2->_enableRemoteManagementSpecifier = (PSSpecifier *)v7;

    [(PSSpecifier *)v2->_enableRemoteManagementSpecifier setButtonAction:sel_showChildOnboardingFlow_];
    v9 = [NSNumber numberWithInt:v4];
    [(PSSpecifier *)v2->_enableRemoteManagementSpecifier setObject:v9 forKeyedSubscript:*MEMORY[0x263F600A8]];

    v10 = [(STGroupSpecifierProvider *)v2 mutableSpecifiers];
    [v10 addObject:v2->_enableRemoteManagementSpecifier];
    v11 = [MEMORY[0x263F53C50] sharedConnection];
    [v11 registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STEnableRemoteManagementGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.isRemoteUnmanagedChild" context:"STEnableRemoteManagementGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"viewModel.me" context:"STEnableRemoteManagementGroupSpecifierProviderObservationContext"];
  v6.receiver = self;
  v6.super_class = (Class)STEnableRemoteManagementGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"viewModel.me" options:4 context:"STEnableRemoteManagementGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"viewModel.isRemoteUnmanagedChild" options:4 context:"STEnableRemoteManagementGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (a6 == "STEnableRemoteManagementGroupSpecifierProviderObservationContext")
  {
    v11 = [MEMORY[0x263F53C50] sharedConnection];
    int v12 = [v11 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    if ([v10 isEqualToString:@"viewModel.isRemoteUnmanagedChild"])
    {
      if (v12 == 2)
      {
        [(STGroupSpecifierProvider *)self setIsHidden:0];
        goto LABEL_17;
      }
      objc_super v13 = [(STRootGroupSpecifierProvider *)self coordinator];
      v14 = [v13 viewModel];
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v14 isRemoteUnmanagedChild] ^ 1);
    }
    else
    {
      if (![v10 isEqualToString:@"viewModel.me"]) {
        goto LABEL_17;
      }
      objc_super v13 = [(STEnableRemoteManagementGroupSpecifierProvider *)self enableRemoteManagementButtonName];
      v14 = [(STEnableRemoteManagementGroupSpecifierProvider *)self enableRemoteManagementSpecifier];
      v15 = [v14 name];
      if (([v15 isEqualToString:v13] & 1) == 0) {
        [v14 setName:v13];
      }
      if (v12 == 2)
      {
        v16 = +[STScreenTimeSettingsUIBundle bundle];
        v17 = [v16 localizedStringForKey:@"ScreenTimeRestrictedFooterText" value:&stru_26D9391A8 table:0];
      }
      else
      {
        v17 = [(STEnableRemoteManagementGroupSpecifierProvider *)self enableRemoteManagementFooterText];
      }
      v18 = [(STGroupSpecifierProvider *)self groupSpecifier];
      uint64_t v19 = *MEMORY[0x263F600F8];
      v20 = [v18 objectForKeyedSubscript:*MEMORY[0x263F600F8]];
      if (([v20 isEqualToString:v17] & 1) == 0)
      {
        [v18 setObject:v17 forKeyedSubscript:v19];
        [(STGroupSpecifierProvider *)self reloadSpecifier:v18 animated:1];
      }
    }
    goto LABEL_17;
  }
  v21.receiver = self;
  v21.super_class = (Class)STEnableRemoteManagementGroupSpecifierProvider;
  [(STEnableRemoteManagementGroupSpecifierProvider *)&v21 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
LABEL_17:
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", a3, a4);
  int v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

  if (v6 == 2)
  {
    uint64_t v7 = +[STScreenTimeSettingsUIBundle bundle];
    id v15 = [v7 localizedStringForKey:@"ScreenTimeRestrictedFooterText" value:&stru_26D9391A8 table:0];
  }
  else
  {
    id v15 = [(STEnableRemoteManagementGroupSpecifierProvider *)self enableRemoteManagementFooterText];
  }
  v8 = [(STGroupSpecifierProvider *)self groupSpecifier];
  uint64_t v9 = *MEMORY[0x263F600F8];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F600F8]];
  if (([v10 isEqualToString:v15] & 1) == 0)
  {
    [v8 setObject:v15 forKeyedSubscript:v9];
    [(STGroupSpecifierProvider *)self reloadSpecifier:v8 animated:1];
  }
  v11 = [(STEnableRemoteManagementGroupSpecifierProvider *)self enableRemoteManagementSpecifier];
  uint64_t v12 = *MEMORY[0x263F600A8];
  objc_super v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F600A8]];
  if ((((v6 == 2) ^ [v13 BOOLValue]) & 1) == 0)
  {
    v14 = [NSNumber numberWithInt:v6 != 2];
    [v11 setObject:v14 forKeyedSubscript:v12];

    [(STGroupSpecifierProvider *)self reloadSpecifier:v11 animated:1];
  }
}

- (id)enableRemoteManagementButtonName
{
  v2 = [(STRootGroupSpecifierProvider *)self coordinator];
  v3 = [v2 viewModel];
  id v4 = [v3 me];

  id v5 = +[STScreenTimeSettingsUIBundle bundle];
  int v6 = [v4 name];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    v8 = [v4 name];
    uint64_t v9 = [v7 personNameComponentsFromString:v8];

    id v10 = [v9 givenName];
    if ([v10 length])
    {
      v11 = NSString;
      uint64_t v12 = [v5 localizedStringForKey:@"EnableRemoteManagementButtonName" value:&stru_26D9391A8 table:0];
      objc_super v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);

      goto LABEL_6;
    }
  }
  objc_super v13 = [v5 localizedStringForKey:@"EnableRemoteManagementGenericButtonName" value:&stru_26D9391A8 table:0];
LABEL_6:

  return v13;
}

- (id)enableRemoteManagementFooterText
{
  v2 = [(STRootGroupSpecifierProvider *)self coordinator];
  v3 = [v2 viewModel];
  id v4 = [v3 me];

  id v5 = +[STScreenTimeSettingsUIBundle bundle];
  int v6 = [v4 name];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    v8 = [v4 name];
    uint64_t v9 = [v7 personNameComponentsFromString:v8];

    id v10 = [v9 givenName];
    if ([v10 length])
    {
      v11 = NSString;
      uint64_t v12 = [v5 localizedStringForKey:@"EnableRemoteManagementFooterText" value:&stru_26D9391A8 table:0];
      objc_super v13 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);

      goto LABEL_6;
    }
  }
  objc_super v13 = [v5 localizedStringForKey:@"EnableRemoteManagementGenericFooterText" value:&stru_26D9391A8 table:0];
LABEL_6:

  return v13;
}

- (void)showChildOnboardingFlow:(id)a3
{
  id v4 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v4 setHasShownMiniBuddy:1];
  id v5 = [[STIntroductionController alloc] initWithNewUserRootViewModelCoordinator:v4];
  int v6 = [v4 viewModel];
  uint64_t v7 = [v6 me];
  char v8 = [v7 isRemoteUser];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  objc_super v13 = __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke;
  v14 = &unk_2647672C8;
  id v15 = v4;
  char v16 = v8;
  id v9 = v4;
  [(STIntroductionController *)v5 setCompletionBlock:&v11];
  id v10 = [(STEnableRemoteManagementGroupSpecifierProvider *)self rootViewController];
  [(STIntroductionController *)v5 presentOverViewController:v10];
}

void __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    char v8 = [v5 parentalControlsPasscode];
    id v9 = [v6 recoveryAltDSID];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2;
    v10[3] = &unk_2647672A0;
    char v13 = *(unsigned char *)(a1 + 40);
    id v11 = v6;
    id v12 = *(id *)(a1 + 32);
    [v7 enableManagementWithPIN:v8 recoveryAltDSID:v9 completionHandler:v10];
  }
}

void __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[STUILog budgets];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2_cold_1((uint64_t)v3, v4);
    }
  }
  if (*(unsigned char *)(a1 + 48) || [*(id *)(a1 + 32) deviceForChild]) {
    [*(id *)(a1 + 40) applyIntroductionViewModel:*(void *)(a1 + 32) withCompletionHandler:0];
  }
}

- (BOOL)isHidden
{
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)STEnableRemoteManagementGroupSpecifierProvider;
  return [(STGroupSpecifierProvider *)&v4 isHidden];
}

- (PSSpecifier)enableRemoteManagementSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnableRemoteManagementSpecifier:(id)a3
{
}

- (UIViewController)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setRootViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootViewController);

  objc_storeStrong((id *)&self->_enableRemoteManagementSpecifier, 0);
}

void __74__STEnableRemoteManagementGroupSpecifierProvider_showChildOnboardingFlow___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "failed to set management enabled: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end