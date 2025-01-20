@interface PUIPrivacyController
+ (id)BOOLeanCapabilitiesToTest;
- (BOOL)launchHasCompleted;
- (BOOL)nudityModelSetupHasCompleted;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4;
- (BOOL)shouldReloadSpecifiersOnResume;
- (CoreTelephonyClient)_client;
- (NSArray)driverBundleControllers;
- (NSArray)driverSpecifiers;
- (NSNumber)_cachedLocationServicesAvailableValue;
- (NSURL)nudityDetectionURL;
- (PUIPrivacyController)init;
- (id)_accountStore;
- (id)capabilityEnabled:(id)a3;
- (id)developerModeEnabled:(id)a3;
- (id)driverKitSpecifiers;
- (id)getNudityDetectionEnabledValue;
- (id)locationServicesEnabled:(id)a3;
- (id)lockdownModeEnabled:(id)a3;
- (id)specifiers;
- (void)_nudityDetectionLinkClicked:(id)a3;
- (void)_updateNudityDetectionFooter:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshLocationServicesAvailable;
- (void)reloadSpecifiers;
- (void)setCapabilityEnabled:(id)a3 specifier:(id)a4;
- (void)setDriverBundleControllers:(id)a3;
- (void)setDriverSpecifiers:(id)a3;
- (void)setLaunchHasCompleted:(BOOL)a3;
- (void)setNudityDetectionURL:(id)a3;
- (void)setNudityModelSetupHasCompleted:(BOOL)a3;
- (void)set_cachedLocationServicesAvailableValue:(id)a3;
- (void)set_client:(id)a3;
- (void)updateLocationServicesVisibility;
- (void)updateNudityDetectionGroup:(id)a3;
- (void)updateSecurityGroup;
@end

@implementation PUIPrivacyController

- (PUIPrivacyController)init
{
  v12.receiver = self;
  v12.super_class = (Class)PUIPrivacyController;
  v2 = [(PUIPrivacyController *)&v12 init];
  if (v2)
  {
    v3 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x1E4F23A80]);
    client = v2->__client;
    v2->__client = v3;

    [(CoreTelephonyClient *)v2->__client setDelegate:v2];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2("com.apple.PrivacySettingsUI.ssq", v5, 0);
    securitySettingsQueue = v2->securitySettingsQueue;
    v2->securitySettingsQueue = (OS_dispatch_queue *)v6;

    v2->profileInstalledToken = 0;
    v2->profileUninstalledToken = 0;
    v8 = v2->securitySettingsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__PUIPrivacyController_init__block_invoke;
    block[3] = &unk_1E6E9C758;
    v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

void __28__PUIPrivacyController_init__block_invoke(uint64_t a1)
{
  [getNudityDetectionPreferencesHelperClass() initializeNudityDetection];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PUIPrivacyController_init__block_invoke_2;
  block[3] = &unk_1E6E9C758;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __28__PUIPrivacyController_init__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNudityModelSetupHasCompleted:1];
  if ([getNudityDetectionPreferencesHelperClass() nudityDetectionFeatureEnabled])
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:*(void *)(a1 + 32) selector:sel_updateNudityDetectionGroup_ name:@"CommunicationSafetySettingsEffectiveStoreChanged" object:0];
  }
  int v3 = [*(id *)(a1 + 32) launchHasCompleted];
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [v4 reloadSpecifiers];
    v5 = *(void **)(a1 + 32);
    return [v5 handlePendingURL];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return [v4 addObserver:v7 forKeyPath:@"launchHasCompleted" options:0 context:0];
  }
}

- (void)dealloc
{
  int profileInstalledToken = self->profileInstalledToken;
  if (profileInstalledToken) {
    notify_cancel(profileInstalledToken);
  }
  int profileUninstalledToken = self->profileUninstalledToken;
  if (profileUninstalledToken) {
    notify_cancel(profileUninstalledToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)PUIPrivacyController;
  [(PUIPrivacyController *)&v5 dealloc];
}

+ (id)BOOLeanCapabilitiesToTest
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"launchHasCompleted", a4, a5, a6)
    && [(PUIPrivacyController *)self nudityModelSetupHasCompleted])
  {
    [(PUIPrivacyController *)self removeObserver:self forKeyPath:@"launchHasCompleted"];
    [(PUIPrivacyController *)self reloadSpecifiers];
    [(PUIPrivacyController *)self handlePendingURL];
  }
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E4F179C8]);
    objc_super v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (id)driverKitSpecifiers
{
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUIPrivacyController *)self driverBundleControllers];
  if (v3
    && (v4 = (void *)v3,
        [(PUIPrivacyController *)self driverBundleControllers],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    uint64_t v7 = [(PUIPrivacyController *)self driverBundleControllers];
    v8 = [v7 firstObject];

    v9 = [(PUIPrivacyController *)self specifier];
    v10 = [v8 specifiersWithSpecifier:v9];
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F93090];
    v23[0] = *MEMORY[0x1E4F93098];
    v23[1] = v11;
    v24[0] = @"DriverKitSettings";
    v24[1] = MEMORY[0x1E4F1CC28];
    objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v20 = v12;
    v21 = @"items";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v22 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v15 = [(PUIPrivacyController *)self specifier];
    v16 = [(PUIPrivacyController *)self bundle];
    id v19 = 0;
    v10 = SpecifiersFromPlist();
    id v17 = v19;

    -[PUIPrivacyController setDriverBundleControllers:](self, "setDriverBundleControllers:", v17, &v19);
  }
  return v10;
}

- (void)_updateNudityDetectionFooter:(id)a3
{
  id v24 = a3;
  v4 = [getNudityDetectionPreferencesHelperClass() mainNudityDetectionFooterText];
  objc_super v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\[(.+)\\]\\((.+)\\)" options:0 error:0];
  uint64_t v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = [v6 rangeAtIndex:2];
    uint64_t v11 = objc_msgSend(v4, "substringWithRange:", v9, v10);
    objc_super v12 = [v8 URLWithString:v11];
    [(PUIPrivacyController *)self setNudityDetectionURL:v12];

    uint64_t v13 = [v7 rangeAtIndex:1];
    v15 = objc_msgSend(v4, "substringWithRange:", v13, v14);
    uint64_t v16 = [v7 range];
    uint64_t v18 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v16, v17, v15);

    v4 = (void *)v18;
  }
  else
  {
    v15 = 0;
  }
  id v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  [v24 setProperty:v20 forKey:*MEMORY[0x1E4F93140]];

  [v24 setProperty:v4 forKey:*MEMORY[0x1E4F93160]];
  if (v15)
  {
    v26.location = [v4 rangeOfString:v15];
    v21 = NSStringFromRange(v26);
    [v24 setProperty:v21 forKey:*MEMORY[0x1E4F93150]];

    v22 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [v24 setProperty:v22 forKey:*MEMORY[0x1E4F93158]];

    v23 = NSStringFromSelector(sel__nudityDetectionLinkClicked_);
    [v24 setProperty:v23 forKey:*MEMORY[0x1E4F93148]];
  }
}

- (void)updateNudityDetectionGroup:(id)a3
{
  if ([getNudityDetectionPreferencesHelperClass() nudityDetectionFeatureEnabled])
  {
    id v6 = [(PUIPrivacyController *)self specifierForID:@"NUDITY_DETECTION_GROUP"];
    [(PUIPrivacyController *)self _updateNudityDetectionFooter:v6];
    v4 = [(PUIPrivacyController *)self specifierForID:@"NUDITY_DETECTION"];
    objc_super v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionRowEnabled"));
    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F93130]];

    [(PUIPrivacyController *)self reloadSpecifierID:@"NUDITY_DETECTION_GROUP"];
    [(PUIPrivacyController *)self reloadSpecifierID:@"NUDITY_DETECTION"];
  }
}

- (void)updateSecurityGroup
{
  objc_initWeak(&location, self);
  if (!self->profileInstalledToken)
  {
    securitySettingsQueue = self->securitySettingsQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__PUIPrivacyController_updateSecurityGroup__block_invoke;
    handler[3] = &unk_1E6E9C9E0;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("MISProvisioningProfileInstalled", &self->profileInstalledToken, securitySettingsQueue, handler);
    objc_destroyWeak(&v11);
  }
  if (!self->profileUninstalledToken)
  {
    v4 = self->securitySettingsQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__PUIPrivacyController_updateSecurityGroup__block_invoke_2;
    v8[3] = &unk_1E6E9C9E0;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch("MISProvisioningProfileRemoved", &self->profileUninstalledToken, v4, v8);
    objc_destroyWeak(&v9);
  }
  objc_super v5 = self->securitySettingsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3;
  block[3] = &unk_1E6E9CB50;
  objc_copyWeak(&v7, &location);
  void block[4] = self;
  dispatch_async(v5, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __43__PUIPrivacyController_updateSecurityGroup__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSecurityGroup];
}

void __43__PUIPrivacyController_updateSecurityGroup__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSecurityGroup];
}

void __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAMFIShouldShowDeveloperModeSettingsSymbolLoc_ptr;
  v20 = getAMFIShouldShowDeveloperModeSettingsSymbolLoc_ptr;
  if (!getAMFIShouldShowDeveloperModeSettingsSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAMFIShouldShowDeveloperModeSettingsSymbolLoc_block_invoke;
    v22 = &unk_1E6E9C7F8;
    v23 = &v17;
    uint64_t v3 = (void *)AppleMobileFileIntegrityLibrary();
    v4 = dlsym(v3, "AMFIShouldShowDeveloperModeSettings");
    *(void *)(v23[1] + 24) = v4;
    getAMFIShouldShowDeveloperModeSettingsSymbolLoc_ptr = *(_UNKNOWN **)(v23[1] + 24);
    v2 = (uint64_t (*)(void))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v2)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    __break(1u);
  }
  int v5 = v2();
  id v6 = _PUILoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v5) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[PUIPrivacyController updateSecurityGroup]_block_invoke_3";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "%s: shouldShowDeveloperMode: %@", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = [WeakRetained driverKitSpecifiers];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PUIPrivacyController_updateSecurityGroup__block_invoke_78;
    block[3] = &unk_1E6E9DA68;
    void block[4] = v9;
    id v13 = v10;
    id v11 = v10;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    uint64_t v14 = *(void *)(a1 + 32);
    char v16 = v5;
    dispatch_sync(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v15);
  }
}

void __43__PUIPrivacyController_updateSecurityGroup__block_invoke_78(uint64_t a1)
{
  id v28 = [*(id *)(a1 + 32) driverSpecifiers];
  [*(id *)(a1 + 32) setDriverSpecifiers:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 40) count];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = [WeakRetained driverSpecifiers];
  uint64_t v5 = [v4 count];

  id v6 = *(void **)(a1 + 40);
  if (v6) {
    BOOL v7 = [v6 count] != 0;
  }
  else {
    BOOL v7 = 0;
  }
  unint64_t v8 = 0x1E4F92000uLL;
  if (_os_feature_enabled_impl()
    && +[PUILockdownModeUtilities getCanShowLockdownMode])
  {
    id v9 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v10 = PUI_LocalizedStringForLockdownMode(@"LOCKDOWN_MODE");
    id v11 = [v9 preferenceSpecifierNamed:v10 target:*(void *)(a1 + 48) set:0 get:sel_lockdownModeEnabled_ detail:objc_opt_class() cell:2 edit:0];

    [v11 setIdentifier:@"LOCKDOWN_MODE"];
  }
  else
  {
    id v11 = 0;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    objc_super v12 = PSBundlePathForPreferenceBundle();
    id v13 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v14 = SFRuntimeAbsoluteFilePathForPath();
    id v15 = [v13 bundleWithPath:v14];

    uint64_t v16 = [v15 classNamed:@"DeveloperModeViewController"];
    uint64_t v17 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v18 = PUI_LocalizedStringForPrivacy(@"DEVELOPER_MODE");
    uint64_t v19 = [v17 preferenceSpecifierNamed:v18 target:*(void *)(a1 + 32) set:0 get:sel_developerModeEnabled_ detail:v16 cell:2 edit:0];

    unint64_t v8 = 0x1E4F92000;
    [v19 setIdentifier:@"DeveloperModeController"];
  }
  else
  {
    uint64_t v19 = 0;
  }
  [*(id *)(a1 + 32) removeSpecifierID:@"SECURITY_GROUP"];
  [*(id *)(a1 + 32) removeSpecifierID:@"LOCKDOWN_MODE"];
  [*(id *)(a1 + 32) removeSpecifierID:@"DeveloperModeController"];
  [*(id *)(a1 + 32) removeContiguousSpecifiers:v28 animated:v2 != v5];
  v20 = *(void **)(v8 + 3696);
  v21 = PUI_LocalizedStringForPrivacy(@"SECURITY_GROUP");
  v22 = [v20 groupSpecifierWithID:@"SECURITY_GROUP" name:v21];

  [*(id *)(a1 + 48) addSpecifier:v22];
  if (v19) {
    [*(id *)(a1 + 48) addSpecifier:v19];
  }
  if (v11) {
    [*(id *)(a1 + 48) addSpecifier:v11];
  }
  if (v7)
  {
    BOOL v23 = v2 != v5;
    uint64_t v24 = *(void **)(a1 + 48);
    v25 = [v24 driverSpecifiers];
    [v24 insertContiguousSpecifiers:v25 afterSpecifier:0 animated:v23];
  }
  NSRange v26 = [*(id *)(a1 + 48) specifierIDPendingPush];
  int v27 = [v26 isEqualToString:@"LOCKDOWN_MODE"];

  if (v27) {
    [*(id *)(a1 + 48) handlePendingURL];
  }
}

- (id)specifiers
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!v3)
  {
    uint64_t v105 = (int)*MEMORY[0x1E4F92F08];
    v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92FA0]) propertyForKey:*MEMORY[0x1E4F93240]];
    uint64_t v5 = [(PUIPrivacyController *)self loadSpecifiersFromPlistName:v4 target:self];

    if (objc_opt_class())
    {
      char v6 = [MEMORY[0x1E4F97A38] isSecureElementTCCServiceEligible];
      BOOL v7 = _PUILoggingFacility();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[PUIPrivacyController specifiers]";
          _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "%s: not removing SECURE_ELEMENT", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        if (v8)
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[PUIPrivacyController specifiers]";
          _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "%s: removing SECURE_ELEMENT", (uint8_t *)&buf, 0xCu);
        }

        BOOL v7 = [v5 specifierForID:@"SECURE_ELEMENT"];
        [v5 removeObject:v7];
      }

      char v9 = [MEMORY[0x1E4F97A38] isContactlessTCCServiceEligible];
      uint64_t v10 = _PUILoggingFacility();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[PUIPrivacyController specifiers]";
          _os_log_impl(&dword_1E4AD5000, v10, OS_LOG_TYPE_DEFAULT, "%s: not removing CONTACTLESS_NFC", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        if (v11)
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[PUIPrivacyController specifiers]";
          _os_log_impl(&dword_1E4AD5000, v10, OS_LOG_TYPE_DEFAULT, "%s: removing CONTACTLESS_NFC", (uint8_t *)&buf, 0xCu);
        }

        uint64_t v10 = [v5 specifierForID:@"CONTACTLESS_NFC"];
        [v5 removeObject:v10];
      }
    }
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      objc_super v12 = [v5 specifierForID:@"FOCUS"];
      BOOL v13 = v12 == 0;

      if (!v13)
      {
        uint64_t v14 = [v5 specifierForID:@"FOCUS"];
        [v5 removeObject:v14];
      }
    }
    id v15 = [(PUIPrivacyController *)self _cachedLocationServicesAvailableValue];
    BOOL v16 = v15 == 0;

    if (v16) {
      [(PUIPrivacyController *)self refreshLocationServicesAvailable];
    }
    uint64_t v17 = [(PUIPrivacyController *)self _cachedLocationServicesAvailableValue];
    char v18 = [v17 BOOLValue];

    uint64_t v19 = [v5 specifierForID:@"LOCATION"];
    locationSpecifier = self->_locationSpecifier;
    self->_locationSpecifier = v19;

    if ((v18 & 1) == 0) {
      [v5 removeObject:self->_locationSpecifier];
    }
    v21 = self->_locationSpecifier;
    v22 = PUI_LocalizedStringForPrivacy(@"LOCATION_SERVICES");
    [(PSSpecifier *)v21 setName:v22];

    v112 = [v5 specifierForID:@"HEALTH"];
    v110 = [v5 specifierForID:@"HEALTH_DATA"];
    *(void *)&long long v114 = 0;
    *((void *)&v114 + 1) = &v114;
    uint64_t v115 = 0x2050000000;
    BOOL v23 = (void *)getHKHealthStoreClass_softClass_0;
    uint64_t v116 = getHKHealthStoreClass_softClass_0;
    if (!getHKHealthStoreClass_softClass_0)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v118 = __getHKHealthStoreClass_block_invoke_0;
      v119 = &unk_1E6E9C7F8;
      v120 = (void **)&v114;
      __getHKHealthStoreClass_block_invoke_0((uint64_t)&buf);
      BOOL v23 = *(void **)(*((void *)&v114 + 1) + 24);
    }
    id v24 = v23;
    _Block_object_dispose(&v114, 8);
    if ([v24 isHealthDataAvailable])
    {
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.Health" allowPlaceholder:0 error:0];
      if (v25)
      {
        [v5 removeObject:v110];
      }
      else
      {
        [v5 removeObject:v112];
        id v26 = v110;

        v112 = v26;
      }
    }
    else
    {
      [v5 removeObject:v112];
      [v5 removeObject:v110];
    }
    int v27 = [v5 specifierForID:*MEMORY[0x1E4F932D0]];
    uint64_t v107 = *MEMORY[0x1E4F931D0];
    objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38]);
    uint64_t v106 = *MEMORY[0x1E4F931A0];
    objc_msgSend(v27, "setObject:forKeyedSubscript:", @"com.apple.graphic-icon.app-tracking-transparency");
    if (v27) {
      char v28 = 1;
    }
    else {
      char v28 = v18;
    }
    if ((v28 & 1) == 0)
    {
      v29 = [v5 specifierForID:@"LOCATION_TRACKERS_GROUP"];
      [v5 removeObject:v29];
    }
    v30 = [MEMORY[0x1E4FB16C8] currentDevice];
    int v31 = objc_msgSend(v30, "sf_isiPhone");

    if (v31)
    {
      v32 = (void *)MEMORY[0x1E4F92E70];
      v33 = PUI_LocalizedStringForAlmanac(@"RESEARCH");
      v34 = [v32 preferenceSpecifierNamed:v33 target:self set:0 get:0 detail:0 cell:2 edit:0];

      [v34 setIdentifier:@"ALMANAC"];
      [v34 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93090]];
      [v34 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93130]];
      [v34 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93068]];
      v35 = PSBundlePathForPreferenceBundle();
      [v34 setProperty:v35 forKey:*MEMORY[0x1E4F931B8]];

      [v34 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v107];
      [v34 setObject:@"com.apple.graphic-icon.research-sensor-and-usage-data" forKeyedSubscript:v106];
      [v34 setControllerLoadAction:NSSelectorFromString(&cfstr_Lazyloadbundle.isa)];
      objc_msgSend(v5, "ps_insertObject:afterObject:", v34, v112);
    }
    v111 = [v5 specifierForID:@"WILLOW"];
    v36 = [MEMORY[0x1E4FB16C8] currentDevice];
    int v37 = objc_msgSend(v36, "sf_isiPhone");
    if (v111) {
      int v38 = v37;
    }
    else {
      int v38 = 0;
    }

    if (v38)
    {
      v39 = (void *)MEMORY[0x1E4F92E70];
      v40 = PUI_LocalizedStringForPrivacy(@"WALLET");
      v41 = [v39 preferenceSpecifierNamed:v40 target:self set:0 get:0 detail:0 cell:2 edit:0];

      [v41 setIdentifier:@"WALLET"];
      [v41 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93090]];
      [v41 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93130]];
      v42 = PSBundlePathForPreferenceBundle();
      v43 = SFRuntimeAbsoluteFilePathForPath();
      [v41 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F931B8]];

      [v41 setControllerLoadAction:NSSelectorFromString(&cfstr_Lazyloadbundle.isa)];
      [v41 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v107];
      v44 = [MEMORY[0x1E4FB16C8] currentDevice];
      if ([v44 userInterfaceIdiom]) {
        v45 = @"com.apple.PassbookStub";
      }
      else {
        v45 = @"com.apple.Passbook";
      }
      [v41 setObject:v45 forKeyedSubscript:*MEMORY[0x1E4F931C0]];

      objc_msgSend(v5, "ps_insertObject:afterObject:", v41, v111);
    }
    v109 = [v5 specifierForID:@"PRIVACY_GROUP"];
    v46 = PUI_LocalizedStringForPrivacy(@"PRIVACY_CONTROLLER_FOOTER");
    uint64_t v47 = *MEMORY[0x1E4F93170];
    [v109 setProperty:v46 forKey:*MEMORY[0x1E4F93170]];

    v104 = [v5 specifierForID:@"AD_GROUP"];
    v108 = [v5 specifierForID:@"ADVERTISING"];
    [v108 setProperty:@"advertising" forKey:@"capability"];
    if ([MEMORY[0x1E4F22220] isActivityAvailable])
    {
      if ((PSIsInEDUMode() & 1) == 0)
      {
        v48 = [MEMORY[0x1E4FB16C8] currentDevice];
        char v49 = objc_msgSend(v48, "sf_inRetailKioskMode");

        if ((v49 & 1) == 0)
        {
          v50 = [v5 specifierForID:@"FILEACCESS"];
          if (v50)
          {
            v51 = (void *)MEMORY[0x1E4F92E70];
            v52 = PUI_LocalizedStringForPrivacy(@"MOTION");
            v53 = [v51 preferenceSpecifierNamed:v52 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

            [v53 setProperty:*MEMORY[0x1E4F932A8] forKey:*MEMORY[0x1E4F93188]];
            [v53 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v107];
            [v53 setObject:@"com.apple.graphic-icon.motion-and-fitness" forKeyedSubscript:v106];
            objc_msgSend(v5, "ps_insertObject:afterObject:", v53, v50);
          }
        }
      }
    }
    if ([(PUIPrivacyController *)self nudityModelSetupHasCompleted]
      && [getNudityDetectionPreferencesHelperClass() nudityDetectionFeatureEnabled])
    {
      v54 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"NUDITY_DETECTION_GROUP"];
      [(PUIPrivacyController *)self _updateNudityDetectionFooter:v54];
      v55 = PSBundlePathForPreferenceBundle();
      v56 = (void *)MEMORY[0x1E4F28B50];
      v57 = SFRuntimeAbsoluteFilePathForPath();
      v58 = [v56 bundleWithPath:v57];

      v59 = [getNudityDetectionPreferencesHelperClass() classForNudityDetectionSettings];
      uint64_t v60 = [v58 classNamed:v59];

      v61 = (void *)MEMORY[0x1E4F92E70];
      v62 = [getNudityDetectionPreferencesHelperClass() nudityDetectionRowLabel];
      v63 = [v61 preferenceSpecifierNamed:v62 target:self set:0 get:sel_getNudityDetectionEnabledValue detail:v60 cell:2 edit:0];

      [v63 setProperty:@"NUDITY_DETECTION" forKey:*MEMORY[0x1E4F93188]];
      [v63 setObject:NSClassFromString(&cfstr_Psmultilinetab.isa) forKeyedSubscript:*MEMORY[0x1E4F930A8]];
      v64 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionRowEnabled"));
      [v63 setObject:v64 forKeyedSubscript:*MEMORY[0x1E4F93130]];

      [v63 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v107];
      v65 = [getNudityDetectionPreferencesHelperClass() nudityDetectionRowIconID];
      [v63 setObject:v65 forKeyedSubscript:v106];

      v66 = [v5 specifierForID:@"PRIVACY_GROUP"];
      objc_msgSend(v5, "ps_addGroup:afterGroup:", v54, v66);

      v67 = [v5 specifierForID:@"NUDITY_DETECTION_GROUP"];
      objc_msgSend(v5, "ps_insertObject:afterObject:", v63, v67);
    }
    if (_os_feature_enabled_impl())
    {
      v68 = [MEMORY[0x1E4FB16C8] currentDevice];
      int v69 = objc_msgSend(v68, "sf_isiPhone");

      if (v69)
      {
        v70 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"SAFETY_CHECK_GROUP"];
        v71 = PUI_LocalizedStringForSafety(@"SAFETY_CHECK_FOOTER");
        [v70 setProperty:v71 forKey:v47];

        v72 = PSBundlePathForPreferenceBundle();
        v73 = (void *)MEMORY[0x1E4F28B50];
        v74 = SFRuntimeAbsoluteFilePathForPath();
        v75 = [v73 bundleWithPath:v74];

        uint64_t v76 = [v75 classNamed:@"DSSafetyCheckWelcomeController"];
        v77 = (void *)MEMORY[0x1E4F92E70];
        v78 = PUI_LocalizedStringForSafety(@"SAFETY_CHECK");
        v79 = [v77 preferenceSpecifierNamed:v78 target:self set:0 get:0 detail:v76 cell:2 edit:0];

        [v79 setProperty:@"SAFETY_CHECK" forKey:*MEMORY[0x1E4F93188]];
        [v79 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v107];
        [v79 setObject:@"com.apple.graphic-icon.safety-check" forKeyedSubscript:v106];
        v80 = [v5 specifierForID:@"PRIVACY_GROUP"];
        objc_msgSend(v5, "ps_addGroup:afterGroup:", v70, v80);

        v81 = [v5 specifierForID:@"SAFETY_CHECK_GROUP"];
        objc_msgSend(v5, "ps_insertObject:afterObject:", v79, v81);
      }
    }
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      int v82 = _os_feature_enabled_impl();
      v83 = @"RECORD_APP_ACTIVITY";
      if (v82) {
        v83 = @"APP_PRIVACY_REPORT";
      }
      v84 = (void *)MEMORY[0x1E4F92E70];
      v85 = v83;
      v86 = [v84 groupSpecifierWithID:@"PRIVACY_REPORT_GROUP"];
      [v5 addObject:v86];
      v87 = (void *)MEMORY[0x1E4F92E70];
      v88 = PUI_LocalizedStringForPrivacy(v85);

      v89 = [v87 preferenceSpecifierNamed:v88 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      [v89 setIdentifier:@"PRIVACY_REPORT"];
      [v89 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
      [v5 addObject:v89];
    }
    if (+[PUIDataAndSensorsController shouldShowDataAndSensors])
    {
      v90 = (void *)MEMORY[0x1E4F92E70];
      v91 = PUI_LocalizedStringForPrivacy(@"DATA_AND_SENSORS");
      v92 = [v90 preferenceSpecifierNamed:v91 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      [v92 setIdentifier:@"DATA_AND_SENSORS"];
      [v5 addObject:v92];
    }
    if (!_os_feature_enabled_impl()) {
      goto LABEL_73;
    }
    v93 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v94 = [v93 userInterfaceIdiom] == 1;

    if (v94) {
      goto LABEL_73;
    }
    v113 = 0;
    if (!MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v118 = __MomentsOnboardingAndSettingsLibraryCore_block_invoke;
      v119 = &__block_descriptor_40_e5_v8__0l;
      v120 = &v113;
      long long v114 = xmmword_1E6E9DAD0;
      uint64_t v115 = 0;
      MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
      v95 = v113;
      if (MomentsOnboardingAndSettingsLibraryCore_frameworkLibrary)
      {
        if (!v113) {
          goto LABEL_70;
        }
      }
      else
      {
        v103 = v113;
        v95 = (void *)abort_report_np();
        __break(1u);
      }
      free(v95);
    }
LABEL_70:
    v96 = objc_msgSend(v5, "specifierForID:", @"PASSKEYS", v103);
    if (v96)
    {
      v97 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"JOURNALING_SUGGESTIONS_GROUP"];
      [v97 setIdentifier:@"JOURNALING_SUGGESTIONS_GROUP"];
      objc_msgSend(v5, "ps_insertObject:afterObject:", v97, v96);
      v98 = (void *)MEMORY[0x1E4F92E70];
      v99 = PUI_LocalizedStringForPrivacy(@"JOURNALING_SUGGESTIONS");
      v100 = [v98 preferenceSpecifierNamed:v99 target:self set:0 get:0 detail:NSClassFromString(&cfstr_Mosuggestionsh.isa) cell:2 edit:0];

      [v100 setIdentifier:@"JOURNALING_SUGGESTIONS"];
      [v100 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
      [v100 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v107];
      [v100 setObject:@"com.apple.graphic-icon.journaling-suggestions" forKeyedSubscript:v106];
      objc_msgSend(v5, "ps_insertObject:afterObject:", v100, v97);
    }
LABEL_73:
    v101 = *(Class *)((char *)&self->super.super.super.super.super.isa + v105);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v105) = (Class)v5;

    [(PUIPrivacyController *)self updateSecurityGroup];
    [(PUIPrivacyController *)self setLaunchHasCompleted:1];

    uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v105);
  }
  return v3;
}

- (void)reloadSpecifiers
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1E4AD5000, v1, v2, "%{public}s: called off main thread with backtrace: %{public}@", v3, v4, v5, v6, 2u);
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4
{
  id v4 = a3;
  if ([v4 isEqualToString:@"LOCKDOWN_MODE"]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 hasPrefix:@"NUDITY_DETECTION"];
  }

  return v5;
}

- (void)setCapabilityEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v13 = [a4 propertyForKey:@"capability"];
  char v6 = [v5 BOOLValue];

  BOOL v7 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v7];
  int v9 = [v8 containsObject:v13];
  if (v6)
  {
    if (v9) {
      [v8 removeObject:v13];
    }
  }
  else if ((v9 & 1) == 0)
  {
    [v8 addObject:v13];
  }
  uint64_t v10 = [v8 count];
  if (v10 != [v7 count])
  {
    CFPreferencesSetAppValue(@"SBParentalControlsCapabilities", v8, @"com.apple.springboard");
    CFPreferencesAppSynchronize(@"com.apple.springboard");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.locationd/Restrictions", 0, 0, 1u);
    objc_super v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v12, @"com.apple.Preferences.ChangedRestrictionsEnabledStateNotification", 0, 0, 1u);
  }
}

- (id)capabilityEnabled:(id)a3
{
  id v3 = a3;
  id v4 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  id v5 = [v3 propertyForKey:@"capability"];

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  BOOL v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];

  return v7;
}

- (void)updateLocationServicesVisibility
{
  id v3 = [(PUIPrivacyController *)self _cachedLocationServicesAvailableValue];

  if (!v3) {
    [(PUIPrivacyController *)self refreshLocationServicesAvailable];
  }
  id v4 = [(PUIPrivacyController *)self _cachedLocationServicesAvailableValue];
  int v5 = [v4 BOOLValue];

  int v6 = [(PUIPrivacyController *)self containsSpecifier:self->_locationSpecifier];
  if (!v5 || (v6 & 1) != 0)
  {
    if (((v6 ^ 1 | v5) & 1) == 0)
    {
      locationSpecifier = self->_locationSpecifier;
      [(PUIPrivacyController *)self removeSpecifier:locationSpecifier];
    }
  }
  else
  {
    BOOL v7 = self->_locationSpecifier;
    [(PUIPrivacyController *)self insertSpecifier:v7 atIndex:1];
  }
}

- (id)locationServicesEnabled:(id)a3
{
  id v3 = (id)[getCLLocationManagerClass_1() sharedManager];
  if ([getCLLocationManagerClass_1() locationServicesEnabled:0]) {
    id v4 = @"On";
  }
  else {
    id v4 = @"Off";
  }
  return PUI_LocalizedStringForPrivacy(v4);
}

- (id)lockdownModeEnabled:(id)a3
{
  if (+[PUILockdownModeUtilities isLockdownModeEnabled])
  {
    id v3 = @"On";
  }
  else
  {
    id v3 = @"Off";
  }
  return PUI_LocalizedStringForPrivacy(v3);
}

- (id)developerModeEnabled:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v4 = (unsigned int (*)(void))getAMFIIsDeveloperModeEnabledSymbolLoc_ptr;
  uint64_t v14 = getAMFIIsDeveloperModeEnabledSymbolLoc_ptr;
  if (!getAMFIIsDeveloperModeEnabledSymbolLoc_ptr)
  {
    int v5 = (void *)AppleMobileFileIntegrityLibrary();
    v12[3] = (uint64_t)dlsym(v5, "AMFIIsDeveloperModeEnabled");
    getAMFIIsDeveloperModeEnabledSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    id v4 = (unsigned int (*)(void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
  {
    -[PUILockdownModeController getEligibleDevicesWithCompletion:]();
    uint64_t v10 = v9;
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v10);
  }
  if (v4()) {
    int v6 = @"On";
  }
  else {
    int v6 = @"Off";
  }
  BOOL v7 = PUI_LocalizedStringForPrivacy(v6);

  return v7;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (void)refreshLocationServicesAvailable
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1E4AD5000, v0, OS_LOG_TYPE_ERROR, "%s: Error retrieving subscription info: %{public}@.", (uint8_t *)v1, 0x16u);
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(PUIPrivacyController *)self set_cachedLocationServicesAvailableValue:0];
    [(PUIPrivacyController *)self updateLocationServicesVisibility];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__PUIPrivacyController_carrierBundleChange___block_invoke;
    v5[3] = &unk_1E6E9CBA0;
    v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __44__PUIPrivacyController_carrierBundleChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) carrierBundleChange:*(void *)(a1 + 40)];
}

- (id)getNudityDetectionEnabledValue
{
  id NudityDetectionPreferencesHelperClass = getNudityDetectionPreferencesHelperClass();
  return (id)[NudityDetectionPreferencesHelperClass nudityDetectionOnOffLabel];
}

- (void)_nudityDetectionLinkClicked:(id)a3
{
  if (self->_nudityDetectionURL)
  {
    objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 openSensitiveURL:self->_nudityDetectionURL withOptions:0];
  }
}

- (CoreTelephonyClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
}

- (NSNumber)_cachedLocationServicesAvailableValue
{
  return self->__cachedLocationServicesAvailableValue;
}

- (void)set_cachedLocationServicesAvailableValue:(id)a3
{
}

- (NSArray)driverBundleControllers
{
  return self->_driverBundleControllers;
}

- (void)setDriverBundleControllers:(id)a3
{
}

- (NSArray)driverSpecifiers
{
  return self->_driverSpecifiers;
}

- (void)setDriverSpecifiers:(id)a3
{
}

- (BOOL)launchHasCompleted
{
  return self->_launchHasCompleted;
}

- (void)setLaunchHasCompleted:(BOOL)a3
{
  self->_launchHasCompleted = a3;
}

- (NSURL)nudityDetectionURL
{
  return self->_nudityDetectionURL;
}

- (void)setNudityDetectionURL:(id)a3
{
}

- (BOOL)nudityModelSetupHasCompleted
{
  return self->_nudityModelSetupHasCompleted;
}

- (void)setNudityModelSetupHasCompleted:(BOOL)a3
{
  self->_nudityModelSetupHasCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nudityDetectionURL, 0);
  objc_storeStrong((id *)&self->_driverSpecifiers, 0);
  objc_storeStrong((id *)&self->_driverBundleControllers, 0);
  objc_storeStrong((id *)&self->__cachedLocationServicesAvailableValue, 0);
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_locationSpecifier, 0);
  objc_storeStrong((id *)&self->securitySettingsQueue, 0);
}

@end