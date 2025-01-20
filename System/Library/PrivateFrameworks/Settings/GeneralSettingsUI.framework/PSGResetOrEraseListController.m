@interface PSGResetOrEraseListController
+ (BOOL)isLargeTextEnabled;
+ (NSString)maximumSupportedContentSizeCategory;
- (BOOL)_networkConnectivityAvailable;
- (BOOL)isRatchetFeatureAvailableAndEnabled;
- (Class)tableViewClass;
- (CoreTelephonyClient)_client;
- (NSNumber)_cachedLocationServicesAvailableValue;
- (PSGResetOrEraseListController)init;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_resetWithMode:(int64_t)a3 andOptions:(id)a4 withSpecifier:(id)a5;
- (void)_showStockholmLocallyStoredValueOfflineWarningIfNeeded:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)configureSpin:(BOOL)a3 ofCellForSpecifier:(id)a4 setEnabled:(BOOL)a5;
- (void)confirmEraseCellularSettings;
- (void)confirmationSpecifierConfirmed:(id)a3;
- (void)dealloc;
- (void)deviceFullErase:(id)a3;
- (void)devicePINControllerDidDismissPINPane:(id)a3;
- (void)didAcceptEnteredPIN:(id)a3;
- (void)didAppear;
- (void)didSelectAlertAction:(id)a3;
- (void)eraseCellularSettings;
- (void)eraseSettings:(id)a3;
- (void)loadView;
- (void)prepareMutableSpecifiers;
- (void)presentExitBuddyWithUpsellTradeIn:(BOOL)a3;
- (void)refreshLocationServicesAvailable;
- (void)reprovisionAccount;
- (void)resetAKey;
- (void)resetAllCellularNetworks:(id)a3;
- (void)resetContacts;
- (void)resetIconPositions:(id)a3;
- (void)resetImproveSiriAndDictation;
- (void)resetKeyboardDictionary:(id)a3;
- (void)resetNetworkSettings:(id)a3;
- (void)resetPersonalHandwritingStyle:(id)a3;
- (void)resetPrivacyWarnings:(id)a3;
- (void)resetSceneUnderstandingData:(id)a3;
- (void)set_cachedLocationServicesAvailableValue:(id)a3;
- (void)set_client:(id)a3;
- (void)showPINSheetFromParentViewController:(id)a3;
- (void)showResetActionSheet:(id)a3;
- (void)subscriberOptions:(id)a3;
- (void)updateLocationResetSpecifier;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PSGResetOrEraseListController

- (PSGResetOrEraseListController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PSGResetOrEraseListController;
  v2 = [(PSGResetOrEraseListController *)&v7 init];
  if (v2)
  {
    v2->_requireRestrictionsCode = [MEMORY[0x263F67F58] settingEnabled];
    v2->_requirePasscode = [MEMORY[0x263F5FA90] settingEnabled];
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_profileNotification_ name:@"PSProfileConnectionRestrictionChangedNotification" object:0];

    v4 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x263F02D30]);
    client = v2->__client;
    v2->__client = v4;

    [(CoreTelephonyClient *)v2->__client setDelegate:v2];
  }
  return v2;
}

- (void)viewDidLoad
{
  v27[4] = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)PSGResetOrEraseListController;
  [(PSGResetOrEraseListController *)&v26 viewDidLoad];
  v3 = [(PSGResetOrEraseListController *)self table];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = (void *)MEMORY[0x263F08938];
  v25 = [(PSGResetOrEraseListController *)self table];
  v23 = [v25 leadingAnchor];
  v24 = [(PSGResetOrEraseListController *)self view];
  v22 = [v24 leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v27[0] = v21;
  v20 = [(PSGResetOrEraseListController *)self table];
  v18 = [v20 trailingAnchor];
  v19 = [(PSGResetOrEraseListController *)self view];
  v17 = [v19 trailingAnchor];
  v15 = [v18 constraintEqualToAnchor:v17];
  v27[1] = v15;
  v14 = [(PSGResetOrEraseListController *)self table];
  v4 = [v14 topAnchor];
  v5 = [(PSGResetOrEraseListController *)self view];
  v6 = [v5 topAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6];
  v27[2] = v7;
  v8 = [(PSGResetOrEraseListController *)self table];
  v9 = [v8 bottomAnchor];
  v10 = [(PSGResetOrEraseListController *)self view];
  v11 = [v10 bottomAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v27[3] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  [v16 activateConstraints:v13];
}

- (Class)tableViewClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PSGResetOrEraseListController;
  [(PSGResetOrEraseListController *)&v5 loadView];
  v3 = [(PSGResetOrEraseListController *)self table];
  [v3 setScrollEnabled:0];

  v4 = [(PSGResetOrEraseListController *)self table];
  [v4 _setTopPadding:0.0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSGResetOrEraseListController;
  [(PSGResetOrEraseListController *)&v4 viewDidAppear:a3];
  [(PSGResetOrEraseListController *)self didAppear];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSGResetOrEraseListController;
  [(PSGResetOrEraseListController *)&v4 dealloc];
}

- (void)updateLocationResetSpecifier
{
  v3 = [(PSGResetOrEraseListController *)self _cachedLocationServicesAvailableValue];

  if (!v3) {
    [(PSGResetOrEraseListController *)self refreshLocationServicesAvailable];
  }
  int v4 = [MEMORY[0x263F82438] isRunningInStoreDemoMode];
  objc_super v5 = [(PSGResetOrEraseListController *)self _cachedLocationServicesAvailableValue];
  int v6 = [v5 BOOLValue];

  int v7 = [(PSGResetOrEraseListController *)self containsSpecifier:self->_locationSpecifier];
  int v8 = v6 ^ 1 | v4;
  if (v8 != 1 || v7 == 0)
  {
    if (((v8 | v7) & 1) == 0)
    {
      locationSpecifier = self->_locationSpecifier;
      int64_t locationSpecifierIndex = self->_locationSpecifierIndex;
      [(PSGResetOrEraseListController *)self insertSpecifier:locationSpecifier atIndex:locationSpecifierIndex];
    }
  }
  else
  {
    v10 = self->_locationSpecifier;
    [(PSGResetOrEraseListController *)self removeSpecifier:v10];
  }
}

- (void)configureSpin:(BOOL)a3 ofCellForSpecifier:(id)a4 setEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  int v7 = [a4 propertyForKey:*MEMORY[0x263F602B0]];
  if (v7)
  {
    id v9 = v7;
    if (v6)
    {
      int v8 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
      [v8 startAnimating];
      [v9 setAccessoryView:v8];
    }
    else
    {
      [v7 setAccessoryView:0];
    }
    [v9 setCellEnabled:v5];
    int v7 = v9;
  }
}

- (void)didAcceptEnteredPIN:(id)a3
{
  id v4 = a3;
  ++self->_codesEntered;
  BOOL v5 = [(PSSpecifier *)self->_currentSpecifier propertyForKey:*MEMORY[0x263F60228]];
  int v6 = [v5 isEqualToString:@"DevicePINController"];

  passcode = _PSGLoggingFacility();
  BOOL v8 = os_log_type_enabled(passcode, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, passcode, OS_LOG_TYPE_DEFAULT, "Accepted passcode.", buf, 2u);
    }

    id v9 = (NSString *)v4;
    passcode = self->_passcode;
    self->_passcode = v9;
  }
  else if (v8)
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23D28D000, passcode, OS_LOG_TYPE_DEFAULT, "Accepted restrictions passcode.", v10, 2u);
  }

  self->_returningFromPINSheetWithSuccess = 1;
}

- (void)didAppear
{
  if (self->_returningFromPINSheetWithSuccess)
  {
    if (self->_codesEntered >= self->_codesNeeded)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      currentSpecifier = self->_currentSpecifier;
      if (isKindOfClass) {
        [(PSGResetOrEraseListController *)self showConfirmationViewForSpecifier:currentSpecifier];
      }
      else {
        [(PSGResetOrEraseListController *)self performButtonActionForSpecifier:currentSpecifier];
      }
    }
    else
    {
      [(PSSpecifier *)self->_currentSpecifier setProperty:@"PSRestrictionsPINController" forKey:*MEMORY[0x263F60228]];
      [(PSSpecifier *)self->_currentSpecifier setProperty:MEMORY[0x263EFFA88] forKey:@"screenTimePinEntry"];
      [(PSGResetOrEraseListController *)self performSelector:sel_showPINSheetFromParentViewController_ withObject:self->_currentSpecifier afterDelay:0.0];
    }
  }
  self->_returningFromPINSheetWithSuccess = 0;
}

- (void)resetKeyboardDictionary:(id)a3
{
  v3 = _PSGLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "Resetting keyboard dictionary", v4, 2u);
  }

  [MEMORY[0x263F828A0] removeAllDynamicDictionaries];
}

- (void)resetIconPositions:(id)a3
{
}

void __52__PSGResetOrEraseListController_resetIconPositions___block_invoke(uint64_t a1, int a2)
{
  v3 = _PSGLoggingFacility();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      __int16 v7 = 0;
      BOOL v5 = "SBSResetHomeScreenLayout completed successfully.";
      int v6 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    BOOL v5 = "SBSResetHomeScreenLayout failed.";
    int v6 = buf;
    goto LABEL_6;
  }
}

- (void)resetPrivacyWarnings:(id)a3
{
  id v4 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x263F67F68], self, 0, 1u);
  id v6 = objc_alloc_init(MEMORY[0x263F05408]);
  [v6 revokeAccessToAllBundles];
  __int16 v7 = [MEMORY[0x263F00A60] sharedManager];
  [v7 resetApps];

  BOOL v8 = [MEMORY[0x263F82E70] sharedPolicyDecider];
  [v8 clearAllCaches];

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  id v9 = (void *)getFMDFMIPManagerClass_softClass;
  v32 = (void *)getFMDFMIPManagerClass_softClass;
  if (!getFMDFMIPManagerClass_softClass)
  {
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    objc_super v26 = __getFMDFMIPManagerClass_block_invoke;
    v27 = &unk_264E8CD70;
    v28 = &v29;
    __getFMDFMIPManagerClass_block_invoke((uint64_t)&v24);
    id v9 = (void *)v30[3];
  }
  v23 = v6;
  id v10 = v9;
  _Block_object_dispose(&v29, 8);
  v11 = [v10 sharedInstance];
  [v11 clearData:1 completion:&__block_literal_global_38];

  [(PSGResetOrEraseListController *)self resetNetworkPrivacy];
  [(PSGResetOrEraseListController *)self resetContacts];
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessReset();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  TCCAccessSetOverride();
  if (SensorKitLibraryCore())
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    v12 = (void (*)(void))getSRResetAllAuthorizationsSymbolLoc_ptr;
    v32 = getSRResetAllAuthorizationsSymbolLoc_ptr;
    if (!getSRResetAllAuthorizationsSymbolLoc_ptr)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      objc_super v26 = __getSRResetAllAuthorizationsSymbolLoc_block_invoke;
      v27 = &unk_264E8CD70;
      v28 = &v29;
      v13 = (void *)SensorKitLibrary();
      v14 = dlsym(v13, "SRResetAllAuthorizations");
      *(void *)(v28[1] + 24) = v14;
      getSRResetAllAuthorizationsSymbolLoc_ptr = *(_UNKNOWN **)(v28[1] + 24);
      v12 = (void (*)(void))v30[3];
    }
    _Block_object_dispose(&v29, 8);
    if (!v12)
    {
      v22 = (_Unwind_Exception *)-[PSGResetOrEraseListController resetPrivacyWarnings:]();
      _Block_object_dispose(&v29, 8);
      _Unwind_Resume(v22);
    }
    v12();
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    v15 = (void *)getSRAuthorizationClientClass_softClass;
    v32 = (void *)getSRAuthorizationClientClass_softClass;
    if (!getSRAuthorizationClientClass_softClass)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      objc_super v26 = __getSRAuthorizationClientClass_block_invoke;
      v27 = &unk_264E8CD70;
      v28 = &v29;
      __getSRAuthorizationClientClass_block_invoke((uint64_t)&v24);
      v15 = (void *)v30[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v29, 8);
    v17 = [v16 sharedInstance];
    [v17 setDataCollectionEnabled:0];
  }
  [(PSGResetOrEraseListController *)self resetImproveSiriAndDictation];
  v18 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  if (([v18 containsObject:@"advertising"] & 1) == 0)
  {
    v19 = [MEMORY[0x263F53C50] sharedConnection];
    [v19 setBoolValue:0 forSetting:*MEMORY[0x263F53940]];
  }
  v20 = [MEMORY[0x263F53C50] sharedConnection];
  [v20 setBoolValue:0 forSetting:*MEMORY[0x263F53878]];

  v21 = [MEMORY[0x263F53C50] sharedConnection];
  [v21 setBoolValue:0 forSetting:*MEMORY[0x263F53740]];

  lockdown_delete_pair_records();
}

void __54__PSGResetOrEraseListController_resetPrivacyWarnings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    v3 = _PSGLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "Error clearing FMDFMIPManager %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)resetContacts
{
  [MEMORY[0x263EFEC30] resetLog];
  id v2 = objc_alloc_init(MEMORY[0x263EFEA58]);
  if (objc_opt_respondsToSelector()) {
    [v2 dropAllLimitedAccessRowsAndSyncNotify];
  }
}

- (void)resetImproveSiriAndDictation
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc_init(MEMORY[0x263F285E0]);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke;
  v3[3] = &unk_264E8CC58;
  objc_copyWeak(&v4, &location);
  [v2 setSiriDataSharingOptInStatus:0 propagateToHomeAccessories:0 source:7 reason:@"Reset" completion:v3];
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
}

void __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke_2;
  v5[3] = &unk_264E8CC30;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v7);
}

void __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke_2(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = _PSGLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke_2_cold_1(a1, v1, v3);
    }
  }
}

- (void)resetPersonalHandwritingStyle:(id)a3
{
  id v3 = a3;
  id v4 = _PSGLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7[0]) = 0;
    _os_log_impl(&dword_23D28D000, v4, OS_LOG_TYPE_DEFAULT, "Resetting personal handwriting style", (uint8_t *)v7, 2u);
  }

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v5 = (void (*)(void))getCHResetInventorySymbolLoc_ptr;
  v11 = getCHResetInventorySymbolLoc_ptr;
  if (!getCHResetInventorySymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getCHResetInventorySymbolLoc_block_invoke;
    v7[3] = &unk_264E8CD70;
    v7[4] = &v8;
    __getCHResetInventorySymbolLoc_block_invoke((uint64_t)v7);
    id v5 = (void (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    id v6 = (_Unwind_Exception *)-[PSGResetOrEraseListController resetPrivacyWarnings:]();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  v5();
}

- (void)_resetWithMode:(int64_t)a3 andOptions:(id)a4 withSpecifier:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    uint64_t v10 = (void *)getDDRResetOptionsClass_softClass;
    uint64_t v29 = getDDRResetOptionsClass_softClass;
    if (!getDDRResetOptionsClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&long long v31 = 3221225472;
      *((void *)&v31 + 1) = __getDDRResetOptionsClass_block_invoke;
      v32 = &unk_264E8CD70;
      v33 = &v26;
      __getDDRResetOptionsClass_block_invoke((uint64_t)buf);
      uint64_t v10 = (void *)v27[3];
    }
    v11 = v10;
    _Block_object_dispose(&v26, 8);
    id v8 = objc_alloc_init(v11);
  }
  passcode = self->_passcode;
  if (a3 == 3)
  {
    if (passcode)
    {
      v13 = [MEMORY[0x263F53C50] sharedConnection];
      char v14 = [v13 isPasscodeRequiredByProfiles];

      if ((v14 & 1) == 0)
      {
        v15 = [MEMORY[0x263F53C50] sharedConnection];
        [v15 changePasscodeFrom:self->_passcode to:0 outError:0];
      }
      id v16 = self->_passcode;
      self->_passcode = 0;
    }
    else
    {
      self->_passcode = 0;
    }
    [(PSGResetOrEraseListController *)self resetPrivacyWarnings:0];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v18 = (void *)getMBManagerClass_softClass;
    uint64_t v29 = getMBManagerClass_softClass;
    if (!getMBManagerClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&long long v31 = 3221225472;
      *((void *)&v31 + 1) = __getMBManagerClass_block_invoke;
      v32 = &unk_264E8CD70;
      v33 = &v26;
      __getMBManagerClass_block_invoke((uint64_t)buf);
      v18 = (void *)v27[3];
    }
    v19 = v18;
    _Block_object_dispose(&v26, 8);
    v17 = (void *)[[v19 alloc] initWithDelegate:self];
    [v17 unsetLocalBackupPasswordWithError:0];
  }
  else
  {
    self->_passcode = 0;

    if (a3 != 2) {
      goto LABEL_17;
    }
    v17 = [MEMORY[0x263F53C50] sharedConnection];
    [v17 checkCarrierProfileForceInstallation:1];
  }

LABEL_17:
  if (v9) {
    [(PSGResetOrEraseListController *)self configureSpin:1 ofCellForSpecifier:v9 setEnabled:0];
  }
  v20 = _PSGLoggingFacility();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a3;
    LOWORD(v31) = 2112;
    *(void *)((char *)&v31 + 2) = v8;
    _os_log_impl(&dword_23D28D000, v20, OS_LOG_TYPE_DEFAULT, "########### Calling DDRReset with mode: %d; options: %@",
      buf,
      0x12u);
  }

  v21 = dispatch_get_global_queue(0, 0);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __73__PSGResetOrEraseListController__resetWithMode_andOptions_withSpecifier___block_invoke;
  v23[3] = &unk_264E8CC80;
  id v24 = v8;
  int64_t v25 = a3;
  id v22 = v8;
  dispatch_async(v21, v23);
}

void __73__PSGResetOrEraseListController__resetWithMode_andOptions_withSpecifier___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v2 = (void *)getDDRResetRequestClass_softClass;
  uint64_t v16 = getDDRResetRequestClass_softClass;
  if (!getDDRResetRequestClass_softClass)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __getDDRResetRequestClass_block_invoke;
    v11 = &unk_264E8CD70;
    v12 = &v13;
    __getDDRResetRequestClass_block_invoke((uint64_t)&v8);
    id v2 = (void *)v14[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v13, 8);
  id v4 = (void *)[[v3 alloc] initWithMode:*(void *)(a1 + 40) options:*(void *)(a1 + 32) reason:@"EACS-Settings"];
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v5 = (void *)getDDRResetServiceClass_softClass;
  uint64_t v16 = getDDRResetServiceClass_softClass;
  if (!getDDRResetServiceClass_softClass)
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __getDDRResetServiceClass_block_invoke;
    v11 = &unk_264E8CD70;
    v12 = &v13;
    __getDDRResetServiceClass_block_invoke((uint64_t)&v8);
    id v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  id v7 = [v6 sharedInstance];
  [v7 resetWithRequest:v4 completion:0];
}

- (BOOL)_networkConnectivityAvailable
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  SCNetworkReachabilityFlags flags = 0;
  sockaddr address = (sockaddr)xmmword_23D2C6170;
  _networkConnectivityAvailable_reachability = (uint64_t)SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], &address);
  return SCNetworkReachabilityGetFlags((SCNetworkReachabilityRef)_networkConnectivityAvailable_reachability, &flags)
      && (flags & 2) != 0;
}

- (void)_showStockholmLocallyStoredValueOfflineWarningIfNeeded:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t))a3;
  BOOL v5 = [(PSGResetOrEraseListController *)self _networkConnectivityAvailable];
  id v6 = PSStockholmLocallyStoredValuePassNames();
  uint64_t v7 = [v6 count];
  uint64_t v8 = _PSGLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v32 = !v5;
    __int16 v33 = 1024;
    BOOL v34 = v7 != 0;
    _os_log_impl(&dword_23D28D000, v8, OS_LOG_TYPE_DEFAULT, "isOffline: %d, hasLocallyStoredValue: %d", buf, 0xEu);
  }

  if (v7) {
    char v9 = v5;
  }
  else {
    char v9 = 1;
  }
  uint64_t v10 = _PSGLoggingFacility();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v10, OS_LOG_TYPE_DEFAULT, "_showStockholmLocallyStoredValueOfflineWarningIfNeeded completed directly", buf, 2u);
    }

    v4[2](v4, 1);
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v10, OS_LOG_TYPE_DEFAULT, "Showing payment card warning.", buf, 2u);
    }

    v12 = NSString;
    uint64_t v13 = PSG_LocalizedStringForReset(@"ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_TITLE_SINGLE");
    char v14 = [v6 firstObject];
    uint64_t v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);

    uint64_t v16 = PSG_LocalizedStringForReset(@"ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_MSG_SINGLE");
    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v17 = PSG_LocalizedStringForReset(@"ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_TITLE_MULTIPLE");

      uint64_t v18 = PSG_LocalizedStringForReset(@"ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_MSG_MULTIPLE");

      uint64_t v15 = (void *)v17;
      uint64_t v16 = (void *)v18;
    }
    v19 = [MEMORY[0x263F82418] alertControllerWithTitle:v15 message:v16 preferredStyle:1];
    v20 = (void *)MEMORY[0x263F82400];
    v21 = PSG_LocalizedStringForReset(@"ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_ALERT_CANCEL");
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __88__PSGResetOrEraseListController__showStockholmLocallyStoredValueOfflineWarningIfNeeded___block_invoke;
    v29[3] = &unk_264E8CCA8;
    id v22 = v4;
    v30 = v22;
    v23 = [v20 actionWithTitle:v21 style:0 handler:v29];
    [v19 addAction:v23];

    id v24 = (void *)MEMORY[0x263F82400];
    int64_t v25 = PSG_LocalizedStringForReset(@"ERASE_STOCKHOLM_STORED_VALUE_OFFLINE_ALERT_ACCEPT");
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __88__PSGResetOrEraseListController__showStockholmLocallyStoredValueOfflineWarningIfNeeded___block_invoke_84;
    v27[3] = &unk_264E8CCA8;
    uint64_t v28 = v22;
    uint64_t v26 = [v24 actionWithTitle:v25 style:2 handler:v27];
    [v19 addAction:v26];

    [(PSGResetOrEraseListController *)self presentViewController:v19 animated:1 completion:0];
  }
}

uint64_t __88__PSGResetOrEraseListController__showStockholmLocallyStoredValueOfflineWarningIfNeeded___block_invoke(uint64_t a1)
{
  id v2 = _PSGLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D28D000, v2, OS_LOG_TYPE_DEFAULT, "Payment card warning: Cancelled.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__PSGResetOrEraseListController__showStockholmLocallyStoredValueOfflineWarningIfNeeded___block_invoke_84(uint64_t a1)
{
  id v2 = _PSGLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D28D000, v2, OS_LOG_TYPE_DEFAULT, "Payment card warning: Erase.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmationSpecifierConfirmed:(id)a3
{
  id v4 = a3;
  BOOL v5 = _PSGLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D28D000, v5, OS_LOG_TYPE_DEFAULT, "Confirmed.", buf, 2u);
  }

  self->_shouldEraseCellularPlans = 0;
  id v6 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
  uint64_t v7 = PSG_LocalizedStringForReset(@"RESET_CONFIRMATION_CANCEL");
  [v6 setCancelButton:v7];

  [v6 setProperty:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F60000]];
  uint64_t v8 = [v4 identifier];
  int v9 = [v8 isEqualToString:@"settingsErase"];

  if (v9)
  {
    [v6 setConfirmationAction:sel_eraseSettings_];
    uint64_t v10 = PSG_LocalizedStringForReset(@"RESET_CONFIRMATION_ALERT_ACCEPT");
    [v6 setOkButton:v10];

    BOOL v11 = PSG_LocalizedStringForReset(@"CLEAR_TITLE");
    [v6 setTitle:v11];

    v12 = @"CLEAR_SETTINGS_MSG_CONFIRM";
    if (PSHasStockholmPass())
    {
      uint64_t v13 = [MEMORY[0x263F53C50] sharedConnection];
      int v14 = [v13 isPasscodeRequiredByProfiles];

      if (!v14) {
        v12 = @"CLEAR_SETTINGS_MSG_CONFIRM_STOCKHOLM";
      }
    }
    uint64_t v15 = PSG_LocalizedStringForReset(v12);
    [v6 setPrompt:v15];

    uint64_t v16 = _PSGLoggingFacility();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    __int16 v25 = 0;
    uint64_t v17 = "Showing second confirmation for Settings Erase.";
    uint64_t v18 = (uint8_t *)&v25;
    goto LABEL_12;
  }
  v19 = [v4 identifier];
  int v20 = [v19 isEqualToString:@"cellularErase"];

  if (v20)
  {
    [v6 setConfirmationAction:sel_resetAllCellularNetworks_];
    v21 = PSG_LocalizedStringForReset(@"RESET_CONFIRMATION_ALERT_ACCEPT");
    [v6 setOkButton:v21];

    id v22 = PSG_LocalizedStringForReset(@"REMOVE_ALL_CELLULAR_PLANS_LABEL");
    [v6 setTitle:v22];

    v23 = PSG_LocalizedStringForReset(@"REMOVE_ALL_CELLULAR_PLANS_MSG_CONFIRM");
    [v6 setPrompt:v23];

    uint64_t v16 = _PSGLoggingFacility();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      [(PSGResetOrEraseListController *)self showConfirmationViewForSpecifier:v6];
      goto LABEL_14;
    }
    *(_WORD *)id v24 = 0;
    uint64_t v17 = "Showing second confirmation for Erase All Cellular Networks.";
    uint64_t v18 = v24;
LABEL_12:
    _os_log_impl(&dword_23D28D000, v16, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    goto LABEL_13;
  }
LABEL_14:
}

- (void)eraseSettings:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__PSGResetOrEraseListController_eraseSettings___block_invoke;
  v3[3] = &unk_264E8CAB8;
  void v3[4] = self;
  [(PSGResetOrEraseListController *)self _showStockholmLocallyStoredValueOfflineWarningIfNeeded:v3];
}

void __47__PSGResetOrEraseListController_eraseSettings___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) specifierForID:@"settingsErase"];
    [*(id *)(a1 + 32) _resetWithMode:3 andOptions:0 withSpecifier:v3];
  }
}

- (void)resetNetworkSettings:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F7C1B8]);
  id v6 = (void *)[v5 initWorkspaceWithService:*MEMORY[0x263F7C1C0]];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F7C1E8]) initWithWorkspace:v6];
    if (v7)
    {
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __54__PSGResetOrEraseListController_resetNetworkSettings___block_invoke;
      v14[3] = &unk_264E8CAB8;
      int v9 = v8;
      uint64_t v15 = v9;
      if ([v7 resetDataForKeys:0 reply:v14])
      {
        dispatch_time_t v10 = dispatch_time(0, 2000000000);
        if (dispatch_semaphore_wait(v9, v10))
        {
          BOOL v11 = _PSGLoggingFacility();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23D28D000, v11, OS_LOG_TYPE_DEFAULT, "resetDataForKeys did not complete. Bailing to avoid a hang", buf, 2u);
          }
        }
        lockdown_delete_pair_records();
        v12 = _PSGLoggingFacility();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23D28D000, v12, OS_LOG_TYPE_DEFAULT, "Proceed reset network settings", buf, 2u);
        }

        [(PSGResetOrEraseListController *)self _resetWithMode:2 andOptions:0 withSpecifier:v4];
      }
      else
      {
        uint64_t v13 = _PSGLoggingFacility();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23D28D000, v13, OS_LOG_TYPE_DEFAULT, "resetDataForKeys unable to contact service", buf, 2u);
        }
      }
    }
    else
    {
      int v9 = _PSGLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D28D000, v9, OS_LOG_TYPE_DEFAULT, "Unable to create NetworkPerformanceFeed", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v7 = _PSGLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v7, OS_LOG_TYPE_DEFAULT, "Unable to create AnalyticsWorkspace", buf, 2u);
    }
  }
}

intptr_t __54__PSGResetOrEraseListController_resetNetworkSettings___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = _PSGLoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "resetDataForKeys failure", v5, 2u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)resetSceneUnderstandingData:(id)a3
{
  id v4 = a3;
  id v5 = _PSGLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_23D28D000, v5, OS_LOG_TYPE_DEFAULT, "Resetting scene understanding data", v6, 2u);
  }

  [(PSGResetOrEraseListController *)self _resetWithMode:1 andOptions:0 withSpecifier:v4];
}

- (void)resetAllCellularNetworks:(id)a3
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [MEMORY[0x263F31978] sharedManager];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__PSGResetOrEraseListController_resetAllCellularNetworks___block_invoke;
  v6[3] = &unk_264E8CCD0;
  dispatch_semaphore_t v7 = v3;
  id v5 = v3;
  [v4 eraseAllPlans:v6];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __58__PSGResetOrEraseListController_resetAllCellularNetworks___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _PSGLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __58__PSGResetOrEraseListController_resetAllCellularNetworks___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263EFF980]);
    id v6 = [(PSGResetOrEraseListController *)self loadSpecifiersFromPlistName:@"Reset" target:self];
    dispatch_semaphore_t v7 = (NSMutableArray *)[v5 initWithArray:v6];
    mutableSpecifiers = self->_mutableSpecifiers;
    self->_mutableSpecifiers = v7;

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    dispatch_time_t v10 = (void *)MEMORY[0x263F5FC40];
    BOOL v11 = PSG_LocalizedStringForReset(@"RESET");
    v12 = [v10 preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v12 setButtonAction:sel_showResetActionSheet_];
    uint64_t v13 = [(NSMutableArray *)self->_mutableSpecifiers specifierForID:@"fullErase"];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
        uint64_t v15 = PSG_LocalizedStringForReset(@"ERASE_OK");
        [v14 setTitle:v15];

        uint64_t v16 = PSG_LocalizedStringForReset(@"FULL_RESET_QUICK_MSG");
        [v14 setPrompt:v16];
      }
    }
    uint64_t v17 = [MEMORY[0x263F53C50] sharedConnection];
    int v18 = [v17 effectiveBoolValueForSetting:*MEMORY[0x263F538B0]];

    if (v18 == 2) {
      [v13 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F600A8]];
    }
    [v9 addObject:v12];
    [v9 addObject:v13];
    v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v9;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)prepareMutableSpecifiers
{
  int v3 = [MEMORY[0x263F82438] isRunningInStoreDemoMode];
  if (v3)
  {
    mutableSpecifiers = self->_mutableSpecifiers;
    id v5 = [(NSMutableArray *)mutableSpecifiers specifierForID:@"settingsErase"];
    [(NSMutableArray *)mutableSpecifiers removeObject:v5];

    id v6 = self->_mutableSpecifiers;
    dispatch_semaphore_t v7 = [(NSMutableArray *)v6 specifierForID:@"fullErase"];
    [(NSMutableArray *)v6 removeObject:v7];

    dispatch_semaphore_t v8 = self->_mutableSpecifiers;
    id v9 = [(NSMutableArray *)v8 specifierForID:@"fullEraseIPod"];
    [(NSMutableArray *)v8 removeObject:v9];

    dispatch_time_t v10 = self->_mutableSpecifiers;
    BOOL v11 = [(NSMutableArray *)v10 specifierForID:@"RESET_KEYBOARD_DICTIONARY_LABEL"];
    [(NSMutableArray *)v10 removeObject:v11];

    v12 = self->_mutableSpecifiers;
    uint64_t v13 = [(NSMutableArray *)v12 specifierForID:@"RESET_NETWORK_LABEL"];
    [(NSMutableArray *)v12 removeObject:v13];

    id v14 = self->_mutableSpecifiers;
    uint64_t v15 = [(NSMutableArray *)v14 specifierForID:@"cellularErase"];
    [(NSMutableArray *)v14 removeObject:v15];

    uint64_t v16 = self->_mutableSpecifiers;
    uint64_t v17 = [(NSMutableArray *)v16 specifierForID:@"SUBSCRIBER_SERVICES_ID"];
    [(NSMutableArray *)v16 removeObject:v17];
  }
  int v18 = [(PSGResetOrEraseListController *)self _cachedLocationServicesAvailableValue];

  if (!v18) {
    [(PSGResetOrEraseListController *)self refreshLocationServicesAvailable];
  }
  v19 = [(PSGResetOrEraseListController *)self _cachedLocationServicesAvailableValue];
  int v20 = [v19 BOOLValue];

  v21 = [(NSMutableArray *)self->_mutableSpecifiers specifierForID:@"RESET_PRIVACY_LABEL"];
  locationSpecifier = self->_locationSpecifier;
  self->_locationSpecifier = v21;

  self->_int64_t locationSpecifierIndex = [(NSMutableArray *)self->_mutableSpecifiers indexOfObject:self->_locationSpecifier];
  if ((v3 | v20 ^ 1) == 1) {
    [(NSMutableArray *)self->_mutableSpecifiers removeObject:self->_locationSpecifier];
  }
  id v33 = [(NSMutableArray *)self->_mutableSpecifiers specifierForID:@"settingsErase"];
  if (v33)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (PSHasStockholmPass())
      {
        v23 = [MEMORY[0x263F53C50] sharedConnection];
        char v24 = [v23 isPasscodeRequiredByProfiles];

        if ((v24 & 1) == 0)
        {
          id v25 = v33;
          uint64_t v26 = PSG_LocalizedStringForReset(@"CLEAR_SETTINGS_MSG_STOCKHOLM");
          [v25 setPrompt:v26];
        }
      }
    }
  }
  v27 = [MEMORY[0x263F67F30] sharedInstance];
  uint64_t v28 = [v27 embeddedPlanItems];
  if (![v28 count])
  {

    goto LABEL_16;
  }
  uint64_t v29 = [MEMORY[0x263F67F30] sharedInstance];
  char v30 = [v29 isAnyLocalFlowTypeSupported];

  if ((v30 & 1) == 0)
  {
LABEL_16:
    long long v31 = self->_mutableSpecifiers;
    int v32 = [(NSMutableArray *)v31 specifierForID:@"cellularErase"];
    [(NSMutableArray *)v31 removeObject:v32];
  }
}

- (void)showResetActionSheet:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  [(PSGResetOrEraseListController *)self prepareMutableSpecifiers];
  mutableSpecifiers = self->_mutableSpecifiers;
  id v6 = [(NSMutableArray *)mutableSpecifiers specifierForID:@"fullErase"];
  [(NSMutableArray *)mutableSpecifiers removeObject:v6];

  dispatch_semaphore_t v7 = self->_mutableSpecifiers;
  dispatch_semaphore_t v8 = [(NSMutableArray *)v7 specifierForID:@"fullEraseIPod"];
  [(NSMutableArray *)v7 removeObject:v8];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = self;
  dispatch_time_t v10 = self->_mutableSpecifiers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v15 cellType] == 13)
        {
          uint64_t v16 = (void *)MEMORY[0x263F82400];
          uint64_t v17 = [v15 name];
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __54__PSGResetOrEraseListController_showResetActionSheet___block_invoke;
          v22[3] = &unk_264E8C850;
          v22[4] = v9;
          v22[5] = v15;
          int v18 = [v16 actionWithTitle:v17 style:0 handler:v22];
          [v4 addAction:v18];
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  v19 = (void *)MEMORY[0x263F82400];
  int v20 = PSG_LocalizedStringForReset(@"RESET_CONFIRMATION_CANCEL");
  v21 = [v19 actionWithTitle:v20 style:1 handler:0];
  [v4 addAction:v21];

  [(PSGResetOrEraseListController *)v9 presentViewController:v4 animated:1 completion:0];
}

uint64_t __54__PSGResetOrEraseListController_showResetActionSheet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didSelectAlertAction:*(void *)(a1 + 40)];
}

- (void)didSelectAlertAction:(id)a3
{
  id v5 = a3;
  passcode = self->_passcode;
  self->_passcode = 0;

  if (!*(_WORD *)&self->_requireRestrictionsCode) {
    goto LABEL_22;
  }
  dispatch_semaphore_t v7 = [v5 propertyForKey:@"pane"];
  int v8 = [v7 isEqualToString:@"DevicePINPane"];

  if (!v8) {
    goto LABEL_22;
  }
  self->_codesNeeded = 0;
  self->_codesEntered = 0;
  id v9 = _PSGLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D28D000, v9, OS_LOG_TYPE_DEFAULT, "erase require user enter passcode", buf, 2u);
  }

  if (self->_requireRestrictionsCode)
  {
    dispatch_time_t v10 = _PSGLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_23D28D000, v10, OS_LOG_TYPE_DEFAULT, "Restrictions passcode required.", v21, 2u);
    }

    uint64_t v11 = [(PSGResetOrEraseListController *)self specifierForID:@"RESET_KEYBOARD_DICTIONARY_LABEL"];
    if ((id)v11 == v5)
    {

      goto LABEL_16;
    }
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [(PSGResetOrEraseListController *)self specifierForID:@"RESET_NETWORK_LABEL"];
    if ((id)v13 == v5)
    {

      goto LABEL_16;
    }
    id v14 = (void *)v13;
    id v15 = [(PSGResetOrEraseListController *)self specifierForID:@"RESET_PRIVACY_LABEL"];
    if (v15 == v5)
    {
      int v16 = PSIsLocationRestricted();

      if (!v16) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    ++self->_codesNeeded;
    uint64_t v17 = [NSNumber numberWithInt:3];
    [v5 setProperty:v17 forKey:@"mode"];

    [v5 setProperty:@"PSRestrictionsPINController" forKey:*MEMORY[0x263F60228]];
    [v5 setProperty:MEMORY[0x263EFFA88] forKey:@"screenTimePinEntry"];
  }
LABEL_16:
  if (self->_requirePasscode)
  {
    int v18 = _PSGLoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v20 = 0;
      _os_log_impl(&dword_23D28D000, v18, OS_LOG_TYPE_DEFAULT, "Passcode required.", v20, 2u);
    }

    ++self->_codesNeeded;
    v19 = [NSNumber numberWithInt:3];
    [v5 setProperty:v19 forKey:@"mode"];

    [(PSSpecifier *)self->_currentSpecifier setProperty:MEMORY[0x263EFFA80] forKey:@"screenTimePinEntry"];
    [v5 setProperty:@"DevicePINController" forKey:*MEMORY[0x263F60228]];
  }
  objc_storeStrong((id *)&self->_currentSpecifier, a3);
  if (self->_codesNeeded)
  {
    [(PSGResetOrEraseListController *)self showPINSheetFromParentViewController:self->_currentSpecifier];
    goto LABEL_25;
  }
LABEL_22:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PSGResetOrEraseListController *)self showConfirmationViewForSpecifier:v5];
  }
  else {
    [(PSGResetOrEraseListController *)self performButtonActionForSpecifier:v5];
  }
LABEL_25:
}

- (void)showPINSheetFromParentViewController:(id)a3
{
  v23[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke;
  aBlock[3] = &unk_264E8C9C8;
  aBlock[4] = self;
  id v5 = v4;
  id v21 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  BOOL v7 = [(PSGResetOrEraseListController *)self isRatchetFeatureAvailableAndEnabled];
  int v8 = [v5 identifier];
  int v9 = [v8 isEqualToString:@"settingsErase"];

  if (v9 && v7)
  {
    dispatch_time_t v10 = (void *)[objc_alloc(MEMORY[0x263F10480]) initWithIdentifier:@"ResetAllSettings"];
    v22[0] = &unk_26F103AA8;
    uint64_t v11 = PSG_LocalizedStringForReset(@"DTO_GENERIC_SECURITY_DELAY_BEGIN_TITLE");
    v23[0] = v11;
    v22[1] = &unk_26F103AC0;
    uint64_t v12 = PSG_LocalizedStringForReset(@"DTO_GENERIC_SECURITY_DELAY_BEGIN_DESCRIPTION");
    v23[1] = v12;
    v22[2] = &unk_26F103AD8;
    uint64_t v13 = PSG_LocalizedStringForReset(@"DTO_GENERIC_IN_PROGRESS_COUNTDOWN_DESCRIPTION");
    v23[2] = v13;
    v22[3] = &unk_26F103A90;
    id v14 = PSG_LocalizedStringForReset(@"DTO_GENERIC_SECURITY_DELAY_BEGIN_DESCRIPTION");
    v23[3] = v14;
    v22[4] = &unk_26F103AF0;
    id v15 = PSG_LocalizedStringForReset(@"DTO_NOTIFICATION_DESCRIPTION_DEFAULT");
    void v23[4] = v15;
    v22[5] = &unk_26F103B08;
    int v16 = [NSURL URLWithString:@"prefs:root=PASSCODE"];
    void v22[6] = &unk_26F103B20;
    v23[5] = v16;
    v23[6] = MEMORY[0x263EFFA88];
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:7];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_200;
    v18[3] = &unk_264E8CD20;
    v19 = v6;
    [v10 armWithOptions:v17 completion:v18];
  }
  else
  {
    v6[2](v6);
  }
}

void __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke(uint64_t a1)
{
  id v2 = (objc_class *)MEMORY[0x263F5FAA0];
  id v3 = *(id *)(a1 + 32);
  id v4 = objc_alloc_init(v2);
  [v4 setAllowOptionsButton:0];
  *(unsigned char *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F5FDB0]) = 1;
  [v4 setParentController:v3];
  [*(id *)(a1 + 40) setProperty:v3 forKey:*MEMORY[0x263F60318]];
  [v4 setSpecifier:*(void *)(a1 + 40)];
  objc_storeWeak((id *)(*(void *)(a1 + 40) + (int)*MEMORY[0x263F5FE40]), *(id *)(a1 + 32));
  [*(id *)(a1 + 32) showController:v4];
}

void __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_200(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  BOOL v7 = [v5 objectForKeyedSubscript:&unk_26F103B38];
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }

  int v9 = _PSGLoggingFacility();
  dispatch_time_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v10, OS_LOG_TYPE_DEFAULT, "Ratchet: Proceeding to perform critical operation as gating was successful", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_205;
    block[3] = &unk_264E8CCF8;
    uint64_t v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
    dispatch_time_t v10 = v12;
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_200_cold_1(v6, (uint64_t)v5, v10);
  }
}

uint64_t __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_205(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB0]) = 0;
  [(PSGResetOrEraseListController *)self didAppear];
}

- (void)subscriberOptions:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  v45[5] = 0;
  long long v46 = 0u;
  uint64_t v47 = 0;
  v45[6] = self;
  uint64_t v4 = _CTServerConnectionCreate();
  if (v4)
  {
    id v5 = (const void *)v4;
    buf[0] = 0;
    _CTServerConnectionGetResetCellularAccountSettingsIsAllowed();
    CFRelease(v5);
  }
  id v6 = (void *)MEMORY[0x263F82418];
  BOOL v7 = PSG_LocalizedStringForReset(@"SUBSCRIBER_SERVICES");
  int v8 = [v6 alertControllerWithTitle:v7 message:0 preferredStyle:1];

  unint64_t v9 = 0x263F82000uLL;
  dispatch_time_t v10 = (void *)MEMORY[0x263F82400];
  uint64_t v11 = PSG_LocalizedStringForReset(@"SUBSCRIBER_SERVICES_CANCEL");
  uint64_t v12 = [v10 actionWithTitle:v11 style:1 handler:0];
  [v8 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x263F82400];
  id v14 = PSG_LocalizedStringForReset(@"REPROVISION_ACCOUNT");
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __51__PSGResetOrEraseListController_subscriberOptions___block_invoke;
  v45[3] = &unk_264E8CD48;
  v45[4] = self;
  id v15 = [v13 actionWithTitle:v14 style:0 handler:v45];
  [v8 addAction:v15];

  int v16 = [(PSGResetOrEraseListController *)self _client];
  id v44 = 0;
  uint64_t v17 = [v16 getSubscriptionInfoWithError:&v44];
  id v18 = v44;

  if (v18)
  {
    v19 = _PSGLoggingFacility();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PSGResetOrEraseListController subscriberOptions:]();
    }
  }
  else
  {
    int v20 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = [v17 subscriptions];
    uint64_t v21 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v35 = v17;
      v36 = v8;
      id v18 = 0;
      uint64_t v23 = *(void *)v41;
      while (2)
      {
        uint64_t v24 = 0;
        long long v25 = v18;
        do
        {
          if (*(void *)v41 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v40 + 1) + 8 * v24);
          v27 = [(PSGResetOrEraseListController *)self _client];
          id v39 = v25;
          uint64_t v28 = (void *)[v27 copyCarrierBundleValueWithDefault:v26 key:@"AllowAKEYEditing" bundleType:v20 error:&v39];
          id v18 = v39;

          if (v28)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              id v30 = v28;
              if (objc_opt_isKindOfClass()) {
                long long v31 = v30;
              }
              else {
                long long v31 = 0;
              }
              v19 = v31;

              goto LABEL_24;
            }
          }
          if (v18)
          {
            uint64_t v29 = _PSGLoggingFacility();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v49 = "-[PSGResetOrEraseListController subscriberOptions:]";
              __int16 v50 = 2114;
              id v51 = v18;
              _os_log_error_impl(&dword_23D28D000, v29, OS_LOG_TYPE_ERROR, "%s: Error retrieving value: %{public}@.", buf, 0x16u);
            }
          }
          ++v24;
          long long v25 = v18;
        }
        while (v22 != v24);
        uint64_t v22 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      v19 = 0;
LABEL_24:
      int v8 = v36;
      uint64_t v17 = v35;
      unint64_t v9 = 0x263F82000;
    }
    else
    {
      id v18 = 0;
      v19 = 0;
    }

    if ([v19 BOOLValue])
    {
      int v32 = *(void **)(v9 + 1024);
      id v33 = PSG_LocalizedStringForReset(@"RESET_AKEY");
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __51__PSGResetOrEraseListController_subscriberOptions___block_invoke_223;
      v38[3] = &unk_264E8CD48;
      v38[4] = self;
      BOOL v34 = [v32 actionWithTitle:v33 style:0 handler:v38];
      [v8 addAction:v34];
    }
    [(PSGResetOrEraseListController *)self presentViewController:v8 animated:1 completion:0];
  }
}

uint64_t __51__PSGResetOrEraseListController_subscriberOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reprovisionAccount];
}

uint64_t __51__PSGResetOrEraseListController_subscriberOptions___block_invoke_223(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetAKey];
}

uint64_t __51__PSGResetOrEraseListController_subscriberOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) confirmEraseCellularSettings];
}

- (void)reprovisionAccount
{
}

- (void)resetAKey
{
}

- (void)eraseCellularSettings
{
  uint64_t v2 = _CTServerConnectionCreate();
  if (v2)
  {
    id v3 = (const void *)v2;
    _CTServerConnectionEraseBasebandSettings();
    _CTServerConnectionResetModem();
    CFRelease(v3);
  }
}

- (void)confirmEraseCellularSettings
{
  id v7 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
  id v3 = PSG_LocalizedStringForReset(@"ERASE_ACCOUNT_CONFIRMATION_CANCEL");
  [v7 setCancelButton:v3];

  [v7 setProperty:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F60000]];
  [v7 setConfirmationAction:sel_eraseCellularSettings];
  uint64_t v4 = PSG_LocalizedStringForReset(@"ERASE_ACCOUNT_CONFIRMATION_ALERT_ACCEPT");
  [v7 setOkButton:v4];

  id v5 = PSG_LocalizedStringForReset(@"ERASE_ACCOUNT_TITLE");
  [v7 setTitle:v5];

  id v6 = PSG_LocalizedStringForReset(@"ERASE_ACCOUNT_MSG_CONFIRM");
  [v7 setPrompt:v6];

  [(PSGResetOrEraseListController *)self showConfirmationViewForSpecifier:v7];
}

- (void)deviceFullErase:(id)a3
{
}

- (void)presentExitBuddyWithUpsellTradeIn:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F3A3B0] defaultConfiguration];
  [v5 setUpsellTradeIn:v3];
  [MEMORY[0x263F3A3B8] presentUsingParentViewController:self configuration:v5 completion:0];
}

- (void)refreshLocationServicesAvailable
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_23D28D000, v0, OS_LOG_TYPE_ERROR, "%s: Error retrieving subscription info: %{public}@.", (uint8_t *)v1, 0x16u);
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(PSGResetOrEraseListController *)self set_cachedLocationServicesAvailableValue:0];
    [(PSGResetOrEraseListController *)self updateLocationResetSpecifier];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__PSGResetOrEraseListController_carrierBundleChange___block_invoke;
    v5[3] = &unk_264E8C9C8;
    void v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __53__PSGResetOrEraseListController_carrierBundleChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = _PSGLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_23D28D000, v2, OS_LOG_TYPE_DEFAULT, "carrier bundle change", v4, 2u);
  }

  return [*(id *)(a1 + 32) carrierBundleChange:*(void *)(a1 + 40)];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PSGResetOrEraseListController;
  id v4 = [(PSGResetOrEraseListController *)&v11 tableView:a3 cellForRowAtIndexPath:a4];
  if ([(id)objc_opt_class() isLargeTextEnabled])
  {
    id v5 = (void *)MEMORY[0x263F81708];
    uint64_t v6 = *MEMORY[0x263F83570];
    id v7 = [(id)objc_opt_class() maximumSupportedContentSizeCategory];
    int v8 = [v5 _preferredFontForTextStyle:v6 maximumContentSizeCategory:v7];
    unint64_t v9 = [v4 textLabel];
    [v9 setFont:v8];
  }
  return v4;
}

+ (BOOL)isLargeTextEnabled
{
  uint64_t v2 = [MEMORY[0x263F82438] sharedApplication];
  BOOL v3 = [v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

+ (NSString)maximumSupportedContentSizeCategory
{
  return (NSString *)(id)*MEMORY[0x263F83418];
}

- (BOOL)isRatchetFeatureAvailableAndEnabled
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x263F10488] sharedInstance];
  int v3 = [v2 isFeatureSupported];

  if (!v3) {
    return 0;
  }
  id v4 = [MEMORY[0x263F10488] sharedInstance];
  int v5 = [v4 isFeatureAvailable];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = [MEMORY[0x263F10488] sharedInstance];
  char v7 = [v6 isFeatureEnabled];

  return v7;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedLocationServicesAvailableValue, 0);
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->_mutableSpecifiers, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_locationSpecifier, 0);
  objc_storeStrong((id *)&self->_currentSpecifier, 0);
}

- (uint64_t)resetPrivacyWarnings:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke_2_cold_1(v0);
}

void __61__PSGResetOrEraseListController_resetImproveSiriAndDictation__block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = (objc_class *)objc_opt_class();
  char v7 = NSStringFromClass(v6);
  uint64_t v8 = *a2;
  int v9 = 138412802;
  dispatch_time_t v10 = v7;
  __int16 v11 = 2112;
  uint64_t v12 = &unk_26F103A90;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_23D28D000, a3, OS_LOG_TYPE_ERROR, "%@: Encountered error while setting Siri Analytics Status to '%@': %@", (uint8_t *)&v9, 0x20u);
}

void __58__PSGResetOrEraseListController_resetAllCellularNetworks___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D28D000, a2, OS_LOG_TYPE_ERROR, "Failed to reset cellular plans: %@", (uint8_t *)&v2, 0xCu);
}

void __70__PSGResetOrEraseListController_showPINSheetFromParentViewController___block_invoke_200_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = [a1 description];
  int v6 = 138543618;
  char v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_23D28D000, a3, OS_LOG_TYPE_ERROR, "Ratchet: Cannot proceed to perform critical operation as gating failed - Error: %{public}@ - %@", (uint8_t *)&v6, 0x16u);
}

- (void)subscriberOptions:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_23D28D000, v0, OS_LOG_TYPE_ERROR, "%s: Error retrieving subscription info: %{public}@.", (uint8_t *)v1, 0x16u);
}

@end