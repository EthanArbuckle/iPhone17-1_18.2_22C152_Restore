@interface SBDefaultCoverSheetContext
- (BOOL)dismissModalContentIfVisibleAnimated:(BOOL)a3;
- (BOOL)expectsPocketTouches;
- (BOOL)isCarPlayActiveForNotifications;
- (BOOL)isEmergencyCallSupported;
- (BOOL)isLogoutSupported;
- (BOOL)isObjectInProximity;
- (BOOL)isResetting;
- (BOOL)isRestoring;
- (BOOL)isSystemAssistantExperienceAvailable;
- (BOOL)isSystemAssistantExperienceEnabled;
- (BOOL)isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled;
- (BOOL)tapToWakeEnabled;
- (BOOL)wantsHomeScreenOverlay;
- (CSApplicationInforming)applicationInformer;
- (CSHomeAffordanceControlling)homeAffordanceController;
- (CSLegibilityProviding)legibilityProvider;
- (CSMagSafeAccessoryStatusProviding)accessoryStatusProvider;
- (CSModalHomeAffordanceControlling)modalHomeAffordanceController;
- (CSNotificationPresenting)notificationPresenter;
- (CSPlatterHomeGestureManaging)platterHomeGestureManager;
- (CSPowerStatusProviding)powerStatusProvider;
- (CSScreenStateProviding)screenStateProvider;
- (CSStatusBarControlling)statusBarController;
- (CSThermalStatusProviding)thermalStatusProvider;
- (CSWallpaperProviding)wallpaperProvider;
- (CSWallpaperSnapshotUpdating)wallpaperSnapshotUpdater;
- (NSArray)dismissableOverlays;
- (NSString)accessoryAnimationStatusChangedNotificationName;
- (NSString)accessoryAttachedNotificationName;
- (NSString)accessoryDetachedNotificationName;
- (NSString)powerStatusChangeNotificationName;
- (SBDefaultCoverSheetContext)initWithWindowScene:(id)a3;
- (SBFActionProviding)contentActionProvider;
- (SBFAuthenticationAssertionProviding)authenticationAssertionProvider;
- (SBFAuthenticationStatusProvider)authenticationStatusProvider;
- (SBFDateProviding)dateProvider;
- (SBFHomeAffordanceInteractionProviding)homeAffordanceInteractionProvider;
- (SBFLockOutStatusProvider)lockOutStatusProvider;
- (SBFPasscodeFieldChangeObserver)passcodeFieldChangeObserver;
- (SBFScreenWakeAnimationControlling)screenWakeAnimationController;
- (SBUIBiometricResource)biometricResource;
- (SBWindowScene)_sbWindowScene;
- (double)effectiveReachabilityYOffset;
- (id)_todayViewControllerIfAvailable;
- (id)applicationHosterForHostContextProvider:(id)a3;
- (id)applicationHosterForTraitsHostContextProvider:(id)a3;
- (id)createUnlockRequest;
- (id)createUnlockRequestForActionContext:(id)a3;
- (id)inhibitCaptureButtonActionAssertionWithReason:(id)a3;
- (id)newOverlayController;
- (id)requestProximityMode:(int)a3 forReason:(id)a4;
- (id)traitsAwareViewControllerForApplicationHoster:(id)a3 targetWindow:(id)a4;
- (int64_t)rawDeviceOrientationIgnoringOrientationLocks;
- (int64_t)resetState;
- (int64_t)restoreState;
- (void)addAssistantControllerObserver:(id)a3;
- (void)addProximitySensorProviderObserver:(id)a3;
- (void)assistantDidChangeSystemAssistantExperienceEnablement:(id)a3;
- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3;
- (void)assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:(id)a3;
- (void)attemptUnlockWithPasscode:(id)a3 finishUIUnlock:(BOOL)a4 completion:(id)a5;
- (void)deactivateReachability;
- (void)incrementIrisPlayCount;
- (void)logout;
- (void)newOverlayController;
- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6;
- (void)proximitySensorManager:(id)a3 crudeProximityDidChange:(BOOL)a4;
- (void)registerView:(id)a3 delegate:(id)a4;
- (void)removeAssistantControllerObserver:(id)a3;
- (void)removeProximitySensorProviderObserver:(id)a3;
- (void)setBiometricAutoUnlockingDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)stopMediaPlaybackForSource:(int64_t)a3;
- (void)unlockWithRequest:(id)a3 completion:(id)a4;
- (void)unregisterView:(id)a3;
@end

@implementation SBDefaultCoverSheetContext

- (void)proximitySensorManager:(id)a3 crudeProximityDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  self->_objectInProximity = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = self->_proximitySensorProviderObservers;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "proximitySensorProvider:objectWithinProximityDidChange:", self, v4, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (SBDefaultCoverSheetContext)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)SBDefaultCoverSheetContext;
  v5 = [(SBDefaultCoverSheetContext *)&v72 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sbWindowScene, v4);
    uint64_t v7 = [(id)SBApp authenticationController];
    authenticationAssertionProvider = v6->_authenticationAssertionProvider;
    v6->_authenticationAssertionProvider = (SBFAuthenticationAssertionProviding *)v7;

    uint64_t v9 = [(id)SBApp authenticationController];
    authenticationStatusProvider = v6->_authenticationStatusProvider;
    v6->_authenticationStatusProvider = (SBFAuthenticationStatusProvider *)v9;

    uint64_t v11 = [(id)SBApp authenticationController];
    passcodeFieldChangeObserver = v6->_passcodeFieldChangeObserver;
    v6->_passcodeFieldChangeObserver = (SBFPasscodeFieldChangeObserver *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4FA5FB0]);
    long long v14 = [MEMORY[0x1E4FA7CE0] sharedInstance];
    uint64_t v15 = [v13 initWithDateProvider:v14];
    dateProvider = v6->_dateProvider;
    v6->_dateProvider = (SBFDateProviding *)v15;

    uint64_t v17 = [(id)SBApp lockOutController];
    lockOutStatusProvider = v6->_lockOutStatusProvider;
    v6->_lockOutStatusProvider = (SBFLockOutStatusProvider *)v17;

    v19 = objc_alloc_init(SBDashBoardLegibilityProvider);
    legibilityProvider = v6->_legibilityProvider;
    v6->_legibilityProvider = (CSLegibilityProviding *)v19;

    uint64_t v21 = +[SBUIController sharedInstance];
    powerStatusProvider = v6->_powerStatusProvider;
    v6->_powerStatusProvider = (CSPowerStatusProviding *)v21;

    uint64_t v23 = [@"SBUIACStatusChangedNotification" copy];
    powerStatusChangeNotificationName = v6->_powerStatusChangeNotificationName;
    v6->_powerStatusChangeNotificationName = (NSString *)v23;

    v25 = objc_alloc_init(SBDashBoardThermalStatusProvider);
    thermalStatusProvider = v6->_thermalStatusProvider;
    v6->_thermalStatusProvider = (CSThermalStatusProviding *)v25;

    uint64_t v27 = [MEMORY[0x1E4FA7C68] sharedInstance];
    biometricResource = v6->_biometricResource;
    v6->_biometricResource = (SBUIBiometricResource *)v27;

    uint64_t v29 = +[SBBacklightController sharedInstance];
    screenStateProvider = v6->_screenStateProvider;
    v6->_screenStateProvider = (CSScreenStateProviding *)v29;

    uint64_t v31 = +[SBScreenWakeAnimationController sharedInstance];
    screenWakeAnimationController = v6->_screenWakeAnimationController;
    v6->_screenWakeAnimationController = (SBFScreenWakeAnimationControlling *)v31;

    uint64_t v33 = +[SBSyncController sharedInstance];
    syncController = v6->_syncController;
    v6->_syncController = (SBSyncController *)v33;

    v35 = objc_alloc_init(SBDashBoardWallpaperProvider);
    wallpaperProvider = v6->_wallpaperProvider;
    v6->_wallpaperProvider = (CSWallpaperProviding *)v35;

    uint64_t v37 = +[SBWallpaperController sharedInstance];
    wallpaperSnapshotUpdater = v6->_wallpaperSnapshotUpdater;
    v6->_wallpaperSnapshotUpdater = (CSWallpaperSnapshotUpdating *)v37;

    v39 = (SBFWallpaperAggdLogger *)objc_alloc_init(MEMORY[0x1E4FA6068]);
    wallpaperAggdLogger = v6->_wallpaperAggdLogger;
    v6->_wallpaperAggdLogger = v39;

    v41 = objc_alloc_init(SBDashBoardHomeAffordanceController);
    homeAffordanceController = v6->_homeAffordanceController;
    v6->_homeAffordanceController = (CSHomeAffordanceControlling *)v41;

    v43 = objc_alloc_init(SBDashBoardModalHomeAffordanceController);
    modalHomeAffordanceController = v6->_modalHomeAffordanceController;
    v6->_modalHomeAffordanceController = (CSModalHomeAffordanceControlling *)v43;

    v45 = objc_alloc_init(SBDashBoardPlatterHomeGestureManager);
    platterHomeGestureManager = v6->_platterHomeGestureManager;
    v6->_platterHomeGestureManager = (CSPlatterHomeGestureManaging *)v45;

    v47 = [SBDashBoardStatusBarController alloc];
    v48 = [v4 statusBarManager];
    uint64_t v49 = [(SBDashBoardStatusBarController *)v47 initWithWindowSceneStatusBarManager:v48];
    statusBarController = v6->_statusBarController;
    v6->_statusBarController = (CSStatusBarControlling *)v49;

    uint64_t v51 = +[SBActionHandler sharedInstance];
    contentActionProvider = v6->_contentActionProvider;
    v6->_contentActionProvider = (SBFActionProviding *)v51;

    v53 = objc_alloc_init(SBDashBoardApplicationInformer);
    applicationInformer = v6->_applicationInformer;
    v6->_applicationInformer = (CSApplicationInforming *)v53;

    v55 = objc_alloc_init(SBDashBoardNotificationPresenter);
    notificationPresenter = v6->_notificationPresenter;
    v6->_notificationPresenter = v55;

    uint64_t v57 = [(id)SBApp proximitySensorManager];
    proximitySensorManager = v6->_proximitySensorManager;
    v6->_proximitySensorManager = (SBProximitySensorManager *)v57;

    v59 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    proximitySensorProviderObservers = v6->_proximitySensorProviderObservers;
    v6->_proximitySensorProviderObservers = v59;

    [(SBProximitySensorManager *)v6->_proximitySensorManager addObserver:v6];
    uint64_t v61 = +[SBUIController sharedInstance];
    accessoryStatusProvider = v6->_accessoryStatusProvider;
    v6->_accessoryStatusProvider = (CSMagSafeAccessoryStatusProviding *)v61;

    uint64_t v63 = [@"SBUIAccessoryAttachedNotification" copy];
    accessoryAttachedNotificationName = v6->_accessoryAttachedNotificationName;
    v6->_accessoryAttachedNotificationName = (NSString *)v63;

    uint64_t v65 = [@"SBUIAccessoryDetachedNotification" copy];
    accessoryDetachedNotificationName = v6->_accessoryDetachedNotificationName;
    v6->_accessoryDetachedNotificationName = (NSString *)v65;

    uint64_t v67 = [@"SBUIAccessoryAnimationStatusChangedNotification" copy];
    accessoryAnimationStatusChangedNotificationName = v6->_accessoryAnimationStatusChangedNotificationName;
    v6->_accessoryAnimationStatusChangedNotificationName = (NSString *)v67;

    uint64_t v69 = [v4 homeAffordanceInteractionManager];
    homeAffordanceInteractionProvider = v6->_homeAffordanceInteractionProvider;
    v6->_homeAffordanceInteractionProvider = (SBFHomeAffordanceInteractionProviding *)v69;
  }
  return v6;
}

- (NSArray)dismissableOverlays
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = +[SBControlCenterController sharedInstance];
  v6[0] = v2;
  v3 = +[SBAssistantController sharedInstance];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return (NSArray *)v4;
}

- (CSNotificationPresenting)notificationPresenter
{
  return (CSNotificationPresenting *)self->_notificationPresenter;
}

- (void)attemptUnlockWithPasscode:(id)a3 finishUIUnlock:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = +[SBLockScreenManager sharedInstance];
  [v9 attemptUnlockWithPasscode:v8 finishUIUnlock:v5 completion:v7];
}

- (void)setBiometricAutoUnlockingDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[SBLockScreenManager sharedInstance];
  [v6 setBiometricAutoUnlockingDisabled:v4 forReason:v5];
}

- (void)setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = +[SBLockScreenManager sharedInstance];
  [v6 setPasscodeVisible:v5 animated:v4];
}

- (BOOL)isCarPlayActiveForNotifications
{
  v2 = [(id)SBApp notificationDispatcher];
  char v3 = [v2 isCarDestinationActive];

  return v3;
}

- (void)stopMediaPlaybackForSource:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = +[SBMediaController sharedInstance];
  [v4 stopForEventSource:v3];
}

- (void)deactivateReachability
{
  id v2 = +[SBReachabilityManager sharedInstance];
  [v2 deactivateReachability];
}

- (double)effectiveReachabilityYOffset
{
  id v2 = +[SBReachabilityManager sharedInstance];
  [v2 effectiveReachabilityYOffset];
  double v4 = v3;

  return v4;
}

- (BOOL)isResetting
{
  return [(SBSyncController *)self->_syncController isResetting];
}

- (int64_t)resetState
{
  int v2 = [(SBSyncController *)self->_syncController resetState];
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (BOOL)isRestoring
{
  return [(SBSyncController *)self->_syncController isRestoring];
}

- (int64_t)restoreState
{
  uint64_t v2 = [(SBSyncController *)self->_syncController restoreState] - 1;
  if (v2 < 4) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (BOOL)isEmergencyCallSupported
{
  uint64_t v2 = +[SBTelephonyManager sharedTelephonyManager];
  char v3 = [v2 emergencyCallSupported];

  return v3;
}

- (BOOL)expectsPocketTouches
{
  uint64_t v2 = +[SBCoverSheetPresentationManager sharedInstance];
  char v3 = [v2 hasBeenDismissedSinceKeybagLock] ^ 1;

  return v3;
}

- (BOOL)tapToWakeEnabled
{
  uint64_t v2 = +[SBLockScreenManager sharedInstance];
  char v3 = [v2 shouldTapToWake];

  return v3;
}

- (id)createUnlockRequest
{
  uint64_t v2 = objc_alloc_init(CSConcreteUnlockRequest);
  return v2;
}

- (id)createUnlockRequestForActionContext:(id)a3
{
  id v3 = a3;
  double v4 = objc_alloc_init(CSConcreteUnlockRequest);
  -[CSConcreteUnlockRequest setSource:](v4, "setSource:", [v3 source]);
  -[CSConcreteUnlockRequest setIntent:](v4, "setIntent:", [v3 intent]);
  BOOL v5 = [v3 identifier];
  [(CSConcreteUnlockRequest *)v4 setName:v5];

  uint64_t v6 = [v3 confirmedNotInPocket];
  [(CSConcreteUnlockRequest *)v4 setConfirmedNotInPocket:v6];
  return v4;
}

- (void)unlockWithRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v10 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v10, "setSource:", [v6 source]);
  -[SBLockScreenUnlockRequest setIntent:](v10, "setIntent:", [v6 intent]);
  id v7 = [v6 name];
  [(SBLockScreenUnlockRequest *)v10 setName:v7];

  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v10, "setWantsBiometricPresentation:", [v6 wantsBiometricPresentation]);
  uint64_t v8 = [v6 confirmedNotInPocket];

  [(SBLockScreenUnlockRequest *)v10 setConfirmedNotInPocket:v8];
  id v9 = +[SBLockScreenManager sharedInstance];
  [v9 unlockWithRequest:v10 completion:v5];
}

- (BOOL)isLogoutSupported
{
  uint64_t v2 = [(id)SBApp userSessionController];
  char v3 = [v2 canLogout];

  return v3;
}

- (void)logout
{
  uint64_t v2 = objc_opt_new();
  int v3 = [v2 isCurrentUserAnonymous];

  if (v3)
  {
    id v5 = (id)objc_opt_new();
    [v5 setLogoutActionHandler:&__block_literal_global_205];
    double v4 = +[SBAlertItemsController sharedInstance];
    [v4 activateAlertItem:v5];
  }
  else
  {
    id v5 = [(id)SBApp userSessionController];
    [v5 logout];
  }
}

void __36__SBDefaultCoverSheetContext_logout__block_invoke()
{
  id v0 = [(id)SBApp userSessionController];
  [v0 logout];
}

- (void)incrementIrisPlayCount
{
}

- (BOOL)wantsHomeScreenOverlay
{
  return 1;
}

- (id)newOverlayController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = +[SBIconController sharedInstance];
    id v6 = [v5 iconManager];
    id v7 = [v6 listLayoutProvider];
    uint64_t v8 = [SBHomeScreenOverlayController alloc];
    LOBYTE(v15) = 1;
    id v9 = [(SBHomeScreenOverlayController *)v8 initWithListLayoutProvider:v7 windowLevel:v4 windowScene:@"SBTraitsParticipantRoleCoverSheetHomeScreenOverlay" traitsRole:11 zStackParticipantIdentifier:106 screenEdgeSystemGestureType:107 indirectScreenEdgeSystemGestureType:*MEMORY[0x1E4F43CF8] scrunchSystemGestureType:108 secure:v15];
    uint64_t v10 = +[SBIconController sharedInstance];
    uint64_t v11 = [v10 coverSheetTodayViewController];

    [(SBHomeScreenOverlayController *)v9 setLeadingSidebarViewController:v11];
    long long v12 = [(SBHomeScreenOverlayController *)v9 viewController];
    [v11 setContainerViewController:v12];

    [v11 setDismissalDelegate:v9];
    [(SBHomeScreenOverlayController *)v9 addHomeScreenOverlayObserver:self];
    [(SBHomeScreenOverlayController *)v9 addHomeScreenOverlayObserver:v11];

    return v9;
  }
  else
  {
    long long v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"windowScene != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDefaultCoverSheetContext newOverlayController]();
    }
    [v14 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)dismissModalContentIfVisibleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [(SBDefaultCoverSheetContext *)self _todayViewControllerIfAvailable];
  int v5 = [v4 isSpotlightVisible];
  if (v5) {
    [v4 dismissSpotlightAnimated:v3];
  }

  return v5;
}

- (id)_todayViewControllerIfAvailable
{
  uint64_t v2 = +[SBIconController sharedInstance];
  BOOL v3 = [v2 coverSheetTodayViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  if (a6)
  {
    objc_msgSend(a3, "presentationProgress", a4, a5);
    if (a4 > 0.0 || v7 <= 0.0)
    {
      if (a4 <= 0.0 || v7 > 0.0) {
        return;
      }
      id v11 = +[SBIconController sharedInstance];
      uint64_t v8 = [v11 iconManager];
      id v9 = v8;
      uint64_t v10 = 0;
    }
    else
    {
      id v11 = +[SBIconController sharedInstance];
      uint64_t v8 = [v11 iconManager];
      id v9 = v8;
      uint64_t v10 = 1;
    }
    [v8 setOverlayCoverSheetTodayViewVisible:v10];
  }
}

- (id)applicationHosterForHostContextProvider:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    int v5 = [v3 hostedAppBundleIdentifier];
    id v6 = +[SBApplicationController sharedInstance];
    double v7 = [v6 applicationWithBundleIdentifier:v5];

    uint64_t v8 = [MEMORY[0x1E4F92490] specification];
    id v9 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v7 generatingNewSceneIfRequiredWithSpecification:v8];
    uint64_t v10 = [(SBDeviceApplicationScenePlaceholderContentContext *)[SBMutableDeviceApplicationScenePlaceholderContentContext alloc] initWithActivationSettings:v9];
    id v11 = [[SBDashBoardHostedAppViewController alloc] initWithApplicationSceneEntity:v9];
    [(SBDashBoardHostedAppViewController *)v11 setPlaceholderContentContext:v10];
    [(SBDashBoardHostedAppViewController *)v11 setHostContextProvider:v4];

    return v11;
  }
  else
  {
    id v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hostContextProvider != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDefaultCoverSheetContext applicationHosterForHostContextProvider:]();
    }
    [v13 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)applicationHosterForTraitsHostContextProvider:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    int v5 = [v3 hostedAppBundleIdentifier];
    id v6 = +[SBApplicationController sharedInstance];
    double v7 = [v6 applicationWithBundleIdentifier:v5];

    uint64_t v8 = [MEMORY[0x1E4F92490] specification];
    id v9 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v7 generatingNewSceneIfRequiredWithSpecification:v8];
    uint64_t v10 = [(SBDeviceApplicationScenePlaceholderContentContext *)[SBMutableDeviceApplicationScenePlaceholderContentContext alloc] initWithActivationSettings:v9];
    id v11 = [[SBDashBoardHostedAppViewController alloc] initWithApplicationSceneEntity:v9];
    [(SBDashBoardHostedAppViewController *)v11 setPlaceholderContentContext:v10];
    [(SBDashBoardHostedAppViewController *)v11 setHostContextProvider:v4];

    return v11;
  }
  else
  {
    id v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"hostContextProvider != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDefaultCoverSheetContext applicationHosterForTraitsHostContextProvider:]();
    }
    [v13 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)traitsAwareViewControllerForApplicationHoster:(id)a3 targetWindow:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [[SBDashBoardTraitsAwareAppHostingViewController alloc] initWithAppHosting:v6 targetWindow:v5];

  return v7;
}

- (void)registerView:(id)a3 delegate:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained;
    id v9 = [WeakRetained systemPointerInteractionManager];
    [v9 registerView:v11 delegate:v6];
  }
  else
  {
    uint64_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"windowScene != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDefaultCoverSheetContext registerView:delegate:]();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)unregisterView:(id)a3
{
  p_sbWindowScene = &self->_sbWindowScene;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sbWindowScene);
  id v5 = [WeakRetained systemPointerInteractionManager];
  [v5 unregisterView:v4];
}

- (void)addProximitySensorProviderObserver:(id)a3
{
}

- (void)removeProximitySensorProviderObserver:(id)a3
{
}

- (id)requestProximityMode:(int)a3 forReason:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = (void *)SBApp;
  id v6 = a4;
  double v7 = [v5 HIDUISensorController];
  uint64_t v8 = [v7 requestProximityMode:v4 forReason:v6];

  return v8;
}

- (int64_t)rawDeviceOrientationIgnoringOrientationLocks
{
  return [(id)SBApp rawDeviceOrientationIgnoringOrientationLocks];
}

- (BOOL)isSystemAssistantExperienceAvailable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  id v3 = [WeakRetained assistantController];
  char v4 = [v3 isSystemAssistantExperienceAvailable];

  return v4;
}

- (BOOL)isSystemAssistantExperienceEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  id v3 = [WeakRetained assistantController];
  char v4 = [v3 isSystemAssistantExperienceEnabled];

  return v4;
}

- (BOOL)isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  id v3 = [WeakRetained assistantController];
  char v4 = [v3 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  return v4;
}

- (void)addAssistantControllerObserver:(id)a3
{
  id v4 = a3;
  assistantControllerObservers = self->_assistantControllerObservers;
  id v10 = v4;
  if (!assistantControllerObservers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v7 = self->_assistantControllerObservers;
    self->_assistantControllerObservers = v6;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    id v9 = [WeakRetained assistantController];
    [v9 addObserver:self];

    id v4 = v10;
    assistantControllerObservers = self->_assistantControllerObservers;
  }
  [(NSHashTable *)assistantControllerObservers addObject:v4];
}

- (void)removeAssistantControllerObserver:(id)a3
{
  [(NSHashTable *)self->_assistantControllerObservers removeObject:a3];
  if (![(NSHashTable *)self->_assistantControllerObservers count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    id v5 = [WeakRetained assistantController];
    [v5 removeObserver:self];

    assistantControllerObservers = self->_assistantControllerObservers;
    self->_assistantControllerObservers = 0;
  }
}

- (id)inhibitCaptureButtonActionAssertionWithReason:(id)a3
{
  id v3 = (void *)SBApp;
  id v4 = a3;
  id v5 = [v3 captureButtonRestrictionCoordinator];
  id v6 = [v5 inhibitCaptureButtonActionAssertionWithReason:v4];

  return v6;
}

- (void)assistantDidChangeSystemAssistantExperienceEnablement:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_assistantControllerObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "assistantDidChangeSystemAssistantExperienceEnablement:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_assistantControllerObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_assistantControllerObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (SBFAuthenticationAssertionProviding)authenticationAssertionProvider
{
  return self->_authenticationAssertionProvider;
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (SBFPasscodeFieldChangeObserver)passcodeFieldChangeObserver
{
  return self->_passcodeFieldChangeObserver;
}

- (SBFDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (SBFLockOutStatusProvider)lockOutStatusProvider
{
  return self->_lockOutStatusProvider;
}

- (CSLegibilityProviding)legibilityProvider
{
  return self->_legibilityProvider;
}

- (CSPowerStatusProviding)powerStatusProvider
{
  return self->_powerStatusProvider;
}

- (NSString)powerStatusChangeNotificationName
{
  return self->_powerStatusChangeNotificationName;
}

- (CSMagSafeAccessoryStatusProviding)accessoryStatusProvider
{
  return self->_accessoryStatusProvider;
}

- (NSString)accessoryAttachedNotificationName
{
  return self->_accessoryAttachedNotificationName;
}

- (NSString)accessoryDetachedNotificationName
{
  return self->_accessoryDetachedNotificationName;
}

- (NSString)accessoryAnimationStatusChangedNotificationName
{
  return self->_accessoryAnimationStatusChangedNotificationName;
}

- (CSThermalStatusProviding)thermalStatusProvider
{
  return self->_thermalStatusProvider;
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (CSScreenStateProviding)screenStateProvider
{
  return self->_screenStateProvider;
}

- (SBFScreenWakeAnimationControlling)screenWakeAnimationController
{
  return self->_screenWakeAnimationController;
}

- (CSHomeAffordanceControlling)homeAffordanceController
{
  return self->_homeAffordanceController;
}

- (CSModalHomeAffordanceControlling)modalHomeAffordanceController
{
  return self->_modalHomeAffordanceController;
}

- (CSPlatterHomeGestureManaging)platterHomeGestureManager
{
  return self->_platterHomeGestureManager;
}

- (CSStatusBarControlling)statusBarController
{
  return self->_statusBarController;
}

- (CSWallpaperProviding)wallpaperProvider
{
  return self->_wallpaperProvider;
}

- (CSWallpaperSnapshotUpdating)wallpaperSnapshotUpdater
{
  return self->_wallpaperSnapshotUpdater;
}

- (SBFActionProviding)contentActionProvider
{
  return self->_contentActionProvider;
}

- (CSApplicationInforming)applicationInformer
{
  return self->_applicationInformer;
}

- (BOOL)isObjectInProximity
{
  return self->_objectInProximity;
}

- (SBFHomeAffordanceInteractionProviding)homeAffordanceInteractionProvider
{
  return self->_homeAffordanceInteractionProvider;
}

- (SBWindowScene)_sbWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_homeAffordanceInteractionProvider, 0);
  objc_storeStrong((id *)&self->_applicationInformer, 0);
  objc_storeStrong((id *)&self->_contentActionProvider, 0);
  objc_storeStrong((id *)&self->_wallpaperSnapshotUpdater, 0);
  objc_storeStrong((id *)&self->_wallpaperProvider, 0);
  objc_storeStrong((id *)&self->_statusBarController, 0);
  objc_storeStrong((id *)&self->_platterHomeGestureManager, 0);
  objc_storeStrong((id *)&self->_modalHomeAffordanceController, 0);
  objc_storeStrong((id *)&self->_homeAffordanceController, 0);
  objc_storeStrong((id *)&self->_screenWakeAnimationController, 0);
  objc_storeStrong((id *)&self->_screenStateProvider, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_thermalStatusProvider, 0);
  objc_storeStrong((id *)&self->_accessoryAnimationStatusChangedNotificationName, 0);
  objc_storeStrong((id *)&self->_accessoryDetachedNotificationName, 0);
  objc_storeStrong((id *)&self->_accessoryAttachedNotificationName, 0);
  objc_storeStrong((id *)&self->_accessoryStatusProvider, 0);
  objc_storeStrong((id *)&self->_powerStatusChangeNotificationName, 0);
  objc_storeStrong((id *)&self->_powerStatusProvider, 0);
  objc_storeStrong((id *)&self->_legibilityProvider, 0);
  objc_storeStrong((id *)&self->_lockOutStatusProvider, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_passcodeFieldChangeObserver, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_authenticationAssertionProvider, 0);
  objc_storeStrong((id *)&self->_assistantControllerObservers, 0);
  objc_storeStrong((id *)&self->_proximitySensorProviderObservers, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_notificationPresenter, 0);
  objc_storeStrong((id *)&self->_wallpaperAggdLogger, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
}

- (void)newOverlayController
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)applicationHosterForHostContextProvider:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)applicationHosterForTraitsHostContextProvider:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)registerView:delegate:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end