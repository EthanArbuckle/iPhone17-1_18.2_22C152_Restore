@interface SBDashBoardLockScreenEnvironment
- (BOOL)biometricUnlockBehavior:(id)a3 requestsFeedback:(id)a4;
- (BOOL)biometricUnlockBehavior:(id)a3 requestsUnlock:(id)a4 withFeedback:(id)a5;
- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3;
- (BOOL)canHostAnApp;
- (BOOL)expectsFaceContact;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)isAuthenticated;
- (BOOL)isHostingAnApp;
- (BOOL)isInScreenOffMode;
- (BOOL)isMainPageVisible;
- (BOOL)isPasscodeLockVisible;
- (BOOL)isShowingMediaControls;
- (BOOL)isUnlockDisabled;
- (BOOL)shouldAutoUnlockForSource:(int)a3;
- (BOOL)shouldDisableALS;
- (BOOL)shouldPresentOrDismissCoverSheetSpotlight;
- (BOOL)shouldShowLockStatusBarTime;
- (BOOL)shouldUnlockUIOnKeyDownEvent;
- (BOOL)suppressesBanners;
- (BOOL)suppressesControlCenter;
- (BOOL)suppressesScreenshots;
- (BOOL)willUIUnlockFromSource:(int)a3;
- (CSCoverSheetViewController)coverSheetViewController;
- (NSString)description;
- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate;
- (SBDashBoardLockScreenEnvironment)init;
- (SBDashBoardLockScreenEnvironment)initWithCoverSheetViewController:(id)a3;
- (SBFLockScreenActionContext)_customLockScreenActionContext;
- (SBFScreenWakeAnimationTarget)screenWakeAnimationTarget;
- (SBIdleTimerProviding)idleTimerProvider;
- (SBLockScreenApplicationLaunching)applicationLauncher;
- (SBLockScreenCallHandling)callController;
- (SBLockScreenIdleTimerControlling)idleTimerController;
- (SBLockScreenPluginPresenting)pluginPresenter;
- (SBSWidgetMetricsProviding)widgetMetricsProvider;
- (UIViewController)rootViewController;
- (double)backlightLevel;
- (id)createHomeButtonShowPasscodeRecognizerForHomeButtonPress;
- (id)createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:(int)a3;
- (id)defaultHostableEntityForActivationOfCamera:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)backlightLuminance;
- (void)_setExpectsFaceContact:(BOOL)a3;
- (void)captureLaunchPolicyDidUpdatePolicy:(id)a3;
- (void)coverSheetViewController:(id)a3 didChangeActiveBehavior:(id)a4;
- (void)finishUIUnlockFromSource:(int)a3;
- (void)handleBiometricEvent:(unint64_t)a3;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)jiggleLockIcon;
- (void)noteDeviceBlockedStatusUpdated;
- (void)noteMenuButtonDown;
- (void)noteMenuButtonUp;
- (void)noteResetRestoreStateUpdated;
- (void)prepareForUILock;
- (void)prepareForUIUnlock;
- (void)presentOrDismissCoverSheetSpotlightAnimated:(BOOL)a3;
- (void)screenSleepCompletedForSource:(int)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBacklightLevel:(double)a3;
- (void)setBiometricUnlockBehaviorDelegate:(id)a3;
- (void)setCustomLockScreenActionContext:(id)a3;
- (void)setInScreenOffMode:(BOOL)a3;
- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5;
- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5 preservingCoverSheetPresentationState:(BOOL)a6;
- (void)setInScreenOffMode:(BOOL)a3 preservingCoverSheetPresentationState:(BOOL)a4;
- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setShowingMediaControls:(BOOL)a3;
- (void)startLockScreenFadeInAnimationForSource:(int)a3;
- (void)updateScaleViewWithScale:(double)a3 withDuration:(double)a4;
- (void)updateStatusBarForLockScreenComeback;
- (void)updateStatusBarForLockScreenTeardown;
@end

@implementation SBDashBoardLockScreenEnvironment

- (UIViewController)rootViewController
{
  return (UIViewController *)self->_coverSheetViewController;
}

- (BOOL)isHostingAnApp
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController isHostingAnApp];
}

- (SBDashBoardLockScreenEnvironment)init
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v3 = [SBDefaultCoverSheetContext alloc];
  v4 = [(id)SBApp windowSceneManager];
  v5 = [v4 embeddedDisplayWindowScene];
  v6 = [(SBDefaultCoverSheetContext *)v3 initWithWindowScene:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F5E418]);
  v8 = [(id)SBApp authenticationController];
  v9 = (void *)[v7 initWithAuthenticationProvider:v8];

  v10 = objc_alloc_init(SBDashBoardCameraPageViewController);
  [(SBDashBoardCameraPageViewController *)v10 setCameraPageDelegate:self];
  v11 = (void *)MEMORY[0x1E4F1CA48];
  v21[0] = v9;
  v21[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v13 = [v11 arrayWithArray:v12];

  cameraPageViewController = self->_cameraPageViewController;
  self->_cameraPageViewController = v10;
  v15 = v10;

  id v16 = objc_alloc(MEMORY[0x1E4F5E3D8]);
  v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v13];

  v18 = (void *)[v16 initWithPageViewControllers:v17 mainPageContentViewController:v9 context:v6];
  v19 = [(SBDashBoardLockScreenEnvironment *)self initWithCoverSheetViewController:v18];

  return v19;
}

- (SBDashBoardLockScreenEnvironment)initWithCoverSheetViewController:(id)a3
{
  id v5 = a3;
  v60.receiver = self;
  v60.super_class = (Class)SBDashBoardLockScreenEnvironment;
  v6 = [(SBDashBoardLockScreenEnvironment *)&v60 init];
  id v7 = v6;
  if (!v6) {
    goto LABEL_23;
  }
  p_coverSheetViewController = &v6->_coverSheetViewController;
  objc_storeStrong((id *)&v6->_coverSheetViewController, a3);
  [(CSCoverSheetViewController *)v7->_coverSheetViewController addCoverSheetObserver:v7];
  v9 = [[SBDashBoardAnalyticsEmitter alloc] initWithCoverSheetViewController:v7->_coverSheetViewController];
  analyticsEmitter = v7->_analyticsEmitter;
  v7->_analyticsEmitter = v9;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRolePipelineManager") & 1) == 0)
  {
    v11 = objc_alloc_init(SBDashBoardOrientationController);
    orientationController = v7->_orientationController;
    v7->_orientationController = v11;

    [(CSCoverSheetViewController *)v7->_coverSheetViewController setOrientationUpdateController:v7->_orientationController];
  }
  if (LCSFeatureEnabled())
  {
    if (_os_feature_enabled_impl())
    {
      v13 = [(id)SBApp authenticationController];
      uint64_t v14 = +[SBDashBoardExtensionWhileLockedCapturePolicy policyWithAuthenticationStatusProvider:v13];
      captureLaunchPolicy = v7->_captureLaunchPolicy;
      v7->_captureLaunchPolicy = (SBDashBoardCaptureLaunchPolicy *)v14;

      goto LABEL_12;
    }
    if (_os_feature_enabled_impl()) {
      id v16 = SBDashBoardExtensionAlwaysCapturePolicy;
    }
    else {
      id v16 = SBDashBoardExtensionAlwaysExcludingCameraCapturePolicy;
    }
  }
  else
  {
    id v16 = SBDashBoardCameraOnlyLaunchPolicy;
  }
  v17 = (SBDashBoardCaptureLaunchPolicy *)objc_alloc_init(v16);
  v13 = v7->_captureLaunchPolicy;
  v7->_captureLaunchPolicy = v17;
LABEL_12:

  [(SBDashBoardCaptureLaunchPolicy *)v7->_captureLaunchPolicy addLaunchPolicyObserver:v7];
  v18 = objc_alloc_init(SBDashBoardApplicationLauncher);
  applicationLauncher = v7->_applicationLauncher;
  v7->_applicationLauncher = v18;

  [(SBDashBoardApplicationLauncher *)v7->_applicationLauncher setCoverSheetViewController:v7->_coverSheetViewController];
  v20 = v7->_applicationLauncher;
  v21 = +[SBSecureAppManager sharedInstance];
  [(SBDashBoardApplicationLauncher *)v20 setSecureAppManager:v21];

  [(SBDashBoardApplicationLauncher *)v7->_applicationLauncher setCaptureLaunchPolicy:v7->_captureLaunchPolicy];
  [(CSCoverSheetViewController *)v7->_coverSheetViewController setCameraPrewarmer:v7->_applicationLauncher];
  [(CSCoverSheetViewController *)v7->_coverSheetViewController setApplicationLauncher:v7->_applicationLauncher];
  v22 = objc_alloc_init(SBDashBoardWidgetURLHandler);
  widgetURLHandler = v7->_widgetURLHandler;
  v7->_widgetURLHandler = v22;

  [(CSCoverSheetViewController *)v7->_coverSheetViewController setWidgetURLHandler:v7->_widgetURLHandler];
  v24 = objc_alloc_init(SBLockScreenActionManager);
  lockScreenActionManager = v7->_lockScreenActionManager;
  v7->_lockScreenActionManager = v24;

  [(SBLockScreenActionManager *)v7->_lockScreenActionManager registerLockScreenActionProvider:v7->_coverSheetViewController forSource:1];
  v26 = [[SBDashBoardEmergencyDialerController alloc] initWithCoverSheetViewController:v7->_coverSheetViewController];
  emergencyDialerController = v7->_emergencyDialerController;
  v7->_emergencyDialerController = v26;

  [(CSCoverSheetViewController *)v7->_coverSheetViewController setEmergencyCaller:v7->_emergencyDialerController];
  v28 = [[SBDashBoardPluginController alloc] initWithCoverSheetViewController:v7->_coverSheetViewController];
  pluginController = v7->_pluginController;
  v7->_pluginController = v28;

  v30 = v7->_lockScreenActionManager;
  v31 = [(SBDashBoardPluginController *)v7->_pluginController lockScreenActionProvider];
  [(SBLockScreenActionManager *)v30 registerLockScreenActionProvider:v31 forSource:11];

  v32 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  v33 = [v32 policyAggregator];

  v34 = [[SBDashBoardPolicyBasedBehaviorProvider alloc] initWithCoverSheetViewController:v7->_coverSheetViewController policyAggregator:v33];
  policyBasedBehaviorProvider = v7->_policyBasedBehaviorProvider;
  v7->_policyBasedBehaviorProvider = v34;

  v36 = [SBDashBoardSetupController alloc];
  coverSheetViewController = v7->_coverSheetViewController;
  v38 = +[SBSetupManager sharedInstance];
  uint64_t v39 = [(SBDashBoardSetupController *)v36 initWithCoverSheetViewController:coverSheetViewController setupManager:v38];
  setupController = v7->_setupController;
  v7->_setupController = (SBDashBoardSetupController *)v39;

  v41 = [[SBDashBoardBiometricUnlockController alloc] initWithCoverSheetViewController:v7->_coverSheetViewController];
  biometricUnlockController = v7->_biometricUnlockController;
  v7->_biometricUnlockController = v41;

  [(SBDashBoardBiometricUnlockController *)v7->_biometricUnlockController setBiometricUnlockBehaviorDelegate:v7];
  v43 = [[SBDashBoardIdleTimerController alloc] initWithCoverSheetViewController:v7->_coverSheetViewController];
  idleTimerController = v7->_idleTimerController;
  v7->_idleTimerController = v43;

  [(CSCoverSheetViewController *)v7->_coverSheetViewController setIdleTimerController:v7->_idleTimerController];
  if (!__sb__runningInSpringBoard())
  {
    v47 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v48 = [v47 userInterfaceIdiom];

    if (v48 != 1) {
      goto LABEL_14;
    }
LABEL_16:
    v49 = (SBSearchGesture *)objc_alloc_init(MEMORY[0x1E4FA6478]);
    searchGesture = v7->_searchGesture;
    v7->_searchGesture = v49;

    [(SBSearchGesture *)v7->_searchGesture setDelegate:v7->_coverSheetViewController];
    [(CSCoverSheetViewController *)v7->_coverSheetViewController setSearchGesture:v7->_searchGesture];
    goto LABEL_17;
  }
  if (SBFEffectiveDeviceClass() == 2) {
    goto LABEL_16;
  }
LABEL_14:
  v45 = [[SBCoverSheetSpotlightPresenter alloc] initWithDelegate:v7->_coverSheetViewController];
  coverSheetSpotlightPresenter = v7->_coverSheetSpotlightPresenter;
  v7->_coverSheetSpotlightPresenter = v45;

  [(CSCoverSheetViewController *)v7->_coverSheetViewController setCoverSheetSpotlightPresenter:v7->_coverSheetSpotlightPresenter];
LABEL_17:
  v51 = [(id)SBApp backlightEnvironmentSessionProvider];
  [v51 registerBacklightSceneHostEnvironmentProvider:*p_coverSheetViewController];
  v52 = objc_alloc_init(SBBacklightSignificantUserInteractionMonitor);
  [(SBBacklightSignificantUserInteractionMonitor *)v52 setCoverSheetViewController:*p_coverSheetViewController];
  v53 = [(id)SBApp blshService];
  v54 = [v53 platformProvider];
  uint64_t v55 = objc_opt_class();
  id v56 = v54;
  if (v55)
  {
    if (objc_opt_isKindOfClass()) {
      v57 = v56;
    }
    else {
      v57 = 0;
    }
  }
  else
  {
    v57 = 0;
  }
  id v58 = v57;

  [v58 setSignificantUserInteractionMonitor:v52];
LABEL_23:

  return v7;
}

- (SBIdleTimerProviding)idleTimerProvider
{
  return (SBIdleTimerProviding *)self->_idleTimerController;
}

- (SBFScreenWakeAnimationTarget)screenWakeAnimationTarget
{
  return (SBFScreenWakeAnimationTarget *)[(CSCoverSheetViewController *)self->_coverSheetViewController legacyWallpaperWakeAnimator];
}

- (SBLockScreenApplicationLaunching)applicationLauncher
{
  return (SBLockScreenApplicationLaunching *)self->_applicationLauncher;
}

- (SBLockScreenCallHandling)callController
{
  return (SBLockScreenCallHandling *)self->_emergencyDialerController;
}

- (SBLockScreenIdleTimerControlling)idleTimerController
{
  return (SBLockScreenIdleTimerControlling *)self->_idleTimerController;
}

- (SBLockScreenPluginPresenting)pluginPresenter
{
  return (SBLockScreenPluginPresenting *)self->_pluginController;
}

- (SBSWidgetMetricsProviding)widgetMetricsProvider
{
  return (SBSWidgetMetricsProviding *)[(CSCoverSheetViewController *)self->_coverSheetViewController widgetMetricsProvider];
}

- (NSString)description
{
  return (NSString *)[(SBDashBoardLockScreenEnvironment *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBDashBoardLockScreenEnvironment *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_coverSheetViewController withName:@"coverSheetViewController"];
  id v5 = (id)[v3 appendObject:self->_orientationController withName:@"orientationController"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBDashBoardLockScreenEnvironment *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)defaultHostableEntityForActivationOfCamera:(id)a3
{
  id v4 = [SBDeviceApplicationSceneEntity alloc];
  id v5 = +[SBApplicationController sharedInstance];
  v6 = [v5 cameraApplication];
  id v7 = [(SBDeviceApplicationSceneEntity *)v4 initWithApplicationForMainDisplay:v6];

  v8 = [(SBDashBoardCaptureLaunchPolicy *)self->_captureLaunchPolicy resolveCameraDestinationLaunchOf:v7 fromSource:SBDashBoardCaptureLaunchSourceCameraPage];
  v9 = v8;
  if (v8
    && ([v8 placement],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqual:SBDashBoardCapturePlacementCameraPage],
        v10,
        (v11 & 1) == 0))
  {
    v13 = SBLogDashBoard();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBDashBoardLockScreenEnvironment defaultHostableEntityForActivationOfCamera:](v9, v13);
    }

    v12 = 0;
  }
  else
  {
    v12 = [v9 entity];
  }

  return v12;
}

- (void)captureLaunchPolicyDidUpdatePolicy:(id)a3
{
}

- (BOOL)canHostAnApp
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController canHostAnApp];
}

- (id)hostedAppSceneHandle
{
  return (id)[(CSCoverSheetViewController *)self->_coverSheetViewController hostedAppSceneHandle];
}

- (id)hostedAppSceneHandles
{
  return (id)[(CSCoverSheetViewController *)self->_coverSheetViewController hostedAppSceneHandles];
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController shouldAutoUnlockForSource:*(void *)&a3];
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  -[CSCoverSheetViewController handleBiometricEvent:](self->_coverSheetViewController, "handleBiometricEvent:");
  biometricUnlockController = self->_biometricUnlockController;
  [(SBDashBoardBiometricUnlockController *)biometricUnlockController handleBiometricEvent:a3];
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsFeedback:(id)a4
{
  id v5 = a4;
  v6 = [(SBDashBoardLockScreenEnvironment *)self biometricUnlockBehaviorDelegate];
  LOBYTE(self) = [v6 biometricUnlockBehavior:self requestsFeedback:v5];

  return (char)self;
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsUnlock:(id)a4 withFeedback:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [MEMORY[0x1E4FA7C68] sharedInstance];
  int v10 = [v9 hasPoseidonSupport];

  char v11 = +[SBCoverSheetPresentationManager sharedInstance];
  v12 = v11;
  if (v10) {
    char v13 = [v11 hasBeenDismissedSinceKeybagLockAndAuthenticated];
  }
  else {
    char v13 = [v11 hasBeenDismissedSinceKeybagLock];
  }
  char v14 = v13;

  if (v14)
  {
    char v15 = 0;
  }
  else
  {
    id v16 = [(SBDashBoardLockScreenEnvironment *)self biometricUnlockBehaviorDelegate];
    char v15 = [v16 biometricUnlockBehavior:self requestsUnlock:v7 withFeedback:v8];
  }
  return v15;
}

- (BOOL)handleHomeButtonPress
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController handleHomeButtonPress];
}

- (BOOL)handleHomeButtonDoublePress
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController handleHomeButtonDoublePress];
}

- (BOOL)handleHomeButtonLongPress
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController handleHomeButtonLongPress];
}

- (BOOL)handleLockButtonPress
{
  [(SBDashBoardBiometricUnlockController *)self->_biometricUnlockController noteLockButtonDown];
  coverSheetViewController = self->_coverSheetViewController;
  return [(CSCoverSheetViewController *)coverSheetViewController handleLockButtonPress];
}

- (BOOL)handleVoiceCommandButtonPress
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController handleVoiceCommandButtonPress];
}

- (BOOL)handleVolumeUpButtonPress
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController handleVolumeUpButtonPress];
}

- (BOOL)handleVolumeDownButtonPress
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController handleVolumeDownButtonPress];
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController handleHeadsetButtonPress:a3];
}

- (void)coverSheetViewController:(id)a3 didChangeActiveBehavior:(id)a4
{
  BOOL v5 = objc_msgSend(a4, "proximityDetectionMode", a3) == 2;
  [(SBDashBoardLockScreenEnvironment *)self _setExpectsFaceContact:v5];
}

- (BOOL)isInScreenOffMode
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController isInScreenOffMode];
}

- (void)setInScreenOffMode:(BOOL)a3
{
}

- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5
{
}

- (void)setInScreenOffMode:(BOOL)a3 preservingCoverSheetPresentationState:(BOOL)a4
{
}

- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5 preservingCoverSheetPresentationState:(BOOL)a6
{
  uint64_t v6 = *(void *)&a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    char v15 = +[SBEventObserverRegistry sharedInstance];
    [v15 setValue:0 forState:*MEMORY[0x1E4FA6FC8]];

    id v16 = +[SBEventObserverRegistry sharedInstance];
    [v16 postEventToInterestedObservers:*MEMORY[0x1E4FA6FB0]];

    char v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"SBLockScreenUndimmedNotification" object:0];
    goto LABEL_5;
  }
  [MEMORY[0x1E4F42FF0] _performWithAnimation:&__block_literal_global_362];
  char v11 = +[SBEventObserverRegistry sharedInstance];
  [v11 setValue:1 forState:*MEMORY[0x1E4FA6FC8]];

  v12 = +[SBEventObserverRegistry sharedInstance];
  [v12 postEventToInterestedObservers:*MEMORY[0x1E4FA6FA8]];

  if (!a6)
  {
    char v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:@"SBLockScreenDimmedNotification" object:0];

    char v14 = +[SBCoverSheetPresentationManager sharedInstance];
    [v14 setCoverSheetPresented:1 animated:0 withCompletion:0];
LABEL_5:
  }
  [(CSCoverSheetViewController *)self->_coverSheetViewController setInScreenOffMode:v8 forAutoUnlock:v7 fromUnlockSource:v6];
  v17 = +[SBBacklightController sharedInstance];
  int v18 = [v17 screenIsOn];
  int v19 = v18 ^ 1;

  if ((v18 ^ 1) != v8
    || v18 == [(CSCoverSheetViewController *)self->_coverSheetViewController isInScreenOffMode])
  {
    v20 = SBLogDashBoard();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      int v21 = [(CSCoverSheetViewController *)self->_coverSheetViewController isInScreenOffMode];
      v22[0] = 67109632;
      v22[1] = v19;
      __int16 v23 = 1024;
      BOOL v24 = v8;
      __int16 v25 = 1024;
      int v26 = v21;
      _os_log_fault_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_FAULT, "Discontinuity in screenOffMode. BacklightController screenOff: %{BOOL}u. LockScreenEnvironment screenOffMode: %{BOOL}u. CoverSheet screenOffMode: %{BOOL}u.", (uint8_t *)v22, 0x14u);
    }
  }
}

void __124__SBDashBoardLockScreenEnvironment_setInScreenOffMode_forAutoUnlock_fromUnlockSource_preservingCoverSheetPresentationState___block_invoke()
{
  id v0 = [(id)SBApp HUDController];
  [v0 dismissHUDs:1];
}

- (void)startLockScreenFadeInAnimationForSource:(int)a3
{
}

- (void)screenSleepCompletedForSource:(int)a3
{
}

- (int64_t)backlightLuminance
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController backlightLuminance];
}

- (double)backlightLevel
{
  [(CSCoverSheetViewController *)self->_coverSheetViewController backlightLevel];
  return result;
}

- (void)setBacklightLevel:(double)a3
{
}

- (BOOL)shouldDisableALS
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController shouldDisableALS];
}

- (BOOL)suppressesBanners
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController suppressesBanners];
}

- (BOOL)suppressesControlCenter
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController suppressesControlCenter];
}

- (BOOL)suppressesScreenshots
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController suppressesScreenshots];
}

- (void)noteDeviceBlockedStatusUpdated
{
}

- (void)noteResetRestoreStateUpdated
{
}

- (void)noteMenuButtonDown
{
}

- (void)noteMenuButtonUp
{
}

- (id)createHomeButtonShowPasscodeRecognizerForHomeButtonPress
{
  return (id)[(CSCoverSheetViewController *)self->_coverSheetViewController createHomeButtonShowPasscodeRecognizerForHomeButtonPress];
}

- (id)createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:(int)a3
{
  return (id)[(CSCoverSheetViewController *)self->_coverSheetViewController createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:*(void *)&a3];
}

- (BOOL)isMainPageVisible
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController isMainPageVisible];
}

- (SBFLockScreenActionContext)_customLockScreenActionContext
{
  return (SBFLockScreenActionContext *)[(CSCoverSheetViewController *)self->_coverSheetViewController _customLockScreenActionContext];
}

- (void)setCustomLockScreenActionContext:(id)a3
{
}

- (BOOL)isUnlockDisabled
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController isUnlockDisabled];
}

- (void)prepareForUIUnlock
{
  v3 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  [v3 resetIdleTimerForReason:@"DB:PrepareForUIUnlock"];

  id v4 = +[SBAlertItemsController sharedInstance];
  BOOL v5 = [v4 lockScreenModalAlertItemPresenter];
  id v7 = [v5 lockScreenActionContext];

  if (v7)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F5E470]);
    [v6 setLockScreenActionContext:v7];
    [(SBLockScreenActionManager *)self->_lockScreenActionManager registerLockScreenActionProvider:v6 forSource:2];
  }
  [(CSCoverSheetViewController *)self->_coverSheetViewController prepareForUIUnlock];
}

- (void)prepareForUILock
{
  v3 = +[SBBacklightController sharedInstance];
  int v4 = [v3 screenIsOn];

  if (v4)
  {
    BOOL v5 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    [v5 resetIdleTimerForReason:@"DB:PrepareForUILock"];

    [(SBDashBoardLockScreenEnvironment *)self setInScreenOffMode:0];
  }
  id v6 = +[SBAlertItemsController sharedInstance];
  [v6 convertUnlockedAlertsToLockedAlerts];

  coverSheetViewController = self->_coverSheetViewController;
  [(CSCoverSheetViewController *)coverSheetViewController prepareForUILock];
}

- (BOOL)willUIUnlockFromSource:(int)a3
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController willUIUnlockFromSource:*(void *)&a3];
}

- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController canBeDeactivatedForUIUnlockFromSource:*(void *)&a3];
}

- (void)finishUIUnlockFromSource:(int)a3
{
  [(CSCoverSheetViewController *)self->_coverSheetViewController finishUIUnlockFromSource:*(void *)&a3];
  [(SBLockScreenActionManager *)self->_lockScreenActionManager runUnlockAction];
  lockScreenActionManager = self->_lockScreenActionManager;
  [(SBLockScreenActionManager *)lockScreenActionManager registerLockScreenActionProvider:0 forSource:2];
}

- (BOOL)isAuthenticated
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController isAuthenticated];
}

- (void)setAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  -[SBDashBoardBiometricUnlockController setAuthenticated:](self->_biometricUnlockController, "setAuthenticated:");
  coverSheetViewController = self->_coverSheetViewController;
  [(CSCoverSheetViewController *)coverSheetViewController setAuthenticated:v3];
}

- (BOOL)shouldUnlockUIOnKeyDownEvent
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController shouldUnlockUIOnKeyDownEvent];
}

- (void)jiggleLockIcon
{
}

- (BOOL)isShowingMediaControls
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController isShowingMediaControls];
}

- (void)setShowingMediaControls:(BOOL)a3
{
}

- (BOOL)isPasscodeLockVisible
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController isPasscodeLockVisible];
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)_setExpectsFaceContact:(BOOL)a3
{
  if (self->_expectsFaceContact != a3)
  {
    self->_expectsFaceContact = a3;
    id v3 = +[SBCoverSheetPresentationManager sharedInstance];
    [v3 _updateProximitySensorState];
  }
}

- (BOOL)shouldShowLockStatusBarTime
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController shouldShowLockStatusBarTime];
}

- (void)updateStatusBarForLockScreenTeardown
{
}

- (void)updateStatusBarForLockScreenComeback
{
}

- (BOOL)shouldPresentOrDismissCoverSheetSpotlight
{
  return [(CSCoverSheetViewController *)self->_coverSheetViewController shouldPresentOrDismissCoverSheetSpotlight];
}

- (void)presentOrDismissCoverSheetSpotlightAnimated:(BOOL)a3
{
}

- (void)updateScaleViewWithScale:(double)a3 withDuration:(double)a4
{
}

- (CSCoverSheetViewController)coverSheetViewController
{
  return self->_coverSheetViewController;
}

- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
  return (SBBiometricUnlockBehaviorDelegate *)WeakRetained;
}

- (void)setBiometricUnlockBehaviorDelegate:(id)a3
{
}

- (BOOL)expectsFaceContact
{
  return self->_expectsFaceContact;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_biometricUnlockBehaviorDelegate);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_storeStrong((id *)&self->_coverSheetSpotlightPresenter, 0);
  objc_storeStrong((id *)&self->_widgetURLHandler, 0);
  objc_storeStrong((id *)&self->_setupController, 0);
  objc_storeStrong((id *)&self->_policyBasedBehaviorProvider, 0);
  objc_storeStrong((id *)&self->_pluginController, 0);
  objc_storeStrong((id *)&self->_orientationController, 0);
  objc_storeStrong((id *)&self->_idleTimerController, 0);
  objc_storeStrong((id *)&self->_emergencyDialerController, 0);
  objc_storeStrong((id *)&self->_lockScreenActionManager, 0);
  objc_storeStrong((id *)&self->_cameraPageViewController, 0);
  objc_storeStrong((id *)&self->_captureLaunchPolicy, 0);
  objc_storeStrong((id *)&self->_biometricUnlockController, 0);
  objc_storeStrong((id *)&self->_applicationLauncher, 0);
  objc_storeStrong((id *)&self->_analyticsEmitter, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

- (void)defaultHostableEntityForActivationOfCamera:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 placement];
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unexpectedly received non-camera-page placement %@ for camera page launch source", (uint8_t *)&v4, 0xCu);
}

@end