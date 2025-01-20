@interface DBSSettingsController
+ (id)BOOLeanCapabilitiesToTest;
- (BOOL)proModeSupported;
- (BOOL)shouldShowAlwaysOn;
- (BOOL)shouldShowAutoLock;
- (BOOL)shouldShowCaseLockOption;
- (CBClient)_brightnessClient;
- (DBSSettingsController)init;
- (DBSSettingsController)initWithNibName:(id)a3 bundle:(id)a4;
- (DBSZoomAndProSpecifiers)_zoomAndProSpecifierVendor;
- (PSSetupController)arrangementViewController;
- (SBSConnectedDisplayInfo)externalDisplayInfo;
- (SBSExternalDisplayService)displayService;
- (UISUserInterfaceStyleMode)_styleMode;
- (id)_darkAppearanceTimeString;
- (id)_deviceAppearanceScheduleSpecifier;
- (id)_deviceAppearanceScheduleString;
- (id)_isCameraControlRequireScreenOn:(id)a3;
- (id)_lightAppearanceTimeString;
- (id)blueLightSchedule:(id)a3;
- (id)boldTextEnabledForSpecifier:(id)a3;
- (id)connectedDisplayName;
- (id)connectedDisplaySpecifiers;
- (id)getAppearanceValueForSpecifier:(id)a3;
- (id)getAutomaticAppearanceEnabledForSpecifier:(id)a3;
- (id)localizedTimeForTime:(id)a3;
- (id)lockGroupFooter;
- (id)locksAndUnlocksWithCase:(id)a3;
- (id)makeArrangementSpecifier;
- (id)screenLock:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_localizeAutoLockTitles;
- (void)_localizeAutoLockTitlesWithSpecifiers:(id)a3;
- (void)_reloadBlueLightSpecifiers:(id)a3 reloadUI:(BOOL)a4;
- (void)_setCameraControlRequireScreenOn:(id)a3 specifier:(id)a4;
- (void)_updateAutoLockSpecifiers:(id)a3;
- (void)_updateDeviceAppearanceToNewInterfaceStyle:(int64_t)a3;
- (void)arrangementViewControllerDidDismiss:(id)a3;
- (void)dealloc;
- (void)deviceAppearanceTableViewCellUserDidTapOnDarkAppearance:(id)a3;
- (void)deviceAppearanceTableViewCellUserDidTapOnLightAppearance:(id)a3;
- (void)handleBlueLightStatusChanged:(id *)a3;
- (void)handleDBSExternalDisplayManagerCurrentModeDidChangeNotification:(id)a3;
- (void)handleDisplayServiceInfoUpdate;
- (void)insertArrangementSpecifier;
- (void)insertExternalDisplaySpecifiers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentArrangementController;
- (void)presentModalMagnifyController;
- (void)profileNotification:(id)a3;
- (void)removeExternalDisplaySpecifiers;
- (void)setAppearanceValue:(id)a3 forSpecifier:(id)a4;
- (void)setArrangementViewController:(id)a3;
- (void)setAutomaticAppearanceEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4;
- (void)setDisplayService:(id)a3;
- (void)setExternalDisplayInfo:(id)a3;
- (void)setLocksAndUnlocksWithCase:(id)a3 specifier:(id)a4;
- (void)setScreenLock:(id)a3 specifier:(id)a4;
- (void)set_brightnessClient:(id)a3;
- (void)set_styleMode:(id)a3;
- (void)set_zoomAndProSpecifierVendor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAutoLockSpecifier;
- (void)updateExternalDisplayInfoWithCompletionHandler:(id)a3;
- (void)updateForExternalMonitorAvailability:(BOOL)a3;
- (void)updateReferenceDependentUIElements;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DBSSettingsController

+ (id)BOOLeanCapabilitiesToTest
{
  v5[8] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F60208];
  v5[0] = *MEMORY[0x263F601D8];
  v5[1] = v2;
  v5[2] = *MEMORY[0x263F60088];
  v5[3] = @"hall-effect-sensor";
  v5[4] = @"ambient-light-sensor";
  v5[5] = @"ipad";
  v5[6] = @"j8/Omm6s1lsmTDFsXjsBfA";
  v5[7] = @"DeviceSupportsEnhancedMultitasking";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:8];
  return v3;
}

- (DBSSettingsController)init
{
  v65.receiver = self;
  v65.super_class = (Class)DBSSettingsController;
  uint64_t v2 = [(DBSSettingsController *)&v65 init];
  if (v2)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)apple_numbers_changed_notification, (CFStringRef)*MEMORY[0x263EFFCC8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_profileNotification_ name:@"PSProfileConnectionRestrictionChangedNotification" object:0];
    [v4 addObserver:v2 selector:sel_profileNotification_ name:@"PSProfileConnectionEffectiveSettingsChangedNotification" object:0];
    v62 = v4;
    [v4 addObserver:v2 selector:sel_handleDBSExternalDisplayManagerCurrentModeDidChangeNotification_ name:DBSExternalDisplayManagerCurrentModeDidChange[0] object:0];
    if (PSGetCapabilityBoolAnswer())
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HasSeenACaseLatchCoverChanged, @"com.apple.springboard.HasSeenACaseLatchCoverNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    id v63 = objc_alloc(MEMORY[0x263EFF8C0]);
    v6 = [NSNumber numberWithInt:30];
    v7 = [NSNumber numberWithInt:60];
    v8 = [NSNumber numberWithInt:120];
    v9 = [NSNumber numberWithInt:180];
    v10 = [NSNumber numberWithInt:240];
    v11 = [NSNumber numberWithInt:300];
    v12 = [NSNumber numberWithInt:600];
    v13 = [NSNumber numberWithInt:900];
    v14 = [NSNumber numberWithInt:0xFFFFFFFFLL];
    v64 = objc_msgSend(v63, "initWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, v14, 0);

    v15 = [MEMORY[0x263EFF980] array];
    id v16 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v16 setSecond:30];
    v61 = v16;
    v17 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v16 unitsStyle:3];
    objc_msgSend(v15, "na_safeAddObject:", v17);

    id v18 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v18 setMinute:1];
    v60 = v18;
    v19 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v18 unitsStyle:3];
    objc_msgSend(v15, "na_safeAddObject:", v19);

    id v20 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v20 setMinute:2];
    v59 = v20;
    v21 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v20 unitsStyle:3];
    objc_msgSend(v15, "na_safeAddObject:", v21);

    id v22 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v22 setMinute:3];
    v58 = v22;
    v23 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v22 unitsStyle:3];
    objc_msgSend(v15, "na_safeAddObject:", v23);

    id v24 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v24 setMinute:4];
    v57 = v24;
    v25 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v24 unitsStyle:3];
    objc_msgSend(v15, "na_safeAddObject:", v25);

    id v26 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v26 setMinute:5];
    v56 = v26;
    v27 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v26 unitsStyle:3];
    objc_msgSend(v15, "na_safeAddObject:", v27);

    id v28 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v28 setMinute:10];
    v55 = v28;
    v29 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v28 unitsStyle:3];
    objc_msgSend(v15, "na_safeAddObject:", v29);

    id v30 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v30 setMinute:15];
    v54 = v30;
    v31 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v30 unitsStyle:3];
    objc_msgSend(v15, "na_safeAddObject:", v31);

    v32 = DBS_LocalizedStringForDisplays(@"NEVER");
    objc_msgSend(v15, "na_safeAddObject:", v32);

    v33 = [MEMORY[0x263F82670] currentDevice];
    LODWORD(v14) = objc_msgSend(v33, "sf_isiPad");

    id v34 = objc_alloc(MEMORY[0x263EFF8C0]);
    if (v14)
    {
      v35 = [v64 objectAtIndex:2];
      v36 = [v64 objectAtIndex:5];
      v37 = [v64 objectAtIndex:6];
      v38 = [v64 objectAtIndex:7];
      v39 = [v64 objectAtIndex:8];
      uint64_t v40 = objc_msgSend(v34, "initWithObjects:", v35, v36, v37, v38, v39, 0);
      autoLockValues = v2->_autoLockValues;
      v2->_autoLockValues = (NSArray *)v40;
    }
    else
    {
      v35 = [v64 objectAtIndex:0];
      v36 = [v64 objectAtIndex:1];
      v37 = [v64 objectAtIndex:2];
      v38 = [v64 objectAtIndex:3];
      v39 = [v64 objectAtIndex:4];
      autoLockValues = [v64 objectAtIndex:5];
      v42 = [v64 objectAtIndex:8];
      uint64_t v43 = objc_msgSend(v34, "initWithObjects:", v35, v36, v37, v38, v39, autoLockValues, v42, 0);
      v44 = v2->_autoLockValues;
      v2->_autoLockValues = (NSArray *)v43;
    }
    uint64_t v45 = [objc_alloc(NSDictionary) initWithObjects:v15 forKeys:v64];
    autoLockTitleDictionary = v2->_autoLockTitleDictionary;
    v2->_autoLockTitleDictionary = (NSDictionary *)v45;

    uint64_t v47 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v2->_autoLockTitleDictionary];
    localizedAutoLockTitleDictionary = v2->_localizedAutoLockTitleDictionary;
    v2->_localizedAutoLockTitleDictionary = (NSMutableDictionary *)v47;

    uint64_t v49 = [objc_alloc(MEMORY[0x263F83E90]) initWithDelegate:v2];
    styleMode = v2->__styleMode;
    v2->__styleMode = (UISUserInterfaceStyleMode *)v49;

    v51 = [MEMORY[0x263F15778] mainDisplay];
    v52 = NSStringFromSelector(sel_isReferenceLimited);
    [v51 addObserver:v2 forKeyPath:v52 options:1 context:0];
  }
  return v2;
}

- (DBSSettingsController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)DBSSettingsController;
  v8 = [(DBSSettingsController *)&v24 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = (CBClient *)objc_alloc_init(MEMORY[0x263F34248]);
    brightnessClient = v8->__brightnessClient;
    v8->__brightnessClient = v9;

    objc_initWeak(&location, v8);
    v11 = [(DBSSettingsController *)v8 _brightnessClient];
    v12 = [v11 blueLightClient];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __48__DBSSettingsController_initWithNibName_bundle___block_invoke;
    v21[3] = &unk_264C7A570;
    objc_copyWeak(&v22, &location);
    [v12 setStatusNotificationBlock:v21];

    uint64_t v13 = objc_opt_new();
    displayService = v8->_displayService;
    v8->_displayService = (SBSExternalDisplayService *)v13;

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __48__DBSSettingsController_initWithNibName_bundle___block_invoke_2;
    v19[3] = &unk_264C7A6B0;
    v15 = v8;
    id v20 = v15;
    [v15 updateExternalDisplayInfoWithCompletionHandler:v19];
    id v16 = objc_alloc_init(MEMORY[0x263F08790]);
    id v17 = v15[176];
    v15[176] = v16;

    [v15[176] setTimeStyle:1];
    [v15[176] setDateStyle:0];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __48__DBSSettingsController_initWithNibName_bundle___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleBlueLightStatusChanged:a2];
}

void __48__DBSSettingsController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) externalDisplayInfo];
  if (v2)
  {
    v3 = (void *)v2;
    int v4 = DBSChamoisEnabled();

    if (v4)
    {
      v5 = *(void **)(a1 + 32);
      [v5 insertArrangementSpecifier];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DBSSettingsController;
  [(DBSSettingsController *)&v6 viewWillAppear:a3];
  [(DBSSettingsController *)self updateAutoLockSpecifier];
  [(DBSSettingsController *)self reloadSpecifierID:@"APPEARANCE_OPTIONS"];
  [(DBSSettingsController *)self reloadSpecifierID:@"ALWAYS_ON"];
  [(DBSSettingsController *)self updateReferenceDependentUIElements];
  int v4 = [MEMORY[0x263F5FB08] sharedManager];
  int v5 = [v4 capabilityBoolAnswer:*MEMORY[0x263F601D8]];

  if (v5) {
    [(DBSSettingsController *)self _reloadBlueLightSpecifiers:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) reloadUI:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DBSSettingsController;
  [(DBSSettingsController *)&v10 viewDidAppear:a3];
  int v4 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Display"];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F08DB0]);
    objc_super v6 = [MEMORY[0x263EFF960] currentLocale];
    id v7 = DBS_BundleForDisplayAndBrightnessSettingsFramework();
    v8 = [v7 bundleURL];
    v9 = (void *)[v5 initWithKey:@"DISPLAY_AND_BRIGHTNESS" defaultValue:0 table:@"Display" locale:v6 bundleURL:v8];

    [(DBSSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.display" title:v9 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v4];
  }
}

- (void)updateReferenceDependentUIElements
{
  v3 = [(DBSSettingsController *)self specifiers];
  id v15 = [v3 specifierForID:@"BRIGHTNESS"];

  int v4 = [(DBSSettingsController *)self specifiers];
  id v5 = [v4 specifierForID:@"WHITE_BALANCE"];

  objc_super v6 = [(DBSSettingsController *)self specifiers];
  id v7 = [v6 specifierForID:@"ADVANCED"];

  v8 = [MEMORY[0x263F15778] mainDisplay];
  int v9 = [v8 isReference];

  uint64_t v10 = *MEMORY[0x263F600A8];
  if (v9) {
    uint64_t v11 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v11 = MEMORY[0x263EFFA88];
  }
  [v15 setObject:v11 forKeyedSubscript:*MEMORY[0x263F600A8]];
  [v5 setObject:v11 forKeyedSubscript:v10];
  v12 = NSNumber;
  uint64_t v13 = [MEMORY[0x263F15778] mainDisplay];
  v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isReferenceLimited"));
  [v15 setObject:v14 forKeyedSubscript:@"brightnessLimited"];

  [(DBSSettingsController *)self reloadSpecifier:v15];
  [(DBSSettingsController *)self reloadSpecifier:v5];
  if (v7) {
    [(DBSSettingsController *)self reloadSpecifier:v7];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBSSettingsController;
  [(DBSSettingsController *)&v5 traitCollectionDidChange:a3];
  int v4 = [(DBSSettingsController *)self specifierForID:@"APPEARANCE_OPTIONS"];

  if (v4) {
    [(DBSSettingsController *)self reloadSpecifierID:@"APPEARANCE_OPTIONS"];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  int v4 = [(DBSSettingsController *)self _brightnessClient];
  objc_super v5 = [v4 blueLightClient];
  [v5 setStatusNotificationBlock:0];

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x263EFFCC8], 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.springboard.HasSeenACaseLatchCoverNotification", 0);
  v8 = [MEMORY[0x263F15778] mainDisplay];
  int v9 = NSStringFromSelector(sel_isReferenceLimited);
  [v8 removeObserver:self forKeyPath:v9];

  v10.receiver = self;
  v10.super_class = (Class)DBSSettingsController;
  [(DBSSettingsController *)&v10 dealloc];
}

- (id)specifiers
{
  v67[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  int v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_35;
  }
  objc_super v5 = [(DBSSettingsController *)self loadSpecifiersFromPlistName:@"Display" target:self];
  if (_UIUpdatedVisualStyleEnabled())
  {
    objc_super v6 = [(DBSSettingsController *)self _styleMode];
    [v6 modeValue];
    int IsAutomatic = UISUserInterfaceStyleModeValueIsAutomatic();

    if (!IsAutomatic) {
      goto LABEL_7;
    }
    v8 = [(DBSSettingsController *)self _deviceAppearanceScheduleSpecifier];
    int v9 = [v5 specifierForID:@"APPEARANCE_GROUP"];
    objc_msgSend(v5, "ps_addSpecifier:toGroup:", v8, v9);
  }
  else
  {
    v8 = [v5 specifierForID:@"APPEARANCE_GROUP"];
    int v9 = [v5 specifierForID:@"DEVICE_APPEARANCE"];
    objc_super v10 = [v5 specifierForID:@"AUTOMATIC"];
    v67[0] = v8;
    v67[1] = v9;
    v67[2] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:3];
    [v5 removeObjectsInArray:v11];
  }
LABEL_7:
  v12 = [v5 specifierForID:@"AUTOLOCK"];
  if ([(DBSSettingsController *)self shouldShowAutoLock])
  {
    uint64_t v13 = [MEMORY[0x263F82670] currentDevice];
    int v14 = objc_msgSend(v13, "sf_isiPad");

    id v15 = (void *)MEMORY[0x263F60068];
    if (v14)
    {
      id v16 = [NSNumber numberWithInt:300];
      [v12 setProperty:v16 forKey:*v15];
    }
    if (_AXSAttentionAwarenessFeaturesEnabled())
    {
      id v17 = [NSNumber numberWithInt:30];
      [v12 setProperty:v17 forKey:*v15];

      id v18 = PSLocalizablePearlStringForKey();
      [v12 setProperty:v18 forKey:*MEMORY[0x263F60280]];
    }
  }
  else
  {
    [v5 removeObject:v12];
  }
  BOOL v19 = [(DBSSettingsController *)self shouldShowCaseLockOption];
  id v20 = (void *)MEMORY[0x263F600F8];
  if (v19)
  {
    v21 = [v5 specifierForID:@"LOCK_WAKE_GROUP"];
    id v22 = [(DBSSettingsController *)self lockGroupFooter];
    [v21 setProperty:v22 forKey:*v20];
  }
  else
  {
    v21 = [v5 specifierForID:@"SMART_CASE_LOCK_SPEC"];
    [v5 removeObject:v21];
  }

  if ([(DBSSettingsController *)self shouldShowAlwaysOn])
  {
    v23 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ALWAYS_ON_GROUP"];
    [v23 setProperty:@"j8/Omm6s1lsmTDFsXjsBfA" forKey:*MEMORY[0x263F60210]];
    objc_super v24 = DBS_LocalizedStringForDisplays(@"ALWAYS_ON_DESCRIPTION");
    [v23 setProperty:v24 forKey:*v20];

    v25 = DBS_LocalizedStringForDisplays(@"ALWAYS_ON_DISPLAY");
    id v26 = +[DBSAlwaysOnViewController alwaysOnSpecifierNamed:v25];

    [v26 setProperty:@"ALWAYS_ON" forKey:*MEMORY[0x263F60138]];
    unint64_t v27 = [v5 indexOfSpecifierWithID:@"LOCK_WAKE_GROUP"];
    id v28 = v5;
    if ([v28 count] <= v27
      || ([v28 objectAtIndexedSubscript:v27],
          v29 = objc_claimAutoreleasedReturnValue(),
          uint64_t v30 = [v29 cellType],
          v29,
          v30)
      || [v28 count] - 1 == v27)
    {
      uint64_t v31 = [v28 count];
    }
    else
    {
      unint64_t v61 = v27 + 1;
      do
      {
        uint64_t v31 = v61;
        if (v61 >= [v28 count]) {
          break;
        }
        v62 = [v28 objectAtIndexedSubscript:v31];
        uint64_t v63 = [v62 cellType];

        unint64_t v61 = v31 + 1;
      }
      while (v63);
    }

    v66[0] = v23;
    v66[1] = v26;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:2];
    v33 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", v31, objc_msgSend(v32, "count"));
    [v28 insertObjects:v32 atIndexes:v33];

    id v20 = (void *)MEMORY[0x263F600F8];
  }
  unint64_t v34 = [v5 indexOfSpecifierWithID:@"LOCK_WAKE_GROUP"];
  id v35 = v5;
  if ([v35 count] > v34)
  {
    v36 = [v35 objectAtIndexedSubscript:v34];
    uint64_t v37 = [v36 cellType];

    if (!v37)
    {
      if ([v35 count] - 1 == v34)
      {
      }
      else
      {
        v59 = [v35 objectAtIndexedSubscript:v34 + 1];
        uint64_t v60 = [v59 cellType];

        if (v60) {
          goto LABEL_25;
        }
      }
      [v35 removeObjectAtIndex:v34];
      goto LABEL_25;
    }
  }

LABEL_25:
  v38 = objc_opt_new();
  [(DBSSettingsController *)self set_zoomAndProSpecifierVendor:v38];

  v39 = [(DBSSettingsController *)self _zoomAndProSpecifierVendor];
  [v39 setDelegate:self];

  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __35__DBSSettingsController_specifiers__block_invoke;
  v64[3] = &unk_264C7A5E8;
  v64[4] = self;
  id v40 = v35;
  id v65 = v40;
  v41 = (void (**)(void))MEMORY[0x237DF4780](v64);
  v42 = +[DBSExternalDisplayManager defaultManager];
  int v43 = [v42 externalDisplayAvailable];

  if (v43)
  {
    v44 = [(DBSSettingsController *)self connectedDisplaySpecifiers];
    uint64_t v45 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", objc_msgSend(v40, "indexOfSpecifierWithID:", @"BOLD_TEXT") + 1, objc_msgSend(v44, "count"));
    v46 = [(DBSSettingsController *)self connectedDisplaySpecifiers];
    [v40 insertObjects:v46 atIndexes:v45];

    if ((DBSChamoisEnabled() & 1) == 0) {
      v41[2](v41);
    }
  }
  else
  {
    v41[2](v41);
  }
  [(DBSSettingsController *)self _updateAutoLockSpecifiers:v40];
  [(DBSSettingsController *)self _localizeAutoLockTitlesWithSpecifiers:v40];
  uint64_t v47 = [MEMORY[0x263F5FB08] sharedManager];
  int v48 = [v47 capabilityBoolAnswer:*MEMORY[0x263F601D8]];

  if (v48) {
    [(DBSSettingsController *)self _reloadBlueLightSpecifiers:v40 reloadUI:0];
  }
  if (PSGetCapabilityBoolAnswer())
  {
    uint64_t v49 = (void *)MEMORY[0x263F5FC40];
    v50 = DBS_LocalizedStringForDisplays(@"CAMERA_CONTROL");
    v51 = [v49 groupSpecifierWithName:v50];

    [v40 addObject:v51];
    v52 = (void *)MEMORY[0x263F5FC40];
    v53 = DBS_LocalizedStringForDisplays(@"REQUIRE_SCREEN_ON");
    v54 = [v52 preferenceSpecifierNamed:v53 target:self set:sel__setCameraControlRequireScreenOn_specifier_ get:sel__isCameraControlRequireScreenOn_ detail:0 cell:6 edit:0];

    [v54 setIdentifier:@"CameraControlRequireScreenOnSwitch"];
    v55 = DBS_LocalizedStringForDisplays(@"LAUNCHING_CAMERA_REQUIRES_SCREEN_ON_FOOTER");
    [v51 setProperty:v55 forKey:*v20];

    [v40 addObject:v54];
  }
  v56 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v40;
  id v57 = v40;

  int v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
LABEL_35:
  return v4;
}

void __35__DBSSettingsController_specifiers__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[DBSBrightnessManager defaultManager];
  [v2 setDelegate:*(void *)(a1 + 32)];

  uint64_t v3 = +[DBSBrightnessManager defaultManager];
  id v10 = [v3 mainDisplayBrightnessSpecifiers];

  int v4 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", objc_msgSend(*(id *)(a1 + 40), "indexOfSpecifierWithID:", @"BOLD_TEXT") + 1, objc_msgSend(v10, "count"));
  [*(id *)(a1 + 40) insertObjects:v10 atIndexes:v4];
  objc_super v5 = [*(id *)(a1 + 32) _zoomAndProSpecifierVendor];
  objc_super v6 = [v5 specifiers];

  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    v8 = [*(id *)(a1 + 32) _zoomAndProSpecifierVendor];
    int v9 = [v8 specifiers];
    [v7 addObjectsFromArray:v9];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)DBSSettingsController;
  objc_super v5 = [(DBSSettingsController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setDelegate:self];
    [v5 setSelectionStyle:0];
  }
  return v5;
}

- (id)lockGroupFooter
{
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  if (PSGetCapabilityBoolAnswer()) {
    BOOL v2 = CFPreferencesGetAppBooleanValue(@"SBHasSeenACaseLatchCoverOnce", @"com.apple.springboard", 0) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  uint64_t v3 = [MEMORY[0x263F08AB0] processInfo];
  int v4 = [v3 isLowPowerModeEnabled];

  if (v2 && v4)
  {
    objc_super v5 = NSString;
    objc_super v6 = DBS_LocalizedStringForDisplays(@"SMART_CASE_LOCK_FOOTER");
    objc_super v7 = DBS_LocalizedStringForDisplays(@"AUTOLOCK_LPM_FOOTER");
    v8 = [v5 stringWithFormat:@"%@\n\n%@", v6, v7];

    goto LABEL_13;
  }
  if (v2)
  {
    int v9 = @"SMART_CASE_LOCK_FOOTER";
LABEL_11:
    v8 = DBS_LocalizedStringForDisplays(v9);
    goto LABEL_13;
  }
  if (v4)
  {
    int v9 = @"AUTOLOCK_LPM_FOOTER";
    goto LABEL_11;
  }
  v8 = 0;
LABEL_13:
  return v8;
}

- (BOOL)shouldShowAutoLock
{
  return PSIsInEDUMode() ^ 1;
}

- (BOOL)shouldShowCaseLockOption
{
  if (PSIsInEDUMode())
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    int v2 = PSGetCapabilityBoolAnswer();
    if (v2)
    {
      CFPreferencesAppSynchronize(@"com.apple.springboard");
      LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"SBHasSeenACaseLatchCoverOnce", @"com.apple.springboard", 0) != 0;
    }
  }
  return v2;
}

- (BOOL)shouldShowAlwaysOn
{
  int v2 = PSGetCapabilityBoolAnswer();
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

- (id)screenLock:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", a3);
  int v4 = [v3 effectiveValueForSetting:*MEMORY[0x263F53798]];

  if ([v4 intValue] == 0x7FFFFFFF)
  {
    id v5 = [NSNumber numberWithInt:0xFFFFFFFFLL];
  }
  else
  {
    id v5 = v4;
  }
  objc_super v6 = v5;

  return v6;
}

- (void)setScreenLock:(id)a3 specifier:(id)a4
{
  id v8 = a3;
  int v4 = [v8 intValue];
  id v5 = [MEMORY[0x263F53C50] sharedConnection];
  objc_super v6 = v5;
  if (!v8 || v4 == -1)
  {
    objc_super v7 = [NSNumber numberWithInt:0x7FFFFFFFLL];
    [v6 setValue:v7 forSetting:*MEMORY[0x263F53798]];
  }
  else
  {
    [v5 setValue:v8 forSetting:*MEMORY[0x263F53798]];
  }
}

- (void)_updateAutoLockSpecifiers:(id)a3
{
  id v35 = a3;
  int v4 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v5 = *MEMORY[0x263F53798];
  objc_super v6 = [v4 effectiveParametersForValueSetting:*MEMORY[0x263F53798]];
  objc_super v7 = [v6 objectForKey:*MEMORY[0x263F53B50]];

  if (v7) {
    int v8 = [v7 intValue];
  }
  else {
    int v8 = -1;
  }
  int v9 = [v35 specifierForID:@"AUTOLOCK"];
  id v10 = [v35 specifierForID:@"LOCK_WAKE_GROUP"];
  uint64_t v11 = [MEMORY[0x263F08AB0] processInfo];
  int v12 = [v11 isLowPowerModeEnabled];

  uint64_t v13 = *MEMORY[0x263F600A8];
  if (v12) {
    int v14 = &unk_26E9390B0;
  }
  else {
    int v14 = &unk_26E9390C8;
  }
  [v9 setProperty:v14 forKey:*MEMORY[0x263F600A8]];
  id v15 = [(DBSSettingsController *)self lockGroupFooter];
  if (v15) {
    [v10 setProperty:v15 forKey:*MEMORY[0x263F600F8]];
  }
  else {
    [v10 removePropertyForKey:*MEMORY[0x263F600F8]];
  }
  if (v8 == -1)
  {
    [v9 setValues:self->_autoLockValues];
    [v9 setTitleDictionary:self->_localizedAutoLockTitleDictionary];
  }
  else
  {
    unint64_t v34 = v10;
    id v16 = [MEMORY[0x263EFF980] arrayWithArray:self->_autoLockValues];
    id v17 = [MEMORY[0x263F53C50] sharedConnection];
    int v18 = [v17 isValueSettingLockedDownByRestrictions:v5];

    BOOL v19 = [NSNumber numberWithInt:v18 ^ 1u];
    [v9 setProperty:v19 forKey:v13];

    uint64_t v20 = [v16 count];
    if (v20 - 1 >= 0)
    {
      uint64_t v21 = v20;
      do
      {
        id v22 = [v16 objectAtIndex:--v21];
        int v23 = [v22 intValue];
        if (v23 > v8 || v23 == -1) {
          [v16 removeObjectAtIndex:v21];
        }
      }
      while (v21 > 0);
    }
    v25 = [MEMORY[0x263F53C50] sharedConnection];
    id v26 = [v25 effectiveValueForSetting:v5];
    uint64_t v27 = [v26 intValue];

    if (v27) {
      BOOL v28 = v27 == 0x7FFFFFFF;
    }
    else {
      BOOL v28 = 1;
    }
    if (!v28)
    {
      v29 = [NSNumber numberWithInt:v27];
      if (([v16 containsObject:v29] & 1) == 0)
      {
        [v16 addObject:v29];
        [v16 sortUsingSelector:sel_compare_];
        uint64_t v30 = [(NSMutableDictionary *)self->_localizedAutoLockTitleDictionary objectForKey:v29];
        if (!v30)
        {
          id v31 = objc_alloc_init(MEMORY[0x263EFF918]);
          id v32 = v31;
          if ((int)v27 > 59) {
            [v31 setMinute:v27 / 0x3CuLL];
          }
          else {
            [v31 setSecond:(int)v27];
          }
          [MEMORY[0x263F08780] localizedStringFromDateComponents:v32 unitsStyle:3];
          uint64_t v30 = v33 = v32;
          [(NSMutableDictionary *)self->_localizedAutoLockTitleDictionary setObject:v30 forKey:v29];
        }
      }
    }
    [v9 setValues:v16];
    [v9 setTitleDictionary:self->_localizedAutoLockTitleDictionary];

    id v10 = v34;
  }
}

- (void)updateAutoLockSpecifier
{
  id v3 = [(DBSSettingsController *)self specifiers];
  [(DBSSettingsController *)self _updateAutoLockSpecifiers:v3];
}

- (void)_localizeAutoLockTitlesWithSpecifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 specifierForID:@"AUTOLOCK"];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    id v22 = (void *)v4;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_super v6 = [(NSMutableDictionary *)self->_localizedAutoLockTitleDictionary allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v7) {
      goto LABEL_21;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unint64_t v12 = (int)[v11 intValue];
        uint64_t v13 = [(NSDictionary *)self->_autoLockTitleDictionary objectForKey:v11];
        if (!v13)
        {
          id v17 = objc_alloc_init(MEMORY[0x263EFF918]);
          id v16 = v17;
          if ((int)v12 > 59) {
            [v17 setMinute:v12 / 0x3C];
          }
          else {
            [v17 setSecond:v12];
          }
          int v14 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v16 unitsStyle:3];
          localizedAutoLockTitleDictionary = self->_localizedAutoLockTitleDictionary;
          uint64_t v20 = v14;
          goto LABEL_18;
        }
        int v14 = (void *)v13;
        if ((v12 & 0x80000000) != 0)
        {
          int v18 = self->_localizedAutoLockTitleDictionary;
          id v16 = DBS_LocalizedStringForDisplays(@"NEVER");
          localizedAutoLockTitleDictionary = v18;
          uint64_t v20 = v16;
LABEL_18:
          [(NSMutableDictionary *)localizedAutoLockTitleDictionary setObject:v20 forKey:v11];
          goto LABEL_19;
        }
        id v15 = objc_alloc_init(MEMORY[0x263EFF918]);
        id v16 = v15;
        if (v12 > 0x3B) {
          [v15 setMinute:v12 / 0x3C];
        }
        else {
          [v15 setSecond:v12];
        }
        uint64_t v21 = [MEMORY[0x263F08780] localizedStringFromDateComponents:v16 unitsStyle:3];

        [(NSMutableDictionary *)self->_localizedAutoLockTitleDictionary setObject:v21 forKey:v11];
        int v14 = (void *)v21;
LABEL_19:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v8)
      {
LABEL_21:

        uint64_t v5 = v22;
        [v22 setTitleDictionary:self->_localizedAutoLockTitleDictionary];
        break;
      }
    }
  }
}

- (void)_localizeAutoLockTitles
{
  id v3 = [(DBSSettingsController *)self specifiers];
  [(DBSSettingsController *)self _localizeAutoLockTitlesWithSpecifiers:v3];
}

- (void)profileNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__DBSSettingsController_profileNotification___block_invoke;
  v6[3] = &unk_264C7A5E8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __45__DBSSettingsController_profileNotification___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v2 objectForKey:*MEMORY[0x263F53B48]];

  LODWORD(v2) = [v5 intValue];
  if (v2 != getpid()) {
    [*(id *)(a1 + 40) reload];
  }
  [*(id *)(a1 + 40) updateAutoLockSpecifier];
  id v3 = *(void **)(a1 + 40);
  id v4 = [v3 specifierForID:@"AUTOLOCK"];
  [v3 reloadSpecifier:v4];
}

- (id)locksAndUnlocksWithCase:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SBLockAndUnlockWithCase", @"com.apple.springboard", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = !v4;
  objc_super v6 = [NSNumber numberWithBool:v5];
  return v6;
}

- (void)setLocksAndUnlocksWithCase:(id)a3 specifier:(id)a4
{
  if (a3)
  {
    CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE70];
    CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE50];
    CFPreferencesSetValue(@"SBLockAndUnlockWithCase", a3, @"com.apple.springboard", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    CFPreferencesSynchronize(@"com.apple.springboard", v4, v5);
    MEMORY[0x270F30690](@"com.apple.springboard", @"SBLockAndUnlockWithCase");
  }
}

- (void)presentModalMagnifyController
{
  id v8 = objc_alloc_init(MEMORY[0x263F5FC30]);
  uint64_t v3 = (int)*MEMORY[0x263F5FE98];
  CFStringRef v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  CFStringRef v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  [v4 setProperty:v6 forKey:*MEMORY[0x263F60228]];

  [v8 setSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + v3)];
  [v8 setParentController:self];
  [v8 setupController];
  if (DBSReverseZoomEnabled()) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [v8 setModalPresentationStyle:v7];
  [(DBSSettingsController *)self presentViewController:v8 animated:1 completion:0];
}

- (BOOL)proModeSupported
{
  int v2 = [MEMORY[0x263F15778] mainDisplay];
  uint64_t v3 = [v2 availablePresets];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)connectedDisplayName
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [MEMORY[0x263F15778] mainDisplay];
  if ([v13 isEqual:v11])
  {
    int v14 = [(DBSSettingsController *)self specifiers];
    id v15 = [v14 specifierForID:@"BRIGHTNESS"];

    id v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isReferenceLimited"));
    [v15 setObject:v16 forKeyedSubscript:@"brightnessLimited"];

    [(DBSSettingsController *)self reloadSpecifier:v15];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)DBSSettingsController;
    [(DBSSettingsController *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  [v4 BOOLValue];
  _AXSSetEnhanceTextLegibilityEnabled();
  uint64_t v5 = [v4 BOOLValue];

  +[DBSAnalytics logBoldTextEvent:v5];
  DBSPurgeKeyboardCache();
}

- (id)boldTextEnabledForSpecifier:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = _AXSEnhanceTextLegibilityEnabled();
  return (id)[v3 numberWithUnsignedChar:v4];
}

- (void)updateForExternalMonitorAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  if (DBSChamoisEnabled())
  {
    uint64_t v5 = (int)*MEMORY[0x263F5FDB8];
    if (*(Class *)((char *)&self->super.super.super.super.super.isa + v5))
    {
      if (v3)
      {
        +[DBSBrightnessManager removeSpecifiersFrom:self];
        +[DBSZoomAndProSpecifiers removeSpecifiersFrom:self];
      }
      else
      {
        if (!+[DBSBrightnessManager specifiersPresentIn:self])
        {
          objc_super v6 = +[DBSBrightnessManager defaultManager];
          [v6 setDelegate:self];

          uint64_t v7 = +[DBSBrightnessManager defaultManager];
          id v8 = [v7 mainDisplayBrightnessSpecifiers];
          uint64_t v9 = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) specifierForID:@"BOLD_TEXT"];
          [(DBSSettingsController *)self insertContiguousSpecifiers:v8 afterSpecifier:v9 animated:1];
        }
        if (!+[DBSZoomAndProSpecifiers specifiersPresentIn:self])
        {
          id v12 = [(DBSSettingsController *)self _zoomAndProSpecifierVendor];
          id v10 = [v12 specifiers];
          id v11 = [(DBSSettingsController *)self specifiers];
          -[DBSSettingsController insertContiguousSpecifiers:atIndex:](self, "insertContiguousSpecifiers:atIndex:", v10, [v11 count]);
        }
      }
    }
  }
}

- (void)_reloadBlueLightSpecifiers:(id)a3 reloadUI:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v21 = 0;
  long long v20 = 0u;
  uint64_t v7 = [(DBSSettingsController *)self _brightnessClient];
  id v8 = [v7 blueLightClient];
  char v9 = [v8 getBlueLightStatus:&v19];

  if ((v9 & 1) == 0) {
    -[DBSSettingsController _reloadBlueLightSpecifiers:reloadUI:]();
  }
  uint64_t v10 = *((void *)&v20 + 1);
  id v11 = [v6 specifierForID:@"BLUE_LIGHT_REDUCTION"];
  id v12 = [MEMORY[0x263F15778] mainDisplay];
  int v13 = [v12 isReference];

  if (v10) {
    int v14 = 1;
  }
  else {
    int v14 = v13;
  }
  if (v14) {
    uint64_t v15 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v15 = MEMORY[0x263EFFA88];
  }
  [v11 setProperty:v15 forKey:*MEMORY[0x263F600A8]];
  id v16 = [v6 specifierForID:@"BLUE_LIGHT_GROUP"];
  objc_super v17 = v16;
  if (!v10)
  {
    [v16 setProperty:&stru_26E931C58 forKey:*MEMORY[0x263F600F8]];
    if (!v4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  int v18 = DBS_LocalizedStringForDisplays(@"BLUE_LIGHT_LOW_POWER_MODE_FOOTER");
  [v17 setProperty:v18 forKey:*MEMORY[0x263F600F8]];

  if (v4)
  {
LABEL_10:
    [(DBSSettingsController *)self reloadSpecifier:v11];
    [(DBSSettingsController *)self reloadSpecifier:v17];
  }
LABEL_11:
}

- (void)handleBlueLightStatusChanged:(id *)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__DBSSettingsController_handleBlueLightStatusChanged___block_invoke;
  block[3] = &unk_264C7A6B0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__DBSSettingsController_handleBlueLightStatusChanged___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 specifiers];
  [v1 _reloadBlueLightSpecifiers:v2 reloadUI:1];
}

- (id)blueLightSchedule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DBSSettingsController *)self _brightnessClient];
  id v6 = [v5 blueLightClient];
  int v7 = [v6 supported];

  if (!v7)
  {
LABEL_11:
    id v12 = 0;
    goto LABEL_12;
  }
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(DBSSettingsController *)self _brightnessClient];
  char v9 = [v8 blueLightClient];
  char v10 = [v9 getBlueLightStatus:&v18];

  if ((v10 & 1) == 0) {
    -[DBSSettingsController blueLightSchedule:]();
  }
  if (*((void *)&v19 + 1)) {
    goto LABEL_4;
  }
  if (DWORD1(v18) != 2)
  {
    if (DWORD1(v18) == 1)
    {
      id v11 = @"SUNSET_TO_SUNRISE";
      goto LABEL_5;
    }
    if (!DWORD1(v18))
    {
      if (BYTE1(v18))
      {
        id v11 = @"ON";
        goto LABEL_5;
      }
LABEL_4:
      id v11 = @"OFF";
LABEL_5:
      id v12 = DBS_LocalizedStringForDisplays(v11);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  int v14 = NSString;
  uint64_t v15 = DBS_LocalizedStringForDisplays(@"START_TIME_TO_STOP_TIME");
  id v16 = [(DBSSettingsController *)self localizedTimeForTime:*((void *)&v18 + 1)];
  objc_super v17 = [(DBSSettingsController *)self localizedTimeForTime:(void)v19];
  id v12 = objc_msgSend(v14, "stringWithFormat:", v15, v16, v17);

LABEL_12:
  return v12;
}

- (id)localizedTimeForTime:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v5 setHour:a3.var0];
  [v5 setMinute:*(uint64_t *)&a3 >> 32];
  id v6 = objc_alloc(MEMORY[0x263EFF8F0]);
  int v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v8 = [v7 dateFromComponents:v5];
  char v9 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v8];

  return v9;
}

- (id)connectedDisplaySpecifiers
{
  BOOL v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v4)
    || ([(DBSSettingsController *)self specifierForID:@"CONNECTED_DISPLAYS"],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = (void *)MEMORY[0x263F5FC40];
    if (DBSChamoisEnabled()) {
      int v7 = @"CONNECTED_DISPLAYS";
    }
    else {
      int v7 = @"CONNECTED_DISPLAYS_LEGACY";
    }
    id v8 = DBS_LocalizedStringForConnectedDisplays(v7);
    id v5 = [v6 groupSpecifierWithID:@"CONNECTED_DISPLAYS" name:v8];

    [v3 addObject:v5];
  }
  int v9 = DBSChamoisEnabled();
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v4);
  if (v9)
  {
    if (!v10
      || ([(DBSSettingsController *)self specifierForID:@"MAIN_DISPLAY"],
          (id v11 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v12 = (void *)MEMORY[0x263F5FC40];
      int v13 = +[DBSExternalDisplayManager defaultManager];
      int v14 = [v13 mainDisplayName];
      id v11 = [v12 preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

      [v11 setProperty:@"MAIN_DISPLAY" forKey:*MEMORY[0x263F60138]];
      uint64_t v15 = [MEMORY[0x263F827E8] systemImageNamed:@"ipad" compatibleWithTraitCollection:0];
      id v16 = [MEMORY[0x263F82818] configurationWithPointSize:40.0];
      objc_super v17 = [v15 imageWithSymbolConfiguration:v16];
      [v11 setProperty:v17 forKey:*MEMORY[0x263F60140]];

      [v11 setProperty:&unk_26E939230 forKey:*MEMORY[0x263F602A8]];
      [v11 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      [v3 addObject:v11];
    }
    if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v4)
      || ([(DBSSettingsController *)self specifierForID:@"EXTERNAL_DISPLAY"],
          (long long v18 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      long long v19 = (void *)MEMORY[0x263F5FC40];
      uint64_t v20 = +[DBSExternalDisplayManager defaultManager];
      uint64_t v21 = [v20 externalDisplayName];
      long long v18 = [v19 preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

      [v18 setProperty:@"EXTERNAL_DISPLAY" forKey:*MEMORY[0x263F60138]];
      id v22 = [MEMORY[0x263F827E8] systemImageNamed:@"display" compatibleWithTraitCollection:0];
      long long v23 = [MEMORY[0x263F82818] configurationWithPointSize:50.0];
      long long v24 = [v22 imageWithSymbolConfiguration:v23];
      [v18 setProperty:v24 forKey:*MEMORY[0x263F60140]];

      [v18 setProperty:&unk_26E939230 forKey:*MEMORY[0x263F602A8]];
      [v18 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      [v3 addObject:v18];
    }
    long long v25 = [(DBSSettingsController *)self externalDisplayInfo];

    if (v25)
    {
      if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v4)
        || ([(DBSSettingsController *)self specifierForID:@"DISPLAY_ARRANGEMENT"],
            (long long v26 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        long long v26 = [(DBSSettingsController *)self makeArrangementSpecifier];
        [v3 addObject:v26];
      }
    }
  }
  else if (!v10 {
         || ([(DBSSettingsController *)self specifierForID:@"EXTERNAL_DISPLAY"],
  }
             (id v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v27 = (void *)MEMORY[0x263F5FC40];
    uint64_t v28 = +[DBSExternalDisplayManager defaultManager];
    v29 = [v28 externalDisplayName];
    id v11 = [v27 preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v11 setProperty:@"EXTERNAL_DISPLAY" forKey:*MEMORY[0x263F60138]];
    [v3 addObject:v11];
  }

  return v3;
}

- (id)makeArrangementSpecifier
{
  BOOL v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = DBS_LocalizedStringForConnectedDisplays(@"DISPLAY_ARRANGEMENT");
  id v5 = [v3 preferenceSpecifierNamed:v4 target:self set:0 get:0 detail:0 cell:1 edit:0];

  [v5 setProperty:@"DISPLAY_ARRANGEMENT" forKey:*MEMORY[0x263F60138]];
  [v5 setButtonAction:sel_presentArrangementController];
  [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  return v5;
}

- (void)insertArrangementSpecifier
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3)
    || ([(DBSSettingsController *)self specifierForID:@"DISPLAY_ARRANGEMENT"],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [(DBSSettingsController *)self makeArrangementSpecifier];
    if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
    {
      uint64_t v6 = [(DBSSettingsController *)self specifierForID:@"EXTERNAL_DISPLAY"];
      if (v6)
      {
        int v7 = (void *)v6;
        [(DBSSettingsController *)self insertSpecifier:v5 afterSpecifier:v6];
      }
    }

    uint64_t v4 = 0;
  }
}

- (void)insertExternalDisplaySpecifiers
{
  id v4 = [(DBSSettingsController *)self connectedDisplaySpecifiers];
  uint64_t v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) specifierForID:@"BOLD_TEXT"];
  [(DBSSettingsController *)self insertContiguousSpecifiers:v4 afterSpecifier:v3 animated:1];
}

- (void)removeExternalDisplaySpecifiers
{
  id v12 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    uint64_t v4 = [(DBSSettingsController *)self specifierForID:@"CONNECTED_DISPLAYS"];
    if (v4)
    {
      id v5 = (void *)v4;
      [v12 addObject:v4];
    }
  }
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    uint64_t v6 = [(DBSSettingsController *)self specifierForID:@"MAIN_DISPLAY"];
    if (v6)
    {
      int v7 = (void *)v6;
      [v12 addObject:v6];
    }
  }
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    uint64_t v8 = [(DBSSettingsController *)self specifierForID:@"EXTERNAL_DISPLAY"];
    if (v8)
    {
      int v9 = (void *)v8;
      [v12 addObject:v8];
    }
  }
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    uint64_t v10 = [(DBSSettingsController *)self specifierForID:@"DISPLAY_ARRANGEMENT"];
    if (v10)
    {
      id v11 = (void *)v10;
      [v12 addObject:v10];
    }
  }
  if ([v12 count]) {
    [(DBSSettingsController *)self removeContiguousSpecifiers:v12 animated:1];
  }
}

- (void)presentArrangementController
{
  id v3 = objc_alloc_init(MEMORY[0x263F5FC30]);
  uint64_t v4 = [(DBSSettingsController *)self specifierForID:@"DISPLAY_ARRANGEMENT"];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 setProperty:v6 forKey:*MEMORY[0x263F60228]];

  [v3 setSpecifier:v4];
  [v3 setParentController:self];
  [v3 setupController];
  [v3 setModalPresentationStyle:2];
  int v7 = [v3 viewControllers];
  uint64_t v8 = [v7 firstObject];

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__DBSSettingsController_presentArrangementController__block_invoke;
  v11[3] = &unk_264C7A8C8;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v3;
  id v13 = v10;
  [(DBSSettingsController *)self updateExternalDisplayInfoWithCompletionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __53__DBSSettingsController_presentArrangementController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained externalDisplayInfo];
  [*(id *)(a1 + 32) setExternalDisplayInfo:v2];

  id v3 = [WeakRetained displayService];
  [*(id *)(a1 + 32) setDisplayService:v3];

  [*(id *)(a1 + 32) setDelegate:WeakRetained];
  [WeakRetained presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
  [WeakRetained setArrangementViewController:*(void *)(a1 + 40)];
}

- (void)arrangementViewControllerDidDismiss:(id)a3
{
}

- (void)updateExternalDisplayInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(DBSSettingsController *)self displayService];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__DBSSettingsController_updateExternalDisplayInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_264C7A918;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 getConnectedDisplayInfoWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__DBSSettingsController_updateExternalDisplayInfoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__DBSSettingsController_updateExternalDisplayInfoWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_264C7A8F0;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v11);
}

void __72__DBSSettingsController_updateExternalDisplayInfoWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [*(id *)(a1 + 32) count];
  uint64_t v4 = DBSLogForCategory(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D7B000, v4, OS_LOG_TYPE_DEFAULT, "Recieved valid external display", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 32) firstObject];
    [WeakRetained setExternalDisplayInfo:v6];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_235D7B000, v4, OS_LOG_TYPE_DEFAULT, "No Valid display", v10, 2u);
    }

    [WeakRetained setExternalDisplayInfo:0];
    if (*(void *)(*(void *)(a1 + 40) + (int)*MEMORY[0x263F5FDB8]))
    {
      id v6 = [WeakRetained specifierForID:@"DISPLAY_ARRANGEMENT"];
    }
    else
    {
      id v6 = 0;
    }
    [WeakRetained removeSpecifier:v6];
    int v7 = [WeakRetained presentedViewController];
    id v8 = [WeakRetained arrangementViewController];

    if (v7 == v8) {
      [WeakRetained dismissViewControllerAnimated:1 completion:0];
    }
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void)handleDBSExternalDisplayManagerCurrentModeDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __89__DBSSettingsController_handleDBSExternalDisplayManagerCurrentModeDidChangeNotification___block_invoke;
  v5[3] = &unk_264C7A940;
  objc_copyWeak(&v6, &location);
  [(DBSSettingsController *)self updateExternalDisplayInfoWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __89__DBSSettingsController_handleDBSExternalDisplayManagerCurrentModeDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleDisplayServiceInfoUpdate];
}

- (void)handleDisplayServiceInfoUpdate
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v3 = DBSLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_235D7B000, v3, OS_LOG_TYPE_DEFAULT, "Recieved", (uint8_t *)buf, 2u);
    }

    id v4 = +[DBSExternalDisplayManager defaultManager];
    int v5 = [v4 externalDisplayAvailable];

    if (v5) {
      [(DBSSettingsController *)self insertExternalDisplaySpecifiers];
    }
    else {
      [(DBSSettingsController *)self removeExternalDisplaySpecifiers];
    }
    id v6 = +[DBSExternalDisplayManager defaultManager];
    -[DBSSettingsController updateForExternalMonitorAvailability:](self, "updateForExternalMonitorAvailability:", [v6 externalDisplayAvailable]);
  }
  else
  {
    objc_initWeak(buf, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__DBSSettingsController_handleDisplayServiceInfoUpdate__block_invoke;
    block[3] = &unk_264C7A940;
    objc_copyWeak(&v8, buf);
    dispatch_sync(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __55__DBSSettingsController_handleDisplayServiceInfoUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleDisplayServiceInfoUpdate];
}

- (id)_deviceAppearanceScheduleSpecifier
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8])
    && ([(DBSSettingsController *)self specifierForID:@"APPEARANCE_OPTIONS"],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(DBSSettingsController *)self specifierForID:@"APPEARANCE_OPTIONS"];
  }
  else
  {
    int v5 = (void *)MEMORY[0x263F5FC40];
    id v6 = DBS_LocalizedStringForDisplays(@"APPEARANCE_OPTIONS");
    id v4 = [v5 preferenceSpecifierNamed:v6 target:self set:0 get:sel__deviceAppearanceScheduleString detail:objc_opt_class() cell:2 edit:0];

    [v4 setObject:@"APPEARANCE_OPTIONS" forKeyedSubscript:*MEMORY[0x263F60138]];
    int v7 = [(DBSSettingsController *)self _styleMode];
    [v4 setObject:v7 forKeyedSubscript:DBSStyleModeKey[0]];
  }
  return v4;
}

- (id)_deviceAppearanceScheduleString
{
  uint64_t v3 = [(DBSSettingsController *)self _styleMode];
  uint64_t v4 = [v3 suggestedAutomaticModeValue];

  if (v4 == 100)
  {
    int v5 = [(DBSSettingsController *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];

    if (v6 == 2) {
      int v7 = @"DARK_UNTIL_SUNRISE";
    }
    else {
      int v7 = @"LIGHT_UNTIL_SUNSET";
    }
    id v14 = DBS_LocalizedStringForDisplays(v7);
  }
  else
  {
    id v8 = [(DBSSettingsController *)self _styleMode];
    uint64_t v9 = [v8 suggestedAutomaticModeValue];

    if (v9 == 102)
    {
      id v10 = [(DBSSettingsController *)self traitCollection];
      uint64_t v11 = [v10 userInterfaceStyle];

      id v12 = NSString;
      if (v11 == 2)
      {
        id v13 = DBS_LocalizedStringForDisplays(@"CUSTOM_SCHEDULE_DARK");
        [(DBSSettingsController *)self _lightAppearanceTimeString];
      }
      else
      {
        id v13 = DBS_LocalizedStringForDisplays(@"CUSTOM_SCHEDULE_LIGHT");
        [(DBSSettingsController *)self _darkAppearanceTimeString];
      uint64_t v15 = };
      id v14 = objc_msgSend(v12, "stringWithFormat:", v13, v15);
    }
    else
    {
      id v14 = 0;
    }
  }
  return v14;
}

- (id)_darkAppearanceTimeString
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  uint64_t v4 = [(DBSSettingsController *)self _styleMode];
  int v5 = v4;
  if (v4)
  {
    [v4 customSchedule];
    uint64_t v6 = v17;
  }
  else
  {
    uint64_t v6 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
  }
  [v3 setHour:v6];

  int v7 = [(DBSSettingsController *)self _styleMode];
  id v8 = v7;
  if (v7)
  {
    [v7 customSchedule];
    uint64_t v9 = *((void *)&v15 + 1);
  }
  else
  {
    uint64_t v9 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
  }
  objc_msgSend(v3, "setMinute:", v9, v15, v16, v17, v18);

  id v10 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v11 = (void *)[v10 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v12 = [v11 dateFromComponents:v3];
  id v13 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v12];

  return v13;
}

- (id)_lightAppearanceTimeString
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF918]);
  uint64_t v4 = [(DBSSettingsController *)self _styleMode];
  int v5 = v4;
  if (v4)
  {
    [v4 customSchedule];
    uint64_t v6 = v18;
  }
  else
  {
    uint64_t v6 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
  }
  [v3 setHour:v6];

  int v7 = [(DBSSettingsController *)self _styleMode];
  id v8 = v7;
  if (v7)
  {
    [v7 customSchedule];
    uint64_t v9 = *((void *)&v16 + 1);
  }
  else
  {
    uint64_t v9 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
  }
  objc_msgSend(v3, "setMinute:", v9, v15, v16, v17, v18);

  id v10 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v11 = (void *)[v10 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  id v12 = [v11 dateFromComponents:v3];
  id v13 = [(NSDateFormatter *)self->_timeFormatter stringFromDate:v12];

  return v13;
}

- (id)getAppearanceValueForSpecifier:(id)a3
{
  id v3 = NSNumber;
  uint64_t v4 = [(DBSSettingsController *)self _styleMode];
  int v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "modeValue"));

  return v5;
}

- (void)setAppearanceValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = [a3 integerValue];
  id v6 = [(DBSSettingsController *)self _styleMode];
  [v6 setModeValue:v5];
}

- (id)getAutomaticAppearanceEnabledForSpecifier:(id)a3
{
  id v3 = NSNumber;
  uint64_t v4 = [(DBSSettingsController *)self _styleMode];
  [v4 modeValue];
  uint64_t v5 = [v3 numberWithBool:UISUserInterfaceStyleModeValueIsAutomatic()];

  return v5;
}

- (void)setAutomaticAppearanceEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  dispatch_time_t v6 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__DBSSettingsController_setAutomaticAppearanceEnabled_forSpecifier___block_invoke;
  block[3] = &unk_264C7A6B0;
  void block[4] = self;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
  uint64_t v7 = [v5 BOOLValue];

  +[DBSAnalytics logAutomaticDarkModeEvent:v7];
}

void __68__DBSSettingsController_setAutomaticAppearanceEnabled_forSpecifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _styleMode];
  [v2 modeValue];
  int IsAutomatic = UISUserInterfaceStyleModeValueIsAutomatic();

  uint64_t v4 = *(void **)(a1 + 32);
  if (IsAutomatic)
  {
    id v5 = [v4 traitCollection];
    if ([v5 userInterfaceStyle] == 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }

    uint64_t v7 = [*(id *)(a1 + 32) _styleMode];
    [v7 setModeValue:v6];

    uint64_t v8 = *MEMORY[0x263F83EA8];
    uint64_t v9 = *(void *)(MEMORY[0x263F83EA8] + 8);
    id v10 = [*(id *)(a1 + 32) _styleMode];
    objc_msgSend(v10, "setOverride:", v8, v9);

    uint64_t v11 = *(void **)(a1 + 32);
    [v11 removeSpecifierID:@"APPEARANCE_OPTIONS" animated:1];
  }
  else
  {
    id v12 = [v4 _styleMode];
    uint64_t v13 = [v12 suggestedAutomaticModeValue];
    id v14 = [*(id *)(a1 + 32) _styleMode];
    [v14 setModeValue:v13];

    long long v15 = *(void **)(a1 + 32);
    id v16 = [v15 _deviceAppearanceScheduleSpecifier];
    [v15 insertSpecifier:v16 afterSpecifierID:@"AUTOMATIC"];
  }
}

- (void)_updateDeviceAppearanceToNewInterfaceStyle:(int64_t)a3
{
  id v5 = [(DBSSettingsController *)self _styleMode];
  [v5 modeValue];
  int IsAutomatic = UISUserInterfaceStyleModeValueIsAutomatic();

  if (a3 == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  uint64_t v8 = [(DBSSettingsController *)self _styleMode];
  uint64_t v9 = v8;
  if (IsAutomatic)
  {
    uint64_t v10 = [v8 override];

    if (v10 == v7) {
      return;
    }
    id v12 = [(DBSSettingsController *)self _styleMode];
    objc_msgSend(v12, "setOverride:", v7, 1);
  }
  else
  {
    uint64_t v11 = [v8 modeValue];

    if (v11 == v7) {
      return;
    }
    id v12 = [(DBSSettingsController *)self _styleMode];
    [v12 setModeValue:v7];
  }
}

- (void)deviceAppearanceTableViewCellUserDidTapOnLightAppearance:(id)a3
{
  [(DBSSettingsController *)self _updateDeviceAppearanceToNewInterfaceStyle:1];
  +[DBSAnalytics logDarkModeEvent:0];
}

- (void)deviceAppearanceTableViewCellUserDidTapOnDarkAppearance:(id)a3
{
  [(DBSSettingsController *)self _updateDeviceAppearanceToNewInterfaceStyle:2];
  +[DBSAnalytics logDarkModeEvent:1];
}

- (void)_setCameraControlRequireScreenOn:(id)a3 specifier:(id)a4
{
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "BOOLValue") ^ 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(@"SBCaptureButtonDisableWakeWhenDim", v4, @"com.apple.springboard");
  CFPreferencesAppSynchronize(@"com.apple.springboard");
}

- (id)_isCameraControlRequireScreenOn:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SBCaptureButtonDisableWakeWhenDim", @"com.apple.springboard", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [NSNumber numberWithBool:v5];
  return v6;
}

- (SBSExternalDisplayService)displayService
{
  return self->_displayService;
}

- (void)setDisplayService:(id)a3
{
}

- (SBSConnectedDisplayInfo)externalDisplayInfo
{
  return self->_externalDisplayInfo;
}

- (void)setExternalDisplayInfo:(id)a3
{
}

- (UISUserInterfaceStyleMode)_styleMode
{
  return self->__styleMode;
}

- (void)set_styleMode:(id)a3
{
}

- (CBClient)_brightnessClient
{
  return self->__brightnessClient;
}

- (void)set_brightnessClient:(id)a3
{
}

- (DBSZoomAndProSpecifiers)_zoomAndProSpecifierVendor
{
  return self->__zoomAndProSpecifierVendor;
}

- (void)set_zoomAndProSpecifierVendor:(id)a3
{
}

- (PSSetupController)arrangementViewController
{
  return self->_arrangementViewController;
}

- (void)setArrangementViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangementViewController, 0);
  objc_storeStrong((id *)&self->__zoomAndProSpecifierVendor, 0);
  objc_storeStrong((id *)&self->__brightnessClient, 0);
  objc_storeStrong((id *)&self->__styleMode, 0);
  objc_storeStrong((id *)&self->_externalDisplayInfo, 0);
  objc_storeStrong((id *)&self->_displayService, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_localizedAutoLockTitleDictionary, 0);
  objc_storeStrong((id *)&self->_autoLockTitleDictionary, 0);
  objc_storeStrong((id *)&self->_autoLockValues, 0);
}

- (void)_reloadBlueLightSpecifiers:reloadUI:.cold.1()
{
  v0 = DBSLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT)) {
    OUTLINED_FUNCTION_0(&dword_235D7B000, v1, v2, "Could not get Night Shift capability from CoreBrightness.", v3, v4, v5, v6, 0);
  }

  __assert_rtn("-[DBSSettingsController _reloadBlueLightSpecifiers:reloadUI:]", "DBSSettingsController.m", 771, "0");
}

- (void)blueLightSchedule:.cold.1()
{
  v0 = DBSLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT)) {
    OUTLINED_FUNCTION_0(&dword_235D7B000, v1, v2, "Could not get blr status.", v3, v4, v5, v6, 0);
  }

  __assert_rtn("-[DBSSettingsController blueLightSchedule:]", "DBSSettingsController.m", 807, "0");
}

@end