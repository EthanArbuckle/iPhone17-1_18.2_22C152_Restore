@interface PSGGeneralController
+ (id)BOOLeanCapabilitiesToTest;
- (BOOL)_hasCarPlayContent;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)specifiersHaveLoaded;
- (CRCarPlayPreferences)carPreferences;
- (FLTopLevelViewModel)followUpModel;
- (NSUserDefaults)_gameControllerDefaults;
- (OS_dispatch_queue)loadingQueue;
- (PSGGeneralController)init;
- (PSSpecifier)gameControllersSpecifier;
- (PSSpecifier)matterSpecifier;
- (id)EDGEEnabled:(id)a3;
- (id)_createTVProviderSpecifiersIfNeeded;
- (id)_gameControllerDefaultsObservationToken;
- (id)sortDateTimeGroupIdentifiers:(id)a3;
- (id)sortDateTimeGroupWithSpecifiers:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_updateInteractivityForTVProviderIfNeeded;
- (void)dealloc;
- (void)delayedAsyncLoadSpecifiers;
- (void)enableEdge:(id)a3;
- (void)handleTVProviderStateDidChangeNotifications:(id)a3;
- (void)homeButtonCustomizeControllerDidFinish:(id)a3;
- (void)insertOrderedSpecifiers:(id)a3 atID:(id)a4 animated:(BOOL)a5;
- (void)launchHasCompleted:(id)a3;
- (void)loadHomeButtonSettings:(id)a3;
- (void)pairedVehiclesDidChange;
- (void)pointerDevicesDidChange;
- (void)profileNotification:(id)a3;
- (void)reloadAsyncSpecifiersWithCompletion:(id)a3;
- (void)reloadSpecifiers;
- (void)setCarPreferences:(id)a3;
- (void)setFollowUpModel:(id)a3;
- (void)setGameControllersSpecifier:(id)a3;
- (void)setLoadingQueue:(id)a3;
- (void)setMatterSpecifier:(id)a3;
- (void)setSpecifiersHaveLoaded:(BOOL)a3;
- (void)set_gameControllerDefaults:(id)a3;
- (void)set_gameControllerDefaultsObservationToken:(id)a3;
- (void)shutDown:(id)a3;
- (void)updateMatterWithCompletion:(id)a3;
- (void)updateSoftwareUpdateBadge;
- (void)updateTVProviderWithCompletion:(id)a3;
- (void)updateTrackpadWithCompletion:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PSGGeneralController

- (id)specifiers
{
  uint64_t v125 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_73;
  }
  v101 = [(PSGGeneralController *)self bundle];
  v5 = [MEMORY[0x263F82670] currentDevice];
  objc_msgSend(v5, "sf_isInternalInstall");

  id v6 = objc_alloc(MEMORY[0x263EFF9A0]);
  v7 = [v101 pathForResource:@"General" ofType:@"plist"];
  uint64_t v8 = [v6 initWithContentsOfFile:v7];

  id v110 = 0;
  id v9 = objc_alloc(MEMORY[0x263EFF980]);
  v10 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FD90]);
  v11 = (void *)[v9 initWithArray:*v10];
  id v109 = v11;
  v99 = (void *)v8;
  v12 = SpecifiersFromPlist();
  id v13 = v109;
  id v100 = v109;

  objc_storeStrong(v10, v13);
  -[PSGGeneralController setTitle:](self, "setTitle:", 0, &v109);
  [(PSGGeneralController *)self setSpecifierID:v110];
  if ([MEMORY[0x263F82438] isRunningInStoreDemoMode])
  {
    v14 = [v12 specifierForID:@"Reset"];
    [v12 removeObject:v14];
    v15 = [v12 specifierForID:@"SHUTDOWN_LABEL"];

    [v12 removeObject:v15];
  }
  v16 = [(PSGGeneralController *)self gameControllersSpecifier];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    v18 = [v12 specifierForID:@"GAME_CONTROLLER"];
    [(PSGGeneralController *)self setGameControllersSpecifier:v18];

    v19 = PSBundlePathForPreferenceBundle();
    v20 = [MEMORY[0x263F08850] defaultManager];
    v21 = SFRuntimeAbsoluteFilePathForPath();
    char v22 = [v20 fileExistsAtPath:v21];

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = PSBundlePathForPreferenceBundle();

      v19 = (void *)v23;
    }
    v24 = SFRuntimeAbsoluteFilePathForPath();
    v25 = [(PSGGeneralController *)self gameControllersSpecifier];
    [v25 setObject:v24 forKeyedSubscript:*MEMORY[0x263F60180]];
  }
  v26 = [(PSGGeneralController *)self _gameControllerDefaults];
  char v27 = [v26 BOOLForKey:@"showGCPrefsPane"];

  if ((v27 & 1) == 0)
  {
    v28 = [(PSGGeneralController *)self gameControllersSpecifier];
    BOOL v29 = v28 == 0;

    if (!v29)
    {
      v30 = [(PSGGeneralController *)self gameControllersSpecifier];
      [v12 removeObject:v30];
    }
  }
  if ((PSGetCapabilityBoolAnswer() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(@"force-international", @"com.apple.preferences", 0))
  {
    v31 = [v12 specifierForID:@"INTERNATIONAL"];
    [v12 removeObject:v31];
  }
  v32 = [v12 specifierForID:@"AIRDROP_LINK"];
  airDropSpecifier = self->_airDropSpecifier;
  self->_airDropSpecifier = v32;

  v34 = [MEMORY[0x263F53C50] sharedConnection];
  char v35 = [v34 isAirDropAllowed];

  if ((v35 & 1) == 0) {
    [v12 removeObject:self->_airDropSpecifier];
  }
  v36 = [(PSGGeneralController *)self carPreferences];
  BOOL v37 = v36 == 0;

  if (v37)
  {
    uint64_t v111 = 0;
    v112 = &v111;
    uint64_t v113 = 0x2050000000;
    v38 = (void *)getCRCarPlayPreferencesClass_softClass;
    uint64_t v114 = getCRCarPlayPreferencesClass_softClass;
    if (!getCRCarPlayPreferencesClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v122 = __getCRCarPlayPreferencesClass_block_invoke;
      v123 = &unk_264E8CD70;
      v124 = &v111;
      __getCRCarPlayPreferencesClass_block_invoke((uint64_t)&buf);
      v38 = (void *)v112[3];
    }
    v39 = v38;
    _Block_object_dispose(&v111, 8);
    id v40 = objc_alloc_init(v39);
    [v40 setPreferencesDelegate:self];
    [(PSGGeneralController *)self setCarPreferences:v40];
    v41 = [MEMORY[0x263F087C8] defaultCenter];
    [v41 addObserver:self selector:sel_pairedVehiclesDidChange name:@"CRPairedVehiclesDidChangeNotification" object:0];
  }
  if (![(PSGGeneralController *)self _hasCarPlayContent])
  {
    v42 = [v12 specifierForID:@"CARPLAY"];
    [v12 removeObject:v42];
  }
  v43 = [v12 specifierForID:@"SOFTWARE_UPDATE_LINK"];
  v44 = [(PSGGeneralController *)self loadingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__PSGGeneralController_specifiers__block_invoke;
  block[3] = &unk_264E8C9C8;
  id v98 = v43;
  id v107 = v98;
  v108 = self;
  dispatch_async(v44, block);

  v45 = [v12 specifierForID:@"STORAGE_MGMT"];
  if (v45 && _os_feature_enabled_impl())
  {
    v46 = PSBundlePathForPreferenceBundle();
    v47 = SFRuntimeAbsoluteFilePathForPath();
    [v45 setProperty:v47 forKey:*MEMORY[0x263F60180]];
  }
  if (!_os_feature_enabled_impl()
    || ([MEMORY[0x263F5C9F0] isPictureInPictureSupported] & 1) == 0)
  {
    v48 = [v12 specifierForID:@"PiP_SPEC"];
    [v12 removeObject:v48];
  }
  v49 = [MEMORY[0x263F82670] currentDevice];
  if (!objc_msgSend(v49, "sf_isiPad")) {
    goto LABEL_31;
  }
  int v50 = PSGetCapabilityBoolAnswer();

  if (v50)
  {
    v49 = [v12 specifierForID:@"SHOW_BATTERY_PERCENTAGE"];
    [v12 removeObject:v49];
LABEL_31:
  }
  if ((PSGetCapabilityBoolAnswer() & 1) == 0)
  {
    CFBooleanRef v51 = (const __CFBoolean *)CFPreferencesCopyAppValue(@"AllowTelephonyLoggingUI", @"com.apple.commcenter");
    CFBooleanRef v52 = v51;
    if (v51)
    {
      CFTypeID v53 = CFGetTypeID(v51);
      if (v53 == CFBooleanGetTypeID())
      {
        BOOL v54 = CFBooleanGetValue(v52) == 0;
        CFRelease(v52);
        if (!v54)
        {
          uint64_t v55 = *MEMORY[0x263F5FF68];
          v119[0] = *MEMORY[0x263F602A0];
          v119[1] = v55;
          v120[0] = @"PSLinkCell";
          v120[1] = @"EDGESettings";
          uint64_t v56 = *MEMORY[0x263EFFB38];
          uint64_t v57 = *MEMORY[0x263F60138];
          v119[2] = *MEMORY[0x263F5FF58];
          v119[3] = v57;
          v120[2] = v56;
          v120[3] = @"TELEPHONY_LOGS";
          v58 = [NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:4];
          v116 = v58;
          v117 = @"items";
          v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v116 count:1];
          v118 = v59;
          v60 = [NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
          v61 = SpecifiersFromPlist();

          v62 = objc_msgSend(v12, "specifierForID:", @"Reset", 0);
          objc_msgSend(v12, "ps_insertObjectsFromArray:afterObject:", v61, v62);
        }
      }
      else
      {
        CFRelease(v52);
      }
    }
  }
  v63 = [v12 specifierForID:@"Reset"];
  v64 = PSG_LocalizedStringForGeneral(@"TRANSFER_OR_RESET_TITLE");
  [v63 setName:v64];

  v65 = [MEMORY[0x263F82670] currentDevice];
  if ([v65 userInterfaceIdiom]) {
    v66 = @"com.apple.graphic-icon.transfer-or-reset-ipad";
  }
  else {
    v66 = @"com.apple.graphic-icon.transfer-or-reset-iphone";
  }
  [v63 setObject:v66 forKeyedSubscript:*MEMORY[0x263F60158]];

  uint64_t v67 = [v12 specifierForID:@"MATTER_ACCESSORIES"];
  [(PSGGeneralController *)self setMatterSpecifier:v67];

  v68 = [MEMORY[0x263EFFA40] standardUserDefaults];
  LOBYTE(v67) = [v68 BOOLForKey:@"PSGShouldShowMatter"];

  if ((v67 & 1) == 0)
  {
    v69 = [(PSGGeneralController *)self matterSpecifier];
    [v12 removeObject:v69];
  }
  if (objc_opt_class() && ([MEMORY[0x263F66028] isDefaultContactlessAppConfigurationEligible] & 1) == 0)
  {
    v70 = _PSGLoggingFacility();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[PSGGeneralController specifiers]";
      _os_log_impl(&dword_23D28D000, v70, OS_LOG_TYPE_DEFAULT, "%s: removing CONTACTLESS_NFC", (uint8_t *)&buf, 0xCu);
    }

    v71 = [v12 specifierForID:@"CONTACTLESS_NFC"];
    [v12 removeObject:v71];
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v72 = [v12 specifierForID:@"SAD_GROUP"];
    [v12 removeObject:v72];

    v73 = [v12 specifierForID:@"HEALTH_DATA"];
    [v12 removeObject:v73];

    v74 = [v12 specifierForID:@"WEB_BROWSING"];
    [v12 removeObject:v74];

    v75 = [v12 specifierForID:@"PHOTO_LIBRARY"];
    [v12 removeObject:v75];
  }
  v76 = [MEMORY[0x263F01880] defaultWorkspace];
  if ([v76 applicationIsInstalled:@"com.apple.Health"])
  {
    v77 = [MEMORY[0x263F53C50] sharedConnection];
    v78 = [v77 restrictedAppBundleIDs];
    char v79 = [v78 containsObject:@"com.apple.Health"];

    if (v79) {
      goto LABEL_54;
    }
    v76 = [v12 specifierForID:@"HEALTH_DATA"];
    [v12 removeObject:v76];
  }

LABEL_54:
  v80 = [MEMORY[0x263F01880] defaultWorkspace];
  int v81 = [v80 applicationIsInstalled:@"com.apple.mobileslideshow"];

  if (v81)
  {
    v82 = [v12 specifierForID:@"PHOTO_LIBRARY"];
    [v12 removeObject:v82];
  }
  v83 = [MEMORY[0x263F01880] defaultWorkspace];
  int v84 = [v83 applicationIsInstalled:@"com.apple.mobilesafari"];

  if (v84)
  {
    v85 = [v12 specifierForID:@"WEB_BROWSING"];
    [v12 removeObject:v85];
  }
  v86 = [v12 specifierForID:@"HEALTH_DATA"];
  if (!v86)
  {
    v86 = [v12 specifierForID:@"PHOTO_LIBRARY"];
    if (!v86)
    {
      v96 = [v12 specifierForID:@"WEB_BROWSING"];
      BOOL v97 = v96 == 0;

      if (!v97) {
        goto LABEL_61;
      }
      v86 = [v12 specifierForID:@"SAD_GROUP"];
      [v12 removeObject:v86];
    }
  }

LABEL_61:
  if (PSIsInEDUMode())
  {
    v87 = __34__PSGGeneralController_specifiers__block_invoke_344();
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    uint64_t v88 = [v87 countByEnumeratingWithState:&v102 objects:v115 count:16];
    if (v88)
    {
      uint64_t v89 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v88; ++i)
        {
          if (*(void *)v103 != v89) {
            objc_enumerationMutation(v87);
          }
          v91 = [v12 specifierForID:*(void *)(*((void *)&v102 + 1) + 8 * i)];
          if (v91) {
            [v12 removeObject:v91];
          }
        }
        uint64_t v88 = [v87 countByEnumeratingWithState:&v102 objects:v115 count:16];
      }
      while (v88);
    }
  }
  uint64_t v92 = [(PSGGeneralController *)self sortDateTimeGroupWithSpecifiers:v12];
  v93 = (void **)((char *)&self->super.super.super.super.super.isa + v3);
  v94 = *v93;
  *v93 = (void *)v92;

  v4 = *v93;
LABEL_73:
  return v4;
}

- (PSGGeneralController)init
{
  v12.receiver = self;
  v12.super_class = (Class)PSGGeneralController;
  v2 = [(PSGGeneralController *)&v12 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.GeneralSettingsUI.PSGGeneralController.loading", v3);
    [(PSGGeneralController *)v2 setLoadingQueue:v4];

    uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.GameController"];
    gameControllerDefaults = v2->__gameControllerDefaults;
    v2->__gameControllerDefaults = (NSUserDefaults *)v5;

    v7 = [(PSGGeneralController *)v2 _gameControllerDefaults];
    uint64_t v8 = [(PSGGeneralController *)v2 na_addNotificationBlockObserverForObject:v7 keyPath:@"showGCPrefsPane" options:1 usingBlock:&__block_literal_global_373];
    id gameControllerDefaultsObservationToken = v2->__gameControllerDefaultsObservationToken;
    v2->__id gameControllerDefaultsObservationToken = (id)v8;

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel_profileNotification_ name:@"PSProfileConnectionRestrictionChangedNotification" object:0];
    [v10 addObserver:v2 selector:sel_profileNotification_ name:@"PSProfileConnectionEffectiveSettingsChangedNotification" object:0];
    [v10 addObserver:v2 selector:sel_handleTVProviderStateDidChangeNotifications_ name:*MEMORY[0x263F1E430] object:0];
    [v10 addObserver:v2 selector:sel_handleTVProviderStateDidChangeNotifications_ name:*MEMORY[0x263F1E3F8] object:0];
    [v10 addObserver:v2 selector:sel_launchHasCompleted_ name:*MEMORY[0x263F60178] object:0];
    [v10 addObserver:v2 selector:sel_pointerDevicesDidChange name:PSGPointerDevicesDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [(PSGGeneralController *)self _gameControllerDefaultsObservationToken];
  [(PSGGeneralController *)self na_removeNotificationBlockObserver:v3];

  dispatch_queue_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.iapd.videoout.SettingsChanged", 0);
  id v6 = [MEMORY[0x263F087C8] defaultCenter];
  [v6 removeObserver:self];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x263F536E0] object:0];

  uint64_t v8 = [(PSGGeneralController *)self carPreferences];
  [v8 setPreferencesDelegate:0];

  [(PSGGeneralController *)self setCarPreferences:0];
  v9.receiver = self;
  v9.super_class = (Class)PSGGeneralController;
  [(PSGGeneralController *)&v9 dealloc];
}

- (CRCarPlayPreferences)carPreferences
{
  return self->_carPreferences;
}

- (void)reloadAsyncSpecifiersWithCompletion:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PSGGeneralController *)self setSpecifiersHaveLoaded:1];
  uint64_t v5 = _PSGSignpostLoggingFacility();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion");

  v7 = _PSGSignpostLoggingFacility();
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)long long buf = 138543618;
    char v35 = self;
    __int16 v36 = 2082;
    BOOL v37 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]";
    _os_signpost_emit_with_name_impl(&dword_23D28D000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion", "%{public}@: %{public}s", buf, 0x16u);
  }

  objc_super v9 = _PSGLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446210;
    char v35 = (PSGGeneralController *)"-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]";
    _os_log_impl(&dword_23D28D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: async reload started.", buf, 0xCu);
  }

  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke;
  v31[3] = &unk_264E8CC80;
  os_signpost_id_t v33 = v6;
  v11 = v10;
  v32 = v11;
  [(PSGGeneralController *)self updateTrackpadWithCompletion:v31];
  if ((PSIsInEDUMode() & 1) == 0)
  {
    dispatch_group_enter(v11);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_217;
    v28[3] = &unk_264E8CC80;
    os_signpost_id_t v30 = v6;
    BOOL v29 = v11;
    [(PSGGeneralController *)self updateMatterWithCompletion:v28];
  }
  if ((PSIsInEDUMode() & 1) == 0)
  {
    dispatch_group_enter(v11);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_218;
    v25[3] = &unk_264E8CC80;
    os_signpost_id_t v27 = v6;
    v26 = v11;
    [(PSGGeneralController *)self updateTVProviderWithCompletion:v25];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_219;
  block[3] = &unk_264E8D168;
  os_signpost_id_t v24 = v6;
  id v12 = v4;
  id v23 = v12;
  dispatch_group_notify(v11, MEMORY[0x263EF83A0], block);
  id v13 = [(PSGGeneralController *)self followUpModel];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x263F353B8]);
    v16 = [(PSGGeneralController *)self bundle];
    BOOL v17 = [v16 bundleIdentifier];
    v18 = (void *)[v15 initWithBundleIdentifier:v17 clientIdentifier:0];
    [(PSGGeneralController *)self setFollowUpModel:v18];

    objc_initWeak((id *)buf, self);
    v19 = [(PSGGeneralController *)self followUpModel];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_221;
    v20[3] = &unk_264E8D190;
    objc_copyWeak(&v21, (id *)buf);
    [v19 setItemChangeHandler:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)insertOrderedSpecifiers:(id)a3 atID:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__PSGGeneralController_insertOrderedSpecifiers_atID_animated___block_invoke;
  block[3] = &unk_264E8C8A0;
  void block[4] = self;
  if (insertOrderedSpecifiers_atID_animated__onceToken != -1) {
    dispatch_once(&insertOrderedSpecifiers_atID_animated__onceToken, block);
  }
  uint64_t v10 = [(id)insertOrderedSpecifiers_atID_animated__ordering indexOfObject:v9];
  v11 = objc_msgSend((id)insertOrderedSpecifiers_atID_animated__ordering, "subarrayWithRange:", 0, v10);
  id v12 = [v11 reverseObjectEnumerator];
  id v13 = [v12 allObjects];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v20 = -[PSGGeneralController specifierForID:](self, "specifierForID:", v19, (void)v21);

        if (v20)
        {
          [(PSGGeneralController *)self insertContiguousSpecifiers:v8 afterSpecifierID:v19 animated:v5];
          goto LABEL_13;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)updateSoftwareUpdateBadge
{
  id v3 = [(PSGGeneralController *)self specifierForID:@"SOFTWARE_UPDATE_LINK"];
  if (SUSUISettingsIsBadgedForSoftwareUpdate()) {
    [v3 setProperty:&unk_26F103CA0 forKey:*MEMORY[0x263F5FF18]];
  }
  else {
    [v3 removePropertyForKey:*MEMORY[0x263F5FF18]];
  }
  [(PSGGeneralController *)self reloadSpecifier:v3];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PSGGeneralController;
  [(PSGGeneralController *)&v3 viewDidLayoutSubviews];
  if ([(PSGGeneralController *)self specifiersHaveLoaded])
  {
    if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8])) {
      [(PSGGeneralController *)self updateSoftwareUpdateBadge];
    }
  }
}

void __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = _PSGLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_log_impl(&dword_23D28D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: updateTrackpadWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  objc_super v3 = _PSGSignpostLoggingFacility();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 40);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    int v6 = 136446210;
    v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_signpost_emit_with_name_impl(&dword_23D28D000, v4, OS_SIGNPOST_EVENT, v5, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion", "%{public}s: updateTrackpadWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53__PSGGeneralController_updateTrackpadWithCompletion___block_invoke(uint64_t a1)
{
  v2 = +[PSGMousePointerController sharedInstance];
  objc_super v3 = [v2 pointerDevices];
  BOOL v4 = [v3 count] != 0;

  os_signpost_id_t v5 = +[PSGMousePointerController sharedInstance];
  uint64_t v6 = [v5 hasMouse];

  v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v7 setBool:v4 forKey:@"HasPointerDevice"];

  uint64_t v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v8 setBool:v6 forKey:@"HasMouse"];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__PSGGeneralController_updateTrackpadWithCompletion___block_invoke_2;
  block[3] = &unk_264E8D2A8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  BOOL v12 = v4;
  char v13 = v6;
  id v10 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpModel, 0);
  objc_storeStrong(&self->__gameControllerDefaultsObservationToken, 0);
  objc_storeStrong((id *)&self->__gameControllerDefaults, 0);
  objc_storeStrong((id *)&self->_carPreferences, 0);
  objc_storeStrong((id *)&self->_gameControllersSpecifier, 0);
  objc_storeStrong((id *)&self->_matterSpecifier, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_fontSpecifiers, 0);
  objc_storeStrong((id *)&self->_fontBundleControllers, 0);
  objc_storeStrong((id *)&self->_profileSpecifiers, 0);
  objc_storeStrong((id *)&self->_profileBundleControllers, 0);
  objc_storeStrong((id *)&self->_vpnSpecifiers, 0);
  objc_storeStrong((id *)&self->_vpnBundleControllers, 0);
  objc_storeStrong((id *)&self->_airDropSpecifier, 0);
  objc_storeStrong((id *)&self->_usageTimer, 0);
}

- (void)setCarPreferences:(id)a3
{
}

- (void)delayedAsyncLoadSpecifiers
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[PSGGeneralController delayedAsyncLoadSpecifiers]";
  _os_log_error_impl(&dword_23D28D000, log, OS_LOG_TYPE_ERROR, "%s: expensive async load started during ppt launch test.", (uint8_t *)&v1, 0xCu);
}

uint64_t __53__PSGGeneralController_updateTrackpadWithCompletion___block_invoke_2(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v4 = [WeakRetained specifierForID:@"POINTERS"];

  if (v4)
  {
    BOOL v5 = *(unsigned char *)(a1 + 48) == 0;
    id v6 = objc_loadWeakRetained(v2);
    [v6 removeSpecifierID:@"POINTERS" animated:v5];
  }
  else
  {
    BOOL v5 = 1;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    v7 = (void *)MEMORY[0x263F5FC40];
    if (*(unsigned char *)(a1 + 49)) {
      uint64_t v8 = @"TRACKPAD_MOUSE";
    }
    else {
      uint64_t v8 = @"TRACKPAD";
    }
    id v9 = PSG_LocalizedStringForPointers(v8);
    id v10 = objc_loadWeakRetained(v2);
    id v11 = [v7 preferenceSpecifierNamed:v9 target:v10 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v11 setIdentifier:@"POINTERS"];
    [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
    [v11 setObject:@"com.apple.graphic-icon.trackpad-and-mouse" forKeyedSubscript:*MEMORY[0x263F60158]];
    id v12 = objc_loadWeakRetained(v2);
    v15[0] = v11;
    char v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [v12 insertOrderedSpecifiers:v13 atID:@"POINTERS" animated:v5];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)BOOLeanCapabilitiesToTest
{
  v4[8] = *MEMORY[0x263EF8340];
  v4[0] = @"DeviceSupportsCarIntegration";
  v4[1] = @"nVh/gwNpy7Jv1NOk00CMrw";
  v4[2] = @"fcc-logos-via-software";
  v4[3] = @"accessibility";
  v4[4] = @"international-settings";
  v4[5] = @"cellular-data";
  v4[6] = @"ringer-switch";
  v4[7] = @"Jq+xaurJgFzSwxOfTqtBGw";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:8];
  return v2;
}

void __62__PSGGeneralController_insertOrderedSpecifiers_atID_animated___block_invoke(uint64_t a1)
{
  v5[39] = *MEMORY[0x263EF8340];
  v5[0] = @"ABOUT_AND_SOFTWARE_UPDATE_GROUP";
  v5[1] = @"About";
  v5[2] = @"SOFTWARE_UPDATE_LINK";
  v5[3] = @"STORAGE_MGMT";
  v5[4] = @"COVERAGE_GROUP";
  v5[5] = @"COVERAGE";
  v5[6] = @"AIRDROP_GROUP";
  v5[7] = @"AIRDROP_LINK";
  v5[8] = @"CONTINUITY_SPEC";
  v5[9] = @"CONTACTLESS_NFC";
  v5[10] = @"PiP_SPEC";
  v5[11] = @"CARPLAY";
  v5[12] = @"MATTER_ACCESSORIES";
  v5[13] = @"NFC_LINK";
  v5[14] = @"HOME_BUTTON_GROUP";
  v5[15] = @"HOME_BUTTON";
  v5[16] = @"DATE_AND_TIME_GROUP";
  v5[17] = @"AUTOFILL";
  v5[18] = @"AUTO_CONTENT_DOWNLOAD";
  v5[19] = @"DATE_AND_TIME";
  v5[20] = @"DICTIONARY";
  v5[21] = @"FONT_SETTING";
  v5[22] = @"GAME_CONTROLLER";
  v5[23] = @"Keyboard";
  v5[24] = @"INTERNATIONAL";
  v5[25] = @"POINTERS";
  v5[26] = @"WINDOW_RESTORATION";
  v5[27] = @"TV_PROVIDER_GROUP";
  v5[28] = @"TV_PROVIDER";
  v5[29] = @"VPN_DEVICE_MANAGEMENT_GROUP";
  v5[30] = @"ManagedConfigurationList";
  v5[31] = @"RETAIL_KIOSK_MODE_SETTINGS_BUNDLE_GROUP";
  v5[32] = @"RETAIL_KIOSK_MODE_SETTINGS";
  v5[33] = @"LEGAL_AND_REGULATORY_GROUP";
  v5[34] = @"LEGAL_AND_REGULATORY";
  v5[35] = @"TRANSFER_ERASE_RESET_GROUP";
  v5[36] = @"Reset";
  v5[37] = @"SHUTDOWN_GROUP";
  v5[38] = @"SHUTDOWN_LABEL";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:39];
  uint64_t v3 = [*(id *)(a1 + 32) sortDateTimeGroupIdentifiers:v2];
  BOOL v4 = (void *)insertOrderedSpecifiers_atID_animated__ordering;
  insertOrderedSpecifiers_atID_animated__ordering = v3;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  v19[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19[0] = @"POINTERS";
  v19[1] = @"MATTER_ACCESSORIES";
  v19[2] = @"TV_PROVIDER";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v4, "isEqualToString:", v10, (void)v14))
        {
          id v11 = [(PSGGeneralController *)self specifierForID:v10];

          if (!v11)
          {
            BOOL v12 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

void __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_217(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = _PSGLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    uint64_t v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_log_impl(&dword_23D28D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: updateMattersWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v3 = _PSGSignpostLoggingFacility();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 40);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    int v6 = 136446210;
    uint64_t v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_signpost_emit_with_name_impl(&dword_23D28D000, v4, OS_SIGNPOST_EVENT, v5, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion", "%{public}s: updateMattersWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_218(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = _PSGLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    uint64_t v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_log_impl(&dword_23D28D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: updateTVProviderWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v3 = _PSGSignpostLoggingFacility();
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 40);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    int v6 = 136446210;
    uint64_t v7 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_signpost_emit_with_name_impl(&dword_23D28D000, v4, OS_SIGNPOST_EVENT, v5, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion", "%{public}s: updateTVProviderWithCompletion finished", (uint8_t *)&v6, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_219(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = _PSGSignpostLoggingFacility();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_23D28D000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PSGGeneralController.reloadAsyncSpecifiersWithCompletion", "", (uint8_t *)&v7, 2u);
  }

  os_signpost_id_t v5 = _PSGLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    uint64_t v8 = "-[PSGGeneralController reloadAsyncSpecifiersWithCompletion:]_block_invoke";
    _os_log_impl(&dword_23D28D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: async reload completed.", (uint8_t *)&v7, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __60__PSGGeneralController_reloadAsyncSpecifiersWithCompletion___block_invoke_221(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSoftwareUpdateBadge];
}

- (void)handleTVProviderStateDidChangeNotifications:(id)a3
{
}

- (void)updateTVProviderWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  os_signpost_id_t v5 = [(PSGGeneralController *)self loadingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke;
  block[3] = &unk_264E8D230;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F1E1A8] sharedAccountStore];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_2;
  v3[3] = &unk_264E8D208;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  [v2 fetchAccountsWithCompletionHandler:v3];

  objc_destroyWeak(&v5);
}

void __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F1E220] defaultCenter];
  uint64_t v3 = (void *)[v2 status];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_3;
  block[3] = &unk_264E8D1E0;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = v3;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v6);
}

void __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained beginUpdates];
  uint64_t v3 = [WeakRetained _createTVProviderSpecifiersIfNeeded];
  id v4 = v3;
  if (*(void *)(a1 + 48) == 1)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_4;
    v11[3] = &unk_264E8D1B8;
    v11[4] = WeakRetained;
    objc_msgSend(v3, "na_each:", v11);
  }
  else
  {
    id v5 = [v3 reverseObjectEnumerator];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_5;
    v10[3] = &unk_264E8D1B8;
    v10[4] = WeakRetained;
    objc_msgSend(v5, "na_each:", v10);
  }
  [WeakRetained endUpdates];
  id v6 = [WeakRetained specifierIDPendingPush];
  if ([@"TV_PROVIDER" isEqualToString:v6])
  {
    int v7 = [WeakRetained specifierIDPendingPush];
    id v8 = [WeakRetained specifierForID:v7];

    if (v8) {
      [WeakRetained handlePendingURL];
    }
  }
  else
  {
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

void __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 identifier];
  id v6 = [v4 specifierForID:v5];

  if (!v6)
  {
    int v7 = *(void **)(a1 + 32);
    v10[0] = v3;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    uint64_t v9 = [v3 identifier];
    [v7 insertOrderedSpecifiers:v8 atID:v9 animated:1];
  }
}

void __55__PSGGeneralController_updateTVProviderWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 removeSpecifierID:v3];
}

- (void)_updateInteractivityForTVProviderIfNeeded
{
  id v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) specifierForID:@"TV_PROVIDER"];

  if (v3)
  {
    id v17 = [(PSGGeneralController *)self specifierForID:@"TV_PROVIDER"];
    id v4 = [MEMORY[0x263F53C50] sharedConnection];
    int v5 = [v4 effectiveBoolValueForSetting:*MEMORY[0x263F53710]];

    id v6 = [MEMORY[0x263F53C50] sharedConnection];
    int v7 = [v6 effectiveBoolValueForSetting:*MEMORY[0x263F53A68]];

    BOOL v9 = v5 == 1 && v7 == 1;
    objc_opt_class();
    uint64_t v10 = *MEMORY[0x263F600A8];
    id v11 = [v17 objectForKeyedSubscript:*MEMORY[0x263F600A8]];
    if (objc_opt_isKindOfClass()) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = 0;
    }
    id v13 = v12;
    long long v14 = v13;
    if (!v13) {
      id v13 = (id)MEMORY[0x263EFFA88];
    }
    int v15 = [v13 BOOLValue];

    if (v9 != v15)
    {
      long long v16 = [NSNumber numberWithBool:v9];
      [v17 setObject:v16 forKeyedSubscript:v10];

      [(PSGGeneralController *)self reloadSpecifierID:@"TV_PROVIDER"];
    }
  }
}

- (void)updateMatterWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [(PSGGeneralController *)self loadingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__PSGGeneralController_updateMatterWithCompletion___block_invoke;
  block[3] = &unk_264E8D230;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__PSGGeneralController_updateMatterWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__PSGGeneralController_updateMatterWithCompletion___block_invoke_2;
  v2[3] = &unk_264E8D280;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  +[PSGMatterController shouldShowMatterControllerWithCompletion:v2];

  objc_destroyWeak(&v4);
}

void __51__PSGGeneralController_updateMatterWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__PSGGeneralController_updateMatterWithCompletion___block_invoke_3;
  block[3] = &unk_264E8D258;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v6);
}

void __51__PSGGeneralController_updateMatterWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (!WeakRetained)
  {
    char v7 = _PSGLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136446210;
      long long v21 = "-[PSGGeneralController updateMatterWithCompletion:]_block_invoke_3";
      _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Self deallocated during load", buf, 0xCu);
    }
    goto LABEL_9;
  }
  id v4 = [WeakRetained matterSpecifier];

  if (!v4)
  {
    char v7 = _PSGLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v3 matterSpecifier];
      *(_DWORD *)long long buf = 136446466;
      long long v21 = "-[PSGGeneralController updateMatterWithCompletion:]_block_invoke";
      __int16 v22 = 2112;
      long long v23 = v8;
      _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Not updating Matter because self.matterSpecifier=%@", buf, 0x16u);
    }
LABEL_9:

    goto LABEL_22;
  }
  id v5 = [v3 specifierForID:@"MATTER_ACCESSORIES"];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v9 = [v3 specifierForID:@"CARPLAY_MATTER_GROUP"];
    BOOL v6 = v9 != 0;
  }
  if (!*(unsigned char *)(a1 + 48) && v6)
  {
    uint64_t v10 = [v3 matterSpecifier];
    [v3 removeSpecifier:v10 animated:1];
LABEL_19:

    goto LABEL_20;
  }
  if (*(unsigned char *)(a1 + 48)) {
    char v11 = v6;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    uint64_t v10 = [v3 matterSpecifier];
    uint64_t v19 = v10;
    BOOL v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    id v13 = [v3 matterSpecifier];
    long long v14 = [v13 identifier];
    [v3 insertOrderedSpecifiers:v12 atID:v14 animated:1];

    goto LABEL_19;
  }
LABEL_20:
  int v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v15 setBool:*(unsigned __int8 *)(a1 + 48) forKey:@"PSGShouldShowMatter"];

  long long v16 = [v3 specifierIDPendingPush];
  id v17 = [v3 specifierForID:v16];

  if (v17) {
    [v3 handlePendingURL];
  }
LABEL_22:
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

- (void)updateTrackpadWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(PSGGeneralController *)self loadingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__PSGGeneralController_updateTrackpadWithCompletion___block_invoke;
  block[3] = &unk_264E8D230;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)sortDateTimeGroupIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [v3 indexOfObject:@"DATE_AND_TIME_GROUP"];
  uint64_t v6 = [v3 indexOfObject:@"TV_PROVIDER_GROUP"];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = v3;
  }
  else
  {
    uint64_t v8 = v5 + 1;
    id v9 = objc_msgSend(v3, "subarrayWithRange:", v8, v6 - v8);
    uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_9];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __53__PSGGeneralController_sortDateTimeGroupIdentifiers___block_invoke_2;
    v14[3] = &unk_264E8D2F0;
    id v11 = v4;
    id v15 = v11;
    uint64_t v16 = v8;
    [v10 enumerateObjectsUsingBlock:v14];
    id v12 = v11;
  }
  return v12;
}

uint64_t __53__PSGGeneralController_sortDateTimeGroupIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = PSG_LocalizedStringForGeneral(a2);
  uint64_t v6 = PSG_LocalizedStringForGeneral(v4);

  uint64_t v7 = [v5 localizedCompare:v6];
  return v7;
}

uint64_t __53__PSGGeneralController_sortDateTimeGroupIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 atIndexedSubscript:*(void *)(a1 + 40) + a3];
}

- (id)sortDateTimeGroupWithSpecifiers:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [v3 indexOfSpecifierWithID:@"DATE_AND_TIME_GROUP"];
  uint64_t v6 = [v3 indexOfNextGroupStartingAtIndex:v5];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v5 + 1;
    id v9 = objc_msgSend(v3, "subarrayWithRange:", v8, v6 - v8);
    uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_251];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    id v15 = __56__PSGGeneralController_sortDateTimeGroupWithSpecifiers___block_invoke_2;
    uint64_t v16 = &unk_264E8D318;
    id v17 = v4;
    uint64_t v18 = v8;
    [v10 enumerateObjectsUsingBlock:&v13];
  }
  id v11 = objc_msgSend(v4, "copy", v13, v14, v15, v16);

  return v11;
}

uint64_t __56__PSGGeneralController_sortDateTimeGroupWithSpecifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 identifier];
  uint64_t v6 = PSG_LocalizedStringForGeneral(v5);
  uint64_t v7 = [v4 identifier];

  uint64_t v8 = PSG_LocalizedStringForGeneral(v7);
  uint64_t v9 = [v6 localizedCompare:v8];

  return v9;
}

uint64_t __56__PSGGeneralController_sortDateTimeGroupWithSpecifiers___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 atIndexedSubscript:*(void *)(a1 + 40) + a3];
}

- (void)reloadSpecifiers
{
  v0 = [MEMORY[0x263F08B88] callStackSymbols];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_2(&dword_23D28D000, v1, v2, "%{public}s: called off main thread with backtrace: %{public}@", v3, v4, v5, v6, 2u);
}

- (void)pairedVehiclesDidChange
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = _PSGLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    uint64_t v5 = "-[PSGGeneralController pairedVehiclesDidChange]";
    _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: reloading specifiers because paired cars changed.", (uint8_t *)&v4, 0xCu);
  }

  [(PSGGeneralController *)self reloadSpecifiers];
}

void __34__PSGGeneralController_specifiers__block_invoke(uint64_t a1)
{
  char IsBadgedForSoftwareUpdate = SUSUISettingsIsBadgedForSoftwareUpdate();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__PSGGeneralController_specifiers__block_invoke_2;
  block[3] = &unk_264E8D340;
  char v8 = IsBadgedForSoftwareUpdate;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

char *__34__PSGGeneralController_specifiers__block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 setProperty:&unk_26F103CA0 forKey:*MEMORY[0x263F5FF18]];
  }
  else {
    [v3 removePropertyForKey:*MEMORY[0x263F5FF18]];
  }
  uint64_t result = *(char **)(a1 + 40);
  if (*(void *)&result[*MEMORY[0x263F5FDB8]])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    return (char *)[result reloadSpecifier:v5];
  }
  return result;
}

id __34__PSGGeneralController_specifiers__block_invoke_344()
{
  if (PSGTVProviderItemIdentifier_block_invoke_na_once_token_23 != -1) {
    dispatch_once(&PSGTVProviderItemIdentifier_block_invoke_na_once_token_23, &__block_literal_global_350);
  }
  v0 = (void *)PSGTVProviderItemIdentifier_block_invoke_na_once_object_23;
  return v0;
}

uint64_t __34__PSGGeneralController_specifiers__block_invoke_2_348()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"STORAGE_MGMT", @"COVERAGE_GROUP", @"COVERAGE", @"CONTINUITY_SPEC", @"CONTACTLESS_NFC", @"PiP_SPEC", @"CARPLAY", @"MATTER_ACCESSORIES", @"NFC_LINK", @"HOME_BUTTON_GROUP", @"HOME_BUTTON", @"WINDOW_RESTORATION", @"TV_PROVIDER_GROUP", @"TV_PROVIDER", @"RETAIL_KIOSK_MODE_SETTINGS_BUNDLE_GROUP", @"RETAIL_KIOSK_MODE_SETTINGS", @"TRANSFER_ERASE_RESET_GROUP",
    @"Reset",
    @"SHUTDOWN_GROUP",
    @"SHUTDOWN_LABEL",
  uint64_t v0 = 0);
  uint64_t v1 = PSGTVProviderItemIdentifier_block_invoke_na_once_object_23;
  PSGTVProviderItemIdentifier_block_invoke_na_once_object_23 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)loadHomeButtonSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 setDelegate:self];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F5FC20]) initWithRootViewController:v5];
  [v6 setSupportedInterfaceOrientations:2];
  [v6 setModalPresentationStyle:0];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v7 = (void *)getBFFStyleClass_softClass_0;
  uint64_t v14 = getBFFStyleClass_softClass_0;
  if (!getBFFStyleClass_softClass_0)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __getBFFStyleClass_block_invoke_0;
    v10[3] = &unk_264E8CD70;
    v10[4] = &v11;
    __getBFFStyleClass_block_invoke_0((uint64_t)v10);
    uint64_t v7 = (void *)v12[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);
  uint64_t v9 = [v8 sharedStyle];
  [v9 applyThemeToNavigationController:v6];

  [v5 setUsesDoneButton:1];
  [(PSGGeneralController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)homeButtonCustomizeControllerDidFinish:(id)a3
{
  id v10 = a3;
  id v4 = [(PSGGeneralController *)self presentedViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(PSGGeneralController *)self presentedViewController],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 topViewController],
        (id)objc_claimAutoreleasedReturnValue() != v10))
  {
    -[PSGGeneralController homeButtonCustomizeControllerDidFinish:]();
  }

  id v6 = [(PSGGeneralController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [(PSGGeneralController *)self presentedViewController];
    id v8 = [v7 topViewController];

    uint64_t v9 = v10;
    if (v8 != v10) {
      goto LABEL_8;
    }
    [(PSGGeneralController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
  }
  uint64_t v9 = v10;
LABEL_8:
}

- (BOOL)_hasCarPlayContent
{
  id v3 = [(PSGGeneralController *)self carPreferences];
  int v4 = [v3 isCarPlayAllowed];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(PSGGeneralController *)self carPreferences];
  char v6 = [v5 isWirelessCarPlayEnabled];

  if (v6) {
    return 1;
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v8 = (void *)getCRPairedVehicleManagerClass_softClass;
  uint64_t v17 = getCRPairedVehicleManagerClass_softClass;
  if (!getCRPairedVehicleManagerClass_softClass)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getCRPairedVehicleManagerClass_block_invoke;
    v13[3] = &unk_264E8CD70;
    v13[4] = &v14;
    __getCRPairedVehicleManagerClass_block_invoke((uint64_t)v13);
    id v8 = (void *)v15[3];
  }
  uint64_t v9 = v8;
  _Block_object_dispose(&v14, 8);
  id v10 = objc_alloc_init(v9);
  uint64_t v11 = [v10 allVehicles];
  BOOL v7 = [v11 count] != 0;

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PSGGeneralController;
  int v4 = [(PSGGeneralController *)&v6 tableView:a3 cellForRowAtIndexPath:a4];
  return v4;
}

- (void)profileNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  id v6[2] = __44__PSGGeneralController_profileNotification___block_invoke;
  v6[3] = &unk_264E8C9C8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __44__PSGGeneralController_profileNotification___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKey:*MEMORY[0x263F53B48]];

  LODWORD(v2) = [v3 intValue];
  if (v2 != getpid())
  {
    [*(id *)(a1 + 40) _updateInteractivityForTVProviderIfNeeded];
    [*(id *)(a1 + 40) reload];
  }
}

void __28__PSGGeneralController_init__block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 _gameControllerDefaults];
  int v4 = [v3 BOOLForKey:@"showGCPrefsPane"];

  id v5 = [v2 gameControllersSpecifier];

  if (v5)
  {
    objc_super v6 = [v2 specifierForID:@"GAME_CONTROLLER"];

    if (v4)
    {
      if (!v6)
      {
        id v7 = [v2 gameControllersSpecifier];
        v9[0] = v7;
        id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
        [v2 insertOrderedSpecifiers:v8 atID:@"GAME_CONTROLLER" animated:1];
      }
    }
    else if (v6)
    {
      [v2 removeSpecifierID:@"GAME_CONTROLLER" animated:1];
    }
  }
}

- (void)pointerDevicesDidChange
{
  id v3 = [MEMORY[0x263F5FBB8] sharedInstance];
  int v4 = [v3 launchHasCompleted];

  if (v4)
  {
    [(PSGGeneralController *)self updateTrackpadWithCompletion:0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)PSGGeneralController;
  [(PSGGeneralController *)&v13 viewDidAppear:a3];
  int v4 = [MEMORY[0x263F5FBB8] sharedInstance];
  int v5 = [v4 launchHasCompleted];

  if (v5)
  {
    objc_super v6 = _PSGLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v15 = "-[PSGGeneralController viewDidAppear:]";
      _os_log_impl(&dword_23D28D000, v6, OS_LOG_TYPE_DEFAULT, "%s: calling delayedAsyncLoadSpecifiers", buf, 0xCu);
    }

    [(PSGGeneralController *)self delayedAsyncLoadSpecifiers];
  }
  id v7 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General"];
  id v8 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v9 = [MEMORY[0x263EFF960] currentLocale];
  id v10 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v11 = [v10 bundleURL];
  id v12 = (void *)[v8 initWithKey:@"General" table:@"General" locale:v9 bundleURL:v11];

  [(PSGGeneralController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.gear" title:v12 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v7];
}

- (void)launchHasCompleted:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = _PSGLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[PSGGeneralController launchHasCompleted:]";
    _os_log_impl(&dword_23D28D000, v4, OS_LOG_TYPE_DEFAULT, "%s: calling delayedAsyncLoadSpecifiers", (uint8_t *)&v5, 0xCu);
  }

  [(PSGGeneralController *)self delayedAsyncLoadSpecifiers];
}

- (id)EDGEEnabled:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F5FC80], "sharedInstance", a3);
  uint64_t v4 = [v3 dataServiceID];

  int v5 = [MEMORY[0x263F5FC80] sharedInstance];
  objc_super v6 = [v5 interfaceConfigurationValueForKey:@"Available" serviceID:v4];

  return v6;
}

- (void)enableEdge:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F5FC80], "sharedInstance", a3);
  uint64_t v4 = [v3 dataServiceID];

  id v6 = [MEMORY[0x263F5FC80] sharedInstance];
  int v5 = [NSNumber numberWithInt:1];
  [v6 setInterfaceConfigurationValue:v5 forKey:@"Available" serviceID:v4];
}

- (void)shutDown:(id)a3
{
}

- (id)_createTVProviderSpecifiersIfNeeded
{
  if (PSIsInEDUMode())
  {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    uint64_t v5 = (int)*MEMORY[0x263F5FDB8];
    id v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) specifierForID:@"TV_PROVIDER_GROUP"];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"TV_PROVIDER_GROUP"];
    }
    [v4 addObject:v6];
    uint64_t v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + v5) specifierForID:@"TV_PROVIDER"];
    if (!v7)
    {
      id v8 = (void *)MEMORY[0x263F5FC40];
      uint64_t v9 = PSG_LocalizedStringForGeneral(@"TV_PROVIDER_LABEL");
      uint64_t v7 = [v8 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:1 edit:0];

      [v7 setIdentifier:@"TV_PROVIDER"];
      [v7 setControllerLoadAction:sel_lazyLoadBundle_];
      uint64_t v10 = MEMORY[0x263EFFA88];
      [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F601A8]];
      [v7 setObject:@"com.apple.graphic-icon.tv-provider" forKeyedSubscript:*MEMORY[0x263F60158]];
      [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x263F5FF58]];
      uint64_t v11 = PSBundlePathForPreferenceBundle();
      id v12 = SFRuntimeAbsoluteFilePathForPath();
      [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x263F60180]];

      objc_super v13 = [MEMORY[0x263F53C50] sharedConnection];
      LODWORD(v12) = [v13 effectiveBoolValueForSetting:*MEMORY[0x263F53710]];

      uint64_t v14 = [MEMORY[0x263F53C50] sharedConnection];
      int v15 = [v14 effectiveBoolValueForSetting:*MEMORY[0x263F53A68]];

      BOOL v17 = v12 == 1 && v15 == 1;
      uint64_t v18 = [NSNumber numberWithBool:v17];
      [v7 setObject:v18 forKeyedSubscript:*MEMORY[0x263F600A8]];
    }
    [v4 addObject:v7];
    id v3 = (void *)[v4 copy];
  }
  return v3;
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (void)setLoadingQueue:(id)a3
{
}

- (PSSpecifier)matterSpecifier
{
  return self->_matterSpecifier;
}

- (void)setMatterSpecifier:(id)a3
{
}

- (PSSpecifier)gameControllersSpecifier
{
  return self->_gameControllersSpecifier;
}

- (void)setGameControllersSpecifier:(id)a3
{
}

- (BOOL)specifiersHaveLoaded
{
  return self->_specifiersHaveLoaded;
}

- (void)setSpecifiersHaveLoaded:(BOOL)a3
{
  self->_specifiersHaveLoaded = a3;
}

- (NSUserDefaults)_gameControllerDefaults
{
  return self->__gameControllerDefaults;
}

- (void)set_gameControllerDefaults:(id)a3
{
}

- (id)_gameControllerDefaultsObservationToken
{
  return self->__gameControllerDefaultsObservationToken;
}

- (void)set_gameControllerDefaultsObservationToken:(id)a3
{
}

- (FLTopLevelViewModel)followUpModel
{
  return self->_followUpModel;
}

- (void)setFollowUpModel:(id)a3
{
}

- (void)homeButtonCustomizeControllerDidFinish:.cold.1()
{
  __assert_rtn("-[PSGGeneralController homeButtonCustomizeControllerDidFinish:]", "PSGGeneralController.m", 806, "[self.presentedViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController *)self.presentedViewController topViewController] == controller");
}

@end