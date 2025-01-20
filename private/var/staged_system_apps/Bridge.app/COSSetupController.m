@interface COSSetupController
+ (BOOL)isDeviceUnlocked;
+ (BOOL)isLiveActivityFeatureEnabled;
+ (Class)signInFlowFirstControllerClass;
+ (double)delayForRevLockDuringPairingBeforeEnteringConfigureState;
+ (id)buddyFlowMapping;
+ (id)bundleFlowMapping;
+ (id)classicBuddyFlowMapping;
+ (id)loadBundleControllerClasses;
+ (id)signInFlowLastControllerClassName;
+ (id)signInFlowMapping;
+ (id)tinkerBuddyFlowMapping;
+ (void)addBundlesToTinkerFlowMapping:(id)a3;
+ (void)debugLiveActivities;
+ (void)updateMappingForYorktown:(id)a3;
- (BOOL)_controllerShouldMirrorToGizmo:(id)a3;
- (BOOL)_shouldSkipForBetterTogether:(id)a3;
- (BOOL)alreadyStartPostActivationCompatiblePairingBackgroundTasks;
- (BOOL)analyticsEnrollmentFailed;
- (BOOL)areLiveActivitiesAllowed;
- (BOOL)buddyControllerIsBeingHeldOff:(id)a3;
- (BOOL)canPairAgain;
- (BOOL)didAllowTinkerHealthSharing;
- (BOOL)didAllowTinkerLocationPermissions;
- (BOOL)didWaitAfterRevLockUpdate;
- (BOOL)doesLiveActivityProviderRequiresPairSyncNotifications;
- (BOOL)expressMode;
- (BOOL)hasAddedPasscode;
- (BOOL)hasStartedPairing;
- (BOOL)hasStartedSilentAppleIDSignIn;
- (BOOL)isAlreadyPaired;
- (BOOL)isDeKOTAFlow;
- (BOOL)isObservingLockStatusNotificationForRevLockUpdate;
- (BOOL)nextControllerToPresentAfterBlockedOnSignInStep;
- (BOOL)nrUpdatedToNormalState;
- (BOOL)offerYorktownForCurrentPairing;
- (BOOL)resolvedPreconditionsForSoftwareUpdate;
- (BOOL)setupCompletedSuccessfully;
- (BOOL)shouldForceSoftwareUpdateCheck;
- (BOOL)updateInSetupFlowHasCompleted;
- (BOOL)wristChoicesDetected;
- (BRRTCPairingReportManager)pairingReportManager;
- (COSActivationResponseManager)activationManager;
- (COSAppleIDAuthController)tinkerAuthenticationController;
- (COSAppleIDSignInModel)appleIDSignInModel;
- (COSAppleIDSilentSignInController)silentSignInController;
- (COSBuddyController)controllerDisplayedWhileOnHold;
- (COSBuddyController)nextControllerAfterHold;
- (COSBuddyNavigationController)navigationController;
- (COSInternalPairingDashboardViewController)internalDashboardController;
- (COSLinkUpgradeMonitor)linkUpgradeMonitor;
- (COSPairingCompatibility)pairingCompatiblity;
- (COSPairingTypeSelectionViewController)pairingTypeSelectionController;
- (COSPasscodeChoiceViewController)passcodeChoiceController;
- (COSPaymentExpressSetupManager)paymentExpressSetupManager;
- (COSRegistryDispatcher)alreadyPairedDispatcher;
- (COSResumePairingStateController)resumePairingController;
- (COSSetupController)init;
- (COSSetupController)initWithMode:(unint64_t)a3;
- (COSSetupSoftwareUpdateManager)setupSoftwareUpdateManager;
- (COSWatchKitAppChoiceUpdater)appChoiceUpdater;
- (COSWatchUnpairInstructionsController)unpairInstructions;
- (COSWristAttributeVisualDetector)detector;
- (Class)_updateNextControllerForSignInFlow:(Class)a3 currentControllerClass:(Class)a4;
- (Class)controllerClassToPresentAfterSignIn;
- (FAFamilyCircle)familyCircle;
- (FAFamilyMember)organizerFamilyMember;
- (FAFamilyMember)pairingParentFamilyMember;
- (FAFamilyMember)tinkerFamilyMember;
- (FAProfilePictureStore)profilePictureStore;
- (NBBackup)backupRestoredFrom;
- (NRDevice)activePairingDevice;
- (NRDevice)deviceRestoredFrom;
- (NRDevice)expressModeDevice;
- (NRDevice)scannedDevice;
- (NSArray)expressModeControllers;
- (NSData)stagedEnrollmentDataForCurrentPairing;
- (NSDate)revLockDelayAfterUpdateDate;
- (NSMutableArray)buddyControllers;
- (NSString)tinkerSignInId;
- (NSString)tinkerUserName;
- (OS_dispatch_source)holdWaitScreenPresentationTimer;
- (OS_dispatch_source)revLockDelayAfterUpdateTimer;
- (UIActivityIndicatorView)customActivityIndicator;
- (id)_alertMessageForReason:(unint64_t)a3 andCode:(id)a4;
- (id)_controllerFollowingControllerClass:(Class)a3;
- (id)_controllerForClass:(Class)a3;
- (id)_titleForViewController:(id)a3;
- (id)_viewControllerForBuddyController:(id)a3;
- (id)deferredHoldBlock;
- (id)holdWaitScreenBlock;
- (id)lastLiveActivityProvider;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4;
- (id)setupFlowUserInfo;
- (id)topBuddyController;
- (id)visualDetector;
- (unint64_t)analyticsEnrollmentRetryCount;
- (unint64_t)forcedSoftwareUpdateCheckReason;
- (unint64_t)mode;
- (unsigned)position;
- (unsigned)state;
- (unsigned)watchBuddyCompletedStages;
- (void)_buddyControllerDone:(id)a3 nextControllerClass:(Class)a4 nextController:(id)a5;
- (void)_buddyControllerReleaseHold:(id)a3 andSkip:(BOOL)a4;
- (void)_finishBuddy;
- (void)_pushBuddyController:(id)a3;
- (void)_pushBuddyController:(id)a3 ontoNavigationController:(id)a4;
- (void)_pushGizmoBuddyController:(id)a3;
- (void)_transitionFromBuddyController:(id)a3 toBuddyController:(id)a4;
- (void)activationServerResponded;
- (void)appleIDSilentSignInControllerSignedAccountType:(unint64_t)a3 withSuccess:(BOOL)a4;
- (void)blockGoingBackFromCurrentController;
- (void)buddyControllerCancelAnyHold;
- (void)buddyControllerDone:(id)a3;
- (void)buddyControllerDone:(id)a3 nextControllerClass:(Class)a4;
- (void)buddyControllerDone:(id)a3 transitionToMode:(unint64_t)a4;
- (void)buddyControllerDoneForSignIn:(id)a3;
- (void)buddyControllerHold:(id)a3 beforePresentingBuddyController:(id)a4;
- (void)buddyControllerReleaseHold:(id)a3;
- (void)buddyControllerReleaseHoldAndSkip:(id)a3;
- (void)buddyControllerWillPushNextControllerClass:(Class)a3 outNextController:(id *)a4 ontoNavigationController:(id)a5;
- (void)checkInWithPairingMetricForSignInState;
- (void)checkSafeToTransitionOnNavigationController:(id)a3 withCompletion:(id)a4;
- (void)cleanupHoldWaitTimer;
- (void)clearIdleUserNotification;
- (void)companionDidFinishHealthSharingOptIn:(BOOL)a3;
- (void)completePairingMetricForAppTermination;
- (void)dealloc;
- (void)displayCompanionTooOldPairingFailureAlertWithDismissalHandler:(id)a3;
- (void)displayPairingFailureAlertForMessage:(id)a3 title:(id)a4 failureCode:(id)a5 withCompletion:(id)a6;
- (void)displayPairingFailureAlertForReason:(unint64_t)a3 withCompletion:(id)a4;
- (void)displayPairingFailureWatchAlreadyPairedToCompanion:(id)a3 completion:(id)a4;
- (void)displayUnpairingInstructions;
- (void)displayUnsupportedTinkerHardwareFailure:(id)a3;
- (void)displayUnsupportedWatchPairingAlertToBetterTogetherDeviceWithCompletion:(id)a3;
- (void)displayUnsupportedYorktownHardwareFailure:(id)a3;
- (void)displayWatchAppearsPairedOrOffAlert:(id)a3;
- (void)endLiveActivityIfNeeded;
- (void)endLiveActivityWithEndStatus:(int64_t)a3;
- (void)finalCleanup;
- (void)finishedActivating:(id)a3;
- (void)gizmoDidFinishHealthSharingOptIn:(BOOL)a3;
- (void)invalidateState;
- (void)loadSetupBundle;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)passcodeCreationComplete;
- (void)passcodeCreationFailed;
- (void)popControllerAnimated:(BOOL)a3;
- (void)popRUIObject:(id)a3 animated:(BOOL)a4;
- (void)popViewController:(id)a3;
- (void)postUserNotificationForController:(id)a3;
- (void)prewarmVisualDetector;
- (void)promptWhetherToResetPairing:(id)a3;
- (void)promptWhetherToUpdateGizmo:(id)a3;
- (void)pushRUIObject:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)reloadAppearance;
- (void)run;
- (void)saveCombinedPasswordBasediTunesStoreAccount:(id)a3 fromAccountStore:(id)a4;
- (void)setActivePairingDevice:(id)a3;
- (void)setAlreadyPairedDispatcher:(id)a3;
- (void)setAlreadyStartPostActivationCompatiblePairingBackgroundTasks:(BOOL)a3;
- (void)setAnalyticsEnrollmentFailed:(BOOL)a3;
- (void)setAnalyticsEnrollmentRetryCount:(unint64_t)a3;
- (void)setAppChoiceUpdater:(id)a3;
- (void)setAppleIDSignInModel:(id)a3;
- (void)setBackupRestoredFrom:(id)a3;
- (void)setBuddyControllers:(id)a3;
- (void)setControllerClassToPresentAfterSignIn:(Class)a3;
- (void)setControllerDisplayedWhileOnHold:(id)a3;
- (void)setCustomActivityIndicator:(id)a3;
- (void)setDeferredHoldBlock:(id)a3;
- (void)setDetector:(id)a3;
- (void)setDeviceRestoredFrom:(id)a3;
- (void)setDidAllowTinkerHealthSharing:(BOOL)a3;
- (void)setDidAllowTinkerLocationPermissions:(BOOL)a3;
- (void)setDidWaitAfterRevLockUpdate:(BOOL)a3;
- (void)setExpressMode:(BOOL)a3;
- (void)setExpressModeControllers:(id)a3;
- (void)setExpressModeDevice:(id)a3;
- (void)setFamilyCircle:(id)a3;
- (void)setForcedSoftwareUpdateCheckReason:(unint64_t)a3;
- (void)setHasAddedPasscode:(BOOL)a3;
- (void)setHasStartedSilentAppleIDSignIn:(BOOL)a3;
- (void)setHoldWaitScreenBlock:(id)a3;
- (void)setHoldWaitScreenPresentationTimer:(id)a3;
- (void)setInternalDashboardController:(id)a3;
- (void)setIsDeKOTAFlow:(BOOL)a3;
- (void)setIsObservingLockStatusNotificationForRevLockUpdate:(BOOL)a3;
- (void)setLastLiveActivityProvider:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setNextControllerAfterHold:(id)a3;
- (void)setNrUpdatedToNormalState:(BOOL)a3;
- (void)setOrganizerFamilyMember:(id)a3;
- (void)setPairingParentFamilyMember:(id)a3;
- (void)setPairingReportManager:(id)a3;
- (void)setPairingTypeSelectionController:(id)a3;
- (void)setPasscodeChoiceController:(id)a3;
- (void)setPaymentExpressSetupManager:(id)a3;
- (void)setProfilePictureStore:(id)a3;
- (void)setResolvedPreconditionsForSoftwareUpdate:(BOOL)a3;
- (void)setResumePairingController:(id)a3;
- (void)setRevLockDelayAfterUpdateDate:(id)a3;
- (void)setRevLockDelayAfterUpdateTimer:(id)a3;
- (void)setScannedDevice:(id)a3;
- (void)setSetupCompletedSuccessfully:(BOOL)a3;
- (void)setSilentSignInController:(id)a3;
- (void)setStagedEnrollmentDataForCurrentPairing:(id)a3;
- (void)setTinkerFamilyMember:(id)a3;
- (void)setTinkerSignInId:(id)a3;
- (void)setTinkerUserName:(id)a3;
- (void)setUnpairInstructions:(id)a3;
- (void)setUpdateInSetupFlowHasCompleted:(BOOL)a3;
- (void)setWatchBuddyCompletedStages:(unsigned int)a3;
- (void)setWristChoicesDetected:(BOOL)a3;
- (void)showBusyIndicator:(BOOL)a3;
- (void)showButtonTrayBusyIndicator:(BOOL)a3 forController:(id)a4;
- (void)startLiveActivity;
- (void)startPostActivationCompatiblePairingBackgroundTasks;
- (void)startSilentAppleIDSignIn;
- (void)tellAppConduitToInstallAllApps;
- (void)tellWatchAgainToUpdateNRToNormalStateAfterRelaunchingForLanguageChange;
- (void)updateActivePairingDevice:(id)a3;
- (void)updateActivelyPairingWatchBuddyStage:(unsigned int)a3;
- (void)updateActivityAndRegenerateImages;
- (void)updateLiveActivityWithBuddyController:(id)a3;
- (void)updateLiveActivityWithTitle:(id)a3 subtitle:(id)a4;
- (void)updateLiveActivityWithViewController:(id)a3;
- (void)updateNanoRegistryToNormalState;
- (void)updateStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3;
@end

@implementation COSSetupController

+ (void)debugLiveActivities
{
  if (sub_100008380())
  {
    v2 = (uint64_t *)LiveActivityServiceDebugUtils.debugCallback.unsafeMutableAddressor();
    swift_beginAccess();
    uint64_t v3 = *v2;
    uint64_t *v2 = (uint64_t)sub_100139E64;
    v2[1] = 0;
    sub_100016354(v3);
  }
}

- (COSSetupController)init
{
  return [(COSSetupController *)self initWithMode:1];
}

- (COSSetupController)initWithMode:(unint64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)COSSetupController;
  v4 = [(COSSetupController *)&v22 init];
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    buddyControllers = v5->_buddyControllers;
    v5->_buddyControllers = v6;

    v8 = objc_alloc_init(COSBuddyNavigationController);
    navigationController = v5->_navigationController;
    v5->_navigationController = v8;

    v10 = [(COSBuddyNavigationController *)v5->_navigationController view];
    v11 = +[UIColor blackColor];
    [v10 setBackgroundColor:v11];

    [(COSBuddyNavigationController *)v5->_navigationController setDelegate:v5];
    v12 = [(COSBuddyNavigationController *)v5->_navigationController navigationBar];
    [v12 setBarStyle:1];

    [(COSBuddyNavigationController *)v5->_navigationController setBuddyNavDelegate:v5];
    v13 = [(COSBuddyNavigationController *)v5->_navigationController view];
    v14 = BPSSetupTintColor();
    [v13 setTintColor:v14];

    +[UINavigationBar _setUseCustomBackButtonAction:1];
    uint64_t v27 = objc_opt_class();
    v15 = +[NSArray arrayWithObjects:&v27 count:1];
    v16 = +[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:v15];
    NSAttributedStringKey v25 = NSFontAttributeName;
    v17 = BPSFontWithSize();
    v26 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [v16 setTitleTextAttributes:v18 forState:5];

    v19 = [(COSBuddyNavigationController *)v5->_navigationController navigationBar];
    sub_100031568(v19);

    v20 = pbb_setupflow_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SetupController initialized (%p)", buf, 0xCu);
    }
  }
  return v5;
}

- (COSAppleIDSignInModel)appleIDSignInModel
{
  appleIDSignInModel = self->_appleIDSignInModel;
  if (!appleIDSignInModel)
  {
    v4 = objc_alloc_init(COSAppleIDSignInModel);
    v5 = self->_appleIDSignInModel;
    self->_appleIDSignInModel = v4;

    appleIDSignInModel = self->_appleIDSignInModel;
  }

  return appleIDSignInModel;
}

- (void)updateActivePairingDevice:(id)a3
{
}

- (id)setupFlowUserInfo
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  tinkerFamilyMember = self->_tinkerFamilyMember;
  if (tinkerFamilyMember) {
    [v3 setObject:tinkerFamilyMember forKey:BPSPairingFlowFamilyMember];
  }
  organizerFamilyMember = self->_organizerFamilyMember;
  if (organizerFamilyMember) {
    [v4 setObject:organizerFamilyMember forKey:BPSPairingFlowFamilyOrganizer];
  }
  pairingParentFamilyMember = self->_pairingParentFamilyMember;
  if (pairingParentFamilyMember) {
    [v4 setObject:pairingParentFamilyMember forKey:BPSPairingFlowFamilyPairingParent];
  }
  v8 = [UIApp bridgeController];
  v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isTinkerPairing]);

  [v4 setObject:v9 forKey:BPSPairingFlowIsTinkerPairing];
  v10 = pbb_setupflow_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting backup info in the user info dict", (uint8_t *)&v23, 2u);
  }

  deviceRestoredFrom = self->_deviceRestoredFrom;
  v12 = pbb_setupflow_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (deviceRestoredFrom)
  {
    if (v13)
    {
      v14 = self->_deviceRestoredFrom;
      int v23 = 138412290;
      v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting Device to restore from to: %@", (uint8_t *)&v23, 0xCu);
    }

    [v4 setObject:self->_deviceRestoredFrom forKey:BPSPairingDeviceRestoredFrom];
    v12 = [(NRDevice *)self->_deviceRestoredFrom pairingID];
    [v4 setObject:v12 forKey:BPSPairingIDRestoredFrom];
  }
  else if (v13)
  {
    v15 = self->_deviceRestoredFrom;
    int v23 = 138412290;
    v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No Device to restore from to: %@", (uint8_t *)&v23, 0xCu);
  }

  backupRestoredFrom = self->_backupRestoredFrom;
  v17 = pbb_setupflow_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (backupRestoredFrom)
  {
    if (v18)
    {
      v19 = self->_backupRestoredFrom;
      int v23 = 138412290;
      v24 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Setting Backup to restore from to: %@", (uint8_t *)&v23, 0xCu);
    }

    [v4 setObject:self->_backupRestoredFrom forKey:BPSPairingBackupRestoredFrom];
  }
  else
  {
    if (v18)
    {
      v20 = self->_deviceRestoredFrom;
      int v23 = 138412290;
      v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No Backup to restore from to: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  v21 = +[NSNumber numberWithBool:self->_didAllowTinkerHealthSharing];
  [v4 setObject:v21 forKey:BPSPairingFlowIsTinkerHealthSharingEnabled];

  return v4;
}

- (void)reloadAppearance
{
  id v2 = [(COSBuddyNavigationController *)self->_navigationController navigationBar];
  sub_100031568(v2);
}

- (void)invalidateState
{
  uint64_t v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating state (self: %p)", (uint8_t *)&v20, 0xCu);
  }

  if ([(COSSetupController *)self offerYorktownForCurrentPairing]
    && self->_analyticsEnrollmentFailed)
  {
    +[PBBridgeCAReporter recordDeviceEnrollmentResult:0 retryCount:self->_analyticsEnrollmentRetryCount];
    v4 = [(COSSetupController *)self pairingReportManager];
    [v4 addPairingTimeEventToPairingReportPlist:75 withValue:&off_10025C070 withError:0];
  }
  self->_analyticsEnrollmentRetryCount = 0;
  self->_analyticsEnrollmentFailed = 0;
  [(COSLinkUpgradeMonitor *)self->_linkUpgradeMonitor resetMonitor];
  linkUpgradeMonitor = self->_linkUpgradeMonitor;
  self->_linkUpgradeMonitor = 0;

  self->_resolvedPreconditionsForSoftwareUpdate = 0;
  self->_nrUpdatedToNormalState = 0;
  self->_watchBuddyCompletedStages = 0;
  id deferredHoldBlock = self->_deferredHoldBlock;
  self->_id deferredHoldBlock = 0;

  [(COSSetupController *)self cleanupHoldWaitTimer];
  [(COSActivationResponseManager *)self->_activationManager setSetupController:0];
  activationManager = self->_activationManager;
  self->_activationManager = 0;

  [(COSSetupController *)self buddyControllerCancelAnyHold];
  self->_hasAddedPasscode = 0;
  appleIDSignInModel = self->_appleIDSignInModel;
  self->_appleIDSignInModel = 0;

  self->_hasStartedSilentAppleIDSignIn = 0;
  [(COSAppleIDSilentSignInController *)self->_silentSignInController setDelegate:0];
  silentSignInController = self->_silentSignInController;
  self->_silentSignInController = 0;

  *(_WORD *)&self->_updateInSetupFlowHasCompleted = 0;
  revLockDelayAfterUpdateDate = self->_revLockDelayAfterUpdateDate;
  self->_revLockDelayAfterUpdateDate = 0;

  revLockDelayAfterUpdateTimer = self->_revLockDelayAfterUpdateTimer;
  if (revLockDelayAfterUpdateTimer)
  {
    dispatch_source_cancel(revLockDelayAfterUpdateTimer);
    v12 = self->_revLockDelayAfterUpdateTimer;
    self->_revLockDelayAfterUpdateTimer = 0;
  }
  *(_WORD *)&self->_didWaitAfterRevLockUpdate = 0;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.keybagd.lock_status", 0);
  v14 = +[COSBackupManager sharedBackupManager];
  [v14 reset];

  id v15 = UIApp;
  [v15 resetActivationFailureCountAndReport:0];
  [v15 setIsRestoringToKnownDevice:0];
  [v15 setIsUpdatingGizmoInSetupFlow:0];
  [v15 setIsActivated:0];
  [v15 setIsLanguageAndLocaleFinished:0];
  v16 = [v15 setupController];
  [v16 setPairingReportManager:0];

  v17 = [v15 bridgeController];
  [v17 endSetupTransaction];

  [(COSRegistryDispatcher *)self->_alreadyPairedDispatcher invalidate];
  alreadyPairedDispatcher = self->_alreadyPairedDispatcher;
  self->_alreadyPairedDispatcher = 0;

  *(_WORD *)&self->_isDeKOTAFlow = 0;
  appChoiceUpdater = self->_appChoiceUpdater;
  self->_appChoiceUpdater = 0;

  [(COSSetupController *)self finalCleanup];
}

- (void)run
{
  [(COSSetupController *)self loadSetupBundle];
  +[COSInternalUserStudyAssetManager clearVideoFile];
  [(COSSetupController *)self prewarmVisualDetector];
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"finishedActivating:" name:PBBridgeGizmoDidFinishActivatingNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"activationServerResponded" name:PBBridgeActivationServerRespondedNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"passcodeCreationFailed" name:PBBridgeDidFailToCreatePasscodeNotification object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"passcodeCreationComplete" name:PBBridgeDidCompletePasscodeCreationNotification object:0];

  v7 = +[AVAudioSession sharedInstance];
  [v7 setCategory:AVAudioSessionCategoryPlayback withOptions:1 error:0];

  v8 = (COSResumePairingStateController *)objc_opt_new();
  resumePairingController = self->_resumePairingController;
  self->_resumePairingController = v8;

  [(COSResumePairingStateController *)self->_resumePairingController setSetupController:self];
  [(COSResumePairingStateController *)self->_resumePairingController loadPairingState];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10008FD0C;
  v33[3] = &unk_1002457B8;
  v33[4] = self;
  v10 = objc_retainBlock(v33);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10008FF98;
  v29[3] = &unk_100243FC0;
  id v11 = UIApp;
  id v30 = v11;
  v31 = self;
  v12 = v10;
  id v32 = v12;
  BOOL v13 = objc_retainBlock(v29);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000901C4;
  v25[3] = &unk_100245808;
  v25[4] = self;
  v14 = v12;
  id v27 = v14;
  id v15 = v11;
  id v26 = v15;
  v16 = v13;
  id v28 = v16;
  v17 = objc_retainBlock(v25);
  BOOL v18 = pbb_setupflow_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t mode = self->_mode;
    *(_DWORD *)buf = 134217984;
    unint64_t v35 = mode;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Initial pairing mode: %lu", buf, 0xCu);
  }

  unint64_t v20 = self->_mode;
  switch(v20)
  {
    case 1uLL:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100090690;
      v23[3] = &unk_100244668;
      v24 = v17;
      [(COSSetupController *)self updateStagedMDMEnrollmentDataForPairingWatchWithCompletion:v23];

      break;
    case 3uLL:
      v16[2](v16);
      break;
    case 2uLL:
      v21 = objc_alloc_init(COSResetWatchNoticeViewController);
      [(COSResetWatchNoticeViewController *)v21 setDelegate:self];
      ((void (*)(void *, COSResetWatchNoticeViewController *))v14[2])(v14, v21);

      break;
  }
  objc_super v22 = +[NSUserDefaults standardUserDefaults];
  [v22 removeObjectForKey:@"COSWatchReportedUseAfterSetup"];
}

- (void)loadSetupBundle
{
  id v2 = +[COSSetupController loadBundleControllerClasses];
}

+ (id)loadBundleControllerClasses
{
  if (qword_10029B128 != -1) {
    dispatch_once(&qword_10029B128, &stru_100245828);
  }
  id v2 = (void *)qword_10029B120;

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SetupController deallocating (%p)", buf, 0xCu);
  }

  [(COSSetupController *)self finalCleanup];
  v4.receiver = self;
  v4.super_class = (Class)COSSetupController;
  [(COSSetupController *)&v4 dealloc];
}

- (void)finalCleanup
{
  tinkerAuthenticationController = self->_tinkerAuthenticationController;
  self->_tinkerAuthenticationController = 0;

  id deferredHoldBlock = self->_deferredHoldBlock;
  self->_id deferredHoldBlock = 0;

  [(COSSetupController *)self cleanupHoldWaitTimer];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6 = self->_navigationController;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100090B60;
  block[3] = &unk_1002438A0;
  BOOL v13 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(NSMutableArray *)self->_buddyControllers removeAllObjects];
  buddyControllers = self->_buddyControllers;
  self->_buddyControllers = 0;

  navigationController = self->_navigationController;
  self->_navigationController = 0;

  controllerDisplayedWhileOnHold = self->_controllerDisplayedWhileOnHold;
  self->_controllerDisplayedWhileOnHold = 0;

  nextControllerAfterHold = self->_nextControllerAfterHold;
  self->_nextControllerAfterHold = 0;

  [(COSSetupController *)self endLiveActivityWithEndStatus:0];
}

- (BOOL)isAlreadyPaired
{
  id v2 = sub_100014784();
  uint64_t v3 = +[NRPairedDeviceRegistry sharedInstance];
  id v4 = [v3 status];

  v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NRPairedDeviceRegistryStatusCodeString();
    int v9 = 138412546;
    v10 = v2;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Paired Devices %@ Status %@", (uint8_t *)&v9, 0x16u);
  }
  BOOL v7 = v4 == (id)2 && [v2 count] != 0;

  return v7;
}

- (BOOL)canPairAgain
{
  int v2 = PBPairedSyncComplete();
  if (v2)
  {
    LOBYTE(v2) = sub_10000A2A4(0, 0);
  }
  return v2;
}

- (BOOL)hasStartedPairing
{
  int v2 = [(COSBuddyNavigationController *)self->_navigationController viewControllers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)displayUnpairingInstructions
{
  BOOL v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Already Paired Detector] has watch that is alt account and this watch is already paired, give instructions to unpair", v6, 2u);
  }

  id v4 = objc_alloc_init(COSWatchUnpairInstructionsController);
  unpairInstructions = self->_unpairInstructions;
  self->_unpairInstructions = v4;

  [(COSWatchUnpairInstructionsController *)self->_unpairInstructions presentWithController:self->_navigationController];
}

- (void)displayWatchAppearsPairedOrOffAlert:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"WATCH_IS_OFF_OR_ALREADY_PAIRED_ALERT_BODY" value:&stru_100249230 table:@"Localizable"];

  if (PBIsInternalInstall())
  {
    uint64_t v6 = [v5 stringByAppendingString:@"\n\n[Internal-Only: This alert appearing unexpectedly may indicate that your development watch is not correctly advertising (the heuristic behind this is looking for an advertising watch in the camera frame). Please re-try pairing after rebooting your Apple Watch and if issues persist file a radar with Pepper Pairing.]"];

    v5 = (void *)v6;
  }
  BOOL v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"WATCH_IS_OFF_OR_ALREADY_PAIRED_ALERT_TITLE" value:&stru_100249230 table:@"Localizable"];
  int v9 = +[UIAlertController alertControllerWithTitle:v8 message:v5 preferredStyle:1];

  v10 = +[NSBundle mainBundle];
  __int16 v11 = [v10 localizedStringForKey:@"WATCH_IS_OFF_OR_ALREADY_PAIRED_ALERT_LINK" value:&stru_100249230 table:@"Localizable"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000910C8;
  v21[3] = &unk_100245850;
  id v12 = v3;
  id v22 = v12;
  BOOL v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v21];

  [v9 addAction:v13];
  [v9 setPreferredAction:v13];
  v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"WATCH_IS_OFF_OR_ALREADY_PAIRED_ALERT_CANCEL" value:&stru_100249230 table:@"Localizable"];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100091170;
  v19[3] = &unk_100245850;
  id v20 = v12;
  id v16 = v12;
  v17 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v19];

  [v9 addAction:v17];
  [(COSBuddyNavigationController *)self->_navigationController presentViewController:v9 animated:1 completion:0];
}

- (void)displayCompanionTooOldPairingFailureAlertWithDismissalHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"COMPANION_TOO_OLD_ALERT_TITLE" value:&stru_100249230 table:@"Localizable"];
  uint64_t v6 = +[NSBundle mainBundle];
  BOOL v7 = [v6 localizedStringForKey:@"COMPANION_TOO_OLD_ALERT_BODY" value:&stru_100249230 table:@"Localizable"];
  v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  int v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"COMPANION_TOO_OLD_ALERT_UPDATE" value:&stru_100249230 table:@"Localizable"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100091450;
  v21[3] = &unk_100245850;
  id v11 = v3;
  id v22 = v11;
  id v12 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v21];

  [v8 addAction:v12];
  [v8 setPreferredAction:v12];
  BOOL v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"COMPANION_TOO_OLD_ALERT_CANCEL" value:&stru_100249230 table:@"Localizable"];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000914F8;
  v19[3] = &unk_100245850;
  id v20 = v11;
  id v15 = v11;
  id v16 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v19];

  [v8 addAction:v16];
  v17 = pbb_setupflow_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10017300C();
  }

  [(COSBuddyNavigationController *)self->_navigationController presentViewController:v8 animated:1 completion:0];
}

- (void)displayUnsupportedTinkerHardwareFailure:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"UNSUPPORTED_TINKER_HW_ALERT_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];
  BOOL v7 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:1];

  uint64_t v8 = +[NSBundle mainBundle];
  int v9 = [(id)v8 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100091710;
  v14[3] = &unk_100245850;
  id v10 = v4;
  id v15 = v10;
  id v11 = +[UIAlertAction actionWithTitle:v9 style:1 handler:v14];

  [v7 addAction:v11];
  id v12 = [(COSBuddyNavigationController *)self->_navigationController presentedViewController];
  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();

  if (v8) {
    [(COSBuddyNavigationController *)self->_navigationController dismissViewControllerAnimated:1 completion:0];
  }
  BOOL v13 = pbb_setupflow_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_100173040();
  }

  [(COSBuddyNavigationController *)self->_navigationController presentViewController:v7 animated:1 completion:0];
}

- (void)setPairingParentFamilyMember:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_pairingParentFamilyMember, a3);
  if (self->_pairingParentFamilyMember)
  {
    uint64_t v6 = +[NRPairedDeviceRegistry sharedInstance];
    BOOL v7 = [v5 iTunesAccountUsername];
    uint64_t v8 = [v5 altDSID];
    int v9 = [(COSSetupController *)self activePairingDevice];
    [v6 pairingClientSetPairingParentName:v7 pairingParentAltDSID:v8 forDevice:v9 completion:&stru_100245870];
  }
  else
  {
    id v10 = pbb_setupflow_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting pairing parent to nil", v11, 2u);
    }
  }
}

- (void)displayUnsupportedYorktownHardwareFailure:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"UNSUPPORTED_YORKTOWN_HW_ALERT_TITLE" value:&stru_100249230 table:@"Localizable-yorktown"];
  BOOL v7 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:1];

  uint64_t v8 = +[NSBundle mainBundle];
  int v9 = [(id)v8 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100091A90;
  v14[3] = &unk_100245850;
  id v10 = v4;
  id v15 = v10;
  id v11 = +[UIAlertAction actionWithTitle:v9 style:1 handler:v14];

  [v7 addAction:v11];
  id v12 = [(COSBuddyNavigationController *)self->_navigationController presentedViewController];
  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();

  if (v8) {
    [(COSBuddyNavigationController *)self->_navigationController dismissViewControllerAnimated:1 completion:0];
  }
  BOOL v13 = pbb_setupflow_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1001730F8();
  }

  [(COSBuddyNavigationController *)self->_navigationController presentViewController:v7 animated:1 completion:0];
}

- (void)promptWhetherToUpdateGizmo:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"OUT_OF_DATE_ALERT_TITLE" value:&stru_100249230 table:@"Localizable"];
  uint64_t v6 = +[NSBundle mainBundle];
  BOOL v7 = [v6 localizedStringForKey:@"OUT_OF_DATE_ALERT_BODY" value:&stru_100249230 table:@"Localizable"];
  uint64_t v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  int v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"OUT_OF_DATE_ALERT_LATER" value:&stru_100249230 table:@"Localizable"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100091D60;
  v22[3] = &unk_100245850;
  id v11 = v3;
  id v23 = v11;
  id v12 = +[UIAlertAction actionWithTitle:v10 style:1 handler:v22];
  [v8 addAction:v12];

  BOOL v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"OUT_OF_DATE_ALERT_NOW" value:&stru_100249230 table:@"Localizable"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100091D74;
  v20[3] = &unk_100245850;
  id v21 = v11;
  id v15 = v11;
  id v16 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v20];
  [v8 addAction:v16];

  v17 = pbb_setupflow_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10017312C();
  }

  BOOL v18 = [(COSSetupController *)self navigationController];
  [v18 presentViewController:v8 animated:1 completion:0];
}

- (void)displayUnsupportedWatchPairingAlertToBetterTogetherDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"UNSUPPORTED_WATCH_PAIRED_TO_BETTER_TOGETHER_DEMO_DEVICE_ALERT_TITLE" value:&stru_100249230 table:@"Localizable"];
  BOOL v7 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:1];

  uint64_t v8 = +[NSBundle mainBundle];
  int v9 = [v8 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100091F40;
  v13[3] = &unk_100245850;
  id v14 = v4;
  id v10 = v4;
  id v11 = +[UIAlertAction actionWithTitle:v9 style:1 handler:v13];

  [v7 addAction:v11];
  id v12 = pbb_setupflow_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100173160();
  }

  [(COSBuddyNavigationController *)self->_navigationController presentViewController:v7 animated:1 completion:0];
}

+ (BOOL)isDeviceUnlocked
{
  int v2 = MKBGetDeviceLockState();
  return v2 == 3 || v2 == 0;
}

+ (double)delayForRevLockDuringPairingBeforeEnteringConfigureState
{
  Boolean keyExistsAndHasValidFormat = 0;
  double result = (double)CFPreferencesGetAppIntegerValue(@"DelayBeforeEnteringConfigureState", @"com.apple.Bridge", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 300.0;
  }
  return result;
}

- (BOOL)shouldForceSoftwareUpdateCheck
{
  return [(COSPairingCompatibility *)self->_pairingCompatiblity failSafeUpdateRequested];
}

- (void)setPairingReportManager:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_pairingReportManager, a3);
  if (sub_100008380())
  {
    id v5 = objc_alloc_init(COSInternalPairingDashboardViewController);
    internalDashboardController = self->_internalDashboardController;
    self->_internalDashboardController = v5;

    [(COSBuddyNavigationController *)self->_navigationController showInternalDashboard];
  }
}

- (void)displayPairingFailureAlertForReason:(unint64_t)a3 withCompletion:(id)a4
{
  id v12 = (void (**)(void))a4;
  uint64_t v6 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v7 = [v6 BOOLForKey:@"LiveOnCollection"];

  if (v7)
  {
    if (v12) {
      v12[2]();
    }
  }
  else
  {
    uint64_t v8 = +[NSNumber numberWithLong:CFPreferencesGetAppIntegerValue(PBBridgeLastNRFailureCode, PBBridgeConnectionIdentifier, 0)];
    int v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"GENERIC_PAIRING_FAILURE_ALERT_TITLE" value:&stru_100249230 table:@"Localizable"];

    id v11 = [(COSSetupController *)self _alertMessageForReason:a3 andCode:v8];
    [(COSSetupController *)self displayPairingFailureAlertForMessage:v11 title:v10 failureCode:v8 withCompletion:v12];
  }
}

- (id)_alertMessageForReason:(unint64_t)a3 andCode:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = sub_100008380();
  unsigned __int8 v7 = v6;
  switch(a3)
  {
    case 1uLL:
      uint64_t v8 = +[NSBundle mainBundle];
      uint64_t v9 = [(__CFString *)v8 localizedStringForKey:@"PIN_INCORRECT_PAIRING_FAILURE_ALERT_BODY" value:&stru_100249230 table:@"Localizable"];
      goto LABEL_20;
    case 2uLL:
      uint64_t v8 = +[NSBundle mainBundle];
      id v10 = SFLocalizableWAPIStringKeyForKey();
      uint64_t v11 = [(__CFString *)v8 localizedStringForKey:v10 value:&stru_100249230 table:@"Localizable"];

      goto LABEL_21;
    case 3uLL:
      if ((v6 & 1) == 0) {
        goto LABEL_16;
      }
      uint64_t v8 = @"[Internal] Activation failed. Your Apple Watch couldn't pair with your iPhone.";
      break;
    case 4uLL:
      if ((v6 & 1) == 0) {
        goto LABEL_16;
      }
      uint64_t v8 = @"[Internal] Activation failed to create a request on your Apple Watch, so pairing was unsuccessful. You can reboot both devices and try again.";
      break;
    case 5uLL:
    case 7uLL:
      if ((v6 & 1) == 0) {
        goto LABEL_16;
      }
      uint64_t v8 = @"[Internal] Activation failed on the server. Your Apple Watch couldn't pair to your iPhone";
      break;
    case 6uLL:
    case 0xAuLL:
      if ((v6 & 1) == 0) {
        goto LABEL_16;
      }
      uint64_t v8 = @"[Internal] Activation timed out, and failed. Your Apple Watch couldn't pair to your iPhone";
      break;
    case 8uLL:
      if ((v6 & 1) == 0) {
        goto LABEL_16;
      }
      uint64_t v8 = @"[Internal] Your Apple Watch could not be discovered by your iPhone. Try turning Bluetooth off and on in your iPhone's settings and try again.";
      break;
    case 9uLL:
      if ((v6 & 1) == 0) {
        goto LABEL_16;
      }
      uint64_t v8 = @"[Internal] IDS message send failed.";
      break;
    default:
LABEL_16:
      id v12 = +[NSBundle mainBundle];
      uint64_t v8 = [v12 localizedStringForKey:@"GENERIC_PAIRING_FAILURE_ALERT_BODY" value:&stru_100249230 table:@"Localizable"];

      char v13 = v7 ^ 1;
      if (!v5) {
        char v13 = 1;
      }
      if ((v13 & 1) == 0)
      {
        uint64_t v9 = +[NSString stringWithFormat:@"[Internal] Your Apple Watch couldn't pair with your iPhone. Error code: %@", v5];
LABEL_20:
        uint64_t v11 = v9;
LABEL_21:

        uint64_t v8 = (__CFString *)v11;
      }
      break;
  }

  return v8;
}

- (void)displayPairingFailureAlertForMessage:(id)a3 title:(id)a4 failureCode:(id)a5 withCompletion:(id)a6
{
  id v8 = a6;
  uint64_t v9 = +[UIAlertController alertControllerWithTitle:a4 message:a3 preferredStyle:1];
  id v10 = +[NSBundle mainBundle];
  uint64_t v11 = [v10 localizedStringForKey:@"GENERIC_PAIRING_FAILURE_ALERT_START_OVER" value:&stru_100249230 table:@"Localizable"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100092628;
  v23[3] = &unk_100245850;
  id v12 = v8;
  id v24 = v12;
  char v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v23];
  [v9 addAction:v13];

  id v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"GENERIC_PAIRING_FAILURE_ALERT_LEARN_MORE" value:&stru_100249230 table:@"Localizable"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100092640;
  v21[3] = &unk_100245850;
  id v22 = v12;
  id v16 = v12;
  v17 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v21];
  [v9 addAction:v17];

  BOOL v18 = pbb_setupflow_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
    sub_1001731C8();
  }

  if (!v16)
  {
    v19 = pbb_setupflow_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100173194();
    }
  }
  [(COSBuddyNavigationController *)self->_navigationController presentViewController:v9 animated:1 completion:0];
}

- (void)displayPairingFailureWatchAlreadyPairedToCompanion:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NRPairedDeviceRegistry sharedInstance];
  id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];

  id v10 = [v8 deviceForPairingID:v9];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100092AD4;
  v35[3] = &unk_1002458E0;
  v35[4] = self;
  id v29 = v10;
  id v36 = v29;
  id v28 = v6;
  id v37 = v28;
  uint64_t v11 = objc_retainBlock(v35);
  id v12 = +[NSBundle mainBundle];
  char v13 = [v12 localizedStringForKey:@"ALREADY_PAIRED_TITLE" value:&stru_100249230 table:@"Localizable"];
  id v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"ALREADY_PAIRED_BODY" value:&stru_100249230 table:@"Localizable"];
  id v16 = +[UIAlertController alertControllerWithTitle:v13 message:v15 preferredStyle:1];

  v17 = +[NSBundle mainBundle];
  BOOL v18 = [v17 localizedStringForKey:@"ALREADY_PAIRED_CANCEL" value:&stru_100249230 table:@"Localizable"];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100092DD8;
  v33[3] = &unk_100245850;
  v19 = v11;
  id v34 = v19;
  id v20 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v33];
  [v16 addAction:v20];

  id v21 = +[NSBundle mainBundle];
  id v22 = [v21 localizedStringForKey:@"ALREADY_PAIRED_UNPAIR" value:&stru_100249230 table:@"Localizable"];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100092DEC;
  v31[3] = &unk_100245908;
  v31[4] = self;
  id v32 = v19;
  id v23 = v19;
  id v24 = +[UIAlertAction actionWithTitle:v22 style:0 handler:v31];
  [v16 addAction:v24];

  NSAttributedStringKey v25 = pbb_setupflow_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Presenting 'watch already paired' alert", buf, 2u);
  }

  id v26 = [(COSSetupController *)self navigationController];
  id v27 = [v26 visibleViewController];
  [v27 presentViewController:v16 animated:1 completion:0];
}

- (void)setTinkerUserName:(id)a3
{
  objc_storeStrong((id *)&self->_tinkerUserName, a3);
  id v4 = a3;
  id v7 = [UIApp activeWatch];
  id v5 = objc_alloc((Class)NPSDomainAccessor);
  id v6 = [v5 initWithDomain:kBridgeDomain pairedDevice:v7];
  [v6 setObject:v4 forKey:@"kTinkerUserNameKey"];
}

- (void)setTinkerFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_tinkerFamilyMember, a3);
  id v5 = a3;
  id v6 = +[BPSTinkerSupport sharedInstance];
  [v6 setTinkerFamilyMember:v5];

  id v7 = [v5 firstName];
  [(COSSetupController *)self setTinkerUserName:v7];

  id v8 = +[UIApplication sharedApplication];
  id v9 = [v8 bridgeController];
  [v9 tellWatchToChangeDeviceNameFor:v5];

  id v10 = +[NSNotificationCenter defaultCenter];

  [v10 postNotificationName:BPSTinkerFamilyMemberNameSet object:0];
}

+ (id)buddyFlowMapping
{
  id v3 = [UIApp bridgeController];
  unsigned int v4 = [v3 isTinkerPairing];

  if (v4) {
    [a1 tinkerBuddyFlowMapping];
  }
  else {
  id v5 = [a1 classicBuddyFlowMapping];
  }

  return v5;
}

+ (void)addBundlesToTinkerFlowMapping:(id)a3
{
  id v89 = a3;
  if (NSClassFromString(@"HKBridgeSetupPrincipalClass"))
  {
    Class v3 = NSClassFromString(@"HKBridgeSetupPrincipalClass");
    unsigned int v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    [v89 setObject:v3 forKeyedSubscript:v5];

    Class v6 = NSClassFromString(@"CHASActivitySetupMetricsCollectionViewController");
    id v7 = NSClassFromString(@"HKBridgeSetupPrincipalClass");
    id v8 = NSStringFromClass(v7);
    [v89 setObject:v6 forKeyedSubscript:v8];
  }
  if (NSClassFromString(@"TextSettingsMiniFlowController")
    && NSClassFromString(@"AccessibilitySettingsMiniFlowController"))
  {
    Class v9 = NSClassFromString(@"TextSettingsMiniFlowController");
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    [v89 setObject:v9 forKeyedSubscript:v11];

    Class v12 = NSClassFromString(@"AccessibilitySettingsMiniFlowController");
    char v13 = NSClassFromString(@"TextSettingsMiniFlowController");
    id v14 = NSStringFromClass(v13);
    [v89 setObject:v12 forKeyedSubscript:v14];

    uint64_t v15 = objc_opt_class();
    id v16 = NSClassFromString(@"AccessibilitySettingsMiniFlowController");
    v17 = NSStringFromClass(v16);
    [v89 setObject:v15 forKeyedSubscript:v17];
  }
  if (NSClassFromString(@"NCBSBridgeSetupController"))
  {
    BOOL v18 = [v89 allKeysForObject:objc_opt_class()];
    v19 = [v18 firstObject];
    id v20 = NSClassFromString(v19);

    Class v21 = NSClassFromString(@"NCBSBridgeSetupController");
    id v22 = NSStringFromClass(v20);
    [v89 setObject:v21 forKeyedSubscript:v22];

    uint64_t v23 = objc_opt_class();
    id v24 = NSClassFromString(@"NCBSBridgeSetupController");
    NSAttributedStringKey v25 = NSStringFromClass(v24);
    [v89 setObject:v23 forKeyedSubscript:v25];
  }
  id v26 = [UIApp activeWatch];
  id v27 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6E76AC51-634C-415F-8491-C6784AF2C471"];
  if ([v26 supportsCapability:v27])
  {
    id v28 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"BD0302DD-00BC-43C2-81E9-48C038E6F8BB"];
    unsigned int v29 = [v26 supportsCapability:v28] ^ 1;
  }
  else
  {
    unsigned int v29 = 0;
  }

  if (NSClassFromString(@"CompanionAppViewSetup"))
  {
    if (NSClassFromString(@"CompanionAppViewSetupViewController")) {
      unsigned int v30 = v29;
    }
    else {
      unsigned int v30 = 0;
    }
  }
  else
  {
    unsigned int v30 = 0;
  }
  v31 = (objc_class *)objc_opt_class();
  id v32 = NSStringFromClass(v31);
  Class v33 = (Class)[v89 objectForKeyedSubscript:v32];

  if (!NSClassFromString(@"SCLSetupPrincipleClass"))
  {
    if (!v30) {
      goto LABEL_23;
    }
    Class v38 = NSClassFromString(@"CompanionAppViewSetup");
    v39 = (objc_class *)objc_opt_class();
    goto LABEL_21;
  }
  id v34 = @"SCLSetupPrincipleClass";
  Class v35 = NSClassFromString(@"SCLSetupPrincipleClass");
  id v36 = (objc_class *)objc_opt_class();
  id v37 = NSStringFromClass(v36);
  [v89 setObject:v35 forKeyedSubscript:v37];

  if (v30)
  {
    Class v38 = NSClassFromString(@"CompanionAppViewSetup");
    v39 = NSClassFromString(@"SCLSetupPrincipleClass");
LABEL_21:
    v40 = NSStringFromClass(v39);
    [v89 setObject:v38 forKeyedSubscript:v40];

    id v34 = @"CompanionAppViewSetup";
  }
  v41 = NSClassFromString(&v34->isa);
  v42 = NSStringFromClass(v41);
  [v89 setObject:v33 forKeyedSubscript:v42];

LABEL_23:
  if (NSClassFromString(@"NPHCellularSetupBridgeBuddyUIPrincipalClass"))
  {
    Class v43 = NSClassFromString(@"NPHCellularSetupBridgeBuddyUIPrincipalClass");
    v44 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v44);
    [v89 setObject:v43 forKeyedSubscript:v45];

    uint64_t v46 = objc_opt_class();
    v47 = NSClassFromString(@"NPHCellularSetupBridgeBuddyUIPrincipalClass");
    v48 = NSStringFromClass(v47);
    [v89 setObject:v46 forKeyedSubscript:v48];
  }
  v49 = +[UIDevice currentDevice];
  unsigned int v50 = [v49 sf_isChinaRegionCellularDevice];

  if (v50)
  {
    if (NSClassFromString(@"CKMPRBridgeBuddyUIPrincipalClass")
      && NSClassFromString(@"AccessibilitySettingsMiniFlowController"))
    {
      Class v51 = NSClassFromString(@"CKMPRBridgeBuddyUIPrincipalClass");
      v52 = NSClassFromString(@"AccessibilitySettingsMiniFlowController");
      v53 = NSStringFromClass(v52);
      [v89 setObject:v51 forKeyedSubscript:v53];

      uint64_t v54 = objc_opt_class();
      v55 = NSClassFromString(@"CKMPRBridgeBuddyUIPrincipalClass");
      v56 = NSStringFromClass(v55);
      [v89 setObject:v54 forKeyedSubscript:v56];
    }
    if (NSClassFromString(@"CKMPRiMessageContactsTransparencyViewController"))
    {
      Class v57 = NSClassFromString(@"CKMPRiMessageContactsTransparencyViewController");
      v58 = NSClassFromString(@"AccessibilitySettingsMiniFlowController");
      v59 = NSStringFromClass(v58);
      [v89 setObject:v57 forKeyedSubscript:v59];

      Class v60 = NSClassFromString(@"CKMPRBridgeBuddyUIPrincipalClass");
      v61 = NSClassFromString(@"CKMPRiMessageContactsTransparencyViewController");
      v62 = NSStringFromClass(v61);
      [v89 setObject:v60 forKeyedSubscript:v62];
    }
  }
  if (NSClassFromString(@"HeartRateNotificationsViewController"))
  {
    Class v63 = NSClassFromString(@"HeartRateNotificationsViewController");
    v64 = (objc_class *)objc_opt_class();
    v65 = NSStringFromClass(v64);
    [v89 setObject:v63 forKeyedSubscript:v65];

    Class v66 = NSClassFromString(@"HeartRateNotificationsViewController");
    v67 = (objc_class *)objc_opt_class();
    v68 = NSStringFromClass(v67);
    [v89 setObject:v66 forKeyedSubscript:v68];

    Class v69 = NSClassFromString(@"HeartRateNotificationsViewController");
    v70 = (objc_class *)objc_opt_class();
    v71 = NSStringFromClass(v70);
    [v89 setObject:v69 forKeyedSubscript:v71];

    uint64_t v72 = objc_opt_class();
    v73 = NSClassFromString(@"HeartRateNotificationsViewController");
    v74 = NSStringFromClass(v73);
    [v89 setObject:v72 forKeyedSubscript:v74];
  }
  if (!NSClassFromString(@"BPSStingSetupPrincipalClass"))
  {
LABEL_39:
    if (!NSClassFromString(@"DepthSetupPrincipalClass")) {
      goto LABEL_46;
    }
    if (!v30) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  Class v75 = NSClassFromString(@"SCLSetupPrincipleClass");
  Class v76 = NSClassFromString(@"BPSStingSetupPrincipalClass");
  if (v75) {
    v77 = NSClassFromString(@"SCLSetupPrincipleClass");
  }
  else {
    v77 = (objc_class *)objc_opt_class();
  }
  v78 = NSStringFromClass(v77);
  [v89 setObject:v76 forKeyedSubscript:v78];

  if (NSClassFromString(@"DepthSetupPrincipalClass"))
  {
    Class v79 = NSClassFromString(@"DepthSetupPrincipalClass");
    v80 = NSClassFromString(@"BPSStingSetupPrincipalClass");
    v81 = NSStringFromClass(v80);
    [v89 setObject:v79 forKeyedSubscript:v81];

    goto LABEL_39;
  }
  if (v30)
  {
    Class v82 = NSClassFromString(@"CompanionAppViewSetup");
    v83 = NSClassFromString(@"BPSStingSetupPrincipalClass");
    v84 = NSStringFromClass(v83);
    [v89 setObject:v82 forKeyedSubscript:v84];

    if (!NSClassFromString(@"DepthSetupPrincipalClass")) {
      goto LABEL_46;
    }
LABEL_44:
    Class v33 = NSClassFromString(@"CompanionAppViewSetup");
LABEL_45:
    v85 = NSClassFromString(@"DepthSetupPrincipalClass");
    v86 = NSStringFromClass(v85);
    [v89 setObject:v33 forKeyedSubscript:v86];

    goto LABEL_46;
  }
  v87 = NSClassFromString(@"BPSStingSetupPrincipalClass");
  v88 = NSStringFromClass(v87);
  [v89 setObject:v33 forKeyedSubscript:v88];

  if (NSClassFromString(@"DepthSetupPrincipalClass")) {
    goto LABEL_45;
  }
LABEL_46:
}

+ (id)tinkerBuddyFlowMapping
{
  int v2 = (objc_class *)objc_opt_class();
  v100 = NSStringFromClass(v2);
  v102[0] = v100;
  v103[0] = objc_opt_class();
  Class v3 = (objc_class *)objc_opt_class();
  v99 = NSStringFromClass(v3);
  v102[1] = v99;
  v103[1] = objc_opt_class();
  unsigned int v4 = (objc_class *)objc_opt_class();
  v98 = NSStringFromClass(v4);
  v102[2] = v98;
  v103[2] = objc_opt_class();
  id v5 = (objc_class *)objc_opt_class();
  v97 = NSStringFromClass(v5);
  v102[3] = v97;
  v103[3] = objc_opt_class();
  Class v6 = (objc_class *)objc_opt_class();
  v96 = NSStringFromClass(v6);
  v102[4] = v96;
  v103[4] = objc_opt_class();
  id v7 = (objc_class *)objc_opt_class();
  v95 = NSStringFromClass(v7);
  v102[5] = v95;
  v103[5] = objc_opt_class();
  id v8 = (objc_class *)objc_opt_class();
  v94 = NSStringFromClass(v8);
  v102[6] = v94;
  v103[6] = objc_opt_class();
  Class v9 = (objc_class *)objc_opt_class();
  v93 = NSStringFromClass(v9);
  v102[7] = v93;
  v103[7] = objc_opt_class();
  id v10 = (objc_class *)objc_opt_class();
  v92 = NSStringFromClass(v10);
  v102[8] = v92;
  v103[8] = objc_opt_class();
  uint64_t v11 = (objc_class *)objc_opt_class();
  v91 = NSStringFromClass(v11);
  v102[9] = v91;
  v103[9] = objc_opt_class();
  Class v12 = (objc_class *)objc_opt_class();
  v90 = NSStringFromClass(v12);
  v102[10] = v90;
  v103[10] = objc_opt_class();
  char v13 = (objc_class *)objc_opt_class();
  id v89 = NSStringFromClass(v13);
  v102[11] = v89;
  v103[11] = objc_opt_class();
  id v14 = (objc_class *)objc_opt_class();
  v88 = NSStringFromClass(v14);
  v102[12] = v88;
  v103[12] = objc_opt_class();
  uint64_t v15 = (objc_class *)objc_opt_class();
  v87 = NSStringFromClass(v15);
  v102[13] = v87;
  v103[13] = objc_opt_class();
  id v16 = (objc_class *)objc_opt_class();
  v86 = NSStringFromClass(v16);
  v102[14] = v86;
  v103[14] = objc_opt_class();
  v17 = (objc_class *)objc_opt_class();
  v85 = NSStringFromClass(v17);
  v102[15] = v85;
  v103[15] = objc_opt_class();
  BOOL v18 = (objc_class *)objc_opt_class();
  v84 = NSStringFromClass(v18);
  v102[16] = v84;
  v103[16] = objc_opt_class();
  v19 = (objc_class *)objc_opt_class();
  v83 = NSStringFromClass(v19);
  v102[17] = v83;
  v103[17] = objc_opt_class();
  id v20 = (objc_class *)objc_opt_class();
  Class v82 = NSStringFromClass(v20);
  v102[18] = v82;
  v103[18] = objc_opt_class();
  Class v21 = (objc_class *)objc_opt_class();
  v81 = NSStringFromClass(v21);
  v102[19] = v81;
  v103[19] = objc_opt_class();
  id v22 = (objc_class *)objc_opt_class();
  v80 = NSStringFromClass(v22);
  v102[20] = v80;
  v103[20] = objc_opt_class();
  uint64_t v23 = (objc_class *)objc_opt_class();
  Class v79 = NSStringFromClass(v23);
  v102[21] = v79;
  v103[21] = objc_opt_class();
  id v24 = (objc_class *)objc_opt_class();
  v78 = NSStringFromClass(v24);
  v102[22] = v78;
  v103[22] = objc_opt_class();
  NSAttributedStringKey v25 = (objc_class *)objc_opt_class();
  v77 = NSStringFromClass(v25);
  v102[23] = v77;
  v103[23] = objc_opt_class();
  id v26 = (objc_class *)objc_opt_class();
  Class v76 = NSStringFromClass(v26);
  v102[24] = v76;
  v103[24] = objc_opt_class();
  id v27 = (objc_class *)objc_opt_class();
  Class v75 = NSStringFromClass(v27);
  v102[25] = v75;
  v103[25] = objc_opt_class();
  id v28 = (objc_class *)objc_opt_class();
  v74 = NSStringFromClass(v28);
  v102[26] = v74;
  v103[26] = objc_opt_class();
  unsigned int v29 = (objc_class *)objc_opt_class();
  v73 = NSStringFromClass(v29);
  v102[27] = v73;
  v103[27] = objc_opt_class();
  unsigned int v30 = (objc_class *)objc_opt_class();
  uint64_t v72 = NSStringFromClass(v30);
  v102[28] = v72;
  v103[28] = NSClassFromString(@"VTUITinkerSiriOptinViewController");
  v31 = NSClassFromString(@"VTUITinkerSiriOptinViewController");
  v71 = NSStringFromClass(v31);
  v102[29] = v71;
  v103[29] = objc_opt_class();
  id v32 = NSClassFromString(@"VTUITinkerSiriVoiceSelectionViewController");
  v70 = NSStringFromClass(v32);
  v102[30] = v70;
  v103[30] = objc_opt_class();
  Class v33 = (objc_class *)objc_opt_class();
  Class v69 = NSStringFromClass(v33);
  v102[31] = v69;
  v103[31] = objc_opt_class();
  id v34 = (objc_class *)objc_opt_class();
  v68 = NSStringFromClass(v34);
  v102[32] = v68;
  v103[32] = objc_opt_class();
  Class v35 = (objc_class *)objc_opt_class();
  v67 = NSStringFromClass(v35);
  v102[33] = v67;
  v103[33] = objc_opt_class();
  id v36 = (objc_class *)objc_opt_class();
  Class v66 = NSStringFromClass(v36);
  v102[34] = v66;
  v103[34] = objc_opt_class();
  id v37 = (objc_class *)objc_opt_class();
  v65 = NSStringFromClass(v37);
  v102[35] = v65;
  v103[35] = objc_opt_class();
  Class v38 = (objc_class *)objc_opt_class();
  v64 = NSStringFromClass(v38);
  v102[36] = v64;
  v103[36] = objc_opt_class();
  v39 = (objc_class *)objc_opt_class();
  Class v63 = NSStringFromClass(v39);
  v102[37] = v63;
  v103[37] = objc_opt_class();
  v40 = (objc_class *)objc_opt_class();
  v62 = NSStringFromClass(v40);
  v102[38] = v62;
  v103[38] = objc_opt_class();
  v41 = (objc_class *)objc_opt_class();
  v61 = NSStringFromClass(v41);
  v102[39] = v61;
  v103[39] = objc_opt_class();
  v42 = (objc_class *)objc_opt_class();
  Class v43 = NSStringFromClass(v42);
  v102[40] = v43;
  v103[40] = NSClassFromString(@"CHASActivitySetupMetricsCollectionViewController");
  v44 = NSClassFromString(@"CHASActivitySetupMetricsCollectionViewController");
  v45 = NSStringFromClass(v44);
  v102[41] = v45;
  v103[41] = objc_opt_class();
  uint64_t v46 = NSClassFromString(@"CHASActivitySetupOnboardingViewController");
  v47 = NSStringFromClass(v46);
  v102[42] = v47;
  v103[42] = objc_opt_class();
  v48 = NSClassFromString(@"CHASActivitySetupThreeRingsOnboardingViewController");
  v49 = NSStringFromClass(v48);
  v102[43] = v49;
  v103[43] = objc_opt_class();
  unsigned int v50 = NSClassFromString(@"CHASActivitySetupViewController");
  Class v51 = NSStringFromClass(v50);
  v102[44] = v51;
  v103[44] = objc_opt_class();
  v52 = (objc_class *)objc_opt_class();
  v53 = NSStringFromClass(v52);
  v102[45] = v53;
  v103[45] = objc_opt_class();
  uint64_t v54 = (objc_class *)objc_opt_class();
  v55 = NSStringFromClass(v54);
  v102[46] = v55;
  v103[46] = objc_opt_class();
  v56 = (objc_class *)objc_opt_class();
  Class v57 = NSStringFromClass(v56);
  v102[47] = v57;
  v103[47] = objc_opt_class();
  v58 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:48];
  v59 = +[NSMutableDictionary dictionaryWithDictionary:v58];

  [a1 addBundlesToTinkerFlowMapping:v59];

  return v59;
}

+ (id)bundleFlowMapping
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  if (NSClassFromString(@"NPHCellularSetupBridgeBuddyUIPrincipalClass"))
  {
    Class v3 = NSClassFromString(@"NPHCellularSetupBridgeBuddyUIPrincipalClass");
    unsigned int v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    [v2 setObject:v3 forKeyedSubscript:v5];

    uint64_t v6 = objc_opt_class();
    id v7 = NSClassFromString(@"NPHCellularSetupBridgeBuddyUIPrincipalClass");
    id v8 = NSStringFromClass(v7);
    [v2 setObject:v6 forKeyedSubscript:v8];
  }
  if (NSClassFromString(@"TextSettingsMiniFlowController")
    && NSClassFromString(@"AccessibilitySettingsMiniFlowController"))
  {
    Class v9 = NSClassFromString(@"TextSettingsMiniFlowController");
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    [v2 setObject:v9 forKeyedSubscript:v11];

    Class v12 = NSClassFromString(@"AccessibilitySettingsMiniFlowController");
    char v13 = NSClassFromString(@"TextSettingsMiniFlowController");
    id v14 = NSStringFromClass(v13);
    [v2 setObject:v12 forKeyedSubscript:v14];

    Class v15 = NSClassFromString(@"VTUISiriOptinViewController");
    id v16 = NSClassFromString(@"AccessibilitySettingsMiniFlowController");
    v17 = NSStringFromClass(v16);
    [v2 setObject:v15 forKeyedSubscript:v17];
  }
  if (_os_feature_enabled_impl()
    && NSClassFromString(@"HealthFeaturesBridgeSetupPlugin.HealthFeaturesSetupFlowController"))
  {
    BOOL v18 = @"HealthFeaturesBridgeSetupPlugin.HealthFeaturesSetupFlowController";
LABEL_11:
    Class v19 = NSClassFromString(&v18->isa);
    id v20 = (objc_class *)objc_opt_class();
    Class v21 = NSStringFromClass(v20);
    [v2 setObject:v19 forKeyedSubscript:v21];

    uint64_t v22 = objc_opt_class();
    uint64_t v23 = NSClassFromString(&v18->isa);
    id v24 = NSStringFromClass(v23);
    [v2 setObject:v22 forKeyedSubscript:v24];

    goto LABEL_12;
  }
  if (NSClassFromString(@"HeartRateNotificationsViewController"))
  {
    BOOL v18 = @"HeartRateNotificationsViewController";
    goto LABEL_11;
  }
LABEL_12:
  if (_os_feature_enabled_impl()
    && NSClassFromString(@"NanoSleepBridgeSetup.NanoSleepBridgeSetupController"))
  {
    NSAttributedStringKey v25 = (objc_class *)objc_opt_class();
    id v26 = NSStringFromClass(v25);
    id v27 = [v2 objectForKeyedSubscript:v26];

    Class v28 = NSClassFromString(@"NanoSleepBridgeSetup.NanoSleepBridgeSetupController");
    unsigned int v29 = (objc_class *)objc_opt_class();
    unsigned int v30 = NSStringFromClass(v29);
    [v2 setObject:v28 forKeyedSubscript:v30];

    v31 = NSClassFromString(@"NanoSleepBridgeSetup.NanoSleepBridgeSetupController");
    id v32 = NSStringFromClass(v31);
    [v2 setObject:v27 forKeyedSubscript:v32];
  }
  Class v33 = NSClassFromString(@"NPHCellularSetupBridgeBuddyUIPrincipalClass");
  if (!v33) {
    Class v33 = (objc_class *)objc_opt_class();
  }
  if (NSClassFromString(@"BPSStingSetupPrincipalClass"))
  {
    Class v34 = NSClassFromString(@"BPSStingSetupPrincipalClass");
    Class v35 = NSStringFromClass(v33);
    [v2 setObject:v34 forKeyedSubscript:v35];

    if (NSClassFromString(@"DepthSetupPrincipalClass")) {
      uint64_t v36 = (uint64_t)NSClassFromString(@"DepthSetupPrincipalClass");
    }
    else {
      uint64_t v36 = objc_opt_class();
    }
    uint64_t v37 = v36;
    Class v38 = NSClassFromString(@"BPSStingSetupPrincipalClass");
    v39 = NSStringFromClass(v38);
    [v2 setObject:v37 forKeyedSubscript:v39];
  }
  if (NSClassFromString(@"DepthSetupPrincipalClass"))
  {
    uint64_t v40 = objc_opt_class();
    v41 = NSClassFromString(@"DepthSetupPrincipalClass");
    v42 = NSStringFromClass(v41);
    [v2 setObject:v40 forKeyedSubscript:v42];
  }
  Class v43 = [UIApp activeWatch];
  if (NSClassFromString(@"WGAEltonPhoneBuddyFlowPrincipalClass"))
  {
    Class v44 = NSClassFromString(@"WGAEltonPhoneBuddyFlowPrincipalClass");
    v45 = NSStringFromClass(v33);
    [v2 setObject:v44 forKeyedSubscript:v45];

    Class v46 = NSClassFromString(@"BPSStingSetupPrincipalClass");
    NSClassFromString(@"WGAEltonPhoneBuddyFlowPrincipalClass");
    v47 = (objc_class *)objc_opt_class();
    v48 = NSStringFromClass(v47);
    [v2 setObject:v46 forKeyedSubscript:v48];
  }
  id v49 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"BD0302DD-00BC-43C2-81E9-48C038E6F8BB"];
  unsigned __int8 v50 = [v43 supportsCapability:v49];

  if (NSClassFromString(@"CompanionAppViewSetup"))
  {
    char v51 = NSClassFromString(@"CompanionAppViewSetupViewController") ? v50 : 1;
    if ((v51 & 1) == 0)
    {
      Class v52 = NSClassFromString(@"CompanionAppViewSetup");
      v53 = (objc_class *)objc_opt_class();
      uint64_t v54 = NSStringFromClass(v53);
      [v2 setObject:v52 forKeyedSubscript:v54];

      uint64_t v55 = objc_opt_class();
      v56 = NSClassFromString(@"CompanionAppViewSetup");
      Class v57 = NSStringFromClass(v56);
      [v2 setObject:v55 forKeyedSubscript:v57];
    }
  }
  v58 = +[UIDevice currentDevice];
  unsigned int v59 = [v58 sf_isChinaRegionCellularDevice];

  if (v59 && NSClassFromString(@"CKMPRiMessageContactsTransparencyViewController"))
  {
    Class v60 = NSClassFromString(@"CKMPRiMessageContactsTransparencyViewController");
    v61 = (objc_class *)objc_opt_class();
    v62 = NSStringFromClass(v61);
    [v2 setObject:v60 forKeyedSubscript:v62];

    uint64_t v63 = objc_opt_class();
    v64 = NSClassFromString(@"CKMPRiMessageContactsTransparencyViewController");
    v65 = NSStringFromClass(v64);
    [v2 setObject:v63 forKeyedSubscript:v65];
  }

  return v2;
}

+ (id)classicBuddyFlowMapping
{
  id v2 = (objc_class *)objc_opt_class();
  v85 = NSStringFromClass(v2);
  v87[0] = v85;
  v88[0] = objc_opt_class();
  Class v3 = (objc_class *)objc_opt_class();
  v84 = NSStringFromClass(v3);
  v87[1] = v84;
  v88[1] = objc_opt_class();
  unsigned int v4 = (objc_class *)objc_opt_class();
  v83 = NSStringFromClass(v4);
  v87[2] = v83;
  v88[2] = objc_opt_class();
  id v5 = (objc_class *)objc_opt_class();
  Class v82 = NSStringFromClass(v5);
  v87[3] = v82;
  v88[3] = objc_opt_class();
  uint64_t v6 = (objc_class *)objc_opt_class();
  v81 = NSStringFromClass(v6);
  v87[4] = v81;
  v88[4] = objc_opt_class();
  id v7 = (objc_class *)objc_opt_class();
  v80 = NSStringFromClass(v7);
  v87[5] = v80;
  v88[5] = objc_opt_class();
  id v8 = (objc_class *)objc_opt_class();
  Class v79 = NSStringFromClass(v8);
  v87[6] = v79;
  v88[6] = objc_opt_class();
  Class v9 = (objc_class *)objc_opt_class();
  v78 = NSStringFromClass(v9);
  v87[7] = v78;
  v88[7] = objc_opt_class();
  id v10 = (objc_class *)objc_opt_class();
  v77 = NSStringFromClass(v10);
  v87[8] = v77;
  v88[8] = objc_opt_class();
  uint64_t v11 = (objc_class *)objc_opt_class();
  Class v76 = NSStringFromClass(v11);
  v87[9] = v76;
  v88[9] = objc_opt_class();
  Class v12 = (objc_class *)objc_opt_class();
  Class v75 = NSStringFromClass(v12);
  v87[10] = v75;
  v88[10] = objc_opt_class();
  char v13 = (objc_class *)objc_opt_class();
  v74 = NSStringFromClass(v13);
  v87[11] = v74;
  v88[11] = objc_opt_class();
  id v14 = (objc_class *)objc_opt_class();
  v73 = NSStringFromClass(v14);
  v87[12] = v73;
  v88[12] = objc_opt_class();
  Class v15 = (objc_class *)objc_opt_class();
  uint64_t v72 = NSStringFromClass(v15);
  v87[13] = v72;
  v88[13] = objc_opt_class();
  id v16 = (objc_class *)objc_opt_class();
  v71 = NSStringFromClass(v16);
  v87[14] = v71;
  v88[14] = objc_opt_class();
  v17 = (objc_class *)objc_opt_class();
  v70 = NSStringFromClass(v17);
  v87[15] = v70;
  v88[15] = objc_opt_class();
  BOOL v18 = (objc_class *)objc_opt_class();
  Class v69 = NSStringFromClass(v18);
  v87[16] = v69;
  v88[16] = objc_opt_class();
  Class v19 = (objc_class *)objc_opt_class();
  v68 = NSStringFromClass(v19);
  v87[17] = v68;
  v88[17] = objc_opt_class();
  id v20 = (objc_class *)objc_opt_class();
  v67 = NSStringFromClass(v20);
  v87[18] = v67;
  v88[18] = objc_opt_class();
  Class v21 = (objc_class *)objc_opt_class();
  Class v66 = NSStringFromClass(v21);
  v87[19] = v66;
  v88[19] = objc_opt_class();
  uint64_t v22 = (objc_class *)objc_opt_class();
  v65 = NSStringFromClass(v22);
  v87[20] = v65;
  v88[20] = objc_opt_class();
  uint64_t v23 = (objc_class *)objc_opt_class();
  v64 = NSStringFromClass(v23);
  v87[21] = v64;
  v88[21] = NSClassFromString(@"VTUISiriOptinViewController");
  id v24 = NSClassFromString(@"VTUISiriOptinViewController");
  uint64_t v63 = NSStringFromClass(v24);
  v87[22] = v63;
  v88[22] = objc_opt_class();
  NSAttributedStringKey v25 = NSClassFromString(@"VTUISiriVoiceSelectionViewController");
  v62 = NSStringFromClass(v25);
  v87[23] = v62;
  v88[23] = objc_opt_class();
  id v26 = (objc_class *)objc_opt_class();
  v61 = NSStringFromClass(v26);
  v87[24] = v61;
  v88[24] = objc_opt_class();
  id v27 = (objc_class *)objc_opt_class();
  Class v60 = NSStringFromClass(v27);
  v87[25] = v60;
  v88[25] = objc_opt_class();
  Class v28 = (objc_class *)objc_opt_class();
  unsigned int v59 = NSStringFromClass(v28);
  v87[26] = v59;
  v88[26] = NSClassFromString(@"CHASActivitySetupMetricsCollectionViewController");
  unsigned int v29 = NSClassFromString(@"CHASActivitySetupMetricsCollectionViewController");
  v58 = NSStringFromClass(v29);
  v87[27] = v58;
  v88[27] = objc_opt_class();
  unsigned int v30 = NSClassFromString(@"CHASActivitySetupOnboardingViewController");
  Class v57 = NSStringFromClass(v30);
  v87[28] = v57;
  v88[28] = objc_opt_class();
  v31 = NSClassFromString(@"CHASActivitySetupThreeRingsOnboardingViewController");
  v56 = NSStringFromClass(v31);
  v87[29] = v56;
  v88[29] = objc_opt_class();
  id v32 = NSClassFromString(@"CHASActivitySetupViewController");
  Class v33 = NSStringFromClass(v32);
  v87[30] = v33;
  v88[30] = objc_opt_class();
  Class v34 = (objc_class *)objc_opt_class();
  Class v35 = NSStringFromClass(v34);
  v87[31] = v35;
  v88[31] = objc_opt_class();
  uint64_t v36 = (objc_class *)objc_opt_class();
  uint64_t v37 = NSStringFromClass(v36);
  v87[32] = v37;
  v88[32] = objc_opt_class();
  Class v38 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v38);
  v87[33] = v39;
  v88[33] = objc_opt_class();
  uint64_t v40 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v40);
  v87[34] = v41;
  v88[34] = objc_opt_class();
  v42 = (objc_class *)objc_opt_class();
  Class v43 = NSStringFromClass(v42);
  v87[35] = v43;
  v88[35] = objc_opt_class();
  Class v44 = (objc_class *)objc_opt_class();
  v45 = NSStringFromClass(v44);
  v87[36] = v45;
  v88[36] = objc_opt_class();
  Class v46 = (objc_class *)objc_opt_class();
  v47 = NSStringFromClass(v46);
  v87[37] = v47;
  v88[37] = objc_opt_class();
  v48 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:38];
  id v49 = +[NSMutableDictionary dictionaryWithDictionary:v48];

  if (sub_100032540())
  {
    uint64_t v50 = objc_opt_class();
    char v51 = (objc_class *)objc_opt_class();
    Class v52 = NSStringFromClass(v51);
    [v49 setObject:v50 forKey:v52];
  }
  v53 = [a1 signInFlowMapping:v56];
  [v49 addEntriesFromDictionary:v53];

  uint64_t v54 = [a1 bundleFlowMapping];
  [v49 addEntriesFromDictionary:v54];

  [a1 updateMappingForYorktown:v49];

  return v49;
}

+ (Class)signInFlowFirstControllerClass
{
  return (Class)objc_opt_class();
}

+ (id)signInFlowLastControllerClassName
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)signInFlowMapping
{
  id v2 = (objc_class *)objc_opt_class();
  Class v3 = NSStringFromClass(v2);
  v15[0] = v3;
  v16[0] = objc_opt_class();
  unsigned int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v15[1] = v5;
  v16[1] = objc_opt_class();
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v15[2] = v7;
  v16[2] = objc_opt_class();
  id v8 = (objc_class *)objc_opt_class();
  Class v9 = NSStringFromClass(v8);
  v15[3] = v9;
  v16[3] = objc_opt_class();
  id v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  v15[4] = v11;
  v16[4] = objc_opt_class();
  Class v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
  char v13 = +[NSMutableDictionary dictionaryWithDictionary:v12];

  return v13;
}

+ (void)updateMappingForYorktown:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 objectForKey:v5];

  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v3 removeObjectForKey:v8];

  uint64_t v9 = objc_opt_class();
  id v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  [v3 setObject:v9 forKey:v11];

  Class v12 = (objc_class *)objc_opt_class();
  char v13 = NSStringFromClass(v12);
  [v3 setObject:v6 forKey:v13];

  id v14 = (objc_class *)objc_opt_class();
  Class v15 = NSStringFromClass(v14);
  id v16 = [v3 objectForKey:v15];

  v17 = (objc_class *)objc_opt_class();
  BOOL v18 = NSStringFromClass(v17);
  [v3 removeObjectForKey:v18];

  uint64_t v19 = objc_opt_class();
  id v20 = (objc_class *)objc_opt_class();
  Class v21 = NSStringFromClass(v20);
  [v3 setObject:v19 forKey:v21];

  uint64_t v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v16 forKey:v23];
}

- (Class)_updateNextControllerForSignInFlow:(Class)a3 currentControllerClass:(Class)a4
{
  id v7 = [UIApp bridgeController];
  unsigned int v8 = [v7 isTinkerPairing];

  if (v8)
  {
    uint64_t v9 = a3;
    goto LABEL_20;
  }
  if (objc_opt_respondsToSelector())
  {
    id v10 = a3;
    if ([(objc_class *)v10 controllerAllowsPresentingSignInFlow])
    {
      objc_storeStrong((id *)&self->_controllerClassToPresentAfterSignIn, a3);
      id v10 = (objc_class *)[(id)objc_opt_class() signInFlowFirstControllerClass];
      uint64_t v11 = pbb_setupflow_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector())
  {
    id v10 = a3;
    if ([(objc_class *)v10 controllerBlocksRunningBeforeSignInStep])
    {
      objc_storeStrong((id *)&self->_controllerClassToPresentAfterSignIn, a3);
      id v10 = (objc_class *)[(id)objc_opt_class() signInFlowFirstControllerClass];
      uint64_t v11 = pbb_setupflow_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:
        Class controllerClassToPresentAfterSignIn = self->_controllerClassToPresentAfterSignIn;
        int v18 = 136315650;
        uint64_t v19 = "-[COSSetupController _updateNextControllerForSignInFlow:currentControllerClass:]";
        __int16 v20 = 2112;
        Class v21 = controllerClassToPresentAfterSignIn;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: updated: _controllerClassToPresentAfterSignIn: %@ nextControllerClass: %@", (uint8_t *)&v18, 0x20u);
      }
LABEL_11:
    }
LABEL_12:

    a3 = v10;
  }
  char v13 = NSStringFromClass(a4);
  if (!a3)
  {
    id v14 = [(id)objc_opt_class() signInFlowLastControllerClassName];
    unsigned int v15 = [v13 isEqualToString:v14];

    if (v15)
    {
      a3 = self->_controllerClassToPresentAfterSignIn;
      id v16 = pbb_setupflow_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315394;
        uint64_t v19 = "-[COSSetupController _updateNextControllerForSignInFlow:currentControllerClass:]";
        __int16 v20 = 2112;
        Class v21 = a3;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: updated controller after last sign-in class to nextControllerClass: %@", (uint8_t *)&v18, 0x16u);
      }
    }
    else
    {
      a3 = 0;
    }
  }
  uint64_t v9 = a3;

LABEL_20:

  return v9;
}

- (id)_controllerFollowingControllerClass:(Class)a3
{
  id v5 = +[COSSetupController buddyFlowMapping];
  id v6 = NSStringFromClass(a3);
  id v7 = [v5 objectForKey:v6];

  unsigned int v8 = [(COSSetupController *)self _updateNextControllerForSignInFlow:v7 currentControllerClass:a3];

  if (PBShouldOfferBetterTogetherFlow() && self->_isDeKOTAFlow)
  {
    uint64_t v9 = objc_opt_class();

    unsigned int v8 = (void *)v9;
  }
  id v10 = pbb_setupflow_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)unsigned int v30 = 138412290;
    *(void *)&v30[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_controllerFollowingControllerClass: (%@)", v30, 0xCu);
  }

  if (!v8) {
    goto LABEL_14;
  }
  if (![v8 conformsToProtocol:&OBJC_PROTOCOL___BPSBuddyController])
  {
    unsigned int v15 = pbb_setupflow_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100173208((uint64_t)v8, v15, v16, v17, v18, v19, v20, v21);
    }

LABEL_14:
    id v22 = 0;
    goto LABEL_35;
  }
  if (objc_opt_respondsToSelector())
  {
    id v11 = [v8 controllerNeedsToRunForBuddyControllerDelegate:self];
    Class v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v13 = +[NSNumber numberWithBool:v11];
      *(_DWORD *)unsigned int v30 = 138412290;
      *(void *)&v30[4] = v13;
      id v14 = "controllerNeedsToRunForBuddyControllerDelegate: (%@)";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, v30, 0xCu);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (objc_opt_respondsToSelector())
  {
    id v11 = [v8 controllerNeedsToRun];
    Class v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v13 = +[NSNumber numberWithBool:v11];
      *(_DWORD *)unsigned int v30 = 138412290;
      *(void *)&v30[4] = v13;
      id v14 = "controllerNeedsToRun: (%@)";
      goto LABEL_18;
    }
LABEL_19:

    goto LABEL_21;
  }
  LOBYTE(v11) = 1;
LABEL_21:
  if ([(COSSetupController *)self expressMode])
  {
    if (objc_opt_respondsToSelector())
    {
      id v23 = [(COSSetupController *)self expressModeDevice];
      id v24 = [v8 skipControllerForExpressMode:v23];

      NSAttributedStringKey v25 = pbb_setupflow_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = +[NSNumber numberWithBool:v24];
        *(_DWORD *)unsigned int v30 = 138412546;
        *(void *)&v30[4] = v8;
        *(_WORD *)&v30[12] = 2112;
        *(void *)&v30[14] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "skipControllerForExpressMode(%@): (%@)", v30, 0x16u);
      }
      if (v24)
      {
        if (objc_opt_respondsToSelector())
        {
          id v27 = [(COSSetupController *)self expressModeDevice];
          [v8 doWorkForSkippedExpressSettingPane:v27];
        }
        goto LABEL_34;
      }
    }
    else
    {
      Class v28 = pbb_setupflow_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v30 = 138412290;
        *(void *)&v30[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@ doesn't respond to skipControllerForExpressMode", v30, 0xCu);
      }
    }
  }
  if ((v11 & 1) == 0)
  {
LABEL_34:
    id v22 = [(COSSetupController *)self _controllerFollowingControllerClass:v8];
    goto LABEL_35;
  }
  id v22 = objc_msgSend(objc_msgSend(v8, "alloc"), "init");
  [v22 setDelegate:self];
  if ([v22 isMemberOfClass:objc_opt_class()]) {
    objc_storeStrong((id *)&self->_passcodeChoiceController, v22);
  }
LABEL_35:

  return v22;
}

- (NSArray)expressModeControllers
{
  id v2 = objc_opt_new();
  id v3 = +[COSSetupController buddyFlowMapping];
  unsigned int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (objc_class *)[v3 objectForKey:v5];

  while (v6)
  {
    if (objc_opt_respondsToSelector()) {
      [v2 addObject:v6];
    }
    id v7 = NSStringFromClass(v6);
    id v6 = (objc_class *)[v3 objectForKey:v7];
  }
  id v8 = [v2 copy];

  return (NSArray *)v8;
}

- (void)_finishBuddy
{
}

- (NRDevice)expressModeDevice
{
  expressModeDevice = self->_expressModeDevice;
  if (!expressModeDevice)
  {
    unsigned int v4 = +[COSBackupManager sharedBackupManager];
    id v5 = [v4 compatiblePairedDevices];

    id v6 = [v5 sortedArrayUsingComparator:&stru_100245948];

    self->_expressModeDevice = (NRDevice *)[v6 lastObject];
    expressModeDevice = self->_expressModeDevice;
  }

  return expressModeDevice;
}

- (id)_controllerForClass:(Class)a3
{
  id v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromClass(a3);
    id v6 = (char *)objc_claimAutoreleasedReturnValue();
    int v18 = 138412290;
    uint64_t v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_controllerForClass: (%@)", (uint8_t *)&v18, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      id v10 = [(objc_class *)a3 controllerNeedsToRun];
      id v11 = pbb_setupflow_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        Class v12 = +[NSNumber numberWithBool:v10];
        int v18 = 138412290;
        uint64_t v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "controllerNeedsToRun: (%@)", (uint8_t *)&v18, 0xCu);
      }
      if (!v10) {
        goto LABEL_13;
      }
    }
LABEL_12:
    id v13 = objc_alloc_init(a3);
    goto LABEL_14;
  }
  id v7 = [(objc_class *)a3 controllerNeedsToRunForBuddyControllerDelegate:self];
  id v8 = pbb_setupflow_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = +[NSNumber numberWithBool:v7];
    int v18 = 138412290;
    uint64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "controllerNeedsToRunForBuddyControllerDelegate: (%@)", (uint8_t *)&v18, 0xCu);
  }
  if (v7) {
    goto LABEL_12;
  }
LABEL_13:
  id v13 = [(COSSetupController *)self _controllerFollowingControllerClass:a3];
LABEL_14:
  id v14 = v13;
  if (objc_opt_respondsToSelector())
  {
    unsigned int v15 = pbb_setupflow_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[COSSetupController _controllerForClass:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<Set Delegate - %s>", (uint8_t *)&v18, 0xCu);
    }

    [v14 setDelegate:self];
    uint64_t v16 = pbb_setupflow_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[COSSetupController _controllerForClass:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "</Set Delegate - %s>", (uint8_t *)&v18, 0xCu);
    }
  }

  return v14;
}

- (id)_viewControllerForBuddyController:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 viewController];
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void)_pushBuddyController:(id)a3
{
}

- (void)_pushBuddyController:(id)a3 ontoNavigationController:(id)a4
{
  id v6 = a3;
  id v7 = (COSBuddyNavigationController *)a4;
  navigationController = v7;
  if (!v7) {
    navigationController = self->_navigationController;
  }
  uint64_t v9 = navigationController;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000963C4;
  v14[3] = &unk_100245970;
  objc_copyWeak(&v18, &location);
  id v10 = v6;
  id v15 = v10;
  id v11 = v9;
  uint64_t v16 = v11;
  uint64_t v17 = self;
  Class v12 = objc_retainBlock(v14);
  if (objc_opt_respondsToSelector())
  {
    id v13 = [v10 viewController];
    if (v13) {
      ((void (*)(void *, void *))v12[2])(v12, v13);
    }
    else {
      [(COSSetupController *)self buddyControllerDone:v10];
    }
  }
  else
  {
    ((void (*)(void *, id))v12[2])(v12, v10);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_transitionFromBuddyController:(id)a3 toBuddyController:(id)a4
{
  id v5 = a4;
  if ((PBShouldOfferBetterTogetherFlow() & 1) != 0 || !self->_isDeKOTAFlow)
  {
    id v7 = [(COSSetupController *)self pairingReportManager];
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v7 checkInWithController:v9 action:0];

    [(COSSetupController *)self _pushGizmoBuddyController:v5];
    [(COSSetupController *)self _pushBuddyController:v5];
    id v10 = 0;
    if ((unint64_t)[(NSMutableArray *)self->_buddyControllers count] >= 2)
    {
      id v10 = [(NSMutableArray *)self->_buddyControllers objectAtIndexedSubscript:(char *)[(NSMutableArray *)self->_buddyControllers count] - 2];
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![v5 controllerAllowsNavigatingBackFrom]
      || (objc_opt_respondsToSelector() & 1) != 0
      && ([v10 controllerAllowsNavigatingBackTo] & 1) == 0)
    {
      [(COSSetupController *)self blockGoingBackFromCurrentController];
    }
  }
  else
  {
    id v6 = pbb_setupflow_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "We're in DeKOTA flow. Holding controller pushes.", v11, 2u);
    }
  }
}

- (void)blockGoingBackFromCurrentController
{
  id v3 = [(COSBuddyNavigationController *)self->_navigationController viewControllers];
  if ((unint64_t)[v3 count] < 2)
  {
    id v4 = pbb_setupflow_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      buddyControllers = self->_buddyControllers;
      int v11 = 138412546;
      Class v12 = v3;
      __int16 v13 = 2112;
      id v14 = buddyControllers;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No second-to-last view controller! navStack: %@\n _buddyControllers: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v4 = [v3 lastObject];
    id v5 = [v4 navigationItem];
    id v6 = sub_100031630(self, (uint64_t)"promptWhetherToResetPairing:");
    [v5 setLeftBarButtonItem:v6];

    [v5 setLeftItemsSupplementBackButton:0];
    id v7 = pbb_setupflow_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      int v11 = 138543362;
      Class v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Blocked going back from controller: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)checkSafeToTransitionOnNavigationController:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100096B4C;
  v17[3] = &unk_1002441B0;
  id v7 = v5;
  id v18 = v7;
  id v8 = v6;
  id v19 = v8;
  uint64_t v9 = objc_retainBlock(v17);
  id v10 = [v7 topViewController];
  int v11 = [v10 presentedViewController];

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    Class v12 = pbb_setupflow_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dismissing alert before transition to next controller", buf, 2u);
    }

    __int16 v13 = [v7 topViewController];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100096CC8;
    v14[3] = &unk_100244668;
    id v15 = v9;
    [v13 dismissViewControllerAnimated:1 completion:v14];
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }
}

- (void)_buddyControllerDone:(id)a3 nextControllerClass:(Class)a4 nextController:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = pbb_setupflow_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      [v9 description];
    }
    else {
    int v11 = NSStringFromClass(a4);
    }
    *(_DWORD *)buf = 138412546;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Controller Done: %@ -> Next: %@", buf, 0x16u);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100096F44;
  v19[3] = &unk_1002459C0;
  void v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  Class v22 = a4;
  id v12 = v9;
  id v13 = v8;
  id v14 = objc_retainBlock(v19);
  id v15 = [(COSSetupController *)self navigationController];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009724C;
  v17[3] = &unk_100244668;
  id v18 = v14;
  uint64_t v16 = v14;
  [(COSSetupController *)self checkSafeToTransitionOnNavigationController:v15 withCompletion:v17];
}

- (void)buddyControllerHold:(id)a3 beforePresentingBuddyController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_controllerDisplayedWhileOnHold, a3);
  objc_storeStrong((id *)&self->_nextControllerAfterHold, a4);
  id v9 = [(COSSetupController *)self pairingReportManager];
  id v10 = (objc_class *)objc_opt_class();
  int v11 = NSStringFromClass(v10);
  [v9 checkInWithController:v11 action:1];

  id v12 = [(COSBuddyNavigationController *)self->_navigationController topViewController];
  id v13 = [v12 view];
  [v13 setUserInteractionEnabled:0];

  id v14 = [(COSBuddyNavigationController *)self->_navigationController navigationBar];
  [v14 setUserInteractionEnabled:0];

  id v15 = [objc_alloc((Class)UIActivityIndicatorView) initWithFrame:0.0, 0.0, 20.0, 20.0];
  id v16 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v15];
  uint64_t v17 = [(COSBuddyNavigationController *)self->_navigationController navigationBar];
  id v18 = [v17 topItem];
  [v18 setRightBarButtonItem:v16 animated:1];
  [v15 startAnimating];
  [(COSSetupController *)self showButtonTrayBusyIndicator:1 forController:v7];
  if (objc_opt_respondsToSelector()) {
    [v8 didEstablishHold];
  }
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___BPSBuddyControllerHolding]
    && [v8 holdWithWaitScreen])
  {
    [v8 waitScreenPushGracePeriod];
    double v20 = v19;
    uint64_t v37 = [v8 localizedWaitScreenDescription];
    id v21 = [(COSSetupController *)self navigationController];
    uint64_t v36 = [v21 topViewController];

    Class v22 = pbb_setupflow_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v50 = (OS_dispatch_source *)v8;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Looks like Hold Wait Screen is needed for (%@)", buf, 0xCu);
    }

    id holdWaitScreenBlock = self->_holdWaitScreenBlock;
    if (holdWaitScreenBlock
      || (p_holdWaitScreenPresentationTimer = (dispatch_object_t *)&self->_holdWaitScreenPresentationTimer,
          self->_holdWaitScreenPresentationTimer))
    {
      self->_id holdWaitScreenBlock = 0;

      __int16 v25 = pbb_setupflow_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100173274();
      }
    }
    else
    {
      objc_initWeak(&location, self);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1000977A8;
      v41[3] = &unk_1002459E8;
      objc_copyWeak(&v47, &location);
      id v42 = v36;
      id v43 = v37;
      id v44 = v8;
      id v45 = v15;
      id v46 = v7;
      id v26 = objc_retainBlock(v41);
      id v27 = self->_holdWaitScreenBlock;
      self->_id holdWaitScreenBlock = v26;

      dispatch_source_t v35 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      objc_storeStrong((id *)&self->_holdWaitScreenPresentationTimer, v35);
      holdWaitScreenPresentationTimer = self->_holdWaitScreenPresentationTimer;
      dispatch_time_t v29 = dispatch_time(0, 1000000000 * (uint64_t)v20);
      dispatch_source_set_timer(holdWaitScreenPresentationTimer, v29, 0xFFFFFFFFFFFFFFFFLL, 100000000 * (uint64_t)v20);
      unsigned int v30 = pbb_setupflow_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = self->_holdWaitScreenPresentationTimer;
        id v32 = objc_retainBlock(self->_holdWaitScreenBlock);
        *(_DWORD *)buf = 138412546;
        uint64_t v50 = v31;
        __int16 v51 = 2112;
        id v52 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Prepare hold wait screen timer. %@ %@", buf, 0x16u);
      }
      Class v33 = *p_holdWaitScreenPresentationTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100097AFC;
      handler[3] = &unk_100243D28;
      objc_copyWeak(&v40, &location);
      dispatch_source_t v39 = v35;
      Class v34 = v35;
      dispatch_source_set_event_handler(v33, handler);
      dispatch_resume(*p_holdWaitScreenPresentationTimer);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
    }
  }
}

- (void)cleanupHoldWaitTimer
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    holdWaitScreenPresentationTimer = self->_holdWaitScreenPresentationTimer;
    id v5 = objc_retainBlock(self->_holdWaitScreenBlock);
    int v9 = 138412546;
    id v10 = holdWaitScreenPresentationTimer;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "cleanupHoldWaitTimer %@ %@", (uint8_t *)&v9, 0x16u);
  }
  id v6 = self->_holdWaitScreenPresentationTimer;
  if (v6)
  {
    dispatch_source_cancel(v6);
    id v7 = self->_holdWaitScreenPresentationTimer;
    self->_holdWaitScreenPresentationTimer = 0;
  }
  id holdWaitScreenBlock = self->_holdWaitScreenBlock;
  self->_id holdWaitScreenBlock = 0;
}

- (void)_buddyControllerReleaseHold:(id)a3 andSkip:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100097F18;
  v15[3] = &unk_100245440;
  objc_copyWeak(&v18, &location);
  id v7 = v6;
  BOOL v19 = a4;
  id v16 = v7;
  uint64_t v17 = self;
  id v8 = objc_retainBlock(v15);
  int v9 = [(COSSetupController *)self navigationController];
  unsigned int v10 = [v9 _isTransitioning];

  if (v10)
  {
    __int16 v11 = pbb_setupflow_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "We're mid-transition; waiting for animation to complete before releasing hold for (%@).",
        buf,
        0xCu);
    }

    id v12 = objc_retainBlock(v8);
    id deferredHoldBlock = self->_deferredHoldBlock;
    self->_id deferredHoldBlock = v12;
  }
  else
  {
    id v14 = pbb_setupflow_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Releasing hold inline for (%@).", buf, 0xCu);
    }

    ((void (*)(void *))v8[2])(v8);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldSkipForBetterTogether:(id)a3
{
  id v4 = a3;
  if (PBShouldOfferBetterTogetherFlow() && self->_isDeKOTAFlow)
  {
    objc_opt_class();
    char v5 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (void)postUserNotificationForController:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isLiveActivityFeatureEnabled])
  {
    if (v4)
    {
      [(COSSetupController *)self updateLiveActivityWithBuddyController:v4];
    }
    else
    {
      id v6 = +[NSBundle mainBundle];
      id v7 = [v6 localizedStringForKey:@"LIVE_ACTIVITY_DEFAULT_TITLE" value:&stru_100249230 table:@"Localizable"];
      id v8 = +[NSBundle mainBundle];
      int v9 = [v8 localizedStringForKey:@"RETURN_TO_PAIRING_NOTIFICATION_BODY" value:&stru_100249230 table:@"Localizable"];
      [(COSSetupController *)self updateLiveActivityWithTitle:v7 subtitle:v9];
    }
  }
  else
  {
    +[UNUserNotificationCenter currentNotificationCenter];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100098608;
    v10[3] = &unk_100245A30;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v11;
    [v5 getDeliveredNotificationsWithCompletionHandler:v10];
  }
}

- (void)clearIdleUserNotification
{
  id v3 = +[UNUserNotificationCenter currentNotificationCenter];
  CFStringRef v5 = @"com.apple.Bridge.pairing";
  id v4 = +[NSArray arrayWithObjects:&v5 count:1];
  [v3 removeDeliveredNotificationsWithIdentifiers:v4];

  [(COSSetupController *)self endLiveActivityIfNeeded];
}

- (BOOL)buddyControllerIsBeingHeldOff:(id)a3
{
  return self->_nextControllerAfterHold == a3;
}

- (void)buddyControllerReleaseHold:(id)a3
{
}

- (void)buddyControllerReleaseHoldAndSkip:(id)a3
{
}

- (void)buddyControllerDoneForSignIn:(id)a3
{
  id v4 = a3;
  Class controllerClassToPresentAfterSignIn = self->_controllerClassToPresentAfterSignIn;
  if (!controllerClassToPresentAfterSignIn)
  {
    id v6 = pbb_setupflow_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001733B4();
    }

    Class controllerClassToPresentAfterSignIn = self->_controllerClassToPresentAfterSignIn;
  }
  [(COSSetupController *)self _buddyControllerDone:v4 nextControllerClass:controllerClassToPresentAfterSignIn nextController:0];
  Class v7 = self->_controllerClassToPresentAfterSignIn;
  self->_Class controllerClassToPresentAfterSignIn = 0;
}

- (void)buddyControllerCancelAnyHold
{
  [(COSSetupController *)self cleanupHoldWaitTimer];
  controllerDisplayedWhileOnHold = self->_controllerDisplayedWhileOnHold;
  if (controllerDisplayedWhileOnHold)
  {
    self->_controllerDisplayedWhileOnHold = 0;

    nextControllerAfterHold = self->_nextControllerAfterHold;
    self->_nextControllerAfterHold = 0;
  }
  CFStringRef v5 = [(COSSetupController *)self navigationController];
  id v12 = [v5 navigationBar];

  id v6 = [v12 topItem];
  [v6 setRightBarButtonItem:0 animated:1];
  Class v7 = [(COSSetupController *)self navigationController];
  id v8 = [v7 topViewController];
  int v9 = [v8 view];
  [v9 setUserInteractionEnabled:1];

  unsigned int v10 = [(COSSetupController *)self navigationController];
  id v11 = [v10 navigationBar];
  [v11 setUserInteractionEnabled:1];
}

- (void)buddyControllerDone:(id)a3 transitionToMode:(unint64_t)a4
{
  self->_unint64_t mode = a4;
  [(COSSetupController *)self _buddyControllerDone:a3 nextControllerClass:0 nextController:0];
}

- (void)buddyControllerDone:(id)a3
{
}

- (void)buddyControllerDone:(id)a3 nextControllerClass:(Class)a4
{
}

- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4
{
  return 0;
}

- (id)topBuddyController
{
  return [(NSMutableArray *)self->_buddyControllers lastObject];
}

- (void)buddyControllerWillPushNextControllerClass:(Class)a3 outNextController:(id *)a4 ontoNavigationController:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100098C94;
  v12[3] = &unk_100245A58;
  v12[4] = self;
  id v13 = a5;
  Class v14 = a3;
  id v15 = a4;
  id v8 = v13;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100098D64;
  v10[3] = &unk_100244668;
  id v11 = objc_retainBlock(v12);
  int v9 = v11;
  [(COSSetupController *)self checkSafeToTransitionOnNavigationController:v8 withCompletion:v10];
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v7 = a5;
  if (objc_opt_respondsToSelector())
  {
    unsigned int v8 = [v7 useFadePushAnimation];
    int v9 = 0;
    if (a4 == 1 && v8) {
      int v9 = objc_opt_new();
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (self->_deferredHoldBlock)
  {
    int v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "navigationController: %@ viewController: %@", (uint8_t *)&v14, 0x16u);
    }

    if (self->_deferredHoldBlock)
    {
      unsigned int v10 = pbb_setupflow_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pushing deferred block!", (uint8_t *)&v14, 2u);
      }

      (*((void (**)(void))self->_deferredHoldBlock + 2))();
      id deferredHoldBlock = self->_deferredHoldBlock;
      self->_id deferredHoldBlock = 0;
    }
  }
  id v12 = [v8 navigationItem];
  id v13 = [(COSSetupController *)self _titleForViewController:v8];
  [v12 setBackButtonTitle:v13];

  [v12 setBackButtonDisplayMode:1];
  [(COSSetupController *)self updateLiveActivityWithViewController:v8];
}

- (id)_titleForViewController:(id)a3
{
  id v3 = a3;
  id v4 = [v3 title];

  if (v4)
  {
    uint64_t v5 = [v3 title];
LABEL_7:
    id v6 = (void *)v5;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 titleString];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 navTitle];
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (void)promptWhetherToResetPairing:(id)a3
{
  id v18 = a3;
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User Backed Out", (uint8_t *)buf, 2u);
  }

  id v4 = +[NSBundle mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"RESET_BUDDY_TITLE" value:&stru_100249230 table:@"Localizable"];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"RESET_BUDDY_MESSAGE_%@" value:&stru_100249230 table:@"Localizable"];
  id v8 = +[NSBundle mainBundle];
  int v9 = [v8 localizedStringForKey:@"APPLE_WATCH_ALL_STRING" value:&stru_100249230 table:@"Localizable"];
  unsigned int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9);
  id v11 = +[UIAlertController alertControllerWithTitle:v5 message:v10 preferredStyle:1];

  objc_initWeak(buf, self);
  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"RESET_BUDDY_ACTION" value:&stru_100249230 table:@"Localizable"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100099384;
  v20[3] = &unk_100245AA0;
  objc_copyWeak(&v21, buf);
  int v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v20];

  [v11 addAction:v14];
  id v15 = +[NSBundle mainBundle];
  __int16 v16 = [v15 localizedStringForKey:@"CANCEL_RESET_BUDDY_ACTION" value:&stru_100249230 table:@"Localizable"];
  id v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:&stru_100245AC0];

  [v11 addAction:v17];
  [(COSBuddyNavigationController *)self->_navigationController presentViewController:v11 animated:1 completion:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak(buf);
}

- (void)passcodeCreationFailed
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10017348C();
  }

  self->_hasAddedPasscode = 0;
  passcodeChoiceController = self->_passcodeChoiceController;
  if (passcodeChoiceController)
  {
    id v5 = [(COSBuddyNavigationController *)self->_navigationController popToViewController:passcodeChoiceController animated:1];
  }
  else
  {
    id v6 = pbb_setupflow_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100173458();
    }
  }
}

- (void)passcodeCreationComplete
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Passcode Creation Complete.", v4, 2u);
  }

  self->_hasAddedPasscode = 1;
}

- (void)companionDidFinishHealthSharingOptIn:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(COSSetupController *)self topBuddyController];
    [(COSSetupController *)self _buddyControllerDone:v4 nextControllerClass:objc_opt_class() nextController:0];
  }
  else
  {
    self->_didAllowTinkerHealthSharing = 0;
    id v4 = [(COSSetupController *)self topBuddyController];
    -[COSSetupController buddyControllerDone:](self, "buddyControllerDone:");
  }
}

- (void)gizmoDidFinishHealthSharingOptIn:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didAllowTinkerHealthSharing = a3;
  id v5 = [(COSSetupController *)self topBuddyController];
  if (v3) {
    [(COSSetupController *)self _buddyControllerDone:v5 nextControllerClass:objc_opt_class() nextController:0];
  }
  else {
    [(COSSetupController *)self buddyControllerDone:v5];
  }
}

- (void)pushRUIObject:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100099B20;
  v18[3] = &unk_100245AE8;
  objc_copyWeak(&v21, &location);
  id v10 = v8;
  id v19 = v10;
  BOOL v22 = a4;
  id v11 = v9;
  id v20 = v11;
  id v12 = objc_retainBlock(v18);
  if ([(COSBuddyNavigationController *)self->_navigationController _isTransitioning])
  {
    id v13 = pbb_setupflow_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(RUI) We're mid-transition; waiting for animation to complete before releasing hold.",
        (uint8_t *)&v17,
        2u);
    }

    int v14 = objc_retainBlock(v12);
    id deferredHoldBlock = self->_deferredHoldBlock;
    self->_id deferredHoldBlock = v14;
  }
  else
  {
    __int16 v16 = pbb_setupflow_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "(RUI) Releasing hold inline.", (uint8_t *)&v17, 2u);
    }

    ((void (*)(void *))v12[2])(v12);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)popRUIObject:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(COSBuddyNavigationController *)self->_navigationController topViewController];
  id v7 = [(NSMutableArray *)self->_buddyControllers lastObject];
  if ([v7 isMemberOfClass:objc_opt_class()]
    && ([v7 viewController], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8 == v6))
  {
    id v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      int v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "POP: %@ vs %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    id v9 = pbb_setupflow_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100173558();
    }
  }

  id v10 = [(COSBuddyNavigationController *)self->_navigationController popViewControllerAnimated:v4];
  [(NSMutableArray *)self->_buddyControllers removeObject:v7];
}

- (void)popControllerAnimated:(BOOL)a3
{
  id v3 = [(COSBuddyNavigationController *)self->_navigationController popViewControllerAnimated:a3];
}

- (void)showBusyIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  customActivityIndicator = self->_customActivityIndicator;
  if (!a3 || customActivityIndicator)
  {
    [(UIActivityIndicatorView *)customActivityIndicator stopAnimating];
    [(UIActivityIndicatorView *)self->_customActivityIndicator removeFromSuperview];
    id v6 = self->_customActivityIndicator;
    self->_customActivityIndicator = 0;
  }
  else
  {
    id v6 = [(COSBuddyNavigationController *)self->_navigationController navigationBar];
    [v6 size];
    double v8 = v7;
    double v10 = v9;
    id v11 = objc_alloc((Class)UIActivityIndicatorView);
    float v12 = (v8 + -20.0) * 0.5;
    float v13 = (v10 + -20.0) * 0.5;
    int v14 = (UIActivityIndicatorView *)[v11 initWithFrame:floorf(v12), floorf(v13), 20.0, 20.0];
    id v15 = self->_customActivityIndicator;
    self->_customActivityIndicator = v14;

    __int16 v16 = self->_customActivityIndicator;
    __int16 v17 = +[UIColor blackColor];
    [(UIActivityIndicatorView *)v16 setBackgroundColor:v17];

    [v6 addSubview:self->_customActivityIndicator];
    [(UIActivityIndicatorView *)self->_customActivityIndicator startAnimating];
  }

  id v19 = [(COSSetupController *)self buddyControllers];
  id v18 = [v19 lastObject];
  [(COSSetupController *)self showButtonTrayBusyIndicator:v3 forController:v18];
}

- (void)showButtonTrayBusyIndicator:(BOOL)a3 forController:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009A2AC;
  v20[3] = &unk_100245B10;
  id v6 = (id)objc_opt_new();
  id v21 = v6;
  double v7 = objc_retainBlock(v20);
  ((void (*)(void *, id))v7[2])(v7, v5);
  if (objc_opt_respondsToSelector())
  {
    double v8 = [v5 viewController];
    ((void (*)(void *, void *))v7[2])(v7, v8);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      float v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v13) buttonTray:v16];
        id v15 = v14;
        if (v4) {
          [v14 showButtonsBusy];
        }
        else {
          [v14 showButtonsAvailable];
        }

        float v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }
}

- (BOOL)_controllerShouldMirrorToGizmo:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_14:
    char v4 = 0;
  }
  else
  {
    objc_opt_class();
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }

  return v4 & 1;
}

- (void)popViewController:(id)a3
{
  id v12 = a3;
  kdebug_trace();
  char v4 = [(NSMutableArray *)self->_buddyControllers lastObject];
  id v5 = [(COSSetupController *)self _viewControllerForBuddyController:v4];
  if (v5 == v12) {
    [(NSMutableArray *)self->_buddyControllers removeLastObject];
  }
  id v6 = [(NSMutableArray *)self->_buddyControllers lastObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setAppearingFromBackNavigation:1];
  }
  if ([(COSSetupController *)self _controllerShouldMirrorToGizmo:v12])
  {
    double v7 = [UIApp bridgeController];
    double v8 = [(COSBuddyNavigationController *)self->_navigationController topViewController];
    [v7 tellGizmoToPopToControllerType:sub_10009A658(v8)];
  }
  id v9 = +[NRPairedDeviceRegistry sharedInstance];
  id v10 = [(COSBuddyNavigationController *)self->_navigationController topViewController];
  sub_10009A658(v10);
  id v11 = PBBuddyControllerDescription();
  [v9 pairingClientDidEnterPhase:v11];
}

- (void)_pushGizmoBuddyController:(id)a3
{
  id v7 = a3;
  kdebug_trace();
  if ([(COSSetupController *)self _controllerShouldMirrorToGizmo:v7])
  {
    char v4 = [UIApp bridgeController];
    [v4 tellGizmoToPushControllerType:sub_10009A658(v7)];
  }
  id v5 = +[NRPairedDeviceRegistry sharedInstance];
  sub_10009A658(v7);
  id v6 = PBBuddyControllerDescription();
  [v5 pairingClientDidEnterPhase:v6];
}

- (unsigned)position
{
  return 0;
}

- (unsigned)state
{
  return 0;
}

- (void)activationServerResponded
{
  id v2 = [(COSBuddyNavigationController *)self->_navigationController topViewController];
  +[PBBridgeCAReporter activationServerRespondedAtPage:sub_10009A658(v2)];
}

- (void)finishedActivating:(id)a3
{
  id v4 = a3;
  if (PBLogPerformanceMetrics())
  {
    id v5 = +[PBBridgeResponsePerformanceMonitor shareMonitor];
    [v5 endMacroActivity:PBBridgeProxyActivationStageThreeActivityName beginTime:CFAbsoluteTimeGetCurrent()];
    double v7 = v6;

    +[PBBridgeCAReporter pushTimingType:4 withValue:v7];
  }
  double v8 = pbb_activation_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Watch finished activating", (uint8_t *)v18, 2u);
  }

  id v9 = UIApp;
  [v9 setIsActivated:1];
  [v9 resetActivationFailureCountAndReport:1];
  id v10 = [UIApp setupController];
  id v11 = [v10 pairingReportManager];

  [v11 addPairingTimeEventToPairingReportPlist:13 withValue:&__kCFBooleanTrue withError:0];
  [v11 checkInWithClosingPairingTimeEvent:18];
  [(COSSetupController *)self updateActivelyPairingWatchBuddyStage:1];
  id v12 = [v4 object];

  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v12 isEqualToString:PBBridgeWatchDemoDeviceString])
      {
        float v13 = [UIApp bridgeController];
        [v13 sendDemoWatchWirelessCredentials];

        self->_BOOL isDeKOTAFlow = 1;
      }
    }
  }
  if (PBShouldOfferBetterTogetherFlow())
  {
    if (!self->_isDeKOTAFlow)
    {
      int v14 = pbb_setupflow_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100173670();
      }

      [(COSSetupController *)self displayUnsupportedWatchPairingAlertToBetterTogetherDeviceWithCompletion:&stru_100245B30];
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (self->_isDeKOTAFlow)
  {
LABEL_15:
    id v15 = pbb_setupflow_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isDeKOTAFlow = self->_isDeKOTAFlow;
      v18[0] = 67109120;
      v18[1] = isDeKOTAFlow;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DeKOTA:%{BOOL}d skipping startPostActivationCompatiblePairingBackgroundTasks", (uint8_t *)v18, 8u);
    }

    goto LABEL_18;
  }
  if ([v9 isUpdatingGizmoInSetupFlow])
  {
    long long v17 = pbb_setupflow_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "updating in setup flow, skipping post activation tasks for now", (uint8_t *)v18, 2u);
    }
  }
  else
  {
    [(COSSetupController *)self startPostActivationCompatiblePairingBackgroundTasks];
  }
LABEL_18:
}

- (void)startPostActivationCompatiblePairingBackgroundTasks
{
  id v3 = pbb_activation_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "YES";
    if (!self->_alreadyStartPostActivationCompatiblePairingBackgroundTasks) {
      id v4 = "NO";
    }
    int v10 = 136315394;
    id v11 = "-[COSSetupController startPostActivationCompatiblePairingBackgroundTasks]";
    __int16 v12 = 2080;
    float v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: alreadyStartPostActivationCompatiblePairingBackgroundTasks:%s", (uint8_t *)&v10, 0x16u);
  }

  if (self->_alreadyStartPostActivationCompatiblePairingBackgroundTasks)
  {
    id v5 = pbb_activation_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100173710();
    }
  }
  else
  {
    self->_alreadyStartPostActivationCompatiblePairingBackgroundTasks = 1;
    [(COSSetupController *)self startSilentAppleIDSignIn];
    id v5 = [UIApp activeWatch];
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
    unsigned int v7 = [v5 supportsCapability:v6];

    if (v7)
    {
      double v8 = [sub_100006534() sharedInstance];
      [v8 startRemoteProvisioning];

      id v9 = [sub_100006534() sharedInstance];
      [v9 updateCellularPlansWithFetch:1];
    }
  }
}

- (void)startSilentAppleIDSignIn
{
  if (!self->_alreadyStartPostActivationCompatiblePairingBackgroundTasks)
  {
    id v5 = pbb_accountsignin_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      int v14 = "-[COSSetupController startSilentAppleIDSignIn]";
      id v6 = "%s - Activation not completed yet, ignoring";
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  id v3 = [UIApp bridgeController];
  unsigned int v4 = [v3 isTinkerPairing];

  if (v4)
  {
    id v5 = pbb_accountsignin_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      int v14 = "-[COSSetupController startSilentAppleIDSignIn]";
      id v6 = "%s - Skipped for Satellite Pairing";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  unsigned int v7 = +[COSCDPRepairController requiresiCDPRepair];
  id v5 = pbb_accountsignin_log();
  BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      int v13 = 136315138;
      int v14 = "-[COSSetupController startSilentAppleIDSignIn]";
      id v6 = "%s - CDP Repair required. Skipping";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v8)
  {
    int v13 = 136315138;
    int v14 = "-[COSSetupController startSilentAppleIDSignIn]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  if (!self->_hasStartedSilentAppleIDSignIn)
  {
    self->_hasStartedSilentAppleIDSignIn = 1;
    id v5 = [UIApp activeWatch];
    id v9 = [UIApp setupController];
    int v10 = [v9 pairingReportManager];

    [v10 addPairingTimeEventToPairingReportPlist:19 withValue:&__kCFBooleanTrue withError:0];
    [v10 checkInWithOpenPairingTimeEvent:44];
    [v10 checkInWithOpenPairingTimeEvent:43];
    id v11 = [[COSAppleIDSilentSignInController alloc] initWithDelegate:self device:v5];
    silentSignInController = self->_silentSignInController;
    self->_silentSignInController = v11;

    [(COSAppleIDSilentSignInController *)self->_silentSignInController startSigninIn];
    goto LABEL_11;
  }
}

- (void)saveCombinedPasswordBasediTunesStoreAccount:(id)a3 fromAccountStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pbb_accountsignin_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving iTunesStore account (%@) after successful password-based sign in for combined account", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009B744;
  v11[3] = &unk_100243878;
  id v12 = v6;
  id v9 = v6;
  +[COSiTunesStoreAuthController saveToPairedDeviceiTunesStoreAccount:v9 fromAccountStore:v7 completion:v11];

  int v10 = [(COSSetupController *)self appleIDSignInModel];
  [v10 setHasSignedInToiTunesStore:1];
}

- (COSActivationResponseManager)activationManager
{
  activationManager = self->_activationManager;
  if (!activationManager)
  {
    unsigned int v4 = objc_alloc_init(COSActivationResponseManager);
    id v5 = self->_activationManager;
    self->_activationManager = v4;

    [(COSActivationResponseManager *)self->_activationManager setSetupController:self];
    activationManager = self->_activationManager;
  }

  return activationManager;
}

- (COSSetupSoftwareUpdateManager)setupSoftwareUpdateManager
{
  setupSoftwareUpdateManager = self->_setupSoftwareUpdateManager;
  if (!setupSoftwareUpdateManager)
  {
    unsigned int v4 = objc_alloc_init(COSSetupSoftwareUpdateManager);
    id v5 = self->_setupSoftwareUpdateManager;
    self->_setupSoftwareUpdateManager = v4;

    setupSoftwareUpdateManager = self->_setupSoftwareUpdateManager;
  }

  return setupSoftwareUpdateManager;
}

- (COSPairingCompatibility)pairingCompatiblity
{
  pairingCompatiblity = self->_pairingCompatiblity;
  if (!pairingCompatiblity)
  {
    unsigned int v4 = objc_alloc_init(COSPairingCompatibility);
    id v5 = self->_pairingCompatiblity;
    self->_pairingCompatiblity = v4;

    pairingCompatiblity = self->_pairingCompatiblity;
  }

  return pairingCompatiblity;
}

- (void)checkInWithPairingMetricForSignInState
{
  id v3 = [(COSSetupController *)self appleIDSignInModel];
  unsigned int v4 = [v3 hasSignedIntoAllServices];

  if (v4)
  {
    id v5 = [(COSSetupController *)self pairingReportManager];
    [v5 addPairingTimeEventToPairingReportPlist:42 withValue:&__kCFBooleanTrue withError:0];
    [v5 checkInWithClosingPairingTimeEvent:43];
  }
}

- (void)completePairingMetricForAppTermination
{
  id v2 = [(COSSetupController *)self pairingReportManager];
  [v2 completeMetricForAppTermination];
}

- (void)appleIDSilentSignInControllerSignedAccountType:(unint64_t)a3 withSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case 0uLL:
      id v6 = [(COSSetupController *)self appleIDSignInModel];
      [v6 setHasSignedInToiCloud:v4];

      id v7 = [(COSSetupController *)self appleIDSignInModel];
      BOOL v8 = [v7 stateForServiceType:0];
      [v8 setSilentSignInSuccessful:v4];

      id v9 = [(COSSetupController *)self appleIDSignInModel];
      int v10 = [v9 stateForServiceType:0];
      uint64_t v11 = 20;
      uint64_t v12 = 21;
      goto LABEL_7;
    case 1uLL:
      int v13 = [(COSSetupController *)self appleIDSignInModel];
      [v13 setHasSignedInToiMessage:v4];

      id v14 = [(COSSetupController *)self appleIDSignInModel];
      id v15 = [v14 stateForServiceType:2];
      [v15 setSilentSignInSuccessful:v4];

      id v9 = [(COSSetupController *)self appleIDSignInModel];
      int v10 = [v9 stateForServiceType:2];
      uint64_t v11 = 30;
      uint64_t v12 = 31;
      goto LABEL_7;
    case 2uLL:
      long long v16 = [(COSSetupController *)self appleIDSignInModel];
      [v16 setHasSignedInToFaceTime:v4];

      long long v17 = [(COSSetupController *)self appleIDSignInModel];
      long long v18 = [v17 stateForServiceType:3];
      [v18 setSilentSignInSuccessful:v4];

      id v9 = [(COSSetupController *)self appleIDSignInModel];
      int v10 = [v9 stateForServiceType:3];
      uint64_t v11 = 35;
      uint64_t v12 = 36;
      goto LABEL_7;
    case 3uLL:
      long long v19 = [(COSSetupController *)self appleIDSignInModel];
      [v19 setHasSignedInToiTunesStore:v4];

      id v20 = [(COSSetupController *)self appleIDSignInModel];
      id v21 = [v20 stateForServiceType:1];
      [v21 setSilentSignInSuccessful:v4];

      id v9 = [(COSSetupController *)self appleIDSignInModel];
      int v10 = [v9 stateForServiceType:1];
      uint64_t v11 = 25;
      uint64_t v12 = 26;
LABEL_7:
      [v10 setWaitingForSilentSigninToComplete:0];

      break;
    default:
      uint64_t v12 = 0;
      uint64_t v11 = 0;
      break;
  }
  BOOL v22 = [UIApp setupController];
  id v30 = [v22 pairingReportManager];

  id v23 = +[NSNumber numberWithBool:v4];
  [v30 addPairingTimeEventToPairingReportPlist:v11 withValue:v23 withError:0];

  [v30 checkInWithClosingPairingTimeEvent:v12];
  id v24 = [(COSSetupController *)self appleIDSignInModel];
  unsigned __int8 v25 = [v24 waitingForAnySilentSignInToComplete];

  if ((v25 & 1) == 0)
  {
    [(COSAppleIDSilentSignInController *)self->_silentSignInController setDelegate:0];
    silentSignInController = self->_silentSignInController;
    self->_silentSignInController = 0;

    id v27 = [(COSSetupController *)self appleIDSignInModel];
    unsigned int v28 = [v27 silentSignInSuccessfulForAll];

    if (v28) {
      [v30 addPairingTimeEventToPairingReportPlist:40 withValue:&__kCFBooleanTrue withError:0];
    }
    [v30 checkInWithClosingPairingTimeEvent:44];
  }
  dispatch_time_t v29 = +[NSNotificationCenter defaultCenter];
  [v29 postNotificationName:@"COSBuddyAppleIDSilentSignInChangeNotification" object:0];
}

- (void)prewarmVisualDetector
{
  id v3 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009BE10;
  block[3] = &unk_1002438A0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)visualDetector
{
  return self->_detector;
}

- (BOOL)offerYorktownForCurrentPairing
{
  return self->_stagedEnrollmentDataForCurrentPairing != 0;
}

- (void)updateStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009BF78;
  block[3] = &unk_100245690;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (COSAppleIDAuthController)tinkerAuthenticationController
{
  tinkerAuthenticationController = self->_tinkerAuthenticationController;
  if (!tinkerAuthenticationController)
  {
    id v4 = objc_alloc_init(COSAppleIDAuthController);
    id v5 = self->_tinkerAuthenticationController;
    self->_tinkerAuthenticationController = v4;

    tinkerAuthenticationController = self->_tinkerAuthenticationController;
  }

  return tinkerAuthenticationController;
}

- (void)tellAppConduitToInstallAllApps
{
  id v3 = objc_alloc_init(COSWatchKitAppChoiceUpdater);
  appChoiceUpdater = self->_appChoiceUpdater;
  self->_appChoiceUpdater = v3;

  id v5 = self->_appChoiceUpdater;

  [(COSWatchKitAppChoiceUpdater *)v5 updateAppConduitAboutAppInstallChoice];
}

- (void)updateNanoRegistryToNormalState
{
  id v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    int v13 = "-[COSSetupController updateNanoRegistryToNormalState]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  id v4 = [UIApp activeWatch];
  if (v4)
  {
    int v5 = PBIsEarlyPairedSyncSupportedForDevice();
    if (v5 && !self->_nrUpdatedToNormalState)
    {
      [(COSSetupController *)self tellAppConduitToInstallAllApps];
      id v9 = [UIApp bridgeController];
      [v9 tellGizmoToUpdateNanoRegistryToNormalState];

      int v10 = pbb_setupflow_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        int v13 = "-[COSSetupController updateNanoRegistryToNormalState]";
        __int16 v14 = 2112;
        *(void *)id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s notifying device %@", (uint8_t *)&v12, 0x16u);
      }

      uint64_t v11 = +[NRPairedDeviceRegistry sharedInstance];
      [v11 notifyActivationCompleted:v4 withSuccess:1];

      self->_BOOL nrUpdatedToNormalState = 1;
    }
    else
    {
      id v6 = pbb_setupflow_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        BOOL nrUpdatedToNormalState = self->_nrUpdatedToNormalState;
        int v12 = 136315650;
        int v13 = "-[COSSetupController updateNanoRegistryToNormalState]";
        __int16 v14 = 1024;
        *(_DWORD *)id v15 = v5;
        *(_WORD *)&void v15[4] = 1024;
        *(_DWORD *)&v15[6] = nrUpdatedToNormalState;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s early sync supported %d already updated to normal state: %d", (uint8_t *)&v12, 0x18u);
      }
    }
  }
  else
  {
    id v8 = pbb_setupflow_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001737B4();
    }
  }
}

- (void)tellWatchAgainToUpdateNRToNormalStateAfterRelaunchingForLanguageChange
{
  if (self->_nrUpdatedToNormalState)
  {
    id v2 = [UIApp bridgeController];
    [v2 tellGizmoToUpdateNanoRegistryToNormalState];
  }
}

- (COSLinkUpgradeMonitor)linkUpgradeMonitor
{
  linkUpgradeMonitor = self->_linkUpgradeMonitor;
  if (!linkUpgradeMonitor)
  {
    id v4 = objc_alloc_init(COSLinkUpgradeMonitor);
    int v5 = self->_linkUpgradeMonitor;
    self->_linkUpgradeMonitor = v4;

    linkUpgradeMonitor = self->_linkUpgradeMonitor;
  }

  return linkUpgradeMonitor;
}

- (void)updateActivelyPairingWatchBuddyStage:(unsigned int)a3
{
  unsigned int v4 = self->_watchBuddyCompletedStages | a3;
  self->_watchBuddyCompletedStages = v4;
  int v5 = pbb_setupflow_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[COSSetupController updateActivelyPairingWatchBuddyStage:]";
    __int16 v12 = 1024;
    unsigned int v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s completed stages: %d", buf, 0x12u);
  }

  objc_initWeak((id *)buf, self);
  id v6 = dispatch_get_global_queue(25, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009C870;
  v7[3] = &unk_100245BC8;
  objc_copyWeak(&v8, (id *)buf);
  unsigned int v9 = v4;
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (BOOL)nextControllerToPresentAfterBlockedOnSignInStep
{
  if (!self->_controllerClassToPresentAfterSignIn || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v2 = objc_opt_class();

  return [v2 controllerBlocksRunningBeforeSignInStep];
}

- (BOOL)hasAddedPasscode
{
  return self->_hasAddedPasscode;
}

- (void)setHasAddedPasscode:(BOOL)a3
{
  self->_hasAddedPasscode = a3;
}

- (COSBuddyNavigationController)navigationController
{
  return self->_navigationController;
}

- (NSMutableArray)buddyControllers
{
  return self->_buddyControllers;
}

- (void)setBuddyControllers:(id)a3
{
}

- (BOOL)setupCompletedSuccessfully
{
  return self->_setupCompletedSuccessfully;
}

- (void)setSetupCompletedSuccessfully:(BOOL)a3
{
  self->_setupCompletedSuccessfully = a3;
}

- (BRRTCPairingReportManager)pairingReportManager
{
  return self->_pairingReportManager;
}

- (BOOL)resolvedPreconditionsForSoftwareUpdate
{
  return self->_resolvedPreconditionsForSoftwareUpdate;
}

- (void)setResolvedPreconditionsForSoftwareUpdate:(BOOL)a3
{
  self->_resolvedPreconditionsForSoftwareUpdate = a3;
}

- (void)setAppleIDSignInModel:(id)a3
{
}

- (NRDevice)activePairingDevice
{
  return self->_activePairingDevice;
}

- (void)setActivePairingDevice:(id)a3
{
}

- (COSPairingTypeSelectionViewController)pairingTypeSelectionController
{
  return self->_pairingTypeSelectionController;
}

- (void)setPairingTypeSelectionController:(id)a3
{
}

- (COSPasscodeChoiceViewController)passcodeChoiceController
{
  return self->_passcodeChoiceController;
}

- (void)setPasscodeChoiceController:(id)a3
{
}

- (COSBuddyController)controllerDisplayedWhileOnHold
{
  return self->_controllerDisplayedWhileOnHold;
}

- (void)setControllerDisplayedWhileOnHold:(id)a3
{
}

- (COSBuddyController)nextControllerAfterHold
{
  return self->_nextControllerAfterHold;
}

- (void)setNextControllerAfterHold:(id)a3
{
}

- (UIActivityIndicatorView)customActivityIndicator
{
  return self->_customActivityIndicator;
}

- (void)setCustomActivityIndicator:(id)a3
{
}

- (COSAppleIDSilentSignInController)silentSignInController
{
  return self->_silentSignInController;
}

- (void)setSilentSignInController:(id)a3
{
}

- (BOOL)hasStartedSilentAppleIDSignIn
{
  return self->_hasStartedSilentAppleIDSignIn;
}

- (void)setHasStartedSilentAppleIDSignIn:(BOOL)a3
{
  self->_hasStartedSilentAppleIDSignIn = a3;
}

- (BOOL)updateInSetupFlowHasCompleted
{
  return self->_updateInSetupFlowHasCompleted;
}

- (void)setUpdateInSetupFlowHasCompleted:(BOOL)a3
{
  self->_updateInSetupFlowHasCompleted = a3;
}

- (BOOL)alreadyStartPostActivationCompatiblePairingBackgroundTasks
{
  return self->_alreadyStartPostActivationCompatiblePairingBackgroundTasks;
}

- (void)setAlreadyStartPostActivationCompatiblePairingBackgroundTasks:(BOOL)a3
{
  self->_alreadyStartPostActivationCompatiblePairingBackgroundTasks = a3;
}

- (NSDate)revLockDelayAfterUpdateDate
{
  return self->_revLockDelayAfterUpdateDate;
}

- (void)setRevLockDelayAfterUpdateDate:(id)a3
{
}

- (OS_dispatch_source)revLockDelayAfterUpdateTimer
{
  return self->_revLockDelayAfterUpdateTimer;
}

- (void)setRevLockDelayAfterUpdateTimer:(id)a3
{
}

- (BOOL)didWaitAfterRevLockUpdate
{
  return self->_didWaitAfterRevLockUpdate;
}

- (void)setDidWaitAfterRevLockUpdate:(BOOL)a3
{
  self->_didWaitAfterRevLockUpdate = a3;
}

- (BOOL)isObservingLockStatusNotificationForRevLockUpdate
{
  return self->_isObservingLockStatusNotificationForRevLockUpdate;
}

- (void)setIsObservingLockStatusNotificationForRevLockUpdate:(BOOL)a3
{
  self->_isObservingLockStatusNotificationForRevLockUpdate = a3;
}

- (COSRegistryDispatcher)alreadyPairedDispatcher
{
  return self->_alreadyPairedDispatcher;
}

- (void)setAlreadyPairedDispatcher:(id)a3
{
}

- (id)holdWaitScreenBlock
{
  return self->_holdWaitScreenBlock;
}

- (void)setHoldWaitScreenBlock:(id)a3
{
}

- (id)deferredHoldBlock
{
  return self->_deferredHoldBlock;
}

- (void)setDeferredHoldBlock:(id)a3
{
}

- (OS_dispatch_source)holdWaitScreenPresentationTimer
{
  return self->_holdWaitScreenPresentationTimer;
}

- (void)setHoldWaitScreenPresentationTimer:(id)a3
{
}

- (COSWristAttributeVisualDetector)detector
{
  return self->_detector;
}

- (void)setDetector:(id)a3
{
}

- (BOOL)isDeKOTAFlow
{
  return self->_isDeKOTAFlow;
}

- (void)setIsDeKOTAFlow:(BOOL)a3
{
  self->_BOOL isDeKOTAFlow = a3;
}

- (BOOL)didAllowTinkerHealthSharing
{
  return self->_didAllowTinkerHealthSharing;
}

- (void)setDidAllowTinkerHealthSharing:(BOOL)a3
{
  self->_didAllowTinkerHealthSharing = a3;
}

- (COSWatchUnpairInstructionsController)unpairInstructions
{
  return self->_unpairInstructions;
}

- (void)setUnpairInstructions:(id)a3
{
}

- (COSWatchKitAppChoiceUpdater)appChoiceUpdater
{
  return self->_appChoiceUpdater;
}

- (void)setAppChoiceUpdater:(id)a3
{
}

- (BOOL)nrUpdatedToNormalState
{
  return self->_nrUpdatedToNormalState;
}

- (void)setNrUpdatedToNormalState:(BOOL)a3
{
  self->_BOOL nrUpdatedToNormalState = a3;
}

- (unsigned)watchBuddyCompletedStages
{
  return self->_watchBuddyCompletedStages;
}

- (void)setWatchBuddyCompletedStages:(unsigned int)a3
{
  self->_watchBuddyCompletedStages = a3;
}

- (Class)controllerClassToPresentAfterSignIn
{
  return self->_controllerClassToPresentAfterSignIn;
}

- (void)setControllerClassToPresentAfterSignIn:(Class)a3
{
}

- (NRDevice)scannedDevice
{
  return self->_scannedDevice;
}

- (void)setScannedDevice:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_unint64_t mode = a3;
}

- (unint64_t)forcedSoftwareUpdateCheckReason
{
  return self->_forcedSoftwareUpdateCheckReason;
}

- (void)setForcedSoftwareUpdateCheckReason:(unint64_t)a3
{
  self->_forcedSoftwareUpdateCheckReason = a3;
}

- (NBBackup)backupRestoredFrom
{
  return self->_backupRestoredFrom;
}

- (void)setBackupRestoredFrom:(id)a3
{
  self->_backupRestoredFrom = (NBBackup *)a3;
}

- (NRDevice)deviceRestoredFrom
{
  return self->_deviceRestoredFrom;
}

- (void)setDeviceRestoredFrom:(id)a3
{
  self->_deviceRestoredFrom = (NRDevice *)a3;
}

- (BOOL)expressMode
{
  return self->_expressMode;
}

- (void)setExpressMode:(BOOL)a3
{
  self->_expressMode = a3;
}

- (void)setExpressModeDevice:(id)a3
{
  self->_expressModeDevice = (NRDevice *)a3;
}

- (BOOL)wristChoicesDetected
{
  return self->_wristChoicesDetected;
}

- (void)setWristChoicesDetected:(BOOL)a3
{
  self->_wristChoicesDetected = a3;
}

- (COSInternalPairingDashboardViewController)internalDashboardController
{
  return self->_internalDashboardController;
}

- (void)setInternalDashboardController:(id)a3
{
}

- (NSString)tinkerUserName
{
  return self->_tinkerUserName;
}

- (FAFamilyMember)tinkerFamilyMember
{
  return self->_tinkerFamilyMember;
}

- (FAFamilyMember)organizerFamilyMember
{
  return self->_organizerFamilyMember;
}

- (void)setOrganizerFamilyMember:(id)a3
{
}

- (FAFamilyMember)pairingParentFamilyMember
{
  return self->_pairingParentFamilyMember;
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (void)setFamilyCircle:(id)a3
{
}

- (FAProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (void)setProfilePictureStore:(id)a3
{
}

- (NSString)tinkerSignInId
{
  return self->_tinkerSignInId;
}

- (void)setTinkerSignInId:(id)a3
{
}

- (BOOL)didAllowTinkerLocationPermissions
{
  return self->_didAllowTinkerLocationPermissions;
}

- (void)setDidAllowTinkerLocationPermissions:(BOOL)a3
{
  self->_didAllowTinkerLocationPermissions = a3;
}

- (void)setExpressModeControllers:(id)a3
{
}

- (COSPaymentExpressSetupManager)paymentExpressSetupManager
{
  return self->_paymentExpressSetupManager;
}

- (void)setPaymentExpressSetupManager:(id)a3
{
}

- (id)lastLiveActivityProvider
{
  id WeakRetained = objc_loadWeakRetained(&self->_lastLiveActivityProvider);

  return WeakRetained;
}

- (void)setLastLiveActivityProvider:(id)a3
{
}

- (unint64_t)analyticsEnrollmentRetryCount
{
  return self->_analyticsEnrollmentRetryCount;
}

- (void)setAnalyticsEnrollmentRetryCount:(unint64_t)a3
{
  self->_analyticsEnrollmentRetryCount = a3;
}

- (BOOL)analyticsEnrollmentFailed
{
  return self->_analyticsEnrollmentFailed;
}

- (void)setAnalyticsEnrollmentFailed:(BOOL)a3
{
  self->_analyticsEnrollmentFailed = a3;
}

- (COSResumePairingStateController)resumePairingController
{
  return self->_resumePairingController;
}

- (void)setResumePairingController:(id)a3
{
}

- (NSData)stagedEnrollmentDataForCurrentPairing
{
  return self->_stagedEnrollmentDataForCurrentPairing;
}

- (void)setStagedEnrollmentDataForCurrentPairing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedEnrollmentDataForCurrentPairing, 0);
  objc_storeStrong((id *)&self->_resumePairingController, 0);
  objc_destroyWeak(&self->_lastLiveActivityProvider);
  objc_storeStrong((id *)&self->_paymentExpressSetupManager, 0);
  objc_storeStrong((id *)&self->_expressModeControllers, 0);
  objc_storeStrong((id *)&self->_tinkerSignInId, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
  objc_storeStrong((id *)&self->_pairingParentFamilyMember, 0);
  objc_storeStrong((id *)&self->_organizerFamilyMember, 0);
  objc_storeStrong((id *)&self->_tinkerFamilyMember, 0);
  objc_storeStrong((id *)&self->_tinkerUserName, 0);
  objc_storeStrong((id *)&self->_internalDashboardController, 0);
  objc_storeStrong((id *)&self->_scannedDevice, 0);
  objc_storeStrong((id *)&self->_controllerClassToPresentAfterSignIn, 0);
  objc_storeStrong((id *)&self->_appChoiceUpdater, 0);
  objc_storeStrong((id *)&self->_unpairInstructions, 0);
  objc_storeStrong((id *)&self->_detector, 0);
  objc_storeStrong((id *)&self->_holdWaitScreenPresentationTimer, 0);
  objc_storeStrong(&self->_deferredHoldBlock, 0);
  objc_storeStrong(&self->_holdWaitScreenBlock, 0);
  objc_storeStrong((id *)&self->_alreadyPairedDispatcher, 0);
  objc_storeStrong((id *)&self->_revLockDelayAfterUpdateTimer, 0);
  objc_storeStrong((id *)&self->_revLockDelayAfterUpdateDate, 0);
  objc_storeStrong((id *)&self->_silentSignInController, 0);
  objc_storeStrong((id *)&self->_customActivityIndicator, 0);
  objc_storeStrong((id *)&self->_nextControllerAfterHold, 0);
  objc_storeStrong((id *)&self->_controllerDisplayedWhileOnHold, 0);
  objc_storeStrong((id *)&self->_passcodeChoiceController, 0);
  objc_storeStrong((id *)&self->_pairingTypeSelectionController, 0);
  objc_storeStrong((id *)&self->_activePairingDevice, 0);
  objc_storeStrong((id *)&self->_appleIDSignInModel, 0);
  objc_storeStrong((id *)&self->_pairingReportManager, 0);
  objc_storeStrong((id *)&self->_buddyControllers, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_linkUpgradeMonitor, 0);
  objc_storeStrong((id *)&self->_tinkerAuthenticationController, 0);
  objc_storeStrong((id *)&self->_pairingCompatiblity, 0);
  objc_storeStrong((id *)&self->_setupSoftwareUpdateManager, 0);

  objc_storeStrong((id *)&self->_activationManager, 0);
}

+ (BOOL)isLiveActivityFeatureEnabled
{
  int v5 = &type metadata for FeatureFlags;
  unint64_t v6 = sub_100138AF4();
  v4[0] = 0;
  char v2 = isFeatureEnabled(_:)();
  sub_1001417F4((uint64_t)v4);
  return v2 & 1;
}

- (BOOL)areLiveActivitiesAllowed
{
  id v8 = &type metadata for FeatureFlags;
  unint64_t v9 = sub_100138AF4();
  v7[0] = 0;
  id v3 = self;
  char v4 = isFeatureEnabled(_:)();
  sub_1001417F4((uint64_t)v7);
  unsigned __int8 v5 = 0;
  if (v4) {
    unsigned __int8 v5 = [(COSSetupController *)v3 hasStartedPairing];
  }

  return v5;
}

- (BOOL)doesLiveActivityProviderRequiresPairSyncNotifications
{
  char v2 = self;
  unsigned __int8 v3 = sub_100138C68(&qword_10029A5C0);

  return v3 & 1;
}

- (void)startLiveActivity
{
  char v2 = self;
  sub_100138D7C();
}

- (void)updateLiveActivityWithViewController:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  if ([(COSSetupController *)v5 areLiveActivitiesAllowed]) {
    sub_100138EAC(v4);
  }
}

- (void)updateLiveActivityWithBuddyController:(id)a3
{
  swift_unknownObjectRetain();
  unsigned __int8 v5 = self;
  if ([(COSSetupController *)v5 areLiveActivitiesAllowed]) {
    sub_100138EAC(a3);
  }
  swift_unknownObjectRelease();
}

- (void)updateLiveActivityWithTitle:(id)a3 subtitle:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  unsigned __int8 v5 = self;
  sub_100139A6C();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)endLiveActivityWithEndStatus:(int64_t)a3
{
  id v4 = self;
  sub_100139CA8(a3);
}

- (void)endLiveActivityIfNeeded
{
  char v2 = self;
  if (sub_100138C68(&qword_10029A5C8)) {
    [(COSSetupController *)v2 endLiveActivityWithEndStatus:1];
  }
}

- (void)updateActivityAndRegenerateImages
{
  char v2 = self;
  sub_100139F4C();
}

@end