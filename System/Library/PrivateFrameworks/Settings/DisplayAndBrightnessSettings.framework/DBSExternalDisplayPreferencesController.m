@interface DBSExternalDisplayPreferencesController
- (BOOL)proModeSupported;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (DBSExternalDisplayPreferencesController)init;
- (DBSZoomAndProSpecifiers)_zoomAndProSpecifierVendor;
- (SBSConnectedDisplayInfo)externalDisplayInfo;
- (id)connectedDisplayName;
- (id)displayModeSpecifiers;
- (id)externalAutoBrightnessValueForSpecifier:(id)a3;
- (id)externalBrightnessSpecifiers;
- (id)externalBrightnessValueForSpecifier:(id)a3;
- (id)getProModeEnabled;
- (id)localizedMagnifyModeName;
- (id)matchContentEnabled:(id)a3;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (unint64_t)supportedZoomModesCount;
- (void)connectedDisplayDidUpdate:(id)a3;
- (void)dealloc;
- (void)displayZoomDidUpdate;
- (void)externalBrightnessDidUpdate:(id)a3;
- (void)handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification:(id)a3;
- (void)handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification:(id)a3;
- (void)handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification:(id)a3;
- (void)insertExternalBrightnessSpecifiers;
- (void)presentModalMagnifyController;
- (void)removeExternalBrightnessSpecifiers;
- (void)setExternalAutoBrightnessValue:(id)a3 specifier:(id)a4;
- (void)setExternalBrightnessValue:(id)a3 specifier:(id)a4;
- (void)setMatchContentEnabled:(id)a3 specifier:(id)a4;
- (void)set_zoomAndProSpecifierVendor:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DBSExternalDisplayPreferencesController

- (DBSExternalDisplayPreferencesController)init
{
  v9.receiver = self;
  v9.super_class = (Class)DBSExternalDisplayPreferencesController;
  v2 = [(DBSExternalDisplayPreferencesController *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_connectedDisplayDidUpdate_ name:DBSExternalDisplayManagerCurrentModeDidChange[0] object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_externalBrightnessDidUpdate_ name:DBSExternalDisplayManagerExternalBrightnessValueDidChange[0] object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification_ name:DBSExternalDisplayManagerExternalBrightnessAvailablityDidChange[0] object:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification_ name:DBSExternalDisplayManagerExternalAutoBrightnessAvailablityDidChange[0] object:0];

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification_ name:DBSExternalDisplayManagerExternalAutoBrightnessValueDidChange[0] object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:DBSExternalDisplayManagerCurrentModeDidChange[0] object:0];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:DBSExternalDisplayManagerExternalBrightnessValueDidChange[0] object:0];

  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:DBSExternalDisplayManagerExternalBrightnessAvailablityDidChange[0] object:0];

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:DBSExternalDisplayManagerExternalAutoBrightnessAvailablityDidChange[0] object:0];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self name:DBSExternalDisplayManagerExternalAutoBrightnessValueDidChange[0] object:0];

  v8.receiver = self;
  v8.super_class = (Class)DBSExternalDisplayPreferencesController;
  [(DBSExternalDisplayPreferencesController *)&v8 dealloc];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)DBSExternalDisplayPreferencesController;
  [(DBSExternalDisplayPreferencesController *)&v2 viewDidLoad];
  ADClientAddValueForScalarKey();
}

- (id)getProModeEnabled
{
  return (id)MEMORY[0x263EFFA80];
}

- (BOOL)proModeSupported
{
  return 0;
}

- (SBSConnectedDisplayInfo)externalDisplayInfo
{
  v3 = [(DBSExternalDisplayPreferencesController *)self parentController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(DBSExternalDisplayPreferencesController *)self parentController];
    v6 = [v5 externalDisplayInfo];
  }
  else
  {
    v6 = 0;
  }
  return (SBSConnectedDisplayInfo *)v6;
}

- (unint64_t)supportedZoomModesCount
{
  objc_super v2 = [(DBSExternalDisplayPreferencesController *)self externalDisplayInfo];
  unint64_t v3 = [v2 supportedScales];

  return ((v3 >> 1) & 1) + (v3 & 1) + ((v3 >> 2) & 1);
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF980] array];
    v6 = +[DBSExternalDisplayManager defaultManager];
    int v7 = [v6 externalDisplayBrightnessAvailable];

    if (v7)
    {
      objc_super v8 = [(DBSExternalDisplayPreferencesController *)self externalBrightnessSpecifiers];
      [v5 addObjectsFromArray:v8];
    }
    if (DBSReverseZoomEnabled()
      && DBSChamoisEnabled()
      && [(DBSExternalDisplayPreferencesController *)self supportedZoomModesCount] >= 2)
    {
      objc_super v9 = objc_opt_new();
      [v9 setDelegate:self];
      v10 = [v9 specifiers];

      if (v10)
      {
        v11 = [v9 specifiers];
        [v5 addObjectsFromArray:v11];
      }
      [(DBSExternalDisplayPreferencesController *)self set_zoomAndProSpecifierVendor:v9];
    }
    v12 = [(DBSExternalDisplayPreferencesController *)self displayModeSpecifiers];
    [v5 addObjectsFromArray:v12];

    v13 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    v14 = DBS_LocalizedStringForConnectedDisplays(@"MATCH_CONTENT_FOOTER");
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x263F600F8]];

    [v5 addObject:v13];
    v15 = (void *)MEMORY[0x263F5FC40];
    v16 = DBS_LocalizedStringForConnectedDisplays(@"MATCH_CONTENT");
    v17 = [v15 preferenceSpecifierNamed:v16 target:self set:sel_setMatchContentEnabled_specifier_ get:sel_matchContentEnabled_ detail:0 cell:6 edit:0];

    [v17 setObject:@"MATCH_CONTENT" forKeyedSubscript:*MEMORY[0x263F60138]];
    [v5 addObject:v17];
    v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(DBSExternalDisplayPreferencesController *)self specifierAtIndexPath:v7];
  objc_super v9 = [(DBSExternalDisplayPreferencesController *)self specifierForID:@"COLOR_SETTING"];
  v10 = [v8 objectForKeyedSubscript:@"HDRMode"];
  v11 = +[DBSExternalDisplayManager defaultManager];
  v12 = [v11 currentHDRMode];
  char v13 = [v12 isEqualToString:v10];

  if ((v13 & 1) == 0)
  {
    v14 = +[DBSExternalDisplayManager defaultManager];
    v15 = [v14 preferredHDRModes];

    if ([v15 containsObject:v10])
    {
      v16 = +[DBSExternalDisplayManager defaultManager];
      [v16 setCurrentHDRMode:v10];

      if ([v10 isEqualToString:*MEMORY[0x263F15A30]]
        || [v10 isEqualToString:*MEMORY[0x263F15A38]]
        || [v10 isEqualToString:*MEMORY[0x263F15A40]])
      {
        ADClientAddValueForScalarKey();
      }
      else
      {
        v27 = DBSLogForCategory(0);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = self;
          _os_log_impl(&dword_235D7B000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: unexcepted HDR mode.", (uint8_t *)location, 0xCu);
        }
      }
      [v9 setProperty:v8 forKey:*MEMORY[0x263F60200]];
      [(DBSExternalDisplayPreferencesController *)self reloadSpecifier:v9];
    }
    else if (v10)
    {
      v17 = (void *)MEMORY[0x263F82418];
      v18 = DBS_LocalizedStringForConnectedDisplays(@"LIMIT_REFRESH_RATE_TITLE");
      v19 = DBS_LocalizedStringForConnectedDisplays(@"LIMIT_REFRESH_RATE_MESSAGE");
      v20 = [v17 alertControllerWithTitle:v18 message:v19 preferredStyle:1];

      objc_initWeak(location, self);
      v21 = (void *)MEMORY[0x263F82400];
      v22 = DBS_LocalizedStringForConnectedDisplays(@"LIMIT_REFRESH_RATE_CONFIRM");
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __77__DBSExternalDisplayPreferencesController_tableView_didSelectRowAtIndexPath___block_invoke;
      v29[3] = &unk_264C7A730;
      objc_copyWeak(&v33, location);
      id v30 = v10;
      id v31 = v9;
      id v32 = v8;
      v23 = [v21 actionWithTitle:v22 style:0 handler:v29];
      [v20 addAction:v23];

      v24 = (void *)MEMORY[0x263F82400];
      v25 = DBS_LocalizedStringForConnectedDisplays(@"LIMIT_REFRESH_RATE_CANCEL");
      v26 = [v24 actionWithTitle:v25 style:1 handler:&__block_literal_global_1];
      [v20 addAction:v26];

      [(DBSExternalDisplayPreferencesController *)self presentViewController:v20 animated:1 completion:0];
      objc_destroyWeak(&v33);
      objc_destroyWeak(location);
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)DBSExternalDisplayPreferencesController;
  [(DBSExternalDisplayPreferencesController *)&v28 tableView:v6 didSelectRowAtIndexPath:v7];
}

void __77__DBSExternalDisplayPreferencesController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = +[DBSExternalDisplayManager defaultManager];
  [v3 setCurrentHDRMode:*(void *)(a1 + 32)];

  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F15A30]])
  {
    ADClientAddValueForScalarKey();
  }
  else
  {
    v4 = DBSLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = WeakRetained;
      _os_log_impl(&dword_235D7B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: unexcepted limited refresh rate HDR mode.", (uint8_t *)&v5, 0xCu);
    }
  }
  [*(id *)(a1 + 40) setProperty:*(void *)(a1 + 48) forKey:*MEMORY[0x263F60200]];
  [WeakRetained reloadSpecifier:*(void *)(a1 + 40)];
}

uint64_t __77__DBSExternalDisplayPreferencesController_tableView_didSelectRowAtIndexPath___block_invoke_88()
{
  return ADClientAddValueForScalarKey();
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(DBSExternalDisplayPreferencesController *)self specifierAtIndexPath:v7];
  objc_super v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F60138]];
  char v10 = [v9 isEqualToString:@"MATCH_CONTENT"];

  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DBSExternalDisplayPreferencesController;
    BOOL v11 = [(DBSExternalDisplayPreferencesController *)&v13 tableView:v6 shouldHighlightRowAtIndexPath:v7];
  }

  return v11;
}

- (id)matchContentEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  v4 = +[DBSExternalDisplayManager defaultManager];
  int v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "matchContent"));

  return v5;
}

- (void)setMatchContentEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  int v5 = +[DBSExternalDisplayManager defaultManager];
  objc_msgSend(v5, "setMatchContent:", objc_msgSend(v4, "BOOLValue"));

  [v4 BOOLValue];
  ADClientAddValueForScalarKey();
}

- (void)connectedDisplayDidUpdate:(id)a3
{
  id v4 = +[DBSExternalDisplayManager defaultManager];
  char v5 = [v4 externalDisplayAvailable];

  if ((v5 & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__DBSExternalDisplayPreferencesController_connectedDisplayDidUpdate___block_invoke;
    block[3] = &unk_264C7A6B0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __69__DBSExternalDisplayPreferencesController_connectedDisplayDidUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (id)externalBrightnessSpecifiers
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = +[DBSExternalDisplayManager defaultManager];
  int v5 = [v4 externalDisplayBrightnessAvailable];

  if (v5)
  {
    uint64_t v6 = (int)*MEMORY[0x263F5FDB8];
    if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v6)
      || ([(DBSExternalDisplayPreferencesController *)self specifierForID:@"BRIGHTNESS_GROUP"],
          (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"BRIGHTNESS_GROUP"];
      objc_super v8 = DBS_LocalizedStringForConnectedDisplays(@"BRIGHTNESS_GROUP");
      [v7 setName:v8];
    }
    [v3 addObject:v7];
    if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v6)
      || ([(DBSExternalDisplayPreferencesController *)self specifierForID:@"EXTERNAL_BRIGHTNESS"], (objc_super v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_super v9 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:sel_setExternalBrightnessValue_specifier_ get:sel_externalBrightnessValueForSpecifier_ detail:0 cell:5 edit:0];
      [v9 setObject:@"EXTERNAL_BRIGHTNESS" forKeyedSubscript:*MEMORY[0x263F60138]];
      char v10 = objc_msgSend(MEMORY[0x263F827E8], "dbs_minSliderImage");
      [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x263F60240]];

      BOOL v11 = objc_msgSend(MEMORY[0x263F827E8], "dbs_maxSliderImage");
      [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x263F60250]];

      [v9 setObject:&unk_26E9391A0 forKeyedSubscript:*MEMORY[0x263F60038]];
      [v9 setObject:&unk_26E9391B0 forKeyedSubscript:*MEMORY[0x263F60030]];
      [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60230]];
    }
    [v3 addObject:v9];
    v12 = +[DBSExternalDisplayManager defaultManager];
    int v13 = [v12 externalDisplayAutoBrightnessAvailable];

    if (v13)
    {
      if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v6)
        || ([(DBSExternalDisplayPreferencesController *)self specifierForID:@"EXTERNAL_AUTO_BRIGHTNESS"], (v14 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v15 = (void *)MEMORY[0x263F5FC40];
        v16 = DBS_LocalizedStringForConnectedDisplays(@"EXTERNAL_AUTO_BRIGHTNESS");
        v14 = [v15 preferenceSpecifierNamed:v16 target:self set:sel_setExternalAutoBrightnessValue_specifier_ get:sel_externalAutoBrightnessValueForSpecifier_ detail:0 cell:6 edit:0];

        [v14 setObject:@"EXTERNAL_AUTO_BRIGHTNESS" forKeyedSubscript:*MEMORY[0x263F60138]];
      }
      [v3 addObject:v14];
    }
  }
  return v3;
}

- (void)externalBrightnessDidUpdate:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    int v5 = [(DBSExternalDisplayPreferencesController *)self specifierForID:@"EXTERNAL_BRIGHTNESS"];
    [(DBSExternalDisplayPreferencesController *)self reloadSpecifier:v5];
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__DBSExternalDisplayPreferencesController_externalBrightnessDidUpdate___block_invoke;
    block[3] = &unk_264C7A778;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_sync(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __71__DBSExternalDisplayPreferencesController_externalBrightnessDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained externalBrightnessDidUpdate:*(void *)(a1 + 32)];
}

- (id)externalBrightnessValueForSpecifier:(id)a3
{
  uint64_t v3 = +[DBSExternalDisplayManager defaultManager];
  id v4 = [v3 externalDisplayBrightness];

  return v4;
}

- (void)setExternalBrightnessValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v11 = [(DBSExternalDisplayPreferencesController *)self indexPathForSpecifier:a4];
  id v7 = [(DBSExternalDisplayPreferencesController *)self table];
  id v8 = [v7 cellForRowAtIndexPath:v11];

  objc_super v9 = [v8 control];
  char v10 = +[DBSExternalDisplayManager defaultManager];
  objc_msgSend(v10, "setExternalDisplayBrightness:shouldCommit:", v6, objc_msgSend(v9, "isTracking") ^ 1);

  ADClientAddValueForScalarKey();
}

- (id)externalAutoBrightnessValueForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = +[DBSExternalDisplayManager defaultManager];
  int v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "autoBrightnessEnabled"));

  return v5;
}

- (void)setExternalAutoBrightnessValue:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[DBSExternalDisplayManager defaultManager];
  uint64_t v5 = [v4 BOOLValue];

  [v6 setAutoBrightnessEnabled:v5];
}

- (void)insertExternalBrightnessSpecifiers
{
  id v4 = [(DBSExternalDisplayPreferencesController *)self externalBrightnessSpecifiers];
  [(DBSExternalDisplayPreferencesController *)self removeContiguousSpecifiers:v4 animated:0];
  uint64_t v3 = [(DBSExternalDisplayPreferencesController *)self externalBrightnessSpecifiers];
  [(DBSExternalDisplayPreferencesController *)self insertContiguousSpecifiers:v3 afterSpecifierID:0 animated:1];
}

- (void)removeExternalBrightnessSpecifiers
{
  id v3 = [(DBSExternalDisplayPreferencesController *)self externalBrightnessSpecifiers];
  [(DBSExternalDisplayPreferencesController *)self removeContiguousSpecifiers:v3 animated:1];
}

- (void)handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v5 = +[DBSExternalDisplayManager defaultManager];
    int v6 = [v5 externalDisplayBrightnessAvailable];

    if (v6) {
      [(DBSExternalDisplayPreferencesController *)self insertExternalBrightnessSpecifiers];
    }
    else {
      [(DBSExternalDisplayPreferencesController *)self removeExternalBrightnessSpecifiers];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __125__DBSExternalDisplayPreferencesController_handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification___block_invoke;
    block[3] = &unk_264C7A778;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_sync(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __125__DBSExternalDisplayPreferencesController_handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification:*(void *)(a1 + 32)];
}

- (void)handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v5 = +[DBSExternalDisplayManager defaultManager];
    int v6 = [v5 externalDisplayAutoBrightnessAvailable];

    if (v6) {
      [(DBSExternalDisplayPreferencesController *)self insertExternalBrightnessSpecifiers];
    }
    else {
      [(DBSExternalDisplayPreferencesController *)self removeExternalBrightnessSpecifiers];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __168__DBSExternalDisplayPreferencesController_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification___block_invoke;
    block[3] = &unk_264C7A778;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_sync(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __168__DBSExternalDisplayPreferencesController_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification:*(void *)(a1 + 32)];
}

- (void)handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v5 = [(DBSExternalDisplayPreferencesController *)self specifierForID:@"EXTERNAL_AUTO_BRIGHTNESS"];
    if (v5) {
      [(DBSExternalDisplayPreferencesController *)self reloadSpecifier:v5];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __162__DBSExternalDisplayPreferencesController_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification___block_invoke;
    block[3] = &unk_264C7A778;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_sync(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __162__DBSExternalDisplayPreferencesController_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification:*(void *)(a1 + 32)];
}

- (id)displayModeSpecifiers
{
  v52[3] = *MEMORY[0x263EF8340];
  id v45 = [MEMORY[0x263EFF980] array];
  uint64_t v2 = *MEMORY[0x263F15A30];
  v51[0] = *MEMORY[0x263F15A30];
  id v3 = DBS_LocalizedStringForConnectedDisplays(@"DOLBY_VISION");
  v52[0] = v3;
  uint64_t v35 = *MEMORY[0x263F15A38];
  v51[1] = *MEMORY[0x263F15A38];
  id v4 = DBS_LocalizedStringForConnectedDisplays(@"HIGH_DYNAMIC_RANGE");
  v52[1] = v4;
  uint64_t v40 = *MEMORY[0x263F15A40];
  v51[2] = *MEMORY[0x263F15A40];
  uint64_t v5 = DBS_LocalizedStringForConnectedDisplays(@"STANDARD_DYNAMIC_RANGE");
  v52[2] = v5;
  v44 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];

  int v6 = +[DBSExternalDisplayManager defaultManager];
  id v7 = [v6 supportedHDRModes];

  id v8 = +[DBSExternalDisplayManager defaultManager];
  v36 = [v8 preferredHDRModes];

  unint64_t v9 = [v7 count];
  char v10 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v10 setObject:@"COLOR_SETTING" forKeyedSubscript:*MEMORY[0x263F60138]];
  [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60168]];
  unint64_t v42 = v9;
  if (v9 < 2)
  {
    int v13 = DBS_LocalizedStringForConnectedDisplays(@"COLOR_SETTING");
    [v10 setName:v13];

    v12 = @"SDR_COLOR_SETTING_FOOTER";
  }
  else
  {
    id v11 = DBS_LocalizedStringForConnectedDisplays(@"PREFERRED_COLOR_SETTING");
    [v10 setName:v11];

    if ([v7 containsObject:v2]) {
      v12 = @"DOLBY_COLOR_SETTING_FOOTER";
    }
    else {
      v12 = @"HDR_COLOR_SETTING_FOOTER";
    }
  }
  v14 = DBS_LocalizedStringForConnectedDisplays(v12);
  [v10 setObject:v14 forKeyedSubscript:*MEMORY[0x263F600F8]];

  v34 = v10;
  [v45 addObject:v10];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v7;
  uint64_t v15 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v15)
  {
    v17 = 0;
    goto LABEL_30;
  }
  uint64_t v16 = v15;
  uint64_t v37 = v2;
  v17 = 0;
  uint64_t v18 = *(void *)v47;
  uint64_t v19 = *MEMORY[0x263F5FFE0];
  uint64_t v39 = *MEMORY[0x263F600A8];
  uint64_t v38 = *MEMORY[0x263F60308];
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v47 != v18) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      v22 = (void *)MEMORY[0x263F5FC40];
      v23 = [v44 objectForKeyedSubscript:v21];
      v24 = [v22 preferenceSpecifierNamed:v23 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

      [v24 setObject:v21 forKeyedSubscript:@"HDRMode"];
      [v24 setObject:objc_opt_class() forKeyedSubscript:v19];
      if (v42 < 2)
      {
        [v24 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v39];
        goto LABEL_24;
      }
      if ([v21 isEqualToString:v40])
      {
        v25 = @"MOST_COMPATIBLE";
      }
      else
      {
        if (([obj containsObject:v37] & 1) == 0
          && [v21 isEqualToString:v35])
        {
LABEL_22:
          v25 = @"RECOMMENDED";
          goto LABEL_23;
        }
        int v26 = [v36 containsObject:v37];
        int v27 = [v21 isEqualToString:v37];
        if (v26)
        {
          if (v27) {
            goto LABEL_22;
          }
          v25 = @"GOOD";
        }
        else
        {
          if (!v27) {
            goto LABEL_22;
          }
          v25 = @"REFRESH_RATE_LIMITED";
        }
      }
LABEL_23:
      objc_super v28 = DBS_LocalizedStringForConnectedDisplays(v25);
      [v24 setObject:v28 forKeyedSubscript:v38];

LABEL_24:
      v29 = +[DBSExternalDisplayManager defaultManager];
      id v30 = [v29 currentHDRMode];
      int v31 = [v30 isEqualToString:v21];

      if (v31)
      {
        id v32 = v24;

        v17 = v32;
      }
      [v45 addObject:v24];
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v16);
LABEL_30:

  [v34 setProperty:v17 forKey:*MEMORY[0x263F60200]];
  return v45;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:*MEMORY[0x263F60308]];
}

- (void)presentModalMagnifyController
{
  id v12 = objc_alloc_init(MEMORY[0x263F5FC30]);
  uint64_t v3 = (int)*MEMORY[0x263F5FE98];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  uint64_t v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  [v4 setProperty:v6 forKey:*MEMORY[0x263F60228]];

  [v12 setSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + v3)];
  [v12 setParentController:self];
  [v12 setupController];
  [v12 setModalPresentationStyle:2];
  id v7 = [v12 controller];
  id v8 = [(DBSExternalDisplayPreferencesController *)self parentController];
  objc_opt_class();
  LOBYTE(v3) = objc_opt_isKindOfClass();

  if (v3)
  {
    unint64_t v9 = [(DBSExternalDisplayPreferencesController *)self parentController];
    char v10 = [v9 displayService];
    [v7 setDisplayService:v10];

    id v11 = [v9 externalDisplayInfo];
    [v7 setExternalDisplayInfo:v11];
  }
  [v7 setDelegate:self];
  [(DBSExternalDisplayPreferencesController *)self presentViewController:v12 animated:1 completion:0];
}

- (id)localizedMagnifyModeName
{
  uint64_t v2 = [(DBSExternalDisplayPreferencesController *)self externalDisplayInfo];
  uint64_t v3 = [v2 displayModeSettings];
  unint64_t v4 = [v3 scale];

  if (v4 > 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = DBS_LocalizedStringForMagnify(off_264C7A798[v4]);
  }
  return v5;
}

- (void)displayZoomDidUpdate
{
  [(DBSExternalDisplayPreferencesController *)self dismissViewControllerAnimated:1 completion:0];
  uint64_t v3 = [(DBSExternalDisplayPreferencesController *)self parentController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(DBSExternalDisplayPreferencesController *)self parentController];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __63__DBSExternalDisplayPreferencesController_displayZoomDidUpdate__block_invoke;
    v6[3] = &unk_264C7A6B0;
    v6[4] = self;
    [v5 updateExternalDisplayInfoWithCompletionHandler:v6];
  }
}

uint64_t __63__DBSExternalDisplayPreferencesController_displayZoomDidUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)connectedDisplayName
{
  uint64_t v2 = +[DBSExternalDisplayManager defaultManager];
  uint64_t v3 = [v2 externalDisplayName];

  return v3;
}

- (DBSZoomAndProSpecifiers)_zoomAndProSpecifierVendor
{
  return self->__zoomAndProSpecifierVendor;
}

- (void)set_zoomAndProSpecifierVendor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end