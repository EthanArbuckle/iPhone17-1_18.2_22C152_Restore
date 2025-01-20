@interface PSUIPasscodeLockController
+ (int64_t)passcodeGracePeriod;
- (BOOL)_shouldUseLocalAuthenticationBasedPasscodeFlowForPINSheetRequest:(id)a3;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)canUnlockWatch;
- (BOOL)gracePeriodPasscodeRecoveryAvailable;
- (BOOL)isAssistantRestricted;
- (BOOL)isFindMyEnabled;
- (BOOL)isInternetReachable;
- (BOOL)isObservingDTOStatusChange;
- (BOOL)isPasscodeSet;
- (BOOL)isVoiceDialRestricted;
- (BOOL)isWalletRestricted;
- (BOOL)shouldDisplayTurnOffPasscodeAlertMessage;
- (BOOL)shouldPresentAppleIDAuthenticationForTogglingPasscode;
- (BOOL)shouldShowVoiceDial;
- (BOOL)shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests;
- (BOOL)shouldUseLocalAuthenticationBasedPasscodeFlowForRemovePasscodeRequests;
- (BOOL)showReplyWithMessage;
- (BOOL)useAlternateFooterTextForPAU;
- (HMHomeManager)homeManager;
- (LAPasscodeChangeService)_passcodeChangeService;
- (LAPasscodeRemovalService)_passcodeRemovalService;
- (NSArray)autoUnlockSpecifiers;
- (OS_nw_path_monitor)pathMonitor;
- (PSUIDeviceTakeOverController)dtoController;
- (PSUIPasscodeLockController)init;
- (SFAutoUnlockManager)autoUnlockManager;
- (id)_allowAccessWhenLockedSpecifierFooter;
- (id)_makeWipeDeviceGroupFooter;
- (id)assistantUnderLockEnabled:(id)a3;
- (id)autoUnlockEnabled:(id)a3;
- (id)enabledInLockScreen:(id)a3;
- (id)enabledInLockScreenForUSB:(id)a3;
- (id)getDTOSpecifiers;
- (id)getDTOStatusForSpecifier:(id)a3;
- (id)getTurnOffAlertDescriptionForFeatureProtectedApps;
- (id)getTurnOffAlertDescriptionForOtherFeatures;
- (id)graceValue:(id)a3;
- (id)homeControlAccessAllowedWhenLocked:(id)a3;
- (id)psCellForSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)turnOffPasscodeAlertMessage;
- (id)voiceDial:(id)a3;
- (id)wallet:(id)a3;
- (id)wipeEnabled:(id)a3;
- (int64_t)fingerprintCount;
- (unint64_t)errorActionWithAutoUnlockError:(id)a3;
- (void)_didUpdatePasscode:(id)a3;
- (void)_localizeGracePeriodTitlesForSpecifier:(id)a3;
- (void)_setWipeEnabled:(BOOL)a3;
- (void)_showDeleteSavedFingerprintsAlert;
- (void)_showLocalAuthenticationPINSheet:(id)a3;
- (void)_updateGracePeriodForSpecifier:(id)a3;
- (void)addGracePeriodPasscodeRecoveryFooterToSpecifier:(id)a3;
- (void)dealloc;
- (void)devicePINController:(id)a3 didAcceptChangedPIN:(id)a4;
- (void)devicePINController:(id)a3 didAcceptSetPIN:(id)a4;
- (void)devicePINController:(id)a3 shouldAcceptPIN:(id)a4 withCompletion:(id)a5;
- (void)devicePINControllerDidDismissPINPane:(id)a3;
- (void)didAcceptRemovePIN;
- (void)disablePasscodeRequiredSpecifiers:(id)a3;
- (void)enableAutoUnlockForDevice:(id)a3 ofSpecifier:(id)a4;
- (void)gracePeriodClearRecoveryPasscode:(id)a3;
- (void)handleDTOStatusChanged;
- (void)homeManager:(id)a3 didUpdateAccessAllowedWhenLocked:(BOOL)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)manager:(id)a3 didEnableDevice:(id)a4;
- (void)manager:(id)a3 enablingLockedDevice:(id)a4;
- (void)manager:(id)a3 failedToEnableDevice:(id)a4 error:(id)a5;
- (void)navigationControllerDidPushFirstController:(id)a3;
- (void)openGracePeriodPasscodeRecoveryHelpLink;
- (void)presentAppleIDAuthenticationController;
- (void)presentAutoUnlockEnableFailureAlertWithDevice:(id)a3 withError:(id)a4;
- (void)proceedToTurnOffPasscode:(id)a3;
- (void)profileNotification:(id)a3;
- (void)provideNavigationDonations;
- (void)refreshCellForSpecifier:(id)a3;
- (void)registerObserverAndHandlerForDTOStatusChanges;
- (void)scrollToStolenDeviceProtection;
- (void)setAssistantUnderLockEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setAutoUnlockEnabled:(id)a3 specifier:(id)a4;
- (void)setAutoUnlockManager:(id)a3;
- (void)setAutoUnlockSpecifiers:(id)a3;
- (void)setCanUnlockWatch:(BOOL)a3;
- (void)setDtoController:(id)a3;
- (void)setEnabledInLockScreen:(id)a3 specifier:(id)a4;
- (void)setEnabledInLockScreenForUSB:(id)a3 specifier:(id)a4;
- (void)setGraceValue:(id)a3 specifier:(id)a4;
- (void)setHomeControlAccessAllowedWhenLocked:(id)a3 specifier:(id)a4;
- (void)setHomeManager:(id)a3;
- (void)setIsFindMyEnabled:(BOOL)a3;
- (void)setIsInternetReachable:(BOOL)a3;
- (void)setIsObservingDTOStatusChange:(BOOL)a3;
- (void)setPathMonitor:(id)a3;
- (void)setVoiceDial:(id)a3 specifier:(id)a4;
- (void)setWallet:(id)a3 specifier:(id)a4;
- (void)setWipeEnabled:(id)a3 specifier:(id)a4;
- (void)set_passcodeChangeService:(id)a3;
- (void)set_passcodeRemovalService:(id)a3;
- (void)setupInternetAvailabilityMonitoring;
- (void)showAlertForPhoneAutoUnlockEnablementOfDevice:(id)a3 ofSpecifier:(id)a4;
- (void)showKeychainAlert;
- (void)showLocalAuthenticationPasscodeChangeFlowFromPresentingController:(id)a3 title:(id)a4 passcodePrompt:(id)a5 withCompletion:(id)a6;
- (void)showLocalAuthenticationPasscodeRemoveFlowFromPresentingController:(id)a3 title:(id)a4 passcodePrompt:(id)a5 withCompletion:(id)a6;
- (void)showPINSheet:(id)a3;
- (void)showPINSheet:(id)a3 allowOptionsButton:(BOOL)a4;
- (void)showWeakWarningAlertForController:(id)a3 offerUseAnyway:(BOOL)a4 withCompletion:(id)a5;
- (void)suspend;
- (void)togglePasscode:(id)a3;
- (void)updateAutoUnlockDevicewithDevice:(id)a3;
- (void)updateAutoUnlockSpecifiers;
- (void)updateDTOSpecifierIfNeeded;
- (void)updateGracePeriodSpecifier;
- (void)updatePasscodeChangesGroupFooterToSpecifier:(id)a3 showDefault:(BOOL)a4;
- (void)updatePhoneAutounlockSection:(BOOL)a3;
- (void)updateVoiceDialGroup;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PSUIPasscodeLockController

- (PSUIPasscodeLockController)init
{
  v25.receiver = self;
  v25.super_class = (Class)PSUIPasscodeLockController;
  v2 = [(PSUIPasscodeLockController *)&v25 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_profileNotification_ name:@"PSProfileConnectionRestrictionChangedNotification" object:0];

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_profileNotification_ name:@"PSProfileConnectionEffectiveSettingsChangedNotification" object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_profileNotification_ name:@"PSProfileConnectionPasscodeChangedNotification" object:0];

    v6 = [MEMORY[0x263F3BAD8] sharedInstance];
    [v6 addListenerID:@"com.apple.Preferences" forService:0];

    v7 = [MEMORY[0x263F3BAD8] sharedInstance];
    [v7 addListenerID:@"com.apple.Preferences" forService:1];

    v8 = +[PSUIUnlockWithAppleWatchManager sharedInstance];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __34__PSUIPasscodeLockController_init__block_invoke;
    v23 = &unk_264E95548;
    v9 = v2;
    v24 = v9;
    [v8 canUseWatchToUnlockWithCompletionHandler:&v20];

    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v10 = (void *)getHMHomeManagerClass_softClass;
    uint64_t v30 = getHMHomeManagerClass_softClass;
    if (!getHMHomeManagerClass_softClass)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __getHMHomeManagerClass_block_invoke;
      v26[3] = &unk_264E95420;
      v26[4] = &v27;
      __getHMHomeManagerClass_block_invoke((uint64_t)v26);
      v10 = (void *)v28[3];
    }
    v11 = v10;
    _Block_object_dispose(&v27, 8);
    id v12 = [v11 alloc];
    uint64_t v13 = objc_msgSend(v12, "initWithOptions:", 0, v20, v21, v22, v23);
    homeManager = v9->_homeManager;
    v9->_homeManager = (HMHomeManager *)v13;

    [(HMHomeManager *)v9->_homeManager setDelegate:v9];
    v15 = objc_opt_new();
    [(PSUIPasscodeLockController *)v9 setAutoUnlockManager:v15];

    v16 = [(PSUIPasscodeLockController *)v9 autoUnlockManager];
    [v16 setDelegate:v9];

    uint64_t v17 = objc_opt_new();
    dtoController = v9->_dtoController;
    v9->_dtoController = (PSUIDeviceTakeOverController *)v17;

    [(PSUIPasscodeLockController *)v9 setupInternetAvailabilityMonitoring];
  }
  return v2;
}

uint64_t __34__PSUIPasscodeLockController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setCanUnlockWatch:a2];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v3 removeListenerID:@"com.apple.Preferences" forService:0];

  v4 = [MEMORY[0x263F3BAD8] sharedInstance];
  [v4 removeListenerID:@"com.apple.Preferences" forService:1];

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, self, (CFNotificationName)*MEMORY[0x263EFFCC8], 0);
  v6 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v6, self, (CFNotificationName)*MEMORY[0x263F10438], 0);
  [(PSUIPasscodeLockController *)self setIsObservingDTOStatusChange:0];
  v7 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "DTO: Stopped observing status changes", buf, 2u);
  }

  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 removeObserver:self];

  nw_path_monitor_cancel((nw_path_monitor_t)self->_pathMonitor);
  v9.receiver = self;
  v9.super_class = (Class)PSUIPasscodeLockController;
  [(PSUIPasscodeLockController *)&v9 dealloc];
}

- (void)setupInternetAvailabilityMonitoring
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v4 = nw_path_evaluator_copy_path();
  nw_path_status_t status = nw_path_get_status(v4);

  if (status == nw_path_status_satisfied) {
    self->_isInternetReachable = 1;
  }
  v6 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithBool:self->_isInternetReachable];
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v7;
    _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "Internet status: at startup [%@]", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v8 = (OS_nw_path_monitor *)nw_path_monitor_create();
  pathMonitor = self->_pathMonitor;
  self->_pathMonitor = v8;

  v10 = self->_pathMonitor;
  v11 = MEMORY[0x263EF83A0];
  id v12 = MEMORY[0x263EF83A0];
  nw_path_monitor_set_queue(v10, v11);

  uint64_t v13 = self->_pathMonitor;
  update_handler[0] = MEMORY[0x263EF8330];
  update_handler[1] = 3221225472;
  update_handler[2] = __65__PSUIPasscodeLockController_setupInternetAvailabilityMonitoring__block_invoke;
  update_handler[3] = &unk_264E95DB8;
  objc_copyWeak(&v15, (id *)buf);
  nw_path_monitor_set_update_handler(v13, update_handler);
  nw_path_monitor_start((nw_path_monitor_t)self->_pathMonitor);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __65__PSUIPasscodeLockController_setupInternetAvailabilityMonitoring__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  nw_path_status_t status = nw_path_get_status(v3);

  if ([WeakRetained isInternetReachable] != (status == nw_path_status_satisfied))
  {
    [WeakRetained setIsInternetReachable:status == nw_path_status_satisfied];
    v6 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "isInternetReachable"));
      int v8 = 138412290;
      objc_super v9 = v7;
      _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "Internet status: changed to [%@]", (uint8_t *)&v8, 0xCu);
    }
    [WeakRetained reloadSpecifiers];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "Passcode Pane loaded", v5, 2u);
  }

  [(PSUIPasscodeLockController *)self provideNavigationDonations];
}

- (void)provideNavigationDonations
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Passcode"];
  id v4 = objc_alloc(MEMORY[0x263F08DB0]);
  if (PSIsPearlAvailable()) {
    v5 = @"Face ID & Passcode";
  }
  else {
    v5 = @"Touch ID & Passcode";
  }
  v6 = [MEMORY[0x263EFF960] currentLocale];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v8 = [v7 bundleURL];
  objc_super v9 = (void *)[v4 initWithKey:v5 table:0 locale:v6 bundleURL:v8];

  if (PSIsPearlAvailable()) {
    uint64_t v10 = @"com.apple.graphic-icon.face-id";
  }
  else {
    uint64_t v10 = @"com.apple.graphic-icon.touch-id";
  }
  [(PSUIPasscodeLockController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:v10 title:v9 localizedNavigationComponents:MEMORY[0x263EFFA68] deepLink:v3];
  v11 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = v3;
    _os_log_impl(&dword_23D33A000, v11, OS_LOG_TYPE_DEFAULT, "Provided navigation donations for %@", (uint8_t *)&v12, 0xCu);
  }
}

- (id)psCellForSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [(PSUIPasscodeLockController *)self table];
  v6 = [(PSUIPasscodeLockController *)self indexPathForSpecifier:v4];

  v7 = [(PSUIPasscodeLockController *)self tableView:v5 cellForRowAtIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)refreshCellForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUIPasscodeLockController *)self psCellForSpecifier:v4];
  [v5 refreshCellContentsWithSpecifier:v4];
}

- (BOOL)isPasscodeSet
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isPasscodeSet];

  return v3;
}

- (int64_t)fingerprintCount
{
  if (!PSSupportsMesa()) {
    return 0;
  }
  v2 = +[PSUIBiometrics identities];
  int64_t v3 = [v2 count];

  return v3;
}

- (void)_showDeleteSavedFingerprintsAlert
{
  [(PSUIPasscodeLockController *)self fingerprintCount];
  int64_t v3 = (void *)MEMORY[0x263F82418];
  id v4 = PSLocalizableMesaStringForKey();
  id v5 = PSLocalizableMesaStringForKey();
  v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  v7 = (void *)MEMORY[0x263F82400];
  id v8 = PSLocalizableMesaStringForKey();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke;
  v14[3] = &unk_264E953D0;
  v14[4] = self;
  objc_super v9 = [v7 actionWithTitle:v8 style:1 handler:v14];
  [v6 addAction:v9];

  uint64_t v10 = (void *)MEMORY[0x263F82400];
  v11 = PSLocalizableMesaStringForKey();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke_2;
  v13[3] = &unk_264E953D0;
  v13[4] = self;
  int v12 = [v10 actionWithTitle:v11 style:0 handler:v13];
  [v6 addAction:v12];

  [(PSUIPasscodeLockController *)self presentViewController:v6 animated:1 completion:0];
}

void __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 specifierForID:@"PASSCODE_OFF"];
  [v1 showPINSheet:v2 allowOptionsButton:1];
}

void __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF8C0]);
  int64_t v3 = +[PSUIBiometrics sharedInstance];
  id v4 = [v3 identitiesForIdentityType:1];
  id v5 = (void *)[v2 initWithArray:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
        int v12 = +[PSUIBiometrics sharedInstance];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke_3;
        v15[3] = &unk_264E95810;
        v15[4] = *(void *)(a1 + 32);
        [v12 removeIdentity:v11 completion:v15];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = [v13 specifierForID:@"PASSCODE_OFF"];
  [v13 showPINSheet:v14 allowOptionsButton:1];
}

uint64_t __63__PSUIPasscodeLockController__showDeleteSavedFingerprintsAlert__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)updatePasscodeChangesGroupFooterToSpecifier:(id)a3 showDefault:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (v4
    && ([MEMORY[0x263F82670] currentDevice],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 userInterfaceIdiom],
        v5,
        v6 == 6))
  {
    [v9 removePropertyForKey:*MEMORY[0x263F600F8]];
  }
  else
  {
    uint64_t v7 = SFLocalizableWAPIStringKeyForKey();
    uint64_t v8 = PSUI_LocalizedStringForPasscodeLock(v7);
    [v9 setProperty:v8 forKey:*MEMORY[0x263F600F8]];
  }
}

- (BOOL)shouldDisplayTurnOffPasscodeAlertMessage
{
  return 1;
}

- (id)turnOffPasscodeAlertMessage
{
  int64_t v3 = [NSString string];
  BOOL v4 = [(PSUIPasscodeLockController *)self getTurnOffAlertDescriptionForFeatureProtectedApps];
  id v5 = [(PSUIPasscodeLockController *)self getTurnOffAlertDescriptionForOtherFeatures];
  uint64_t v6 = v5;
  if (!v4)
  {
    if (v5) {
      uint64_t v8 = v5;
    }
    else {
      uint64_t v8 = &stru_26F10E0E8;
    }
    uint64_t v7 = v3;
    goto LABEL_8;
  }
  uint64_t v7 = v4;

  if (v6)
  {
    uint64_t v8 = [(__CFString *)v7 stringByAppendingFormat:@"\n\n%@", v6];
LABEL_8:

    uint64_t v7 = v8;
  }
  id v9 = v7;

  return v9;
}

- (id)getTurnOffAlertDescriptionForFeatureProtectedApps
{
  if (PSIsPearlAvailable()) {
    id v2 = @"TURN_OFF_PASSCODE_AFFECTS_PROTECTED_APPS_FACE_ID";
  }
  else {
    id v2 = @"TURN_OFF_PASSCODE_AFFECTS_PROTECTED_APPS_TOUCH_ID";
  }
  int64_t v3 = PSUI_LocalizedStringForPasscodeLock(v2);
  return v3;
}

- (id)getTurnOffAlertDescriptionForOtherFeatures
{
  int v3 = PSHasStockholmPass();
  BOOL canUnlockWatch = self->_canUnlockWatch;
  if ((v3 & 1) == 0 && !self->_canUnlockWatch)
  {
    id v5 = 0;
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  uint64_t v7 = PSPreferencesFrameworkBundle();
  uint64_t v8 = [MEMORY[0x263F089D8] stringWithString:@"TURN_OFF_PASSCODE_LOCK_CONFIRMATION"];
  uint64_t v6 = v8;
  if (v3)
  {
    [v8 appendString:@"_STOCKHOLM"];
    id v9 = @"Payment_Prefs";
    if (!canUnlockWatch) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v9 = @"Passcode Lock";
  if (canUnlockWatch)
  {
LABEL_8:
    [v6 appendString:@"_WATCH"];
    id v9 = @"Watch_Prefs";
  }
LABEL_9:
  if (v6)
  {
    id v5 = [v7 localizedStringForKey:v6 value:&stru_26F10E0E8 table:v9];
    if (PSUsedByHSA2Account())
    {
      uint64_t v10 = PSUI_RebrandedKeyForAppleID(@"TURN_OFF_PASSCODE_HSA2_ENDING");
      uint64_t v11 = PSUI_LocalizedStringForPasscodeLock(v10);
      uint64_t v12 = [v5 stringByAppendingString:v11];

      id v5 = (void *)v12;
    }
  }
  else
  {
    id v5 = 0;
  }

LABEL_14:
  return v5;
}

- (BOOL)shouldPresentAppleIDAuthenticationForTogglingPasscode
{
  char v2 = PSUsedByHSA2Account();
  return v2 | PSUsedByManagedAccount();
}

- (void)togglePasscode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F60320];
  uint64_t v6 = [v4 propertyForKey:*MEMORY[0x263F60320]];
  if ([v6 intValue])
  {
  }
  else
  {
    uint64_t v12 = [(PSUIPasscodeLockController *)self fingerprintCount];

    if (v12 >= 1)
    {
      [(PSUIPasscodeLockController *)self _showDeleteSavedFingerprintsAlert];
      goto LABEL_10;
    }
  }
  uint64_t v7 = [v4 propertyForKey:v5];
  int v8 = [v7 intValue];

  if (v8 == 1)
  {
    id v9 = [(PSUIPasscodeLockController *)self dtoController];
    int v10 = [v9 isRatchetEnabled];

    if (v10)
    {
      objc_initWeak(&location, self);
      uint64_t v11 = [(PSUIPasscodeLockController *)self dtoController];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __45__PSUIPasscodeLockController_togglePasscode___block_invoke;
      v13[3] = &unk_264E95520;
      objc_copyWeak(&v15, &location);
      id v14 = v4;
      [v11 gateWithRatchetForOperation:7 forPresentingVC:self completion:v13];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PSUIPasscodeLockController *)self proceedToTurnOffPasscode:v4];
    }
  }
  else
  {
    [(PSUIPasscodeLockController *)self showPINSheet:v4 allowOptionsButton:1];
  }
LABEL_10:
}

void __45__PSUIPasscodeLockController_togglePasscode___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    char v2 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __45__PSUIPasscodeLockController_togglePasscode___block_invoke_cold_1();
    }
  }
  else
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __45__PSUIPasscodeLockController_togglePasscode___block_invoke_174;
    v4[3] = &unk_264E95380;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v6);
  }
}

void __45__PSUIPasscodeLockController_togglePasscode___block_invoke_174(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = PSUILogForCategory(1uLL);
  id v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "Turn Off Passcode: Proceeding", v5, 2u);
    }

    [WeakRetained proceedToTurnOffPasscode:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __45__PSUIPasscodeLockController_togglePasscode___block_invoke_174_cold_1();
    }
  }
}

- (void)proceedToTurnOffPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUIPasscodeLockController *)self turnOffPasscodeAlertMessage];
  objc_initWeak(&location, self);
  id v6 = (void *)MEMORY[0x263F82418];
  uint64_t v7 = PSUI_LocalizedStringForPasscodeLock(@"TURN_OFF_PASSCODE_LOCK_QUESTION");
  int v8 = [v6 alertControllerWithTitle:v7 message:v5 preferredStyle:1];

  id v9 = (void *)MEMORY[0x263F82400];
  int v10 = PSUI_LocalizedStringForPasscodeLock(@"CANCEL");
  uint64_t v11 = [v9 actionWithTitle:v10 style:1 handler:0];
  [v8 addAction:v11];

  uint64_t v12 = (void *)MEMORY[0x263F82400];
  uint64_t v13 = PSUI_LocalizedStringForPasscodeLock(@"TURN_OFF");
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  long long v17 = __55__PSUIPasscodeLockController_proceedToTurnOffPasscode___block_invoke;
  long long v18 = &unk_264E95DE0;
  objc_copyWeak(&v19, &location);
  id v14 = [v12 actionWithTitle:v13 style:2 handler:&v15];
  objc_msgSend(v8, "addAction:", v14, v15, v16, v17, v18);

  [(PSUIPasscodeLockController *)self presentViewController:v8 animated:1 completion:0];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __55__PSUIPasscodeLockController_proceedToTurnOffPasscode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained shouldPresentAppleIDAuthenticationForTogglingPasscode])
  {
    [WeakRetained presentAppleIDAuthenticationController];
  }
  else
  {
    v1 = [WeakRetained specifierForID:@"PASSCODE_OFF"];
    [WeakRetained showPINSheet:v1];
  }
}

- (void)presentAppleIDAuthenticationController
{
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2050000000;
  int v3 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass;
  uint64_t v31 = getAKAppleIDAuthenticationInAppContextClass_softClass;
  if (!getAKAppleIDAuthenticationInAppContextClass_softClass)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    objc_super v25 = __getAKAppleIDAuthenticationInAppContextClass_block_invoke;
    v26 = &unk_264E95420;
    uint64_t v27 = &v28;
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke((uint64_t)&v23);
    int v3 = (void *)v29[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v28, 8);
  id v5 = objc_alloc_init(v4);
  id v6 = objc_alloc_init(MEMORY[0x263EFB210]);
  uint64_t v7 = objc_msgSend(v6, "aa_primaryAppleAccount");
  int v8 = [v7 username];
  [v5 setUsername:v8];

  id v9 = objc_msgSend(v7, "aa_personID");
  [v5 setDSID:v9];

  int v10 = objc_msgSend(v7, "aa_altDSID");
  [v5 setAltDSID:v10];

  [v5 setAuthenticationType:2];
  [v5 setPresentingViewController:self];
  [v5 setIsUsernameEditable:0];
  uint64_t v11 = PSUI_LocalizedStringForPasscodeLock(@"TURN_OFF");
  [v5 setDefaultButtonString:v11];

  uint64_t v12 = NSString;
  uint64_t v13 = PSUI_RebrandedKeyForAppleID(@"TURN_OFF_PASSCODE_HSA2_AUTH_PROMPT");
  id v14 = PSUI_LocalizedStringForPasscodeLock(v13);
  uint64_t v15 = [v7 username];
  uint64_t v16 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v15);
  [v5 setReason:v16];

  [v5 setEnablePasscodeAuth:0];
  objc_initWeak(&location, self);
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2050000000;
  long long v17 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
  uint64_t v31 = getAKAppleIDAuthenticationControllerClass_softClass;
  if (!getAKAppleIDAuthenticationControllerClass_softClass)
  {
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    objc_super v25 = __getAKAppleIDAuthenticationControllerClass_block_invoke;
    v26 = &unk_264E95420;
    uint64_t v27 = &v28;
    __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)&v23);
    long long v17 = (void *)v29[3];
  }
  long long v18 = v17;
  _Block_object_dispose(&v28, 8);
  id v19 = objc_alloc_init(v18);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __68__PSUIPasscodeLockController_presentAppleIDAuthenticationController__block_invoke;
  v20[3] = &unk_264E95E08;
  objc_copyWeak(&v21, &location);
  [v19 authenticateWithContext:v5 completion:v20];
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

void __68__PSUIPasscodeLockController_presentAppleIDAuthenticationController__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    block[7] = v3;
    block[8] = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__PSUIPasscodeLockController_presentAppleIDAuthenticationController__block_invoke_2;
    block[3] = &unk_264E952E0;
    block[4] = WeakRetained;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __68__PSUIPasscodeLockController_presentAppleIDAuthenticationController__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 specifierForID:@"PASSCODE_OFF"];
  [v1 showPINSheet:v2];
}

- (void)showPINSheet:(id)a3
{
  id v4 = a3;
  if ([(PSUIPasscodeLockController *)self _shouldUseLocalAuthenticationBasedPasscodeFlowForPINSheetRequest:v4])
  {
    [(PSUIPasscodeLockController *)self _showLocalAuthenticationPINSheet:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PSUIPasscodeLockController;
    [(PSUIPasscodeLockController *)&v5 showPINSheet:v4 allowOptionsButton:1];
  }
}

- (void)showPINSheet:(id)a3 allowOptionsButton:(BOOL)a4
{
  id v5 = a3;
  if ([(PSUIPasscodeLockController *)self _shouldUseLocalAuthenticationBasedPasscodeFlowForPINSheetRequest:v5])
  {
    [(PSUIPasscodeLockController *)self _showLocalAuthenticationPINSheet:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PSUIPasscodeLockController;
    [(PSUIPasscodeLockController *)&v6 showPINSheet:v5 allowOptionsButton:1];
  }
}

- (void)_showLocalAuthenticationPINSheet:(id)a3
{
  id v4 = [a3 propertyForKey:*MEMORY[0x263F60320]];
  int v5 = [v4 intValue];

  if (v5)
  {
    if (v5 == 1)
    {
      PSUI_LocalizedStringForPasscodeLock(@"PMREMOVE");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      -[PSUIPasscodeLockController showLocalAuthenticationPasscodeRemoveFlowFromPresentingController:title:passcodePrompt:withCompletion:](self, "showLocalAuthenticationPasscodeRemoveFlowFromPresentingController:title:passcodePrompt:withCompletion:", self);
      goto LABEL_8;
    }
    if (v5 != 2) {
      return;
    }
    objc_super v6 = @"PMCHANGE";
  }
  else
  {
    objc_super v6 = @"PMSET";
  }
  PSUI_LocalizedStringForPasscodeLock(v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUIPasscodeLockController showLocalAuthenticationPasscodeChangeFlowFromPresentingController:title:passcodePrompt:withCompletion:](self, "showLocalAuthenticationPasscodeChangeFlowFromPresentingController:title:passcodePrompt:withCompletion:", self);
LABEL_8:
}

- (BOOL)_shouldUseLocalAuthenticationBasedPasscodeFlowForPINSheetRequest:(id)a3
{
  id v4 = [a3 propertyForKey:*MEMORY[0x263F60320]];
  int v5 = [v4 intValue];

  if ((v5 & 0xFFFFFFFD) != 0)
  {
    if (v5 == 1)
    {
      return [(PSUIPasscodeLockController *)self shouldUseLocalAuthenticationBasedPasscodeFlowForRemovePasscodeRequests];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return [(PSUIPasscodeLockController *)self shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests];
  }
}

- (BOOL)shouldUseLocalAuthenticationBasedPasscodeFlowForChangePasscodeRequests
{
  return 1;
}

- (BOOL)shouldUseLocalAuthenticationBasedPasscodeFlowForRemovePasscodeRequests
{
  return 1;
}

- (void)showLocalAuthenticationPasscodeRemoveFlowFromPresentingController:(id)a3 title:(id)a4 passcodePrompt:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263F10508]);
  [(PSUIPasscodeLockController *)self set_passcodeRemovalService:v14];

  objc_initWeak(&location, self);
  uint64_t v15 = (void *)MEMORY[0x263F58190];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke;
  v28[3] = &unk_264E95E30;
  objc_copyWeak(&v32, &location);
  id v16 = v11;
  id v29 = v16;
  id v17 = v12;
  id v30 = v17;
  id v18 = v10;
  id v31 = v18;
  id v19 = [v15 lazyFutureWithBlock:v28];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_206;
  v26[3] = &unk_264E95E58;
  objc_copyWeak(&v27, &location);
  id v20 = (id)[v19 addSuccessBlock:v26];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2;
  v23[3] = &unk_264E95E80;
  objc_copyWeak(&v25, &location);
  id v21 = v13;
  id v24 = v21;
  id v22 = (id)[v19 addCompletionBlock:v23];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_super v6 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [WeakRetained _passcodeRemovalService];
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    int v14 = 138543874;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "Starting Passcode Removal Service (%{public}@) with title '%{public}@' and prompt '%{public}@'.", (uint8_t *)&v14, 0x20u);
  }
  id v10 = objc_alloc_init(MEMORY[0x263F10510]);
  [v10 setTitle:a1[4]];
  [v10 setPasscodePrompt:a1[5]];
  id v11 = [WeakRetained _passcodeRemovalService];
  uint64_t v12 = a1[6];
  id v13 = [v4 errorOnlyCompletionHandlerAdapter];

  [v11 startInParentVC:v12 options:v10 completion:v13];
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_206(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didUpdatePasscode:0];
  [WeakRetained showKeychainAlert];
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v6 = PSUILogForCategory(1uLL);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2_cold_1(WeakRetained);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [WeakRetained _passcodeRemovalService];
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Successfully completed passcode removal request (%{public}@).", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);
  }
  objc_msgSend(WeakRetained, "set_passcodeRemovalService:", 0);
}

- (void)showLocalAuthenticationPasscodeChangeFlowFromPresentingController:(id)a3 title:(id)a4 passcodePrompt:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263F104F8]);
  [(PSUIPasscodeLockController *)self set_passcodeChangeService:v14];

  uint64_t v15 = objc_alloc_init(PasscodeChangeNavigationController);
  [(PasscodeChangeNavigationController *)v15 setCustomDelegate:self];
  objc_initWeak(location, self);
  __int16 v16 = (void *)MEMORY[0x263F58190];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke;
  v41[3] = &unk_264E95E30;
  objc_copyWeak(&v45, location);
  id v17 = v11;
  id v42 = v17;
  id v18 = v12;
  id v43 = v18;
  uint64_t v19 = v15;
  v44 = v19;
  uint64_t v20 = [v16 lazyFutureWithBlock:v41];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_212;
  v39[3] = &unk_264E95ED0;
  objc_copyWeak(&v40, location);
  id v21 = [v20 flatMap:v39];
  id v29 = v17;
  id v22 = [v21 flatMap:&__block_literal_global_5];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_216;
  v37[3] = &unk_264E95F18;
  objc_copyWeak(&v38, location);
  uint64_t v23 = [v22 flatMap:v37];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_221;
  v32[3] = &unk_264E95F40;
  objc_copyWeak(&v36, location);
  id v24 = v10;
  id v33 = v24;
  id v25 = v19;
  v34 = v25;
  id v26 = v13;
  id v35 = v26;
  id v27 = (id)[v23 addCompletionBlock:v32];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_223;
  v30[3] = &unk_264E95F68;
  objc_copyWeak(&v31, location);
  id v28 = (id)[v22 addCompletionBlock:v30];
  objc_destroyWeak(&v31);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v45);
  objc_destroyWeak(location);
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  objc_super v6 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [WeakRetained _passcodeChangeService];
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    int v14 = 138543874;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "Starting Passcode Change Service (%{public}@) with title '%{public}@' and prompt '%{public}@'.", (uint8_t *)&v14, 0x20u);
  }
  id v10 = objc_alloc_init(MEMORY[0x263F10500]);
  [v10 setTitle:a1[4]];
  [v10 setPasscodePrompt:a1[5]];
  id v11 = [WeakRetained _passcodeChangeService];
  uint64_t v12 = a1[6];
  id v13 = [v4 completionHandlerAdapter];

  [v11 startInParentVC:v12 options:v10 completion:v13];
}

id __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_212(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = (void *)MEMORY[0x263F58190];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2;
  v9[3] = &unk_264E95EA8;
  v9[4] = WeakRetained;
  id v10 = v3;
  id v6 = v3;
  id v7 = [v5 lazyFutureWithBlock:v9];

  return v7;
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [*(id *)(a1 + 32) _passcodeChangeService];
    int v8 = 138543362;
    uint64_t v9 = v5;
    _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "Passcode Change Service (%{public}@) completed, extracting credentials.", (uint8_t *)&v8, 0xCu);
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = [v3 completionHandlerAdapter];

  [v6 credentialOfType:-9 reply:v7];
}

id __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_214(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "Extracted Credentials, continuing to update system state.", v8, 2u);
  }

  id v4 = (void *)MEMORY[0x263F58190];
  int v5 = (void *)[[NSString alloc] initWithData:v2 encoding:4];

  id v6 = [v4 futureWithResult:v5];

  return v6;
}

id __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_216(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Extracted Credentials, Updating Keychain State.", buf, 2u);
  }

  id v6 = (void *)MEMORY[0x263F58190];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_217;
  v10[3] = &unk_264E95EA8;
  id v11 = v3;
  id v12 = WeakRetained;
  id v7 = v3;
  int v8 = [v6 lazyFutureWithBlock:v10];

  return v8;
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_217(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F5FBB0] sharedManager];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2_219;
  v8[3] = &unk_264E95810;
  id v9 = v3;
  id v7 = v3;
  [v4 promptForDevicePasscodeChangeToPasscode:v6 overController:v5 completion:v8];
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2_219(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_3;
  v6[3] = &unk_264E953A8;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = PSUILogForCategory(1uLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "Updating Keychain State failed with error '%{public}@'.", (uint8_t *)&v7, 0xCu);
    }

    return [*(id *)(a1 + 40) finishWithError:*(void *)(a1 + 32)];
  }
  else
  {
    if (v4)
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "Updating Keychain State succeeded.", (uint8_t *)&v7, 2u);
    }

    return [*(id *)(a1 + 40) finishWithNoResult];
  }
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_221(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v6 = PSUILogForCategory(1uLL);
  int v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_221_cold_1(WeakRetained);
    }

    [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [WeakRetained _passcodeChangeService];
      int v10 = 138543362;
      id v11 = v8;
      _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "Successfully completed passcode change request (%{public}@).", (uint8_t *)&v10, 0xCu);
    }
    [MEMORY[0x263F3A3A0] startReviewDeviceAccessWithPresentingViewController:*(void *)(a1 + 40)];
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);
  }
  objc_msgSend(WeakRetained, "set_passcodeChangeService:", 0);
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_223(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (v6)
  {
    uint64_t v9 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_223_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    [WeakRetained _didUpdatePasscode:v5];
  }
}

- (void)navigationControllerDidPushFirstController:(id)a3
{
  id v4 = a3;
  id v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Passcode Change Service: Pushed first controller, ready to present", v6, 2u);
  }

  [(PSUIPasscodeLockController *)self presentViewController:v4 animated:1 completion:&__block_literal_global_226];
}

+ (int64_t)passcodeGracePeriod
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  id v3 = [v2 effectiveValueForSetting:*MEMORY[0x263F539E0]];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)graceValue:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", a3);
  int64_t v4 = [v3 effectiveValueForSetting:*MEMORY[0x263F539E0]];

  return v4;
}

- (void)setGraceValue:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [(PSUIPasscodeLockController *)self specifier];
  uint64_t v7 = [v6 propertyForKey:*MEMORY[0x263F60270]];
  uint64_t v8 = (void *)v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v9 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[PSUIPasscodeLockController setGraceValue:specifier:]();
  }

  if (!v8)
  {
LABEL_7:
    uint64_t v10 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PSUIPasscodeLockController setGraceValue:specifier:]();
    }
  }
LABEL_10:
  uint64_t v11 = [MEMORY[0x263F53C50] sharedConnection];
  [v11 setValue:v5 forSetting:*MEMORY[0x263F539E0] passcode:v8];
}

- (void)updateGracePeriodSpecifier
{
  id v3 = [(PSUIPasscodeLockController *)self specifierForID:@"PASSCODE_REQ"];
  [(PSUIPasscodeLockController *)self _updateGracePeriodForSpecifier:v3];
  [(PSUIPasscodeLockController *)self reloadSpecifier:v3];
}

- (void)_updateGracePeriodForSpecifier:(id)a3
{
  id v25 = a3;
  uint64_t v4 = [MEMORY[0x263F53C50] sharedConnection];
  id v5 = [(id)v4 effectiveParametersForValueSetting:*MEMORY[0x263F539E0]];
  id v6 = [v5 objectForKey:*MEMORY[0x263F53B50]];
  int v7 = [v6 intValue];

  LOBYTE(v4) = PSSupportsMesa();
  int v8 = PSIsPearlAvailable();
  if ((v4 & 1) != 0 || v8)
  {
    uint64_t v9 = +[PSUIBiometrics identities];
    if ([v9 count])
    {
      uint64_t v10 = +[PSUIBiometrics sharedInstance];
      int v11 = [v10 isFingerprintUnlockAllowed];

      if (v11) {
        int v7 = 0;
      }
    }
    else
    {
    }
  }
  uint64_t v12 = (void *)MEMORY[0x263EFF980];
  uint64_t v13 = [v25 propertyForKey:@"gracePeriodValues"];
  uint64_t v14 = [v12 arrayWithArray:v13];

  uint64_t v15 = (void *)MEMORY[0x263EFF9A0];
  __int16 v16 = [v25 propertyForKey:@"gracePeriodShortTitles"];
  uint64_t v17 = [v15 dictionaryWithDictionary:v16];

  __int16 v18 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v19 = [v25 propertyForKey:@"gracePeriodTitles"];
  uint64_t v20 = [v18 dictionaryWithDictionary:v19];

  uint64_t v21 = [v14 count];
  if (v21 >= 1)
  {
    unint64_t v22 = v21 + 1;
    do
    {
      uint64_t v23 = [v14 objectAtIndex:v22 - 2];
      if ((int)[v23 intValue] > v7)
      {
        [v17 removeObjectForKey:v23];
        [v20 removeObjectForKey:v23];
        [v14 removeObjectAtIndex:v22 - 2];
      }

      --v22;
    }
    while (v22 > 1);
  }
  [v25 setValues:v14];
  [v25 setTitleDictionary:v20];
  [v25 setShortTitleDictionary:v17];
  if ((unint64_t)[v14 count] < 2)
  {
    [v25 removePropertyForKey:*MEMORY[0x263F60280]];
  }
  else
  {
    id v24 = PSUI_LocalizedStringForPasscodeLock(@"SECURITY_MSG");
    [v25 setProperty:v24 forKey:*MEMORY[0x263F60280]];
  }
  [(PSUIPasscodeLockController *)self _localizeGracePeriodTitlesForSpecifier:v25];
}

- (void)_localizeGracePeriodTitlesForSpecifier:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((_localizeGracePeriodTitlesForSpecifier__sSubscribed & 1) == 0)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)apple_numbers_changed_notification, (CFStringRef)*MEMORY[0x263EFFCC8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    _localizeGracePeriodTitlesForSpecifier__sSubscribed = 1;
  }
  id v6 = [v4 values];
  int v7 = [v4 titleDictionary];
  id v33 = (void *)[v7 mutableCopy];

  id v30 = v4;
  int v8 = [v4 shortTitleDictionary];
  id v32 = (void *)[v8 mutableCopy];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  uint64_t v35 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        unsigned int v11 = [v10 intValue];
        if ((int)v11 >= 1)
        {
          if (v11 > 0xE0F)
          {
            unint64_t v12 = v11 / 0xE10uLL;
            if ((unint64_t)v11 - 3600 >= 0xE10) {
              uint64_t v15 = @"%ld_HOURS";
            }
            else {
              uint64_t v15 = @"%ld_HOUR";
            }
            if ((unint64_t)v11 - 3600 >= 0xE10) {
              __int16 v16 = @"%ld_HOURS_SHORT";
            }
            else {
              __int16 v16 = @"%ld_HOUR_SHORT";
            }
            uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v15, v12);
            objc_msgSend(NSString, "stringWithFormat:", v16, v12);
          }
          else
          {
            unint64_t v12 = (unsigned __int16)v11 / 0x3Cu;
            if ((unint64_t)v11 - 60 >= 0x3C) {
              uint64_t v13 = @"%ld_MINUTES";
            }
            else {
              uint64_t v13 = @"%ld_MINUTE";
            }
            uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v13, v12);
            objc_msgSend(NSString, "stringWithFormat:", @"%ld_MIN", v12);
          uint64_t v17 = };
          id v36 = v14;
          __int16 v18 = NSString;
          uint64_t v19 = PSUI_LocalizedStringForPasscodeLock(v14);
          uint64_t v20 = (void *)MEMORY[0x263F08A30];
          uint64_t v21 = [NSNumber numberWithInteger:v12];
          unint64_t v22 = [v20 localizedStringFromNumber:v21 numberStyle:1];
          uint64_t v23 = objc_msgSend(v18, "stringWithFormat:", v19, v22);
          [v33 setObject:v23 forKey:v10];

          id v24 = NSString;
          id v25 = PSUI_LocalizedStringForPasscodeLock(v17);
          id v26 = (void *)MEMORY[0x263F08A30];
          id v27 = [NSNumber numberWithInteger:v12];
          id v28 = [v26 localizedStringFromNumber:v27 numberStyle:1];
          id v29 = objc_msgSend(v24, "stringWithFormat:", v25, v28);
          [v32 setObject:v29 forKey:v10];
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v35);
  }

  [v30 setTitleDictionary:v33];
  [v30 setShortTitleDictionary:v32];
}

- (BOOL)gracePeriodPasscodeRecoveryAvailable
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 recoveryPasscodeAvailable];

  return v3;
}

- (void)gracePeriodClearRecoveryPasscode:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = PSUI_LocalizedStringForPasscodeLock(@"GRACE_PERIOD_CLEAR_PASSCODE_ALERT_TITLE");
  int v7 = PSUI_LocalizedStringForPasscodeLock(@"GRACE_PERIOD_CLEAR_PASSCODE_ALERT_MESSAGE");
  int v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  uint64_t v9 = (void *)MEMORY[0x263F82400];
  uint64_t v10 = PSUI_LocalizedStringForPasscodeLock(@"GRACE_PERIOD_CLEAR_PASSCODE_ALERT_TURN_OFF");
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  __int16 v18 = __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke;
  uint64_t v19 = &unk_264E954F8;
  id v20 = v4;
  uint64_t v21 = self;
  id v11 = v4;
  unint64_t v12 = [v9 actionWithTitle:v10 style:2 handler:&v16];
  objc_msgSend(v8, "addAction:", v12, v16, v17, v18, v19);

  uint64_t v13 = (void *)MEMORY[0x263F82400];
  uint64_t v14 = PSUI_LocalizedStringForPasscodeLock(@"CANCEL");
  uint64_t v15 = [v13 actionWithTitle:v14 style:1 handler:&__block_literal_global_280];
  [v8 addAction:v15];

  [(PSUIPasscodeLockController *)self presentViewController:v8 animated:1 completion:0];
}

void __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  [*(id *)(a1 + 40) reloadSpecifier:*(void *)(a1 + 32)];
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_2;
  block[3] = &unk_264E953A8;
  int8x16_t v4 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  dispatch_async(v2, block);
}

void __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  id v3 = [v2 clearRecoveryPasscode];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_3;
  block[3] = &unk_264E95F90;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = PSUILogForCategory(1uLL);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_3_cold_1(v2, v5, v6, v7, v8, v9, v10, v11);
    }

    [*(id *)(a1 + 48) setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
    [*(id *)(a1 + 40) reloadSpecifier:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "User decided to clear recovery passcode.", v14, 2u);
    }

    unint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = [v12 specifierForID:@"PASSCODE_GRACE_PERIOD_GROUP"];
    [v12 removeSpecifier:v13 animated:1];
  }
}

void __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_278()
{
  v0 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23D33A000, v0, OS_LOG_TYPE_DEFAULT, "User canceled for clear recovery passcode.", v1, 2u);
  }
}

- (void)openGracePeriodPasscodeRecoveryHelpLink
{
  id v5 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v2 = NSURL;
  uint64_t v3 = PSUI_LocalizedStringForPasscodeLock(@"PASSCODE_GRACE_PERIOD_LEARN_MORE_LINK");
  uint64_t v4 = [v2 URLWithString:v3];
  [v5 openURL:v4 withCompletionHandler:&__block_literal_global_286];
}

void __69__PSUIPasscodeLockController_openGracePeriodPasscodeRecoveryHelpLink__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __69__PSUIPasscodeLockController_openGracePeriodPasscodeRecoveryHelpLink__block_invoke_cold_1();
    }
  }
}

- (void)addGracePeriodPasscodeRecoveryFooterToSpecifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F53C50] sharedConnection];
  int v6 = [v5 isPasscodeRecoverySupported];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v8 = [v7 recoveryPasscodeExpiryDate];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263EFF910] date];
      if ([v9 compare:v8] == 1)
      {
        uint64_t v10 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[PSUIPasscodeLockController addGracePeriodPasscodeRecoveryFooterToSpecifier:]();
        }
      }
      else
      {
        [v8 timeIntervalSinceNow];
        double v12 = v11;
        uint64_t v10 = objc_alloc_init(MEMORY[0x263F08780]);
        [v10 setUnitsStyle:5];
        [v10 setAllowedUnits:96];
        [v10 setZeroFormattingBehavior:14];
        uint64_t v13 = [v10 stringFromTimeInterval:v12];
        uint64_t v14 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v27 = v8;
          __int16 v28 = 2112;
          uint64_t v29 = v13;
          _os_log_impl(&dword_23D33A000, v14, OS_LOG_TYPE_DEFAULT, "Recovery Expiry date [%@] time remaining to expire [%@]", buf, 0x16u);
        }

        uint64_t v15 = NSString;
        uint64_t v16 = PSUI_LocalizedStringForPasscodeLock(@"PASSCODE_RECOVERY_TEXT");
        id v25 = (void *)v13;
        uint64_t v17 = objc_msgSend(v15, "stringWithFormat:", v16, v13);

        __int16 v18 = [MEMORY[0x263F53C50] sharedConnection];
        LODWORD(v16) = [v18 isPasscodeRecoveryRestricted];

        if (v16)
        {
          [v4 setProperty:v17 forKey:*MEMORY[0x263F600F8]];
        }
        else
        {
          uint64_t v19 = PSUI_LocalizedStringForPasscodeLock(@"PASSCODE_RECOVERY_LEARN_MORE_TEXT");
          id v20 = [NSString stringWithFormat:@"%@ %@", v17, v19];

          uint64_t v21 = (objc_class *)objc_opt_class();
          unint64_t v22 = NSStringFromClass(v21);
          [v4 setProperty:v22 forKey:*MEMORY[0x263F600C0]];

          [v4 setProperty:v20 forKey:*MEMORY[0x263F600E8]];
          v31.id location = [v20 rangeOfString:v19];
          uint64_t v23 = NSStringFromRange(v31);
          [v4 setProperty:v23 forKey:*MEMORY[0x263F600D0]];

          id v24 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
          [v4 setProperty:v24 forKey:*MEMORY[0x263F600E0]];

          [v4 setProperty:@"openGracePeriodPasscodeRecoveryHelpLink" forKey:*MEMORY[0x263F600C8]];
          uint64_t v17 = v20;
        }
      }
    }
    else
    {
      uint64_t v9 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PSUIPasscodeLockController addGracePeriodPasscodeRecoveryFooterToSpecifier:]();
      }
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)PSUIPasscodeLockController;
  id v6 = a4;
  uint64_t v7 = [(PSUIPasscodeLockController *)&v16 tableView:a3 cellForRowAtIndexPath:v6];
  uint64_t v8 = -[PSUIPasscodeLockController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v16.receiver, v16.super_class);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v8 identifier];
    int v10 = [v9 isEqualToString:@"TURN_OFF_PASSCODE_RECOVERY"];

    if (v10)
    {
      id v11 = v7;
      if ([v11 type] == 13)
      {
        double v12 = [MEMORY[0x263F825C8] redColor];
        uint64_t v13 = [v11 textLabel];
        [v13 setTextColor:v12];

        goto LABEL_7;
      }
    }
  }
  id v14 = v7;
LABEL_7:

  return v7;
}

- (void)scrollToStolenDeviceProtection
{
  uint64_t v3 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "Scrolling and highlighting: Stolen Device Protection", v5, 2u);
  }

  id v4 = [(PSUIPasscodeLockController *)self specifierForID:@"DTO_STATUS_LABEL_ID"];
  [(PSUIPasscodeLockController *)self _scrollToSpecifierWithID:@"DTO_STATUS_LABEL_ID" animated:1];
  [(PSUIPasscodeLockController *)self selectRowForSpecifier:v4];
}

- (void)registerObserverAndHandlerForDTOStatusChanges
{
  if (![(PSUIPasscodeLockController *)self isObservingDTOStatusChange])
  {
    uint64_t v3 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "DTO: Start observing status changes", v5, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)dtoStatusChangedNotification, (CFStringRef)*MEMORY[0x263F10438], 0, (CFNotificationSuspensionBehavior)1028);
    [(PSUIPasscodeLockController *)self setIsObservingDTOStatusChange:1];
  }
}

- (void)handleDTOStatusChanged
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __52__PSUIPasscodeLockController_handleDTOStatusChanged__block_invoke;
  v2[3] = &unk_264E954A8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __52__PSUIPasscodeLockController_handleDTOStatusChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = PSUILogForCategory(1uLL);
  id v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "DTO: Reloading Status Label to updated status", v4, 2u);
    }

    [WeakRetained reloadSpecifierID:@"DTO_STATUS_LABEL_ID"];
    [WeakRetained updateDTOSpecifierIfNeeded];
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __52__PSUIPasscodeLockController_handleDTOStatusChanged__block_invoke_cold_1();
    }
  }
}

- (id)getDTOSpecifiers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v3 = [(id)objc_opt_class() isRatchetFeatureAvailable];
  id v4 = PSUILogForCategory(1uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = NSNumber;
      uint64_t v7 = [(PSUIPasscodeLockController *)self dtoController];
      uint64_t v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "isRatchetEnabled"));
      *(_DWORD *)buf = 138412290;
      objc_super v16 = v8;
      _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Available [Status: %@]: Adding specifiers", buf, 0xCu);
    }
    [(PSUIPasscodeLockController *)self registerObserverAndHandlerForDTOStatusChanges];
    id v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26F10E0E8 target:self set:0 get:0 detail:0 cell:0 edit:0];
    [v4 setIdentifier:@"DTO_GROUP_ID"];
    uint64_t v9 = (void *)MEMORY[0x263F5FC40];
    int v10 = PSUI_LocalizedStringForPasscodeDimpleKey(@"DTO_STATUS_LABEL_DESCRIPTION");
    id v11 = [v9 preferenceSpecifierNamed:v10 target:self set:0 get:sel_getDTOStatusForSpecifier_ detail:objc_opt_class() cell:2 edit:0];

    [v11 setIdentifier:@"DTO_STATUS_LABEL_ID"];
    [v11 setProperty:NSClassFromString(&cfstr_Psmultilinetab.isa) forKey:*MEMORY[0x263F5FFE0]];
    [(PSUIPasscodeLockController *)self updateDTOSpecifierIfNeeded];
    v14[0] = v4;
    v14[1] = v11;
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D33A000, v4, OS_LOG_TYPE_DEFAULT, "DTO: Unavailable: Skip adding specifiers", buf, 2u);
    }
    double v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (void)updateDTOSpecifierIfNeeded
{
  objc_initWeak(&location, self);
  char v3 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "DTO: Will perform preliminary checks", buf, 2u);
  }

  id v4 = [(PSUIPasscodeLockController *)self dtoController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke;
  v5[3] = &unk_264E95FE0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v4 performPreliminaryPreEnableDTOChecksWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke_2;
  v8[3] = &unk_264E95FB8;
  void v8[4] = WeakRetained;
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 32);
  char v11 = a2;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v2 = [*(id *)(a1 + 48) specifierForID:@"DTO_GROUP_ID"];
      [v2 setProperty:*(void *)(a1 + 40) forKey:*MEMORY[0x263F600F8]];
    }
    char v3 = [*(id *)(a1 + 48) specifierForID:@"DTO_STATUS_LABEL_ID"];
    id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    [v3 setProperty:v4 forKey:*MEMORY[0x263F600A8]];

    id v5 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "DTO: Failed preliminary checks - will be disabled", v6, 2u);
    }

    [*(id *)(a1 + 32) reloadSpecifierID:@"DTO_GROUP_ID"];
  }
  else
  {
    char v3 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke_2_cold_1();
    }
  }
}

- (id)getDTOStatusForSpecifier:(id)a3
{
  char v3 = [(PSUIPasscodeLockController *)self dtoController];
  int v4 = [v3 isRatchetEnabled];

  if (v4) {
    id v5 = @"DTO_STATUS_LABEL_DESCRIPTION_STATE_ON";
  }
  else {
    id v5 = @"DTO_STATUS_LABEL_DESCRIPTION_STATE_OFF";
  }
  id v6 = PSUI_LocalizedStringForPasscodeDimpleKey(v5);
  return v6;
}

- (id)voiceDial:(id)a3
{
  id v3 = a3;
  int v4 = [MEMORY[0x263F53C50] sharedConnection];
  int v5 = [v4 effectiveRestrictedBoolValueForSetting:*MEMORY[0x263F53728]];

  switch(v5)
  {
    case 1:
      uint64_t v7 = 1;
LABEL_7:
      id v6 = [NSNumber numberWithBool:v7];
      goto LABEL_8;
    case 2:
      uint64_t v7 = 0;
      goto LABEL_7;
    case 0:
      -[PSUIPasscodeLockController voiceDial:]();
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (void)setVoiceDial:(id)a3 specifier:(id)a4
{
  int v4 = (void *)MEMORY[0x263F53C50];
  id v5 = a3;
  id v7 = [v4 sharedConnection];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setBoolValue:v6 forSetting:*MEMORY[0x263F53728]];
}

- (BOOL)shouldShowVoiceDial
{
  if (MGGetBoolAnswer()
    && ([getAFPreferencesClass() sharedPreferences],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 assistantIsEnabled],
        v2,
        v3))
  {
    int v4 = [getAFPreferencesClass() sharedPreferences];
    int v5 = [v4 disableAssistantWhilePasscodeLocked] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)isVoiceDialRestricted
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53728]];

  return v3;
}

- (void)updateVoiceDialGroup
{
  v11[2] = *MEMORY[0x263EF8340];
  if (self->_voiceDialGroupSpecifier && self->_voiceDialSpecifier)
  {
    if (-[PSUIPasscodeLockController containsSpecifier:](self, "containsSpecifier:"))
    {
      int v3 = [(PSUIPasscodeLockController *)self containsSpecifier:self->_voiceDialSpecifier];
      BOOL v4 = [(PSUIPasscodeLockController *)self shouldShowVoiceDial];
      if (v3 && !v4)
      {
        voiceDialSpecifier = self->_voiceDialSpecifier;
        v11[0] = self->_voiceDialGroupSpecifier;
        v11[1] = voiceDialSpecifier;
        uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
        [(PSUIPasscodeLockController *)self removeContiguousSpecifiers:v6 animated:1];
LABEL_11:

        return;
      }
    }
    else
    {
      BOOL v4 = [(PSUIPasscodeLockController *)self shouldShowVoiceDial];
      LOBYTE(v3) = 0;
    }
    if ((v3 & 1) == 0 && v4)
    {
      id v7 = self->_voiceDialSpecifier;
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[PSUIPasscodeLockController isVoiceDialRestricted](self, "isVoiceDialRestricted") ^ 1);
      [(PSSpecifier *)v7 setProperty:v8 forKey:*MEMORY[0x263F600A8]];

      id v9 = self->_voiceDialSpecifier;
      v10[0] = self->_voiceDialGroupSpecifier;
      v10[1] = v9;
      uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
      [(PSUIPasscodeLockController *)self insertContiguousSpecifiers:v6 afterSpecifierID:@"PASSCODE_REQ" animated:1];
      goto LABEL_11;
    }
  }
}

- (id)assistantUnderLockEnabled:(id)a3
{
  int v3 = NSNumber;
  BOOL v4 = [getAFPreferencesClass() sharedPreferences];
  int v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "disableAssistantWhilePasscodeLocked") ^ 1);

  return v5;
}

- (void)setAssistantUnderLockEnabled:(id)a3 forSpecifier:(id)a4
{
  int v5 = [a3 BOOLValue];
  uint64_t v6 = [getAFPreferencesClass() sharedPreferences];
  int v7 = [v6 disableAssistantWhilePasscodeLocked];

  if (v5 == v7)
  {
    uint64_t v8 = [getAFPreferencesClass() sharedPreferences];
    [v8 setDisableAssistantWhilePasscodeLocked:v5 ^ 1u];

    id v9 = [getAFPreferencesClass() sharedPreferences];
    [v9 synchronize];
  }
  [(PSUIPasscodeLockController *)self updateVoiceDialGroup];
}

- (BOOL)isAssistantRestricted
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53788]];

  return v3;
}

- (id)homeControlAccessAllowedWhenLocked:(id)a3
{
  char v3 = NSNumber;
  BOOL v4 = [(PSUIPasscodeLockController *)self homeManager];
  int v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isAccessAllowedWhenLocked"));

  return v5;
}

- (void)setHomeControlAccessAllowedWhenLocked:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PSUIPasscodeLockController *)self homeManager];
  uint64_t v9 = [v7 BOOLValue];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__PSUIPasscodeLockController_setHomeControlAccessAllowedWhenLocked_specifier___block_invoke;
  void v11[3] = &unk_264E96008;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 updateAccessAllowedWhenLocked:v9 completionHandler:v11];
}

uint64_t __78__PSUIPasscodeLockController_setHomeControlAccessAllowedWhenLocked_specifier___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) reloadSpecifier:*(void *)(result + 40) animated:1];
  }
  return result;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
}

- (void)homeManager:(id)a3 didUpdateAccessAllowedWhenLocked:(BOOL)a4
{
}

- (id)wallet:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x263F53C50] sharedConnection];
  int v5 = [v4 effectiveBoolValueForSetting:*MEMORY[0x263F537E0]];

  switch(v5)
  {
    case 1:
      uint64_t v7 = 1;
LABEL_7:
      id v6 = [NSNumber numberWithBool:v7];
      goto LABEL_8;
    case 2:
      uint64_t v7 = 0;
      goto LABEL_7;
    case 0:
      -[PSUIPasscodeLockController wallet:]();
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (void)setWallet:(id)a3 specifier:(id)a4
{
  BOOL v4 = (void *)MEMORY[0x263F53C50];
  id v5 = a3;
  id v7 = [v4 sharedConnection];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setBoolValue:v6 forSetting:*MEMORY[0x263F537E0]];
}

- (BOOL)isWalletRestricted
{
  uint64_t v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F537E0]];

  return v3;
}

- (BOOL)showReplyWithMessage
{
  uint64_t v2 = [MEMORY[0x263F82670] currentDevice];
  char v3 = objc_msgSend(v2, "sf_isiPhone");

  return v3;
}

- (id)wipeEnabled:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(PSUIPasscodeLockController *)self specifierForID:@"WIPE_DEVICE"];
  }
  id v5 = [v4 propertyForKey:*MEMORY[0x263F600A8]];
  char v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [MEMORY[0x263F5FC20] readPreferenceValue:v4];
  }
  else
  {
    if (self->_policyDictatedMaxFailedAttempts < 0) {
      uint64_t v8 = (void *)MEMORY[0x263EFFA80];
    }
    else {
      uint64_t v8 = (void *)MEMORY[0x263EFFA88];
    }
    id v7 = v8;
  }
  uint64_t v9 = v7;

  return v9;
}

- (void)setWipeEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  if ([a3 BOOLValue])
  {
    id v7 = (void *)MEMORY[0x263F08A30];
    int policyDictatedMaxFailedAttempts = self->_policyDictatedMaxFailedAttempts;
    if (policyDictatedMaxFailedAttempts < 0) {
      uint64_t v9 = 10;
    }
    else {
      uint64_t v9 = policyDictatedMaxFailedAttempts;
    }
    id v10 = [NSNumber numberWithInt:v9];
    uint64_t v11 = [v7 localizedStringFromNumber:v10 numberStyle:1];

    id v12 = NSString;
    uint64_t v13 = PSUI_LocalizedStringForPasscodeLock(@"WIPE_DEVICE_ALERT_TITLE");
    __int16 v28 = (void *)v11;
    id v14 = objc_msgSend(v12, "stringWithFormat:", v13, v11);

    id v27 = PSUI_LocalizedStringForPasscodeLock(@"WIPE_DEVICE_ALERT_OK");
    id v26 = PSUI_LocalizedStringForPasscodeLock(@"WIPE_DEVICE_ALERT_CANCEL");
    uint64_t v15 = (void *)MEMORY[0x263F82418];
    objc_super v16 = [MEMORY[0x263F82670] currentDevice];
    int v17 = objc_msgSend(v16, "sf_isiPad");
    __int16 v18 = v14;
    if (v17)
    {
      __int16 v18 = [v6 name];
    }
    uint64_t v19 = [MEMORY[0x263F82670] currentDevice];
    if (objc_msgSend(v19, "sf_isiPad")) {
      id v20 = v14;
    }
    else {
      id v20 = 0;
    }
    uint64_t v21 = [MEMORY[0x263F82670] currentDevice];
    unint64_t v22 = objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v18, v20, objc_msgSend(v21, "sf_isiPad"));

    if (v17) {
    uint64_t v23 = (void *)MEMORY[0x263F82400];
    }
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __55__PSUIPasscodeLockController_setWipeEnabled_specifier___block_invoke;
    v30[3] = &unk_264E953D0;
    id v31 = v6;
    id v24 = [v23 actionWithTitle:v26 style:1 handler:v30];
    [v22 addAction:v24];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __55__PSUIPasscodeLockController_setWipeEnabled_specifier___block_invoke_2;
    v29[3] = &unk_264E953D0;
    v29[4] = self;
    id v25 = [MEMORY[0x263F82400] actionWithTitle:v27 style:2 handler:v29];
    [v22 addAction:v25];

    [(PSUIPasscodeLockController *)self presentViewController:v22 animated:1 completion:0];
  }
  else
  {
    [(PSUIPasscodeLockController *)self _setWipeEnabled:0];
  }
}

void __55__PSUIPasscodeLockController_setWipeEnabled_specifier___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) propertyForKey:*MEMORY[0x263F60028]];
  [v1 setOn:0 animated:1];
}

uint64_t __55__PSUIPasscodeLockController_setWipeEnabled_specifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setWipeEnabled:1];
}

- (void)_setWipeEnabled:(BOOL)a3
{
  id v4 = (void *)MEMORY[0x263F5FC20];
  id v6 = [NSNumber numberWithBool:a3];
  id v5 = [(PSUIPasscodeLockController *)self specifierForID:@"WIPE_DEVICE"];
  [v4 setPreferenceValue:v6 specifier:v5];
}

- (id)_makeWipeDeviceGroupFooter
{
  uint64_t v2 = (void *)MEMORY[0x263F08A30];
  int policyDictatedMaxFailedAttempts = self->_policyDictatedMaxFailedAttempts;
  if (policyDictatedMaxFailedAttempts < 0) {
    uint64_t v4 = 10;
  }
  else {
    uint64_t v4 = policyDictatedMaxFailedAttempts;
  }
  id v5 = [NSNumber numberWithInt:v4];
  id v6 = [v2 localizedStringFromNumber:v5 numberStyle:1];

  id v7 = NSString;
  uint64_t v8 = PSUI_LocalizedStringForPasscodeLock(@"WIPE_DEVICE_TEXT");
  uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", v8, v6);

  id v10 = [MEMORY[0x263F53C50] sharedConnection];
  int v11 = [v10 isContentProtectionInEffect];

  if (v11)
  {
    id v12 = PSUI_LocalizedStringForPasscodeLock(@"DATA_ENCRYPTED_TEXT");
    id v13 = [NSString stringWithFormat:@"%@\n\n%@\n ", v9, v12];
  }
  else
  {
    id v13 = v9;
  }

  return v13;
}

- (void)devicePINController:(id)a3 shouldAcceptPIN:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [v8 simplePIN];
  int IsPasswordWeak2 = SecPasswordIsPasswordWeak2();

  if (IsPasswordWeak2)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __81__PSUIPasscodeLockController_devicePINController_shouldAcceptPIN_withCompletion___block_invoke;
    v12[3] = &unk_264E95D20;
    id v13 = v9;
    [(PSUIPasscodeLockController *)self showWeakWarningAlertForController:v8 offerUseAnyway:1 withCompletion:v12];
  }
  else
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

uint64_t __81__PSUIPasscodeLockController_devicePINController_shouldAcceptPIN_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showWeakWarningAlertForController:(id)a3 offerUseAnyway:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  int v9 = PSUsedByHSA2Account();
  id v10 = @"WEAK_PASSCODE_DETAILS";
  if (v9) {
    id v10 = @"WEAK_PASSCODE_DETAILS_HSA2";
  }
  int v11 = (void *)MEMORY[0x263F82418];
  id v12 = v10;
  id v13 = PSUI_LocalizedStringForPasscodeLock(@"WEAK_PASSCODE");
  id v14 = PSUI_LocalizedStringForPasscodeLock(v12);

  uint64_t v15 = [v11 alertControllerWithTitle:v13 message:v14 preferredStyle:1];

  objc_super v16 = (void *)MEMORY[0x263F82400];
  int v17 = PSUI_LocalizedStringForPasscodeLock(@"CHOOSE_NEW_CODE");
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __94__PSUIPasscodeLockController_showWeakWarningAlertForController_offerUseAnyway_withCompletion___block_invoke;
  v28[3] = &unk_264E953F8;
  id v18 = v8;
  id v29 = v18;
  uint64_t v19 = [v16 actionWithTitle:v17 style:1 handler:v28];
  [v15 addAction:v19];

  if (v6)
  {
    id v20 = (void *)MEMORY[0x263F82400];
    uint64_t v21 = PSUI_LocalizedStringForPasscodeLock(@"USE_WEAK_PASSCODE_ANYWAY");
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    id v25 = __94__PSUIPasscodeLockController_showWeakWarningAlertForController_offerUseAnyway_withCompletion___block_invoke_2;
    id v26 = &unk_264E953F8;
    id v27 = v18;
    unint64_t v22 = [v20 actionWithTitle:v21 style:0 handler:&v23];
    objc_msgSend(v15, "addAction:", v22, v23, v24, v25, v26);
  }
  [v7 presentViewController:v15 animated:1 completion:0];
}

uint64_t __94__PSUIPasscodeLockController_showWeakWarningAlertForController_offerUseAnyway_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__PSUIPasscodeLockController_showWeakWarningAlertForController_offerUseAnyway_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)devicePINController:(id)a3 didAcceptSetPIN:(id)a4
{
  [(PSUIPasscodeLockController *)self _didUpdatePasscode:a4];
  [(PSUIPasscodeLockController *)self reloadSpecifiers];
}

- (void)_didUpdatePasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUIPasscodeLockController *)self specifier];

  if (!v5)
  {
    BOOL v6 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PSUIPasscodeLockController _didUpdatePasscode:]();
    }
  }
  id v7 = PSUILogForCategory(1uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "_didUpdatePasscode: Saving passcode for specifier", buf, 2u);
    }

    int v9 = [(PSUIPasscodeLockController *)self specifier];
    [v9 setProperty:v4 forKey:*MEMORY[0x263F60270]];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_DEFAULT, "_didUpdatePasscode: Removing passcode for specifier", v10, 2u);
    }

    int v9 = [(PSUIPasscodeLockController *)self specifier];
    [v9 removePropertyForKey:*MEMORY[0x263F60270]];
  }
}

- (void)devicePINController:(id)a3 didAcceptChangedPIN:(id)a4
{
}

- (void)didAcceptRemovePIN
{
  [(PSUIPasscodeLockController *)self _didUpdatePasscode:0];
  [(PSUIPasscodeLockController *)self reloadSpecifiers];
  [(PSUIPasscodeLockController *)self showKeychainAlert];
}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB0]) = 0;
}

- (void)showKeychainAlert
{
  if (PSKeychainSyncGetStatus() == 2)
  {
    id v12 = [NSString stringWithFormat:@"DISABLE_WARNING%@%@", @"_PASSWORDS", @"_KEYCHAIN"];
    char v3 = PSUI_LocalizedStringForPasscodeLock(@"TURN_OFF_ICLOUD_KEYCHAIN");
    id v4 = PSUI_LocalizedStringForPasscodeLock(@"KEEP_USING_ICLOUD_KEYCHAIN");
    id v5 = (void *)MEMORY[0x263F82418];
    BOOL v6 = PSUI_LocalizedStringForPasscodeLock(v12);
    id v7 = [v5 alertControllerWithTitle:v3 message:v6 preferredStyle:1];

    BOOL v8 = [MEMORY[0x263F82400] actionWithTitle:v4 style:1 handler:0];
    [v7 addAction:v8];

    int v9 = (void *)MEMORY[0x263F82400];
    id v10 = PSUI_LocalizedStringForPasscodeLock(@"TURN_OFF_AND_REMOVE_PASSWORDS");
    int v11 = [v9 actionWithTitle:v10 style:2 handler:&__block_literal_global_385];
    [v7 addAction:v11];

    [(PSUIPasscodeLockController *)self presentViewController:v7 animated:1 completion:0];
  }
}

void __47__PSUIPasscodeLockController_showKeychainAlert__block_invoke()
{
  v0 = dispatch_get_global_queue(0, 0);
  dispatch_async(v0, &__block_literal_global_387);
}

void __47__PSUIPasscodeLockController_showKeychainAlert__block_invoke_2()
{
  v0 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v0, OS_LOG_TYPE_INFO, "Disabling keychain sync.", buf, 2u);
  }

  [MEMORY[0x263F343A0] setUserVisibleKeychainSyncEnabled:0 withCompletion:&__block_literal_global_391];
  SOSCCRemoveThisDeviceFromCircle();
}

void __47__PSUIPasscodeLockController_showKeychainAlert__block_invoke_389(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = PSUILogForCategory(1uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138543362;
      id v10 = v3;
      BOOL v6 = "setUserVisibleKeychainSyncEnabled failed with error: %{public}@";
      id v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_23D33A000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v9) = 0;
    BOOL v6 = "setUserVisibleKeychainSyncEnabled completed successfully";
    id v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }
}

- (BOOL)canBeShownFromSuspendedState
{
  uint64_t v2 = +[PSUIPasscode sharedInstance];
  char v3 = [v2 isPasscodeSet] ^ 1;

  return v3;
}

- (void)suspend
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "suspend: No specifier", v2, v3, v4, v5, v6);
}

- (id)specifiers
{
  uint64_t v149 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v133 = (int)*MEMORY[0x263F5FDB8];
    uint64_t v4 = +[PSUIPasscode sharedInstance];
    uint64_t v5 = [v4 isPasscodeSet];

    if (MGGetBoolAnswer())
    {
      v134 = [(PSUIPasscodeLockController *)self loadSpecifiersFromPlistName:@"5.0~Passcode Lock Assistant" target:self];
    }
    else
    {
      v134 = 0;
    }
    uint8_t v6 = [(PSUIPasscodeLockController *)self loadSpecifiersFromPlistName:@"Passcode Lock" target:self];
    id v7 = [v6 specifierForID:@"PASSCODE_OFF"];
    if (v5) {
      uint32_t v8 = @"PASSCODE_OFF";
    }
    else {
      uint32_t v8 = @"PASSCODE_ON";
    }
    int v9 = PSUI_LocalizedStringForPasscodeLock(v8);
    [v7 setName:v9];

    id v10 = [NSNumber numberWithInt:v5];
    [v7 setProperty:v10 forKey:*MEMORY[0x263F60320]];

    uint64_t v11 = (uint64_t *)MEMORY[0x263F600A8];
    if (v5)
    {
      BOOL v12 = ![(PSUIPasscodeLockController *)self isInternetReachable]
         && [(PSUIPasscodeLockController *)self shouldPresentAppleIDAuthenticationForTogglingPasscode];
      id v14 = [MEMORY[0x263F53C50] sharedConnection];
      uint64_t v15 = [v14 isPasscodeRequired];

      objc_super v16 = [NSNumber numberWithInt:!(v12 | v15)];
      [v7 setProperty:v16 forKey:*v11];

      int v17 = [v6 specifierForID:@"PASSCODE_GROUP"];
      [(PSUIPasscodeLockController *)self updatePasscodeChangesGroupFooterToSpecifier:v17 showDefault:v12 ^ 1];

      id v13 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [NSNumber numberWithInt:!(v12 | v15)];
        uint64_t v19 = [NSNumber numberWithBool:v12];
        id v20 = [NSNumber numberWithBool:v15];
        *(_DWORD *)buf = 138412802;
        v144 = v18;
        __int16 v145 = 2112;
        v146 = v19;
        __int16 v147 = 2112;
        v148 = v20;
        _os_log_impl(&dword_23D33A000, v13, OS_LOG_TYPE_DEFAULT, "Passcode Group: Passcode On/Off enablement status [%@] | appleIDConnection [%@] | MC [%@]", buf, 0x20u);
      }
    }
    else
    {
      id v13 = PSUILogForCategory(1uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23D33A000, v13, OS_LOG_TYPE_DEFAULT, "Passcode Group: Passcode not set", buf, 2u);
      }
    }

    uint64_t v21 = [(PSUIPasscodeLockController *)self getDTOSpecifiers];
    uint64_t v22 = [v21 count];
    if (v22)
    {
      uint64_t v23 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v22);
      [v6 insertObjects:v21 atIndexes:v23];
    }
    v131 = v21;
    uint64_t v24 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v25 = [v24 recoveryPasscodeExpiryDate];

    v130 = (void *)v25;
    if (v25)
    {
      id v26 = [v6 specifierForID:@"PASSCODE_GRACE_PERIOD_GROUP"];
      [(PSUIPasscodeLockController *)self addGracePeriodPasscodeRecoveryFooterToSpecifier:v26];
      id v27 = [v6 specifierForID:@"TURN_OFF_PASSCODE_RECOVERY"];
      [v27 setProperty:MEMORY[0x263EFFA88] forKey:*v11];
    }
    else
    {
      id v26 = [v6 specifierForID:@"TURN_OFF_PASSCODE_RECOVERY"];
      id v27 = [v6 specifierForID:@"PASSCODE_GRACE_PERIOD_GROUP"];
      if (v26) {
        [v6 removeObject:v26];
      }
      if (v27) {
        [v6 removeObject:v27];
      }
    }

    __int16 v28 = [v6 specifierForID:@"VOICE_DIAL"];
    voiceDialSpecifier = self->_voiceDialSpecifier;
    self->_voiceDialSpecifier = v28;

    uint64_t v30 = [v6 specifierForID:@"VOICE_DIAL_GROUP"];
    voiceDialGroupSpecifier = self->_voiceDialGroupSpecifier;
    self->_voiceDialGroupSpecifier = v30;

    id v32 = self->_voiceDialSpecifier;
    v132 = v7;
    if (self->_voiceDialGroupSpecifier)
    {
      if (v32)
      {
        BOOL v33 = [(PSUIPasscodeLockController *)self shouldShowVoiceDial];
        id v32 = self->_voiceDialSpecifier;
        if (!v33)
        {
          v142[0] = self->_voiceDialGroupSpecifier;
          v142[1] = v32;
          uint64_t v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v142 count:2];
          [v6 removeObjectsInArray:v34];

          id v32 = self->_voiceDialSpecifier;
        }
      }
    }
    uint64_t v35 = objc_msgSend(NSNumber, "numberWithInt:", -[PSUIPasscodeLockController isVoiceDialRestricted](self, "isVoiceDialRestricted") ^ 1);
    v141 = self;
    uint64_t v36 = *v11;
    [(PSSpecifier *)v32 setProperty:v35 forKey:*v11];

    v140 = v6;
    long long v37 = [v6 specifierForID:@"ALLOW_ACCESS_WHEN_LOCKED"];
    long long v38 = [(PSUIPasscodeLockController *)v141 _allowAccessWhenLockedSpecifierFooter];
    uint64_t v128 = *MEMORY[0x263F600F8];
    v129 = v37;
    objc_msgSend(v37, "setProperty:forKey:", v38);

    long long v39 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v40 = *MEMORY[0x263F53950];
    int v41 = [v39 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53950]];

    uint64_t v42 = (void *)MEMORY[0x263F5FC40];
    id v43 = PSUI_LocalizedStringForPasscodeLock(@"NOTIFICATIONS_VIEW");
    v44 = [v42 preferenceSpecifierNamed:v43 target:v141 set:sel_setEnabledInLockScreen_specifier_ get:sel_enabledInLockScreen_ detail:0 cell:6 edit:0];

    [v44 setProperty:v40 forKey:@"MC_FEATURE"];
    id v45 = [NSNumber numberWithInt:v41 ^ 1u];
    v139 = v44;
    [v44 setProperty:v45 forKey:v36];

    v46 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v47 = *MEMORY[0x263F53958];
    LODWORD(v43) = [v46 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53958]];

    v48 = (void *)MEMORY[0x263F5FC40];
    v49 = PSUI_LocalizedStringForPasscodeLock(@"TODAY_VIEW");
    v50 = [v48 preferenceSpecifierNamed:v49 target:v141 set:sel_setEnabledInLockScreen_specifier_ get:sel_enabledInLockScreen_ detail:0 cell:6 edit:0];

    [v50 setProperty:v47 forKey:@"MC_FEATURE"];
    v51 = [NSNumber numberWithInt:v43 ^ 1];
    v138 = v50;
    [v50 setProperty:v51 forKey:v36];

    v52 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v53 = *MEMORY[0x263F53948];
    LODWORD(v43) = [v52 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53948]];

    v54 = (void *)MEMORY[0x263F5FC40];
    v55 = PSUI_LocalizedStringForPasscodeLock(@"CONTROL_CENTER");
    v56 = [v54 preferenceSpecifierNamed:v55 target:v141 set:sel_setEnabledInLockScreen_specifier_ get:sel_enabledInLockScreen_ detail:0 cell:6 edit:0];

    [v56 setProperty:v53 forKey:@"MC_FEATURE"];
    v57 = [NSNumber numberWithInt:v43 ^ 1];
    v137 = v56;
    [v56 setProperty:v57 forKey:v36];

    v58 = (void *)MEMORY[0x263F5FC40];
    v59 = PSUI_LocalizedStringForPasscodeLock(@"COMPLICATIONS");
    v60 = [v58 preferenceSpecifierNamed:v59 target:v141 set:sel_setPreferenceValue_specifier_ get:sel_readPreferenceValue_ detail:0 cell:6 edit:0];

    [v60 setIdentifier:@"COMPLICATIONS"];
    uint64_t v61 = *MEMORY[0x263F60070];
    [v60 setProperty:@"com.apple.chronod" forKey:*MEMORY[0x263F60070]];
    uint64_t v62 = *MEMORY[0x263F60170];
    [v60 setProperty:@"showComplicationDataWhenPasscodeLocked" forKey:*MEMORY[0x263F60170]];
    uint64_t v63 = *MEMORY[0x263F60068];
    uint64_t v64 = MEMORY[0x263EFFA88];
    [v60 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60068]];
    v136 = v60;
    uint64_t v124 = *MEMORY[0x263F5FEF8];
    objc_msgSend(v60, "setProperty:forKey:", v64);
    v65 = (void *)MEMORY[0x263F5FC40];
    v66 = PSUI_LocalizedStringForPasscodeLock(@"LIVE_ACTIVITIES");
    v67 = [v65 preferenceSpecifierNamed:v66 target:v141 set:sel_setPreferenceValue_specifier_ get:sel_readPreferenceValue_ detail:0 cell:6 edit:0];

    [v67 setIdentifier:@"LIVE_ACTIVITIES"];
    [v67 setProperty:@"com.apple.chronod" forKey:v61];
    [v67 setProperty:@"showLiveActivitiesWhenPasscodeLocked" forKey:v62];
    v135 = v67;
    [v67 setProperty:v64 forKey:v63];
    v68 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v69 = *MEMORY[0x263F53A90];
    LOBYTE(v64) = [v68 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53A90]];

    if (v64)
    {
      uint64_t v70 = 0;
    }
    else
    {
      v71 = [getLockdownModeManagerClass() shared];
      int v72 = [v71 enabled];

      uint64_t v70 = v72 ^ 1u;
    }
    v73 = (void *)MEMORY[0x263F5FC40];
    v74 = PSUI_LocalizedStringForPasscodeLock(@"ACCESSORIES");
    v75 = [v73 preferenceSpecifierNamed:v74 target:v141 set:sel_setEnabledInLockScreenForUSB_specifier_ get:sel_enabledInLockScreenForUSB_ detail:0 cell:6 edit:0];

    [v75 setProperty:@"ACCESSORIES" forKey:*MEMORY[0x263F60138]];
    [v75 setProperty:v69 forKey:@"MC_FEATURE"];
    v76 = [NSNumber numberWithInt:v70];
    v127 = v75;
    [v75 setProperty:v76 forKey:v36];

    v77 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v138, v139, v137, 0);
    if (_os_feature_enabled_impl()) {
      [v77 addObject:v136];
    }
    if (_os_feature_enabled_impl()) {
      [v77 addObject:v135];
    }
    if (MGGetBoolAnswer())
    {
      v78 = [getAFPreferencesClass() sharedPreferences];
      int v79 = [v78 assistantIsEnabled];

      if (v79)
      {
        if ([v134 count])
        {
          [v77 addObjectsFromArray:v134];
          if ([(PSUIPasscodeLockController *)v141 isAssistantRestricted])
          {
            v80 = [v77 specifierForID:@"ASSISTANT_WHILE_LOCKED"];
            [v80 setProperty:MEMORY[0x263EFFA80] forKey:v36];
          }
        }
      }
    }
    v81 = [v140 specifierForID:@"RETURN_MISSED_CALLS_SWITCH"];
    [v81 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    [v81 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v124];
    if (PSIsBundleIDHiddenDueToRestrictions()) {
      [v140 removeObject:v81];
    }
    v125 = v81;
    uint64_t v82 = [v140 specifierForID:@"ALLOW_ACCESS_WHEN_LOCKED"];
    uint64_t v83 = [v77 count];
    v123 = (void *)v82;
    v84 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", objc_msgSend(v140, "indexOfObject:", v82) + 1, v83);
    [v140 insertObjects:v77 atIndexes:v84];

    v85 = [v140 specifierForID:@"WALLET_SWITCH"];
    if ([(PSUIPasscodeLockController *)v141 isWalletRestricted]) {
      [v85 setProperty:MEMORY[0x263EFFA80] forKey:v36];
    }
    v122 = v85;
    v86 = [MEMORY[0x263F53C50] sharedConnection];
    v87 = [v86 valueRestrictionForFeature:*MEMORY[0x263F53978]];

    v126 = v77;
    v121 = v87;
    if (v87) {
      int v88 = [v87 intValue];
    }
    else {
      int v88 = -1;
    }
    v141->_int policyDictatedMaxFailedAttempts = v88;
    v89 = [v140 specifierForID:@"WIPE_DEVICE"];
    v120 = (void *)MGCopyAnswer();
    objc_msgSend(v89, "setProperty:forKey:");
    v90 = [MEMORY[0x263F53C50] sharedConnection];
    int v91 = [v90 effectiveBoolValueForSetting:*MEMORY[0x263F538B0]];

    if (v91 == 2) {
      uint64_t v92 = 0;
    }
    else {
      uint64_t v92 = v141->_policyDictatedMaxFailedAttempts >> 31;
    }
    v119 = [NSNumber numberWithBool:v92];
    objc_msgSend(v89, "setProperty:forKey:");
    if (v91 == 2) {
      [v89 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60308]];
    }
    v93 = [v140 specifierForID:@"WIPE_DEVICE_TEXT"];
    v94 = [(PSUIPasscodeLockController *)v141 _makeWipeDeviceGroupFooter];
    [v93 setProperty:v94 forKey:v128];

    v95 = [MEMORY[0x263F3BAD8] sharedInstance];
    uint64_t v96 = [v95 availabilityForListenerID:@"com.apple.Preferences" forService:0];

    v97 = [MEMORY[0x263F3BB18] sharedInstance];
    int v98 = [v97 isTelephonyDevice];

    v99 = [MEMORY[0x263F3BAD8] sharedInstance];
    uint64_t v100 = [v99 availabilityForListenerID:@"com.apple.Preferences" forService:1];

    v101 = [MEMORY[0x263F3BB18] sharedInstance];
    int v102 = [v101 supportsSMS];

    v103 = [MEMORY[0x263F3BB18] sharedInstance];
    uint64_t v104 = [v103 deviceType];

    v105 = [MEMORY[0x263F3BB18] sharedInstance];
    uint64_t v106 = [v105 deviceType];

    BOOL v107 = 0;
    if (v96 == 1) {
      int v108 = 1;
    }
    else {
      int v108 = v98;
    }
    if (v100 == 1) {
      int v109 = 1;
    }
    else {
      int v109 = v102;
    }
    if (v108 == 1 && v109) {
      BOOL v107 = v104 == 3 || v106 == 2;
    }
    if ((PKIsUSBRestrictedModeDisabledByMobileAsset() & 1) == 0)
    {
      v111 = [v140 specifierForID:@"RETURN_MISSED_CALLS_SWITCH"];
      objc_msgSend(v140, "ps_insertObject:afterObject:", v127, v111);
    }
    if (!v107)
    {
      v112 = [v140 specifierForID:@"REPLY_WITH_MESSAGE_SWITCH"];
      [v140 removeObject:v112];
    }
    v113 = [v140 specifierForID:@"PASSCODE_REQ"];
    v114 = [v113 values];
    [v113 setProperty:v114 forKey:@"gracePeriodValues"];

    v115 = [v113 titleDictionary];
    [v113 setProperty:v115 forKey:@"gracePeriodTitles"];

    v116 = [v113 shortTitleDictionary];
    [v113 setProperty:v116 forKey:@"gracePeriodShortTitles"];

    [(PSUIPasscodeLockController *)v141 _updateGracePeriodForSpecifier:v113];
    [(PSUIPasscodeLockController *)v141 disablePasscodeRequiredSpecifiers:v140];
    v117 = *(Class *)((char *)&v141->super.super.super.super.super.isa + v133);
    *(Class *)((char *)&v141->super.super.super.super.super.isa + v133) = (Class)v140;

    [(PSUIPasscodeLockController *)v141 updateAutoUnlockSpecifiers];
    uint64_t v3 = *(Class *)((char *)&v141->super.super.super.super.super.isa + v133);
  }
  return v3;
}

- (id)enabledInLockScreen:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  uint64_t v5 = [v3 sharedConnection];
  uint8_t v6 = [v4 propertyForKey:@"MC_FEATURE"];

  int v7 = [v5 effectiveBoolValueForSetting:v6];
  uint32_t v8 = NSNumber;
  return (id)[v8 numberWithInt:v7 == 1];
}

- (id)enabledInLockScreenForUSB:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = [(PSUIPasscodeLockController *)self enabledInLockScreen:a3];
  uint64_t v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "BOOLValue") ^ 1);

  return v5;
}

- (void)setEnabledInLockScreen:(id)a3 specifier:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F53C50];
  id v6 = a4;
  id v7 = a3;
  id v10 = [v5 sharedConnection];
  uint64_t v8 = [v7 BOOLValue];

  int v9 = [v6 propertyForKey:@"MC_FEATURE"];

  [v10 setBoolValue:v8 forSetting:v9];
}

- (void)setEnabledInLockScreenForUSB:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke;
  aBlock[3] = &unk_264E957C0;
  __int16 v28 = &v37;
  objc_copyWeak(&v37, location);
  id v8 = v6;
  id v34 = v8;
  id v9 = v7;
  id v35 = v9;
  uint64_t v36 = self;
  id v10 = (void (**)(void))_Block_copy(aBlock);
  unsigned int v11 = _AXSGetUSBRMDisablers();
  char v12 = [v8 BOOLValue];
  if (v11) {
    char v13 = v12;
  }
  else {
    char v13 = 1;
  }
  if (v13)
  {
    v10[2](v10);
  }
  else
  {
    if (__clz(__rbit32(v11)) + 1 == fls(v11))
    {
      if (v11)
      {
        id v14 = @"ACCESSORIES_OFF_WARNING_VO";
      }
      else
      {
        if ((v11 & 2) == 0) {
          goto LABEL_18;
        }
        id v14 = @"ACCESSORIES_OFF_WARNING_SC";
      }
    }
    else
    {
      id v14 = @"ACCESSORIES_OFF_WARNING_MULTI";
    }
    uint64_t v15 = (void *)MEMORY[0x263F82418];
    objc_super v16 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", &v37);
    int v17 = objc_msgSend(v16, "sf_isiPad");
    if (v17)
    {
      id v18 = [v9 name];
    }
    else
    {
      id v18 = 0;
    }
    uint64_t v19 = PSUI_LocalizedStringForPasscodeLock(v14);
    id v20 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v21 = objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v18, v19, objc_msgSend(v20, "sf_isiPad"));

    if (v17) {
    uint64_t v22 = (void *)MEMORY[0x263F82400];
    }
    uint64_t v23 = PSUI_LocalizedStringForPasscodeLock(@"TURN_OFF");
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke_2;
    v31[3] = &unk_264E953F8;
    id v32 = v10;
    uint64_t v24 = [v22 actionWithTitle:v23 style:2 handler:v31];
    [v21 addAction:v24];

    uint64_t v25 = (void *)MEMORY[0x263F82400];
    id v26 = PSUI_LocalizedStringForPasscodeLock(@"CANCEL");
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke_3;
    v29[3] = &unk_264E954F8;
    v29[4] = self;
    id v30 = v9;
    id v27 = [v25 actionWithTitle:v26 style:1 handler:v29];
    [v21 addAction:v27];

    [(PSUIPasscodeLockController *)self presentViewController:v21 animated:1 completion:0];
  }
LABEL_18:

  objc_destroyWeak(v28);
  objc_destroyWeak(location);
}

void __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1);
  [WeakRetained setEnabledInLockScreen:v2 specifier:*(void *)(a1 + 40)];

  uint64_t v3 = [WeakRetained specifiers];
  id v4 = [v3 specifierForID:@"ALLOW_ACCESS_WHEN_LOCKED"];

  uint64_t v5 = [*(id *)(a1 + 48) _allowAccessWhenLockedSpecifierFooter];
  [v4 setProperty:v5 forKey:*MEMORY[0x263F600F8]];

  [WeakRetained reloadSpecifier:v4 animated:1];
}

uint64_t __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return MEMORY[0x270F90A98](0);
}

uint64_t __69__PSUIPasscodeLockController_setEnabledInLockScreenForUSB_specifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

- (void)disablePasscodeRequiredSpecifiers:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[PSUIPasscode sharedInstance];
  char v5 = [v4 isPasscodeSet];

  if ((v5 & 1) == 0)
  {
    v23[0] = @"PASSCODE_OFF";
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v3;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      uint64_t v11 = *MEMORY[0x263F600A8];
      uint64_t v12 = MEMORY[0x263EFFA80];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v15 = [v14 identifier];
          char v16 = [v6 containsObject:v15];

          if ((v16 & 1) == 0) {
            [v14 setProperty:v12 forKey:v11];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v3 = v17;
  }
}

- (void)profileNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x263F53B48]];

  LODWORD(v4) = [v5 intValue];
  if (v4 != getpid()) {
    [(PSUIPasscodeLockController *)self reloadSpecifiers];
  }
}

- (id)_allowAccessWhenLockedSpecifierFooter
{
  uint64_t v2 = [getLockdownModeManagerClass() shared];
  char v3 = [v2 enabled];

  int IsAvailable = PKNearFieldRadioIsAvailable();
  if (PKIsUSBRestrictedModeDisabledByMobileAsset())
  {
    if (!IsAvailable)
    {
      id v6 = 0;
      goto LABEL_22;
    }
    if (PSIsPearlAvailable()) {
      id v5 = @"WALLET_FOOTER_TEXT_FACEID";
    }
    else {
      id v5 = @"WALLET_FOOTER_TEXT";
    }
    id v6 = PSUI_LocalizedStringForPasscodeLock(v5);
  }
  else
  {
    if (v3)
    {
      id v7 = @"ACCESSORIES_OFF_LOCKDOWN";
    }
    else
    {
      uint64_t v8 = [MEMORY[0x263F53C50] sharedConnection];
      int v9 = [v8 effectiveBoolValueForSetting:*MEMORY[0x263F53A90]];

      if (v9 == 2) {
        id v7 = @"ACCESSORIES_ON";
      }
      else {
        id v7 = @"ACCESSORIES_OFF";
      }
    }
    id v6 = PSUI_LocalizedStringForPasscodeLock(v7);
    if (!IsAvailable) {
      goto LABEL_22;
    }
  }
  uint64_t v10 = [MEMORY[0x263F5BD48] shared];
  int v11 = [v10 isEffectivelyLocked];

  if (v11)
  {
    if (PSIsPearlAvailable()) {
      uint64_t v12 = @"WALLET_LOCKED_FOOTER_TEXT_FACEID";
    }
    else {
      uint64_t v12 = @"WALLET_LOCKED_FOOTER_TEXT_TOUCHID";
    }
    char v13 = PSUI_LocalizedStringForPasscodeLock(v12);
    if ([v6 length])
    {
      id v14 = [v6 stringByAppendingFormat:@"\n\n%@", v13];
    }
    else
    {
      id v14 = v13;
    }
    id v15 = v14;

    id v6 = v15;
  }
LABEL_22:
  return v6;
}

- (void)updatePhoneAutounlockSection:(BOOL)a3
{
  if (a3)
  {
    [(PSUIPasscodeLockController *)self updateAutoUnlockSpecifiers];
  }
  else
  {
    id v4 = [(PSUIPasscodeLockController *)self autoUnlockSpecifiers];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = [(PSUIPasscodeLockController *)self autoUnlockSpecifiers];
      [(PSUIPasscodeLockController *)self removeContiguousSpecifiers:v6 animated:1];

      [(PSUIPasscodeLockController *)self setAutoUnlockSpecifiers:0];
    }
  }
}

- (void)updateAutoUnlockSpecifiers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v3 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [MEMORY[0x263F6C1E8] autoUnlockSupported];
    uint64_t v5 = +[PSUIBiometrics sharedInstance];
    int v6 = [v5 isEnrolledInFaceID];
    id v7 = +[PSUIPasscodeAndBiometrics sharedInstance];
    *(_DWORD *)buf = 67109632;
    int v15 = v4;
    __int16 v16 = 1024;
    int v17 = v6;
    __int16 v18 = 1024;
    int v19 = [v7 isUnlockEnabled];
    _os_log_impl(&dword_23D33A000, v3, OS_LOG_TYPE_DEFAULT, "Auto unlock supported: %d, is enrolled in faceID: %d, phone unlock enabled: %d", buf, 0x14u);
  }
  if ([MEMORY[0x263F6C1E8] autoUnlockSupported])
  {
    uint64_t v8 = +[PSUIBiometrics sharedInstance];
    if ([v8 isEnrolledInFaceID])
    {
      int v9 = +[PSUIPasscodeAndBiometrics sharedInstance];
      int v10 = [v9 isUnlockEnabled];

      if (v10)
      {
        int v11 = [(PSUIPasscodeLockController *)self autoUnlockManager];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke;
        v13[3] = &unk_264E96030;
        void v13[4] = self;
        [v11 eligibleAutoUnlockDevicesWithCompletionHandler:v13];

        return;
      }
    }
    else
    {
    }
  }
  uint64_t v12 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D33A000, v12, OS_LOG_TYPE_DEFAULT, "Autounlock is not supported or FaceID is not setup.", buf, 2u);
  }
}

void __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  if (v6)
  {
    uint64_t v8 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v46 = v6;
  int v15 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    *(_DWORD *)buf = 138412290;
    uint64_t v61 = v16;
    _os_log_impl(&dword_23D33A000, v15, OS_LOG_TYPE_DEFAULT, "Found %@ autounlock device(s)", buf, 0xCu);
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v5;
  unint64_t v17 = 0x263F5F000uLL;
  uint64_t v52 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
  if (v52)
  {
    uint64_t v18 = *(void *)v57;
    uint64_t v51 = *MEMORY[0x263F5FFE0];
    uint64_t v50 = *MEMORY[0x263F602C8];
    uint64_t v48 = *MEMORY[0x263F600A8];
    uint64_t v47 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v57 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        long long v21 = *(void **)(v17 + 3136);
        uint64_t v22 = [v20 name];
        uint64_t v23 = [v21 preferenceSpecifierNamed:v22 target:*(void *)(a1 + 32) set:sel_setAutoUnlockEnabled_specifier_ get:sel_autoUnlockEnabled_ detail:0 cell:6 edit:0];

        [v23 setProperty:objc_opt_class() forKey:v51];
        uint64_t v24 = PSUILogForCategory(1uLL);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [v20 name];
          id v26 = [v20 modelDescription];
          unint64_t v27 = v17;
          uint64_t v28 = a1;
          id v29 = v7;
          int v30 = [v20 unlockEnabled];
          int v31 = [v20 supportsApproveWithWatch];
          *(_DWORD *)buf = 138413058;
          uint64_t v61 = v25;
          __int16 v62 = 2112;
          uint64_t v63 = v26;
          __int16 v64 = 1024;
          int v65 = v30;
          id v7 = v29;
          a1 = v28;
          unint64_t v17 = v27;
          uint64_t v18 = v47;
          __int16 v66 = 1024;
          int v67 = v31;
          _os_log_impl(&dword_23D33A000, v24, OS_LOG_TYPE_DEFAULT, "PAU device name: %@, model description: %@, unlock enabled: %d, software supported: %d", buf, 0x22u);
        }
        if ([v20 supportsApproveWithWatch])
        {
          id v32 = [v20 modelDescription];
          uint64_t v33 = [v32 length];

          if (v33)
          {
            id v34 = [v20 modelDescription];
            [v23 setProperty:v34 forKey:v50];
          }
        }
        else
        {
          id v35 = PSUI_LocalizedStringForPasscodeLock(@"UNSUPPORTED_WATCH_SOFTWARE");
          [v23 setProperty:v35 forKey:v50];

          [v23 setProperty:MEMORY[0x263EFFA80] forKey:v48];
        }
        uint64_t v36 = [v20 uniqueID];
        [v23 setIdentifier:v36];

        [v23 setObject:v20 forKeyedSubscript:@"PSUIAutoUnlockDeviceKey"];
        [v7 addObject:v23];
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
    }
    while (v52);
  }

  if ([v7 count])
  {
    id v37 = *(void **)(v17 + 3136);
    long long v38 = PSUI_LocalizedStringForPasscodeLock(@"USE_APPLE_WATCH_TO_UNLOCK");
    long long v39 = [v37 groupSpecifierWithID:@"AUTO_UNLOCK_DEVICES_GROUP" name:v38];

    [v7 insertObject:v39 atIndex:0];
    LODWORD(v38) = [*(id *)(a1 + 32) useAlternateFooterTextForPAU];
    int v40 = [MEMORY[0x263F287E0] assistantEnabled];
    if (v38)
    {
      if (v40) {
        int v41 = @"PHONE_AUTO_UNLOCK_FOOTER_PERIOCULAR_ASSISTANT_ENABLED";
      }
      else {
        int v41 = @"PHONE_AUTO_UNLOCK_FOOTER_PERIOCULAR_ASSISTANT_DISABLED";
      }
      uint64_t v43 = PSUI_LocalizedStringForPasscodePeriocular(v41);
    }
    else
    {
      if (v40) {
        uint64_t v42 = @"PHONE_AUTO_UNLOCK_FOOTER_ASSISTANT_ENABLED";
      }
      else {
        uint64_t v42 = @"PHONE_AUTO_UNLOCK_FOOTER_ASSISTANT_DISABLED";
      }
      uint64_t v43 = PSUI_LocalizedStringForPasscodeLock(v42);
    }
    v44 = (void *)v43;
    [v39 setProperty:v43 forKey:*MEMORY[0x263F600F8]];
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke_567;
  block[3] = &unk_264E95380;
  objc_copyWeak(&v55, (id *)buf);
  id v54 = v7;
  id v45 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v55);
  objc_destroyWeak((id *)buf);
}

void __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke_567(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained autoUnlockSpecifiers];
  uint64_t v5 = [v4 count];
  BOOL v6 = v5 != [*(id *)(a1 + 32) count];

  id v7 = objc_loadWeakRetained(v2);
  uint64_t v8 = [v7 autoUnlockSpecifiers];
  [v7 removeContiguousSpecifiers:v8 animated:v6];

  uint64_t v9 = (void *)[*(id *)(a1 + 32) copy];
  id v10 = objc_loadWeakRetained(v2);
  [v10 setAutoUnlockSpecifiers:v9];

  id v14 = objc_loadWeakRetained(v2);
  uint64_t v11 = [v14 autoUnlockSpecifiers];
  id v12 = objc_loadWeakRetained(v2);
  uint64_t v13 = [v12 specifierForID:@"PASSCODE_REQ"];
  [v14 insertContiguousSpecifiers:v11 afterSpecifier:v13 animated:v6];
}

- (BOOL)useAlternateFooterTextForPAU
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    char v3 = +[PSUIBiometrics sharedInstance];
    char v4 = [v3 isPeriocularEnrollmentSupported];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (id)autoUnlockEnabled:(id)a3
{
  char v3 = [a3 objectForKeyedSubscript:@"PSUIAutoUnlockDeviceKey"];
  char v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "unlockEnabled"));

  return v4;
}

- (void)setAutoUnlockEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"PSUIAutoUnlockDeviceKey"];
  int v9 = [v7 BOOLValue];

  if (v9)
  {
    [(PSUIPasscodeLockController *)self showAlertForPhoneAutoUnlockEnablementOfDevice:v8 ofSpecifier:v6];
  }
  else
  {
    id v10 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v16 = v8;
      _os_log_impl(&dword_23D33A000, v10, OS_LOG_TYPE_DEFAULT, "disabling autounlock device: %@", buf, 0xCu);
    }

    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60020]];
    [(PSUIPasscodeLockController *)self reloadSpecifier:v6 animated:1];
    uint64_t v11 = [(PSUIPasscodeLockController *)self autoUnlockManager];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__PSUIPasscodeLockController_setAutoUnlockEnabled_specifier___block_invoke;
    v12[3] = &unk_264E96058;
    id v13 = v8;
    id v14 = self;
    [v11 disableAutoUnlockForDevice:v13 completionHandler:v12];
  }
}

void __61__PSUIPasscodeLockController_setAutoUnlockEnabled_specifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __61__PSUIPasscodeLockController_setAutoUnlockEnabled_specifier___block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }
  }
  id v6 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "autounlock device disabled: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 40) updateAutoUnlockSpecifiers];
}

- (void)updateAutoUnlockDevicewithDevice:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__PSUIPasscodeLockController_updateAutoUnlockDevicewithDevice___block_invoke;
  v6[3] = &unk_264E953A8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __63__PSUIPasscodeLockController_updateAutoUnlockDevicewithDevice___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) uniqueID];
  id v4 = [v2 specifierForID:v3];

  if (v4)
  {
    id v5 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "Updating auto unlock specifier for device: %@", (uint8_t *)&v7, 0xCu);
    }

    [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F60020]];
    [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"PSUIAutoUnlockDeviceKey"];
    [*(id *)(a1 + 32) reloadSpecifier:v4 animated:1];
  }
}

- (void)showAlertForPhoneAutoUnlockEnablementOfDevice:(id)a3 ofSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v8 = [v6 uniqueID];
    id v7 = [(PSUIPasscodeLockController *)self specifierForID:v8];
  }
  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60020]];
  [(PSUIPasscodeLockController *)self reloadSpecifier:v7 animated:1];
  uint64_t v9 = (void *)MEMORY[0x263F82418];
  uint64_t v10 = NSString;
  uint64_t v11 = PSUI_LocalizedStringForPasscodeLock(@"PHONE_AUTO_UNLOCK_ALERT_TITLE");
  id v12 = [v6 name];
  id v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12);
  id v14 = NSString;
  int v15 = PSUI_LocalizedStringForPasscodeLock(@"PHONE_AUTO_UNLOCK_ALERT_BODY");
  __int16 v16 = [v6 name];
  uint64_t v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);
  uint64_t v18 = [v9 alertControllerWithTitle:v13 message:v17 preferredStyle:1];

  int v19 = (void *)MEMORY[0x263F82400];
  uint64_t v20 = PSUI_LocalizedStringForPasscodeLock(@"CANCEL");
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __88__PSUIPasscodeLockController_showAlertForPhoneAutoUnlockEnablementOfDevice_ofSpecifier___block_invoke;
  v32[3] = &unk_264E95978;
  id v21 = v6;
  id v33 = v21;
  id v34 = self;
  id v22 = v7;
  id v35 = v22;
  uint64_t v23 = [v19 actionWithTitle:v20 style:1 handler:v32];
  [v18 addAction:v23];

  uint64_t v24 = (void *)MEMORY[0x263F82400];
  uint64_t v25 = PSUI_LocalizedStringForPasscodeLock(@"TURN_ON");
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __88__PSUIPasscodeLockController_showAlertForPhoneAutoUnlockEnablementOfDevice_ofSpecifier___block_invoke_580;
  v29[3] = &unk_264E95978;
  v29[4] = self;
  id v30 = v21;
  id v31 = v22;
  id v26 = v22;
  id v27 = v21;
  uint64_t v28 = [v24 actionWithTitle:v25 style:0 handler:v29];

  [v18 addAction:v28];
  [v18 setPreferredAction:v28];
  [(PSUIPasscodeLockController *)self presentViewController:v18 animated:1 completion:0];
}

uint64_t __88__PSUIPasscodeLockController_showAlertForPhoneAutoUnlockEnablementOfDevice_ofSpecifier___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "Cancelled enable phone auto unlock with device: %@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) autoUnlockManager];
  [v4 declinedToEnablePhoneAutoUnlock];

  [*(id *)(a1 + 48) setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F60020]];
  return [*(id *)(a1 + 40) reloadSpecifier:*(void *)(a1 + 48) animated:1];
}

uint64_t __88__PSUIPasscodeLockController_showAlertForPhoneAutoUnlockEnablementOfDevice_ofSpecifier___block_invoke_580(uint64_t a1)
{
  return [*(id *)(a1 + 32) enableAutoUnlockForDevice:*(void *)(a1 + 40) ofSpecifier:*(void *)(a1 + 48)];
}

- (void)enableAutoUnlockForDevice:(id)a3 ofSpecifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "enabling autounlock device: %@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v7 = [(PSUIPasscodeLockController *)self specifier];

  if (!v7)
  {
    uint64_t v8 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PSUIPasscodeLockController enableAutoUnlockForDevice:ofSpecifier:]();
    }
  }
  uint64_t v9 = [(PSUIPasscodeLockController *)self specifier];
  uint64_t v10 = [v9 propertyForKey:*MEMORY[0x263F60270]];

  if (!v10)
  {
    uint64_t v11 = PSUILogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PSUIPasscodeLockController enableAutoUnlockForDevice:ofSpecifier:]();
    }
  }
  id v12 = [(PSUIPasscodeLockController *)self autoUnlockManager];
  [v12 enableAutoUnlockWithDevice:v5 passcode:v10];
}

- (void)presentAutoUnlockEnableFailureAlertWithDevice:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke;
  block[3] = &unk_264E95F90;
  id v11 = v6;
  id v12 = v7;
  int v13 = self;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke(id *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = (uint64_t)v3;
    __int16 v31 = 2112;
    id v32 = v4;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "Presenting autounlock enable failure alert of device: %@, with error: %@", buf, 0x16u);
  }

  id v5 = [a1[5] userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F08320]];

  id v7 = [a1[5] userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F6C310]];

  if (!v8)
  {
    id v8 = PSUI_LocalizedStringForPasscodeLock(@"WATCH_AUTO_UNLOCK_FAILED_BODY");
  }
  uint64_t v9 = [a1[6] errorActionWithAutoUnlockError:a1[5]];
  objc_initWeak(&location, a1[6]);
  if (v9)
  {
    uint64_t v10 = PSUI_LocalizedStringForPasscodeLock(@"OPEN");
    id v11 = &__block_literal_global_590;
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke_584;
    aBlock[3] = &unk_264E96080;
    id v24 = a1[4];
    id v12 = a1[5];
    id v13 = a1[6];
    id v25 = v12;
    id v26 = v13;
    objc_copyWeak(&v27, &location);
    id v11 = _Block_copy(aBlock);
    uint64_t v10 = PSUI_LocalizedStringForPasscodeLock(@"TRY_AGAIN");
    objc_destroyWeak(&v27);
  }
  id v14 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v30 = v9;
    __int16 v31 = 2112;
    id v32 = v6;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    uint64_t v36 = v10;
    _os_log_impl(&dword_23D33A000, v14, OS_LOG_TYPE_DEFAULT, "Presenting autounlock enable error of action type:%lu with title: %@, body: %@, actionTitle: %@", buf, 0x2Au);
  }

  uint64_t v15 = [MEMORY[0x263F82418] alertControllerWithTitle:v6 message:v8 preferredStyle:1];
  __int16 v16 = (void *)MEMORY[0x263F82400];
  uint64_t v17 = PSUI_LocalizedStringForPasscodeLock(@"CANCEL");
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke_595;
  v20[3] = &unk_264E954F8;
  id v21 = a1[5];
  id v22 = a1[4];
  uint64_t v18 = [v16 actionWithTitle:v17 style:1 handler:v20];

  int v19 = [MEMORY[0x263F82400] actionWithTitle:v10 style:0 handler:v11];
  [v15 addAction:v18];
  [v15 addAction:v19];
  [v15 setPreferredAction:v19];
  [a1[6] presentViewController:v15 animated:1 completion:0];

  objc_destroyWeak(&location);
}

void __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke_584(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 138412546;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "Retry enable auto unlock with device: %@, of previous error: %@", (uint8_t *)&v10, 0x16u);
  }

  id v5 = *(void **)(a1 + 48);
  id v6 = [*(id *)(a1 + 32) uniqueID];
  id v7 = [v5 specifierForID:v6];

  [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60020]];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained reloadSpecifier:v7 animated:1];

  id v9 = objc_loadWeakRetained((id *)(a1 + 56));
  [v9 enableAutoUnlockForDevice:*(void *)(a1 + 32) ofSpecifier:v7];
}

void __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke_588()
{
  v0 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_23D33A000, v0, OS_LOG_TYPE_DEFAULT, "Switch to watch app to setup watch for auto unlock", v3, 2u);
  }

  uint64_t v1 = [MEMORY[0x263F01880] defaultWorkspace];
  int v2 = [NSURL URLWithString:@"bridge:root=PASSCODE_ID"];
  [v1 openSensitiveURL:v2 withOptions:0];
}

void __86__PSUIPasscodeLockController_presentAutoUnlockEnableFailureAlertWithDevice_withError___block_invoke_595(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_23D33A000, v2, OS_LOG_TYPE_DEFAULT, "Ignored auto unlock enable error alert: %@ of device: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (unint64_t)errorActionWithAutoUnlockError:(id)a3
{
  uint64_t v3 = [a3 code];
  return (unint64_t)(v3 - 108) <= 0x32 && ((1 << (v3 - 108)) & 0x4000000000801) != 0;
}

- (void)manager:(id)a3 enablingLockedDevice:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a4;
  int v5 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_23D33A000, v5, OS_LOG_TYPE_DEFAULT, "autounlock device requires unlock: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)manager:(id)a3 didEnableDevice:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_23D33A000, v6, OS_LOG_TYPE_DEFAULT, "autounlock device enabled: %@", (uint8_t *)&v7, 0xCu);
  }

  [(PSUIPasscodeLockController *)self updateAutoUnlockDevicewithDevice:v5];
}

- (void)manager:(id)a3 failedToEnableDevice:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = PSUILogForCategory(1uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[PSUIPasscodeLockController manager:failedToEnableDevice:error:]();
  }

  [(PSUIPasscodeLockController *)self updateAutoUnlockDevicewithDevice:v7];
  [(PSUIPasscodeLockController *)self presentAutoUnlockEnableFailureAlertWithDevice:v7 withError:v8];
}

- (BOOL)canUnlockWatch
{
  return self->_canUnlockWatch;
}

- (void)setCanUnlockWatch:(BOOL)a3
{
  self->_BOOL canUnlockWatch = a3;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (SFAutoUnlockManager)autoUnlockManager
{
  return self->_autoUnlockManager;
}

- (void)setAutoUnlockManager:(id)a3
{
}

- (NSArray)autoUnlockSpecifiers
{
  return self->_autoUnlockSpecifiers;
}

- (void)setAutoUnlockSpecifiers:(id)a3
{
}

- (PSUIDeviceTakeOverController)dtoController
{
  return self->_dtoController;
}

- (void)setDtoController:(id)a3
{
}

- (BOOL)isFindMyEnabled
{
  return self->_isFindMyEnabled;
}

- (void)setIsFindMyEnabled:(BOOL)a3
{
  self->_isFindMyEnabled = a3;
}

- (BOOL)isObservingDTOStatusChange
{
  return self->_isObservingDTOStatusChange;
}

- (void)setIsObservingDTOStatusChange:(BOOL)a3
{
  self->_isObservingDTOStatusChange = a3;
}

- (OS_nw_path_monitor)pathMonitor
{
  return self->_pathMonitor;
}

- (void)setPathMonitor:(id)a3
{
}

- (BOOL)isInternetReachable
{
  return self->_isInternetReachable;
}

- (void)setIsInternetReachable:(BOOL)a3
{
  self->_isInternetReachable = a3;
}

- (LAPasscodeChangeService)_passcodeChangeService
{
  return self->__passcodeChangeService;
}

- (void)set_passcodeChangeService:(id)a3
{
}

- (LAPasscodeRemovalService)_passcodeRemovalService
{
  return self->__passcodeRemovalService;
}

- (void)set_passcodeRemovalService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__passcodeRemovalService, 0);
  objc_storeStrong((id *)&self->__passcodeChangeService, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_dtoController, 0);
  objc_storeStrong((id *)&self->_autoUnlockSpecifiers, 0);
  objc_storeStrong((id *)&self->_autoUnlockManager, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_voiceDialGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceDialSpecifier, 0);
}

void __45__PSUIPasscodeLockController_togglePasscode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Turn Off Passcode: Not turning off as we are Ratcheted", v2, v3, v4, v5, v6);
}

void __45__PSUIPasscodeLockController_togglePasscode___block_invoke_174_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Turn Off Passcode: Not proceeding - missing instance (self)", v2, v3, v4, v5, v6);
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeRemoveFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 _passcodeRemovalService];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_23D33A000, v2, v3, "Error encountered during passcode removal operation (%{public}@): %{public}@", v4, v5, v6, v7, v8);
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_221_cold_1(void *a1)
{
  uint64_t v1 = [a1 _passcodeChangeService];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_23D33A000, v2, v3, "Error encountered during passcode change operation (%{public}@): %{public}@", v4, v5, v6, v7, v8);
}

void __132__PSUIPasscodeLockController_showLocalAuthenticationPasscodeChangeFlowFromPresentingController_title_passcodePrompt_withCompletion___block_invoke_223_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setGraceValue:specifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "setGraceValue: No passcode", v2, v3, v4, v5, v6);
}

- (void)setGraceValue:specifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "setGraceValue: No specifier", v2, v3, v4, v5, v6);
}

void __63__PSUIPasscodeLockController_gracePeriodClearRecoveryPasscode___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__PSUIPasscodeLockController_openGracePeriodPasscodeRecoveryHelpLink__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "Failed to open passcode support url.", v2, v3, v4, v5, v6);
}

- (void)addGracePeriodPasscodeRecoveryFooterToSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "RecoveryExpiryDate is nil", v2, v3, v4, v5, v6);
}

- (void)addGracePeriodPasscodeRecoveryFooterToSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_23D33A000, v0, v1, "Now [%@] is past RecoveryExpiryDate [%@]");
}

void __52__PSUIPasscodeLockController_handleDTOStatusChanged__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Failed to update changes as missing instance (self)", v2, v3, v4, v5, v6);
}

void __56__PSUIPasscodeLockController_updateDTOSpecifierIfNeeded__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "DTO: Performing preliminary checks - No instance (self)", v2, v3, v4, v5, v6);
}

- (void)voiceDial:.cold.1()
{
  __assert_rtn("-[PSUIPasscodeLockController voiceDial:]", "PSUIPasscodeLockController.m", 1110, "MCRestrictedBoolNoData != value");
}

- (void)wallet:.cold.1()
{
  __assert_rtn("-[PSUIPasscodeLockController wallet:]", "PSUIPasscodeLockController.m", 1204, "MCRestrictedBoolNoData != value");
}

- (void)_didUpdatePasscode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "_didUpdatePasscode: No specifier", v2, v3, v4, v5, v6);
}

void __56__PSUIPasscodeLockController_updateAutoUnlockSpecifiers__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__PSUIPasscodeLockController_setAutoUnlockEnabled_specifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3(&dword_23D33A000, a2, a3, "Error when disabling autounlock device: %@, error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)enableAutoUnlockForDevice:ofSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "enableAutoUnlockForDevice: No passcode", v2, v3, v4, v5, v6);
}

- (void)enableAutoUnlockForDevice:ofSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_23D33A000, v0, v1, "enableAutoUnlockForDevice: No specifier", v2, v3, v4, v5, v6);
}

- (void)manager:failedToEnableDevice:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_23D33A000, v0, v1, "failed to enable autounlock device: %@, with error: %@");
}

@end