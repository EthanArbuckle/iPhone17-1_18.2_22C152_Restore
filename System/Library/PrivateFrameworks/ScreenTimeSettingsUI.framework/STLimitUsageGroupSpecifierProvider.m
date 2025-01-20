@interface STLimitUsageGroupSpecifierProvider
+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4;
- (BOOL)showDemoModeAlertIfNeeded;
- (NSTimer)downtimeScheduleRefreshTimer;
- (PSSpecifier)alwaysAllowedSpecifier;
- (PSSpecifier)appAndWebsiteActivitySpecifier;
- (PSSpecifier)appLimitsSpecifier;
- (PSSpecifier)deviceBedtimeSpecifier;
- (PSSpecifier)screenDistanceSpecifier;
- (STAppAndWebsiteActivityOnboardingController)appAndWebsiteActivityOnboardingController;
- (STEyeReliefOnboardingController)eyeReliefOnboardingController;
- (STLimitUsageGroupSpecifierProvider)init;
- (UIViewController)rootViewController;
- (id)_subtitleTextForDeviceBedtime:(id)a3;
- (id)alwaysAllowedDetailText;
- (id)appLimitsDetailText;
- (id)limitUsageSpecifers;
- (void)_hasWatchOSDevicesOnlyDidChange:(BOOL)a3;
- (void)_isScreenTimeEnabledOrHasWatchOSDevicesOnlyDidChange;
- (void)_refreshBedtimeSpecifiersForBedtime:(id)a3;
- (void)alwaysAllowListController:(id)a3 didFinishEditingAlwaysAllowList:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)scheduleDowntimeRefreshAndReloadSpecifiersForBedtime:(id)a3;
- (void)scheduleDowntimeRefreshIfNeeded;
- (void)setAlwaysAllowedSpecifier:(id)a3;
- (void)setAppAndWebsiteActivityOnboardingController:(id)a3;
- (void)setAppAndWebsiteActivitySpecifier:(id)a3;
- (void)setAppLimitsSpecifier:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDeviceBedtimeSpecifier:(id)a3;
- (void)setDowntimeScheduleRefreshTimer:(id)a3;
- (void)setEyeReliefOnboardingController:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setScreenDistanceSpecifier:(id)a3;
- (void)setUpAppAndWebsiteActivity:(id)a3;
- (void)setUpScreenDistance:(id)a3;
- (void)showAlwaysAllowedViewController:(id)a3;
- (void)showAppLimitsViewController:(id)a3;
- (void)showDeviceBedtimeViewController:(id)a3;
- (void)showScreenDistanceViewController:(id)a3;
@end

@implementation STLimitUsageGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3 rootViewController:(id)a4
{
  id v5 = a4;
  v6 = +[STRootGroupSpecifierProvider providerWithCoordinator:a3];
  [v6 setRootViewController:v5];

  return v6;
}

- (STLimitUsageGroupSpecifierProvider)init
{
  v85[1] = *MEMORY[0x263EF8340];
  v81.receiver = self;
  v81.super_class = (Class)STLimitUsageGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v81 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle bundle];
    unint64_t v4 = 0x263F5F000uLL;
    id v5 = (void *)MEMORY[0x263F5FC40];
    v6 = [v3 localizedStringForKey:@"LimitUsageGroupSpecifierName" value:&stru_26D9391A8 table:0];
    v7 = [v5 groupSpecifierWithName:v6];
    [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v7];

    v76 = [(STGroupSpecifierProvider *)v2 mutableSpecifiers];
    char v8 = _os_feature_enabled_impl();
    v9 = (void *)MEMORY[0x263F602C8];
    v73 = v3;
    if (v8)
    {
      uint64_t v10 = [v3 localizedStringForKey:@"AppAndWebsiteActivitySpecifierName" value:&stru_26D9391A8 table:0];
      v69 = [v3 localizedStringForKey:@"AppAndWebsiteActivitySpecifierSubtitleText" value:&stru_26D9391A8 table:0];
      v74 = (void *)v10;
      v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v10 target:v2 set:0 get:0 detail:0 cell:2 edit:objc_opt_class()];
      [v11 setIdentifier:@"APP_AND_WEBSITE_ACTIVITY"];
      uint64_t v79 = *MEMORY[0x263F602D0];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10);
      [v11 setObject:v69 forKeyedSubscript:*v9];
      uint64_t v78 = *MEMORY[0x263F60138];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", @"APP_AND_WEBSITE_ACTIVITY");
      uint64_t v12 = objc_opt_class();
      uint64_t v77 = *MEMORY[0x263F5FFE0];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12);
      v13 = (void *)[objc_alloc(MEMORY[0x263F4B508]) initWithSymbolName:@"chart.bar.xaxis" bundleURL:0];
      v14 = objc_opt_new();
      v15 = (void *)[objc_alloc(MEMORY[0x263F4B4F0]) initWithSystemColor:11];
      v85[0] = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:1];
      [v14 setSymbolColors:v16];

      v17 = (void *)[objc_alloc(MEMORY[0x263F4B4F0]) initWithSystemColor:6];
      v84 = v17;
      v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v84 count:1];
      [v14 setEnclosureColors:v18];

      [v14 setRenderingMode:3];
      v19 = [v13 imageForGraphicSymbolDescriptor:v14];
      v20 = objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:", objc_msgSend(v19, "CGImage"));
      v21 = [v20 _applicationIconImageForFormat:0 precomposed:1];

      uint64_t v22 = *MEMORY[0x263F60140];
      [v11 setObject:v21 forKeyedSubscript:*MEMORY[0x263F60140]];
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      uint64_t v71 = *MEMORY[0x263F60228];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v24);

      uint64_t v67 = *MEMORY[0x263F60320];
      objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_26D966D90);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x263EFFA88]);
      [v11 setControllerLoadAction:sel_setUpAppAndWebsiteActivity_];
      [(STLimitUsageGroupSpecifierProvider *)v2 setAppAndWebsiteActivitySpecifier:v11];

      v3 = v73;
      unint64_t v4 = 0x263F5F000;

      uint64_t v25 = v79;
    }
    else
    {
      uint64_t v25 = *MEMORY[0x263F602D0];
      uint64_t v78 = *MEMORY[0x263F60138];
      uint64_t v77 = *MEMORY[0x263F5FFE0];
      uint64_t v22 = *MEMORY[0x263F60140];
      uint64_t v71 = *MEMORY[0x263F60228];
      uint64_t v67 = *MEMORY[0x263F60320];
    }
    uint64_t v26 = [v3 localizedStringForKey:@"DeviceDowntimeSpecifierName" value:&stru_26D9391A8 table:0];
    v27 = [*(id *)(v4 + 3136) preferenceSpecifierNamed:v26 target:v2 set:0 get:0 detail:0 cell:2 edit:objc_opt_class()];
    [v27 setIdentifier:@"DOWNTIME"];
    v70 = (void *)v26;
    uint64_t v80 = v25;
    [v27 setObject:v26 forKeyedSubscript:v25];
    [v27 setObject:@"DOWNTIME" forKeyedSubscript:v78];
    [v27 setObject:objc_opt_class() forKeyedSubscript:v77];
    v28 = [MEMORY[0x263F827E8] imageNamed:@"DeviceDowntime" inBundle:v3];
    v29 = [v28 _applicationIconImageForFormat:0 precomposed:1];
    uint64_t v75 = v22;
    [v27 setObject:v29 forKeyedSubscript:v22];

    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    [v27 setObject:v31 forKeyedSubscript:v71];

    [v27 setObject:&unk_26D966D90 forKeyedSubscript:v67];
    [v27 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D940308];
    [v27 setControllerLoadAction:sel_showDeviceBedtimeViewController_];
    v72 = v27;
    [(STLimitUsageGroupSpecifierProvider *)v2 setDeviceBedtimeSpecifier:v27];
    if ((_os_feature_enabled_impl() & 1) == 0) {
      [v76 addObject:v27];
    }
    uint64_t v32 = [v3 localizedStringForKey:@"AppLimitsSpecifierName" value:&stru_26D9391A8 table:0];
    [*(id *)(v4 + 3136) preferenceSpecifierNamed:v32 target:v2 set:0 get:0 detail:0 cell:2 edit:objc_opt_class()];
    v34 = v33 = v3;
    [v34 setIdentifier:@"APP_LIMITS"];
    v68 = (void *)v32;
    [v34 setObject:v32 forKeyedSubscript:v80];
    [v34 setObject:@"APP_LIMITS" forKeyedSubscript:v78];
    v35 = [(STLimitUsageGroupSpecifierProvider *)v2 appLimitsDetailText];
    uint64_t v36 = *MEMORY[0x263F602C8];
    [v34 setObject:v35 forKeyedSubscript:*MEMORY[0x263F602C8]];

    [v34 setObject:objc_opt_class() forKeyedSubscript:v77];
    v37 = [MEMORY[0x263F827E8] imageNamed:@"AppLimits" inBundle:v33];
    [v37 _applicationIconImageForFormat:0 precomposed:1];
    v39 = unint64_t v38 = v4;
    [v34 setObject:v39 forKeyedSubscript:v75];

    [v34 setControllerLoadAction:sel_showAppLimitsViewController_];
    v66 = v34;
    [(STLimitUsageGroupSpecifierProvider *)v2 setAppLimitsSpecifier:v34];
    uint64_t v40 = [v33 localizedStringForKey:@"AlwaysAllowedSpecifierName" value:&stru_26D9391A8 table:0];
    v41 = [*(id *)(v38 + 3136) preferenceSpecifierNamed:v40 target:v2 set:0 get:0 detail:0 cell:2 edit:0];
    [v41 setIdentifier:@"ALWAYS_ALLOWED"];
    v65 = (void *)v40;
    [v41 setObject:v40 forKeyedSubscript:v80];
    [v41 setObject:@"ALWAYS_ALLOWED" forKeyedSubscript:v78];
    v42 = [(STLimitUsageGroupSpecifierProvider *)v2 alwaysAllowedDetailText];
    uint64_t v64 = v36;
    [v41 setObject:v42 forKeyedSubscript:v36];

    [v41 setObject:objc_opt_class() forKeyedSubscript:v77];
    v43 = [MEMORY[0x263F827E8] imageNamed:@"AlwaysAllow" inBundle:v33];
    v44 = [v43 _applicationIconImageForFormat:0 precomposed:1];
    [v41 setObject:v44 forKeyedSubscript:v75];

    [v41 setControllerLoadAction:sel_showAlwaysAllowedViewController_];
    [(STLimitUsageGroupSpecifierProvider *)v2 setAlwaysAllowedSpecifier:v41];
    if ((_os_feature_enabled_impl() & 1) == 0) {
      [v76 addObject:v41];
    }
    v45 = [v33 localizedStringForKey:@"ScreenDistanceSpecifierName" value:&stru_26D9391A8 table:0];
    uint64_t v46 = [v33 localizedStringForKey:@"ScreenDistanceSpecifierSubtitleText" value:&stru_26D9391A8 table:0];
    v47 = objc_opt_new();
    v48 = (void *)[objc_alloc(MEMORY[0x263F4B4F0]) initWithSystemColor:7];
    v83 = v48;
    v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
    [v47 setSymbolColors:v49];

    v50 = (void *)v46;
    v51 = [MEMORY[0x263F4B4F0] white];
    v82 = v51;
    v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v82 count:1];
    [v47 setEnclosureColors:v52];

    [v47 setSymbolSize:2];
    [v47 setSymbolWeight:5];
    v53 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B5A0]];
    [v53 size];
    objc_msgSend(v47, "setSize:");

    id v54 = objc_alloc(MEMORY[0x263F4B508]);
    v55 = [v33 bundleURL];
    v56 = (void *)[v54 initWithSymbolName:@"screen-distance.symbol" bundleURL:v55];

    v57 = [v56 imageForGraphicSymbolDescriptor:v47];
    v58 = (void *)MEMORY[0x263F827E8];
    uint64_t v59 = [v57 CGImage];
    [v57 scale];
    v60 = objc_msgSend(v58, "imageWithCGImage:scale:orientation:", v59, 0);
    v61 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v45 target:v2 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    [v61 setIdentifier:@"EYE_DISTANCE"];
    [v61 setObject:@"EYE_DISTANCE" forKeyedSubscript:v78];
    [v61 setObject:v45 forKeyedSubscript:v80];
    [v61 setObject:v46 forKeyedSubscript:v64];
    [v61 setObject:objc_opt_class() forKeyedSubscript:v77];
    [v61 setObject:v60 forKeyedSubscript:v75];
    [v61 setControllerLoadAction:sel_setUpScreenDistance_];
    [(STLimitUsageGroupSpecifierProvider *)v2 setScreenDistanceSpecifier:v61];
    if ((_os_feature_enabled_impl() & 1) == 0) {
      [v76 addObject:v61];
    }
    [(STLimitUsageGroupSpecifierProvider *)v2 scheduleDowntimeRefreshIfNeeded];
    v62 = [MEMORY[0x263F53C50] sharedConnection];
    [v62 registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v5.receiver = self;
  v5.super_class = (Class)STLimitUsageGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v5 invalidate];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)STLimitUsageGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v4 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.isLocalOrRemotelyManagedUser" context:"STLimitUsageGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"viewModel.screenTimeEnabled" context:"STLimitUsageGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.bedtime" context:"STLimitUsageGroupSpecifierProviderObservationContext"];
  [v5 removeObserver:self forKeyPath:@"viewModel.hasWatchOSDevicesOnly"];
  v6.receiver = self;
  v6.super_class = (Class)STLimitUsageGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"viewModel.isLocalOrRemotelyManagedUser" options:4 context:"STLimitUsageGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"timeAllowancesCoordinator.viewModel.bedtime" options:5 context:"STLimitUsageGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"viewModel.screenTimeEnabled" options:4 context:"STLimitUsageGroupSpecifierProviderObservationContext"];
  [v4 addObserver:self forKeyPath:@"viewModel.hasWatchOSDevicesOnly" options:5 context:"STLimitUsageGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "STLimitUsageGroupSpecifierProviderObservationContext")
  {
    uint64_t v12 = [(STRootGroupSpecifierProvider *)self coordinator];
    if ([v10 isEqualToString:@"timeAllowancesCoordinator.viewModel.bedtime"])
    {
      v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v14 = [MEMORY[0x263EFF9D0] null];

      if (v13 == v14)
      {

        v13 = 0;
      }
      [(STLimitUsageGroupSpecifierProvider *)self _deviceBedtimeDidChange:v13];
    }
    else
    {
      if (_os_feature_enabled_impl())
      {
        v15 = [MEMORY[0x263F53C50] sharedConnection];
        int v16 = [v15 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

        if ([v10 isEqualToString:@"viewModel.isLocalOrRemotelyManagedUser"])
        {
          v17 = [(STRootGroupSpecifierProvider *)self coordinator];
          v18 = [v17 viewModel];
          unsigned int v19 = [v18 isLocalOrRemotelyManagedUser] ^ 1;
          if (v16 == 2) {
            uint64_t v20 = 1;
          }
          else {
            uint64_t v20 = v19;
          }
          [(STGroupSpecifierProvider *)self setIsHidden:v20];
        }
        else if (([v10 isEqualToString:@"viewModel.screenTimeEnabled"] & 1) != 0 {
               || [v10 isEqualToString:@"viewModel.hasWatchOSDevicesOnly"])
        }
        {
          [(STLimitUsageGroupSpecifierProvider *)self _isScreenTimeEnabledOrHasWatchOSDevicesOnlyDidChange];
        }
        goto LABEL_8;
      }
      if ([v10 isEqualToString:@"viewModel.screenTimeEnabled"])
      {
        v21 = [v12 viewModel];
        int v22 = [v21 isScreenTimeEnabled];

        [(STGroupSpecifierProvider *)self setIsHidden:v22 ^ 1u];
        goto LABEL_8;
      }
      if (![v10 isEqualToString:@"viewModel.hasWatchOSDevicesOnly"]) {
        goto LABEL_8;
      }
      v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v23 = [MEMORY[0x263EFF9D0] null];

      if (v13 == v23)
      {

        v13 = 0;
      }
      -[STLimitUsageGroupSpecifierProvider _hasWatchOSDevicesOnlyDidChange:](self, "_hasWatchOSDevicesOnlyDidChange:", [v13 BOOLValue]);
    }

LABEL_8:
    goto LABEL_9;
  }
  v24.receiver = self;
  v24.super_class = (Class)STLimitUsageGroupSpecifierProvider;
  [(STLimitUsageGroupSpecifierProvider *)&v24 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_9:
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (_os_feature_enabled_impl())
  {
    objc_super v5 = [MEMORY[0x263F53C50] sharedConnection];
    int v6 = [v5 effectiveBoolValueForSetting:*MEMORY[0x263F53890]];

    id v10 = [(STRootGroupSpecifierProvider *)self coordinator];
    v7 = [v10 viewModel];
    unsigned int v8 = [v7 isLocalOrRemotelyManagedUser] ^ 1;
    if (v6 == 2) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    [(STGroupSpecifierProvider *)self setIsHidden:v9];
  }
}

- (void)_isScreenTimeEnabledOrHasWatchOSDevicesOnlyDidChange
{
  id v4 = [(STLimitUsageGroupSpecifierProvider *)self limitUsageSpecifers];
  v3 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
  if (([v4 isEqualToArray:v3] & 1) == 0) {
    objc_msgSend(v3, "replaceObjectsInRange:withObjectsFromArray:", 0, objc_msgSend(v3, "count"), v4);
  }
}

- (id)limitUsageSpecifers
{
  v21[3] = *MEMORY[0x263EF8340];
  v3 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 viewModel];
  int v5 = [v4 isScreenTimeEnabled];

  int v6 = [(STRootGroupSpecifierProvider *)self coordinator];
  v7 = [v6 viewModel];
  char v8 = [v7 hasWatchOSDevicesOnly];

  uint64_t v9 = (void *)MEMORY[0x263EFF980];
  if (v5)
  {
    uint64_t v10 = [(STLimitUsageGroupSpecifierProvider *)self deviceBedtimeSpecifier];
    id v11 = (void *)v10;
    if (v8)
    {
      v20[0] = v10;
      uint64_t v12 = [(STLimitUsageGroupSpecifierProvider *)self alwaysAllowedSpecifier];
      v20[1] = v12;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
      v14 = [v9 arrayWithArray:v13];
    }
    else
    {
      v21[0] = v10;
      uint64_t v12 = [(STLimitUsageGroupSpecifierProvider *)self appLimitsSpecifier];
      v21[1] = v12;
      v13 = [(STLimitUsageGroupSpecifierProvider *)self alwaysAllowedSpecifier];
      v21[2] = v13;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
      v14 = [v9 arrayWithArray:v15];
    }
  }
  else
  {
    id v11 = [(STLimitUsageGroupSpecifierProvider *)self appAndWebsiteActivitySpecifier];
    unsigned int v19 = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    v14 = [v9 arrayWithArray:v12];
  }

  int v16 = [(STLimitUsageGroupSpecifierProvider *)self screenDistanceSpecifier];

  if (v16)
  {
    v17 = [(STLimitUsageGroupSpecifierProvider *)self screenDistanceSpecifier];
    [v14 addObject:v17];
  }

  return v14;
}

- (void)setUpAppAndWebsiteActivity:(id)a3
{
  id v4 = [(STRootGroupSpecifierProvider *)self coordinator];
  int v5 = objc_opt_new();
  [(STLimitUsageGroupSpecifierProvider *)self setAppAndWebsiteActivityOnboardingController:v5];

  int v6 = [(STLimitUsageGroupSpecifierProvider *)self appAndWebsiteActivityOnboardingController];
  v7 = [(STLimitUsageGroupSpecifierProvider *)self rootViewController];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__STLimitUsageGroupSpecifierProvider_setUpAppAndWebsiteActivity___block_invoke;
  v9[3] = &unk_2647671D8;
  id v10 = v4;
  id v8 = v4;
  [v6 presentOverViewController:v7 completionBlock:v9];
}

uint64_t __65__STLimitUsageGroupSpecifierProvider_setUpAppAndWebsiteActivity___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setScreenTimeEnabled:1 completionHandler:&__block_literal_global_0];
  }
  return result;
}

void __65__STLimitUsageGroupSpecifierProvider_setUpAppAndWebsiteActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = +[STUILog persistence];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __65__STLimitUsageGroupSpecifierProvider_setUpAppAndWebsiteActivity___block_invoke_2_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void)scheduleDowntimeRefreshAndReloadSpecifiersForBedtime:(id)a3
{
  id v4 = a3;
  [(STLimitUsageGroupSpecifierProvider *)self scheduleDowntimeRefreshIfNeeded];
  [(STLimitUsageGroupSpecifierProvider *)self _refreshBedtimeSpecifiersForBedtime:v4];
}

- (void)scheduleDowntimeRefreshIfNeeded
{
  v3 = [(STLimitUsageGroupSpecifierProvider *)self downtimeScheduleRefreshTimer];

  if (v3)
  {
    id v4 = [(STLimitUsageGroupSpecifierProvider *)self downtimeScheduleRefreshTimer];
    [v4 invalidate];

    [(STLimitUsageGroupSpecifierProvider *)self setDowntimeScheduleRefreshTimer:0];
  }
  int v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  int v6 = [v5 timeAllowancesCoordinator];
  [v6 timeToNextExpectedStateChange];
  double v8 = v7;

  if (v8 >= 0.0)
  {
    objc_initWeak(&location, self);
    uint64_t v9 = (void *)MEMORY[0x263EFFA20];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __69__STLimitUsageGroupSpecifierProvider_scheduleDowntimeRefreshIfNeeded__block_invoke;
    v14 = &unk_264767200;
    objc_copyWeak(&v15, &location);
    id v10 = [v9 scheduledTimerWithTimeInterval:0 repeats:&v11 block:v8];
    -[STLimitUsageGroupSpecifierProvider setDowntimeScheduleRefreshTimer:](self, "setDowntimeScheduleRefreshTimer:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __69__STLimitUsageGroupSpecifierProvider_scheduleDowntimeRefreshIfNeeded__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained coordinator];
  id v4 = [v3 timeAllowancesCoordinator];
  int v5 = [v4 viewModel];
  id v7 = [v5 bedtime];

  id v6 = objc_loadWeakRetained(v1);
  [v6 scheduleDowntimeRefreshAndReloadSpecifiersForBedtime:v7];
}

- (void)_refreshBedtimeSpecifiersForBedtime:(id)a3
{
  id v4 = a3;
  int v5 = [(STLimitUsageGroupSpecifierProvider *)self deviceBedtimeSpecifier];
  id v15 = v5;
  if (!v4) {
    goto LABEL_4;
  }
  id v6 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v7 = [v6 viewModel];
  char v8 = [v7 isScreenTimeEnabled];

  int v5 = v15;
  if (v8)
  {
    uint64_t v9 = +[STScreenTimeSettingsUIBundle bundle];
    id v10 = [v9 localizedStringForKey:@"DeviceDowntimeAlternateCustomScheduleDetailText" value:&stru_26D9391A8 table:0];

    [v15 setObject:v10 forKeyedSubscript:0x26D943648];
    [v15 setObject:&unk_26D966DA8 forKeyedSubscript:0x26D943668];
  }
  else
  {
LABEL_4:
    [v5 removePropertyForKey:0x26D943648];
    [v15 removePropertyForKey:0x26D943668];
  }
  uint64_t v11 = *MEMORY[0x263F602C8];
  uint64_t v12 = [v15 objectForKeyedSubscript:*MEMORY[0x263F602C8]];
  v13 = [(STLimitUsageGroupSpecifierProvider *)self _subtitleTextForDeviceBedtime:v4];

  if (([v12 isEqualToString:v13] & 1) == 0)
  {
    [v15 setObject:v13 forKeyedSubscript:v11];
    [(STGroupSpecifierProvider *)self reloadSpecifier:v15 animated:0];
    v14 = [v15 propertyForKey:v11];
    if (([v14 isEqualToString:v13] & 1) == 0) {
      [(STGroupSpecifierProvider *)self reloadSpecifier:v15 animated:0];
    }
  }
}

- (id)_subtitleTextForDeviceBedtime:(id)a3
{
  id v4 = a3;
  int v5 = +[STScreenTimeSettingsUIBundle bundle];
  if (!v4
    || ([(STRootGroupSpecifierProvider *)self coordinator],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 viewModel],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isScreenTimeEnabled],
        v7,
        v6,
        !v8))
  {
    v13 = @"DeviceDowntimeDetailText";
    goto LABEL_7;
  }
  char v9 = [v4 deviceBedtimeEnabled];
  id v10 = [(STRootGroupSpecifierProvider *)self coordinator];
  uint64_t v11 = [v10 timeAllowancesCoordinator];
  unint64_t v12 = [v11 currentDowntimeState];

  if ((v9 & 1) == 0)
  {
    if (v12 == 4) {
      v13 = @"DeviceDowntimeStatusScheduleOffWithOverrideOn";
    }
    else {
      v13 = @"DeviceDowntimeDailyScheduleOff";
    }
    goto LABEL_7;
  }
  if (v12 <= 4)
  {
    v13 = off_264767248[v12];
LABEL_7:
    v14 = [v5 localizedStringForKey:v13 value:&stru_26D9391A8 table:0];
    goto LABEL_8;
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (void)showDeviceBedtimeViewController:(id)a3
{
  id v16 = a3;
  if (![(STLimitUsageGroupSpecifierProvider *)self showDemoModeAlertIfNeeded])
  {
    id v4 = objc_opt_new();
    int v5 = [(STRootGroupSpecifierProvider *)self coordinator];
    id v6 = [v5 timeAllowancesCoordinator];
    id v7 = [v6 viewModel];
    int v8 = [v7 bedtime];
    [v4 setBedtime:v8];

    char v9 = [(STRootGroupSpecifierProvider *)self coordinator];
    id v10 = [v9 viewModel];
    uint64_t v11 = [v10 me];
    [v4 setAffectedUser:v11];

    unint64_t v12 = [(STRootGroupSpecifierProvider *)self coordinator];
    objc_msgSend(v4, "setCanAskForMoreTime:", objc_msgSend(v12, "isPasscodeEnabled"));

    v13 = [(STRootGroupSpecifierProvider *)self coordinator];
    [v4 setCoordinator:v13];

    v14 = [(STGroupSpecifierProvider *)self delegate];
    [v4 setParentController:v14];
    id v15 = [v14 rootController];
    [v4 setRootController:v15];

    [v4 setSpecifier:v16];
    [(STGroupSpecifierProvider *)self showController:v4 animated:1];
  }
}

- (id)appLimitsDetailText
{
  id v2 = +[STScreenTimeSettingsUIBundle bundle];
  v3 = [v2 localizedStringForKey:@"AppLimitsDetailText" value:&stru_26D9391A8 table:0];

  return v3;
}

- (void)showAppLimitsViewController:(id)a3
{
  id v8 = a3;
  if (![(STLimitUsageGroupSpecifierProvider *)self showDemoModeAlertIfNeeded])
  {
    id v4 = objc_opt_new();
    int v5 = [(STRootGroupSpecifierProvider *)self coordinator];
    [v4 setCoordinator:v5];

    id v6 = [(STGroupSpecifierProvider *)self delegate];
    [v4 setParentController:v6];
    id v7 = [v6 rootController];
    [v4 setRootController:v7];

    [v4 setSpecifier:v8];
    [(STGroupSpecifierProvider *)self showController:v4 animated:1];
  }
}

- (void)_hasWatchOSDevicesOnlyDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
  int v5 = [(STLimitUsageGroupSpecifierProvider *)self appLimitsSpecifier];
  int v6 = [v8 containsObject:v5];
  if (v6 && v3)
  {
    [v8 removeObject:v5];
  }
  else if (((v6 | v3) & 1) == 0)
  {
    id v7 = [(STLimitUsageGroupSpecifierProvider *)self deviceBedtimeSpecifier];
    objc_msgSend(v8, "ps_insertObject:afterObject:", v5, v7);
  }
}

- (id)alwaysAllowedDetailText
{
  id v2 = +[STScreenTimeSettingsUIBundle bundle];
  BOOL v3 = [v2 localizedStringForKey:@"AlwaysAllowDetailText" value:&stru_26D9391A8 table:0];

  return v3;
}

- (void)showAlwaysAllowedViewController:(id)a3
{
  id v4 = a3;
  if (![(STLimitUsageGroupSpecifierProvider *)self showDemoModeAlertIfNeeded])
  {
    int v5 = [(STRootGroupSpecifierProvider *)self coordinator];
    int v6 = [v5 timeAllowancesCoordinator];
    id v7 = [v6 viewModel];

    v28 = v7;
    id v8 = [v7 alwaysAllowList];
    if (!v8)
    {
      char v9 = +[STUILog alwaysAllowed];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225B06000, v9, OS_LOG_TYPE_DEFAULT, "View model has no existing Always Allow list. Creating view controller with default Always Allow list.", buf, 2u);
      }

      id v8 = objc_opt_new();
    }
    id v10 = objc_opt_new();
    [v10 setAlwaysAllowList:v8];
    v29 = v5;
    [v10 setCoordinator:v5];
    [v10 setDelegate:self];
    uint64_t v11 = objc_opt_new();
    unint64_t v12 = [MEMORY[0x263F318B0] systemUnblockableBundleIdentifiersForDeviceFamily:102];
    if (v12)
    {
      [v11 unionSet:v12];
    }
    else
    {
      v13 = objc_opt_new();
      [v11 unionSet:v13];
    }
    v14 = [MEMORY[0x263F318B0] systemBlockableBundleIdentifiersForDeviceFamily:102];
    if (v14)
    {
      [v11 unionSet:v14];
    }
    else
    {
      id v15 = objc_opt_new();
      [v11 unionSet:v15];
    }
    id v16 = [MEMORY[0x263F318B0] systemHiddenBundleIdentifiersForDeviceFamily:102];
    if (v16)
    {
      [v11 unionSet:v16];
    }
    else
    {
      v17 = objc_opt_new();
      [v11 unionSet:v17];
    }
    id v18 = objc_alloc(MEMORY[0x263EFF9C0]);
    unsigned int v19 = [v8 allowedBundleIDs];
    uint64_t v20 = (void *)[v18 initWithArray:v19];

    [v20 unionSet:v11];
    v21 = [(STRootGroupSpecifierProvider *)self coordinator];
    int v22 = [v21 viewModel];
    v23 = [v22 installedBundleIDs];

    [v10 setInstalledBundleIDs:v23];
    objc_super v24 = (void *)[v23 mutableCopy];
    [v24 minusSet:v20];
    uint64_t v25 = [v24 allObjects];
    [v10 setChooseBundleIDs:v25];

    uint64_t v26 = [(STGroupSpecifierProvider *)self delegate];
    [v10 setParentController:v26];
    v27 = [v26 rootController];
    [v10 setRootController:v27];

    [v10 setSpecifier:v4];
    [(STGroupSpecifierProvider *)self showController:v10 animated:1];
  }
}

- (void)alwaysAllowListController:(id)a3 didFinishEditingAlwaysAllowList:(id)a4
{
  id v5 = a4;
  int v6 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v7 = [v6 timeAllowancesCoordinator];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __96__STLimitUsageGroupSpecifierProvider_alwaysAllowListController_didFinishEditingAlwaysAllowList___block_invoke;
  v8[3] = &unk_2647671B0;
  v8[4] = self;
  [v7 saveAlwaysAllowList:v5 completionHandler:v8];
}

void __96__STLimitUsageGroupSpecifierProvider_alwaysAllowListController_didFinishEditingAlwaysAllowList___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) alwaysAllowedDetailText];
  BOOL v3 = [*(id *)(a1 + 32) alwaysAllowedSpecifier];
  [v3 setObject:v2 forKeyedSubscript:*MEMORY[0x263F602C8]];

  id v4 = *(void **)(a1 + 32);
  id v5 = [v4 alwaysAllowedSpecifier];
  [v4 reloadSpecifier:v5 animated:1];
}

- (void)setUpScreenDistance:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  int v6 = [v5 eyeReliefCoordinator];
  id v7 = [v6 viewModel];

  int v8 = [v7 hasAcknowledgedIntroScreens];
  char v9 = +[STUILog eyeRelief];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v7 isEyeReliefEnabled];
    uint64_t v11 = @"no";
    if (v10) {
      unint64_t v12 = @"yes";
    }
    else {
      unint64_t v12 = @"no";
    }
    if (v8) {
      uint64_t v11 = @"yes";
    }
    *(_DWORD *)buf = 138412546;
    unsigned int v19 = v12;
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_225B06000, v9, OS_LOG_TYPE_DEFAULT, "isEyeReliefEnabled: %@, hasAcknowledgedIntroScreens: %@", buf, 0x16u);
  }

  if (([v7 isEyeReliefEnabled] | v8) == 1 && (objc_msgSend(v7, "inDemoMode") & 1) == 0)
  {
    if ((v8 & 1) == 0) {
      [v7 acknowledgeIntroScreens];
    }
    [(STLimitUsageGroupSpecifierProvider *)self showScreenDistanceViewController:v4];
  }
  else
  {
    v13 = [[STEyeReliefOnboardingController alloc] initWithCoordinator:v5];
    [(STLimitUsageGroupSpecifierProvider *)self setEyeReliefOnboardingController:v13];

    objc_initWeak((id *)buf, self);
    v14 = [(STLimitUsageGroupSpecifierProvider *)self eyeReliefOnboardingController];
    id v15 = [(STLimitUsageGroupSpecifierProvider *)self rootViewController];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__STLimitUsageGroupSpecifierProvider_setUpScreenDistance___block_invoke;
    v16[3] = &unk_264767228;
    objc_copyWeak(&v17, (id *)buf);
    [v14 presentOverViewController:v15 completionHandler:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __58__STLimitUsageGroupSpecifierProvider_setUpScreenDistance___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_13;
  }
  if (a2 == 1)
  {
    uint64_t v11 = [WeakRetained coordinator];
    unint64_t v12 = [v11 eyeReliefCoordinator];
    [v12 persistEyeReliefState:0];

    int v10 = [v4 coordinator];
    v13 = [v10 eyeReliefCoordinator];
    v14 = [v13 viewModel];
    [v14 acknowledgeIntroScreens];
  }
  else
  {
    if (a2 != 2) {
      goto LABEL_7;
    }
    id v5 = [WeakRetained coordinator];
    int v6 = [v5 eyeReliefCoordinator];
    [v6 persistEyeReliefState:1];

    id v7 = [v4 coordinator];
    int v8 = [v7 eyeReliefCoordinator];
    char v9 = [v8 viewModel];
    [v9 acknowledgeIntroScreens];

    int v10 = [v4 screenDistanceSpecifier];
    [v4 showScreenDistanceViewController:v10];
  }

LABEL_7:
  if (_os_feature_enabled_impl())
  {
    id v15 = [MEMORY[0x263F67088] sharedController];
    id v16 = [MEMORY[0x263F67088] sharedController];
    id v17 = [v16 viewContext];
    id v21 = 0;
    char v18 = [v15 saveContext:v17 error:&v21];
    id v19 = v21;

    if ((v18 & 1) == 0)
    {
      __int16 v20 = +[STUILog communicationSafety];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        __58__STLimitUsageGroupSpecifierProvider_setUpScreenDistance___block_invoke_cold_1((uint64_t)v19, v20);
      }
    }
  }
LABEL_13:
}

- (void)showScreenDistanceViewController:(id)a3
{
  id v8 = a3;
  if (![(STLimitUsageGroupSpecifierProvider *)self showDemoModeAlertIfNeeded])
  {
    id v4 = objc_opt_new();
    id v5 = [(STRootGroupSpecifierProvider *)self coordinator];
    [v4 setCoordinator:v5];

    int v6 = [(STGroupSpecifierProvider *)self delegate];
    [v4 setParentController:v6];
    id v7 = [v6 rootController];
    [v4 setRootController:v7];

    [v4 setSpecifier:v8];
    [(STGroupSpecifierProvider *)self showController:v4 animated:1];
  }
}

- (BOOL)showDemoModeAlertIfNeeded
{
  int v3 = [MEMORY[0x263F82438] isRunningInStoreDemoMode];
  if (v3) {
    [(STGroupSpecifierProvider *)self showStoreDemoAlert];
  }
  return v3;
}

- (UIViewController)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setRootViewController:(id)a3
{
}

- (PSSpecifier)appAndWebsiteActivitySpecifier
{
  return self->_appAndWebsiteActivitySpecifier;
}

- (void)setAppAndWebsiteActivitySpecifier:(id)a3
{
}

- (PSSpecifier)deviceBedtimeSpecifier
{
  return self->_deviceBedtimeSpecifier;
}

- (void)setDeviceBedtimeSpecifier:(id)a3
{
}

- (PSSpecifier)appLimitsSpecifier
{
  return self->_appLimitsSpecifier;
}

- (void)setAppLimitsSpecifier:(id)a3
{
}

- (PSSpecifier)alwaysAllowedSpecifier
{
  return self->_alwaysAllowedSpecifier;
}

- (void)setAlwaysAllowedSpecifier:(id)a3
{
}

- (PSSpecifier)screenDistanceSpecifier
{
  return self->_screenDistanceSpecifier;
}

- (void)setScreenDistanceSpecifier:(id)a3
{
}

- (NSTimer)downtimeScheduleRefreshTimer
{
  return self->_downtimeScheduleRefreshTimer;
}

- (void)setDowntimeScheduleRefreshTimer:(id)a3
{
}

- (STAppAndWebsiteActivityOnboardingController)appAndWebsiteActivityOnboardingController
{
  return self->_appAndWebsiteActivityOnboardingController;
}

- (void)setAppAndWebsiteActivityOnboardingController:(id)a3
{
}

- (STEyeReliefOnboardingController)eyeReliefOnboardingController
{
  return self->_eyeReliefOnboardingController;
}

- (void)setEyeReliefOnboardingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eyeReliefOnboardingController, 0);
  objc_storeStrong((id *)&self->_appAndWebsiteActivityOnboardingController, 0);
  objc_storeStrong((id *)&self->_downtimeScheduleRefreshTimer, 0);
  objc_storeStrong((id *)&self->_screenDistanceSpecifier, 0);
  objc_storeStrong((id *)&self->_alwaysAllowedSpecifier, 0);
  objc_storeStrong((id *)&self->_appLimitsSpecifier, 0);
  objc_storeStrong((id *)&self->_deviceBedtimeSpecifier, 0);
  objc_storeStrong((id *)&self->_appAndWebsiteActivitySpecifier, 0);

  objc_destroyWeak((id *)&self->_rootViewController);
}

void __65__STLimitUsageGroupSpecifierProvider_setUpAppAndWebsiteActivity___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "failed to set screen time enabled: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __58__STLimitUsageGroupSpecifierProvider_setUpScreenDistance___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "Failed to save Communication Safety settings: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end