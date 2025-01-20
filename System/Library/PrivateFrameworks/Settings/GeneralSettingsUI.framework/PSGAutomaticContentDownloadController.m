@interface PSGAutomaticContentDownloadController
- (BOOL)inLowDataMode;
- (NSMutableArray)applications;
- (NSMutableDictionary)applicationStates;
- (OS_nw_path_evaluator)defaultPathEvaluator;
- (PSGAutomaticContentDownloadController)init;
- (id)applicationEnabled:(id)a3;
- (id)backgroundRefreshState:(id)a3;
- (id)specifiers;
- (id)whitelist;
- (void)dealloc;
- (void)setApplicationEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setApplicationStates:(id)a3;
- (void)setApplications:(id)a3;
- (void)setBackgroundRefreshState:(id)a3 withSpecifier:(id)a4;
- (void)setDefaultPathEvaluator:(id)a3;
- (void)setInLowDataMode:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PSGAutomaticContentDownloadController

- (PSGAutomaticContentDownloadController)init
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)PSGAutomaticContentDownloadController;
  v2 = [(PSGAutomaticContentDownloadController *)&v20 init];
  if (v2)
  {
    v3 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
    v4 = v3;
    if (v3) {
      id v5 = (id)[v3 mutableCopy];
    }
    else {
      id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    v6 = v5;
    objc_storeStrong((id *)&v2->_applicationStates, v5);

    v7 = _PSGLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      applicationStates = v2->_applicationStates;
      *(_DWORD *)buf = 138412290;
      v22 = applicationStates;
      _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, "########### _applicationStates %@", buf, 0xCu);
    }

    v9 = [(PSGAutomaticContentDownloadController *)v2 defaultPathEvaluator];
    BOOL v10 = v9 == 0;

    if (v10)
    {
      default_evaluator = (void *)nw_path_create_default_evaluator();
      [(PSGAutomaticContentDownloadController *)v2 setDefaultPathEvaluator:default_evaluator];

      objc_initWeak((id *)buf, v2);
      v12 = [(PSGAutomaticContentDownloadController *)v2 defaultPathEvaluator];
      id v13 = MEMORY[0x263EF83A0];
      uint64_t v17 = MEMORY[0x263EF8330];
      objc_copyWeak(&v19, (id *)buf);
      v18 = v2;
      nw_path_evaluator_set_update_handler();

      v14 = [(PSGAutomaticContentDownloadController *)v18 defaultPathEvaluator];
      v15 = nw_path_evaluator_copy_path();
      [(PSGAutomaticContentDownloadController *)v18 setInLowDataMode:nw_path_is_constrained(v15)];

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
  }
  return v2;
}

void __45__PSGAutomaticContentDownloadController_init__block_invoke(uint64_t a1, void *a2)
{
  path = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL is_constrained = nw_path_is_constrained(path);
    if (is_constrained != [WeakRetained inLowDataMode])
    {
      [WeakRetained setInLowDataMode:is_constrained];
      [*(id *)(a1 + 32) reloadSpecifiers];
    }
  }
}

- (void)dealloc
{
  v3 = [(PSGAutomaticContentDownloadController *)self defaultPathEvaluator];

  if (v3)
  {
    v4 = [(PSGAutomaticContentDownloadController *)self defaultPathEvaluator];
    nw_path_evaluator_cancel();

    [(PSGAutomaticContentDownloadController *)self setDefaultPathEvaluator:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)PSGAutomaticContentDownloadController;
  [(PSGAutomaticContentDownloadController *)&v5 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v21[1] = *MEMORY[0x263EF8340];
  if (!self->_settingsChangedObserver)
  {
    objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = *MEMORY[0x263F536E0];
    v7 = [MEMORY[0x263F53C50] sharedConnection];
    v8 = [MEMORY[0x263F08A48] mainQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__PSGAutomaticContentDownloadController_viewDidAppear___block_invoke;
    v20[3] = &unk_264E8C878;
    v20[4] = self;
    v9 = [v5 addObserverForName:v6 object:v7 queue:v8 usingBlock:v20];
    id settingsChangedObserver = self->_settingsChangedObserver;
    self->_id settingsChangedObserver = v9;
  }
  v19.receiver = self;
  v19.super_class = (Class)PSGAutomaticContentDownloadController;
  [(PSGAutomaticContentDownloadController *)&v19 viewDidAppear:v3];
  v11 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/AUTO_CONTENT_DOWNLOAD"];
  id v12 = objc_alloc(MEMORY[0x263F08DB0]);
  id v13 = [MEMORY[0x263EFF960] currentLocale];
  v14 = PSG_BundleForGeneralSettingsUIFramework();
  v15 = [v14 bundleURL];
  v16 = (void *)[v12 initWithKey:@"AUTO_CONTENT_DOWNLOAD" table:@"General" locale:v13 bundleURL:v15];

  uint64_t v17 = objc_msgSend(MEMORY[0x263F08DB0], "general_rootPaneComponent");
  v21[0] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  [(PSGAutomaticContentDownloadController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.background-app-refresh" title:v16 localizedNavigationComponents:v18 deepLink:v11];
}

void __55__PSGAutomaticContentDownloadController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F53B00]];
  int v5 = [v4 intValue];
  pid_t v6 = getpid();

  if (v5 != v6)
  {
    v7 = *(void **)(a1 + 32);
    [v7 reloadSpecifiers];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self->_settingsChangedObserver];

  id settingsChangedObserver = self->_settingsChangedObserver;
  self->_id settingsChangedObserver = 0;

  v7.receiver = self;
  v7.super_class = (Class)PSGAutomaticContentDownloadController;
  [(PSGAutomaticContentDownloadController *)&v7 viewDidDisappear:v3];
}

- (id)whitelist
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"com.apple.Passbook";
  v4[1] = @"com.apple.reminders";
  v5[0] = @"com.apple.Passbook";
  v5[1] = @"com.apple.reminders";
  v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (id)specifiers
{
  v128[3] = *MEMORY[0x263EF8340];
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v90 = (int)*MEMORY[0x263F5FDB8];
    v4 = [(PSGAutomaticContentDownloadController *)self loadSpecifiersFromPlistName:@"AutomaticContentDownload" target:self];
    int v5 = [MEMORY[0x263F53C50] sharedConnection];
    int v103 = [v5 isAutomaticAppUpdatesAllowed];
    pid_t v6 = [MEMORY[0x263F08AB0] processInfo];
    int v102 = [v6 isLowPowerModeEnabled];

    BOOL v7 = [(PSGAutomaticContentDownloadController *)self inLowDataMode];
    v94 = v5;
    unsigned int v95 = [v5 isAutomaticAppUpdatesModificationAllowed];
    LODWORD(v5) = MGGetBoolAnswer();
    v92 = v4;
    v8 = [v4 specifierForID:@"AUTO_CONTENT_DOWNLOAD"];
    v9 = v8;
    v91 = v8;
    v107 = self;
    if (v5)
    {
      [v8 setCellType:2];
      [v9 setDetailControllerClass:objc_opt_class()];
      [v9 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      BOOL v10 = PSG_LocalizedStringForAutomaticContentDownload(@"NONE");
      v128[0] = v10;
      BOOL v105 = v7;
      v11 = SFLocalizableWAPIStringKeyForKey();
      id v12 = PSG_LocalizedStringForAutomaticContentDownload(v11);
      v128[1] = v12;
      id v13 = SFLocalizableWAPIStringKeyForKey();
      v14 = PSG_LocalizedStringForAutomaticContentDownload(v13);
      v128[2] = v14;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:3];

      v16 = PSG_LocalizedStringForAutomaticContentDownload(@"NONE");
      v127[0] = v16;
      uint64_t v17 = SFLocalizableWAPIStringKeyForKey();
      v18 = PSG_LocalizedStringForAutomaticContentDownload(v17);
      v127[1] = v18;
      objc_super v19 = SFLocalizableWAPIStringKeyForKey();
      objc_super v20 = PSG_LocalizedStringForAutomaticContentDownload(v19);
      v127[2] = v20;
      v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v127 count:3];

      BOOL v7 = v105;
      v9 = v91;
      [v91 setValues:&unk_26F103D30 titles:v15 shortTitles:v21];
    }
    else
    {
      [v8 setCellType:6];
    }
    v22 = (uint64_t *)MEMORY[0x263F600A8];
    if (v102)
    {
      uint64_t v99 = *MEMORY[0x263F600A8];
      objc_msgSend(v9, "setProperty:forKey:", &unk_26F103A60);
      v89 = [v92 specifierForID:@"UPDATE_TYPE_GROUP"];
      v25 = SFLocalizableWAPIStringKeyForKey();
      v26 = PSG_LocalizedStringForAutomaticContentDownload(v25);
      [v89 setProperty:v26 forKey:*MEMORY[0x263F600F8]];
      int v103 = 0;
    }
    else
    {
      uint64_t v23 = [NSNumber numberWithBool:v95];
      uint64_t v99 = *v22;
      objc_msgSend(v9, "setProperty:forKey:", v23);

      v24 = [v92 specifierForID:@"UPDATE_TYPE_GROUP"];
      v89 = v24;
      if (v7)
      {
        v25 = SFLocalizableWAPIStringKeyForKey();
        v26 = PSG_LocalizedStringForAutomaticContentDownload(v25);
        uint64_t v28 = *MEMORY[0x263F600F8];
      }
      else
      {
        v27 = (uint64_t *)MEMORY[0x263F600F8];
        v25 = SFLocalizableWAPIStringKeyForKey();
        v26 = PSG_LocalizedStringForAutomaticContentDownload(v25);
        uint64_t v28 = *v27;
      }
      [v24 setProperty:v26 forKey:v28];
    }

    v100 = [MEMORY[0x263EFF9C0] set];
    PSGGreenTeaAppListLog(@"Reading AppList from LSApplicationWorkspace", v29, v30, v31, v32, v33, v34, v35, v88);
    v36 = [MEMORY[0x263F01880] defaultWorkspace];
    v37 = [v36 applicationsWithUIBackgroundModes];

    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v38 = v37;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v116 objects:v126 count:16];
    v104 = v38;
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v117;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v117 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v116 + 1) + 8 * i);
          v44 = [v43 appTags];
          char v45 = [v44 containsObject:@"hidden"];

          if ((v45 & 1) == 0)
          {
            v46 = [v43 UIBackgroundModes];
            v47 = _PSGLoggingFacility();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = [v43 applicationIdentifier];
              v49 = [v46 componentsJoinedByString:@","];
              *(_DWORD *)buf = 138412546;
              v123 = v48;
              __int16 v124 = 2112;
              v125 = v49;
              _os_log_impl(&dword_23D28D000, v47, OS_LOG_TYPE_DEFAULT, "############## Checking duet app: %@ with modes: %@", buf, 0x16u);
            }
            v50 = [v43 bundleIdentifier];
            char v51 = [v50 isEqualToString:@"com.apple.webapp"];

            if (v51) {
              goto LABEL_36;
            }
            long long v114 = 0u;
            long long v115 = 0u;
            long long v112 = 0u;
            long long v113 = 0u;
            id v52 = v46;
            uint64_t v53 = [v52 countByEnumeratingWithState:&v112 objects:v121 count:16];
            if (!v53) {
              goto LABEL_35;
            }
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v113;
LABEL_22:
            uint64_t v56 = 0;
            while (1)
            {
              if (*(void *)v113 != v55) {
                objc_enumerationMutation(v52);
              }
              v57 = *(void **)(*((void *)&v112 + 1) + 8 * v56);
              if (([v57 isEqualToString:@"remote-notification"] & 1) != 0
                || ([v57 isEqualToString:@"newsstand-content"] & 1) != 0
                || ([v57 isEqualToString:@"fetch"] & 1) != 0
                || [v57 isEqualToString:@"processing"])
              {
                break;
              }
              if (v54 == ++v56)
              {
                uint64_t v54 = [v52 countByEnumeratingWithState:&v112 objects:v121 count:16];
                id v38 = v104;
                if (!v54) {
                  goto LABEL_35;
                }
                goto LABEL_22;
              }
            }
            v58 = _PSGLoggingFacility();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              v59 = [v43 applicationIdentifier];
              *(_DWORD *)buf = 138412546;
              v123 = v59;
              __int16 v124 = 2112;
              v125 = v57;
              _os_log_impl(&dword_23D28D000, v58, OS_LOG_TYPE_DEFAULT, "############## Adding %@ with mode %@", buf, 0x16u);
            }
            v60 = [v43 applicationIdentifier];
            [v100 addObject:v60];

            id v38 = v104;
LABEL_35:

LABEL_36:
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v116 objects:v126 count:16];
      }
      while (v40);
    }

    v106 = [MEMORY[0x263EFF980] array];
    v61 = [MEMORY[0x263F53C50] sharedConnection];
    v62 = [v61 effectiveBlacklistedAppBundleIDs];

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v63 = v100;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v108 objects:v120 count:16];
    if (!v64) {
      goto LABEL_71;
    }
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v109;
    uint64_t v67 = 4;
    if (v103) {
      uint64_t v67 = 6;
    }
    uint64_t v101 = v67;
    uint64_t v93 = *MEMORY[0x263F537A0];
    uint64_t v98 = *MEMORY[0x263F601A8];
    uint64_t v97 = *MEMORY[0x263F60188];
    uint64_t v96 = *MEMORY[0x263EFFB68];
LABEL_43:
    uint64_t v68 = 0;
    while (1)
    {
      if (*(void *)v109 != v66) {
        objc_enumerationMutation(v63);
      }
      uint64_t v69 = *(void *)(*((void *)&v108 + 1) + 8 * v68);
      if ([v62 containsObject:v69]) {
        goto LABEL_69;
      }
      v70 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v69];
      v71 = [v70 localizedName];

      v72 = [(PSGAutomaticContentDownloadController *)v107 whitelist];
      v73 = [v72 objectForKey:v69];
      if (v73) {
        BOOL v74 = 1;
      }
      else {
        BOOL v74 = v71 == 0;
      }
      if (v74)
      {
      }
      else
      {
        uint64_t v75 = [v71 length];

        if (!v75) {
          goto LABEL_68;
        }
        if (v103) {
          v76 = sel_setApplicationEnabled_forSpecifier_;
        }
        else {
          v76 = 0;
        }
        if (v103) {
          v77 = sel_applicationEnabled_;
        }
        else {
          v77 = 0;
        }
        v78 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v71 target:v107 set:v76 get:v77 detail:0 cell:v101 edit:0];
        v72 = v78;
        if (v102)
        {
          [v78 setProperty:&unk_26F103A60 forKey:v99];
        }
        else
        {
          v79 = NSNumber;
          if (v95) {
            uint64_t v80 = [v94 isBoolSettingLockedDownByRestrictions:v93] ^ 1;
          }
          else {
            uint64_t v80 = 0;
          }
          v81 = [v79 numberWithBool:v80];
          [v72 setProperty:v81 forKey:v99];
        }
        v82 = [NSNumber numberWithBool:1];
        [v72 setProperty:v82 forKey:v98];

        [v72 setProperty:v69 forKey:v97];
        [v72 setProperty:v69 forKey:v96];
        [v106 addObject:v72];
      }

LABEL_68:
LABEL_69:
      if (v65 == ++v68)
      {
        uint64_t v65 = [v63 countByEnumeratingWithState:&v108 objects:v120 count:16];
        if (!v65)
        {
LABEL_71:

          CFPreferencesSetAppValue(@"KeepAppsUpToDateAppList", v107->_applicationStates, @"com.apple.mt");
          CFPreferencesAppSynchronize(@"com.apple.mt");
          v83 = [MEMORY[0x263EFF980] array];
          v84 = [v106 sortedArrayUsingComparator:&__block_literal_global_0];
          [v83 addObjectsFromArray:v84];

          v85 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
          [v92 addObject:v85];
          [v92 addObjectsFromArray:v83];
          v86 = *(Class *)((char *)&v107->super.super.super.super.super.isa + v90);
          *(Class *)((char *)&v107->super.super.super.super.super.isa + v90) = (Class)v92;

          BOOL v3 = *(Class *)((char *)&v107->super.super.super.super.super.isa + v90);
          break;
        }
        goto LABEL_43;
      }
    }
  }
  return v3;
}

uint64_t __51__PSGAutomaticContentDownloadController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 name];
  pid_t v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)setBackgroundRefreshState:(id)a3 withSpecifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([a4 cellType] == 6)
  {
    uint64_t v7 = [MEMORY[0x263F53C50] sharedConnection];
    objc_msgSend(v7, "setAutomaticAppUpdatesAllowed:", objc_msgSend(v6, "BOOLValue"));

    goto LABEL_11;
  }
  uint64_t v8 = [v6 unsignedIntegerValue];
  if (v8 == 2)
  {
    v9 = [MEMORY[0x263F53C50] sharedConnection];
    BOOL v10 = v9;
    uint64_t v11 = 1;
  }
  else
  {
    if (v8 == 1)
    {
      id v13 = [MEMORY[0x263F53C50] sharedConnection];
      [v13 setAutomaticAppUpdatesAllowed:1];

      id v12 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
      goto LABEL_10;
    }
    if (v8) {
      goto LABEL_11;
    }
    v9 = [MEMORY[0x263F53C50] sharedConnection];
    BOOL v10 = v9;
    uint64_t v11 = 0;
  }
  [v9 setAutomaticAppUpdatesAllowed:v11];

  id v12 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
LABEL_10:
  CFPreferencesSetAppValue(@"WiFiOnly", *v12, @"com.apple.mt");
LABEL_11:
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kKeepAppsUpToDateEnabledChangedNotification", 0, 0, 1u);
  v15 = _PSGLoggingFacility();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = [v6 BOOLValue];
    _os_log_impl(&dword_23D28D000, v15, OS_LOG_TYPE_DEFAULT, "########### [[MCProfileConnection sharedConnection] setAutomaticAppUpdatesAllowed:[value BOOLValue]] %d", (uint8_t *)v16, 8u);
  }

  [(PSGAutomaticContentDownloadController *)self reloadSpecifiers];
}

- (id)backgroundRefreshState:(id)a3
{
  uint64_t v3 = [a3 cellType];
  id v4 = [MEMORY[0x263F08AB0] processInfo];
  int v5 = [v4 isLowPowerModeEnabled];

  if (v5
    || ([MEMORY[0x263F53C50] sharedConnection],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isAutomaticAppUpdatesAllowed],
        v6,
        !v7))
  {
    v9 = &unk_26F103A18;
    if (v3 == 6) {
      v9 = (void *)MEMORY[0x263EFFA80];
    }
    id v8 = v9;
  }
  else if (v3 == 6)
  {
    id v8 = (id)MEMORY[0x263EFFA88];
  }
  else
  {
    Boolean keyExistsAndHasValidFormat = 1;
    if (CFPreferencesGetAppBooleanValue(@"WiFiOnly", @"com.apple.mt", &keyExistsAndHasValidFormat)) {
      id v8 = &unk_26F103A30;
    }
    else {
      id v8 = &unk_26F103A48;
    }
  }
  return v8;
}

- (void)setApplicationEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  applicationStates = self->_applicationStates;
  uint64_t v7 = *MEMORY[0x263EFFB68];
  id v8 = a3;
  v9 = [a4 propertyForKey:v7];
  [(NSMutableDictionary *)applicationStates setObject:v8 forKey:v9];

  BOOL v10 = _PSGLoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = self->_applicationStates;
    int v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_23D28D000, v10, OS_LOG_TYPE_DEFAULT, "########### _applicationStates %@", (uint8_t *)&v13, 0xCu);
  }

  CFPreferencesSetAppValue(@"KeepAppsUpToDateAppList", self->_applicationStates, @"com.apple.mt");
  CFPreferencesAppSynchronize(@"com.apple.mt");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kKeepAppsUpToDateEnabledChangedNotification", 0, 0, 1u);
}

- (id)applicationEnabled:(id)a3
{
  applicationStates = self->_applicationStates;
  id v4 = [a3 propertyForKey:*MEMORY[0x263EFFB68]];
  int v5 = [(NSMutableDictionary *)applicationStates objectForKey:v4];

  if (!v5)
  {
    int v5 = [NSNumber numberWithInteger:1];
  }
  return v5;
}

- (NSMutableArray)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
}

- (NSMutableDictionary)applicationStates
{
  return self->_applicationStates;
}

- (void)setApplicationStates:(id)a3
{
}

- (OS_nw_path_evaluator)defaultPathEvaluator
{
  return self->_defaultPathEvaluator;
}

- (void)setDefaultPathEvaluator:(id)a3
{
}

- (BOOL)inLowDataMode
{
  return self->_inLowDataMode;
}

- (void)setInLowDataMode:(BOOL)a3
{
  self->_inLowDataMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPathEvaluator, 0);
  objc_storeStrong((id *)&self->_applicationStates, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong(&self->_settingsChangedObserver, 0);
}

@end