@interface SBLockScreenManager
+ (SBLockScreenManager)sharedInstance;
+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3;
+ (id)sharedInstanceIfExists;
- (BOOL)_attemptUnlockWithPasscode:(id)a3 finishUIUnlock:(BOOL)a4;
- (BOOL)_attemptUnlockWithPasscode:(id)a3 mesa:(BOOL)a4 finishUIUnlock:(BOOL)a5;
- (BOOL)_attemptUnlockWithPasscode:(id)a3 mesa:(BOOL)a4 finishUIUnlock:(BOOL)a5 completion:(id)a6;
- (BOOL)_canAttemptRealUIUnlockIgnoringBacklightNonsenseWithReason:(id *)a3;
- (BOOL)_canHandleTransitionRequest:(id)a3;
- (BOOL)_finishUIUnlockFromSource:(int)a3 withOptions:(id)a4;
- (BOOL)_finishUIUnlockFromSource:(int)a3 withOptions:(id)a4 completion:(id)a5;
- (BOOL)_hasValidLockElementSuppressionAssertion;
- (BOOL)_isPasscodeVisible;
- (BOOL)_isUnlockDisabled;
- (BOOL)_lockUI;
- (BOOL)_needsBiometricAuthenticationToExitLostMode;
- (BOOL)_requiresEmptyLockElementForBacklightState:(int64_t)a3;
- (BOOL)_setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4;
- (BOOL)_shouldBeInSetupMode;
- (BOOL)_shouldBeShowingLockElement;
- (BOOL)_shouldBeShowingLockElementForBacklightState:(int64_t)a3;
- (BOOL)_shouldBloomForAnyReason;
- (BOOL)_shouldDisconnectCallWhenLockingForActiveAudioRoute;
- (BOOL)_shouldEmulateInterstitialPresentationForAccessibility:(BOOL)a3;
- (BOOL)_shouldHideLockForElementSuppressionAssertion;
- (BOOL)_shouldLockAfterEndingFaceTimeCall;
- (BOOL)_shouldLockAfterEndingTelephonyCall;
- (BOOL)_shouldPlayLockSound;
- (BOOL)_shouldReactivateInCallWakingTheDisplay:(BOOL)a3;
- (BOOL)_shouldUnlockUIOnKeyDownEvent;
- (BOOL)_shouldWakeToInCallForUnlockSource:(int)a3 wakingTheDisplay:(BOOL)a4;
- (BOOL)_shouldWakeToOtherContentForUnlockSource:(int)a3 wakingTheDisplay:(BOOL)a4 stopAfterWakeTo:(BOOL)a5;
- (BOOL)_specifiesTransientPresentationForMode:(int64_t)a3;
- (BOOL)_unlockWithRequest:(id)a3 cancelPendingRequests:(BOOL)a4 completion:(id)a5;
- (BOOL)bioAuthenticatedWhileMenuButtonDown;
- (BOOL)biometricAuthenticationCoordinator:(id)a3 requestsAuthenticationFeedback:(id)a4;
- (BOOL)biometricAuthenticationCoordinator:(id)a3 requestsUnlockWithIntent:(int)a4;
- (BOOL)biometricAuthenticationCoordinatorShouldWaitToInvalidateMatchingAssertion:(id)a3;
- (BOOL)coverSheetViewControllerHasBeenDismissedSinceKeybagLock:(id)a3;
- (BOOL)coverSheetViewControllerHasSecureApp:(id)a3;
- (BOOL)coverSheetViewControllerIsShowingSecureApp:(id)a3;
- (BOOL)coverSheetViewControllerShouldPreserveOrientationForExternalTransition:(id)a3;
- (BOOL)coverSheetViewControllerTraitsArbiterOrientationActuationEnabled:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)handleKeyHIDEvent:(__IOHIDEvent *)a3;
- (BOOL)handleTransitionRequest:(id)a3;
- (BOOL)handlesHomeButtonSinglePresses;
- (BOOL)hasUIEverBeenLocked;
- (BOOL)hasWakeToContentForInactiveDisplay;
- (BOOL)isInLostMode;
- (BOOL)isLockScreenActive;
- (BOOL)isLockScreenDisabledForAssertion;
- (BOOL)isLockScreenPresentationPending;
- (BOOL)isLockScreenVisible;
- (BOOL)isPasscodeEntryTransientOverlayVisible;
- (BOOL)isSupressingLockButton;
- (BOOL)isUILocked;
- (BOOL)isUIUnlocking;
- (BOOL)isWaitingToLockUI;
- (BOOL)passcodeEntryTransientOverlayViewController:(id)a3 authenticatePasscode:(id)a4;
- (BOOL)passcodeEntryTransientOverlayViewControllerDidDetectBottomFaceOcclusionsSinceScreenOn:(id)a3;
- (BOOL)passcodeEntryTransientOverlayViewControllerDidDetectFaceOcclusionsSinceScreenOn:(id)a3;
- (BOOL)playLockSoundIfPermitted;
- (BOOL)shouldLockUIAfterEndingCall;
- (BOOL)shouldTapToWake;
- (BOOL)unlockUIFromSource:(int)a3 withOptions:(id)a4;
- (BOOL)unlockWithRequest:(id)a3 completion:(id)a4;
- (BOOL)wouldAttemptToHandleATransitionRequest;
- (CSCoverSheetViewController)coverSheetViewController;
- (NSString)description;
- (SBFLockOutStatusProvider)_lockOutController;
- (SBFUserAuthenticationController)_userAuthController;
- (SBLiftToWakeManager)_liftToWakeManager;
- (SBLockScreenEnvironment)lockScreenEnvironment;
- (SBLockScreenManager)init;
- (SBLockScreenOrientationManager)lockScreenOrientationManager;
- (SBMotionDetectionWakeController)_motionDetectionWakeController;
- (SBNotificationDestination)notificationDestination;
- (SBTapToWakeController)_tapToWakeController;
- (double)contrastForCurrentWallpaper;
- (id)_hostingWindowScene;
- (id)_newLockScreenEnvironment;
- (id)_statusBarLayoutManager;
- (id)acquireLockScreenPresentationPendingAssertionWithReason:(id)a3;
- (id)acquireMotionDetectionWakeEnableAssertionWithReason:(id)a3;
- (id)acquireSystemApertureLockElementBloomSuppressionAssertionWithReason:(id)a3;
- (id)acquireSystemApertureLockElementSuppressionAssertionWithReason:(id)a3;
- (id)averageColorForCurrentWallpaper;
- (id)averageColorForCurrentWallpaperInScreenRect:(CGRect)a3;
- (id)biometricAuthenticationCoordinator;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5;
- (id)newLegibilitySettingsProvider;
- (id)passcodeEntryTransientOverlayViewControllerStatusSubtitleText;
- (id)passcodeEntryTransientOverlayViewControllerStatusText;
- (id)rootViewController;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)unlockActionBlock;
- (void)_activateLockScreenAnimated:(BOOL)a3 animationProvider:(id)a4 automatically:(BOOL)a5 inScreenOffMode:(BOOL)a6 dismissNotificationCenter:(BOOL)a7 completion:(id)a8;
- (void)_authenticationStateChanged:(id)a3;
- (void)_cleanupSystemApertureLockElementIfNecessaryWithReason:(id)a3;
- (void)_cleanupSystemApertureLockElementIgnoringDelays:(BOOL)a3 reason:(id)a4;
- (void)_clearAuthenticationLockAssertion;
- (void)_createAuthenticationAssertion;
- (void)_deviceBlockedChanged:(id)a3;
- (void)_disconnectActiveCallIfNeededFromSource:(int)a3;
- (void)_dismissLockScreenForAuthenticationIfNecessary;
- (void)_dismissLostModeBiometricAuthenticationTransientOverlay;
- (void)_emulateInterstitialPasscodePresentationForAccessibility:(BOOL)a3;
- (void)_evaluatePreArmDisabledAssertions;
- (void)_evaluateWallpaperMode;
- (void)_handleAuthenticationFeedback:(id)a3;
- (void)_handleBacklightDidTurnOff:(id)a3;
- (void)_handleBacklightLevelWillChange:(id)a3;
- (void)_lockFeaturesForRemoteLock:(BOOL)a3;
- (void)_lockScreenDimmed:(id)a3;
- (void)_lockStateObservers;
- (void)_maybeLaunchSetupForcingCheckIfNotBricked:(BOOL)a3;
- (void)_noteBootCompleted;
- (void)_noteStartupTransitionDidBegin;
- (void)_noteStartupTransitionWillBegin;
- (void)_postLockCompletedNotification:(BOOL)a3;
- (void)_prepareWallpaperForInteractiveMode;
- (void)_prepareWallpaperForStaticMode;
- (void)_presentLostModeBiometricAuthenticationTransientOverlay;
- (void)_reallySetUILocked:(BOOL)a3;
- (void)_reevaluateSystemApertureLockElementSuppressionWithReason:(id)a3;
- (void)_relockUIForButtonlikeSource:(int)a3;
- (void)_relockUIForLostMode;
- (void)_resetOrRestoreStateChanged:(id)a3;
- (void)_runPreflightLocationBasedEvaluationToExitLostModeIfNecessary;
- (void)_runUnlockActionBlock:(BOOL)a3;
- (void)_sendUILockStateChangedNotification;
- (void)_setHomeButtonShowPasscodeRecognizer:(id)a3;
- (void)_setHomeButtonSuppressAfterUnlockRecognizer:(id)a3;
- (void)_setIdleTimerCoordinator:(id)a3;
- (void)_setLiftToWakeManager:(id)a3;
- (void)_setLockOutController:(id)a3;
- (void)_setMesaAutoUnlockingDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_setMesaCoordinatorDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_setMesaUnlockingDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_setMotionDetectionWakeController:(id)a3;
- (void)_setSystemApertureProudLockElementVisible:(BOOL)a3 backlightState:(int64_t)a4 withReason:(id)a5;
- (void)_setSystemApertureProudLockElementVisible:(BOOL)a3 withReason:(id)a4;
- (void)_setSystemApertureProudLockElementVisible:(BOOL)a3 withReason:(id)a4 afterDelay:(double)a5;
- (void)_setTapToWakeController:(id)a3;
- (void)_setUILocked:(BOOL)a3;
- (void)_setUserAuthController:(id)a3;
- (void)_setWalletPreArmDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_showSystemApertureProudLockElementForBacklightState:(int64_t)a3 WithReason:(id)a4;
- (void)_showSystemApertureProudLockElementIfSupportedWithReason:(id)a3;
- (void)_unlockStateObservers;
- (void)_updateBloomIfNeeded;
- (void)_wakeScreenForMouseButtonDown:(id)a3;
- (void)_wakeScreenForTapToWake;
- (void)activateLostModeForRemoteLock:(BOOL)a3;
- (void)activationChanged:(id)a3;
- (void)addLockScreenDisableAssertion:(id)a3;
- (void)addLockStateObserver:(id)a3;
- (void)attemptUnlockWithMesa;
- (void)attemptUnlockWithPasscode:(id)a3;
- (void)attemptUnlockWithPasscode:(id)a3 finishUIUnlock:(BOOL)a4 completion:(id)a5;
- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)backlightController:(id)a3 didUpdateDigitizerDisabled:(BOOL)a4 tapToWakeEnabled:(BOOL)a5;
- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5;
- (void)biometricAuthenticationCoordinator:(id)a3 handleIdentityMatchSuccess:(BOOL)a4;
- (void)coverSheetPresentationManager:(id)a3 unlockWithRequest:(id)a4 completion:(id)a5;
- (void)coverSheetViewController:(id)a3 requestsPreArmDisabled:(BOOL)a4 forReason:(id)a5;
- (void)coverSheetViewController:(id)a3 requestsTouchIDDisabled:(BOOL)a4 forReason:(id)a5;
- (void)coverSheetViewController:(id)a3 requestsTransientOverlaysDismissedAnimated:(BOOL)a4;
- (void)coverSheetViewController:(id)a3 setMesaUnlockingDisabled:(BOOL)a4 forReason:(id)a5;
- (void)coverSheetViewController:(id)a3 startSpotlightInteractiveGestureTransactionForGesture:(id)a4;
- (void)coverSheetViewController:(id)a3 unlockWithRequest:(id)a4 completion:(id)a5;
- (void)coverSheetViewControllerDidDismissInlinePasscode:(id)a3;
- (void)coverSheetViewControllerHandleUnlockAttemptSucceeded:(id)a3;
- (void)coverSheetViewControllerIrisPlayingDidFinish:(id)a3;
- (void)coverSheetViewControllerShouldDismissContextMenu:(id)a3;
- (void)coverSheetViewControllerWillPresentInlinePasscode:(id)a3;
- (void)coverSheetWindowedAccessoryViewControllerDidDismiss:(id)a3;
- (void)coverSheetWindowedAccessoryViewControllerDidPresent:(id)a3;
- (void)enableLostModePlugin;
- (void)exitLostModeIfNecessaryFromRemoteRequest:(BOOL)a3;
- (void)extendedKeybagLockStateChanged:(BOOL)a3;
- (void)hideDimmingLayerDidChange:(BOOL)a3;
- (void)homeButtonShowPasscodeRecognizerDidFailToRecognize:(id)a3;
- (void)homeButtonShowPasscodeRecognizerRequestsPasscodeUIToBeShown:(id)a3;
- (void)homeButtonSuppressAfterUnlockRecognizerRequestsEndOfSuppression:(id)a3;
- (void)loadViewsIfNeeded;
- (void)lockScreenViewControllerDidDismiss;
- (void)lockScreenViewControllerDidPresent;
- (void)lockScreenViewControllerRequestsUnlock;
- (void)lockScreenViewControllerWillDismiss;
- (void)lockScreenViewControllerWillPresent;
- (void)lockUIFromSource:(int)a3 withOptions:(id)a4;
- (void)lockUIFromSource:(int)a3 withOptions:(id)a4 completion:(id)a5;
- (void)lostModeBiometricAuthenticationViewControllerDidSucceedAuthentication:(id)a3;
- (void)lostModeBiometricAuthenticationViewControllerDidTapEmergencyButton:(id)a3;
- (void)migrateNotificationsToHistory;
- (void)motionDetectionWakeController:(id)a3 motionDetectStateChanged:(BOOL)a4;
- (void)noteContinuityDisplayWindowSceneConnectionDidChange;
- (void)noteMenuButtonDoublePress;
- (void)noteMenuButtonSinglePress;
- (void)passcodeEntryTransientOverlayViewControllerDidDisappear:(id)a3;
- (void)passcodeEntryTransientOverlayViewControllerRequestsDismissal:(id)a3;
- (void)passcodeEntryTransientOverlayViewControllerRequestsEmergencyCall:(id)a3;
- (void)reevaluateSystemApertureLockElementSuppressionWithReason:(id)a3;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteLock:(BOOL)a3;
- (void)removeLockScreenDisableAssertion:(id)a3;
- (void)removeLockStateObserver:(id)a3;
- (void)requestUserAttentionScreenWakeFromSource:(int)a3 reason:(id)a4;
- (void)setBiometricAutoUnlockingDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setUIUnlocking:(BOOL)a3;
- (void)setUnlockActionBlock:(id)a3;
- (void)tapToWakeControllerDidRecognizePencilWakeGesture:(id)a3;
- (void)updateSpringBoardStatusBarForLockScreenTeardown;
- (void)wallpaperDidChangeForVariant:(int64_t)a3;
@end

@implementation SBLockScreenManager

+ (SBLockScreenManager)sharedInstance
{
  return (SBLockScreenManager *)[a1 _sharedInstanceCreateIfNeeded:1];
}

+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3
{
  if (a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__SBLockScreenManager__sharedInstanceCreateIfNeeded___block_invoke;
    v5[3] = &__block_descriptor_48_e5_v8__0l;
    v5[4] = a2;
    v5[5] = a1;
    if (_sharedInstanceCreateIfNeeded__onceToken_1 != -1) {
      dispatch_once(&_sharedInstanceCreateIfNeeded__onceToken_1, v5);
    }
  }
  v3 = (void *)_sharedInstanceCreateIfNeeded____manager;
  return v3;
}

+ (id)sharedInstanceIfExists
{
  return (id)[a1 _sharedInstanceCreateIfNeeded:0];
}

- (BOOL)isUILocked
{
  return self->_isUILocked;
}

- (BOOL)isUIUnlocking
{
  return self->_uiUnlocking;
}

- (BOOL)handleTransitionRequest:(id)a3
{
  id v4 = a3;
  if (![(SBLockScreenManager *)self willAttemptToHandleTransitionRequest:v4]) {
    goto LABEL_13;
  }
  int v5 = [(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated];
  v6 = [v4 applicationContext];
  v7 = [v6 applicationSceneEntities];
  char v8 = objc_msgSend(v7, "bs_containsObjectPassingTest:", &__block_literal_global_414);

  if (!v5 || (v8 & 1) == 0)
  {
    v9 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment applicationLauncher];
    int v10 = [v9 handleTransitionRequest:v4];

    if (v10)
    {
      v11 = +[SBWorkspace mainWorkspace];
      BOOL v12 = 1;
      [v11 dismissAllTransientOverlayPresentationsAnimated:1];

      goto LABEL_14;
    }
  }
  if (![(SBLockScreenManager *)self _canHandleTransitionRequest:v4])
  {
LABEL_13:
    BOOL v12 = 0;
    goto LABEL_14;
  }
  v13 = [(SBLockScreenManager *)self coverSheetViewController];
  int v14 = [v13 externalLockProvidersRequireUnlock];

  if (!v14)
  {
    v16 = [v4 displayIdentity];
    int v17 = [v16 isMainDisplay];

    if (v17) {
      [v4 setTransactionProvider:&__block_literal_global_223_0];
    }
    goto LABEL_13;
  }
  v15 = SBLogCommon();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[SBLockScreenManager handleTransitionRequest:](v15);
  }

  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)wouldAttemptToHandleATransitionRequest
{
  BOOL v3 = [(SBLockScreenManager *)self isUILocked];
  LOBYTE(v4) = 0;
  if ([(SBLockScreenManager *)self isLockScreenActive] && !v3)
  {
    int v5 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
    int v4 = [v5 isAnyGestureActivelyRecognized] ^ 1;
  }
  if (v3)
  {
    char v6 = 0;
  }
  else
  {
    v7 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
    char v6 = [v7 isAnyGestureActivelyRecognized];
  }
  BOOL v8 = self->_handlingUnlockRequest && [(SBLockScreenManager *)self isUIUnlocking];
  if ((v3 | v4)) {
    return 1;
  }
  else {
    return v8 | v6;
  }
}

- (BOOL)isLockScreenActive
{
  v2 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  BOOL v3 = [v2 _appearState] == 2 || objc_msgSend(v2, "_appearState") == 1;

  return v3;
}

- (id)rootViewController
{
  if (a1)
  {
    a1 = [a1[4] rootViewController];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)_unlockWithRequest:(id)a3 cancelPendingRequests:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = v9;
  NSClassFromString(&cfstr_Sblockscreenun_0.isa);
  if (!v11)
  {
    v65 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenManager _unlockWithRequest:cancelPendingRequests:completion:](a2);
    }
    [v65 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86DB644);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v66 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:SBLockScreenUnlockRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBLockScreenManager _unlockWithRequest:cancelPendingRequests:completion:](a2);
    }
    [v66 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86DB6A8);
  }

  BOOL v12 = [v11 windowScene];
  v13 = [v12 authenticationStatusProvider];
  userAuthController = v13;
  if (!v13) {
    userAuthController = self->_userAuthController;
  }
  v71 = (void (**)(void, void))v10;
  v15 = userAuthController;

  uint64_t v16 = [v11 source];
  uint64_t v17 = [v11 intent];
  int v18 = [(SBFUserAuthenticationController *)v15 isAuthenticated];
  if (v6)
  {
    [(SBLockScreenManager *)self _runUnlockActionBlock:0];
  }
  else if (self->_unlockRequest)
  {
    v19 = +[SBSecureAppManager sharedInstance];
    char v20 = [v19 hasSecureApp];

    if ((v20 & 1) == 0)
    {
      v38 = SBLogCommon();
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
        goto LABEL_45;
      }
      *(_WORD *)buf = 0;
      v39 = "[Unlock Request] Previous request in place and cancellation not requested. Failing.";
      goto LABEL_44;
    }
  }
  v21 = v15;
  char v22 = [v12 isContinuityDisplayWindowScene];
  v23 = +[SBBacklightController sharedInstance];
  char v24 = [v23 screenIsOn];

  if ((v24 & 1) == 0 && (v22 & 1) == 0)
  {
    v25 = SBLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v86 = v11;
      _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_INFO, "[Unlock Request] Turning screen on for unlock request: %@", buf, 0xCu);
    }

    v83 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
    uint64_t v26 = MEMORY[0x1E4F1CC38];
    uint64_t v84 = MEMORY[0x1E4F1CC38];
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
    if ((v17 & 0xFFFFFFFE) == 2) {
      char v28 = v18;
    }
    else {
      char v28 = 1;
    }
    if (v28)
    {
      if ([v12 isContinuityDisplayWindowScene])
      {
        v81 = @"SBUIUnlockOptionsNoBacklightChangesKey";
        uint64_t v82 = v26;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];

        v27 = (void *)v29;
      }
    }
    else
    {
      [(SBLockScreenManager *)self setPasscodeVisible:1 animated:0];
    }
    [(SBLockScreenManager *)self unlockUIFromSource:v16 withOptions:v27];
  }
  if (!v16 || !v17)
  {
    v31 = SBLogCommon();
    v15 = v21;
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v32 = "[Unlock Request] Request had no source, or didn't want to actually unlock. Succeeding.";
    goto LABEL_31;
  }
  if (v17 == 2) {
    int v30 = v18;
  }
  else {
    int v30 = 0;
  }
  v15 = v21;
  if (v30 == 1)
  {
    v31 = SBLogCommon();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    v32 = "[Unlock Request] AuthenticateOnly specified, and we are authenticated. Succeeding.";
    goto LABEL_31;
  }
  if (v17 == 1) {
    char v34 = v18;
  }
  else {
    char v34 = 1;
  }
  if ((v34 & 1) == 0)
  {
    v38 = SBLogCommon();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_INFO)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    v39 = "[Unlock Request] DismissOnly specified, but we are not authenticated. Failing.";
LABEL_44:
    _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_INFO, v39, buf, 2u);
LABEL_45:

    v33 = v71;
    if (v71) {
      v71[2](v71, 0);
    }
    goto LABEL_47;
  }
  v35 = [v12 uiLockStateProvider];
  if (v35)
  {
    v36 = [v12 uiLockStateProvider];
    int v37 = [v36 isUILocked];

    v15 = v21;
  }
  else
  {
    int v37 = [(SBLockScreenManager *)self isUILocked];
  }

  if ((v17 | 2) != 3) {
    goto LABEL_59;
  }
  if ((v18 ^ 1 | v37))
  {
    if ((v17 | 2) == 3)
    {
      id v80 = 0;
      BOOL v42 = [(SBLockScreenManager *)self _canAttemptRealUIUnlockIgnoringBacklightNonsenseWithReason:&v80];
      id v43 = v80;
      if (!v42)
      {
        v44 = SBLogCommon();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v86 = v43;
          _os_log_impl(&dword_1D85BA000, v44, OS_LOG_TYPE_INFO, "[Unlock Request] Request to dismiss failed with reason: \"%@\". Failing.", buf, 0xCu);
        }

        v15 = v21;
        v33 = v71;
        if (v71) {
          v71[2](v71, 0);
        }
        BOOL v40 = 0;
LABEL_80:

        goto LABEL_48;
      }
LABEL_60:
      v45 = (void *)MEMORY[0x1E4F4F6B8];
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke;
      v78[3] = &unk_1E6B0B2D0;
      v79 = v71;
      v69 = [v45 sentinelWithQueue:MEMORY[0x1E4F14428] signalHandler:v78];
      v46 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment customActionStore];
      v47 = [v46 _customLockScreenActionContext];

      id v70 = v43;
      if (v47)
      {
        id v48 = 0;
        v15 = v21;
        v33 = v71;
        v49 = v69;
LABEL_72:
        v56 = (SBLockScreenUnlockRequest *)[v11 copy];
        unlockRequest = self->_unlockRequest;
        self->_unlockRequest = v56;

        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke_380;
        v72[3] = &unk_1E6AF5860;
        id v58 = v49;
        id v73 = v58;
        id v59 = v46;
        id v74 = v59;
        id v60 = v48;
        id v75 = v60;
        v61 = (void *)[v72 copy];
        id unlockActionBlock = self->_unlockActionBlock;
        self->_id unlockActionBlock = v61;

        self->_handlingUnlockRequest = 1;
        v63 = SBLogCommon();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v63, OS_LOG_TYPE_INFO, "[Unlock Request] Attempting real UIUnlock...", buf, 2u);
        }

        self->_saveUnlockRequest = 0;
        BOOL v40 = [(SBLockScreenManager *)self unlockUIFromSource:v16 withOptions:0];
        if (!v40)
        {
          self->_handlingUnlockRequest = 0;
          v64 = SBLogCommon();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v64, OS_LOG_TYPE_INFO, "[Unlock Request] Attempted UIUnlock failed :(", buf, 2u);
          }

          if (!self->_saveUnlockRequest) {
            [(SBLockScreenManager *)self _runUnlockActionBlock:0];
          }
        }

        id v43 = v70;
        goto LABEL_80;
      }
      v67 = v46;
      id v48 = objc_alloc_init(MEMORY[0x1E4FA5FA0]);
      v50 = [v11 name];
      [v48 setIdentifier:v50];

      [v48 setIntent:v17];
      [v48 setSource:v16];
      objc_msgSend(v48, "setWantsBiometricPresentation:", objc_msgSend(v11, "wantsBiometricPresentation"));
      objc_msgSend(v48, "setConfirmedNotInPocket:", objc_msgSend(v11, "confirmedNotInPocket"));
      v51 = [v11 destinationApplication];
      v52 = [v11 unlockDestination];

      v68 = v51;
      if (v52)
      {
        uint64_t v53 = [v11 unlockDestination];
      }
      else
      {
        if (!v51)
        {
          v54 = 0;
          goto LABEL_69;
        }
        uint64_t v53 = [v51 displayName];
      }
      v54 = (void *)v53;
LABEL_69:
      v15 = v21;
      [v48 setUnlockDestination:v54];
      BOOL v55 = v17 == 2;
      v33 = v71;
      v49 = v69;
      if (!v55)
      {
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke_2;
        v76[3] = &unk_1E6AF4AC0;
        id v77 = v69;
        [v48 setAction:v76];
      }
      v46 = v67;
      [v67 setCustomLockScreenActionContext:v48];

      goto LABEL_72;
    }
LABEL_59:
    id v43 = 0;
    goto LABEL_60;
  }
  v31 = SBLogCommon();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v32 = "[Unlock Request] Dismiss specified, and we are already UI-unlocked. Succeeding.";
LABEL_31:
    _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_INFO, v32, buf, 2u);
  }
LABEL_32:

  v33 = v71;
  if (v71) {
    v71[2](v71, 1);
  }
LABEL_47:
  BOOL v40 = 0;
LABEL_48:

  return v40;
}

- (void)_runUnlockActionBlock:(BOOL)a3
{
  BOOL v3 = a3;
  unlockRequest = self->_unlockRequest;
  if (unlockRequest)
  {
    self->_unlockRequest = 0;

    int v6 = _runUnlockActionBlock__token;
    v7 = (const char **)MEMORY[0x1E4FA7928];
    if (_runUnlockActionBlock__token != -1
      || (notify_register_check((const char *)*MEMORY[0x1E4FA7928], &_runUnlockActionBlock__token),
          int v6 = _runUnlockActionBlock__token,
          _runUnlockActionBlock__token != -1))
    {
      notify_set_state(v6, [(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated]);
      notify_post(*v7);
    }
  }
  BOOL v8 = (void (**)(id, BOOL))MEMORY[0x1D948C7A0](self->_unlockActionBlock, a2);
  if (v8)
  {
    id unlockActionBlock = self->_unlockActionBlock;
    self->_id unlockActionBlock = 0;
    id v10 = v8;

    v10[2](v10, v3);
    BOOL v8 = v10;
  }
}

- (CSCoverSheetViewController)coverSheetViewController
{
  v2 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (CSCoverSheetViewController *)v3;
}

- (BOOL)unlockWithRequest:(id)a3 completion:(id)a4
{
  return [(SBLockScreenManager *)self _unlockWithRequest:a3 cancelPendingRequests:1 completion:a4];
}

uint64_t __53__SBLockScreenManager__sharedInstanceCreateIfNeeded___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F42738] sharedApplication];

  if (!v2)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"SBLockScreenManager.m" lineNumber:371 description:@"Unexpectedly created SBLockScreenManager before UIApplication instance was created."];
  }
  kdebug_trace();
  id v3 = objc_alloc_init(SBLockScreenManager);
  int v4 = (void *)_sharedInstanceCreateIfNeeded____manager;
  _sharedInstanceCreateIfNeeded____manager = (uint64_t)v3;

  return kdebug_trace();
}

- (SBLockScreenManager)init
{
  v68.receiver = self;
  v68.super_class = (Class)SBLockScreenManager;
  v2 = [(SBLockScreenManager *)&v68 init];
  id v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_allowDisablePasscodeLockAssertion = 0;
    int v4 = [MEMORY[0x1E4FA7C68] sharedInstance];
    v63 = +[SBWalletPreArmController sharedInstance];
    int v5 = [[SBLockScreenBiometricAuthenticationCoordinator alloc] initWithBiometricResource:v4 walletPreArmController:v63];
    biometricAuthenticationCoordinator = v3->_biometricAuthenticationCoordinator;
    v3->_biometricAuthenticationCoordinator = v5;

    [(SBLockScreenBiometricAuthenticationCoordinator *)v3->_biometricAuthenticationCoordinator setDelegate:v3];
    v62 = (void *)[objc_alloc(MEMORY[0x1E4FA7CB8]) initWithBiometricResource:v4 overrideMatchingAssertionFactory:v3->_biometricAuthenticationCoordinator];
    objc_msgSend(MEMORY[0x1E4FA7CC0], "setPasscodeBiometricResource:");
    v7 = [[SBCoverSheetBiometricResourceObserver alloc] initWithBiometricResource:v4];
    biometricResourceObserver = v3->_biometricResourceObserver;
    v3->_biometricResourceObserver = v7;

    id v9 = [[SBPearlInterlockObserver alloc] initWithBiometricResource:v4];
    pearlInterlockObserver = v3->_pearlInterlockObserver;
    v3->_pearlInterlockObserver = v9;

    [(SBPearlInterlockObserver *)v3->_pearlInterlockObserver activate];
    id v11 = [MEMORY[0x1E4F61A48] sharedInstance];
    v3->_isInLostMode = [v11 lostModeIsActive];

    uint64_t v12 = [(SBLockScreenManager *)v3 _newLockScreenEnvironment];
    lockScreenEnvironment = v3->_lockScreenEnvironment;
    v3->_lockScreenEnvironment = (SBLockScreenEnvironment *)v12;

    int v14 = -[SBLockScreenManager rootViewController]((id *)&v3->super.isa);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v14 setDelegate:v3];
    }
    v61 = v14;
    v15 = [(SBLockScreenEnvironment *)v3->_lockScreenEnvironment screenWakeAnimationTarget];
    [v15 updateWakeEffectsForWake:0];

    if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0)
    {
      uint64_t v16 = objc_alloc_init(SBLockScreenOrientationManager);
      lockScreenOrientationManager = v3->_lockScreenOrientationManager;
      v3->_lockScreenOrientationManager = v16;
    }
    int v18 = v3->_biometricAuthenticationCoordinator;
    v19 = [(SBLockScreenEnvironment *)v3->_lockScreenEnvironment biometricUnlockBehavior];
    [(SBLockScreenBiometricAuthenticationCoordinator *)v18 _setAutoUnlockBehavior:v19];

    [(SBLockScreenManager *)v3 _reallySetUILocked:0];
    char v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v3 selector:sel_activationChanged_ name:@"SBLockdownDeviceActivatedChangedNotification" object:0];
    [v20 addObserver:v3 selector:sel__authenticationStateChanged_ name:*MEMORY[0x1E4FA6140] object:0];
    [v20 addObserver:v3 selector:sel__lockUI name:@"SBLockScreenExternalPartyWantsUILockNotification" object:0];
    [v20 addObserver:v3 selector:sel__deviceBlockedChanged_ name:*MEMORY[0x1E4FA60F0] object:0];
    [v20 addObserver:v3 selector:sel__resetOrRestoreStateChanged_ name:@"SBResetOrRestoreStateDidChangeNotification" object:0];
    [v20 addObserver:v3 selector:sel__lockScreenDimmed_ name:@"SBLockScreenDimmedNotification" object:0];
    [v20 addObserver:v3 selector:sel__handleBacklightLevelWillChange_ name:*MEMORY[0x1E4FA7A18] object:0];
    [v20 addObserver:v3 selector:sel__handleBacklightDidTurnOff_ name:*MEMORY[0x1E4FA7A10] object:0];
    [v20 addObserver:v3 selector:sel__setupModeChanged name:@"SBInBuddyModeDidChangeNotification" object:0];
    [v20 addObserver:v3 selector:sel__activeCallStateChanged name:*MEMORY[0x1E4FA79D8] object:0];
    [v20 addObserver:v3 selector:sel__noteBootCompleted name:@"SBBootCompleteNotification" object:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)LostModeStateChanged, (CFStringRef)*MEMORY[0x1E4F61A58], 0, CFNotificationSuspensionBehaviorCoalesce);
    uint64_t v22 = [(id)SBApp lockOutController];
    lockOutController = v3->_lockOutController;
    v3->_lockOutController = (SBFLockOutStatusProvider *)v22;

    char v24 = [(id)SBApp authenticationController];
    [(SBLockScreenManager *)v3 _setUserAuthController:v24];

    v25 = objc_alloc_init(SBLiftToWakeManager);
    liftToWakeManager = v3->_liftToWakeManager;
    v3->_liftToWakeManager = v25;

    if (+[SBTapToWakeController isTapToWakeSupported])
    {
      v27 = objc_alloc_init(SBTapToWakeController);
      tapToWakeController = v3->_tapToWakeController;
      v3->_tapToWakeController = v27;

      [(SBTapToWakeController *)v3->_tapToWakeController setDelegate:v3];
    }
    if (MGGetBoolAnswer())
    {
      uint64_t v29 = objc_alloc_init(SBMotionDetectionWakeController);
      motionDetectionWakeController = v3->_motionDetectionWakeController;
      v3->_motionDetectionWakeController = v29;

      [(SBMotionDetectionWakeController *)v3->_motionDetectionWakeController setDelegate:v3];
    }
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4FA5F98]) initWithTarget:v3 action:sel__wakeScreenForMouseButtonDown_];
    mouseButtonDownGesture = v3->_mouseButtonDownGesture;
    v3->_mouseButtonDownGesture = (SBFMouseButtonDownGestureRecognizer *)v31;

    [(SBFMouseButtonDownGestureRecognizer *)v3->_mouseButtonDownGesture setDelegate:v3];
    v33 = +[SBMainDisplaySystemGestureManager sharedInstance];
    [v33 addGestureRecognizer:v3->_mouseButtonDownGesture withType:68];

    char v34 = objc_alloc_init(SBLockScreenDisabledAssertionManager);
    lockScreenDisabledAssertionManager = v3->_lockScreenDisabledAssertionManager;
    v3->_lockScreenDisabledAssertionManager = v34;

    v36 = [[SBLockScreenAutoUnlockAggregateRule alloc] initWithUserAuthenticationController:v3->_userAuthController];
    autoUnlockRuleAggregator = v3->_autoUnlockRuleAggregator;
    v3->_autoUnlockRuleAggregator = v36;

    [(SBAutoUnlockComposableRule *)v3->_autoUnlockRuleAggregator addAutoUnlockRule:v3->_lockScreenDisabledAssertionManager];
    v38 = v3->_autoUnlockRuleAggregator;
    v39 = [(SBLockScreenEnvironment *)v3->_lockScreenEnvironment autoUnlockRule];
    [(SBAutoUnlockComposableRule *)v38 addAutoUnlockRule:v39];

    [(SBLockScreenManager *)v3 _evaluatePreArmDisabledAssertions];
    BOOL v40 = +[SBWallpaperController sharedInstance];
    [v40 addObserver:v3 forVariant:0];
    location[1] = (id)MEMORY[0x1E4F143A8];
    location[2] = (id)3221225472;
    location[3] = __27__SBLockScreenManager_init__block_invoke;
    location[4] = &unk_1E6AF5180;
    v41 = v3;
    v67 = v41;
    id v42 = (id)BSLogAddStateCaptureBlockWithTitle();
    id v43 = +[SBCoverSheetPresentationManager sharedInstance];
    [v43 setLockScreenEnvironment:v3->_lockScreenEnvironment];
    [v43 setUILockStateProvider:v41];
    [v43 setDelegate:v41];
    [v43 setPearlMatchingStateProvider:v3->_biometricResourceObserver];
    v44 = +[SBWorkspace mainWorkspace];
    [v43 setMainWorkspace:v44];

    v45 = [[SBIdleTimerCoordinatorHelper alloc] initWithSourceProvider:v41];
    idleTimerCoordinatorHelper = v41->_idleTimerCoordinatorHelper;
    v41->_idleTimerCoordinatorHelper = v45;

    v47 = +[SBMainWorkspace sharedInstance];
    [(SBLockScreenManager *)v41 _setIdleTimerCoordinator:v47];

    id v48 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F334B750, &unk_1F334B768, &unk_1F334B780, &unk_1F334B798, 0);
    id v49 = objc_alloc(MEMORY[0x1E4F42C10]);
    v50 = [MEMORY[0x1E4F43268] privateConfigurationForTypes:v48];
    uint64_t v51 = [v49 initWithConfiguration:v50];
    authenticationFeedbackGenerator = v41->_authenticationFeedbackGenerator;
    v41->_authenticationFeedbackGenerator = (UINotificationFeedbackGenerator *)v51;

    [(SBLockScreenManager *)v41 _showSystemApertureProudLockElementIfSupportedWithReason:@"Startup"];
    uint64_t v53 = +[SBBacklightController sharedInstance];
    [v53 addObserver:v41];
    if ([v53 isDigitizerDisabled])
    {
      uint64_t v54 = [v53 isTapToWakeEnabled];
      [(SBTapToWakeController *)v41->_tapToWakeController setDigitizerInTapToWakeMode:v54];
      BOOL v55 = v41->_tapToWakeController;
      if (v54) {
        uint64_t v56 = [v53 tapToWakeRequiresHitTestSuppression];
      }
      else {
        uint64_t v56 = 0;
      }
    }
    else
    {
      [(SBTapToWakeController *)v41->_tapToWakeController setDigitizerInTapToWakeMode:0];
      uint64_t v56 = 0;
      BOOL v55 = v41->_tapToWakeController;
    }
    [(SBTapToWakeController *)v55 setDigitizerModeRequiresHitTestSuppression:v56];
    objc_initWeak(location, v41);
    v57 = (void *)MEMORY[0x1E4F4F6E8];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __27__SBLockScreenManager_init__block_invoke_193;
    v64[3] = &unk_1E6AF92D8;
    objc_copyWeak(&v65, location);
    uint64_t v58 = [v57 assertionWithIdentifier:@"SBLockScreenManager lockScreenPresentationPending" stateDidChangeHandler:v64];
    lockScreenPresentationPendingAssertions = v41->_lockScreenPresentationPendingAssertions;
    v41->_lockScreenPresentationPendingAssertions = (BSCompoundAssertion *)v58;

    if ([v53 screenIsOn]) {
      [v4 noteScreenWillTurnOn];
    }
    else {
      [v4 noteScreenDidTurnOff];
    }
    objc_destroyWeak(&v65);
    objc_destroyWeak(location);
  }
  return v3;
}

uint64_t __27__SBLockScreenManager_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) description];
}

void __27__SBLockScreenManager_init__block_invoke_193(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v4);
}

void __27__SBLockScreenManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained coverSheetViewController];
  [v1 setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (id)_newLockScreenEnvironment
{
  id v3 = [(id)SBApp userSessionController];
  if ([v3 isLoginSession])
  {
  }
  else
  {
    id v4 = +[SBDefaults localDefaults];
    int v5 = [v4 multiUserDefaults];
    int v6 = [v5 forceLoginWindow];

    if (!v6)
    {
      BOOL v8 = objc_alloc_init(SBDashBoardLockScreenEnvironment);
      v7 = [(SBDashBoardLockScreenEnvironment *)v8 coverSheetViewController];
      [(SBLoginAppContainerViewController *)v7 setDelegate:self];
      goto LABEL_6;
    }
  }
  v7 = objc_alloc_init(SBLoginAppContainerViewController);
  BOOL v8 = [[SBLegacyLockScreenEnvironment alloc] initWithLockScreenViewController:v7];
LABEL_6:

  id v9 = [(SBDashBoardLockScreenEnvironment *)v8 idleTimerController];
  [v9 setIdleTimerCoordinator:self];

  return v8;
}

- (BOOL)hasUIEverBeenLocked
{
  return self->_uiHasBeenLockedOnce;
}

- (BOOL)_shouldLockAfterEndingTelephonyCall
{
  if (+[SBInCallPresentationManager isSpecializedAPISupported])
  {
    goto LABEL_2;
  }
  id v4 = +[SBTelephonyManager sharedTelephonyManager];
  if (![v4 inCall])
  {
    LOBYTE(v3) = 0;
    goto LABEL_9;
  }
  int v5 = [MEMORY[0x1E4FADA90] sharedInstance];
  int v6 = [v5 anyCallIsEndpointOnCurrentDevice];

  if (v6 && ![(SBLockScreenManager *)self isUILocked])
  {
    if (SBWorkspaceSpringBoardIsActive())
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    id v4 = +[SBWorkspace mainWorkspace];
    BOOL v8 = [v4 transientOverlayPresentationManager];
    int v3 = [v8 hasActivePresentation] ^ 1;

LABEL_9:
    return v3;
  }
LABEL_2:
  LOBYTE(v3) = 0;
  return v3;
}

- (BOOL)_shouldLockAfterEndingFaceTimeCall
{
  if (!+[SBInCallPresentationManager isSpecializedAPISupported])
  {
    int v3 = +[SBConferenceManager sharedInstance];
    int v4 = [v3 inFaceTime];

    int v5 = +[SBConferenceManager sharedInstance];
    uint64_t v6 = [v5 inFaceTimeVideo];

    v7 = +[SBWorkspace mainWorkspace];
    LOBYTE(v2) = 0;
    if (!v4 || (v6 & 1) != 0) {
      goto LABEL_13;
    }
    char IsActive = SBWorkspaceSpringBoardIsActive();
    if ((IsActive & 1) != 0
      || ([v7 transientOverlayPresentationManager],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          ([(id)v6 hasActivePresentation] & 1) == 0))
    {
      id v9 = +[SBConferenceManager sharedInstance];
      if ([v9 faceTimeInvitationExists])
      {

        LOBYTE(v2) = 0;
        if (IsActive) {
          goto LABEL_13;
        }
      }
      else
      {
        id v10 = [v7 pipControllerForType:0];
        int v2 = [v10 isPictureInPictureWindowVisibleOnWindowScene:0] ^ 1;

        if (IsActive)
        {
LABEL_13:

          return v2;
        }
      }
    }
    else
    {
      LOBYTE(v2) = 0;
    }

    goto LABEL_13;
  }
  LOBYTE(v2) = 0;
  return v2;
}

- (BOOL)shouldLockUIAfterEndingCall
{
  if (+[SBInCallPresentationManager isSpecializedAPISupported])
  {
    return 0;
  }
  if ([(SBLockScreenManager *)self _shouldLockAfterEndingTelephonyCall]) {
    return 1;
  }
  return [(SBLockScreenManager *)self _shouldLockAfterEndingFaceTimeCall];
}

- (BOOL)shouldTapToWake
{
  int v2 = [(SBLockScreenManager *)self _tapToWakeController];
  char v3 = [v2 shouldTapToWake];

  return v3;
}

- (BOOL)playLockSoundIfPermitted
{
  BOOL v3 = [(SBLockScreenManager *)self _shouldPlayLockSound];
  if (v3)
  {
    self->_hasPlayedSoundForLock = 1;
    int v4 = +[SBSoundController sharedInstance];
    int v5 = [MEMORY[0x1E4FA79C8] soundWithFeedbackEventType:1002];
    [v4 playSoundWithDefaultEnvironment:v5];
  }
  return v3;
}

- (BOOL)_shouldPlayLockSound
{
  BOOL v3 = +[SBLockScreenManager sharedInstance];
  int v4 = [v3 isUILocked];

  if (!v4
    || (int v5 = [(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet]) != 0
    && (int v5 = [(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated]) != 0)
  {
    if (self->_hasPlayedSoundForLock)
    {
      uint64_t v6 = SBLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v8 = 0;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "didn't play lock sound, have already played sound for this locking", v8, 2u);
      }

      LOBYTE(v5) = 0;
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)isLockScreenVisible
{
  BOOL v2 = [(SBLockScreenManager *)self isLockScreenActive];
  if (v2) {
    LOBYTE(v2) = !+[SBAssistantController isVisible];
  }
  return v2;
}

- (BOOL)isSupressingLockButton
{
  BOOL v2 = [(SBLockScreenManager *)self coverSheetViewController];
  char v3 = [v2 isAccessoryAnimationPresenting];

  return v3;
}

- (void)lockUIFromSource:(int)a3 withOptions:(id)a4
{
}

- (void)lockUIFromSource:(int)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromLockSource();
    id v11 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v7];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "lockUIFromSource:%{public}@ options:%{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v106 = 0;
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke;
  v96[3] = &unk_1E6B0E670;
  v98 = buf;
  v96[4] = self;
  id v81 = v8;
  id v97 = v81;
  uint64_t v12 = (void (**)(void, void))MEMORY[0x1D948C7A0](v96);
  if (self->_allowUILockUnlock)
  {
    v13 = [v7 objectForKey:@"SBUILockOptionsAnimateLockScreenActivationKey"];
    unsigned int v69 = [v13 BOOLValue];

    int v14 = [v7 objectForKey:@"SBUILockOptionsLockAutomaticallyKey"];
    HIDWORD(v66) = [v14 BOOLValue];

    v15 = [v7 objectForKey:@"SBUILockOptionsForceLockKey"];
    int v74 = [v15 BOOLValue];

    v78 = [v7 objectForKey:@"SBUILockOptionsAnimationTransactionProviderKey"];
    uint64_t v16 = [v7 objectForKey:@"SBUILockOptionsForceBioLockoutKey"];
    int v17 = [v16 BOOLValue];

    int v18 = [v7 objectForKey:@"SBUILockOptionsUseScreenOffModeKey"];
    id v77 = v18;
    if (v18) {
      LODWORD(v66) = [v18 BOOLValue];
    }
    else {
      LODWORD(v66) = 1;
    }
    char v20 = objc_msgSend(v7, "bs_BOOLForKey:", @"SBUILockOptionsPreserveTransientOverlaysKey", v66);
    v21 = [v7 objectForKey:@"SBUILockOptionsIgnoreCallKey"];
    int v22 = [v21 BOOLValue];

    BOOL v23 = !+[SBInCallPresentationManager isSpecializedAPISupported]&& [(SBLockScreenManager *)self shouldLockUIAfterEndingCall];
    char v24 = +[SBBacklightController sharedInstance];
    uint64_t v71 = [v24 backlightState];

    if (v17)
    {
      v25 = [MEMORY[0x1E4FA7C68] sharedInstance];
      [v25 _forceBioLockout];

      notify_post("com.apple.springboard.lock-with-force-biolockout");
    }
    uint64_t v26 = [MEMORY[0x1E4F624E0] sharedInstance];
    [v26 cancelEventsWithName:@"AttemptLock"];

    v27 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
    id v80 = [v27 _sbWindowScene];

    v79 = [v80 switcherController];
    char v28 = [(id)SBApp remoteTransientOverlaySessionManager];
    int v29 = [v28 hasSessionWithPendingButtonEvents:1 options:0];

    if (v29)
    {
      v12[2](v12, 0);
LABEL_59:
      if ((v20 & 1) == 0)
      {
        if (v71 == 3)
        {
          *(void *)v101 = 0;
          v102 = v101;
          uint64_t v103 = 0x2020000000;
          char v104 = 0;
          uint64_t v51 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
          v72 = [v51 _sbWindowScene];

          id v70 = [v72 transientOverlayPresenter];
          id v75 = [v70 presentedViewControllers];
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_2;
          v92[3] = &unk_1E6B0E698;
          v92[4] = v101;
          [v75 enumerateObjectsUsingBlock:v92];
          if (v102[24])
          {
            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            id v52 = v75;
            uint64_t v53 = [v52 countByEnumeratingWithState:&v88 objects:v100 count:16];
            if (v53)
            {
              uint64_t v54 = *(void *)v89;
              do
              {
                for (uint64_t i = 0; i != v53; ++i)
                {
                  if (*(void *)v89 != v54) {
                    objc_enumerationMutation(v52);
                  }
                  uint64_t v56 = *(void **)(*((void *)&v88 + 1) + 8 * i);
                  if (([v56 supportsAlwaysOnDisplay] & 1) == 0)
                  {
                    v57 = +[SBWorkspace mainWorkspace];
                    [v57 dismissTransientOverlayViewController:v56 animated:0 completion:0];
                  }
                }
                uint64_t v53 = [v52 countByEnumeratingWithState:&v88 objects:v100 count:16];
              }
              while (v53);
            }
          }
          else
          {
            id v52 = +[SBWorkspace mainWorkspace];
            [v52 dismissAllTransientOverlayPresentationsAnimated:0];
          }
        }
        else
        {
          *(void *)v101 = 0;
          v102 = v101;
          uint64_t v103 = 0x2020000000;
          char v104 = 0;
          id v73 = [v80 transientOverlayPresenter];
          v76 = [v73 presentedViewControllers];
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_3;
          v87[3] = &unk_1E6B0E698;
          v87[4] = v101;
          [v76 enumerateObjectsUsingBlock:v87];
          if (v102[24])
          {
            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            id v58 = v76;
            uint64_t v59 = [v58 countByEnumeratingWithState:&v83 objects:v99 count:16];
            if (v59)
            {
              uint64_t v60 = *(void *)v84;
              do
              {
                for (uint64_t j = 0; j != v59; ++j)
                {
                  if (*(void *)v84 != v60) {
                    objc_enumerationMutation(v58);
                  }
                  v62 = *(void **)(*((void *)&v83 + 1) + 8 * j);
                  if (([v62 preventsDismissalOnLockForInactiveScreen] & 1) == 0)
                  {
                    v63 = +[SBWorkspace mainWorkspace];
                    [v63 dismissTransientOverlayViewController:v62 animated:0 completion:0];
                  }
                }
                uint64_t v59 = [v58 countByEnumeratingWithState:&v83 objects:v99 count:16];
              }
              while (v59);
            }
          }
          else
          {
            id v58 = +[SBWorkspace mainWorkspace];
            [v58 dismissAllTransientOverlayPresentationsAnimated:0];
          }
        }
        _Block_object_dispose(v101, 8);
      }
      if ((a3 - 1) <= 1) {
        [MEMORY[0x1E4FAF5E0] _stopAllAlerts];
      }
      id v65 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
      [v65 setValue:MEMORY[0x1E4F1CC28] forPreferenceKey:*MEMORY[0x1E4FAE618]];

      ((void (**)(void, BOOL))v12)[2](v12, [(SBLockScreenManager *)self isUILocked]);
      goto LABEL_96;
    }
    int v30 = [MEMORY[0x1E4FA60D0] sharedInstanceIfExists];
    [v30 lockDidBegin];

    uint64_t v31 = +[SBWorkspace mainWorkspace];
    v32 = [v31 inCallPresentationManager];

    int v33 = v22 | v74;
    if ((v22 | v74))
    {
      int v34 = 0;
      uint64_t v35 = a3;
    }
    else
    {
      uint64_t v35 = a3;
      int v34 = [v32 supportsHandlingDeviceLock];
    }
    switch((int)v35)
    {
      case 0:
        if (v74) {
          goto LABEL_35;
        }
        v36 = SBLogCommon();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[SBLockScreenManager lockUIFromSource:withOptions:completion:](v36);
        }

        BOOL v37 = [(SBLockScreenManager *)self isUILocked];
        goto LABEL_87;
      case 1:
      case 3:
        if (+[SBInCallPresentationManager isSpecializedAPISupported])
        {
          if ((![(SBLockScreenManager *)self isUILocked] | v34)) {
            goto LABEL_35;
          }
          goto LABEL_43;
        }
        if ([(SBLockScreenManager *)self isUILocked] && !v23) {
          goto LABEL_43;
        }
        goto LABEL_35;
      case 2:
      case 5:
        goto LABEL_28;
      case 4:
        goto LABEL_35;
      default:
        if (v35 == 15)
        {
LABEL_28:
          if (![(SBLockScreenManager *)self isUILocked]) {
            goto LABEL_35;
          }
        }
        else
        {
          if (v35 != 24)
          {
LABEL_35:
            v38 = SBLogCommon();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v39 = v32;
              BOOL v40 = +[SBTelephonyManager sharedTelephonyManager];
              int v41 = [v40 inCall];
              *(_DWORD *)v101 = 67109120;
              *(_DWORD *)&v101[4] = v41;
              _os_log_impl(&dword_1D85BA000, v38, OS_LOG_TYPE_DEFAULT, "-[SBTelephonyManager inCall] %d", v101, 8u);

              v32 = v39;
            }

            if (((+[SBInCallPresentationManager isSpecializedAPISupported] | v33) & 1) == 0)
            {
              if (a3 == 1 && v23)
              {
                id v43 = +[SBWorkspace mainWorkspace];
                v44 = [v43 inCallTransientOverlayManager];
                [v44 presentTransientOverlayForUILock];

                goto LABEL_86;
              }
              -[SBLockScreenManager _disconnectActiveCallIfNeededFromSource:](self, "_disconnectActiveCallIfNeededFromSource:");
            }
            if (((v33 | v34 ^ 1) & 1) == 0)
            {
              v64 = SBLogInCallPresentation();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v101 = 0;
                _os_log_impl(&dword_1D85BA000, v64, OS_LOG_TYPE_DEFAULT, "inCallPresentationManager handleDeviceLockFromSource", v101, 2u);
              }

              [v32 handleDeviceLockFromSource:a3];
LABEL_86:
              BOOL v37 = 0;
LABEL_87:
              v12[2](v12, v37);

LABEL_96:
              goto LABEL_97;
            }
            v46 = SBLogCommon();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v101 = 0;
              _os_log_impl(&dword_1D85BA000, v46, OS_LOG_TYPE_DEFAULT, "LockUI from source: Now locking", v101, 2u);
            }

            if (a3 == 15) {
              uint64_t v47 = 1;
            }
            else {
              uint64_t v47 = v68;
            }
            v93[0] = MEMORY[0x1E4F143A8];
            v93[1] = 3221225472;
            v93[2] = __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_214;
            v93[3] = &unk_1E6AF5AA0;
            id v94 = v79;
            v95 = v12;
            [(SBLockScreenManager *)self _activateLockScreenAnimated:v69 animationProvider:v78 automatically:v47 inScreenOffMode:v67 dismissNotificationCenter:a3 != 4 completion:v93];
            [(SBLockScreenManager *)self _clearAuthenticationLockAssertion];
            if (v74)
            {
              id v48 = [(id)SBApp authenticationController];
              id v49 = NSStringFromLockSource();
              [v48 revokeAuthenticationImmediatelyForPublicReason:v49];
            }
            if (([(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet] & 1) == 0)
            {
              v50 = +[SBCoverSheetPresentationManager sharedInstance];
              [v50 noteDeviceDidLock];
            }
LABEL_58:

            goto LABEL_59;
          }
          if (![(SBLockScreenManager *)self isUILocked])
          {
            int v34 = 0;
            goto LABEL_35;
          }
        }
LABEL_43:
        if ([v79 unlockedEnvironmentMode] != 3)
        {
          v45 = +[SBIconController sharedInstance];
          [v45 popToCurrentRootIconListWhenPossible];

          uint64_t v35 = a3;
        }
        [(SBLockScreenManager *)self _relockUIForButtonlikeSource:v35];
        goto LABEL_58;
    }
  }
  v19 = SBLogCommon();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v101 = 0;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring lock attempt because we're still initializing ourselves at startup and we're not ready for this yet.", v101, 2u);
  }

  v12[2](v12, 0);
LABEL_97:

  _Block_object_dispose(buf, 8);
}

uint64_t __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    *(unsigned char *)(*(void *)(result + 32) + 85) = 0;
    result = *(void *)(result + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_214(uint64_t a1)
{
  if ([*(id *)(a1 + 32) unlockedEnvironmentMode] != 3)
  {
    BOOL v2 = +[SBIconController sharedInstance];
    [v2 popToCurrentRootIconListWhenPossible];
  }
  char v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 supportsAlwaysOnDisplay];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __63__SBLockScreenManager_lockUIFromSource_withOptions_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 preventsDismissalOnLockForInactiveScreen];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (SBNotificationDestination)notificationDestination
{
  BOOL v2 = [(SBLockScreenManager *)self coverSheetViewController];
  char v3 = [v2 notificationDestination];

  return (SBNotificationDestination *)v3;
}

- (id)biometricAuthenticationCoordinator
{
  return self->_biometricAuthenticationCoordinator;
}

uint64_t __47__SBLockScreenManager_handleTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 activationSettings];
  uint64_t v3 = [v2 BOOLForActivationSetting:35] ^ 1;

  return v3;
}

SBCoverSheetToAppsWorkspaceTransaction *__47__SBLockScreenManager_handleTransitionRequest___block_invoke_220(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[SBCoverSheetToAppsWorkspaceTransaction alloc] initWithTransitionRequest:v2];

  return v3;
}

- (BOOL)_canHandleTransitionRequest:(id)a3
{
  id v3 = a3;
  int v4 = [v3 applicationContext];
  int v5 = [v4 resolvedActivatingWorkspaceEntity];
  unint64_t v6 = [v3 source];

  if ((v6 <= 0x3D && ((1 << v6) & 0x2000C801004C2134) != 0 || v6 == 70 || v6 == 67)
    && ([v4 isBackground] & 1) == 0)
  {
    id v9 = [v4 entities];
    unint64_t v10 = [v9 count];

    char v7 = 0;
    if (v10 <= 1 && v5)
    {
      if ([v5 isApplicationSceneEntity]) {
        char v7 = 1;
      }
      else {
        char v7 = [v5 isAppClipPlaceholderEntity];
      }
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)bioAuthenticatedWhileMenuButtonDown
{
  return [(SBLockScreenBiometricAuthenticationCoordinator *)self->_biometricAuthenticationCoordinator bioAuthenticatedWhileMenuButtonDown];
}

- (void)setBiometricAutoUnlockingDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v14 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBLockScreenManager.m", 1004, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v7 = 0;
  }
  id v8 = [(NSMutableDictionary *)self->_mesaAutoUnlockingDisabledAssertions objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v4)
  {

    if (v9) {
      goto LABEL_12;
    }
    if (!self->_mesaAutoUnlockingDisabledAssertions)
    {
      unint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      mesaAutoUnlockingDisabledAssertions = self->_mesaAutoUnlockingDisabledAssertions;
      self->_mesaAutoUnlockingDisabledAssertions = v10;
    }
    uint64_t v12 = [(SBLockScreenBiometricAuthenticationCoordinator *)self->_biometricAuthenticationCoordinator acquireDisableAutoUnlockAssertionForReason:v14];
    if (v12) {
      [(NSMutableDictionary *)self->_mesaAutoUnlockingDisabledAssertions setObject:v12 forKeyedSubscript:v14];
    }
  }
  else
  {
    [v8 invalidate];

    [(NSMutableDictionary *)self->_mesaAutoUnlockingDisabledAssertions removeObjectForKey:v14];
    if ([(NSMutableDictionary *)self->_mesaAutoUnlockingDisabledAssertions count]) {
      goto LABEL_12;
    }
    uint64_t v12 = self->_mesaAutoUnlockingDisabledAssertions;
    self->_mesaAutoUnlockingDisabledAssertions = 0;
  }

LABEL_12:
}

- (void)loadViewsIfNeeded
{
  id v2 = +[SBCoverSheetPresentationManager sharedInstance];
  [v2 loadViewsIfNeeded];
}

- (BOOL)hasWakeToContentForInactiveDisplay
{
  if ([(SBLockScreenManager *)self _shouldWakeToInCallForUnlockSource:32 wakingTheDisplay:0])
  {
    return 1;
  }
  return [(SBLockScreenManager *)self _shouldWakeToOtherContentForUnlockSource:32 wakingTheDisplay:0 stopAfterWakeTo:1];
}

- (id)acquireLockScreenPresentationPendingAssertionWithReason:(id)a3
{
  return (id)[(BSCompoundAssertion *)self->_lockScreenPresentationPendingAssertions acquireForReason:a3];
}

- (BOOL)isLockScreenPresentationPending
{
  return [(BSCompoundAssertion *)self->_lockScreenPresentationPendingAssertions isActive];
}

- (id)acquireMotionDetectionWakeEnableAssertionWithReason:(id)a3
{
  return [(SBMotionDetectionWakeController *)self->_motionDetectionWakeController acquireMotionDetectionWakeAssertionForReason:a3];
}

- (id)acquireSystemApertureLockElementSuppressionAssertionWithReason:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (!self->_lockElementSuppressionAssertions)
    {
      int v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      lockElementSuppressionAssertions = self->_lockElementSuppressionAssertions;
      self->_lockElementSuppressionAssertions = v5;
    }
    id v7 = SBLogSystemApertureLockElement();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v4;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Acquiring system aperture lock element suppression assertion for reason: %{public}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v8 = objc_alloc(MEMORY[0x1E4F4F838]);
    id v9 = [MEMORY[0x1E4F29128] UUID];
    unint64_t v10 = [v9 UUIDString];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__SBLockScreenManager_acquireSystemApertureLockElementSuppressionAssertionWithReason___block_invoke;
    v13[3] = &unk_1E6AF4FB8;
    objc_copyWeak(&v14, (id *)buf);
    id v11 = (void *)[v8 initWithIdentifier:v10 forReason:v4 invalidationBlock:v13];

    [(NSHashTable *)self->_lockElementSuppressionAssertions addObject:v11];
    if ([(NSHashTable *)self->_lockElementSuppressionAssertions count] == 1) {
      [(SBLockScreenManager *)self reevaluateSystemApertureLockElementSuppressionWithReason:@"Lock element suppression assertion acquired"];
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __86__SBLockScreenManager_acquireSystemApertureLockElementSuppressionAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogSystemApertureLockElement();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 reason];
    int v9 = 138543362;
    unint64_t v10 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "System aperture lock element suppression assertion did invalidate with reason: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[40] removeObject:v3];
    if (![v7[40] count])
    {
      id v8 = v7[40];
      v7[40] = 0;

      [v7 reevaluateSystemApertureLockElementSuppressionWithReason:@"Last lock element suppression assertion invalidated"];
    }
  }
}

- (id)acquireSystemApertureLockElementBloomSuppressionAssertionWithReason:(id)a3
{
  id v4 = a3;
  lockElementBloomSuppressionAssertions = self->_lockElementBloomSuppressionAssertions;
  if (!lockElementBloomSuppressionAssertions)
  {
    objc_initWeak(&location, self);
    unint64_t v6 = (void *)MEMORY[0x1E4F4F6E8];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __91__SBLockScreenManager_acquireSystemApertureLockElementBloomSuppressionAssertionWithReason___block_invoke;
    id v16 = &unk_1E6AF92D8;
    objc_copyWeak(&v17, &location);
    id v7 = [v6 assertionWithIdentifier:@"LockElementBloomSuppression" stateDidChangeHandler:&v13];
    id v8 = self->_lockElementBloomSuppressionAssertions;
    self->_lockElementBloomSuppressionAssertions = v7;

    int v9 = self->_lockElementBloomSuppressionAssertions;
    unint64_t v10 = SBLogSystemApertureLockElement();
    -[BSCompoundAssertion setLog:](v9, "setLog:", v10, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    lockElementBloomSuppressionAssertions = self->_lockElementBloomSuppressionAssertions;
  }
  uint64_t v11 = [(BSCompoundAssertion *)lockElementBloomSuppressionAssertions acquireForReason:v4];

  return v11;
}

void __91__SBLockScreenManager_acquireSystemApertureLockElementBloomSuppressionAssertionWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateBloomIfNeeded];
}

- (void)reevaluateSystemApertureLockElementSuppressionWithReason:(id)a3
{
  [(SBLockScreenManager *)self _reevaluateSystemApertureLockElementSuppressionWithReason:a3];
  [(SBLockScreenManager *)self _updateBloomIfNeeded];
}

- (void)_reevaluateSystemApertureLockElementSuppressionWithReason:(id)a3
{
  id v4 = a3;
  if ([(SBLockScreenManager *)self _shouldHideLockForElementSuppressionAssertion])
  {
    [(SBLockScreenManager *)self _setSystemApertureProudLockElementVisible:0 withReason:v4];
  }
  else
  {
    [(SBLockScreenManager *)self _showSystemApertureProudLockElementIfSupportedWithReason:v4];
  }
}

- (void)noteContinuityDisplayWindowSceneConnectionDidChange
{
  if (self->_isReadyForContinuityDisplays
    || ([(id)SBApp hasFinishedLaunching] & 1) != 0
    || self->_uiHasBeenLockedOnce)
  {
    [(SBLockScreenManager *)self _sendUILockStateChangedNotification];
  }
  else
  {
    id v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager] suppressing lock state change for continuity display connection, not ready yet after boot", v4, 2u);
    }
  }
}

- (void)migrateNotificationsToHistory
{
  id v2 = [(SBLockScreenManager *)self coverSheetViewController];
  [v2 _migrateNotificationsToHistory];
}

- (void)lockScreenViewControllerWillPresent
{
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "lockScreenViewControllerWillPresent", v6, 2u);
  }

  [(SBLockScreenManager *)self _evaluateWallpaperMode];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v5 = [(SBLockScreenManager *)self _hostingWindowScene];
  [v4 postNotificationName:@"SBLockScreenUIWillPresentNotification" object:v5];
}

- (void)lockScreenViewControllerDidPresent
{
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "lockScreenViewControllerDidPresent", buf, 2u);
  }

  [(SBLockScreenManager *)self setUIUnlocking:0];
  self->_handlingUnlockRequest = 0;
  id v4 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  int v5 = [v4 _sbWindowScene];

  unint64_t v6 = [v5 switcherController];
  if ([v6 isAnySwitcherVisible]) {
    [v6 dismissMainAndFloatingSwitchersWithSource:7 animated:0];
  }
  if ([v6 isInAnyPeekState]) {
    [v6 activateHomeScreenWithSource:7 animated:0];
  }
  BOOL v7 = [(SBLockScreenManager *)self _lockUI];
  id v8 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment lockController];
  objc_msgSend(v8, "setAuthenticated:", -[SBFUserAuthenticationController isAuthenticated](self->_userAuthController, "isAuthenticated"));

  int v9 = [(SBLockScreenManager *)self _statusBarLayoutManager];
  [v9 setDefaultWindowLevel:*MEMORY[0x1E4F43CF8] + 20.0];

  unint64_t v10 = [(id)SBApp bannerManager];
  [v10 dismissAllBannersInAllWindowScenesAnimated:0 reason:@"SBBannerManagerDismissalReasonLock"];

  if (!self->_presentedPasscodeWhileUILocking) {
    [(SBLockScreenManager *)self setPasscodeVisible:0 animated:1];
  }
  if (self->_isInLostMode) {
    [(SBLockScreenManager *)self enableLostModePlugin];
  }
  uint64_t v11 = [(id)SBApp userSessionController];
  char v12 = [v11 isMultiUserSupported];

  uint64_t v13 = SBFEffectiveHomeButtonType();
  if ((v12 & 1) == 0 && v13 != 2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SBLockScreenManager_lockScreenViewControllerDidPresent__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    if (lockScreenViewControllerDidPresent_onceToken != -1) {
      dispatch_once(&lockScreenViewControllerDidPresent_onceToken, block);
    }
  }
  [(SBLockScreenManager *)self _showSystemApertureProudLockElementIfSupportedWithReason:@"DidPresent"];
  uint64_t v14 = [v5 homeScreenController];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[SBUIController sharedInstance];
  }
  id v17 = v16;

  [v17 endRequiringContentForReason:@"SBUIHomeScreenActiveContentRequirementReason"];
  if (v7)
  {
    int v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 postNotificationName:@"SBLockScreenUIDidLockNotification" object:self];
  }
  v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  char v20 = [(SBLockScreenManager *)self _hostingWindowScene];
  [v19 postNotificationName:@"SBLockScreenUIDidPresentNotification" object:v20];
}

uint64_t __57__SBLockScreenManager_lockScreenViewControllerDidPresent__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 120))
  {
    uint64_t v2 = result;
    uint64_t result = [*(id *)(v1 + 168) isAuthenticated];
    if ((result & 1) == 0)
    {
      uint64_t result = [*(id *)(*(void *)(v2 + 32) + 168) hasPasscodeSet];
      if (result)
      {
        SBUIPrewarmKeyboard();
        id v3 = *(void **)(v2 + 32);
        return [v3 setPasscodeVisible:1 animated:0];
      }
    }
  }
  return result;
}

- (void)lockScreenViewControllerWillDismiss
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Restoring Home screen icons for UI unlock", v1, 2u);
}

uint64_t __58__SBLockScreenManager_lockScreenViewControllerWillDismiss__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:1];
}

void __58__SBLockScreenManager_lockScreenViewControllerWillDismiss__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 modifyApplicationContext:&__block_literal_global_266_1];
  [v2 setSource:11];
  [v2 setTransactionProvider:&__block_literal_global_268_0];
}

void __58__SBLockScreenManager_lockScreenViewControllerWillDismiss__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAnimationDisabled:1];
  [v2 setWaitsForSceneUpdates:0];
}

SBCoverSheetToAppsWorkspaceTransaction *__58__SBLockScreenManager_lockScreenViewControllerWillDismiss__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SBCoverSheetToAppsWorkspaceTransaction alloc] initWithTransitionRequest:v2];

  return v3;
}

- (void)lockScreenViewControllerDidDismiss
{
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "lockScreenViewControllerDidDismiss", buf, 2u);
  }

  id v4 = [(SBLockScreenManager *)self _statusBarLayoutManager];
  [v4 setDefaultWindowLevel:*MEMORY[0x1E4F43F28] + -1.0];

  [(SBLockScreenManager *)self setUIUnlocking:0];
  self->_handlingUnlockRequest = 0;
  [(SBLockScreenManager *)self _evaluateWallpaperMode];
  [(SBLockScreenManager *)self _setHomeButtonSuppressAfterUnlockRecognizer:0];
  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"SBLockScreenManagerUnlockAnimationDidFinish" object:self];

  unint64_t v6 = +[SBAlertItemsController sharedInstance];
  [v6 convertLockedAlertsToUnlockedAlerts];

  BOOL v7 = +[SBWorkspace mainWorkspace];
  id v8 = [v7 createRequestWithOptions:0];

  [v8 finalize];
  int v9 = [v8 applicationContext];
  unint64_t v10 = [v9 applicationSceneEntities];

  uint64_t v11 = [v10 count];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = [v8 applicationContext];
  uint64_t v14 = [v13 layoutState];
  v15 = SBSafeCast(v12, v14);

  uint64_t v16 = [v15 unlockedEnvironmentMode];
  if (!v11 && v16 != 2)
  {
    id v17 = +[SBWorkspace mainWorkspace];
    int v18 = [v17 transientOverlayPresentationManager];
    char v19 = [v18 hasActivePresentation];

    if ((v19 & 1) == 0)
    {
      char v20 = +[SBPasscodeController sharedInstance];
      [v20 checkPasscodeCompliance];
    }
  }
  if (self->_proudLockAssertion)
  {
    v21 = SBLogSystemApertureLockElement();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "LockElement dismissal lost the race with didDismiss, trying a soft dismiss.", buf, 2u);
    }

    [(SBLockScreenManager *)self _cleanupSystemApertureLockElementIfNecessaryWithReason:@"DidDismiss"];
    if (self->_proudLockAssertion)
    {
      int v22 = SBLogSystemApertureLockElement();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "LockElement dismissal lost the race with didDismiss, starting a hard dismiss timer.", buf, 2u);
      }

      self->_ignoringDelayDismissalPending = 1;
      BOOL v23 = [MEMORY[0x1E4F5E408] rootSettings];
      char v24 = [v23 pearlSettings];
      [v24 systemApertureDismissDelayDismissal];
      double v26 = v25;

      dispatch_time_t v27 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__SBLockScreenManager_lockScreenViewControllerDidDismiss__block_invoke;
      block[3] = &unk_1E6AF4AC0;
      block[4] = self;
      dispatch_after(v27, MEMORY[0x1E4F14428], block);
    }
  }
  char v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v29 = [(SBLockScreenManager *)self _hostingWindowScene];
  [v28 postNotificationName:@"SBLockScreenUIDidDismissNotification" object:v29];
}

uint64_t __57__SBLockScreenManager_lockScreenViewControllerDidDismiss__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 296))
  {
    if (*(void *)(result + 272)) {
      return [(id)result _cleanupSystemApertureLockElementIgnoringDelays:1 reason:@"DidDismissPlusDelay"];
    }
  }
  return result;
}

- (id)_hostingWindowScene
{
  id v2 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  id v3 = [v2 _sbWindowScene];

  return v3;
}

- (void)coverSheetPresentationManager:(id)a3 unlockWithRequest:(id)a4 completion:(id)a5
{
}

- (void)lockScreenViewControllerRequestsUnlock
{
}

- (void)coverSheetViewControllerIrisPlayingDidFinish:(id)a3
{
  if (self->_shouldTransitionIrisWallpaperToStillWhenPlaybackFinishes) {
    [(SBLockScreenManager *)self _evaluateWallpaperMode];
  }
}

- (void)coverSheetViewController:(id)a3 requestsTouchIDDisabled:(BOOL)a4 forReason:(id)a5
{
}

- (void)coverSheetViewController:(id)a3 requestsPreArmDisabled:(BOOL)a4 forReason:(id)a5
{
}

- (void)coverSheetViewController:(id)a3 unlockWithRequest:(id)a4 completion:(id)a5
{
}

- (void)coverSheetViewControllerShouldDismissContextMenu:(id)a3
{
  id v3 = +[SBIconController sharedInstance];
  int v4 = [v3 areAnyIconViewContextMenusShowing];

  if (v4)
  {
    id v5 = +[SBIconController sharedInstance];
    [v5 dismissAppIconForceTouchControllers:0];
  }
}

- (void)coverSheetWindowedAccessoryViewControllerDidDismiss:(id)a3
{
  id v3 = +[SBUIController sharedInstance];
  [v3 windowedAccessoryDismissed];
}

- (void)coverSheetWindowedAccessoryViewControllerDidPresent:(id)a3
{
  id v3 = +[SBUIController sharedInstance];
  [v3 windowedAccessoryPresented];
}

- (void)coverSheetViewControllerHandleUnlockAttemptSucceeded:(id)a3
{
}

- (void)coverSheetViewControllerWillPresentInlinePasscode:(id)a3
{
  [(SBLockScreenManager *)self _updateBloomIfNeeded];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"SBLockScreenPasscodeUIVisibilityUpdatedNotification" object:self];
}

- (void)coverSheetViewControllerDidDismissInlinePasscode:(id)a3
{
  [(SBLockScreenManager *)self _updateBloomIfNeeded];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"SBLockScreenPasscodeUIVisibilityUpdatedNotification" object:self];
}

- (void)coverSheetViewController:(id)a3 requestsTransientOverlaysDismissedAnimated:(BOOL)a4
{
  id v4 = +[SBMainWorkspace sharedInstance];
  id v6 = [v4 transientOverlayPresentationManager];

  if ([v6 hasActivePresentation])
  {
    id v5 = +[SBTransientOverlayDismissalRequest dismissalRequestForAllViewControllers];
    [v6 performDismissalRequest:v5];
  }
}

- (void)_updateBloomIfNeeded
{
  if (self->_proudLockAssertion) {
    goto LABEL_5;
  }
  id v3 = SBLogSystemApertureLockElement();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager][Lock Element] bloom update without a valid assertion causing reevaluation.", v4, 2u);
  }

  [(SBLockScreenManager *)self _reevaluateSystemApertureLockElementSuppressionWithReason:@"Bloom update without existing assertion"];
  if (self->_proudLockAssertion) {
LABEL_5:
  }
    [(SBLockElementViewProvider *)self->_lockElement setBloomed:[(SBLockScreenManager *)self _shouldBloomForAnyReason]];
}

- (BOOL)_shouldBloomForAnyReason
{
  id v3 = [(SBLockScreenManager *)self coverSheetViewController];
  if (([v3 isInlinePasscodeLockVisible] & 1) != 0
    || [(SBLockScreenManager *)self _isPasscodeVisible])
  {
    int v4 = [(BSCompoundAssertion *)self->_lockElementBloomSuppressionAssertions isActive] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)coverSheetViewController:(id)a3 setMesaUnlockingDisabled:(BOOL)a4 forReason:(id)a5
{
}

- (void)coverSheetViewController:(id)a3 startSpotlightInteractiveGestureTransactionForGesture:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 spotlightInteractiveGestureTransaction];

  if (!v7)
  {
    id v8 = (void *)SBApp;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke;
    v12[3] = &unk_1E6AF99E8;
    id v13 = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2;
    v9[3] = &unk_1E6AFB9A0;
    id v10 = v13;
    id v11 = v5;
    [v8 beginInteractiveSpotlightTransientOverlayPresentationWithValidator:v12 beginHandler:v9];
  }
}

uint64_t __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) isDragging];
}

void __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isDragging])
  {
    [*(id *)(a1 + 40) setSpotlightInteractiveGestureTransaction:v3];
    objc_initWeak(&location, *(id *)(a1 + 40));
    int v4 = [v3 completionBlock];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3;
    v6[3] = &unk_1E6AFB978;
    id v5 = v4;
    id v7 = v5;
    objc_copyWeak(&v8, &location);
    [v3 setCompletionBlock:v6];
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }
  else
  {
    [v3 noteGestureFinishedBeforeTransactionBegan];
  }
}

void __102__SBLockScreenManager_coverSheetViewController_startSpotlightInteractiveGestureTransactionForGesture___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setSpotlightInteractiveGestureTransaction:0];
    id WeakRetained = v4;
  }
}

- (BOOL)coverSheetViewControllerHasSecureApp:(id)a3
{
  id v3 = +[SBSecureAppManager sharedInstance];
  char v4 = [v3 hasSecureApp];

  return v4;
}

- (BOOL)coverSheetViewControllerIsShowingSecureApp:(id)a3
{
  id v3 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
  char v4 = [v3 isInSecureApp];

  return v4;
}

- (BOOL)coverSheetViewControllerTraitsArbiterOrientationActuationEnabled:(id)a3
{
  return SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet");
}

- (BOOL)coverSheetViewControllerHasBeenDismissedSinceKeybagLock:(id)a3
{
  id v3 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
  char v4 = [v3 hasBeenDismissedSinceKeybagLock];

  return v4;
}

- (BOOL)coverSheetViewControllerShouldPreserveOrientationForExternalTransition:(id)a3
{
  return [(BSCompoundAssertion *)self->_lockScreenPresentationPendingAssertions isActive];
}

- (id)averageColorForCurrentWallpaper
{
  uint64_t v2 = +[SBWallpaperController sharedInstance];
  id v3 = [v2 averageColorForVariant:0];

  return v3;
}

- (id)averageColorForCurrentWallpaperInScreenRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = +[SBWallpaperController sharedInstance];
  id v8 = objc_msgSend(v7, "averageColorInRect:forVariant:", 0, x, y, width, height);

  return v8;
}

- (double)contrastForCurrentWallpaper
{
  uint64_t v2 = +[SBWallpaperController sharedInstance];
  [v2 contrastForVariant:0];
  double v4 = v3;

  return v4;
}

- (id)newLegibilitySettingsProvider
{
  uint64_t v2 = [SBWallpaperLegibilitySettingsProvider alloc];
  return [(SBWallpaperLegibilitySettingsProvider *)v2 initWithVariant:0];
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  double v4 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment idleTimerProvider];
  id v5 = v4;
  if (v4) {
    [v4 coordinatorRequestedIdleTimerBehavior:self];
  }
  else {
  id v6 = +[SBIdleTimerBehavior disabledBehavior];
  }

  return v6;
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  return [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper proposeIdleTimerBehavior:a4 fromProvider:a3 reason:a5];
}

- (void)_wakeScreenForTapToWake
{
  v8[2] = *MEMORY[0x1E4F143B8];
  double v3 = +[SBBacklightController sharedInstance];
  if (([v3 screenIsOn] & 1) == 0)
  {
    kdebug_trace();
    v7[0] = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
    double v4 = [NSNumber numberWithBool:1];
    v7[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
    v8[0] = v4;
    id v5 = [NSNumber numberWithBool:1];
    v8[1] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
    [(SBLockScreenManager *)self unlockUIFromSource:17 withOptions:v6];
  }
}

- (void)motionDetectionWakeController:(id)a3 motionDetectStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4)
  {
    if (!self->_motionDetectionIdleTimerAssertion)
    {
      id v7 = SBLogBacklight();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Disabling idle timer because motion detected", v14, 2u);
      }

      id v8 = +[SBIdleTimerGlobalCoordinator sharedInstanceIfExists];
      int v9 = [v8 acquireIdleTimerDisableAssertionForReason:@"Motion-to-Wake"];
      motionDetectionIdleTimerAssertion = self->_motionDetectionIdleTimerAssertion;
      self->_motionDetectionIdleTimerAssertion = v9;
    }
    id v11 = +[SBBacklightController sharedInstance];
    if (([v11 screenIsOn] & 1) == 0)
    {
      v15[0] = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
      v15[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
      v16[0] = MEMORY[0x1E4F1CC38];
      v16[1] = MEMORY[0x1E4F1CC38];
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      [(SBLockScreenManager *)self unlockUIFromSource:38 withOptions:v12];
    }
  }
  else
  {
    id v13 = SBLogBacklight();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Ending idle timer disabling because no motion detected", v14, 2u);
    }

    [(BSInvalidatable *)self->_motionDetectionIdleTimerAssertion invalidate];
    id v11 = self->_motionDetectionIdleTimerAssertion;
    self->_motionDetectionIdleTimerAssertion = 0;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_mouseButtonDownGesture != a3) {
    return 1;
  }
  id v5 = +[SBBacklightController sharedInstance];
  int v6 = [v5 screenIsOn];
  if (v6)
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "_mouseButtonDownGesture: not receiving touch because screen is already on", v9, 2u);
    }
  }
  char v4 = v6 ^ 1;

  return v4;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  char v4 = (SBSRemoteAlertHandle *)a3;
  id v5 = v4;
  if (self->_alertLaunchFinish && self->_wakeToRemoteAlertHandle == v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SBLockScreenManager_remoteAlertHandleDidActivate___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__SBLockScreenManager_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 152);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)tapToWakeControllerDidRecognizePencilWakeGesture:(id)a3
{
  char v4 = [(SBLockScreenManager *)self coverSheetViewController];
  id v5 = [v4 applicationLauncher];
  [v5 launchQuickNote];

  [(SBLockScreenManager *)self _wakeScreenForTapToWake];
}

- (BOOL)biometricAuthenticationCoordinator:(id)a3 requestsUnlockWithIntent:(int)a4
{
  id v6 = a3;
  if (self->_isUILocked)
  {
    if (a4 == 3)
    {
      if ([(SBLockScreenManager *)self isLockScreenVisible])
      {
        a4 = 3;
      }
      else
      {
        id v8 = SBLogLockScreenBiometricCoordinator();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "Bio authentication request to dismiss denied because the lock-screen isn't currently visible -> swizzling unlock intent to authenticate only.", v11, 2u);
        }

        a4 = 2;
      }
    }
    int v9 = [(SBFUserAuthenticationController *)self->_userAuthController createGracePeriodAssertionWithReason:@"Bio authentication attempt"];
    [v9 activate];
    BOOL v7 = [(SBLockScreenManager *)self _attemptUnlockWithPasscode:0 mesa:1 finishUIUnlock:a4 == 3];
    [v9 invalidate];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)biometricAuthenticationCoordinator:(id)a3 requestsAuthenticationFeedback:(id)a4
{
  id v5 = a4;
  if ([(SBLockScreenManager *)self isLockScreenVisible]) {
    BOOL v6 = ![(SBLockScreenManager *)self _isPasscodeVisible];
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = [MEMORY[0x1E4FA7C68] sharedInstance];
  uint64_t v8 = [v7 biometricLockoutState];

  if (v6)
  {
    int v9 = [(SBLockScreenManager *)self coverSheetViewController];
    if (![v9 phoneUnlockWithWatchEnabled]
      || ![v9 didDetectFaceRequirementsForPAU]
      || v8)
    {
      [(SBLockScreenManager *)self _handleAuthenticationFeedback:v5];
    }
  }
  return v6;
}

- (void)biometricAuthenticationCoordinator:(id)a3 handleIdentityMatchSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SBLockScreenManager *)self coverSheetViewController];
  [v5 completePhoneAutoUnlockWithNotification:!v4];
}

- (BOOL)biometricAuthenticationCoordinatorShouldWaitToInvalidateMatchingAssertion:(id)a3
{
  double v3 = [(SBLockScreenManager *)self coverSheetViewController];
  char v4 = [v3 shouldCompletePhoneAutoUnlockWithNotification];

  return v4;
}

- (void)lostModeBiometricAuthenticationViewControllerDidSucceedAuthentication:(id)a3
{
  [(SBLockScreenManager *)self _dismissLostModeBiometricAuthenticationTransientOverlay];
  [(SBLockScreenManager *)self _dismissLockScreenForAuthenticationIfNecessary];
}

- (void)lostModeBiometricAuthenticationViewControllerDidTapEmergencyButton:(id)a3
{
  [(SBLockScreenManager *)self _relockUIForLostMode];
  id v5 = [(SBLockScreenManager *)self coverSheetViewController];
  char v4 = [MEMORY[0x1E4F5E380] actionWithType:2];
  [v5 handleAction:v4 fromSender:0];
}

- (void)_setSystemApertureProudLockElementVisible:(BOOL)a3 withReason:(id)a4 afterDelay:(double)a5
{
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__SBLockScreenManager__setSystemApertureProudLockElementVisible_withReason_afterDelay___block_invoke;
  v14[3] = &unk_1E6AF5770;
  id v15 = v8;
  uint64_t v16 = self;
  BOOL v17 = a3;
  id v9 = v8;
  id v10 = (void *)MEMORY[0x1D948C7A0](v14);
  id v11 = (NSString *)[v9 copy];
  delayedLockReason = self->_delayedLockReason;
  self->_delayedLockReason = v11;

  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  dispatch_after(v13, MEMORY[0x1E4F14428], v10);
}

void *__87__SBLockScreenManager__setSystemApertureProudLockElementVisible_withReason_afterDelay___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(a1 + 40) + 288)];
  uint64_t result = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    return (void *)[result _setSystemApertureProudLockElementVisible:v4 withReason:v5];
  }
  else if (!result[36])
  {
    BOOL v6 = SBLogSystemApertureLockElement();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "The dismiss reason has changed from reason:%{public}@ to nil", (uint8_t *)&v8, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "_setSystemApertureProudLockElementVisible:withReason:", objc_msgSend(*(id *)(a1 + 40), "_shouldBeShowingLockElement"), @"Collision cleanup");
  }
  return result;
}

- (void)_setSystemApertureProudLockElementVisible:(BOOL)a3 withReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[SBBacklightController sharedInstance];
  -[SBLockScreenManager _setSystemApertureProudLockElementVisible:backlightState:withReason:](self, "_setSystemApertureProudLockElementVisible:backlightState:withReason:", v4, [v7 backlightState], v6);
}

- (void)_setSystemApertureProudLockElementVisible:(BOOL)a3 backlightState:(int64_t)a4 withReason:(id)a5
{
  BOOL v6 = a3;
  id v21 = a5;
  BOOL v8 = +[SBLockElementViewProvider deviceSupportsElement];
  BOOL v9 = [(SBLockScreenManager *)self _requiresEmptyLockElementForBacklightState:a4];
  BOOL v10 = [(SBLockScreenManager *)self _shouldHideLockForElementSuppressionAssertion];
  int v11 = [(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet];
  if (v6)
  {
    if (v8 && v11 | v9 && !v10)
    {
      delayedLockReason = self->_delayedLockReason;
      self->_delayedLockReason = 0;

      if (!self->_proudLockAssertion)
      {
        lockElement = self->_lockElement;
        if (!lockElement)
        {
          uint64_t v14 = objc_alloc_init(SBLockElementViewProvider);
          id v15 = self->_lockElement;
          self->_lockElement = v14;

          lockElement = self->_lockElement;
        }
        [(SBLockElementViewProvider *)lockElement setEmpty:v9];
        [(SBLockElementViewProvider *)self->_lockElement setAuthenticated:[(SBFUserAuthenticationController *)self->_userAuthController isAuthenticatedCached]];
        uint64_t v16 = [(id)SBApp systemApertureControllerForMainDisplay];
        BOOL v17 = [v16 registerElement:self->_lockElement];
        proudLockAssertion = self->_proudLockAssertion;
        self->_proudLockAssertion = v17;

        [(SBLockScreenManager *)self _updateBloomIfNeeded];
      }
    }
  }
  else
  {
    char v19 = self->_delayedLockReason;
    self->_delayedLockReason = 0;

    [(SAInvalidatable *)self->_proudLockAssertion invalidateWithReason:v21];
    char v20 = self->_proudLockAssertion;
    self->_proudLockAssertion = 0;
  }
}

- (void)_cleanupSystemApertureLockElementIfNecessaryWithReason:(id)a3
{
}

- (void)_cleanupSystemApertureLockElementIgnoringDelays:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_proudLockAssertion
    && ![(SBLockScreenManager *)self _shouldBeShowingLockElement])
  {
    if (v4)
    {
      id v7 = SBLogSystemApertureLockElement();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v6;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager dismissed lock element without delay with reason:%{public}@", (uint8_t *)&v9, 0xCu);
      }

      goto LABEL_11;
    }
    if (!self->_delayedLockReason)
    {
LABEL_11:
      self->_ignoringDelayDismissalPending = 0;
      [(SBLockScreenManager *)self _setSystemApertureProudLockElementVisible:0 withReason:v6];
      goto LABEL_12;
    }
    BOOL v8 = SBLogSystemApertureLockElement();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager tried to dismiss aperture forReason:%{public}@ but in delay", (uint8_t *)&v9, 0xCu);
    }
  }
LABEL_12:
}

- (void)_showSystemApertureProudLockElementIfSupportedWithReason:(id)a3
{
  id v4 = a3;
  if ([(SBLockScreenManager *)self _shouldBeShowingLockElement]) {
    [(SBLockScreenManager *)self _setSystemApertureProudLockElementVisible:1 withReason:v4];
  }
}

- (void)_showSystemApertureProudLockElementForBacklightState:(int64_t)a3 WithReason:(id)a4
{
  id v6 = a4;
  if ([(SBLockScreenManager *)self _shouldBeShowingLockElementForBacklightState:a3])
  {
    [(SBLockScreenManager *)self _setSystemApertureProudLockElementVisible:1 backlightState:a3 withReason:v6];
  }
}

- (BOOL)_shouldBeShowingLockElement
{
  double v3 = +[SBBacklightController sharedInstance];
  LOBYTE(self) = -[SBLockScreenManager _shouldBeShowingLockElementForBacklightState:](self, "_shouldBeShowingLockElementForBacklightState:", [v3 backlightState]);

  return (char)self;
}

- (BOOL)_shouldBeShowingLockElementForBacklightState:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SBLockScreenManager *)self isLockScreenActive];
  BOOL v6 = v5;
  int v7 = self->_isUILocked || v5;
  int v8 = [(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated];
  BOOL v9 = [(SBLockScreenManager *)self _requiresEmptyLockElementForBacklightState:a3];
  int v10 = v7 & (v8 ^ 1 | v9);
  if (v10 == 1)
  {
    BOOL v11 = v9;
    uint64_t v12 = SBLogSystemApertureLockElement();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109632;
      v14[1] = v6;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 1024;
      BOOL v18 = v11;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager][Lock Element] should show lock element. lockScreenActive: %{BOOL}u, authed: %{BOOL}u, empty: %{BOOL}u", (uint8_t *)v14, 0x14u);
    }
  }
  return v10;
}

- (BOOL)_requiresEmptyLockElementForBacklightState:(int64_t)a3
{
  int v4 = [(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet] ^ 1;
  if (a3 == 3) {
    return v4;
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldHideLockForElementSuppressionAssertion
{
  uint64_t v3 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  int v4 = [(id)v3 _sbWindowScene];
  BOOL v5 = [v4 ambientPresentationController];
  char v6 = [v5 ambientTransientOverlayIsShowingPasscode];

  LOBYTE(v3) = v6 | [(SBLockScreenManager *)self isPasscodeEntryTransientOverlayVisible];
  return [(SBLockScreenManager *)self _hasValidLockElementSuppressionAssertion] & (v3 ^ 1);
}

- (BOOL)_hasValidLockElementSuppressionAssertion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v2 = self->_lockElementSuppressionAssertions;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isValid", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)homeButtonShowPasscodeRecognizerRequestsPasscodeUIToBeShown:(id)a3
{
  id v4 = a3;
  if (self->_isScreenOn
    && [(SBLockScreenManager *)self isUILocked]
    && ([(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated] & 1) == 0
    && [(SBLockScreenManager *)self isLockScreenVisible]
    && ![(SBLockScreenManager *)self _isPasscodeVisible])
  {
    if ([(SBLockScreenManager *)self _shouldEmulateInterstitialPresentationForAccessibility:1])
    {
      [(SBLockScreenManager *)self _emulateInterstitialPasscodePresentationForAccessibility:1];
    }
    [(SBLockScreenManager *)self _setPasscodeVisible:1 animated:1];
  }
  [(SBLockScreenManager *)self _setHomeButtonShowPasscodeRecognizer:0];
}

- (void)homeButtonShowPasscodeRecognizerDidFailToRecognize:(id)a3
{
}

- (void)_setIdleTimerCoordinator:(id)a3
{
}

- (void)_handleAuthenticationFeedback:(id)a3
{
  id v4 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke;
  v17[3] = &unk_1E6AF5290;
  id v5 = v4;
  id v18 = v5;
  uint64_t v19 = self;
  char v6 = (void (**)(void))MEMORY[0x1D948C7A0](v17);
  if ([v5 vibrate])
  {
    uint64_t v7 = [v5 result];
    long long v8 = [MEMORY[0x1E4FA7C68] sharedInstance];
    int v9 = [v8 hasPearlSupport];
    int v10 = v9;
    if (v7)
    {

      uint64_t v11 = 1001;
      if (v10) {
        uint64_t v11 = 1015;
      }
      goto LABEL_12;
    }
    if (v9)
    {
      int v12 = _AXSPearlAuthenticationHapticsEnabled();

      if (v12)
      {
        uint64_t v11 = 1014;
LABEL_12:
        authenticationFeedbackGenerator = self->_authenticationFeedbackGenerator;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        _DWORD v14[2] = __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke_2;
        v14[3] = &unk_1E6AFF2D8;
        void v14[4] = self;
        uint64_t v16 = v11;
        __int16 v15 = v6;
        [(UINotificationFeedbackGenerator *)authenticationFeedbackGenerator activateWithCompletionBlock:v14];

        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v11 = 1000;
    goto LABEL_12;
  }
  v6[2](v6);
LABEL_13:
}

void __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) jiggleLock])
  {
    int v2 = [*(id *)(*(void *)(a1 + 40) + 32) lockController];
    [v2 jiggleLockIcon];

    [*(id *)(*(void *)(a1 + 40) + 280) shake];
  }
  if ([*(id *)(a1 + 32) showPasscode])
  {
    id v5 = +[SBControlCenterController sharedInstance];
    if ([*(id *)(a1 + 40) isLockScreenVisible] && (objc_msgSend(v5, "isVisible") & 1) == 0)
    {
      uint64_t v3 = *(void **)(a1 + 40);
      id v4 = +[SBBacklightController sharedInstance];
      objc_msgSend(v3, "setPasscodeVisible:animated:", 1, objc_msgSend(v4, "screenIsOn"));
    }
  }
}

void __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = [MEMORY[0x1E4F5E408] rootSettings];
  [v4 lockJiggleHapticDelay];
  double v6 = v5;
  [v4 lockJiggleAnimationDelay];
  double v8 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke_3;
  v13[3] = &unk_1E6AFB0E8;
  char v14 = a2;
  uint64_t v9 = *(void *)(a1 + 48);
  void v13[4] = *(void *)(a1 + 32);
  v13[5] = v9;
  int v10 = (void (**)(void))MEMORY[0x1D948C7A0](v13);
  if (BSFloatIsZero())
  {
    v10[2](v10);
  }
  else
  {
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_after(v11, MEMORY[0x1E4F14428], v10);
  }
  if (BSFloatIsZero())
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    dispatch_after(v12, MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
  }
}

uint64_t __53__SBLockScreenManager__handleAuthenticationFeedback___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(*(void *)(a1 + 32) + 256) _privateNotificationOccurred:*(void *)(a1 + 40)];
  }
  int v2 = *(void **)(*(void *)(a1 + 32) + 256);
  return [v2 deactivate];
}

- (void)_setWalletPreArmDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  *(void *)&v25[5] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BSDispatchQueueAssertMain();
  if (!v7)
  {
    BOOL v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBLockScreenManager.m", 1897, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  double v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v25[0] = v4;
    LOWORD(v25[1]) = 2114;
    *(void *)((char *)&v25[1] + 2) = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager _setWalletPreArmDisabled:%{BOOL}u forReason:%{public}@]", buf, 0x12u);
  }

  mesaWalletPreArmDisabledReasons = self->_mesaWalletPreArmDisabledReasons;
  if (v4)
  {
    if (!mesaWalletPreArmDisabledReasons)
    {
      int v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      dispatch_time_t v11 = self->_mesaWalletPreArmDisabledReasons;
      self->_mesaWalletPreArmDisabledReasons = v10;

      mesaWalletPreArmDisabledReasons = self->_mesaWalletPreArmDisabledReasons;
    }
    if ([(NSMutableSet *)mesaWalletPreArmDisabledReasons containsObject:v7])
    {
      p_super = SBLogCommon();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)double v25 = v7;
        _os_log_impl(&dword_1D85BA000, p_super, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager - Bailing early as we already acquired a wallet pre-arm disabled assertion for reason: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      [(NSMutableSet *)self->_mesaWalletPreArmDisabledReasons addObject:v7];
      uint64_t v16 = [(NSMutableDictionary *)self->_mesaWalletPreArmDisabledAssertions objectForKeyedSubscript:v7];

      if (v16) {
        goto LABEL_20;
      }
      __int16 v17 = SBLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)double v25 = v7;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager - Acquiring a wallet pre-arm disable assertion for reason: %{public}@", buf, 0xCu);
      }

      p_super = [(SBLockScreenBiometricAuthenticationCoordinator *)self->_biometricAuthenticationCoordinator acquireDisableWalletPreArmAssertionForReason:v7];
      if (p_super)
      {
        if ([(NSMutableSet *)self->_mesaWalletPreArmDisabledReasons containsObject:v7])
        {
          mesaWalletPreArmDisabledAssertions = self->_mesaWalletPreArmDisabledAssertions;
          if (!mesaWalletPreArmDisabledAssertions)
          {
            uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            char v20 = self->_mesaWalletPreArmDisabledAssertions;
            self->_mesaWalletPreArmDisabledAssertions = v19;

            mesaWalletPreArmDisabledAssertions = self->_mesaWalletPreArmDisabledAssertions;
          }
          [(NSMutableDictionary *)mesaWalletPreArmDisabledAssertions setObject:p_super forKeyedSubscript:v7];
          id v21 = SBLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)double v25 = v7;
            _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager - Added the wallet pre-arm disable assertion for reason: %{public}@", buf, 0xCu);
          }
        }
        else
        {
          int v22 = SBLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)double v25 = v7;
            _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager - Due to a re-entrant call that re-enabled wallet pre-arm, invalidating a pre-arm disable assertion with reason: %{public}@", buf, 0xCu);
          }

          [p_super invalidate];
        }
      }
    }
    goto LABEL_18;
  }
  if (mesaWalletPreArmDisabledReasons)
  {
    [(NSMutableSet *)mesaWalletPreArmDisabledReasons removeObject:v7];
    if (![(NSMutableSet *)self->_mesaWalletPreArmDisabledReasons count])
    {
      dispatch_time_t v13 = self->_mesaWalletPreArmDisabledReasons;
      self->_mesaWalletPreArmDisabledReasons = 0;
    }
  }
  char v14 = SBLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)double v25 = v7;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "SBLockScreenManager - Removing a wallet pre-arm disable assertion for reason: %{public}@", buf, 0xCu);
  }

  __int16 v15 = [(NSMutableDictionary *)self->_mesaWalletPreArmDisabledAssertions objectForKeyedSubscript:v7];
  [v15 invalidate];

  [(NSMutableDictionary *)self->_mesaWalletPreArmDisabledAssertions removeObjectForKey:v7];
  if (![(NSMutableDictionary *)self->_mesaWalletPreArmDisabledAssertions count])
  {
    p_super = &self->_mesaWalletPreArmDisabledAssertions->super.super;
    self->_mesaWalletPreArmDisabledAssertions = 0;
LABEL_18:
  }
LABEL_20:
}

- (void)_setMesaCoordinatorDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v14 = v7;
  if (!v7)
  {
    dispatch_time_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBLockScreenManager.m", 1953, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v7 = 0;
  }
  double v8 = [(NSMutableDictionary *)self->_mesaCoordinatorDisabledAssertions objectForKeyedSubscript:v7];
  uint64_t v9 = v8;
  if (v4)
  {

    if (v9) {
      goto LABEL_12;
    }
    if (!self->_mesaCoordinatorDisabledAssertions)
    {
      int v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      mesaCoordinatorDisabledAssertions = self->_mesaCoordinatorDisabledAssertions;
      self->_mesaCoordinatorDisabledAssertions = v10;
    }
    dispatch_time_t v12 = [(SBLockScreenBiometricAuthenticationCoordinator *)self->_biometricAuthenticationCoordinator acquireDisableCoordinatorAssertionForReason:v14];
    if (v12) {
      [(NSMutableDictionary *)self->_mesaCoordinatorDisabledAssertions setObject:v12 forKeyedSubscript:v14];
    }
  }
  else
  {
    [v8 invalidate];

    [(NSMutableDictionary *)self->_mesaCoordinatorDisabledAssertions removeObjectForKey:v14];
    if ([(NSMutableDictionary *)self->_mesaCoordinatorDisabledAssertions count]) {
      goto LABEL_12;
    }
    dispatch_time_t v12 = self->_mesaCoordinatorDisabledAssertions;
    self->_mesaCoordinatorDisabledAssertions = 0;
  }

LABEL_12:
}

- (void)_setMesaAutoUnlockingDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  double v6 = [MEMORY[0x1E4FA7C68] sharedInstance];
  char v7 = [v6 hasPearlSupport];

  if ((v7 & 1) == 0) {
    [(SBLockScreenManager *)self setBiometricAutoUnlockingDisabled:v4 forReason:v8];
  }
}

- (void)_activateLockScreenAnimated:(BOOL)a3 animationProvider:(id)a4 automatically:(BOOL)a5 inScreenOffMode:(BOOL)a6 dismissNotificationCenter:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a3;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v12 = a8;
  dispatch_time_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v34 = @"Animated";
  id v14 = [NSNumber numberWithBool:v10];
  v35[0] = v14;
  __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  [v13 postNotificationName:@"SBLockScreenUIWillLockNotification" object:self userInfo:v15];

  uint64_t v16 = +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:0];
  __int16 v17 = v16;
  if (v16)
  {
    int v18 = [v16 incomingCallExists];
    uint64_t v19 = SBLogCommon();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (!v18 || v9)
    {
      if (v20)
      {
        *(_DWORD *)buf = 67109632;
        int v29 = [v17 incomingCallExists];
        __int16 v30 = 1024;
        BOOL v31 = v9;
        __int16 v32 = 1024;
        BOOL v33 = v10;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, "[[SBTelephonyManager sharedTelephonyManager] incomingCallExists] %d autoLock %d animate %d", buf, 0x14u);
      }

      if (!v8) {
        goto LABEL_18;
      }
    }
    else
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, "Disconnecting call", buf, 2u);
      }

      [v17 disconnectIncomingCall];
      if (!v8)
      {
LABEL_18:
        BOOL v23 = [(SBLockScreenManager *)self coverSheetViewController];
        [v23 activateMainPageWithCompletion:0];

        char v24 = +[SBCoverSheetPresentationManager sharedInstance];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __136__SBLockScreenManager__activateLockScreenAnimated_animationProvider_automatically_inScreenOffMode_dismissNotificationCenter_completion___block_invoke;
        v25[3] = &unk_1E6AFCF18;
        v25[4] = self;
        BOOL v27 = v10;
        id v26 = v12;
        [v24 setCoverSheetPresented:1 animated:v10 withCompletion:v25];

        goto LABEL_19;
      }
    }
  }
  else
  {
    id v21 = SBLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_INFO, "Telephony controller not checked in", buf, 2u);
    }

    if (!v8) {
      goto LABEL_18;
    }
  }
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0) {
    [(SBLockScreenOrientationManager *)self->_lockScreenOrientationManager updateInterfaceOrientationWithRequestedOrientation:0 animated:0];
  }
  int v22 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment backlightController];
  [v22 setInScreenOffMode:1];

  if (v12) {
    (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
  }
LABEL_19:
  [(SBLockScreenManager *)self _evaluateWallpaperMode];
}

uint64_t __136__SBLockScreenManager__activateLockScreenAnimated_animationProvider_automatically_inScreenOffMode_dismissNotificationCenter_completion___block_invoke(uint64_t a1)
{
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 376) updateInterfaceOrientationWithRequestedOrientation:0 animated:*(unsigned __int8 *)(a1 + 48)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)_shouldDisconnectCallWhenLockingForActiveAudioRoute
{
  if (+[SBInCallPresentationManager isSpecializedAPISupported])
  {
    return 0;
  }
  uint64_t v3 = +[SBAVSystemControllerCache sharedInstance];
  BOOL v4 = [v3 activeAudioRoute];

  if (v4) {
    char v2 = [v4 isEqual:@"Receiver"];
  }
  else {
    char v2 = 1;
  }

  return v2;
}

- (void)_disconnectActiveCallIfNeededFromSource:(int)a3
{
  BOOL v5 = +[SBInCallPresentationManager isSpecializedAPISupported];
  if (a3 == 3 && !v5)
  {
    double v6 = +[SBConferenceManager sharedInstance];
    if ([v6 inFaceTime])
    {
      char v7 = SBLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Terminating video call due to smart cover closure.", buf, 2u);
      }

      [v6 endFaceTime];
    }
    BOOL v8 = +[SBTelephonyManager sharedTelephonyManager];
    if ([v8 inCall]
      && [(SBLockScreenManager *)self _shouldDisconnectCallWhenLockingForActiveAudioRoute])
    {
      BOOL v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)dispatch_time_t v11 = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "Terminating telephony call due to smart cover closure.", v11, 2u);
      }

      BOOL v10 = +[SBTelephonyManager sharedTelephonyManager];
      [v10 disconnectDisplayedCall];
    }
  }
}

- (void)_relockUIForButtonlikeSource:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(SBLockScreenManager *)self isPasscodeEntryTransientOverlayVisible])
  {
    [(SBLockScreenManager *)self setPasscodeVisible:0 animated:1];
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"SBLockScreenUIRelockedNotification" object:self userInfo:0];

    if (!+[SBInCallPresentationManager isSpecializedAPISupported])[(SBLockScreenManager *)self _disconnectActiveCallIfNeededFromSource:v3]; {
    double v6 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment backlightController];
    }
    [v6 setInScreenOffMode:1];

    if ([(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet])
    {
      userAuthController = self->_userAuthController;
      BOOL v8 = NSStringFromLockSource();
      [(SBFUserAuthenticationController *)userAuthController revokeAuthenticationIfNecessaryForPublicReason:v8];
    }
    if (self->_isInLostMode)
    {
      [(SBLockScreenManager *)self enableLostModePlugin];
    }
  }
}

- (void)_clearAuthenticationLockAssertion
{
  sustainAuthenticationWhileUIUnlockedAssertion = self->_sustainAuthenticationWhileUIUnlockedAssertion;
  if (sustainAuthenticationWhileUIUnlockedAssertion)
  {
    [(SBFAuthenticationAssertion *)sustainAuthenticationWhileUIUnlockedAssertion invalidate];
    BOOL v4 = self->_sustainAuthenticationWhileUIUnlockedAssertion;
    self->_sustainAuthenticationWhileUIUnlockedAssertion = 0;
  }
}

- (void)_createAuthenticationAssertion
{
  if (!self->_sustainAuthenticationWhileUIUnlockedAssertion && self->_allowDisablePasscodeLockAssertion)
  {
    uint64_t v3 = [(SBFUserAuthenticationController *)self->_userAuthController createKeybagUnlockAssertionWithReason:@"UI unlocked"];
    sustainAuthenticationWhileUIUnlockedAssertion = self->_sustainAuthenticationWhileUIUnlockedAssertion;
    self->_sustainAuthenticationWhileUIUnlockedAssertion = v3;

    BOOL v5 = self->_sustainAuthenticationWhileUIUnlockedAssertion;
    [(SBFAuthenticationAssertion *)v5 activate];
  }
}

- (void)_setUILocked:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_allowUILockUnlock)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBLockScreenManager.m" lineNumber:2119 description:@"Attempted to toggle lock state when we don't allow locking/unlocking."];
  }
  [(SBLockScreenManager *)self _reallySetUILocked:v3];
}

- (void)_reallySetUILocked:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  userAuthController = self->_userAuthController;
  if (userAuthController
    && !a3
    && ([(SBFUserAuthenticationController *)userAuthController isAuthenticated] & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBLockScreenManager.m" lineNumber:2125 description:@"Attempt made to UI-unlock while not authenticated"];
  }
  self->_BOOL isUILocked = a3;
  char v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isUILocked = self->_isUILocked;
    v13[0] = 67109120;
    v13[1] = isUILocked;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "UILocked: %d", (uint8_t *)v13, 8u);
  }

  BOOL v9 = [(id)SBApp HIDUISensorController];
  [v9 setPocketTouchesExpected:self->_isUILocked];

  BOOL v10 = +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:1];
  [v10 setFastDormancySuspended:!self->_isUILocked];

  [(SBLockScreenManager *)self _postLockCompletedNotification:self->_isUILocked];
  if (self->_isUILocked)
  {
    [(SBLockScreenManager *)self _setMesaCoordinatorDisabled:0 forReason:@"UI Unlocked"];
  }
  else
  {
    [(SBLockScreenBiometricAuthenticationCoordinator *)self->_biometricAuthenticationCoordinator setAuthenticated:[(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated]];
    [(SBLockScreenManager *)self _setMesaCoordinatorDisabled:1 forReason:@"UI Unlocked"];
    [(SBLockScreenManager *)self _createAuthenticationAssertion];
    if ([(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet]) {
      SBUICurrentPasscodeStyleForUser();
    }
    ADClientSetValueForScalarKey();
  }
  dispatch_time_t v11 = +[SBAlertItemsController sharedInstance];
  [v11 setInUILockedMode:self->_isUILocked];
}

- (void)_lockStateObservers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[(NSHashTable *)self->_lockStateObservers copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "lockStateProvider:didUpdateIsUILocked:", self, 1, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_unlockStateObservers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[(NSHashTable *)self->_lockStateObservers copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "lockStateProvider:didUpdateIsUILocked:", self, 0, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_lockUI
{
  BOOL v3 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  id v4 = [v3 _sbWindowScene];

  uint64_t v5 = [v4 switcherController];
  if ([(SBLockScreenManager *)self isUILocked] && self->_uiHasBeenLockedOnce)
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = [v5 layoutStateApplicationSceneHandles];
    unint64_t v8 = [v7 count];

    if (v8 >= 2)
    {
      long long v9 = +[SBKeyboardSuppressionManager sharedInstance];
      long long v10 = [v5 displayIdentity];
      [v9 startSuppressingKeyboardWithReason:@"SBSuppressKeyboardForUILock" predicate:0 displayIdentity:v10];
    }
    [(SBLockScreenManager *)self _setUILocked:1];
    self->_uiHasBeenLockedOnce = 1;
    [(SBLockScreenManager *)self _sendUILockStateChangedNotification];
    long long v11 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment lockController];
    [v11 prepareForUILock];

    long long v12 = +[SBLockStateAggregator sharedInstance];
    int v13 = [v12 hasAnyLockState];

    if (v13)
    {
      uint64_t v14 = +[SBWorkspace mainWorkspace];
      __int16 v15 = [v14 pipCoordinator];

      [v15 setPictureInPictureWindowsHidden:1 withReason:@"SBLockScreenPictureInPictureHiddenReason"];
    }
    [(SBLockScreenManager *)self _lockStateObservers];
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_sendUILockStateChangedNotification
{
  if ([(SBLockScreenManager *)self isUILocked])
  {
    BOOL v3 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment backlightController];
    int v4 = [v3 shouldDisableALS];

    if (v4) {
      BKSHIDServicesAmbientLightSensorDisableAutoBrightness();
    }
  }
  char v12 = 1;
  SBGetAggregatedLockStatus(&v12, 0);
  if (_sendUILockStateChangedNotification_token != -1
    || (notify_register_check((const char *)*MEMORY[0x1E4FA77B8], &_sendUILockStateChangedNotification_token),
        _sendUILockStateChangedNotification_token != -1))
  {
    uint64_t v5 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SBLockScreenManager__sendUILockStateChangedNotification__block_invoke;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    char v11 = v12;
    dispatch_async(v5, block);
  }
  BOOL v6 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SBLockScreenManager isUILocked](self, "isUILocked"));
  unint64_t v8 = [v6 dictionaryWithObject:v7 forKey:*MEMORY[0x1E4FA7B08]];

  long long v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:*MEMORY[0x1E4FA7A38] object:0 userInfo:v8];
}

uint64_t __58__SBLockScreenManager__sendUILockStateChangedNotification__block_invoke(uint64_t a1)
{
  notify_set_state(_sendUILockStateChangedNotification_token, *(unsigned __int8 *)(a1 + 32));
  uint64_t v1 = (const char *)*MEMORY[0x1E4FA77B8];
  return notify_post(v1);
}

- (BOOL)_canAttemptRealUIUnlockIgnoringBacklightNonsenseWithReason:(id *)a3
{
  if ([(SBFLockOutStatusProvider *)self->_lockOutController isBlocked])
  {
    uint64_t v5 = @"Device is blocked";
  }
  else
  {
    if (self->_allowUILockUnlock) {
      return 1;
    }
    uint64_t v5 = @"Global 'allow UIUnlock' flag is set to NO";
  }
  BOOL result = 0;
  *a3 = v5;
  return result;
}

- (void)requestUserAttentionScreenWakeFromSource:(int)a3 reason:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v7 = NSStringFromUnlockSource();
  if (![(id)SBApp caseIsEnabledAndLatched])
  {
    unint64_t v8 = +[SBBacklightController sharedInstance];
    unint64_t v9 = [v8 backlightState];
    if (v9 >= 3)
    {
      if (v9 - 3 >= 2) {
        goto LABEL_17;
      }
      BOOL v14 = [(SBLockScreenManager *)self isLockScreenActive];
      char v12 = SBLogCommon();
      BOOL v15 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v15)
        {
          uint64_t v16 = SBBacklightStateDescription(v9);
          *(_DWORD *)buf = 138543874;
          uint64_t v19 = v7;
          __int16 v20 = 2114;
          id v21 = v6;
          __int16 v22 = 2114;
          BOOL v23 = v16;
          _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "requestUserAttentionScreenWakeFromSource:%{public}@ (%{public}@) state:%{public}@ unlockUI", buf, 0x20u);
        }
        id v26 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
        v27[0] = MEMORY[0x1E4F1CC38];
        char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
        [(SBLockScreenManager *)self unlockUIFromSource:v4 withOptions:v12];
        goto LABEL_16;
      }
      if (!v15)
      {
LABEL_16:

        goto LABEL_17;
      }
      int v13 = SBBacklightStateDescription(v9);
      __int16 v17 = SBSBacklightChangeSourceDescription([v8 lastBacklightChangeSource]);
      *(_DWORD *)buf = 138544130;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      id v21 = v6;
      __int16 v22 = 2114;
      BOOL v23 = v13;
      __int16 v24 = 2114;
      double v25 = v17;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "requestUserAttentionScreenWakeFromSource:%{public}@ (%{public}@) state:%{public}@ -- ignoring because screen is off, but UILocked is zero. Last known backlight change source:%{public}@.", buf, 0x2Au);
    }
    else
    {
      long long v10 = SBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        char v11 = SBBacklightStateDescription(v9);
        *(_DWORD *)buf = 138543874;
        uint64_t v19 = v7;
        __int16 v20 = 2114;
        id v21 = v6;
        __int16 v22 = 2114;
        BOOL v23 = v11;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "requestUserAttentionScreenWakeFromSource:%{public}@ (%{public}@) state:%{public}@ resetIdleTimer", buf, 0x20u);
      }
      char v12 = +[SBIdleTimerGlobalCoordinator sharedInstance];
      int v13 = [NSString stringWithFormat:@"UserAttentionScreenWake|%@|", v7, v6];
      [v12 resetIdleTimerForReason:v13];
    }

    goto LABEL_16;
  }
  unint64_t v8 = SBLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "requestUserAttentionScreenWakeFromSource:%{public}@ (%{public}@) -- ignoring because smart cover is closed", buf, 0x16u);
  }
LABEL_17:
}

- (BOOL)_shouldReactivateInCallWakingTheDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = +[SBTelephonyManager sharedTelephonyManager];
  char v5 = 0;
  if (!+[SBInCallPresentationManager isSpecializedAPISupported]&& v3)
  {
    if ([v4 inCall]) {
      char v5 = [v4 isEndpointOnCurrentDevice];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (BOOL)_shouldWakeToInCallForUnlockSource:(int)a3 wakingTheDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  BOOL v6 = +[SBInCallPresentationManager isSpecializedAPISupported];
  if (v6)
  {
    uint64_t v7 = +[SBWorkspace mainWorkspace];
    unint64_t v8 = [v7 inCallPresentationManager];

    char v9 = [v8 supportsBecomingVisibleWhenUnlockingFromSource:v5 wakingDisplay:v4];
    LOBYTE(v6) = v9;
  }
  return v6;
}

- (BOOL)_shouldWakeToOtherContentForUnlockSource:(int)a3 wakingTheDisplay:(BOOL)a4 stopAfterWakeTo:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  unint64_t v8 = +[SBTelephonyManager sharedTelephonyManager];
  BOOL v9 = [(SBLockScreenManager *)self _shouldReactivateInCallWakingTheDisplay:v6];
  if ([v8 incomingCallExists])
  {
    char v10 = 0;
  }
  else
  {
    char v11 = [v8 outgoingCallExists];
    char v10 = 0;
    if ((v6 || v5) && !v9 && (v11 & 1) == 0)
    {
      char v12 = +[SBSecureAppManager sharedInstance];
      char v10 = [v12 hasWakeDestination];
    }
  }

  return v10;
}

- (BOOL)unlockUIFromSource:(int)a3 withOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v104 = a4;
  if (self->_allowUILockUnlock)
  {
    os_log_t oslog = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment screenWakeAnimationTarget];
    v102 = +[SBBacklightController sharedInstance];
    v100 = +[SBScreenWakeAnimationController sharedInstance];
    id v97 = +[SBSecureAppManager sharedInstance];
    int v101 = [v102 screenIsOn];
    if (+[SBBacklightPlatformProvider deviceSupportsAlwaysOn])
    {
      unsigned __int8 v96 = [(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet] ^ 1;
    }
    else
    {
      unsigned __int8 v96 = 0;
    }
    unint64_t v8 = [v104 objectForKey:@"SBUIUnlockOptionsSuppressingWakeToKey"];
    unsigned __int8 v95 = [v8 BOOLValue];

    BOOL v9 = [v104 objectForKey:@"SBUIUnlockOptionsOnlyWakeToActionsKey"];
    unsigned int v99 = [v9 BOOLValue];

    char v10 = [v104 objectForKey:@"SBUIUnlockOptionsNoBacklightChangesKey"];
    int v11 = [v10 BOOLValue];

    char v12 = [v104 objectForKey:@"SBUIUnlockOptionsTurnOnScreenFirstKey"];
    int v98 = [v12 BOOLValue];

    int v13 = [v104 objectForKey:@"SBUIUnlockOptionsStartFadeInAnimation"];
    int v91 = [v13 BOOLValue];

    unsigned int v93 = [v102 shouldTurnOnScreenForBacklightSource:SBUIConvertUnlockSourceToBacklightChangeSource()] & (v11 ^ 1);
    uint64_t v14 = (v101 ^ 1) & v98 & v93;
    BOOL v15 = [(SBLockScreenManager *)self _shouldReactivateInCallWakingTheDisplay:v14];
    BOOL v16 = [(SBLockScreenManager *)self _shouldWakeToOtherContentForUnlockSource:v4 wakingTheDisplay:v14 stopAfterWakeTo:v99];
    if ([v100 isSleepAnimationInProgress]) {
      int v92 = 1;
    }
    else {
      int v92 = [v100 isWakeAnimationInProgress];
    }
    __int16 v17 = [v104 objectForKey:@"SBUIUnlockOptionsRequestedOrientationKey"];
    uint64_t v94 = [v17 unsignedIntegerValue];

    if ((v101 & 1) == 0
      && [(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet])
    {
      [(SBLockScreenManager *)self _setSystemApertureProudLockElementVisible:1 withReason:@"Screen On"];
    }
    int v18 = [(SBLockScreenManager *)self coverSheetViewController];
    [v18 respondToUIUnlockFromSource:v4];

    uint64_t v19 = SBLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = NSStringFromUnlockSource();
      id v21 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v104];
      __int16 v22 = BSDeviceOrientationDescription();
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 1024;
      int v132 = v101 ^ 1;
      __int16 v133 = 2114;
      v134 = v22;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "unlockUIFromSource:%{public}@ options:(%{public}@) screenWasOff:%{BOOL}u requestedOrientation:%{public}@", buf, 0x26u);
    }
    if (v15)
    {
      BOOL v23 = +[SBWorkspace mainWorkspace];
      __int16 v24 = [v23 inCallPresentationManager];
      [v24 reactivateInCallForReason:2];
    }
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke;
    v127[3] = &unk_1E6B0E6E0;
    char v129 = v95 | v96;
    v127[4] = self;
    int v128 = v4;
    char v130 = v14;
    double v25 = (unsigned int (**)(void))MEMORY[0x1D948C7A0](v127);
    if (v25[2]())
    {
      if (v4 == 32) {
        id v26 = [[SBSpuriousScreenUndimmingAssertion alloc] initWithIdentifier:@"SBLockScreenManagerWakeToInactivePhone"];
      }
      else {
        id v26 = 0;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      LOBYTE(v132) = 0;
      objc_initWeak(&location, self);
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_2;
      v120[3] = &unk_1E6B0E708;
      v123 = buf;
      int v34 = v26;
      v121 = v34;
      objc_copyWeak(&v124, &location);
      id v122 = v104;
      int v125 = v4;
      uint64_t v35 = (void *)MEMORY[0x1D948C7A0](v120);
      v36 = +[SBWorkspace mainWorkspace];
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_3;
      v117[3] = &unk_1E6B0E750;
      int v119 = v4;
      id v37 = v35;
      id v118 = v37;
      v115[0] = MEMORY[0x1E4F143A8];
      v115[1] = 3221225472;
      v115[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_7;
      v115[3] = &unk_1E6AF5688;
      v116 = v25;
      [v36 requestTransitionWithOptions:0 builder:v117 validator:v115];

      dispatch_time_t v38 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_8;
      block[3] = &unk_1E6AF5300;
      id v39 = v37;
      id v114 = v39;
      dispatch_after(v38, MEMORY[0x1E4F14428], block);
      BOOL v40 = SBLogCommon();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v112 = 0;
        _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "Delaying unlockUIFromSource call to wake to InCall.", v112, 2u);
      }

      objc_destroyWeak(&v124);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      goto LABEL_73;
    }
    if (!v16 || ((v95 | v96) & 1) != 0)
    {
LABEL_42:
      if (v99)
      {
        uint64_t v51 = SBLogCommon();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v51, OS_LOG_TYPE_DEFAULT, "Aborting unlockUIFromSource after completing wake actions, as requested", buf, 2u);
        }

        [oslog updateWakeEffectsForWake:1];
        goto LABEL_73;
      }
      int v52 = [(SBFLockOutStatusProvider *)self->_lockOutController isLockedOut];
      BOOL v53 = [(SBLockScreenAutoUnlockAggregateRule *)self->_autoUnlockRuleAggregator shouldAutoUnlockForSource:v4];
      int v54 = v53 & ~v52;
      if ((v98 & v93) != 1)
      {
LABEL_53:
        if (((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") | v98 ^ 1 | v101 | v92) & 1) == 0) {
          [(SBLockScreenOrientationManager *)self->_lockScreenOrientationManager updateInterfaceOrientationWithRequestedOrientation:v94 animated:0];
        }
        if (v54)
        {
          uint64_t v56 = 1;
        }
        else
        {
          v57 = [v104 objectForKey:@"SBUIUnlockOptionsNoPasscodeAnimationKey"];
          int v58 = [v57 BOOLValue];

          uint64_t v56 = v58 ^ 1u;
        }
        if (v4 == 15)
        {
          uint64_t v59 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment buttonObserver];
          [v59 noteMenuButtonDown];

          uint64_t v60 = [(id)SBApp homeHardwareButton];
          v105[0] = MEMORY[0x1E4F143A8];
          v105[1] = 3221225472;
          v105[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_352;
          v105[3] = &unk_1E6AF4AC0;
          v105[4] = self;
          [v60 performAfterMenuButtonUpIsHandledUsingBlock:v105];
        }
        if ((v98 & v93) != 0)
        {
          if ([(SBLockScreenManager *)self isUILocked] & (!v53 | v52))
          {
            v61 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment backlightController];
            int v62 = [v61 isInScreenOffMode];

            if (v62)
            {
              v63 = [(id)SBApp statusBarStateAggregator];
              [v63 sendStatusBarActions:9];
              v64 = +[SBVideoOutController sharedInstance];
              [v64 updateScreenSharingBackgroundActivityAssertion];
            }
          }
          id v65 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment backlightController];
          [v65 setInScreenOffMode:0 forAutoUnlock:v53 fromUnlockSource:v4];
        }
        if (!(v98 ^ 1 | v53 & v93))
        {
          unsigned int v67 = SBLogCommon();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109632;
            *(_DWORD *)&uint8_t buf[4] = 1;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v53;
            *(_WORD *)&buf[14] = 1024;
            *(_DWORD *)&uint8_t buf[16] = v93;
            _os_log_impl(&dword_1D85BA000, v67, OS_LOG_TYPE_DEFAULT, "Bailing from UIUnlock because: turnOnScreenFirst = %d; autoUnlock = %d; shouldTurnOnScreen = %d",
              buf,
              0x14u);
          }

          goto LABEL_73;
        }
        if ([(SBLockScreenManager *)self _isUnlockDisabled])
        {
          uint64_t v66 = SBLogCommon();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v66, OS_LOG_TYPE_DEFAULT, "Ignoring unlock attempt because unlock is disabled.", buf, 2u);
          }

          goto LABEL_73;
        }
        unlockRequest = self->_unlockRequest;
        if (!unlockRequest || [(SBLockScreenUnlockRequest *)unlockRequest intent] != 2)
        {
          id v70 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment lockController];
          char v71 = [v70 willUIUnlockFromSource:v4];

          if ((v71 & 1) == 0)
          {
            id v77 = SBLogCommon();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              v78 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment lockController];
              v79 = (objc_class *)objc_opt_class();
              id v80 = NSStringFromClass(v79);
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v80;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v4;
              _os_log_impl(&dword_1D85BA000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ said it can't UI-unlock for source %d", buf, 0x12u);
            }
            id v81 = [(SBLockScreenManager *)self coverSheetViewController];
            int v7 = [v81 externalLockProvidersShowPasscode];

            if (v7)
            {
              LOBYTE(v7) = 0;
              self->_saveUnlockRequest = 1;
            }
            goto LABEL_74;
          }
        }
        if (v101)
        {
          p_userAuthController = &self->_userAuthController;
          int v73 = [(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated];
          char v74 = v73;
          if (v73 | !v53)
          {
            int v75 = [(SBFUserAuthenticationController *)*p_userAuthController isAuthenticated];
            int v76 = 0;
            if (v74)
            {
              int v54 = 1;
LABEL_96:
              if (v54 && v75)
              {
                BOOL v85 = [(SBLockScreenManager *)self _finishUIUnlockFromSource:v4 withOptions:v104];
              }
              else
              {
                if (!v76) {
                  goto LABEL_73;
                }
                if ([(SBLockScreenManager *)self _isPasscodeVisible])
                {
                  LOBYTE(v7) = 1;
                  goto LABEL_74;
                }
                if ([(SBLockScreenManager *)self _isPasscodeVisible]) {
                  goto LABEL_73;
                }
                if (v4 == 15)
                {
                  long long v86 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment buttonObserver];
                  uint64_t v87 = [v86 createHomeButtonShowPasscodeRecognizerForHomeButtonPress];

                  if (v87)
                  {
                    [(SBLockScreenManager *)self _setHomeButtonShowPasscodeRecognizer:v87];

LABEL_73:
                    LOBYTE(v7) = 0;
LABEL_74:

                    goto LABEL_75;
                  }
                }
                long long v88 = [v104 objectForKey:@"SBUIUnlockOptionsSimulateSwipeToUnlock"];
                int v89 = [v88 BOOLValue];

                if (v89
                  && [(SBLockScreenManager *)self _shouldEmulateInterstitialPresentationForAccessibility:0])
                {
                  [(SBLockScreenManager *)self _emulateInterstitialPasscodePresentationForAccessibility:0];
                  long long v90 = +[SBWallpaperController sharedInstance];
                  [v90 updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:1];
                }
                BOOL v85 = [(SBLockScreenManager *)self _setPasscodeVisible:1 animated:v56];
              }
              LOBYTE(v7) = v85;
              goto LABEL_74;
            }
            int v54 = 0;
          }
          else
          {
            long long v84 = [MEMORY[0x1E4F5E408] rootSettings];
            int v54 = [v84 autoDismissUnlockedLockScreen];

            int v75 = [(SBFUserAuthenticationController *)*p_userAuthController isAuthenticated];
          }
        }
        else
        {
          uint64_t v82 = [MEMORY[0x1E4FA7C68] sharedInstance];
          BOOL v83 = [v82 hasBiometricAuthenticationCapabilityEnabled]
             && [v82 biometricLockoutState]
             && [v82 biometricLockoutState] != 1;

          p_userAuthController = &self->_userAuthController;
          int v75 = [(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated];
          if (!v83)
          {
            int v76 = 0;
            goto LABEL_96;
          }
        }
        int v76 = [(SBFUserAuthenticationController *)*p_userAuthController hasPasscodeSet] & (v75 ^ 1);
        goto LABEL_96;
      }
      if (((v91 ^ 1 | v54) & 1) == 0)
      {
        if ([(SBLockScreenManager *)self isLockScreenActive])
        {
          BOOL v55 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment backlightController];
          [v55 startLockScreenFadeInAnimationForSource:v4];

LABEL_52:
          [v102 turnOnScreenFullyWithBacklightSource:SBUIConvertUnlockSourceToBacklightChangeSource()];
          goto LABEL_53;
        }
        if (![v100 interruptSleepAnimationIfNeeded]) {
          goto LABEL_52;
        }
      }
      [oslog updateWakeEffectsForWake:1];
      goto LABEL_52;
    }
    BOOL v27 = [v97 wakeDestination];
    if ([v27 type] == 1)
    {
      char v28 = +[SBCoverSheetPresentationManager sharedInstance];
      [v28 setCoverSheetPresented:0 animated:0 withCompletion:0];

      if (![(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated])goto LABEL_41; {
      int v29 = [(SBLockScreenManager *)self coverSheetViewController];
      }
      char v30 = [v29 externalLockProvidersRequireUnlock];

      if (v30) {
        goto LABEL_41;
      }
      BOOL v31 = +[SBApplicationController sharedInstance];
      __int16 v32 = [v27 identifier];
      BOOL v33 = [v31 applicationWithBundleIdentifier:v32];

      SBWorkspaceActivateApplication(v33);
    }
    else
    {
      uint64_t v41 = [v27 type];
      if (v4 != 10 && v41 == 2)
      {
        if (!self->_alertLaunchFinish)
        {
          id v42 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
          [v42 setReason:*MEMORY[0x1E4FA7168]];
          objc_initWeak((id *)buf, self);
          v108[0] = MEMORY[0x1E4F143A8];
          v108[1] = 3221225472;
          v108[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_349;
          v108[3] = &unk_1E6B08158;
          objc_copyWeak(&v110, (id *)buf);
          id v109 = v104;
          int v111 = v4;
          id v43 = (void *)[v108 copy];
          id alertLaunchFinish = self->_alertLaunchFinish;
          self->_id alertLaunchFinish = v43;

          v45 = (void *)MEMORY[0x1E4FA6BC8];
          v46 = [v27 remoteAlertDefinition];
          uint64_t v47 = (SBSRemoteAlertHandle *)[v45 newHandleWithDefinition:v46 configurationContext:0];
          wakeToRemoteAlertHandle = self->_wakeToRemoteAlertHandle;
          self->_wakeToRemoteAlertHandle = v47;

          [(SBSRemoteAlertHandle *)self->_wakeToRemoteAlertHandle registerObserver:self];
          dispatch_time_t v49 = dispatch_time(0, 500000000);
          v106[0] = MEMORY[0x1E4F143A8];
          v106[1] = 3221225472;
          v106[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_2_351;
          v106[3] = &unk_1E6AF4B10;
          objc_copyWeak(&v107, (id *)buf);
          dispatch_after(v49, MEMORY[0x1E4F14428], v106);
          [(SBSRemoteAlertHandle *)self->_wakeToRemoteAlertHandle activateWithContext:v42];
          objc_destroyWeak(&v107);

          objc_destroyWeak(&v110);
          objc_destroyWeak((id *)buf);
        }
        [oslog updateWakeEffectsForWake:1];
        v50 = SBLogCommon();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v50, OS_LOG_TYPE_DEFAULT, "Delaying unlockUIFromSource call to wake to remote alert.", buf, 2u);
        }

        goto LABEL_73;
      }
      if ([v27 type] != 3) {
        goto LABEL_41;
      }
      BOOL v33 = [v27 wakeHandler];
      [v33 wakeToContentForWakeDestination:v27 unlockSource:v4];
    }

LABEL_41:
    [oslog updateWakeEffectsForWake:1];

    goto LABEL_42;
  }
  SBLogCommon();
  os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = NSStringFromUnlockSource();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1D85BA000, oslog, OS_LOG_TYPE_DEFAULT, "unlockUIFromSource:%{public}@ Ignoring unlock attempt because we're still initializing ourselves at startup and we're not ready for this yet.", buf, 0xCu);
  }
  LOBYTE(v7) = 0;
LABEL_75:

  return v7;
}

uint64_t __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 44)) {
    return 0;
  }
  else {
    return [*(id *)(a1 + 32) _shouldWakeToInCallForUnlockSource:*(unsigned int *)(a1 + 40) wakingTheDisplay:*(unsigned __int8 *)(a1 + 45)];
  }
}

void __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    [*(id *)(a1 + 32) invalidate];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    BOOL v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"SBUIUnlockOptionsSuppressingWakeToKey"];
    [WeakRetained unlockUIFromSource:*(unsigned int *)(a1 + 64) withOptions:v3];
  }
}

void __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransactionProvider:&__block_literal_global_344];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_5;
  v7[3] = &__block_descriptor_36_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  int v8 = *(_DWORD *)(a1 + 40);
  [v3 modifyApplicationContext:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_6;
  v5[3] = &unk_1E6AF5A50;
  id v6 = *(id *)(a1 + 32);
  id v4 = (id)[v3 addCompletionHandler:v5];
}

SBWakeToInCallWorkspaceTransaction *__54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(SBMainWorkspaceTransaction *)[SBWakeToInCallWorkspaceTransaction alloc] initWithTransitionRequest:v2];

  return v3;
}

uint64_t __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setRetainsSiri:*(_DWORD *)(a1 + 32) == 12];
}

uint64_t __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_349(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained[18])
  {
    id v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
    [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SBUIUnlockOptionsSuppressingWakeToKey"];
    [WeakRetained unlockUIFromSource:*(unsigned int *)(a1 + 48) withOptions:v2];
    id v3 = (void *)WeakRetained[18];
    WeakRetained[18] = 0;

    id v4 = (void *)WeakRetained[19];
    WeakRetained[19] = 0;
  }
}

void __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_2_351(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained[19])
  {
    id v2 = WeakRetained;
    [WeakRetained[18] invalidate];
    (*((void (**)(void))v2[19] + 2))();
    id WeakRetained = v2;
  }
}

void __54__SBLockScreenManager_unlockUIFromSource_withOptions___block_invoke_352(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 32) buttonObserver];
  [v1 noteMenuButtonUp];
}

- (BOOL)_finishUIUnlockFromSource:(int)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  char v10 = (void (**)(id, void))a5;
  int v11 = SBLogScreenWake();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = NSStringFromUnlockSource();
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = v12;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "_finishUIUnlockFromSource: %{public}@", buf, 0xCu);
  }
  if ([(SBFLockOutStatusProvider *)self->_lockOutController isBlocked])
  {
    int v13 = SBLogScreenWake();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Bailing out of _finishUIUnlockFromSource because the device is blocked.", buf, 2u);
    }

    if (!v10) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (([(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated] & 1) == 0)
  {
    uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"SBLockScreenManager.m" lineNumber:2617 description:@"the new lock screen expects user authentication before unlock can happen"];
  }
  uint64_t v14 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment lockController];
  int v15 = [v14 canBeDeactivatedForUIUnlockFromSource:v6];

  if (!v15)
  {
    char v30 = SBLogScreenWake();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_DEFAULT, "Lock screen REFUSED to be deactivated! NOT unlocking.", buf, 2u);
    }

    if (!v10) {
      goto LABEL_25;
    }
LABEL_24:
    v10[2](v10, 0);
LABEL_25:
    BOOL v31 = 0;
    goto LABEL_28;
  }
  BOOL v16 = [(SBLockScreenUnlockRequest *)self->_unlockRequest destinationApplication];
  BOOL v17 = v16 == 0;

  int v18 = [(SBLockScreenUnlockRequest *)self->_unlockRequest source];
  uint64_t v19 = 1;
  if (v18 != 34) {
    uint64_t v19 = 2;
  }
  if (v17) {
    __int16 v20 = 0;
  }
  else {
    __int16 v20 = (void *)v19;
  }
  if (v6 == 33)
  {
    id v21 = +[SBWallpaperController sharedInstance];
    [v21 updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:1];
  }
  uint64_t v22 = (v6 > 0x29) | ((0x1FFFFFFDFF7uLL >> v6) & 1);
  BOOL v23 = self->_unlockRequest;
  __int16 v24 = v23;
  if ((v20 & 1) != 0 && v23)
  {
    double v25 = [(SBLockScreenUnlockRequest *)v23 destinationApplication];
    id v26 = [v25 bundleIdentifier];

    BOOL v27 = [[SBCaptureApplicationLaunchRequest alloc] initWithCaptureApplicationBundleIdentifier:v26];
    [(SBCaptureApplicationLaunchRequest *)v27 setLaunchType:0];
    char v28 = [(SBLockScreenUnlockRequest *)v24 launchActions];
    [(SBCaptureApplicationLaunchRequest *)v27 setLaunchActions:v28];

    [(SBCaptureApplicationLaunchRequest *)v27 setPrewarmCamera:1];
    objc_initWeak((id *)buf, self);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke;
    v39[3] = &unk_1E6B0E7A0;
    id v29 = v26;
    id v40 = v29;
    uint64_t v41 = self;
    char v44 = v22;
    v43[1] = v20;
    objc_copyWeak(v43, (id *)buf);
    id v42 = v10;
    char v45 = v15;
    [(SBCaptureApplicationLaunchRequest *)v27 setCompletionBlock:v39];
    objc_storeStrong((id *)&self->_captureApplicationLaunchRequest, v27);
    [(SBCaptureApplicationLaunchRequest *)v27 initiate];

    objc_destroyWeak(v43);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v32 = +[SBCoverSheetPresentationManager sharedInstance];
    [v32 willUIUnlockWithPendingUnlockRequest:self->_unlockRequest != 0];

    BOOL v33 = +[SBCoverSheetPresentationManager sharedInstance];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_2;
    v36[3] = &unk_1E6AF7218;
    id v37 = v10;
    char v38 = v15;
    [v33 setCoverSheetPresented:0 animated:v22 options:v20 withCompletion:v36];

    id v29 = v37;
  }

  BOOL v31 = 1;
LABEL_28:

  return v31;
}

void __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_cold_1(a1, v3, v4);
    }
  }
  BOOL v5 = +[SBCoverSheetPresentationManager sharedInstance];
  [v5 willUIUnlockWithPendingUnlockRequest:*(void *)(*(void *)(a1 + 40) + 72) != 0];

  uint64_t v6 = +[SBCoverSheetPresentationManager sharedInstance];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_358;
  v9[3] = &unk_1E6B0E778;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 48);
  char v12 = *(unsigned char *)(a1 + 73);
  [v6 setCoverSheetPresented:0 animated:v7 options:v8 withCompletion:v9];

  objc_destroyWeak(&v11);
}

void __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_358(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 48));
  }
  id v3 = (void *)WeakRetained[45];
  WeakRetained[45] = 0;
}

uint64_t __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (BOOL)_finishUIUnlockFromSource:(int)a3 withOptions:(id)a4
{
  return [(SBLockScreenManager *)self _finishUIUnlockFromSource:*(void *)&a3 withOptions:a4 completion:0];
}

- (void)addLockScreenDisableAssertion:(id)a3
{
}

- (void)removeLockScreenDisableAssertion:(id)a3
{
}

- (BOOL)isLockScreenDisabledForAssertion
{
  return [(SBLockScreenDisabledAssertionManager *)self->_lockScreenDisabledAssertionManager isLockScreenDisabledForAssertion];
}

- (BOOL)_isUnlockDisabled
{
  if ([(SBFLockOutStatusProvider *)self->_lockOutController isBlocked]) {
    return 1;
  }
  id v4 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment lockController];
  char v5 = [v4 isUnlockDisabled];

  return v5;
}

- (BOOL)_setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a3)
  {
    self->_presentedPasscodeWhileUILocking = 0;
    [(SBLockScreenManager *)self _setMesaAutoUnlockingDisabled:a3 forReason:@"SBApplicationRequestedDeviceUnlock"];
    uint64_t v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager][Lock Element] hiding passcode is about to update bloom, oddly enough...", buf, 2u);
    }

    [(SBLockScreenManager *)self _updateBloomIfNeeded];
    if (self->_passcodeEntryTransientOverlayViewController)
    {
      uint64_t v8 = +[SBWorkspace mainWorkspace];
      [v8 dismissTransientOverlayViewController:self->_passcodeEntryTransientOverlayViewController animated:v4 completion:0];

      passcodeEntryTransientOverlayViewController = self->_passcodeEntryTransientOverlayViewController;
      self->_passcodeEntryTransientOverlayViewController = 0;

      [(SBLockScreenManager *)self reevaluateSystemApertureLockElementSuppressionWithReason:@"Transient Passcode dismissed"];
    }
    id v10 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment passcodeViewPresenter];
    [v10 setPasscodeLockVisible:0 animated:v4 completion:0];

    self->_handlingUnlockRequest = 0;
    [(SBLockScreenManager *)self _runUnlockActionBlock:0];
    goto LABEL_49;
  }
  if (![(SBLockScreenManager *)self _isUnlockDisabled])
  {
    if (([(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet] & 1) == 0)
    {
      BOOL v6 = 1;
      [(SBLockScreenManager *)self _runUnlockActionBlock:1];
      return v6;
    }
    id v11 = [(SBLockScreenManager *)self coverSheetViewController];
    [v11 attemptPhoneUnlockWithWatch];

    [(SBLockScreenManager *)self _setMesaAutoUnlockingDisabled:1 forReason:@"SBApplicationRequestedDeviceUnlock"];
    if ([(SBLockScreenManager *)self isUILocked])
    {
      char v12 = +[SBWorkspace mainWorkspace];
      int v13 = [v12 transientOverlayPresentationManager];
      int v14 = [v13 hasActivePresentation];
    }
    else
    {
      int v14 = 0;
    }
    int v15 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
    BOOL v16 = [v15 _sbWindowScene];

    BOOL v53 = v16;
    if ([(SBLockScreenManager *)self isUILocked])
    {
      BOOL v17 = [v16 assistantController];
      int v18 = [v17 presentationContext];
      BOOL v19 = [v18 modality] == 3;
    }
    else
    {
      BOOL v19 = 0;
    }
    __int16 v20 = [(id)SBApp notificationDispatcher];
    id v21 = [v20 bannerDestination];

    uint64_t v22 = [(id)SBApp notificationDispatcher];
    BOOL v23 = [v22 dashBoardDestination];

    int v52 = v21;
    if ([v21 isPresentingBannerInLongLook]) {
      char v24 = 1;
    }
    else {
      char v24 = [v23 isPresentingNotificationInLongLook];
    }
    double v25 = +[SBCoverSheetPresentationManager sharedInstance];
    char v26 = [v25 isCoverSheetHostingAnApp];

    BOOL v27 = [(SBLockScreenManager *)self coverSheetViewController];
    uint64_t v28 = [v27 _passcodePresentationMode];

    BOOL v29 = 1;
    if (((v14 | v19) & 1) == 0
      && (v24 & 1) == 0
      && ![(SBLockScreenUnlockRequest *)self->_unlockRequest forceAlertAuthenticationUI]
      && [(SBLockScreenUnlockRequest *)self->_unlockRequest source] != 9
      && [(SBLockScreenUnlockRequest *)self->_unlockRequest source] != 4
      && [(SBLockScreenUnlockRequest *)self->_unlockRequest source] != 26)
    {
      char v30 = [(SBLockScreenUnlockRequest *)self->_unlockRequest source] == 34 ? 1 : v26;
      if ((v30 & 1) == 0) {
        BOOL v29 = [(SBLockScreenManager *)self _specifiesTransientPresentationForMode:v28];
      }
    }
    BOOL v31 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment customActionStore];
    __int16 v32 = [v31 _customLockScreenActionContext];

    BOOL v33 = [(SBLockScreenManager *)self isLockScreenActive];
    BOOL v34 = v33;
    if (v29 || !v33)
    {
      if (!self->_passcodeEntryTransientOverlayViewController)
      {
        v36 = [SBPasscodeEntryTransientOverlayViewController alloc];
        id v37 = [(id)SBApp authenticationController];
        char v38 = [(SBPasscodeEntryTransientOverlayViewController *)v36 initWithAuthenticationController:v37];
        id v39 = self->_passcodeEntryTransientOverlayViewController;
        self->_passcodeEntryTransientOverlayViewController = v38;

        [(SBPasscodeEntryTransientOverlayViewController *)self->_passcodeEntryTransientOverlayViewController setDelegate:self];
        -[SBPasscodeEntryTransientOverlayViewController setUseBiometricPresentation:](self->_passcodeEntryTransientOverlayViewController, "setUseBiometricPresentation:", [v32 wantsBiometricPresentation]);
        id v40 = self->_passcodeEntryTransientOverlayViewController;
        uint64_t v41 = [v32 unlockDestination];
        [(SBPasscodeEntryTransientOverlayViewController *)v40 setUnlockDestination:v41];

        id v42 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v43 = [v42 userInterfaceIdiom];

        if ((v43 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
          -[SBPasscodeEntryTransientOverlayViewController setOverridePresentationOrientation:](self->_passcodeEntryTransientOverlayViewController, "setOverridePresentationOrientation:", [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation]);
        }
        unlockRequest = self->_unlockRequest;
        if (!unlockRequest || [(SBLockScreenUnlockRequest *)unlockRequest intent] == 3)
        {
          char v45 = self->_passcodeEntryTransientOverlayViewController;
          v46 = +[SBTelephonyManager sharedTelephonyManager];
          -[SBPasscodeEntryTransientOverlayViewController setShowEmergencyCallButton:](v45, "setShowEmergencyCallButton:", [v46 emergencyCallSupported]);
        }
      }
      if (v28 == 2) {
        [(SBPasscodeEntryTransientOverlayViewController *)self->_passcodeEntryTransientOverlayViewController setIntent:3];
      }
      if (v19) {
        [(SBPasscodeEntryTransientOverlayViewController *)self->_passcodeEntryTransientOverlayViewController setDismissesSiriForPresentation:0];
      }
      uint64_t v47 = +[SBWorkspace mainWorkspace];
      uint64_t v48 = self->_passcodeEntryTransientOverlayViewController;
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __52__SBLockScreenManager__setPasscodeVisible_animated___block_invoke;
      v56[3] = &unk_1E6AF4AC0;
      v56[4] = self;
      [v47 presentTransientOverlayViewController:v48 animated:v4 completion:v56];

      self->_passcodeEntryTransientOverlayViewControllerPresentedAnimated = v4;
    }
    else
    {
      uint64_t v35 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment passcodeViewPresenter];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __52__SBLockScreenManager__setPasscodeVisible_animated___block_invoke_361;
      v55[3] = &unk_1E6AF4AC0;
      v55[4] = self;
      [v35 setPasscodeLockVisible:1 animated:v4 completion:v55];
    }
    [(SBLockScreenManager *)self _runPreflightLocationBasedEvaluationToExitLostModeIfNecessary];
    if (v34) {
      BOOL v49 = ![(SBLockScreenManager *)self isUILocked];
    }
    else {
      BOOL v49 = 0;
    }
    self->_presentedPasscodeWhileUILocking = v49;

LABEL_49:
    v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v50 postNotificationName:@"SBLockScreenPasscodeUIVisibilityUpdatedNotification" object:self];

    return 1;
  }
  return 0;
}

uint64_t __52__SBLockScreenManager__setPasscodeVisible_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager][Lock Element] transient passcode overlay presentation is going to trigger bloom", v4, 2u);
  }

  return [*(id *)(a1 + 32) _updateBloomIfNeeded];
}

uint64_t __52__SBLockScreenManager__setPasscodeVisible_animated___block_invoke_361(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) coverSheetViewController];
  [v2 cleanupRubberBandTransition];

  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[SBLockScreenManager][Lock Element] changing passcode being visible is going to trigger bloom update", v5, 2u);
  }

  return [*(id *)(a1 + 32) _updateBloomIfNeeded];
}

- (BOOL)_specifiesTransientPresentationForMode:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (BOOL)isPasscodeEntryTransientOverlayVisible
{
  return self->_passcodeEntryTransientOverlayViewController != 0;
}

- (BOOL)_isPasscodeVisible
{
  id v3 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  BOOL v4 = [v3 _sbWindowScene];
  char v5 = [v4 ambientPresentationController];

  BOOL v6 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment passcodeViewPresenter];
  if (([v6 isPasscodeLockVisible] & 1) != 0
    || [(SBLockScreenManager *)self isPasscodeEntryTransientOverlayVisible])
  {
    char v7 = 1;
  }
  else
  {
    char v7 = [v5 ambientTransientOverlayIsShowingPasscode];
  }

  return v7;
}

void __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isComplete])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      if ([v5 isFailed])
      {
        (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
      }
      else
      {
        BOOL v4 = [v5 context];
        (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, [v4 BOOLValue]);
      }
    }
  }
}

uint64_t __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "[Unlock Request] Performing action!", v4, 2u);
  }

  return [*(id *)(a1 + 32) signalWithContext:MEMORY[0x1E4F1CC38]];
}

void __75__SBLockScreenManager__unlockWithRequest_cancelPendingRequests_completion___block_invoke_380(uint64_t a1, char a2)
{
  BOOL v4 = SBLogCommon();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if ((a2 & 1) == 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "[Unlock Request] Request failed.", buf, 2u);
    }

    char v7 = *(void **)(a1 + 32);
    uint64_t v8 = MEMORY[0x1E4F1CC28];
    goto LABEL_9;
  }
  if (v5)
  {
    *(_WORD *)int v13 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "[Unlock Request] Request succeeded!", v13, 2u);
  }

  BOOL v6 = [*(id *)(a1 + 48) action];

  if (!v6)
  {
    char v7 = *(void **)(a1 + 32);
    uint64_t v8 = MEMORY[0x1E4F1CC38];
LABEL_9:
    [v7 signalWithContext:v8];
    id v10 = *(void **)(a1 + 40);
    uint64_t v9 = a1 + 40;
    id v11 = [v10 _customLockScreenActionContext];
    char v12 = *(void **)(v9 + 8);

    if (v11 == v12) {
      [*(id *)v9 setCustomLockScreenActionContext:0];
    }
  }
}

- (void)updateSpringBoardStatusBarForLockScreenTeardown
{
  id v4 = [(id)SBApp statusBarStateAggregator];
  [v4 beginCoalescentBlock];
  [v4 updateStatusBarItem:13];
  [v4 endCoalescentBlock];
  uint64_t v3 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment statusBarTransitionController];
  [v3 updateStatusBarForLockScreenTeardown];
}

- (void)_setUserAuthController:(id)a3
{
  objc_storeStrong((id *)&self->_userAuthController, a3);
  id v5 = a3;
  [(SBFUserAuthenticationController *)self->_userAuthController _addPrivateAuthenticationObserver:self];
}

- (void)_setHomeButtonShowPasscodeRecognizer:(id)a3
{
  id v5 = (SBHomeButtonShowPasscodeRecognizer *)a3;
  homeButtonShowPasscodeRecognizer = self->_homeButtonShowPasscodeRecognizer;
  if (homeButtonShowPasscodeRecognizer != v5)
  {
    char v7 = v5;
    [(SBHomeButtonShowPasscodeRecognizer *)homeButtonShowPasscodeRecognizer setDelegate:0];
    objc_storeStrong((id *)&self->_homeButtonShowPasscodeRecognizer, a3);
    [(SBHomeButtonShowPasscodeRecognizer *)self->_homeButtonShowPasscodeRecognizer setDelegate:self];
    id v5 = v7;
  }
}

- (void)_setHomeButtonSuppressAfterUnlockRecognizer:(id)a3
{
  id v5 = (SBHomeButtonSuppressAfterUnlockRecognizer *)a3;
  homeButtonSuppressAfterUnlockRecognizer = self->_homeButtonSuppressAfterUnlockRecognizer;
  if (homeButtonSuppressAfterUnlockRecognizer != v5)
  {
    char v7 = v5;
    [(SBHomeButtonSuppressAfterUnlockRecognizer *)homeButtonSuppressAfterUnlockRecognizer setDelegate:0];
    objc_storeStrong((id *)&self->_homeButtonSuppressAfterUnlockRecognizer, a3);
    [(SBHomeButtonSuppressAfterUnlockRecognizer *)self->_homeButtonSuppressAfterUnlockRecognizer setDelegate:self];
    id v5 = v7;
  }
}

- (void)_wakeScreenForMouseButtonDown:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[SBBacklightController sharedInstance];
  if ([v5 screenIsOn])
  {
    BOOL v6 = SBLogBacklight();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v16 = 0;
      char v7 = "_wakeScreenForMouseButtonDown: not waking because screen is on";
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, v7, v16, 2u);
    }
  }
  else
  {
    int v8 = [(id)SBApp caseIsEnabledAndLatched];
    BOOL v6 = SBLogBacklight();
    BOOL v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v9)
      {
        *(_WORD *)BOOL v16 = 0;
        char v7 = "_wakeScreenForMouseButtonDown: not waking because smart cover closed";
        goto LABEL_7;
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)BOOL v16 = 0;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "_wakeScreenForMouseButtonDown: waking", v16, 2u);
      }

      id v10 = SBLogBacklight();
      os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, v4);

      char v12 = SBLogBacklight();
      int v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        *(_WORD *)BOOL v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "_wakeScreenForMouseButtonDown", (const char *)&unk_1D8FE2CAB, v16, 2u);
      }

      v17[0] = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
      v17[1] = @"SBUIUnlockOptionsStartFadeInAnimation";
      v18[0] = MEMORY[0x1E4F1CC38];
      v18[1] = MEMORY[0x1E4F1CC38];
      int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
      [(SBLockScreenManager *)self unlockUIFromSource:17 withOptions:v14];

      int v15 = SBLogBacklight();
      BOOL v6 = v15;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)BOOL v16 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v6, OS_SIGNPOST_INTERVAL_END, v11, "_wakeScreenForMouseButtonDown", (const char *)&unk_1D8FE2CAB, v16, 2u);
      }
    }
  }
}

- (id)_statusBarLayoutManager
{
  uint64_t v2 = -[SBLockScreenManager rootViewController]((id *)&self->super.isa);
  uint64_t v3 = [v2 _sbWindowScene];
  id v4 = [v3 statusBarManager];
  id v5 = [v4 layoutManager];

  return v5;
}

- (void)_dismissLockScreenForAuthenticationIfNecessary
{
  [(SBLockScreenManager *)self exitLostModeIfNecessaryFromRemoteRequest:0];
  uint64_t v3 = [MEMORY[0x1E4F5E408] rootSettings];
  int v4 = [v3 autoDismissUnlockedLockScreen];

  if (v4)
  {
    [(SBLockScreenManager *)self unlockUIFromSource:11 withOptions:0];
  }
}

- (void)_evaluateWallpaperMode
{
  if (self->_isScreenOn
    && (+[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance"), v3 = objc_claimAutoreleasedReturnValue(), int v4 = [v3 isPresented], v3, v4))
  {
    [(SBLockScreenManager *)self _prepareWallpaperForInteractiveMode];
  }
  else
  {
    [(SBLockScreenManager *)self _prepareWallpaperForStaticMode];
  }
}

- (void)_prepareWallpaperForInteractiveMode
{
  id v6 = +[SBWallpaperController sharedInstance];
  self->_shouldTransitionIrisWallpaperToStillWhenPlaybackFinishes = 0;
  [v6 updateIrisWallpaperForInteractiveMode];
  uint64_t v3 = [(SBLockScreenManager *)self coverSheetViewController];
  int v4 = [v6 irisWallpaperPlayer];
  [v3 setIrisWallpaperPlayer:v4];

  id v5 = [v6 wallpaperGestureRecognizer];
  [v3 setWallpaperGestureRecognizer:v5];

  [v3 setWallpaperColorProvider:self];
}

- (void)_prepareWallpaperForStaticMode
{
  uint64_t v3 = +[SBWallpaperController sharedInstance];
  char v4 = [v3 updateIrisWallpaperForStaticMode];

  if ((v4 & 1) == 0) {
    self->_shouldTransitionIrisWallpaperToStillWhenPlaybackFinishes = 1;
  }
}

- (NSString)description
{
  return (NSString *)[(SBLockScreenManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBLockScreenManager *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBLockScreenManager *)self descriptionBuilderWithMultilinePrefix:a3];
  char v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char v4 = [(SBLockScreenManager *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendBool:self->_isUILocked withName:@"UI Locked"];
  id v6 = (id)[v4 appendBool:self->_allowDisablePasscodeLockAssertion withName:@"Allows DisablePasscodeLockAssertion"];
  id v7 = (id)[v4 appendBool:self->_allowUILockUnlock withName:@"Allow Locking/Unlocking"];
  if (self->_isInLostMode) {
    id v8 = (id)[v4 appendBool:1 withName:@"inLostMode"];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__SBLockScreenManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E6AF5290;
  id v9 = v4;
  id v13 = v9;
  int v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:0 block:v12];
  id v10 = v9;

  return v10;
}

id __61__SBLockScreenManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"mesaCoordinator"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"lockScreenEnvironment"];
}

- (void)_noteStartupTransitionWillBegin
{
  self->_allowUILockUnlock = 1;
  uint64_t v3 = [(id)SBApp userSessionController];
  int v4 = [v3 isMultiUserSupported];

  if (v4 && (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0)
  {
    lockScreenOrientationManager = self->_lockScreenOrientationManager;
    [(SBLockScreenOrientationManager *)lockScreenOrientationManager updateInterfaceOrientationWithRequestedOrientation:0 animated:0];
  }
}

- (void)_noteStartupTransitionDidBegin
{
  self->_allowDisablePasscodeLockAssertion = 1;
  if (!self->_isUILocked) {
    [(SBLockScreenManager *)self _createAuthenticationAssertion];
  }
}

- (void)_postLockCompletedNotification:(BOOL)a3
{
  if (_postLockCompletedNotification__lockCompleteToken == -1)
  {
    notify_register_check("com.apple.springboard.lockcomplete", &_postLockCompletedNotification__lockCompleteToken);
    if (!_postLockCompletedNotification__lockCompleteToken) {
      return;
    }
  }
  else if (!_postLockCompletedNotification__lockCompleteToken)
  {
    return;
  }
  int v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SBLockScreenManager__postLockCompletedNotification___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v6 = a3;
  dispatch_async(v4, block);
}

uint64_t __54__SBLockScreenManager__postLockCompletedNotification___block_invoke(uint64_t a1)
{
  uint64_t result = notify_set_state(_postLockCompletedNotification__lockCompleteToken, *(unsigned __int8 *)(a1 + 32));
  if (*(unsigned char *)(a1 + 32))
  {
    return notify_post("com.apple.springboard.lockcomplete");
  }
  return result;
}

- (void)_setMesaUnlockingDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v14 = v7;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBLockScreenManager.m", 3212, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v7 = 0;
  }
  id v8 = [(NSMutableDictionary *)self->_mesaUnlockingDisabledAssertions objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v4)
  {

    if (v9) {
      goto LABEL_12;
    }
    if (!self->_mesaUnlockingDisabledAssertions)
    {
      id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      mesaUnlockingDisabledAssertions = self->_mesaUnlockingDisabledAssertions;
      self->_mesaUnlockingDisabledAssertions = v10;
    }
    char v12 = [(SBLockScreenBiometricAuthenticationCoordinator *)self->_biometricAuthenticationCoordinator acquireDisableUnlockAssertionForReason:v14];
    if (v12) {
      [(NSMutableDictionary *)self->_mesaUnlockingDisabledAssertions setObject:v12 forKeyedSubscript:v14];
    }
  }
  else
  {
    [v8 invalidate];

    [(NSMutableDictionary *)self->_mesaUnlockingDisabledAssertions removeObjectForKey:v14];
    if ([(NSMutableDictionary *)self->_mesaUnlockingDisabledAssertions count]) {
      goto LABEL_12;
    }
    char v12 = self->_mesaUnlockingDisabledAssertions;
    self->_mesaUnlockingDisabledAssertions = 0;
  }

LABEL_12:
}

- (BOOL)_attemptUnlockWithPasscode:(id)a3 finishUIUnlock:(BOOL)a4
{
  return [(SBLockScreenManager *)self _attemptUnlockWithPasscode:a3 mesa:0 finishUIUnlock:a4];
}

- (BOOL)_attemptUnlockWithPasscode:(id)a3 mesa:(BOOL)a4 finishUIUnlock:(BOOL)a5
{
  return [(SBLockScreenManager *)self _attemptUnlockWithPasscode:a3 mesa:a4 finishUIUnlock:a5 completion:0];
}

- (BOOL)_attemptUnlockWithPasscode:(id)a3 mesa:(BOOL)a4 finishUIUnlock:(BOOL)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if ([(SBLockScreenManager *)self isUILocked] || self->_unlockRequest)
  {
    char v12 = [(SBFUserAuthenticationController *)self->_userAuthController createGracePeriodAssertionWithReason:@"UI unlock attempt"];
    [v12 activate];
    int v13 = [(SBLockScreenUnlockRequest *)self->_unlockRequest source];
    id v14 = [(SBLockScreenUnlockRequest *)self->_unlockRequest process];
    if (v14) {
      BOOL v15 = [(SBLockScreenUnlockRequest *)self->_unlockRequest intent] == 2;
    }
    else {
      BOOL v15 = 0;
    }

    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    char v26 = __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke;
    BOOL v27 = &unk_1E6B0E818;
    id v30 = v11;
    id v16 = v12;
    id v28 = v16;
    BOOL v29 = self;
    int v31 = v13;
    BOOL v32 = a5;
    BOOL v33 = v8;
    BOOL v17 = (void *)MEMORY[0x1D948C7A0](&v24);
    id v18 = objc_alloc(MEMORY[0x1E4FA5EA0]);
    if (v8) {
      uint64_t v19 = objc_msgSend(v18, "initForBiometricAuthenticationWithSource:handler:", v15, v17, v24, v25, v26, v27);
    }
    else {
      uint64_t v19 = objc_msgSend(v18, "initForPasscode:source:handler:", v10, v15, v17, v24, v25, v26, v27);
    }
    __int16 v20 = (void *)v19;
    [(SBFUserAuthenticationController *)self->_userAuthController processAuthenticationRequest:v19];

    BOOL v21 = 1;
  }
  else
  {
    BOOL v23 = SBLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_INFO, "Not locked so not unlocking", buf, 2u);
    }

    if (v11) {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
    }
    BOOL v21 = 0;
  }

  return v21;
}

void __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = @"no";
    if (a2) {
      id v5 = @"yes";
    }
    *(_DWORD *)buf = 138412290;
    BOOL v23 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Unlock attempt succeeded: %@", buf, 0xCu);
  }

  BOOL v6 = (void *)MEMORY[0x1E4F4F6B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_410;
  void v18[3] = &unk_1E6B0E7C8;
  id v20 = *(id *)(a1 + 48);
  char v21 = a2;
  id v19 = *(id *)(a1 + 32);
  id v7 = [v6 sentinelWithCompletion:v18];
  if (a2)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_2;
    void v16[3] = &unk_1E6B0E7F0;
    v16[4] = *(void *)(a1 + 40);
    int v17 = *(_DWORD *)(a1 + 56);
    BOOL v8 = (void (**)(void, void))MEMORY[0x1D948C7A0](v16);
    id v9 = *(id **)(a1 + 40);
    if (*(unsigned char *)(a1 + 60))
    {
      if ([v9[9] source] == 13)
      {
        uint64_t v10 = 13;
      }
      else if ([*(id *)(*(void *)(a1 + 40) + 72) source] == 34)
      {
        uint64_t v10 = 34;
      }
      else if (*(unsigned char *)(a1 + 61))
      {
        uint64_t v10 = 23;
      }
      else
      {
        uint64_t v10 = 17;
      }
      char v12 = *(void **)(a1 + 40);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      _DWORD v13[2] = __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_4;
      v13[3] = &unk_1E6AF71F0;
      void v13[4] = v12;
      BOOL v15 = v8;
      id v14 = v7;
      [v12 _finishUIUnlockFromSource:v10 withOptions:0 completion:v13];
    }
    else
    {
      [v9 _runUnlockActionBlock:1];
      v8[2](v8, 1);
      [v7 signal];
    }
  }
  else
  {
    if ([*(id *)(*(void *)(a1 + 40) + 160) isBlocked])
    {
      id v11 = [*(id *)(*(void *)(a1 + 40) + 32) passcodeViewPresenter];
      [v11 setPasscodeLockVisible:0 animated:1];
    }
    [v7 signal];
  }
}

uint64_t __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_410(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isComplete];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, 1, *(unsigned __int8 *)(a1 + 48));
    }
    id v5 = *(void **)(a1 + 32);
    return [v5 invalidate];
  }
  return result;
}

void __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _createAuthenticationAssertion];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_3;
    v5[3] = &unk_1E6AF7E00;
    int v6 = *(_DWORD *)(a1 + 40);
    void v5[4] = *(void *)(a1 + 32);
    uint64_t v3 = [MEMORY[0x1E4F624D8] eventWithName:@"authenticateOnly" handler:v5];
    uint64_t v4 = [MEMORY[0x1E4F624E0] sharedInstance];
    [v4 executeOrAppendEvent:v3];
  }
}

uint64_t __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_3(uint64_t a1)
{
  id v2 = +[SBCoverSheetPresentationManager sharedInstance];
  [v2 authenticationStateMayHaveChangedFromSource:*(unsigned int *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setPasscodeVisible:0 animated:1];
}

uint64_t __81__SBLockScreenManager__attemptUnlockWithPasscode_mesa_finishUIUnlock_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _runUnlockActionBlock:a2];
  [*(id *)(a1 + 32) _lockFeaturesForRemoteLock:0];
  if ([*(id *)(a1 + 32) isPasscodeEntryTransientOverlayVisible]) {
    [*(id *)(a1 + 32) setPasscodeVisible:0 animated:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 signal];
}

- (void)attemptUnlockWithPasscode:(id)a3 finishUIUnlock:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = a5;
  uint64_t v9 = [v12 length];
  if (v6)
  {
    unlockRequest = self->_unlockRequest;
    if (unlockRequest) {
      BOOL v11 = [(SBLockScreenUnlockRequest *)unlockRequest intent] == 3;
    }
    else {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  [(SBLockScreenManager *)self _attemptUnlockWithPasscode:v12 mesa:v9 == 0 finishUIUnlock:v11 completion:v8];
}

- (void)attemptUnlockWithPasscode:(id)a3
{
}

- (void)attemptUnlockWithMesa
{
}

- (void)_noteBootCompleted
{
  self->_isReadyForContinuityDisplays = 1;
}

- (void)_evaluatePreArmDisabledAssertions
{
  uint64_t v3 = +[SBSetupManager sharedInstance];
  uint64_t v4 = [v3 isInSetupMode];

  [(SBLockScreenManager *)self _setWalletPreArmDisabled:v4 forReason:@"Setup"];
  [(SBLockScreenManager *)self _setWalletPreArmDisabled:[(SBFLockOutStatusProvider *)self->_lockOutController isBlocked] forReason:@"Device blocked"];
  id v5 = +[SBTelephonyManager sharedTelephonyManager];
  uint64_t v6 = [v5 incomingCallExists];

  [(SBLockScreenManager *)self _setWalletPreArmDisabled:v6 forReason:@"Phone call"];
}

- (void)_authenticationStateChanged:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SBFUserAuthenticationController *)self->_userAuthController isAuthenticated];
  if (v4)
  {
    [(SBLockElementViewProvider *)self->_lockElement setAuthenticated:1];
    id v5 = [MEMORY[0x1E4F5E408] rootSettings];
    uint64_t v6 = [v5 pearlSettings];
    [v6 systemApertureDismissDelayAuth];
    -[SBLockScreenManager _setSystemApertureProudLockElementVisible:withReason:afterDelay:](self, "_setSystemApertureProudLockElementVisible:withReason:afterDelay:", 0, @"Authenticated");

    if (self->_isInLostMode
      && [(SBLockScreenManager *)self _needsBiometricAuthenticationToExitLostMode])
    {
      [(SBLockScreenManager *)self _presentLostModeBiometricAuthenticationTransientOverlay];
    }
    else
    {
      [(SBLockScreenManager *)self _dismissLockScreenForAuthenticationIfNecessary];
    }
    lostModePreflightLocalAuthContext = self->_lostModePreflightLocalAuthContext;
    self->_lostModePreflightLocalAuthContext = 0;
  }
  else
  {
    self->_ignoringDelayDismissalPending = 0;
    [(SBLockScreenManager *)self _showSystemApertureProudLockElementIfSupportedWithReason:@"Unauthenticated"];
    [(SBLockElementViewProvider *)self->_lockElement setAuthenticated:0];
    if ([(SBLockScreenManager *)self isUILocked]
      || [(SBLockScreenManager *)self isLockScreenActive]
      || [(BSCompoundAssertion *)self->_lockScreenPresentationPendingAssertions isActive])
    {
      if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet") & 1) == 0) {
        [(SBLockScreenOrientationManager *)self->_lockScreenOrientationManager updateInterfaceOrientationWithRequestedOrientation:0 animated:0];
      }
      id v7 = [(SBLockScreenManager *)self coverSheetViewController];
      [v7 activateMainPageWithCompletion:0];
    }
    else
    {
      v16[0] = @"SBUILockOptionsForceLockKey";
      id v7 = [NSNumber numberWithBool:1];
      v17[0] = v7;
      v16[1] = @"SBUILockOptionsLockAutomaticallyKey";
      int v13 = [NSNumber numberWithBool:1];
      v17[1] = v13;
      v16[2] = @"SBUILockOptionsUseScreenOffModeKey";
      id v14 = [NSNumber numberWithBool:0];
      void v17[2] = v14;
      BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
      [(SBLockScreenManager *)self lockUIFromSource:11 withOptions:v15];
    }
    id v8 = [MEMORY[0x1E4F74230] sharedConnection];
    char v9 = [v8 isLockScreenControlCenterAllowed];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = +[SBControlCenterController sharedInstanceIfExists];
      [v10 dismissAnimated:0];
    }
  }
  id v12 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment lockController];
  [v12 setAuthenticated:v4];

  [(SBLockScreenBiometricAuthenticationCoordinator *)self->_biometricAuthenticationCoordinator setAuthenticated:v4];
}

- (void)_deviceBlockedChanged:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if ([(SBLockScreenManager *)self isUILocked])
  {
    uint64_t v4 = +[SBCoverSheetPresentationManager sharedInstance];
    if ([v4 isInSecureApp])
    {
      int v5 = [(SBFLockOutStatusProvider *)self->_lockOutController isBlocked];

      if (!v5)
      {
LABEL_6:
        uint64_t v6 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment blockedStateObserver];
        [v6 noteDeviceBlockedStatusUpdated];
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v4 = +[SBCoverSheetPresentationManager sharedInstance];
      [v4 setCoverSheetPresented:1 animated:1 withCompletion:0];
    }

    goto LABEL_6;
  }
  if ([(SBFLockOutStatusProvider *)self->_lockOutController isBlocked])
  {
    v10[0] = @"SBUILockOptionsForceLockKey";
    uint64_t v6 = [NSNumber numberWithBool:1];
    v11[0] = v6;
    v10[1] = @"SBUILockOptionsLockAutomaticallyKey";
    id v7 = [NSNumber numberWithBool:1];
    v11[1] = v7;
    v10[2] = @"SBUILockOptionsUseScreenOffModeKey";
    id v8 = [NSNumber numberWithBool:0];
    v11[2] = v8;
    char v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
    [(SBLockScreenManager *)self lockUIFromSource:19 withOptions:v9];

    goto LABEL_9;
  }
LABEL_10:
  [(SBLockScreenManager *)self _evaluatePreArmDisabledAssertions];
}

- (void)_resetOrRestoreStateChanged:(id)a3
{
  void v18[3] = *MEMORY[0x1E4F143B8];
  if ([(SBLockScreenManager *)self isUILocked])
  {
    id v14 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment blockedStateObserver];
    [v14 noteResetRestoreStateUpdated];
  }
  else
  {
    uint64_t v4 = +[SBSyncController sharedInstance];
    if ([v4 isRestoring])
    {
    }
    else
    {
      int v5 = +[SBSyncController sharedInstance];
      int v6 = [v5 isResetting];

      if (!v6) {
        return;
      }
    }
    id v7 = +[SBBacklightController sharedInstance];
    [v7 setBacklightState:3 source:25];

    v17[0] = @"SBUILockOptionsForceLockKey";
    id v8 = [NSNumber numberWithBool:1];
    v18[0] = v8;
    v17[1] = @"SBUILockOptionsLockAutomaticallyKey";
    char v9 = [NSNumber numberWithBool:1];
    v18[1] = v9;
    void v17[2] = @"SBUILockOptionsUseScreenOffModeKey";
    uint64_t v10 = [NSNumber numberWithBool:1];
    v18[2] = v10;
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    [(SBLockScreenManager *)self lockUIFromSource:6 withOptions:v11];

    BOOL v15 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
    id v12 = [NSNumber numberWithBool:1];
    id v16 = v12;
    int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [(SBLockScreenManager *)self unlockUIFromSource:6 withOptions:v13];
  }
}

- (void)_handleBacklightLevelWillChange:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:*MEMORY[0x1E4FA7A20]];
  [v5 floatValue];
  float v7 = v6;

  int v8 = BSFloatGreaterThanFloat();
  char v9 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment backlightController];
  [v9 setBacklightLevel:v7];

  if (self->_isScreenOn != v8)
  {
    self->_isScreenOn = v8;
    if (v8)
    {
      [(SBCoverSheetBiometricResourceObserver *)self->_biometricResourceObserver reset];
      [(SBLockScreenManager *)self _setMesaCoordinatorDisabled:0 forReason:@"Screen off"];
      uint64_t v10 = [MEMORY[0x1E4FA7C68] sharedInstance];
      [v10 noteScreenWillTurnOn];

      [(SBFMouseButtonDownGestureRecognizer *)self->_mouseButtonDownGesture setEnabled:0];
      [(SBLockScreenManager *)self _evaluateWallpaperMode];
      id v12 = +[SBCoverSheetPresentationManager sharedInstanceIfExists];
      [v12 completeOngoingPresentationIfNeeded];
    }
    else
    {
      [(SBLockScreenManager *)self _setHomeButtonShowPasscodeRecognizer:0];
      [(SBLockScreenManager *)self _setMesaCoordinatorDisabled:1 forReason:@"Screen off"];
      BOOL v11 = [MEMORY[0x1E4FA7C68] sharedInstance];
      [v11 noteScreenDidTurnOff];

      id v12 = +[SBWallpaperController sharedInstance];
      [v12 updateWallpaperAnimationWithWakeSourceIsSwipeToUnlock:0];
    }
  }
}

- (void)_handleBacklightDidTurnOff:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  int v5 = [v4 objectForKey:*MEMORY[0x1E4FA7A08]];
  int v6 = [v5 intValue];

  [(SBLockScreenManager *)self setPasscodeVisible:0 animated:0];
  if (v6 != 13)
  {
    float v7 = +[SBCoverSheetPresentationManager sharedInstance];
    [v7 noteScreenDidTurnOff];
  }
  [(SBFMouseButtonDownGestureRecognizer *)self->_mouseButtonDownGesture setEnabled:1];
  [(SBLockScreenManager *)self _evaluateWallpaperMode];
}

- (void)_lockScreenDimmed:(id)a3
{
  uint64_t v4 = objc_msgSend((id)SBApp, "bannerManager", a3);
  [v4 dismissAllBannersInAllWindowScenesAnimated:0 reason:@"SBBannerManagerDismissalReasonLock"];

  [(SBLockScreenManager *)self _clearAuthenticationLockAssertion];
}

- (void)noteMenuButtonSinglePress
{
}

- (void)noteMenuButtonDoublePress
{
}

- (void)homeButtonSuppressAfterUnlockRecognizerRequestsEndOfSuppression:(id)a3
{
  int v5 = (SBHomeButtonSuppressAfterUnlockRecognizer *)a3;
  uint64_t v10 = v5;
  if (!v5)
  {
    float v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBLockScreenManager.m", 3542, @"Invalid parameter not satisfying: %@", @"recognizer" object file lineNumber description];

    int v5 = 0;
  }
  homeButtonSuppressAfterUnlockRecognizer = self->_homeButtonSuppressAfterUnlockRecognizer;
  if (!homeButtonSuppressAfterUnlockRecognizer)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBLockScreenManager.m" lineNumber:3543 description:@"Unexpectedly received end of suppresion from a SBHomeButtonSuppressAfterUnlock recognizer but there is no active one"];

    int v5 = v10;
    homeButtonSuppressAfterUnlockRecognizer = self->_homeButtonSuppressAfterUnlockRecognizer;
  }
  if (homeButtonSuppressAfterUnlockRecognizer != v5)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBLockScreenManager.m" lineNumber:3544 description:@"Unexpectedly received end of suppression from a SBHomeButtonSuppressAfterUnlock recognizer but it is not the active one"];
  }
  [(SBLockScreenManager *)self _setHomeButtonSuppressAfterUnlockRecognizer:0];
}

- (BOOL)handlesHomeButtonSinglePresses
{
  return [(SBLockScreenManager *)self isUILocked]
      || [(SBLockScreenManager *)self isLockScreenActive]
      || self->_homeButtonSuppressAfterUnlockRecognizer != 0;
}

- (void)remoteLock:(BOOL)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  if (a3
    && [(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet])
  {
    [(SBLockScreenManager *)self _lockFeaturesForRemoteLock:1];
  }
  v8[0] = @"SBUILockOptionsUseScreenOffModeKey";
  uint64_t v4 = [NSNumber numberWithBool:0];
  v9[0] = v4;
  v8[1] = @"SBUILockOptionsLockAutomaticallyKey";
  int v5 = [NSNumber numberWithBool:1];
  v9[1] = v5;
  v8[2] = @"SBUILockOptionsForceLockKey";
  int v6 = [NSNumber numberWithBool:1];
  v9[2] = v6;
  float v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  [(SBLockScreenManager *)self lockUIFromSource:21 withOptions:v7];
}

- (void)_lockFeaturesForRemoteLock:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = +[SBDefaults localDefaults];
  int v5 = [v4 lockScreenDefaults];
  [v5 setLimitFeaturesForRemoteLock:v3];

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4FA7A40];
  float v7 = (void *)MEMORY[0x1E4F1C9E8];
  int v8 = [NSNumber numberWithBool:v3];
  char v9 = [v7 dictionaryWithObject:v8 forKey:*MEMORY[0x1E4FA7B20]];
  [v10 postNotificationName:v6 object:0 userInfo:v9];
}

- (void)activateLostModeForRemoteLock:(BOOL)a3
{
  void v18[3] = *MEMORY[0x1E4F143B8];
  if (!self->_isInLostMode)
  {
    BOOL v3 = a3;
    self->_isInLostMode = 1;
    int v5 = [(id)SBApp userSessionController];
    if ([v5 canLogout])
    {
      [v5 logout];
    }
    else
    {
      uint64_t v6 = +[SBMediaController sharedInstance];
      [v6 stopForEventSource:5];

      float v7 = +[SBTelephonyManager sharedTelephonyManager];
      [v7 disconnectAllCalls];

      int v8 = +[SBConferenceManager sharedInstance];
      [v8 endFaceTime];

      if (![(SBLockScreenManager *)self isUILocked])
      {
        v17[0] = @"SBUILockOptionsUseScreenOffModeKey";
        char v9 = [NSNumber numberWithBool:0];
        v18[0] = v9;
        v17[1] = @"SBUILockOptionsLockAutomaticallyKey";
        id v10 = [NSNumber numberWithBool:1];
        v18[1] = v10;
        void v17[2] = @"SBUILockOptionsForceLockKey";
        BOOL v11 = [NSNumber numberWithBool:1];
        v18[2] = v11;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
        [(SBLockScreenManager *)self lockUIFromSource:20 withOptions:v12];
      }
      [(SBLockScreenManager *)self setPasscodeVisible:0 animated:1];
      [(SBLockScreenManager *)self enableLostModePlugin];
      int v13 = +[SBAlertItemsController sharedInstance];
      [v13 setForceAlertsToPend:1 forReason:@"SBLockScreenManagerPendAlertsForLostMode"];

      id v14 = [(id)SBApp bannerManager];
      BOOL v15 = [v14 acquireBannerSuppressionAssertionForReason:@"SBLockScreenManagerBusyForLostMode"];
      bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
      self->_bannerSuppressionAssertion = v15;

      if (v3) {
        SBWorkspaceTerminateAllApps(5, 0, @"entering lost mode", 0);
      }
    }
  }
}

- (void)exitLostModeIfNecessaryFromRemoteRequest:(BOOL)a3
{
  if (self->_isInLostMode)
  {
    self->_isInLostMode = 0;
    if (a3)
    {
      [(SBLockScreenManager *)self _lockFeaturesForRemoteLock:0];
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F61A48] sharedInstance];
      [v4 disableLostMode];
    }
    [(SBLockScreenManager *)self _maybeLaunchSetupForcingCheckIfNotBricked:1];
    int v5 = +[SBAlertItemsController sharedInstance];
    [v5 setForceAlertsToPend:0 forReason:@"SBLockScreenManagerPendAlertsForLostMode"];

    [(BSInvalidatable *)self->_bannerSuppressionAssertion invalidate];
    bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
    self->_bannerSuppressionAssertion = 0;
  }
}

- (BOOL)isInLostMode
{
  return self->_isInLostMode;
}

- (void)enableLostModePlugin
{
  if (self->_isInLostMode)
  {
    BOOL v3 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment pluginPresenter];
    objc_initWeak(location, v3);

    uint64_t v4 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment passcodeViewPresenter];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__SBLockScreenManager_enableLostModePlugin__block_invoke;
    v6[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v7, location);
    [v4 setPasscodeLockVisible:0 animated:0 completion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(location);
  }
  else
  {
    int v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "We wanted to enable the lost mode plugin but we don't think we're in lost mode.", (uint8_t *)location, 2u);
    }
  }
}

void __43__SBLockScreenManager_enableLostModePlugin__block_invoke(uint64_t a1)
{
  id v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Enabling lost mode plugin since we are in lost mode.", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [MEMORY[0x1E4FA7958] contextWithName:@"FindMyiPhoneLockScreen"];
  [WeakRetained enableLockScreenPluginWithContext:v4];
}

- (void)_presentLostModeBiometricAuthenticationTransientOverlay
{
  if (!self->_lostModeBiometricAuthenticationTransientOverlay)
  {
    BOOL v3 = [SBLostModeBiometricAuthenticationTransientOverlayViewController alloc];
    uint64_t v4 = [MEMORY[0x1E4FA7C68] sharedInstance];
    int v5 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)v3 initWithLockScreenManager:self biometricResource:v4];
    lostModeBiometricAuthenticationTransientOverladouble y = self->_lostModeBiometricAuthenticationTransientOverlay;
    self->_lostModeBiometricAuthenticationTransientOverladouble y = v5;

    [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self->_lostModeBiometricAuthenticationTransientOverlay setDelegate:self];
    id v7 = +[SBWorkspace mainWorkspace];
    [v7 presentTransientOverlayViewController:self->_lostModeBiometricAuthenticationTransientOverlay animated:1 completion:0];
  }
}

- (void)_dismissLostModeBiometricAuthenticationTransientOverlay
{
  if (self->_lostModeBiometricAuthenticationTransientOverlay)
  {
    BOOL v3 = +[SBWorkspace mainWorkspace];
    [v3 dismissTransientOverlayViewController:self->_lostModeBiometricAuthenticationTransientOverlay animated:1 completion:0];

    lostModeBiometricAuthenticationTransientOverladouble y = self->_lostModeBiometricAuthenticationTransientOverlay;
    self->_lostModeBiometricAuthenticationTransientOverladouble y = 0;
  }
}

- (void)_relockUIForLostMode
{
  void v5[4] = *MEMORY[0x1E4F143B8];
  [(SBLockScreenManager *)self _dismissLostModeBiometricAuthenticationTransientOverlay];
  v4[0] = @"SBUILockOptionsUseScreenOffModeKey";
  v4[1] = @"SBUILockOptionsLockAutomaticallyKey";
  v5[0] = MEMORY[0x1E4F1CC28];
  v5[1] = MEMORY[0x1E4F1CC38];
  v4[2] = @"SBUILockOptionsForceLockKey";
  v4[3] = @"SBUILockOptionsForceBioLockoutKey";
  v5[2] = MEMORY[0x1E4F1CC38];
  v5[3] = MEMORY[0x1E4F1CC38];
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  [(SBLockScreenManager *)self lockUIFromSource:20 withOptions:v3];
}

- (BOOL)_needsBiometricAuthenticationToExitLostMode
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4FA7C68] sharedInstance];
  int v4 = [v3 hasEnrolledIdentities];

  int v5 = _os_feature_enabled_impl();
  uint64_t v6 = [MEMORY[0x1E4F30B78] sharedInstance];
  int v7 = [v6 isFeatureEnabled];

  if (v4) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v10 = !v8 && v7 != 0 && !self->_isInFamiliarLocationToExitLostMode;
  BOOL v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isInFamiliarLocationToExitLostMode = self->_isInFamiliarLocationToExitLostMode;
    v14[0] = 67110144;
    v14[1] = v10;
    __int16 v15 = 1024;
    int v16 = v4;
    __int16 v17 = 1024;
    int v18 = v5;
    __int16 v19 = 1024;
    int v20 = v7;
    __int16 v21 = 1024;
    BOOL v22 = isInFamiliarLocationToExitLostMode;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "[Lost Mode Exit] needsBioAuth: %{BOOL}u, bioIdentityEnrolled: %{BOOL}u, featureEnabled: %{BOOL}u, deviceProtectionEnabled: %{BOOL}u, isInFamiliarLocation: %{BOOL}u", (uint8_t *)v14, 0x20u);
  }

  return v10;
}

- (void)_runPreflightLocationBasedEvaluationToExitLostModeIfNecessary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (self->_isInLostMode && !self->_lostModePreflightLocalAuthContext)
  {
    BOOL v3 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
    lostModePreflightLocalAuthContext = self->_lostModePreflightLocalAuthContext;
    self->_lostModePreflightLocalAuthContext = v3;

    objc_initWeak(&location, self);
    int v5 = self->_lostModePreflightLocalAuthContext;
    v10[0] = &unk_1F334B7B0;
    v10[1] = &unk_1F334B750;
    v11[0] = MEMORY[0x1E4F1CC38];
    v11[1] = MEMORY[0x1E4F1CC38];
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __84__SBLockScreenManager__runPreflightLocationBasedEvaluationToExitLostModeIfNecessary__block_invoke;
    v7[3] = &unk_1E6B0E840;
    objc_copyWeak(&v8, &location);
    [(LAContext *)v5 evaluatePolicy:1025 options:v6 reply:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __84__SBLockScreenManager__runPreflightLocationBasedEvaluationToExitLostModeIfNecessary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[352] = a3 == 0;
  }
}

- (void)activationChanged:(id)a3
{
}

- (void)_maybeLaunchSetupForcingCheckIfNotBricked:(BOOL)a3
{
  BOOL v3 = a3;
  v23[4] = *MEMORY[0x1E4F143B8];
  int v5 = +[SBLockdownManager sharedInstance];
  int v6 = [v5 brickedDevice];

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F624E0] sharedInstance];
    [v7 cancelEventsWithName:@"HandleActivationChanged"];

    id v8 = +[SBDefaults externalDefaults];
    uint64_t v9 = [v8 setupDefaults];
    [(id)v9 setDeviceSetup:0];

    BOOL v10 = +[SBSetupManager sharedInstance];
    LOBYTE(v9) = [v10 updateInSetupMode];

    if (v9)
    {
      BOOL v11 = SBLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[SBLockScreenManager _maybeLaunchSetupForcingCheckIfNotBricked:](v11);
      }

      __65__SBLockScreenManager__maybeLaunchSetupForcingCheckIfNotBricked___block_invoke();
      id v12 = +[SBDefaults localDefaults];
      int v13 = [v12 setupDefaults];
      [v13 setInSetupModeForActivationChange:1];
    }
    else
    {
      if ([(SBLockScreenManager *)self isUILocked]) {
        return;
      }
      int v16 = SBLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v21 = 0;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "Locking the UI", v21, 2u);
      }

      __int16 v17 = +[SBTelephonyManager sharedTelephonyManager];
      [v17 disconnectAllCalls];

      v22[0] = @"SBUILockOptionsUseScreenOffModeKey";
      id v12 = [NSNumber numberWithBool:0];
      v23[0] = v12;
      v22[1] = @"SBUILockOptionsAnimateLockScreenActivationKey";
      int v13 = [NSNumber numberWithBool:1];
      v23[1] = v13;
      v22[2] = @"SBUILockOptionsLockAutomaticallyKey";
      int v18 = [NSNumber numberWithBool:1];
      v23[2] = v18;
      v22[3] = @"SBUILockOptionsForceLockKey";
      __int16 v19 = [NSNumber numberWithBool:1];
      v23[3] = v19;
      int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
      [(SBLockScreenManager *)self lockUIFromSource:18 withOptions:v20];
    }
  }
  else if (v3)
  {
    id v14 = +[SBSetupManager sharedInstance];
    int v15 = [v14 updateInSetupMode];

    if (v15)
    {
      __65__SBLockScreenManager__maybeLaunchSetupForcingCheckIfNotBricked___block_invoke();
    }
  }
}

void __65__SBLockScreenManager__maybeLaunchSetupForcingCheckIfNotBricked___block_invoke()
{
  BKSHIDServicesAmbientLightSensorEnableAutoBrightness();
  v0 = +[SBApplicationController sharedInstance];
  id v1 = [v0 setupApplication];

  id v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Activating Setup because we think we're bricked.", v7, 2u);
  }

  SBWorkspaceActivateApplication(v1);
  BOOL v3 = [(id)SBApp bannerManager];
  [v3 setSuspended:1 forReason:@"com.apple.purplebuddy"];

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 != 1)
  {
LABEL_7:
    [(id)SBApp updateNativeOrientationWithOrientation:1 updateMirroredDisplays:1 animated:0 logMessage:@"Setting orientation to Portrait for unlock to Setup."];
    int v6 = +[SBSetupManager sharedInstance];
    [v6 setDeferringDeviceOrientationUpdates:1];
  }
LABEL_8:
}

- (BOOL)_shouldBeInSetupMode
{
  BOOL v3 = +[SBSetupManager sharedInstance];
  int v4 = +[SBDefaults localDefaults];
  int v5 = [v3 isInSetupMode];
  int v6 = [v4 setupDefaults];
  int v7 = [v6 inSetupModeForActivationChange];

  if (!v5
    || ([(id)SBApp caseIsEnabledAndLatched] & 1) != 0
    || (([v3 setupHasFinishedRestoringFromBackup] | v7) & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    BOOL v8 = ![(SBLockScreenManager *)self isInLostMode];
  }

  return v8;
}

- (BOOL)handleKeyHIDEvent:(__IOHIDEvent *)a3
{
  if (a3)
  {
    int v4 = BKSHIDEventGetBaseAttributes();
    if (([v4 source] & 0xFFFFFFFD) == 1)
    {
      uint64_t IntegerValue = IOHIDEventGetIntegerValue();
      if ([(SBLockScreenManager *)self isUILocked])
      {
        int v6 = +[SBWorkspace mainWorkspace];
        int v7 = [v6 transientOverlayPresentationManager];
        char v8 = [v7 hasActivePresentation];
      }
      else
      {
        char v8 = 1;
      }
      char v10 = [(SBFLockOutStatusProvider *)self->_lockOutController isBlocked];
      BOOL v9 = 0;
      if (!IntegerValue || (v8 & 1) != 0 || (v10 & 1) != 0) {
        goto LABEL_15;
      }
      if ([(SBLockScreenManager *)self _shouldUnlockUIOnKeyDownEvent])
      {
        BOOL v11 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment customActionStore];
        id v12 = [v11 _customLockScreenActionContext];

        if (!v12)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4FA5FA0]);
          [v13 setConfirmedNotInPocket:1];
          [v11 setCustomLockScreenActionContext:v13];
        }
        [(SBLockScreenManager *)self unlockUIFromSource:2 withOptions:0];

        BOOL v9 = 1;
        goto LABEL_15;
      }
    }
    BOOL v9 = 0;
LABEL_15:

    return v9;
  }
  return 0;
}

- (BOOL)_shouldUnlockUIOnKeyDownEvent
{
  BOOL v3 = [MEMORY[0x1E4F43058] keyWindow];
  int v4 = [v3 firstResponder];

  if (v4) {
    return 0;
  }
  int v6 = [(id)SBApp modalAlertPresentationCoordinator];
  char v7 = [v6 isShowingSystemModalAlert];

  BOOL v8 = +[SBAssistantController isVisible];
  BOOL v9 = +[SBControlCenterController sharedInstanceIfExists];
  char v10 = [v9 isVisible];

  BOOL v11 = [(id)SBApp notificationDispatcher];
  id v12 = [v11 bannerDestination];
  char v13 = [v12 isPresentingBannerInLongLook];

  id v14 = +[SBCoverSheetPresentationManager sharedInstance];
  char v15 = [v14 isCoverSheetHostingAnApp];

  if (![(SBLockScreenManager *)self isUILocked]
    || (v7 & 1) != 0
    || v8
    || (v10 & 1) != 0
    || (v13 & 1) != 0
    || (v15 & 1) != 0)
  {
    return 0;
  }
  int v16 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment lockController];
  char v17 = [v16 shouldUnlockUIOnKeyDownEvent];

  return v17;
}

- (void)addLockStateObserver:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBLockScreenManager.m", 3871, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  lockStateObservers = self->_lockStateObservers;
  if (!lockStateObservers)
  {
    char v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    BOOL v8 = self->_lockStateObservers;
    self->_lockStateObservers = v7;

    id v5 = v10;
    lockStateObservers = self->_lockStateObservers;
  }
  [(NSHashTable *)lockStateObservers addObject:v5];
  if ([(SBLockScreenManager *)self isUILocked]) {
    [v10 lockStateProvider:self didUpdateIsUILocked:1];
  }
}

- (void)removeLockStateObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBLockScreenManager.m", 3883, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  [(NSHashTable *)self->_lockStateObservers removeObject:v5];
}

- (BOOL)passcodeEntryTransientOverlayViewController:(id)a3 authenticatePasscode:(id)a4
{
  id v6 = a4;
  if (!self->_unlockRequest)
  {
    id v7 = a3;
    BOOL v8 = objc_alloc_init(SBLockScreenUnlockRequest);
    [(SBLockScreenUnlockRequest *)v8 setName:@"Unlock For Passcode Entry Alert View Controller"];
    uint64_t v9 = [v7 intent];

    [(SBLockScreenUnlockRequest *)v8 setIntent:v9];
    unlockRequest = self->_unlockRequest;
    self->_unlockRequest = v8;
  }
  [(SBLockScreenManager *)self attemptUnlockWithPasscode:v6];

  return 1;
}

- (void)passcodeEntryTransientOverlayViewControllerDidDisappear:(id)a3
{
  if (self->_passcodeEntryTransientOverlayViewController == a3) {
    [(SBLockScreenManager *)self setPasscodeVisible:0 animated:1];
  }
}

- (void)passcodeEntryTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  id v4 = +[SBWorkspace mainWorkspace];
  [v4 dismissTransientOverlayViewController:self->_passcodeEntryTransientOverlayViewController animated:self->_passcodeEntryTransientOverlayViewControllerPresentedAnimated completion:0];
}

- (void)passcodeEntryTransientOverlayViewControllerRequestsEmergencyCall:(id)a3
{
  id v4 = +[SBCoverSheetPresentationManager sharedInstance];
  uint64_t v5 = [v4 isInSecureApp] ^ 1;

  id v6 = [(SBLockScreenEnvironment *)self->_lockScreenEnvironment callController];
  [v6 launchEmergencyDialerAnimated:v5];

  [(SBLockScreenManager *)self setPasscodeVisible:0 animated:1];
}

- (BOOL)passcodeEntryTransientOverlayViewControllerDidDetectFaceOcclusionsSinceScreenOn:(id)a3
{
  BOOL v3 = [(SBLockScreenManager *)self coverSheetViewController];
  char v4 = [v3 didDetectFaceOcclusionsSinceScreenOn];

  return v4;
}

- (BOOL)passcodeEntryTransientOverlayViewControllerDidDetectBottomFaceOcclusionsSinceScreenOn:(id)a3
{
  BOOL v3 = [(SBLockScreenManager *)self coverSheetViewController];
  char v4 = [v3 didDetectBottomFaceOcclusionsSinceScreenOn];

  return v4;
}

- (id)passcodeEntryTransientOverlayViewControllerStatusText
{
  return [(SBLockScreenUnlockRequest *)self->_unlockRequest title];
}

- (id)passcodeEntryTransientOverlayViewControllerStatusSubtitleText
{
  return [(SBLockScreenUnlockRequest *)self->_unlockRequest subtitle];
}

- (void)extendedKeybagLockStateChanged:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a3
    && ![(SBLockScreenManager *)self isUILocked]
    && ![(SBLockScreenManager *)self isLockScreenActive]
    && ([(BSCompoundAssertion *)self->_lockScreenPresentationPendingAssertions isActive] & 1) == 0)
  {
    char v4 = +[SBLockScreenManager sharedInstance];
    id v7 = @"SBUILockOptionsUseScreenOffModeKey";
    uint64_t v5 = [NSNumber numberWithBool:0];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v4 lockUIFromSource:11 withOptions:v6];
  }
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  if (!a3) {
    [(SBLockScreenManager *)self _evaluateWallpaperMode];
  }
}

- (void)hideDimmingLayerDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBLockScreenManager *)self coverSheetViewController];
  [v4 setHidesDimmingLayer:v3];
}

- (void)backlightController:(id)a3 didUpdateDigitizerDisabled:(BOOL)a4 tapToWakeEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v11 = a3;
  uint64_t v8 = v6 & v5;
  [(SBTapToWakeController *)self->_tapToWakeController setDigitizerInTapToWakeMode:v8];
  tapToWakeController = self->_tapToWakeController;
  if (v8 == 1) {
    uint64_t v10 = [v11 tapToWakeRequiresHitTestSuppression];
  }
  else {
    uint64_t v10 = 0;
  }
  [(SBTapToWakeController *)tapToWakeController setDigitizerModeRequiresHitTestSuppression:v10];
}

- (void)backlightController:(id)a3 willTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  id v7 = a3;
  if (a4 != 3)
  {
    id v9 = v7;
    char v8 = [(SBFUserAuthenticationController *)self->_userAuthController hasPasscodeSet];
    id v7 = v9;
    if ((v8 & 1) == 0)
    {
      [(SBLockScreenManager *)self _setSystemApertureProudLockElementVisible:0 backlightState:a4 withReason:@"BacklightInactive"];
      id v7 = v9;
    }
  }
}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  if (a4 == 3)
  {
    [(SBLockScreenManager *)self _clearAuthenticationLockAssertion];
    if ([(SBLockScreenManager *)self _requiresEmptyLockElementForBacklightState:3])
    {
      [(SBLockElementViewProvider *)self->_lockElement setEmpty:1];
    }
    [(SBLockScreenManager *)self _showSystemApertureProudLockElementForBacklightState:3 WithReason:@"BacklightInactive"];
  }
}

- (BOOL)_shouldEmulateInterstitialPresentationForAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSAssistiveTouchEnabled() != 0;
  BOOL v6 = [(SBLockScreenManager *)self coverSheetViewController];
  BOOL v7 = 0;
  if (v6 && (!v3 || v5)) {
    BOOL v7 = SBFEffectiveHomeButtonType() == 2;
  }

  return v7;
}

- (void)_emulateInterstitialPasscodePresentationForAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBLockScreenManager *)self coverSheetViewController];
  if ([(SBLockScreenManager *)self _shouldEmulateInterstitialPresentationForAccessibility:v3])
  {
    [v5 prepareForInterstitialPresentation];
    [v5 updateInterstitialPresentationWithProgress:0.0];
    if (v3)
    {
      BOOL v6 = (void *)MEMORY[0x1E4F42FF0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __80__SBLockScreenManager__emulateInterstitialPasscodePresentationForAccessibility___block_invoke;
      v9[3] = &unk_1E6AF4AC0;
      id v10 = v5;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      void v7[2] = __80__SBLockScreenManager__emulateInterstitialPasscodePresentationForAccessibility___block_invoke_2;
      v7[3] = &unk_1E6AF5350;
      id v8 = v10;
      [v6 animateWithDuration:v9 animations:v7 completion:0.4];
    }
    else
    {
      [v5 cleanupInterstitialPresentationToPresented:1 inPlace:0];
    }
  }
}

uint64_t __80__SBLockScreenManager__emulateInterstitialPasscodePresentationForAccessibility___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInterstitialPresentationWithProgress:1.0];
}

uint64_t __80__SBLockScreenManager__emulateInterstitialPasscodePresentationForAccessibility___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupInterstitialPresentationToPresented:1 inPlace:0];
}

- (SBLockScreenEnvironment)lockScreenEnvironment
{
  return self->_lockScreenEnvironment;
}

- (void)setUIUnlocking:(BOOL)a3
{
  self->_uiUnlocking = a3;
}

- (SBFLockOutStatusProvider)_lockOutController
{
  return self->_lockOutController;
}

- (void)_setLockOutController:(id)a3
{
}

- (SBFUserAuthenticationController)_userAuthController
{
  return self->_userAuthController;
}

- (SBLiftToWakeManager)_liftToWakeManager
{
  return self->_liftToWakeManager;
}

- (void)_setLiftToWakeManager:(id)a3
{
}

- (SBTapToWakeController)_tapToWakeController
{
  return self->_tapToWakeController;
}

- (void)_setTapToWakeController:(id)a3
{
}

- (SBMotionDetectionWakeController)_motionDetectionWakeController
{
  return self->_motionDetectionWakeController;
}

- (void)_setMotionDetectionWakeController:(id)a3
{
}

- (SBLockScreenOrientationManager)lockScreenOrientationManager
{
  return self->_lockScreenOrientationManager;
}

- (BOOL)isWaitingToLockUI
{
  return self->_isWaitingToLockUI;
}

- (id)unlockActionBlock
{
  return self->_unlockActionBlock;
}

- (void)setUnlockActionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unlockActionBlock, 0);
  objc_storeStrong((id *)&self->_lockScreenOrientationManager, 0);
  objc_storeStrong((id *)&self->_captureApplicationLaunchRequest, 0);
  objc_storeStrong((id *)&self->_lostModePreflightLocalAuthContext, 0);
  objc_storeStrong((id *)&self->_lostModeBiometricAuthenticationTransientOverlay, 0);
  objc_storeStrong((id *)&self->_lockElementBloomSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_lockElementSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_motionDetectionIdleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_lockScreenPresentationPendingAssertions, 0);
  objc_storeStrong((id *)&self->_delayedLockReason, 0);
  objc_storeStrong((id *)&self->_lockElement, 0);
  objc_storeStrong((id *)&self->_proudLockAssertion, 0);
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_authenticationFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_mesaUnlockingDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_mesaAutoUnlockingDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_mesaWalletPreArmDisabledReasons, 0);
  objc_storeStrong((id *)&self->_mesaWalletPreArmDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_mesaCoordinatorDisabledAssertions, 0);
  objc_storeStrong((id *)&self->_motionDetectionWakeController, 0);
  objc_storeStrong((id *)&self->_mouseButtonDownGesture, 0);
  objc_storeStrong((id *)&self->_tapToWakeController, 0);
  objc_storeStrong((id *)&self->_liftToWakeManager, 0);
  objc_storeStrong((id *)&self->_userAuthController, 0);
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong(&self->_alertLaunchFinish, 0);
  objc_storeStrong((id *)&self->_wakeToRemoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_autoUnlockRuleAggregator, 0);
  objc_storeStrong((id *)&self->_lockScreenDisabledAssertionManager, 0);
  objc_storeStrong((id *)&self->_sustainAuthenticationWhileUIUnlockedAssertion, 0);
  objc_storeStrong((id *)&self->_passcodeEntryTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_unlockRequest, 0);
  objc_storeStrong((id *)&self->_lockStateObservers, 0);
  objc_storeStrong((id *)&self->_homeButtonSuppressAfterUnlockRecognizer, 0);
  objc_storeStrong((id *)&self->_homeButtonShowPasscodeRecognizer, 0);
  objc_storeStrong((id *)&self->_lockScreenEnvironment, 0);
  objc_storeStrong((id *)&self->_pearlInterlockObserver, 0);
  objc_storeStrong((id *)&self->_biometricResourceObserver, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationCoordinator, 0);
}

- (void)lockUIFromSource:(os_log_t)log withOptions:completion:.cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  id v2 = "-[SBLockScreenManager lockUIFromSource:withOptions:completion:]";
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "%s unknown lock source %d; ignoring.",
    (uint8_t *)&v1,
    0x12u);
}

- (void)handleTransitionRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "transition away from the lock screen requested, but an externalLockProvider still requires unlock. Dropping request.", v1, 2u);
}

void __72__SBLockScreenManager__finishUIUnlockFromSource_withOptions_completion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 debugDescription];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "Error while launching capture application (%@): %@", (uint8_t *)&v6, 0x16u);
}

- (void)_unlockWithRequest:(const char *)a1 cancelPendingRequests:completion:.cold.1(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  __int16 v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_33();
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, 0x3Au);
}

- (void)_maybeLaunchSetupForcingCheckIfNotBricked:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Launching buddy", v1, 2u);
}

@end