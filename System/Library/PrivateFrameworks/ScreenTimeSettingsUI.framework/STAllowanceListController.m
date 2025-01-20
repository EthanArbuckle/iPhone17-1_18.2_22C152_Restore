@interface STAllowanceListController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldShowConfirmDeletionAlert;
- (NSArray)allowanceSpecifiers;
- (NSDictionary)allowanceSpecifiersByBundleIdentifier;
- (PSSpecifier)enableAllAllowancesSpecifier;
- (PSSpecifier)informativeTextGroupSpecifier;
- (STAllowanceListController)init;
- (STRootViewModelCoordinator)coordinator;
- (id)_allAllowancesEnabled:(id)a3;
- (id)_informativeTextWithDevices:(id)a3 hasWatchOSDevices:(BOOL)a4;
- (id)_specifierForAllowance:(id)a3;
- (id)_subtitleTextForAllowance:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_adjustCellHeightForAllowanceSpecifier:(id)a3;
- (void)_allowancesDidChange;
- (void)_devicesDidChange:(id)a3 coordinator:(id)a4;
- (void)_didFetchAppInfo:(id)a3;
- (void)_hasWatchOSDevicesDidChange:(BOOL)a3 coordinator:(id)a4;
- (void)_reloadInformativeTextGroupSpecifierIfNeeded:(id)a3;
- (void)_setAllAllowancesEnabled:(id)a3 specifier:(id)a4;
- (void)_showAllowanceDetailController:(id)a3;
- (void)_showConfirmDeletionView:(id)a3;
- (void)addAllowance:(id)a3;
- (void)allowanceDetailController:(id)a3 didDeleteAllowance:(id)a4;
- (void)allowanceDetailController:(id)a3 didSaveAllowance:(id)a4;
- (void)confirmDeletion:(id)a3;
- (void)dealloc;
- (void)deleteAllowance:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllowanceSpecifiers:(id)a3;
- (void)setAllowanceSpecifiersByBundleIdentifier:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setEnableAllAllowancesSpecifier:(id)a3;
- (void)setInformativeTextGroupSpecifier:(id)a3;
- (void)setShouldShowConfirmDeletionAlert:(BOOL)a3;
- (void)showStoreDemoAlert;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STAllowanceListController

- (STAllowanceListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)STAllowanceListController;
  v2 = [(STPINListViewController *)&v6 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle bundle];
    v4 = [v3 localizedStringForKey:@"AppLimitsSpecifierName" value:&stru_26D9391A8 table:0];
    [(STAllowanceListController *)v2 setTitle:v4];
  }
  return v2;
}

- (void)dealloc
{
  [(STRootViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.allowancesByIdentifier" context:"STAllowanceObservationContext"];
  [(STRootViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"viewModel.hasWatchOSDevices" context:"STAllowanceObservationContext"];
  [(STRootViewModelCoordinator *)self->_coordinator removeObserver:self forKeyPath:@"usageDetailsCoordinator.devices" context:"STAllowanceObservationContext"];
  v3.receiver = self;
  v3.super_class = (Class)STAllowanceListController;
  [(STListViewController *)&v3 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)STAllowanceListController;
  [(STPINListViewController *)&v16 viewDidAppear:a3];
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.ScreenTime/APP_LIMITS"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  objc_super v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"AppLimitsSpecifierName" table:@"Localizable" locale:v6 bundleURL:v8];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  v11 = [MEMORY[0x263EFF960] currentLocale];
  v12 = +[STScreenTimeSettingsUIBundle bundle];
  v13 = [v12 bundleURL];
  v14 = (void *)[v10 initWithKey:@"ScreenTimeControllerTitle" table:@"Localizable" locale:v11 bundleURL:v13];

  v17[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(STAllowanceListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.screen-time" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)setCoordinator:(id)a3
{
  v4 = (STRootViewModelCoordinator *)a3;
  id v7 = [(STAllowanceListController *)self coordinator];
  [v7 removeObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.allowancesByIdentifier" context:"STAllowanceObservationContext"];
  [v7 removeObserver:self forKeyPath:@"viewModel.hasWatchOSDevices" context:"STAllowanceObservationContext"];
  [v7 removeObserver:self forKeyPath:@"usageDetailsCoordinator.devices" context:"STAllowanceObservationContext"];
  coordinator = self->_coordinator;
  self->_coordinator = v4;
  objc_super v6 = v4;

  [(STRootViewModelCoordinator *)v6 addObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.allowancesByIdentifier" options:0 context:"STAllowanceObservationContext"];
  [(STRootViewModelCoordinator *)v6 addObserver:self forKeyPath:@"viewModel.hasWatchOSDevices" options:1 context:"STAllowanceObservationContext"];
  [(STRootViewModelCoordinator *)v6 addObserver:self forKeyPath:@"usageDetailsCoordinator.devices" options:1 context:"STAllowanceObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == "STAllowanceObservationContext")
  {
    if (![v10 isEqualToString:@"timeAllowancesCoordinator.viewModel.allowancesByIdentifier"])
    {
      if ([v10 isEqualToString:@"viewModel.hasWatchOSDevices"])
      {
        v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        v14 = [MEMORY[0x263EFF9D0] null];

        if (v13 == v14)
        {

          v13 = 0;
        }
        -[STAllowanceListController _hasWatchOSDevicesDidChange:coordinator:](self, "_hasWatchOSDevicesDidChange:coordinator:", [v13 BOOLValue], v11);
      }
      else
      {
        if (![v10 isEqualToString:@"usageDetailsCoordinator.devices"]) {
          goto LABEL_3;
        }
        v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        v15 = [MEMORY[0x263EFF9D0] null];

        if (v13 == v15)
        {

          v13 = 0;
        }
        [(STAllowanceListController *)self _devicesDidChange:v13 coordinator:v11];
      }

      goto LABEL_3;
    }
    if ([(STAllowanceListController *)self isViewLoaded]) {
      [(STAllowanceListController *)self _allowancesDidChange];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STAllowanceListController;
    [(STListViewController *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_3:
}

- (void)_allowancesDidChange
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(STAllowanceListController *)self reloadSpecifiers];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  objc_super v3 = [(STAllowanceListController *)self allowanceSpecifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(STAllowanceListController *)self _adjustCellHeightForAllowanceSpecifier:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_hasWatchOSDevicesDidChange:(BOOL)a3 coordinator:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  if ([(STAllowanceListController *)self isViewLoaded])
  {
    uint64_t v6 = [v9 usageDetailsCoordinator];
    uint64_t v7 = [v6 devices];
    long long v8 = [(STAllowanceListController *)self _informativeTextWithDevices:v7 hasWatchOSDevices:v4];

    [(STAllowanceListController *)self _reloadInformativeTextGroupSpecifierIfNeeded:v8];
  }
}

- (void)_devicesDidChange:(id)a3 coordinator:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(STAllowanceListController *)self isViewLoaded])
  {
    uint64_t v7 = [v6 viewModel];
    long long v8 = -[STAllowanceListController _informativeTextWithDevices:hasWatchOSDevices:](self, "_informativeTextWithDevices:hasWatchOSDevices:", v9, [v7 hasWatchOSDevices]);

    [(STAllowanceListController *)self _reloadInformativeTextGroupSpecifierIfNeeded:v8];
  }
}

- (void)_reloadInformativeTextGroupSpecifierIfNeeded:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(STAllowanceListController *)self informativeTextGroupSpecifier];
  uint64_t v5 = *MEMORY[0x263F600F8];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F600F8]];
  if (([v6 isEqualToString:v7] & 1) == 0)
  {
    [v4 setObject:v7 forKeyedSubscript:v5];
    [(STAllowanceListController *)self reloadSpecifier:v4 animated:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(STAllowanceListController *)self allowanceSpecifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [(STAllowanceListController *)self reloadSpecifier:v10 animated:0];
        [(STAllowanceListController *)self _adjustCellHeightForAllowanceSpecifier:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STAllowanceListController.viewWillAppear", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)STAllowanceListController;
  [(STAllowanceListController *)&v11 viewWillAppear:v3];
}

- (void)_adjustCellHeightForAllowanceSpecifier:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 objectForKeyedSubscript:*MEMORY[0x263F602C8]];
  uint64_t v5 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v6 = [v5 localizedStringForKey:@"AllowanceCustomScheduleDetailText" value:&stru_26D9391A8 table:0];

  if ([v4 isEqualToString:v6]) {
    [(STAllowanceListController *)self reloadSpecifier:v7 animated:0];
  }
}

- (id)specifiers
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v49 = (int)*MEMORY[0x263F5FDB8];
    v54 = objc_opt_new();
    v51 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    v55 = [(STAllowanceListController *)self coordinator];
    BOOL v4 = [v55 usageDetailsCoordinator];
    uint64_t v5 = [v4 devices];
    uint64_t v6 = [v55 viewModel];
    id v7 = -[STAllowanceListController _informativeTextWithDevices:hasWatchOSDevices:](self, "_informativeTextWithDevices:hasWatchOSDevices:", v5, [v6 hasWatchOSDevices]);
    [v51 setObject:v7 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [(STAllowanceListController *)self setInformativeTextGroupSpecifier:v51];
    [v54 addObject:v51];
    v50 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
    v53 = +[STScreenTimeSettingsUIBundle bundle];
    uint64_t v8 = (void *)MEMORY[0x263F5FC40];
    id v9 = [v53 localizedStringForKey:@"AddLimitSpecifierName" value:&stru_26D9391A8 table:0];
    v56 = [v8 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:13 edit:objc_opt_class()];

    [v56 setButtonAction:sel_addAllowance_];
    uint64_t v10 = (objc_class *)objc_opt_class();
    objc_super v11 = NSStringFromClass(v10);
    uint64_t v46 = *MEMORY[0x263F60228];
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v11);

    uint64_t v12 = *MEMORY[0x263F60320];
    [v56 setObject:&unk_26D966D48 forKeyedSubscript:*MEMORY[0x263F60320]];
    [v56 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
    if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
      [v56 setButtonAction:sel_showStoreDemoAlert];
    }
    long long v13 = [v55 timeAllowancesCoordinator];
    long long v14 = [v13 viewModel];
    v52 = [v14 allowancesByIdentifier];

    if ([v52 count])
    {
      long long v15 = (void *)MEMORY[0x263F5FC40];
      long long v16 = [v53 localizedStringForKey:@"EnableAllAppLimitsSpecifierName" value:&stru_26D9391A8 table:0];
      v48 = [v15 preferenceSpecifierNamed:v16 target:self set:sel__setAllAllowancesEnabled_specifier_ get:sel__allAllowancesEnabled_ detail:0 cell:6 edit:objc_opt_class()];

      v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      [v48 setObject:v18 forKeyedSubscript:v46];

      [v48 setObject:&unk_26D966D48 forKeyedSubscript:v12];
      uint64_t v19 = MEMORY[0x263EFFA88];
      [v48 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
      [v48 setObject:v19 forKeyedSubscript:0x26D940328];
      [(STAllowanceListController *)self setEnableAllAllowancesSpecifier:v48];
      [v54 addObject:v48];
      v20 = [(STAllowanceListController *)self coordinator];
      v21 = [v20 timeAllowancesCoordinator];
      v22 = [v21 viewModel];
      int v23 = [v22 allAllowancesEnabled];

      if (v23)
      {
        v24 = objc_msgSend(MEMORY[0x263F5FC40], "st_emptyGroupSpecifier");
        [v54 addObject:v24];

        v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v52, "count"));
        uint64_t v69 = 0;
        v70 = &v69;
        uint64_t v71 = 0x3032000000;
        v72 = __Block_byref_object_copy_;
        v73 = __Block_byref_object_dispose_;
        id v74 = 0;
        v65[0] = MEMORY[0x263EF8330];
        v65[1] = 3221225472;
        v65[2] = __39__STAllowanceListController_specifiers__block_invoke;
        v65[3] = &unk_2647670F0;
        v65[4] = self;
        id v26 = v25;
        id v66 = v26;
        id v47 = v54;
        id v67 = v47;
        v68 = &v69;
        [v52 enumerateKeysAndObjectsUsingBlock:v65];
        [(STAllowanceListController *)self setAllowanceSpecifiers:v26];
        v45 = v26;
        v27 = [MEMORY[0x263F670A8] sharedCache];
        [(STAllowanceListController *)self allowanceSpecifiersByBundleIdentifier];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v76 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v62 != v30) {
                objc_enumerationMutation(v28);
              }
              uint64_t v32 = *(void *)(*((void *)&v61 + 1) + 8 * i);
              v33 = [(id)v70[5] objectForKeyedSubscript:v32];
              BOOL v34 = v33 == 0;

              if (v34) {
                [v27 removeObserver:self bundleIdentifier:v32];
              }
            }
            uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v76 count:16];
          }
          while (v29);
        }

        [(STAllowanceListController *)self setAllowanceSpecifiersByBundleIdentifier:v70[5]];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v35 = (id)v70[5];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v57 objects:v75 count:16];
        if (v36)
        {
          uint64_t v37 = *(void *)v58;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v58 != v37) {
                objc_enumerationMutation(v35);
              }
              uint64_t v39 = *(void *)(*((void *)&v57 + 1) + 8 * j);
              v40 = [v28 objectForKeyedSubscript:v39];
              BOOL v41 = v40 == 0;

              if (v41) {
                [v27 addObserver:self selector:sel__didFetchAppInfo_ bundleIdentifier:v39];
              }
            }
            uint64_t v36 = [v35 countByEnumeratingWithState:&v57 objects:v75 count:16];
          }
          while (v36);
        }

        [v47 addObject:v50];
        [v47 addObject:v56];

        _Block_object_dispose(&v69, 8);
      }

      v42 = (objc_class *)v54;
    }
    else
    {
      v42 = (objc_class *)v54;
      [v54 addObject:v50];
      [v54 addObject:v56];
    }
    v43 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v49);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v49) = v42;

    BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v49);
  }

  return v3;
}

void __39__STAllowanceListController_specifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) _specifierForAllowance:v4];
  [*(id *)(a1 + 40) addObject:v5];
  [*(id *)(a1 + 48) addObject:v5];
  uint64_t v6 = [v4 bundleIdentifiers];
  if ([v6 count])
  {
    id v18 = v4;
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          long long v16 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v15];
          if (v16)
          {
            v17 = v16;
            [v16 addObject:v5];
          }
          else
          {
            v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v5, 0);
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v17 forKeyedSubscript:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    id v4 = v18;
  }
}

- (id)_informativeTextWithDevices:(id)a3 hasWatchOSDevices:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4 && [v5 count])
  {
    uint64_t v7 = +[STScreenTimeSettingsUIBundle bundle];
    uint64_t v8 = [v7 localizedStringForKey:@"AppLimitsFooterFormat" value:&stru_26D9391A8 table:0];

    id v9 = [v6 valueForKeyPath:@"name"];
    id v10 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v9];
    uint64_t v11 = objc_msgSend(NSString, "localizedStringWithFormat:", v8, v10);
  }
  else
  {
    uint64_t v8 = +[STScreenTimeSettingsUIBundle bundle];
    uint64_t v11 = [v8 localizedStringForKey:@"AppLimitsFooterText" value:&stru_26D9391A8 table:0];
  }

  return v11;
}

- (void)_setAllAllowancesEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 BOOLValue];
  uint64_t v8 = [(STAllowanceListController *)self coordinator];
  if ([v8 isPasscodeEnabled]
    && ([v8 hasAlreadyEnteredPINForSession] & 1) == 0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__STAllowanceListController__setAllAllowancesEnabled_specifier___block_invoke_81;
    v10[3] = &unk_264767138;
    char v12 = v7;
    v10[4] = self;
    id v11 = &__block_literal_global;
    [(STPINListViewController *)self showPINSheet:v6 completion:v10];
  }
  else
  {
    id v9 = [v8 timeAllowancesCoordinator];
    [v9 saveAllAllowancesEnabled:v7 completionHandler:&__block_literal_global];
  }
}

void __64__STAllowanceListController__setAllAllowancesEnabled_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = +[STUILog persistence];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __64__STAllowanceListController__setAllAllowancesEnabled_specifier___block_invoke_cold_1();
    }
  }
}

void __64__STAllowanceListController__setAllAllowancesEnabled_specifier___block_invoke_81(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) coordinator];
    BOOL v4 = [v5 timeAllowancesCoordinator];
    [v4 saveAllAllowancesEnabled:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) enableAllAllowancesSpecifier];
    objc_msgSend(v2, "reloadSpecifier:animated:");
  }
}

- (id)_allAllowancesEnabled:(id)a3
{
  BOOL v3 = [(STAllowanceListController *)self coordinator];
  BOOL v4 = [v3 timeAllowancesCoordinator];
  id v5 = [v4 viewModel];

  id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "allAllowancesEnabled"));

  return v6;
}

- (id)_specifierForAllowance:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F67108];
  id v5 = a3;
  id v6 = [v5 categoryIdentifiers];
  uint64_t v7 = [v5 bundleIdentifiers];
  uint64_t v8 = [v5 webDomains];
  id v9 = [v4 displayNameForUsageLimitWithCategoryIdentifiers:v6 bundleIdentifiers:v7 webDomains:v8];

  id v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:2 edit:objc_opt_class()];
  id v11 = [v5 identifier];
  [v10 setUserInfo:v11];

  [v10 setControllerLoadAction:sel__showAllowanceDetailController_];
  [v10 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  char v12 = [(STAllowanceListController *)self _subtitleTextForAllowance:v5];
  [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x263F602C8]];

  uint64_t v13 = (objc_class *)objc_opt_class();
  long long v14 = NSStringFromClass(v13);
  [v10 setObject:v14 forKeyedSubscript:*MEMORY[0x263F60228]];

  [v10 setObject:&unk_26D966D48 forKeyedSubscript:*MEMORY[0x263F60320]];
  [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
  uint64_t v15 = [v5 timeByDay];

  if (v15)
  {
    long long v16 = +[STScreenTimeSettingsUIBundle bundle];
    v17 = [v16 localizedStringForKey:@"AllowanceCustomScheduleDetailText" value:&stru_26D9391A8 table:0];
    [v10 setObject:v17 forKeyedSubscript:0x26D943648];

    [v10 setObject:&unk_26D966D60 forKeyedSubscript:0x26D943668];
  }

  return v10;
}

- (id)_subtitleTextForAllowance:(id)a3
{
  id v3 = a3;
  if ([v3 allowanceEnabled])
  {
    BOOL v4 = [v3 scheduleText];
  }
  else
  {
    id v5 = +[STScreenTimeSettingsUIBundle bundle];
    BOOL v4 = [v5 localizedStringForKey:@"AppLimitOff" value:&stru_26D9391A8 table:0];
  }

  return v4;
}

- (void)_showAllowanceDetailController:(id)a3
{
  id v12 = a3;
  if (![(STAllowanceListController *)self shouldShowConfirmDeletionAlert])
  {
    BOOL v4 = [(STAllowanceListController *)self coordinator];
    id v5 = [[STAllowanceDetailListController alloc] initWithCoordinator:v4];
    id v6 = [v12 userInfo];
    uint64_t v7 = [v4 timeAllowancesCoordinator];
    uint64_t v8 = [v7 viewModel];
    id v9 = [v8 allowancesByIdentifier];
    id v10 = [v9 objectForKeyedSubscript:v6];
    [(STAllowanceDetailListController *)v5 setAllowance:v10];

    [(STAllowanceDetailListController *)v5 setDelegate:self];
    [(STAllowanceDetailListController *)v5 setParentController:self];
    id v11 = [(STAllowanceListController *)self rootController];
    [(STAllowanceDetailListController *)v5 setRootController:v11];

    [(STAllowanceDetailListController *)v5 setSpecifier:v12];
    [(STAllowanceListController *)self showController:v5 animate:1];
  }
}

- (void)addAllowance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x263EFFA68];
  [v4 setObject:MEMORY[0x263EFFA68] forKeyedSubscript:0x26D9394E8];
  [v4 setObject:v5 forKeyedSubscript:0x26D939508];
  [v4 setObject:v5 forKeyedSubscript:0x26D939528];
  id v6 = [(STAllowanceListController *)self coordinator];
  [v4 setObject:v6 forKeyedSubscript:0x26D940528];

  uint64_t v7 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v8 = [v7 localizedStringForKey:@"AllowanceNextBarButtonItemTitle" value:&stru_26D9391A8 table:0];

  [v4 setObject:v8 forKeyedSubscript:0x26D939548];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __42__STAllowanceListController_addAllowance___block_invoke;
  long long v19 = &unk_264766EE0;
  long long v20 = self;
  id v21 = v4;
  id v9 = v4;
  id v10 = _Block_copy(&v16);
  id v11 = _Block_copy(v10);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, 0x26D939568, v16, v17, v18, v19, v20);

  id v12 = objc_opt_new();
  [v12 setParentController:self];
  uint64_t v13 = [(STAllowanceListController *)self rootController];
  [v12 setRootController:v13];

  [v12 setSpecifier:v9];
  long long v14 = objc_opt_new();
  [v14 setParentController:v12];
  uint64_t v15 = [v12 rootController];
  [v14 setRootController:v15];

  [v14 setSpecifier:v9];
  [v12 showController:v14];
  [(STAllowanceListController *)self showController:v12];
}

void __42__STAllowanceListController_addAllowance___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id v16 = (id)objc_opt_new();
  [v16 setBundleIdentifiers:v11];

  [v16 setWebDomains:v10];
  [v16 setCategoryIdentifiers:v9];

  uint64_t v13 = [*(id *)(a1 + 32) coordinator];
  objc_msgSend(v16, "setBehaviorType:", objc_msgSend(v13, "isPasscodeEnabled"));
  long long v14 = [[STAllowanceDetailListController alloc] initWithCoordinator:v13];
  [(STAllowanceDetailListController *)v14 setDelegate:*(void *)(a1 + 32)];
  [(STAllowanceDetailListController *)v14 setAllowance:v16];
  [(STAllowanceDetailListController *)v14 setIsSetupController:1];
  [(STAllowanceDetailListController *)v14 setUseBackButton:1];
  [(STAllowanceDetailListController *)v14 setCreatingNewAllowance:1];
  [(STAllowanceDetailListController *)v14 setParentController:v12];
  uint64_t v15 = [v12 rootController];
  [(STAllowanceDetailListController *)v14 setRootController:v15];

  [(STAllowanceDetailListController *)v14 setSpecifier:*(void *)(a1 + 40)];
  [v12 showController:v14 animate:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STAllowanceListController *)self specifierAtIndexPath:v7];
  if (v8)
  {
    id v9 = [(STAllowanceListController *)self allowanceSpecifiers];
    int v10 = [v9 containsObject:v8];

    if (v10) {
      [(STAllowanceListController *)self setShouldShowConfirmDeletionAlert:0];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)STAllowanceListController;
  [(STPINListViewController *)&v11 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5 = [(STAllowanceListController *)self specifierAtIndexPath:a4];
  if (v5
    && ([(STAllowanceListController *)self allowanceSpecifiers],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 containsObject:v5],
        v6,
        v7))
  {
    int64_t v8 = 1;
    [(STAllowanceListController *)self setShouldShowConfirmDeletionAlert:1];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v7 = [(STAllowanceListController *)self indexForIndexPath:a5];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndexedSubscript:v7];
    uint64_t v9 = v8;
    if (a4 == 1)
    {
      uint64_t v10 = v8;
      uint64_t v8 = [(STAllowanceListController *)self confirmDeletion:v8];
      uint64_t v9 = v10;
    }
    MEMORY[0x270F9A758](v8, v9);
  }
}

- (void)confirmDeletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STAllowanceListController *)self coordinator];
  if ([v5 isPasscodeEnabled]
    && ([v5 hasAlreadyEnteredPINForSession] & 1) == 0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__STAllowanceListController_confirmDeletion___block_invoke;
    v6[3] = &unk_264766FD8;
    v6[4] = self;
    id v7 = v4;
    [(STPINListViewController *)self showPINSheet:v7 completion:v6];
  }
  else
  {
    [(STAllowanceListController *)self _showConfirmDeletionView:v4];
  }
}

uint64_t __45__STAllowanceListController_confirmDeletion___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _showConfirmDeletionView:*(void *)(result + 40)];
  }
  return result;
}

- (void)_showConfirmDeletionView:(id)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = +[STScreenTimeSettingsUIBundle bundle];
  v15[0] = *MEMORY[0x263F60018];
  id v7 = [v6 localizedStringForKey:@"AllowanceDeleteSpecifierName" value:&stru_26D9391A8 table:0];
  v16[0] = v7;
  v15[1] = *MEMORY[0x263F60010];
  uint64_t v8 = [v6 localizedStringForKey:@"AllowanceDeletionPrompt" value:&stru_26D9391A8 table:0];
  v16[1] = v8;
  v15[2] = *MEMORY[0x263F60008];
  uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v9, "sf_isiPad")) {
    uint64_t v10 = @"ConfirmationTitleDelete";
  }
  else {
    uint64_t v10 = @"AllowanceDeleteSpecifierName";
  }
  objc_super v11 = [v6 localizedStringForKey:v10 value:&stru_26D9391A8 table:0];
  v16[2] = v11;
  v15[3] = *MEMORY[0x263F5FFF8];
  id v12 = [v6 localizedStringForKey:@"ConfirmationButtonCancel" value:&stru_26D9391A8 table:0];
  v16[3] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
  [v5 setupWithDictionary:v13];

  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60000]];
  long long v14 = [v4 userInfo];

  [v5 setUserInfo:v14];
  [v5 setTarget:self];
  [v5 setConfirmationAction:sel_deleteAllowance_];
  [(STAllowanceListController *)self showConfirmationViewForSpecifier:v5];
  [(STAllowanceListController *)self setShouldShowConfirmDeletionAlert:0];
}

- (void)deleteAllowance:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STAllowanceListController *)self coordinator];
  id v6 = [v5 timeAllowancesCoordinator];

  id v7 = [v4 userInfo];

  uint64_t v8 = [v6 viewModel];
  uint64_t v9 = [v8 allowancesByIdentifier];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__STAllowanceListController_deleteAllowance___block_invoke;
    v11[3] = &unk_264767160;
    v11[4] = self;
    id v12 = v7;
    [v6 deleteAllowance:v10 completionHandler:v11];
  }
}

void __45__STAllowanceListController_deleteAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[STUILog persistence];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __45__STAllowanceListController_deleteAllowance___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) removeSpecifierID:*(void *)(a1 + 40) animated:1];
}

- (void)allowanceDetailController:(id)a3 didSaveAllowance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STAllowanceListController *)self coordinator];
  uint64_t v9 = [v8 timeAllowancesCoordinator];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__STAllowanceListController_allowanceDetailController_didSaveAllowance___block_invoke;
  v11[3] = &unk_264767160;
  id v12 = v6;
  uint64_t v13 = self;
  id v10 = v6;
  [v9 saveAllowance:v7 completionHandler:v11];
}

void __72__STAllowanceListController_allowanceDetailController_didSaveAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[STUILog persistence];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __72__STAllowanceListController_allowanceDetailController_didSaveAllowance___block_invoke_cold_1();
    }
  }
  if ([*(id *)(a1 + 32) isSetupController]) {
    [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
  }
  uint64_t v5 = [*(id *)(a1 + 32) specifier];
  [v5 removePropertyForKey:0x26D939568];
}

- (void)allowanceDetailController:(id)a3 didDeleteAllowance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(STAllowanceListController *)self coordinator];
  uint64_t v9 = [v8 timeAllowancesCoordinator];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__STAllowanceListController_allowanceDetailController_didDeleteAllowance___block_invoke;
  v11[3] = &unk_264767160;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 deleteAllowance:v7 completionHandler:v11];
}

void __74__STAllowanceListController_allowanceDetailController_didDeleteAllowance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[STUILog persistence];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __45__STAllowanceListController_deleteAllowance___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) popViewControllerAnimated:1];
  uint64_t v5 = [*(id *)(a1 + 40) specifier];
  [v5 removePropertyForKey:0x26D939568];
}

- (void)_didFetchAppInfo:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F67360]];

  id v6 = [(STAllowanceListController *)self allowanceSpecifiersByBundleIdentifier];
  id v26 = v5;
  id v7 = [v5 bundleIdentifier];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v28 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v13 = [v12 userInfo];
        if (!v13)
        {
          uint64_t v24 = [MEMORY[0x263F08690] currentHandler];
          [v24 handleFailureInMethod:a2, self, @"STAllowanceListController.m", 542, @"Unexpected allowance specifier without an identifier: %@", v12 object file lineNumber description];
        }
        long long v14 = [(STAllowanceListController *)self coordinator];
        uint64_t v15 = [v14 timeAllowancesCoordinator];
        id v16 = [v15 viewModel];
        uint64_t v17 = [v16 allowancesByIdentifier];
        id v18 = [v17 objectForKeyedSubscript:v13];

        long long v19 = (void *)MEMORY[0x263F67108];
        long long v20 = [v18 categoryIdentifiers];
        id v21 = [v18 bundleIdentifiers];
        long long v22 = [v18 webDomains];
        int v23 = [v19 displayNameForUsageLimitWithCategoryIdentifiers:v20 bundleIdentifiers:v21 webDomains:v22];
        [v12 setName:v23];

        if ([(STAllowanceListController *)self containsSpecifier:v12]) {
          [(STAllowanceListController *)self reloadSpecifier:v12];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v10);
  }
}

- (void)showStoreDemoAlert
{
  id v3 = [MEMORY[0x263F82418] alertControllerForFeatureNotAvailable];
  [(STAllowanceListController *)self presentViewController:v3 animated:1 completion:0];
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (PSSpecifier)informativeTextGroupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setInformativeTextGroupSpecifier:(id)a3
{
}

- (NSArray)allowanceSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setAllowanceSpecifiers:(id)a3
{
}

- (PSSpecifier)enableAllAllowancesSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setEnableAllAllowancesSpecifier:(id)a3
{
}

- (BOOL)shouldShowConfirmDeletionAlert
{
  return self->_shouldShowConfirmDeletionAlert;
}

- (void)setShouldShowConfirmDeletionAlert:(BOOL)a3
{
  self->_shouldShowConfirmDeletionAlert = a3;
}

- (NSDictionary)allowanceSpecifiersByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setAllowanceSpecifiersByBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowanceSpecifiersByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_enableAllAllowancesSpecifier, 0);
  objc_storeStrong((id *)&self->_allowanceSpecifiers, 0);
  objc_storeStrong((id *)&self->_informativeTextGroupSpecifier, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

void __64__STAllowanceListController__setAllAllowancesEnabled_specifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failed to save allAllowancesEnabled state: %{public}@", v2, v3, v4, v5, v6);
}

void __45__STAllowanceListController_deleteAllowance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failed to delete allowance: %{public}@", v2, v3, v4, v5, v6);
}

void __72__STAllowanceListController_allowanceDetailController_didSaveAllowance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failed to save edited allowance: %{public}@", v2, v3, v4, v5, v6);
}

@end