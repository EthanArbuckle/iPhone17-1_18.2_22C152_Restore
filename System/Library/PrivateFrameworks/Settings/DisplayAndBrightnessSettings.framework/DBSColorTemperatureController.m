@interface DBSColorTemperatureController
- (CBClient)_brightnessClient;
- (DBSColorTemperatureController)initWithNibName:(id)a3 bundle:(id)a4;
- (PSSpecifier)_manualSwitchSpecifier;
- (PSSpecifier)_scheduleRangeSpecifier;
- (PSSpecifier)_scheduleSwitchSpecifier;
- (PSSpecifier)_temperatureSlider;
- (id)blueLightReductionFooter;
- (id)fromDetailForCell:(id)a3;
- (id)getBlueLightReductionEnabled:(id)a3;
- (id)getBlueLightReductionScheduleEnabled:(id)a3;
- (id)localizedTimeForTime:(id)a3;
- (id)specifiers;
- (id)temperatureStrength:(id)a3;
- (id)toDetailForCell:(id)a3;
- (void)_printBlueLightStatus:(id *)a3;
- (void)colorTemperatureSliderDidChange;
- (void)dealloc;
- (void)handleBlueLightStatusChanged:(id *)a3;
- (void)setBlueLightReductionEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setBlueLightReductionSchedule:(id)a3 forSpecifier:(id)a4;
- (void)setTemperatureStrength:(id)a3 specifier:(id)a4;
- (void)set_brightnessClient:(id)a3;
- (void)set_manualSwitchSpecifier:(id)a3;
- (void)set_scheduleRangeSpecifier:(id)a3;
- (void)set_scheduleSwitchSpecifier:(id)a3;
- (void)set_temperatureSlider:(id)a3;
- (void)showAlertToDisableAccessibilityFiltersForBlueLightReduction:(id)a3 cancel:(id)a4;
- (void)showScheduleRange:(BOOL)a3 animated:(BOOL)a4;
- (void)specifiers;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation DBSColorTemperatureController

- (DBSColorTemperatureController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)DBSColorTemperatureController;
  v8 = [(DBSColorTemperatureController *)&v24 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = (CBClient *)objc_alloc_init(MEMORY[0x263F34248]);
    brightnessClient = v8->__brightnessClient;
    v8->__brightnessClient = v9;

    objc_initWeak(&location, v8);
    v11 = [(DBSColorTemperatureController *)v8 _brightnessClient];
    v12 = [v11 blueLightClient];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __56__DBSColorTemperatureController_initWithNibName_bundle___block_invoke;
    v21 = &unk_264C7A570;
    objc_copyWeak(&v22, &location);
    [v12 setStatusNotificationBlock:&v18];

    v13 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    timeFormatter = v8->_timeFormatter;
    v8->_timeFormatter = v13;

    -[NSDateFormatter setTimeStyle:](v8->_timeFormatter, "setTimeStyle:", 1, v18, v19, v20, v21);
    [(NSDateFormatter *)v8->_timeFormatter setDateStyle:0];
    v15 = [MEMORY[0x263F82670] currentDevice];
    if (objc_msgSend(v15, "sf_isInternalInstall")) {
      BOOL v16 = CFPreferencesGetAppBooleanValue(@"kShowColorTemperature", @"com.apple.Preferences", 0) != 0;
    }
    else {
      BOOL v16 = 0;
    }
    v8->_showColorTemperature = v16;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __56__DBSColorTemperatureController_initWithNibName_bundle___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleBlueLightStatusChanged:a2];
}

- (void)dealloc
{
  v3 = [(DBSColorTemperatureController *)self _brightnessClient];
  v4 = [v3 blueLightClient];
  [v4 setStatusNotificationBlock:0];

  [(NSTimer *)self->_blueLightReductionLabelRefreshTimer invalidate];
  v5.receiver = self;
  v5.super_class = (Class)DBSColorTemperatureController;
  [(DBSColorTemperatureController *)&v5 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)DBSColorTemperatureController;
  [(DBSColorTemperatureController *)&v16 viewDidAppear:a3];
  v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Display/BLUE_LIGHT_REDUCTION"];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F08DB0]);
    id v6 = [MEMORY[0x263EFF960] currentLocale];
    id v7 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v8 = [v7 bundleURL];
    v9 = (void *)[v5 initWithKey:@"DISPLAY_AND_BRIGHTNESS" defaultValue:0 table:@"Display" locale:v6 bundleURL:v8];

    id v10 = objc_alloc(MEMORY[0x263F08DB0]);
    v11 = [MEMORY[0x263EFF960] currentLocale];
    v12 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v13 = [v12 bundleURL];
    v14 = (void *)[v10 initWithKey:@"BLUE_LIGHT_REDUCTION" defaultValue:0 table:@"Display" locale:v11 bundleURL:v13];

    v17[0] = v9;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    [(DBSColorTemperatureController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.display" title:v14 localizedNavigationComponents:v15 deepLink:v4];
  }
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    self->_showingScheduleRange = 0;
    id v5 = [(DBSColorTemperatureController *)self loadSpecifiersFromPlistName:@"ColorTemperature" target:self];
    id v6 = [v5 specifierForID:@"BLUE_LIGHT_REDUCTION_COLOR_TEMP"];
    [(DBSColorTemperatureController *)self set_temperatureSlider:v6];

    id v7 = [(DBSColorTemperatureController *)self _temperatureSlider];
    if (!v7) {
      -[DBSColorTemperatureController specifiers]();
    }

    v8 = [v5 specifierForID:@"SCHEDULED"];
    [(DBSColorTemperatureController *)self set_scheduleSwitchSpecifier:v8];

    v9 = [(DBSColorTemperatureController *)self _scheduleSwitchSpecifier];
    if (!v9) {
      -[DBSColorTemperatureController specifiers]();
    }

    id v10 = [v5 specifierForID:@"MANUAL"];
    [(DBSColorTemperatureController *)self set_manualSwitchSpecifier:v10];

    v11 = [(DBSColorTemperatureController *)self _manualSwitchSpecifier];
    if (!v11) {
      -[DBSColorTemperatureController specifiers]();
    }

    v12 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26E931C58 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    [(DBSColorTemperatureController *)self set_scheduleRangeSpecifier:v12];

    v13 = [(DBSColorTemperatureController *)self _scheduleRangeSpecifier];
    [v13 setIdentifier:@"SCHEDULE_RANGE"];

    v14 = [(DBSColorTemperatureController *)self _scheduleRangeSpecifier];
    [v14 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];

    uint64_t v15 = [v5 specifierForID:@"COLOR_TEMPERATURE"];
    if (!v15) {
      -[DBSColorTemperatureController specifiers].cold.4();
    }
    objc_super v16 = (void *)v15;
    v17 = [(DBSColorTemperatureController *)self blueLightReductionFooter];
    [v16 setProperty:v17 forKey:*MEMORY[0x263F600F8]];

    uint64_t v27 = 0;
    memset(v26, 0, sizeof(v26));
    uint64_t v18 = [(DBSColorTemperatureController *)self _brightnessClient];
    uint64_t v19 = [v18 blueLightClient];
    char v20 = [v19 getBlueLightStatus:v26];

    if ((v20 & 1) == 0) {
      -[DBSColorTemperatureController specifiers].cold.5();
    }
    int v21 = DWORD1(v26[0]);
    self->_showingScheduleRange = DWORD1(v26[0]) != 0;
    id v22 = [(DBSColorTemperatureController *)self _scheduleRangeSpecifier];
    if (v21)
    {
      v23 = [(DBSColorTemperatureController *)self _scheduleSwitchSpecifier];
      objc_msgSend(v5, "ps_insertObject:afterObject:", v22, v23);
    }
    else
    {
      [v5 removeObject:v22];
    }

    objc_super v24 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)_printBlueLightStatus:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v4 = DBSLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_235D7B000, v4, OS_LOG_TYPE_DEFAULT, "\\[T]/ STATUS:", (uint8_t *)&v18, 2u);
    }

    id v5 = DBSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL var0 = a3->var0;
      int v18 = 67109120;
      int v19 = var0;
      _os_log_impl(&dword_235D7B000, v5, OS_LOG_TYPE_DEFAULT, "Active: %d\n", (uint8_t *)&v18, 8u);
    }

    id v7 = DBSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL var1 = a3->var1;
      int v18 = 67109120;
      int v19 = var1;
      _os_log_impl(&dword_235D7B000, v7, OS_LOG_TYPE_DEFAULT, "Enabled: %d\n", (uint8_t *)&v18, 8u);
    }

    v9 = DBSLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int var3 = a3->var3;
      int v18 = 67109120;
      int v19 = var3;
      _os_log_impl(&dword_235D7B000, v9, OS_LOG_TYPE_DEFAULT, "Mode: %d\n", (uint8_t *)&v18, 8u);
    }

    v11 = DBSLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = a3->var4.var0.var0;
      int v13 = a3->var4.var0.var1;
      int v14 = a3->var4.var1.var0;
      int v15 = a3->var4.var1.var1;
      int v18 = 67109888;
      int v19 = v12;
      __int16 v20 = 1024;
      int v21 = v13;
      __int16 v22 = 1024;
      int v23 = v14;
      __int16 v24 = 1024;
      int v25 = v15;
      _os_log_impl(&dword_235D7B000, v11, OS_LOG_TYPE_DEFAULT, "Schedule: From %02d:%02d to %02d:%02d\n", (uint8_t *)&v18, 0x1Au);
    }

    objc_super v16 = DBSLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL var2 = a3->var2;
      int v18 = 67109120;
      int v19 = var2;
      _os_log_impl(&dword_235D7B000, v16, OS_LOG_TYPE_DEFAULT, "Sunrise/sunset allowed: %d\n\n", (uint8_t *)&v18, 8u);
    }
  }
}

- (void)showScheduleRange:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showingScheduleRange != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_showingScheduleRange = a3;
    id v8 = [(DBSColorTemperatureController *)self _scheduleRangeSpecifier];
    if (v5)
    {
      id v7 = [(DBSColorTemperatureController *)self _scheduleSwitchSpecifier];
      [(DBSColorTemperatureController *)self insertSpecifier:v8 afterSpecifier:v7 animated:v4];
    }
    else
    {
      [(DBSColorTemperatureController *)self removeSpecifier:v8 animated:v4];
    }
  }
}

- (void)handleBlueLightStatusChanged:(id *)a3
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__DBSColorTemperatureController_handleBlueLightStatusChanged___block_invoke;
  block[3] = &unk_264C7A598;
  objc_copyWeak(v5, &location);
  v5[1] = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __62__DBSColorTemperatureController_handleBlueLightStatusChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _brightnessClient];
  uint64_t v3 = [v2 blueLightClient];
  char v4 = [v3 getBlueLightStatus:*(void *)(a1 + 40)];

  if ((v4 & 1) == 0) {
    __62__DBSColorTemperatureController_handleBlueLightStatusChanged___block_invoke_cold_1();
  }
  [WeakRetained _printBlueLightStatus:*(void *)(a1 + 40)];
  BOOL v5 = [WeakRetained _scheduleSwitchSpecifier];
  [WeakRetained reloadSpecifier:v5 animated:1];

  id v6 = [WeakRetained _scheduleRangeSpecifier];
  [WeakRetained reloadSpecifier:v6 animated:1];

  id v7 = [WeakRetained _manualSwitchSpecifier];
  [WeakRetained reloadSpecifier:v7 animated:1];

  [WeakRetained showScheduleRange:*(_DWORD *)(*(void *)(a1 + 40) + 4) != 0 animated:1];
}

- (id)getBlueLightReductionEnabled:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DBSColorTemperatureController *)self _brightnessClient];
  id v6 = [v5 blueLightClient];
  int v7 = [v6 getBlueLightStatus:&v10];

  [(DBSColorTemperatureController *)self _printBlueLightStatus:&v10];
  if (!v7) {
    -[DBSColorTemperatureController getBlueLightReductionEnabled:]();
  }
  id v8 = [NSNumber numberWithBool:BYTE1(v10)];

  return v8;
}

- (void)setBlueLightReductionEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 BOOLValue];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__DBSColorTemperatureController_setBlueLightReductionEnabled_forSpecifier___block_invoke;
  v12[3] = &unk_264C7A5C0;
  objc_copyWeak(&v13, &location);
  char v14 = v8;
  v9 = (void (**)(void))MEMORY[0x237DF4780](v12);
  if (v8 && _AXSScreenFilterApplied())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __75__DBSColorTemperatureController_setBlueLightReductionEnabled_forSpecifier___block_invoke_2;
    v10[3] = &unk_264C7A5E8;
    v10[4] = self;
    id v11 = v7;
    [(DBSColorTemperatureController *)self showAlertToDisableAccessibilityFiltersForBlueLightReduction:v9 cancel:v10];
  }
  else
  {
    v9[2](v9);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __75__DBSColorTemperatureController_setBlueLightReductionEnabled_forSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _brightnessClient];
  uint64_t v3 = [v2 blueLightClient];
  [v3 setEnabled:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __75__DBSColorTemperatureController_setBlueLightReductionEnabled_forSpecifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

- (id)getBlueLightReductionScheduleEnabled:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DBSColorTemperatureController *)self _brightnessClient];
  id v6 = [v5 blueLightClient];
  char v7 = [v6 getBlueLightStatus:&v10];

  if ((v7 & 1) == 0) {
    -[DBSColorTemperatureController getBlueLightReductionScheduleEnabled:]();
  }
  int v8 = [NSNumber numberWithBool:DWORD1(v10) != 0];

  return v8;
}

- (void)setBlueLightReductionSchedule:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 BOOLValue];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__DBSColorTemperatureController_setBlueLightReductionSchedule_forSpecifier___block_invoke;
  v12[3] = &unk_264C7A5C0;
  objc_copyWeak(&v13, &location);
  char v14 = v8;
  v9 = (void (**)(void))MEMORY[0x237DF4780](v12);
  if (v8 && _AXSScreenFilterApplied())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__DBSColorTemperatureController_setBlueLightReductionSchedule_forSpecifier___block_invoke_2;
    v10[3] = &unk_264C7A5E8;
    v10[4] = self;
    id v11 = v7;
    [(DBSColorTemperatureController *)self showAlertToDisableAccessibilityFiltersForBlueLightReduction:v9 cancel:v10];
  }
  else
  {
    v9[2](v9);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __76__DBSColorTemperatureController_setBlueLightReductionSchedule_forSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _brightnessClient];
  uint64_t v3 = [v2 blueLightClient];
  [v3 setMode:2 * *(unsigned __int8 *)(a1 + 40)];

  [WeakRetained showScheduleRange:*(unsigned __int8 *)(a1 + 40) animated:1];
  id v4 = [WeakRetained _manualSwitchSpecifier];
  [WeakRetained reloadSpecifier:v4 animated:1];
}

uint64_t __76__DBSColorTemperatureController_setBlueLightReductionSchedule_forSpecifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

- (void)showAlertToDisableAccessibilityFiltersForBlueLightReduction:(id)a3 cancel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x263F82418];
  v9 = DBS_LocalizedStringForColorTemperature(@"DISABLE_AX_FILTERS_TITLE");
  long long v10 = DBS_LocalizedStringForColorTemperature(@"DISABLE_AX_FILTERS_MESSAGE");
  id v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

  int v12 = (void *)MEMORY[0x263F82400];
  id v13 = DBS_LocalizedStringForColorTemperature(@"DISABLE_AX_FILTERS_ENABLE");
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __100__DBSColorTemperatureController_showAlertToDisableAccessibilityFiltersForBlueLightReduction_cancel___block_invoke;
  v25[3] = &unk_264C7A610;
  id v26 = v6;
  id v14 = v6;
  int v15 = [v12 actionWithTitle:v13 style:0 handler:v25];
  [v11 addAction:v15];

  objc_super v16 = (void *)MEMORY[0x263F82400];
  v17 = DBS_LocalizedStringForColorTemperature(@"DISABLE_AX_FILTERS_CANCEL");
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  __int16 v22 = __100__DBSColorTemperatureController_showAlertToDisableAccessibilityFiltersForBlueLightReduction_cancel___block_invoke_2;
  int v23 = &unk_264C7A610;
  id v24 = v7;
  id v18 = v7;
  int v19 = [v16 actionWithTitle:v17 style:1 handler:&v20];
  objc_msgSend(v11, "addAction:", v19, v20, v21, v22, v23);

  [(DBSColorTemperatureController *)self presentViewController:v11 animated:1 completion:0];
}

uint64_t __100__DBSColorTemperatureController_showAlertToDisableAccessibilityFiltersForBlueLightReduction_cancel___block_invoke(uint64_t a1)
{
  _AXSDisableScreenFilters();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

uint64_t __100__DBSColorTemperatureController_showAlertToDisableAccessibilityFiltersForBlueLightReduction_cancel___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)temperatureStrength:(id)a3
{
  id v4 = a3;
  int v11 = 0;
  BOOL v5 = [(DBSColorTemperatureController *)self _brightnessClient];
  id v6 = [v5 blueLightClient];
  char v7 = [v6 getStrength:&v11];

  if ((v7 & 1) == 0) {
    -[DBSColorTemperatureController temperatureStrength:]();
  }
  LODWORD(v8) = v11;
  v9 = [NSNumber numberWithFloat:v8];

  return v9;
}

- (void)setTemperatureStrength:(id)a3 specifier:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  char v7 = [v6 propertyForKey:*MEMORY[0x263F60028]];
  [v26 floatValue];
  int v9 = v8;
  int v10 = [v7 isTracking];
  int v11 = [(DBSColorTemperatureController *)self _brightnessClient];
  int v12 = [v11 blueLightClient];
  id v13 = v12;
  if (v10)
  {
    [v12 suspendNotifications:1];

    id v14 = [(DBSColorTemperatureController *)self _brightnessClient];
    int v15 = [v14 blueLightClient];
    LODWORD(v16) = v9;
    char v17 = [v15 setStrength:0 commit:v16];
  }
  else
  {
    [v12 suspendNotifications:0];

    BOOL temperatureSliderWasTracking = self->_temperatureSliderWasTracking;
    id v14 = [(DBSColorTemperatureController *)self _brightnessClient];
    int v19 = [v14 blueLightClient];
    int v15 = v19;
    if (temperatureSliderWasTracking)
    {
      LODWORD(v21) = 1.0;
      LODWORD(v20) = v9;
      uint64_t v22 = 1;
    }
    else
    {
      LODWORD(v21) = 1045220557;
      LODWORD(v20) = v9;
      uint64_t v22 = 0;
    }
    char v17 = [v19 setStrength:v22 withPeriod:v20 commit:v21];
  }
  char v23 = v17;

  [(NSTimer *)self->_blueLightReductionLabelRefreshTimer invalidate];
  id v24 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_colorTemperatureSliderDidChange selector:0 userInfo:0 repeats:0.2];
  blueLightReductionLabelRefreshTimer = self->_blueLightReductionLabelRefreshTimer;
  self->_blueLightReductionLabelRefreshTimer = v24;

  if ((v23 & 1) == 0) {
    -[DBSColorTemperatureController setTemperatureStrength:specifier:]();
  }
  self->_BOOL temperatureSliderWasTracking = v10;
}

- (void)colorTemperatureSliderDidChange
{
  uint64_t v3 = [(DBSColorTemperatureController *)self _temperatureSlider];
  id v4 = [v3 propertyForKey:*MEMORY[0x263F60028]];

  [v4 value];
  int v6 = v5;
  char v7 = [(DBSColorTemperatureController *)self _brightnessClient];
  int v8 = [v7 blueLightClient];
  LODWORD(v9) = 1.0;
  LODWORD(v10) = v6;
  [v8 setStrength:1 withPeriod:v10 commit:v9];

  int v11 = [(DBSColorTemperatureController *)self specifierForID:@"COLOR_TEMPERATURE"];
  uint64_t v12 = *MEMORY[0x263F600F8];
  id v13 = [v11 propertyForKey:*MEMORY[0x263F600F8]];
  id v14 = [(DBSColorTemperatureController *)self blueLightReductionFooter];
  if (([v13 isEqualToString:v14] & 1) == 0)
  {
    [v11 setProperty:v14 forKey:v12];
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    [(DBSColorTemperatureController *)self getGroup:&v18 row:&v17 ofSpecifier:v11];
    int v15 = [(DBSColorTemperatureController *)self table];
    double v16 = [MEMORY[0x263F088D0] indexSetWithIndex:v18];
    [v15 _reloadSectionHeaderFooters:v16 withRowAnimation:0];
  }
}

- (id)blueLightReductionFooter
{
  float v18 = 0.0;
  uint64_t v3 = [(DBSColorTemperatureController *)self _brightnessClient];
  id v4 = [v3 blueLightClient];
  [v4 getStrength:&v18];

  int v17 = 1056964608;
  int v5 = [(DBSColorTemperatureController *)self _brightnessClient];
  int v6 = [v5 blueLightClient];
  int v7 = [v6 getWarningStrength:&v17];

  if (v7)
  {
    float v8 = *(float *)&v17;
  }
  else
  {
    int v17 = 1056964608;
    float v8 = 0.5;
  }
  if (v18 <= v8)
  {
    double v9 = &stru_26E931C58;
  }
  else
  {
    DBS_LocalizedStringForColorTemperature(@"COLOR_TEMPERATURE_MOTION_WARNING");
    double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_showColorTemperature)
  {
    float v16 = 0.0;
    double v10 = [(DBSColorTemperatureController *)self _brightnessClient];
    int v11 = [v10 blueLightClient];
    [v11 getCCT:&v16];

    uint64_t v12 = [NSString stringWithFormat:@"INTERNAL ONLY:\nWhen Night Shift is enabled, your display's white point is %.0fK.", v16];
    if ([(__CFString *)v9 length])
    {
      id v13 = [NSString stringWithFormat:@"%@\n\n%@", v9, v12];
    }
    else
    {
      id v13 = v12;
    }
    id v14 = v13;

    double v9 = v14;
  }
  return v9;
}

- (id)localizedTimeForTime:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v5 setHour:a3.var0];
  [v5 setMinute:*(uint64_t *)&a3 >> 32];
  id v6 = objc_alloc(MEMORY[0x263EFF8F0]);
  int v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  float v8 = [v7 dateFromComponents:v5];
  double v9 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v8];

  return v9;
}

- (id)fromDetailForCell:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  id v5 = [(DBSColorTemperatureController *)self _brightnessClient];
  id v6 = [v5 blueLightClient];
  char v7 = [v6 getBlueLightStatus:v11];

  if ((v7 & 1) == 0) {
    -[DBSColorTemperatureController fromDetailForCell:]();
  }
  if (!DWORD1(v11[0]) || DWORD1(v11[0]) == 2)
  {
    uint64_t v8 = [(DBSColorTemperatureController *)self localizedTimeForTime:*((void *)&v11[0] + 1)];
    goto LABEL_7;
  }
  if (DWORD1(v11[0]) == 1)
  {
    uint64_t v8 = DBS_LocalizedStringForColorTemperature(@"SUNSET");
LABEL_7:
    double v9 = (void *)v8;
    goto LABEL_9;
  }
  double v9 = 0;
LABEL_9:

  return v9;
}

- (id)toDetailForCell:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  long long v12 = 0u;
  id v5 = [(DBSColorTemperatureController *)self _brightnessClient];
  id v6 = [v5 blueLightClient];
  char v7 = [v6 getBlueLightStatus:&v11];

  if ((v7 & 1) == 0) {
    -[DBSColorTemperatureController toDetailForCell:]();
  }
  if (!DWORD1(v11) || DWORD1(v11) == 2)
  {
    uint64_t v8 = [(DBSColorTemperatureController *)self localizedTimeForTime:(void)v12];
    goto LABEL_7;
  }
  if (DWORD1(v11) == 1)
  {
    uint64_t v8 = DBS_LocalizedStringForColorTemperature(@"SUNRISE");
LABEL_7:
    double v9 = (void *)v8;
    goto LABEL_9;
  }
  double v9 = 0;
LABEL_9:

  return v9;
}

- (CBClient)_brightnessClient
{
  return self->__brightnessClient;
}

- (void)set_brightnessClient:(id)a3
{
}

- (PSSpecifier)_scheduleRangeSpecifier
{
  return self->__scheduleRangeSpecifier;
}

- (void)set_scheduleRangeSpecifier:(id)a3
{
}

- (PSSpecifier)_scheduleSwitchSpecifier
{
  return self->__scheduleSwitchSpecifier;
}

- (void)set_scheduleSwitchSpecifier:(id)a3
{
}

- (PSSpecifier)_manualSwitchSpecifier
{
  return self->__manualSwitchSpecifier;
}

- (void)set_manualSwitchSpecifier:(id)a3
{
}

- (PSSpecifier)_temperatureSlider
{
  return self->__temperatureSlider;
}

- (void)set_temperatureSlider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__temperatureSlider, 0);
  objc_storeStrong((id *)&self->__manualSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->__scheduleSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->__scheduleRangeSpecifier, 0);
  objc_storeStrong((id *)&self->__brightnessClient, 0);
  objc_storeStrong((id *)&self->_blueLightReductionLabelRefreshTimer, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
}

- (void)specifiers
{
  v1 = DBSLogForCategory(0);
  if (OUTLINED_FUNCTION_1(v1)) {
    OUTLINED_FUNCTION_0(&dword_235D7B000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);
  }

  __assert_rtn("-[DBSColorTemperatureController specifiers]", "DBSColorTemperatureController.m", 128, "0");
}

void __62__DBSColorTemperatureController_handleBlueLightStatusChanged___block_invoke_cold_1()
{
  v1 = DBSLogForCategory(0);
  if (OUTLINED_FUNCTION_1(v1)) {
    OUTLINED_FUNCTION_0(&dword_235D7B000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);
  }

  __assert_rtn("-[DBSColorTemperatureController handleBlueLightStatusChanged:]_block_invoke", "DBSColorTemperatureController.m", 177, "0");
}

- (void)getBlueLightReductionEnabled:.cold.1()
{
  v1 = DBSLogForCategory(0);
  if (OUTLINED_FUNCTION_1(v1)) {
    OUTLINED_FUNCTION_0(&dword_235D7B000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);
  }

  __assert_rtn("-[DBSColorTemperatureController getBlueLightReductionEnabled:]", "DBSColorTemperatureController.m", 199, "0");
}

- (void)getBlueLightReductionScheduleEnabled:.cold.1()
{
  v1 = DBSLogForCategory(0);
  if (OUTLINED_FUNCTION_1(v1)) {
    OUTLINED_FUNCTION_0(&dword_235D7B000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);
  }

  __assert_rtn("-[DBSColorTemperatureController getBlueLightReductionScheduleEnabled:]", "DBSColorTemperatureController.m", 228, "0");
}

- (void)temperatureStrength:.cold.1()
{
  v1 = DBSLogForCategory(0);
  if (OUTLINED_FUNCTION_1(v1)) {
    OUTLINED_FUNCTION_0(&dword_235D7B000, v2, v3, "BLR strength could not be queried.", v4, v5, v6, v7, 0);
  }

  __assert_rtn("-[DBSColorTemperatureController temperatureStrength:]", "DBSColorTemperatureController.m", 284, "0");
}

- (void)setTemperatureStrength:specifier:.cold.1()
{
  v1 = DBSLogForCategory(0);
  if (OUTLINED_FUNCTION_1(v1)) {
    OUTLINED_FUNCTION_0(&dword_235D7B000, v2, v3, "BLR strength could not be set.", v4, v5, v6, v7, 0);
  }

  __assert_rtn("-[DBSColorTemperatureController setTemperatureStrength:specifier:]", "DBSColorTemperatureController.m", 316, "0");
}

- (void)fromDetailForCell:.cold.1()
{
  v1 = DBSLogForCategory(0);
  if (OUTLINED_FUNCTION_1(v1)) {
    OUTLINED_FUNCTION_0(&dword_235D7B000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);
  }

  __assert_rtn("-[DBSColorTemperatureController fromDetailForCell:]", "DBSColorTemperatureController.m", 391, "0");
}

- (void)toDetailForCell:.cold.1()
{
  v1 = DBSLogForCategory(0);
  if (OUTLINED_FUNCTION_1(v1)) {
    OUTLINED_FUNCTION_0(&dword_235D7B000, v2, v3, "Could not get blue light status.", v4, v5, v6, v7, 0);
  }

  __assert_rtn("-[DBSColorTemperatureController toDetailForCell:]", "DBSColorTemperatureController.m", 416, "0");
}

@end