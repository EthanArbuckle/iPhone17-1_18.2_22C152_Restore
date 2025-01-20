@interface STEyeReliefListController
- (BOOL)_isScreenDistanceEnabled;
- (PSSpecifier)enableScreenDistanceSpecifier;
- (STEyeReliefListController)init;
- (id)_checkScreenDistanceState:(id)a3;
- (id)_createEnableScreenDistanceGroupSpecifier;
- (id)_createEnableScreenDistanceSpecifer;
- (id)specifiers;
- (void)_setScreenDistance:(BOOL)a3;
- (void)_setScreenDistance:(id)a3 specifier:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setEnableScreenDistanceSpecifier:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation STEyeReliefListController

- (STEyeReliefListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)STEyeReliefListController;
  v2 = [(STPINListViewController *)&v6 init];
  v3 = +[STScreenTimeSettingsUIBundle bundle];
  v4 = [v3 localizedStringForKey:@"ScreenDistanceViewControllerTitle" value:&stru_26D9391A8 table:0];
  [(STEyeReliefListController *)v2 setTitle:v4];

  return v2;
}

- (void)dealloc
{
  [(STEyeReliefListController *)self setCoordinator:0];
  v3.receiver = self;
  v3.super_class = (Class)STEyeReliefListController;
  [(STListViewController *)&v3 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)STEyeReliefListController;
  [(STPINListViewController *)&v16 viewDidAppear:a3];
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.ScreenTime/EYE_DISTANCE"];
  id v5 = objc_alloc(MEMORY[0x263F08DB0]);
  objc_super v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = +[STScreenTimeSettingsUIBundle bundle];
  v8 = [v7 bundleURL];
  v9 = (void *)[v5 initWithKey:@"ScreenDistanceViewControllerTitle" table:@"Localizable" locale:v6 bundleURL:v8];

  id v10 = objc_alloc(MEMORY[0x263F08DB0]);
  v11 = [MEMORY[0x263EFF960] currentLocale];
  v12 = +[STScreenTimeSettingsUIBundle bundle];
  v13 = [v12 bundleURL];
  v14 = (void *)[v10 initWithKey:@"ScreenTimeControllerTitle" table:@"Localizable" locale:v11 bundleURL:v13];

  v17[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(STEyeReliefListController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.screen-time" title:v9 localizedNavigationComponents:v15 deepLink:v4];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(STPINListViewController *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"eyeReliefCoordinator.viewModel.isEyeReliefEnabled" context:"STEyeReliefListControllerObservationContext"];
  v6.receiver = self;
  v6.super_class = (Class)STEyeReliefListController;
  [(STPINListViewController *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"eyeReliefCoordinator.viewModel.isEyeReliefEnabled" options:3 context:"STEyeReliefListControllerObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "STEyeReliefListControllerObservationContext")
  {
    uint64_t v11 = *MEMORY[0x263F081C8];
    id v12 = a5;
    id v14 = [v12 objectForKeyedSubscript:v11];
    v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

    LODWORD(v12) = [v14 BOOLValue];
    if (v12 != [v13 BOOLValue]) {
      [(STEyeReliefListController *)self reloadSpecifiers];
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STEyeReliefListController;
    id v10 = a5;
    [(STListViewController *)&v15 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_opt_new();
    objc_super v6 = [(STEyeReliefListController *)self _createEnableScreenDistanceGroupSpecifier];
    [v5 addObject:v6];

    v7 = [(STEyeReliefListController *)self _createEnableScreenDistanceSpecifer];
    [(STEyeReliefListController *)self setEnableScreenDistanceSpecifier:v7];

    v8 = [(STEyeReliefListController *)self enableScreenDistanceSpecifier];
    [v5 addObject:v8];

    v9 = (objc_class *)[v5 copy];
    id v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v9;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (id)_createEnableScreenDistanceGroupSpecifier
{
  v2 = +[STScreenTimeSettingsUIBundle bundle];
  uint64_t v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ScreenDistanceEnableFeatureGroupSpecifier"];
  id v4 = [v2 localizedStringForKey:@"ScreenDistanceEnableFeatureGroupSpecifierFooterText" value:&stru_26D9391A8 table:0];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x263F600F8]];

  return v3;
}

- (id)_createEnableScreenDistanceSpecifer
{
  uint64_t v3 = +[STScreenTimeSettingsUIBundle bundle];
  id v4 = [v3 localizedStringForKey:@"ScreenDistanceEnableFeatureSpecifierTitle" value:&stru_26D9391A8 table:0];

  id v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v4 target:self set:sel__setScreenDistance_specifier_ get:sel__checkScreenDistanceState_ detail:0 cell:6 edit:objc_opt_class()];
  [(STPINListViewController *)self setUpPasscodeAndLineWrapBehaviorForSpecifier:v5];
  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940328];

  return v5;
}

- (void)_setScreenDistance:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 BOOLValue];
  v8 = [(STPINListViewController *)self coordinator];
  v9 = [v8 viewModel];
  id v10 = [v9 me];
  if (![v10 hasPasscode])
  {

    goto LABEL_5;
  }
  char v11 = [v8 hasAlreadyEnteredPINForSession];

  if (v11)
  {
LABEL_5:
    [(STEyeReliefListController *)self _setScreenDistance:v7];
    goto LABEL_6;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__STEyeReliefListController__setScreenDistance_specifier___block_invoke;
  v12[3] = &unk_2647674C0;
  v12[4] = self;
  char v14 = v7;
  id v13 = v6;
  [(STPINListViewController *)self showPINSheet:v13 completion:v12];

LABEL_6:
}

uint64_t __58__STEyeReliefListController__setScreenDistance_specifier___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 _setScreenDistance:*(unsigned __int8 *)(a1 + 48)];
  }
  else {
    return [v3 reloadSpecifier:*(void *)(a1 + 40) animated:1];
  }
}

- (void)_setScreenDistance:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[STUILog eyeRelief];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STEyeReliefListController _setScreenDistance:](v3, v5);
  }

  id v6 = [(STPINListViewController *)self coordinator];
  uint64_t v7 = [v6 eyeReliefCoordinator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__STEyeReliefListController__setScreenDistance___block_invoke;
  v8[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  BOOL v9 = v3;
  [v7 persistEyeReliefState:v3 withCompletionHandler:v8];
}

void __48__STEyeReliefListController__setScreenDistance___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[STUILog eyeRelief];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__STEyeReliefListController__setScreenDistance___block_invoke_cold_2((uint64_t)v3, v4);
    }
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      id v5 = [MEMORY[0x263F67088] sharedController];
      id v6 = [MEMORY[0x263F67088] sharedController];
      uint64_t v7 = [v6 viewContext];
      id v12 = 0;
      char v8 = [v5 saveContext:v7 error:&v12];
      id v9 = v12;

      if ((v8 & 1) == 0)
      {
        id v10 = +[STUILog eyeRelief];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __48__STEyeReliefListController__setScreenDistance___block_invoke_cold_1((uint64_t)v9, v10);
        }
      }
    }
    char v11 = (void *)MEMORY[0x263F67150];
    id v4 = [objc_alloc(MEMORY[0x263F67190]) initWithEyeReliefEnabled:*(unsigned __int8 *)(a1 + 32)];
    [v11 reportEvent:v4];
  }
}

- (id)_checkScreenDistanceState:(id)a3
{
  BOOL v3 = [(STEyeReliefListController *)self _isScreenDistanceEnabled];
  id v4 = +[STUILog eyeRelief];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[STEyeReliefListController _checkScreenDistanceState:](v3, v4);
  }

  id v5 = [NSNumber numberWithBool:v3];

  return v5;
}

- (BOOL)_isScreenDistanceEnabled
{
  v2 = [(STPINListViewController *)self coordinator];
  BOOL v3 = [v2 eyeReliefCoordinator];
  id v4 = [v3 viewModel];

  LOBYTE(v2) = [v4 isEyeReliefEnabled];
  return (char)v2;
}

- (PSSpecifier)enableScreenDistanceSpecifier
{
  return self->_enableScreenDistanceSpecifier;
}

- (void)setEnableScreenDistanceSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_setScreenDistance:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [NSNumber numberWithBool:a1 & 1];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_225B06000, a2, OS_LOG_TYPE_DEBUG, "Setting Eye Distance on viewModel: %@", (uint8_t *)&v4, 0xCu);
}

void __48__STEyeReliefListController__setScreenDistance___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "Error saving managed object contet: %@", (uint8_t *)&v2, 0xCu);
}

void __48__STEyeReliefListController__setScreenDistance___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "Could not save Eye Distance settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_checkScreenDistanceState:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_225B06000, a2, OS_LOG_TYPE_DEBUG, "Fetching Eye Distance state from viewModel: %d", (uint8_t *)v2, 8u);
}

@end