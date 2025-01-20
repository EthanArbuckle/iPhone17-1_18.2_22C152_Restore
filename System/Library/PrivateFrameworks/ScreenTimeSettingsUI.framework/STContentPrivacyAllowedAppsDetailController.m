@interface STContentPrivacyAllowedAppsDetailController
- (STContentPrivacyAllowedAppsDetailController)init;
- (STRootViewModelCoordinator)coordinator;
- (id)defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4 fallbackLabel:(id)a5;
- (id)defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4 fallbackLabel:(id)a5 icon:(id)a6;
- (id)getItemSpecifierValue:(id)a3;
- (id)nameForInstalledSystemApp:(id)a3;
- (id)specifiers;
- (void)_addBlacklistAppSpecifier:(id)a3 bundleID:(id)a4;
- (void)_addBooleanAppSpecifier:(id)a3 configuration:(id)a4 key:(id)a5 bundleID:(id)a6;
- (void)dealloc;
- (void)didCancelEnteringPIN;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4;
@end

@implementation STContentPrivacyAllowedAppsDetailController

- (STContentPrivacyAllowedAppsDetailController)init
{
  v7.receiver = self;
  v7.super_class = (Class)STContentPrivacyAllowedAppsDetailController;
  v2 = [(STContentPrivacyAllowedAppsDetailController *)&v7 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"AADC_AllowedAppsAndFeaturesSpecifierName" value:&stru_26D9391A8 table:v3];
    [(STContentPrivacyAllowedAppsDetailController *)v2 setTitle:v5];
  }
  return v2;
}

- (id)specifiers
{
  v3 = [(STContentPrivacyAllowedAppsDetailController *)self coordinator];
  v4 = [v3 contentPrivacyCoordinator];
  v5 = [v4 viewModel];
  int v6 = [v5 isLoaded];

  if (v6)
  {
    objc_super v7 = +[STScreenTimeSettingsUIBundle bundle];
    v8 = objc_opt_new();
    v9 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    v10 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"AADC_AllowedAppsAndFeaturesSpecifierHeader"];
    v11 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
    v12 = [v7 localizedStringForKey:v10 value:&stru_26D9391A8 table:v11];
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [v8 addObject:v9];
    v13 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    [v8 addObject:v13];

    [(STContentPrivacyAllowedAppsDetailController *)self _addBlacklistAppSpecifier:v8 bundleID:@"com.apple.mobilemail"];
    [(STContentPrivacyAllowedAppsDetailController *)self _addBooleanAppSpecifier:v8 configuration:@"legacy.restrictions.apps" key:@"allowSafari" bundleID:@"com.apple.mobilesafari"];
    [(STContentPrivacyAllowedAppsDetailController *)self _addBooleanAppSpecifier:v8 configuration:@"legacy.restrictions.apps" key:@"allowVideoConferencing" bundleID:@"com.apple.facetime"];
    v14 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
    v15 = [v7 localizedStringForKey:@"SharePlaySpecifierName" value:&stru_26D9391A8 table:v14];
    v16 = [MEMORY[0x263F827E8] imageNamed:@"SharePlay" inBundle:v7];
    v17 = [v16 _applicationIconImageForFormat:0 precomposed:1];
    v18 = [(STContentPrivacyAllowedAppsDetailController *)self defaultSwitchSpecifierWithConfiguration:@"legacy.restrictions.apps" key:@"allowGroupActivity" fallbackLabel:v15 icon:v17];
    [v8 addObject:v18];

    [(STContentPrivacyAllowedAppsDetailController *)self _addBooleanAppSpecifier:v8 configuration:@"system.camera" key:@"allowCamera" bundleID:@"com.apple.camera"];
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      v19 = PSSiriImage();
      v20 = [(STContentPrivacyAllowedAppsDetailController *)self defaultSwitchSpecifierWithConfiguration:0x26D93CE68 key:0x26D93CF88 fallbackLabel:0 icon:v19];
      [v8 addObject:v20];
    }
    [(STContentPrivacyAllowedAppsDetailController *)self _addBlacklistAppSpecifier:v8 bundleID:@"com.apple.Passbook"];
    v21 = PSAirDropImage();
    v22 = [(STContentPrivacyAllowedAppsDetailController *)self defaultSwitchSpecifierWithConfiguration:@"system.airdrop" key:@"allowAirDrop" fallbackLabel:0 icon:v21];
    [v8 addObject:v22];

    v23 = (void *)MEMORY[0x263F827E8];
    v24 = +[STScreenTimeSettingsUIBundle bundle];
    v25 = [v23 imageNamed:@"stark" inBundle:v24];
    v26 = [(STContentPrivacyAllowedAppsDetailController *)self defaultSwitchSpecifierWithConfiguration:@"system.carplay" key:@"allowVehicleUI" fallbackLabel:0 icon:v25];
    [v8 addObject:v26];

    v27 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    [v8 addObject:v27];

    [(STContentPrivacyAllowedAppsDetailController *)self _addBooleanAppSpecifier:v8 configuration:@"legacy.restrictions.apps" key:@"allowiTunes" bundleID:@"com.apple.MobileStore"];
    [(STContentPrivacyAllowedAppsDetailController *)self _addBooleanAppSpecifier:v8 configuration:@"media.settings" key:@"allowBookstore" bundleID:@"com.apple.iBooks"];
    [(STContentPrivacyAllowedAppsDetailController *)self _addBooleanAppSpecifier:v8 configuration:@"legacy.restrictions.apps" key:@"allowPodcasts" bundleID:@"com.apple.podcasts"];
    [(STContentPrivacyAllowedAppsDetailController *)self _addBooleanAppSpecifier:v8 configuration:@"legacy.restrictions.apps" key:@"allowNews" bundleID:@"com.apple.news"];
    [(STContentPrivacyAllowedAppsDetailController *)self _addBlacklistAppSpecifier:v8 bundleID:@"com.apple.Health"];
    [(STContentPrivacyAllowedAppsDetailController *)self _addBlacklistAppSpecifier:v8 bundleID:@"com.apple.Fitness"];
    v28 = (objc_class *)[v8 copy];
    uint64_t v29 = (int)*MEMORY[0x263F5FDB8];
    v30 = *(Class *)((char *)&self->super.super.super.super.super.isa + v29);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v29) = v28;

    id v31 = *(id *)((char *)&self->super.super.super.super.super.isa + v29);
  }
  else
  {
    id v31 = (id)MEMORY[0x263EFFA68];
  }

  return v31;
}

- (id)getItemSpecifierValue:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:0x26D93CEC8];
  int v6 = [(STContentPrivacyAllowedAppsDetailController *)self coordinator];
  objc_super v7 = [v6 contentPrivacyCoordinator];
  v8 = [v7 viewModel];

  uint64_t v9 = [v5 restrictionType];
  v10 = [v8 valuesByRestriction];
  v11 = [v10 objectForKeyedSubscript:v5];
  v12 = v11;
  if (v9 == 2)
  {

    v13 = [v4 objectForKeyedSubscript:0x26D93CEE8];
    objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "containsObject:", v13) ^ 1);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = v14;
    goto LABEL_7;
  }
  if (v11)
  {
    id v14 = v11;
    v13 = v14;
    v12 = v10;
    goto LABEL_5;
  }
  v15 = [v8 defaultValueForRestriction:v5];
  v13 = 0;
  v12 = v10;
LABEL_7:

  return v15;
}

- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 objectForKeyedSubscript:0x26D93CEC8];
  uint64_t v9 = [(STContentPrivacyAllowedAppsDetailController *)self coordinator];
  v10 = [v9 contentPrivacyCoordinator];

  v11 = [v10 viewModel];
  id v12 = v6;
  v13 = v12;
  if ([v8 restrictionType] == 2)
  {
    id v14 = [v11 valuesByRestriction];
    uint64_t v15 = [v14 objectForKeyedSubscript:v8];
    v16 = (void *)v15;
    v17 = (void *)MEMORY[0x263EFFA68];
    if (v15) {
      v17 = (void *)v15;
    }
    id v18 = v17;

    v19 = [v7 objectForKeyedSubscript:0x26D93CEE8];
    v20 = [MEMORY[0x263EFF9C0] setWithArray:v18];

    if ([v12 BOOLValue]) {
      [v20 removeObject:v19];
    }
    else {
      [v20 addObject:v19];
    }
    v21 = [v20 allObjects];
    v13 = [v21 sortedArrayUsingSelector:sel_compare_];
  }
  if ([(PSListController *)self st_shouldShowPINSheetForPINSpecifier])
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke;
    v27[3] = &unk_2647677E0;
    id v28 = v10;
    id v29 = v13;
    id v30 = v8;
    id v31 = self;
    id v32 = v7;
    id v22 = v7;
    [(PSListController *)self st_showPINSheetWithCompletion:v27];

    v23 = v28;
  }
  else
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_132;
    v25[3] = &unk_264767160;
    v25[4] = self;
    id v26 = v7;
    id v24 = v7;
    [v10 saveRestrictionValue:v13 forItem:v8 completionHandler:v25];
    v23 = v26;
  }
}

void __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke(void *a1, int a2)
{
  if (a2)
  {
    v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_2;
    v6[3] = &unk_264767160;
    uint64_t v4 = a1[6];
    v5 = (void *)a1[8];
    v6[4] = a1[7];
    id v7 = v5;
    [v2 saveRestrictionValue:v3 forItem:v4 completionHandler:v6];
  }
}

uint64_t __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_2(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    v2 = [MEMORY[0x263F67088] sharedController];
    uint64_t v3 = [MEMORY[0x263F67088] sharedController];
    uint64_t v4 = [v3 viewContext];
    id v9 = 0;
    char v5 = [v2 saveContext:v4 error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0)
    {
      id v7 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_2_cold_1((uint64_t)v6, v7);
      }
    }
  }
  return [*(id *)(a1 + 32) performSelectorOnMainThread:sel_reloadSpecifier_ withObject:*(void *)(a1 + 40) waitUntilDone:0];
}

uint64_t __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_132(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    v2 = [MEMORY[0x263F67088] sharedController];
    uint64_t v3 = [MEMORY[0x263F67088] sharedController];
    uint64_t v4 = [v3 viewContext];
    id v9 = 0;
    char v5 = [v2 saveContext:v4 error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0)
    {
      id v7 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_2_cold_1((uint64_t)v6, v7);
      }
    }
  }
  return [*(id *)(a1 + 32) performSelectorOnMainThread:sel_reloadSpecifier_ withObject:*(void *)(a1 + 40) waitUntilDone:0];
}

- (id)defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4 fallbackLabel:(id)a5 icon:(id)a6
{
  id v10 = a6;
  v11 = [(STContentPrivacyAllowedAppsDetailController *)self defaultSwitchSpecifierWithConfiguration:a3 key:a4 fallbackLabel:a5];
  id v12 = v11;
  if (v10) {
    [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x263F60140]];
  }

  return v12;
}

- (id)defaultSwitchSpecifierWithConfiguration:(id)a3 key:(id)a4 fallbackLabel:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(STContentPrivacyAllowedAppsDetailController *)self coordinator];
  id v12 = [v11 contentPrivacyCoordinator];
  v13 = [v12 viewModel];
  id v14 = [v13 visibleRestrictionWithConfiguration:v10 key:v9];

  uint64_t v15 = +[STScreenTimeSettingsUIBundle restrictionsStringsTable];
  v16 = +[STScreenTimeSettingsUIBundle bundle];
  v17 = [v14 uiLabel];
  v27 = v8;
  if ([v17 length])
  {
    id v18 = [v16 localizedStringForKey:v17 value:&stru_26D9391A8 table:v15];
  }
  else
  {
    id v18 = v8;
  }
  v19 = v18;
  v20 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v18 target:self set:sel_setItemSpecifierValue_specifier_ get:sel_getItemSpecifierValue_ detail:0 cell:6 edit:0];
  v21 = NSNumber;
  id v22 = [(STContentPrivacyAllowedAppsDetailController *)self coordinator];
  v23 = [v22 contentPrivacyCoordinator];
  id v24 = [v23 viewModel];
  v25 = objc_msgSend(v21, "numberWithBool:", objc_msgSend(v24, "restrictionsEnabled"));
  [v20 setObject:v25 forKeyedSubscript:*MEMORY[0x263F600A8]];

  [v20 setObject:v14 forKeyedSubscript:0x26D93CEC8];

  return v20;
}

- (id)nameForInstalledSystemApp:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F670A8] sharedCache];
  char v5 = [v4 appInfoForBundleIdentifier:v3 localOnly:1];

  if ([v5 source] == 2)
  {
    id v6 = [v5 displayName];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_INFO, "System app %@ is not installed, not showing restriction switch", (uint8_t *)&v8, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (void)_addBooleanAppSpecifier:(id)a3 configuration:(id)a4 key:(id)a5 bundleID:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(STContentPrivacyAllowedAppsDetailController *)self nameForInstalledSystemApp:v12];
  if (v13)
  {
    id v14 = [MEMORY[0x263F67408] sharedCache];
    uint64_t v15 = [v14 imageForBundleIdentifier:v12];

    if (v15)
    {
      v16 = [(STContentPrivacyAllowedAppsDetailController *)self defaultSwitchSpecifierWithConfiguration:v10 key:v11 fallbackLabel:v13 icon:v15];
      [v17 addObject:v16];
    }
  }
}

- (void)_addBlacklistAppSpecifier:(id)a3 bundleID:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(STContentPrivacyAllowedAppsDetailController *)self nameForInstalledSystemApp:v6];
  if (v7)
  {
    int v8 = [MEMORY[0x263F67408] sharedCache];
    id v9 = [v8 imageForBundleIdentifier:v6];

    if (v9)
    {
      id v10 = [(STContentPrivacyAllowedAppsDetailController *)self defaultSwitchSpecifierWithConfiguration:@"legacy.restrictions.apps" key:@"blacklistedAppBundleIDs" fallbackLabel:v7 icon:v9];
      [v10 setObject:v6 forKeyedSubscript:0x26D93CEE8];
      [v11 addObject:v10];
    }
  }
}

- (void)dealloc
{
  id v3 = [(STRootViewModelCoordinator *)self->_coordinator contentPrivacyCoordinator];
  [v3 removeObserver:self forKeyPath:@"viewModel.isLoaded" context:@"AllowedAppsViewModelLoadedContext"];

  v4.receiver = self;
  v4.super_class = (Class)STContentPrivacyAllowedAppsDetailController;
  [(STContentPrivacyAllowedAppsDetailController *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  char v5 = (STRootViewModelCoordinator *)a3;
  coordinator = self->_coordinator;
  if (coordinator != v5)
  {
    id v9 = v5;
    id v7 = [(STRootViewModelCoordinator *)coordinator contentPrivacyCoordinator];
    [v7 removeObserver:self forKeyPath:@"viewModel.isLoaded" context:@"AllowedAppsViewModelLoadedContext"];

    objc_storeStrong((id *)&self->_coordinator, a3);
    int v8 = [(STRootViewModelCoordinator *)self->_coordinator contentPrivacyCoordinator];
    [v8 addObserver:self forKeyPath:@"viewModel.isLoaded" options:0 context:@"AllowedAppsViewModelLoadedContext"];

    char v5 = v9;
  }

  MEMORY[0x270F9A758](coordinator, v5);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"AllowedAppsViewModelLoadedContext")
  {
    id v7 = [(STContentPrivacyAllowedAppsDetailController *)self coordinator];
    int v8 = [v7 contentPrivacyCoordinator];
    id v9 = [v8 viewModel];
    int v10 = [v9 isLoaded];

    if (v10)
    {
      [(STContentPrivacyAllowedAppsDetailController *)self reloadSpecifiers];
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STContentPrivacyAllowedAppsDetailController;
    -[STContentPrivacyAllowedAppsDetailController observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)didCancelEnteringPIN
{
  [(PSListController *)self st_didCancelEnteringPIN];

  [(STContentPrivacyAllowedAppsDetailController *)self reloadSpecifiers];
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
}

void __79__STContentPrivacyAllowedAppsDetailController_setItemSpecifierValue_specifier___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "Failed to save content and privacy settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end