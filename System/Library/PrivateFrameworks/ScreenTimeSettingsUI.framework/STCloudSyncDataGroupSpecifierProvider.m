@interface STCloudSyncDataGroupSpecifierProvider
- (PSSpecifier)toggleCloudSyncDataSpecifier;
- (STCloudSyncDataGroupSpecifierProvider)init;
- (id)cloudSyncData:(id)a3;
- (void)_updateEnabledValue;
- (void)changeCloudSyncData:(BOOL)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performHSA2RepairIfNeeded:(id)a3;
- (void)presentHSA2RepairUI:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setCloudSyncData:(id)a3 specifier:(id)a4;
- (void)setCoordinator:(id)a3;
- (void)setScreenTimeSyncing:(BOOL)a3;
@end

@implementation STCloudSyncDataGroupSpecifierProvider

- (STCloudSyncDataGroupSpecifierProvider)init
{
  v17.receiver = self;
  v17.super_class = (Class)STCloudSyncDataGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v17 init];
  v3 = v2;
  if (v2)
  {
    [(STGroupSpecifierProvider *)v2 setIsHidden:1];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"CloudSyncDataFooterText" value:&stru_26D9391A8 table:0];
    v6 = [(STGroupSpecifierProvider *)v3 groupSpecifier];
    [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x263F600F8]];

    v7 = [v4 localizedStringForKey:@"CloudSyncDataSpecifierName" value:&stru_26D9391A8 table:0];
    v8 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v7 target:v3 set:sel_setCloudSyncData_specifier_ get:sel_cloudSyncData_ detail:0 cell:6 edit:0];
    objc_msgSend(v8, "setEditPaneClass:", +[STDevicePINFactory devicePINPaneForPlatform](STDevicePINFactory, "devicePINPaneForPlatform"));
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x263F60228]];

    [v8 setObject:&unk_26D966E68 forKeyedSubscript:*MEMORY[0x263F60320]];
    uint64_t v11 = MEMORY[0x263EFFA88];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
    [v8 setObject:v11 forKeyedSubscript:0x26D940328];
    if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
      [v8 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
    }
    toggleCloudSyncDataSpecifier = v3->_toggleCloudSyncDataSpecifier;
    v3->_toggleCloudSyncDataSpecifier = (PSSpecifier *)v8;
    id v13 = v8;

    v14 = [(STGroupSpecifierProvider *)v3 mutableSpecifiers];
    [v14 addObject:v13];
    v15 = [MEMORY[0x263F53C50] sharedConnection];

    [v15 registerObserver:v3];
    [(STCloudSyncDataGroupSpecifierProvider *)v3 _updateEnabledValue];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STCloudSyncDataGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.canToggleCloudSyncData" context:"STCloudSyncDataGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"viewModel.isCloudSyncEnabled" context:"STCloudSyncDataGroupSpecifierProviderObservationContext"];
  v6.receiver = self;
  v6.super_class = (Class)STCloudSyncDataGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"viewModel.canToggleCloudSyncData" options:4 context:"STCloudSyncDataGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"viewModel.isCloudSyncEnabled" options:4 context:"STCloudSyncDataGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (a6 == "STCloudSyncDataGroupSpecifierProviderObservationContext")
  {
    [(STRootGroupSpecifierProvider *)self coordinator];

    if ([v10 isEqualToString:@"viewModel.canToggleCloudSyncData"])
    {
      if (_os_feature_enabled_impl())
      {
        uint64_t v11 = [MEMORY[0x263F53C50] sharedConnection];
        int v12 = [v11 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

        id v13 = [(STRootGroupSpecifierProvider *)self coordinator];
        v14 = [v13 viewModel];
        unsigned int v15 = [v14 canToggleCloudSyncData] ^ 1;
        if (v12 == 2) {
          uint64_t v16 = 1;
        }
        else {
          uint64_t v16 = v15;
        }
        [(STGroupSpecifierProvider *)self setIsHidden:v16];
      }
      else
      {
        id v13 = [(STRootGroupSpecifierProvider *)self coordinator];
        objc_super v17 = [v13 viewModel];
        -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v17 canToggleCloudSyncData] ^ 1);
      }
    }
    else
    {
      [(STRootGroupSpecifierProvider *)self coordinator];

      if (![v10 isEqualToString:@"viewModel.isCloudSyncEnabled"]) {
        goto LABEL_13;
      }
      id v13 = [(STGroupSpecifierProvider *)self groupSpecifier];
      [(STGroupSpecifierProvider *)self reloadSpecifier:v13 animated:1];
    }

    goto LABEL_13;
  }
  v18.receiver = self;
  v18.super_class = (Class)STCloudSyncDataGroupSpecifierProvider;
  [(STCloudSyncDataGroupSpecifierProvider *)&v18 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
LABEL_13:
}

- (void)setCloudSyncData:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STRootGroupSpecifierProvider *)self coordinator];
  if ([v8 isPasscodeEnabled]
    && ([v8 hasAlreadyEnteredPINForSession] & 1) == 0)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__STCloudSyncDataGroupSpecifierProvider_setCloudSyncData_specifier___block_invoke;
    v9[3] = &unk_264766FD8;
    v9[4] = self;
    id v10 = v6;
    [(STGroupSpecifierProvider *)self showPINSheet:v7 completion:v9];
  }
  else
  {
    -[STCloudSyncDataGroupSpecifierProvider changeCloudSyncData:](self, "changeCloudSyncData:", [v6 BOOLValue]);
  }
}

void __68__STCloudSyncDataGroupSpecifierProvider_setCloudSyncData_specifier___block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v2, "changeCloudSyncData:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
    id v4 = [*(id *)(a1 + 32) coordinator];
    [v4 setHasAlreadyEnteredPINForSession:0];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) toggleCloudSyncDataSpecifier];
    objc_msgSend(v2, "reloadSpecifier:animated:");
  }
}

- (void)changeCloudSyncData:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = self;
    BOOL v6 = v3;
  }
  else
  {
    if (v3)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __61__STCloudSyncDataGroupSpecifierProvider_changeCloudSyncData___block_invoke;
      v7[3] = &unk_264767588;
      v7[4] = self;
      BOOL v8 = v3;
      [(STCloudSyncDataGroupSpecifierProvider *)self performHSA2RepairIfNeeded:v7];
      return;
    }
    v5 = self;
    BOOL v6 = 0;
  }

  [(STCloudSyncDataGroupSpecifierProvider *)v5 setScreenTimeSyncing:v6];
}

void __61__STCloudSyncDataGroupSpecifierProvider_changeCloudSyncData___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) toggleCloudSyncDataSpecifier];
    [v2 reloadSpecifier:v5 animated:1];
  }
  else
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
    id v4 = *(void **)(a1 + 32);
    [v4 setScreenTimeSyncing:v3];
  }
}

- (void)setScreenTimeSyncing:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = (id)objc_opt_new();
    [v5 setCloudSync:v3 withCompletion:&__block_literal_global_3];
  }
  else
  {
    id v5 = [(STRootGroupSpecifierProvider *)self coordinator];
    [v5 setScreenTimeSyncingEnabled:v3 completionHandler:&__block_literal_global_57];
  }
}

void __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = +[STUILog persistence];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke_cold_1();
    }
  }
}

void __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke_55(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = +[STUILog persistence];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke_55_cold_1();
    }
  }
}

- (void)performHSA2RepairIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFD610];
  BOOL v6 = objc_msgSend(MEMORY[0x263EFD610], "remotemanagement_mirroringContainerIdentifier");
  id v7 = [v5 containerWithIdentifier:v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__STCloudSyncDataGroupSpecifierProvider_performHSA2RepairIfNeeded___block_invoke;
  v9[3] = &unk_2647675B0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 accountInfoWithCompletionHandler:v9];
}

void __67__STCloudSyncDataGroupSpecifierProvider_performHSA2RepairIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = +[STUILog persistence];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __67__STCloudSyncDataGroupSpecifierProvider_performHSA2RepairIfNeeded___block_invoke_cold_1();
    }
  }
  else if ([a2 supportsDeviceToDeviceEncryption])
  {
    id v7 = +[STUILog persistence];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_225B06000, v7, OS_LOG_TYPE_INFO, "Not performing HSA2 repair because device is already ready", (uint8_t *)v10, 2u);
    }

    BOOL v6 = *(id *)(a1 + 40);
    if (v6)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        ((void (*)(NSObject *, void))v6[2].isa)(v6, 0);
      }
      else
      {
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __STUICallCompletionHandlerOnMainThread_block_invoke;
        v10[3] = &unk_264767628;
        v9 = v6;
        id v11 = 0;
        int v12 = v9;
        dispatch_async(MEMORY[0x263EF83A0], v10);
      }
    }
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    BOOL v6 = _Block_copy(*(const void **)(a1 + 40));
    [v8 performSelectorOnMainThread:sel_presentHSA2RepairUI_ withObject:v6 waitUntilDone:0];
  }
}

- (void)presentHSA2RepairUI:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  BOOL v6 = objc_msgSend(v5, "aida_accountForPrimaryiCloudAccount");
  id v7 = objc_msgSend(v6, "aa_altDSID");

  id v8 = (void *)[objc_alloc(MEMORY[0x263F34A18]) initWithAltDSID:v7];
  v9 = +[STScreenTimeSettingsUIBundle bundle];
  id v10 = [v9 localizedStringForKey:@"CloudSyncDataFeatureName" value:&stru_26D9391A8 table:0];
  [v8 setFeatureName:v10];

  id v11 = [[STSpinnerViewController alloc] initWithNibName:0 bundle:0];
  int v12 = +[STUILog persistence];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, v12, OS_LOG_TYPE_DEFAULT, "Performing HSA2 repair", buf, 2u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke;
  v16[3] = &unk_264767600;
  id v17 = v8;
  objc_super v18 = v11;
  v19 = self;
  id v20 = v4;
  id v13 = v4;
  v14 = v11;
  id v15 = v8;
  [(STGroupSpecifierProvider *)self presentViewController:v14 animated:1 completion:v16];
}

void __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentingViewController:*(void *)(a1 + 40)];
  id v2 = (void *)[objc_alloc(MEMORY[0x263F34A20]) initWithContext:*(void *)(a1 + 32)];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke_2;
  v5[3] = &unk_2647675D8;
  int8x16_t v4 = *(int8x16_t *)(a1 + 40);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  id v7 = *(id *)(a1 + 56);
  [v2 performDeviceToDeviceEncryptionStateRepairWithCompletion:v5];
}

void __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1];
  if (v4)
  {
    id v5 = +[STUILog persistence];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)cloudSyncData:(id)a3
{
  id v3 = NSNumber;
  id v4 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v5 = [v4 viewModel];
  int8x16_t v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "isCloudSyncEnabled"));

  return v6;
}

- (void)_updateEnabledValue
{
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v4 = [v3 effectiveBoolValueForSetting:*MEMORY[0x263F53710]] != 2;

  id v6 = [NSNumber numberWithBool:v4];
  id v5 = [(STCloudSyncDataGroupSpecifierProvider *)self toggleCloudSyncDataSpecifier];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F600A8]];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  [(STCloudSyncDataGroupSpecifierProvider *)self _updateEnabledValue];
  id v5 = [(STCloudSyncDataGroupSpecifierProvider *)self toggleCloudSyncDataSpecifier];
  [(STGroupSpecifierProvider *)self reloadSpecifier:v5 animated:1];

  if (_os_feature_enabled_impl())
  {
    id v6 = [MEMORY[0x263F53C50] sharedConnection];
    int v7 = [v6 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    id v11 = [(STRootGroupSpecifierProvider *)self coordinator];
    id v8 = [v11 viewModel];
    unsigned int v9 = [v8 canToggleCloudSyncData] ^ 1;
    if (v7 == 2) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v9;
    }
    [(STGroupSpecifierProvider *)self setIsHidden:v10];
  }
}

- (PSSpecifier)toggleCloudSyncDataSpecifier
{
  return self->_toggleCloudSyncDataSpecifier;
}

- (void).cxx_destruct
{
}

void __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failed to enabled cloud sync: %{public}@", v2, v3, v4, v5, v6);
}

void __62__STCloudSyncDataGroupSpecifierProvider_setScreenTimeSyncing___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "failed to toggle screen time syncing: %{public}@", v2, v3, v4, v5, v6);
}

void __67__STCloudSyncDataGroupSpecifierProvider_performHSA2RepairIfNeeded___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failed to fetch CloudKit account: %{public}@", v2, v3, v4, v5, v6);
}

void __61__STCloudSyncDataGroupSpecifierProvider_presentHSA2RepairUI___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225B06000, v0, OS_LOG_TYPE_ERROR, "Failed to perform HSA2 repair: %{public}@", v1, 0xCu);
}

@end