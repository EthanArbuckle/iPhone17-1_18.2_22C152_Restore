@interface SBMainWorkspace
+ (id)_instanceIfExists;
+ (id)_sharedInstanceWithNilCheckPolicy:(int64_t)a3;
+ (id)debugDescription;
+ (id)sharedInstance;
+ (id)start;
- (BOOL)_applicationProcessExited:(id)a3 withContext:(id)a4;
- (BOOL)_canAppWithBundleIdentifier:(id)a3 requestMovingContentToSceneOpenApplicationOptions:(id)a4;
- (BOOL)_canExecuteTransitionRequest:(id)a3 forExecution:(BOOL)a4;
- (BOOL)_canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin:(id)a3 givenOrigin:(id)a4 trustedRequest:(BOOL)a5 outReason:(id *)a6;
- (BOOL)_executeApplicationTransitionRequest:(id)a3;
- (BOOL)_executeTransientOverlayTransitionRequest:(id)a3;
- (BOOL)_executeTransitionRequest:(id)a3 options:(unint64_t)a4 validator:(id)a5;
- (BOOL)_handleSetupExited:(id)a3;
- (BOOL)_isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:(id)a3 options:(id)a4 origin:(id)a5;
- (BOOL)_preflightTransitionRequest:(id)a3 forExecution:(BOOL)a4;
- (BOOL)_removeApplicationEntitiesFromWorkspace:(id)a3 error:(id *)a4;
- (BOOL)_setCurrentTransactionForRequest:(id)a3 fallbackProvider:(id)a4;
- (BOOL)canExecuteTransitionRequest:(id)a3;
- (BOOL)defaultShouldAutorotateForTransientOverlayScenePresenter:(id)a3;
- (BOOL)dismissAllTransientOverlayPresentationsAnimated:(BOOL)a3;
- (BOOL)dismissTransientOverlayViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)executeTransitionRequest:(id)a3;
- (BOOL)executeTransitionRequest:(id)a3 withValidator:(id)a4;
- (BOOL)isApplicationRunningAsViewService:(id)a3;
- (BOOL)isKeyboardVisibleForSpringBoardForTransientOverlayScenePresenter:(id)a3;
- (BOOL)isMedusaCapable;
- (BOOL)isPowerDownTransientOverlayTopmost;
- (BOOL)presentTransientOverlayViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)requestTransitionWithBuilder:(id)a3;
- (BOOL)requestTransitionWithOptions:(unint64_t)a3 builder:(id)a4 validator:(id)a5;
- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5;
- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5 validator:(id)a6;
- (BOOL)transientOverlayScenePresenter:(id)a3 shouldResignFirstResponderForKeyWindow:(id)a4;
- (BOOL)transientOverlayScenePresenter:(id)a3 shouldRestoreFirstResponderForKeyWindow:(id)a4;
- (FBSceneManager)sceneManager;
- (NSString)debugDescription;
- (SBHardwareButtonZStackClient)zStackHardwareButtonClient;
- (SBIdleTimerCoordinating)idleTimerCoordinator;
- (SBIdleTimerProviding)_activeIdleTimerProvider;
- (SBInCallPresentationManager)inCallPresentationManager;
- (SBInCallTransientOverlayManager)inCallTransientOverlayManager;
- (SBKeyboardDismissalManager)keyboardDismissalManager;
- (SBKeyboardFocusControlling)keyboardFocusController;
- (SBMainWorkspace)init;
- (SBMainWorkspace)initWithEventQueue:(id)a3;
- (SBPIPControllerCoordinator)pipCoordinator;
- (SBSystemNotesManager)systemNotesManager;
- (SBTransientOverlayPresentationManager)transientOverlayPresentationManager;
- (SBUniversalControlServer)universalControlServer;
- (SBWindowScene)mainWindowScene;
- (SBWorkspaceTransaction)currentTransaction;
- (id)_alertItemForPreventingLaunchOfApp:(id)a3 fromTrustState:(unint64_t)a4;
- (id)_applicationForIdentifier:(id)a3;
- (id)_generateIdleTimerBehaviorForReason:(id)a3;
- (id)_handlerForExtensionPoint:(id)a3;
- (id)_parseShellArguments:(id)a3;
- (id)_sceneComparatorForApplication:(id)a3 keyboardFocusScene:(id)a4;
- (id)_selectTransactionForAppActivationRequest:(id)a3;
- (id)_selectTransactionForAppActivationUnderMainScreenLock:(id)a3 withResult:(id)a4;
- (id)_selectTransactionForAppActivationUnderMainScreenLockRequest:(id)a3;
- (id)_selectTransactionForAppEntityRemoved:(id)a3;
- (id)_selectTransactionForAppRelaunch:(id)a3;
- (id)_selectTransactionForReturningToTheLockScreenAndForceToBuddy:(BOOL)a3;
- (id)_selectTransactionForReturningToTheLockScreenWithRequest:(id)a3;
- (id)_selectTransactionForTransientOverlayPresentationRequest:(id)a3;
- (id)_targetWindowSceneForApplication:(id)a3 options:(id)a4 settings:(id)a5 requireForeground:(BOOL)a6 targetDisplayConfiguration:(id *)a7 error:(id *)a8;
- (id)_targetWindowSceneForApplication:(id)a3 preferringDisplay:(id)a4 requireForeground:(BOOL)a5 options:(id)a6;
- (id)_transactionForTransitionRequest:(id)a3;
- (id)_validateRequestToOpenApplication:(id)a3 options:(id)a4 origin:(id)a5 error:(id *)a6;
- (id)bannerLongLookPresentationObservationTokenForTransientOverlayScenePresenter:(id)a3;
- (id)controlCenterPresentationObservationTokenForTransientOverlayScenePresenter:(id)a3;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)createRequestForApplicationActivation:(id)a3 options:(unint64_t)a4;
- (id)createRequestForApplicationActivation:(id)a3 withDisplayConfiguration:(id)a4 options:(unint64_t)a5;
- (id)createRequestWithOptions:(unint64_t)a3;
- (id)createRequestWithOptions:(unint64_t)a3 displayConfiguration:(id)a4;
- (id)currentStatusBarSettingsForTransientOverlayScenePresenter:(id)a3;
- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5;
- (id)inCallPresentationManager:(id)a3 createPresentationSessionWithSceneHandle:(id)a4;
- (id)pipControllerForType:(int64_t)a3;
- (id)siriPresentationObservationTokenForTransientOverlayScenePresenter:(id)a3;
- (id)systemServiceApplicationInfoProvider:(id)a3;
- (id)transientOverlayScenePresenter:(id)a3 acquireBannerLongLookWindowLevelAssertionWithReason:(id)a4 windowLevel:(double)a5;
- (id)transientOverlayScenePresenter:(id)a3 acquireControlCenterWindowLevelAssertionWithReason:(id)a4 windowLevel:(double)a5;
- (id)transientOverlayScenePresenter:(id)a3 acquireDeviceOrientationUpdateDeferralAssertionWithReason:(id)a4;
- (id)transientOverlayScenePresenter:(id)a3 acquireDisableAutoUnlockAssertionWithReason:(id)a4;
- (id)transientOverlayScenePresenter:(id)a3 acquireHideAppStatusBarAssertionWithReason:(id)a4 animated:(BOOL)a5;
- (id)transientOverlayScenePresenter:(id)a3 acquireInteractiveScreenshotGestureDisabledAssertionWithReason:(id)a4;
- (id)transientOverlayScenePresenter:(id)a3 acquireProximitySensorEnabledAssertionWithReason:(id)a4;
- (id)transientOverlayScenePresenter:(id)a3 acquireSiriWindowLevelAssertionWithReason:(id)a4 windowLevel:(double)a5;
- (id)transientOverlayScenePresenter:(id)a3 acquireWallpaperAnimationSuspensionAssertionWithReason:(id)a4;
- (id)transientOverlayScenePresenter:(id)a3 newSceneDeactivationAssertionWithReason:(int64_t)a4;
- (int64_t)defaultPreferredInterfaceOrientationForPresentationForTransientOverlayScenePresenter:(id)a3;
- (int64_t)inCallPresentationManager:(id)a3 interfaceOrientationForBannerPresentationInWindowScene:(id)a4;
- (int64_t)inCallPresentationManager:(id)a3 interfaceOrientationForTransientOverlayPresentationInWindowScene:(id)a4;
- (unint64_t)defaultSupportedInterfaceOrientationsForTransientOverlayScenePresenter:(id)a3;
- (void)_addRequestCompletionBlock:(id)a3 toTransaction:(id)a4;
- (void)_addStateCaptureHandlers;
- (void)_attemptUnlockToApplication:(id)a3 showPasscode:(BOOL)a4 origin:(id)a5 givenOrigin:(id)a6 options:(id)a7 completion:(id)a8;
- (void)_broadcastCurrentTransaction;
- (void)_cleanupAppRepairRequest:(id)a3;
- (void)_cleanupForRemovedAppEntity:(id)a3;
- (void)_coversheetDidDismiss;
- (void)_coversheetDidPresent;
- (void)_destroyApplicationSceneEntity:(id)a3;
- (void)_determineSourceForTransitionRequest:(id)a3;
- (void)_dismissPresentedControlCenterModule:(id)a3;
- (void)_executeSuspendedTransactionForRequest:(id)a3;
- (void)_finishInitialization;
- (void)_handleBuddyLaunchFinished;
- (void)_handleKeyShortcutHUDVisibilityDidDismiss;
- (void)_handleKeyShortcutHUDVisibilityDidPresent:(id)a3;
- (void)_handleOpenApplicationRequest:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7;
- (void)_handleTrustedOpenRequestForApplication:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7;
- (void)_handleUntrustedOpenRequestForApplication:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7;
- (void)_handleUserActionRequest:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7;
- (void)_initializeAndObserveDefaults;
- (void)_noteDidWakeFromSleep;
- (void)_proposeIdleTimerBehaviorForReason:(id)a3;
- (void)_removeApplicationEntities:(id)a3 withDestructionIntent:(id)a4 completion:(id)a5;
- (void)_resume;
- (void)_setActiveIdleTimerProvider:(id)a3;
- (void)_suspend;
- (void)_updateActivationSettings:(id)a3 forRequestWithOptions:(id)a4 clientProcess:(id)a5 application:(id)a6;
- (void)_updateMedusaCapabilitySendingNotification:(BOOL)a3;
- (void)applicationProcessDebuggingStateDidChange:(id)a3;
- (void)applicationProcessDidExit:(id)a3 withContext:(id)a4;
- (void)applicationProcessDidLaunch:(id)a3;
- (void)applicationProcessWillLaunch:(id)a3;
- (void)backlightController:(id)a3 didAnimateBacklightToFactor:(float)a4 source:(int64_t)a5;
- (void)controlCenterModuleTransientOverlayViewControllerNeedsDismissal:(id)a3;
- (void)dealloc;
- (void)dismissPowerDownTransientOverlayWithCompletion:(id)a3;
- (void)inCallPresentationManagerRequestsHandlingOfDeferredUILock:(id)a3;
- (void)powerDownViewControllerDidDisappear:(id)a3;
- (void)powerDownViewControllerRequestsDismissal:(id)a3;
- (void)powerDownViewControllerRequestsPowerDown:(id)a3;
- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (void)presentPowerDownTransientOverlay;
- (void)process:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5;
- (void)processDidExit:(id)a3;
- (void)processManager:(id)a3 didAddProcess:(id)a4;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)registerHandler:(id)a3 forExtensionPoint:(id)a4;
- (void)setCurrentTransaction:(id)a3;
- (void)setIdleTimerCoordinator:(id)a3;
- (void)setMainWindowScene:(id)a3;
- (void)setPipCoordinator:(id)a3;
- (void)systemService:(id)a3 canActivateApplication:(id)a4 withResult:(id)a5;
- (void)systemService:(id)a3 handleActions:(id)a4 origin:(id)a5 withResult:(id)a6;
- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5;
- (void)systemService:(id)a3 isPasscodeLockedOrBlockedWithResult:(id)a4;
- (void)systemService:(id)a3 prepareForShutdownWithOptions:(id)a4 origin:(id)a5;
- (void)systemServicePrepareForExit:(id)a3 andRelaunch:(BOOL)a4;
- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4;
- (void)systemSleepMonitorDidWakeFromSleep:(id)a3;
- (void)systemSleepMonitorSleepRequestAborted:(id)a3;
- (void)systemSleepMonitorWillWakeFromSleep:(id)a3;
- (void)transactionDidComplete:(id)a3;
- (void)transientOverlayScenePresenter:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5;
- (void)transientOverlayScenePresenter:(id)a3 preferredWhitePointAdaptivityStyleDidChangeWithAnimationSettings:(id)a4;
- (void)transientOverlayScenePresenter:(id)a3 registerCoverSheetExternalBehaviorProvider:(id)a4;
- (void)transientOverlayScenePresenter:(id)a3 unregisterCoverSheetExternalBehaviorProvider:(id)a4;
- (void)transientOverlayScenePresenter:(id)a3 willChangeTopmostViewControllerInterfaceOrientationToOrientation:(int64_t)a4;
- (void)transientOverlayScenePresenter:(id)a3 willPresentViewController:(id)a4;
- (void)transientOverlayScenePresenterRequestsAppIconForceTouchDismissal:(id)a3 animated:(BOOL)a4;
- (void)transientOverlayScenePresenterRequestsControlCenterDismissal:(id)a3 animated:(BOOL)a4;
- (void)transientOverlayScenePresenterRequestsSiriDismissal:(id)a3 animated:(BOOL)a4;
- (void)unregisterHandler:(id)a3 forExtensionPoint:(id)a4;
- (void)watchdogFired:(id)a3;
@end

@implementation SBMainWorkspace

+ (id)_sharedInstanceWithNilCheckPolicy:(int64_t)a3
{
  if (a3 == 1)
  {
    if (!_sharedInstanceWithNilCheckPolicy____sharedInstance)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:a1 file:@"SBWorkspace.m" lineNumber:1749 description:@"you can't call this before [SBMainWorkspace start]"];
    }
  }
  else if (a3 == 2 && !_sharedInstanceWithNilCheckPolicy____sharedInstance)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBMainWorkspace);
    v4 = (void *)_sharedInstanceWithNilCheckPolicy____sharedInstance;
    _sharedInstanceWithNilCheckPolicy____sharedInstance = (uint64_t)v3;

    kdebug_trace();
  }
  v5 = (void *)_sharedInstanceWithNilCheckPolicy____sharedInstance;
  return v5;
}

- (BOOL)isMedusaCapable
{
  return self->_medusaCapable;
}

- (SBTransientOverlayPresentationManager)transientOverlayPresentationManager
{
  return self->_transientOverlayPresentationManager;
}

- (SBIdleTimerProviding)_activeIdleTimerProvider
{
  v3 = +[SBLockScreenManager sharedInstanceIfExists];
  v4 = [(id)SBApp windowSceneManager];
  v5 = [v4 connectedWindowScenes];
  v6 = objc_msgSend(v5, "bs_firstObjectPassingTest:", &__block_literal_global_311);
  v7 = [v6 modalLibraryController];
  v8 = [(id)SBApp accidentalActivationMitigationSessionCoordinator];
  if ([v8 hasIdleTimerBehaviors])
  {
    id v9 = v8;
  }
  else
  {
    uint64_t v10 = 224;
    if ([(SBTransientOverlayPresentationManager *)self->_transientOverlayPresentationManager hasIdleTimerBehaviors])
    {
      goto LABEL_4;
    }
    if (([v3 isUILocked] & 1) != 0
      || (+[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance"), v12 = objc_claimAutoreleasedReturnValue(), int v13 = [v12 isVisible], v12, v13))
    {
      id v9 = v3;
      goto LABEL_9;
    }
    if ([v7 hasIdleTimerBehaviors])
    {
      id v9 = v7;
      goto LABEL_9;
    }
    uint64_t v10 = 256;
    if ([(SBPIPControllerCoordinator *)self->_pipCoordinator hasIdleTimerBehaviors])
    {
LABEL_4:
      v11 = *(Class *)((char *)&self->super.super.isa + v10);
    }
    else
    {
      v16 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
      int v17 = [v16 hasIdleTimerBehaviors];

      if (v17)
      {
        id v9 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
        goto LABEL_9;
      }
      v11 = (void *)SBApp;
    }
    id v9 = v11;
  }
LABEL_9:
  id v14 = v9;

  return (SBIdleTimerProviding *)v14;
}

uint64_t __43__SBMainWorkspace__activeIdleTimerProvider__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainDisplayWindowScene];
}

- (SBPIPControllerCoordinator)pipCoordinator
{
  return self->_pipCoordinator;
}

- (SBInCallPresentationManager)inCallPresentationManager
{
  return self->_inCallPresentationManager;
}

+ (id)sharedInstance
{
  return (id)[a1 _sharedInstanceWithNilCheckPolicy:1];
}

- (id)_validateRequestToOpenApplication:(id)a3 options:(id)a4 origin:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!a6)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"SBWorkspace.m", 4295, @"Invalid parameter not satisfying: %@", @"outError != nil" object file lineNumber description];
  }
  *a6 = 0;
  id v14 = +[SBApplicationController sharedInstanceIfExists];
  v15 = [v14 applicationWithBundleIdentifier:v11];
  v57 = [v15 info];
  if (v11 && !v15)
  {
    FBSOpenApplicationErrorCreate();
    id v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  int v17 = objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F625F8], objc_opt_class());
  char v48 = [v17 BOOLValue];

  v18 = objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F625F0], objc_opt_class());
  v52 = v18;
  v55 = self;
  if (v18)
  {
    v19 = [v18 objectForKey:*MEMORY[0x1E4F62508]];
    BOOL v47 = v19 != 0;
  }
  else
  {
    BOOL v47 = 0;
  }
  uint64_t v54 = objc_msgSend(v12, "bs_safeURLForKey:", *MEMORY[0x1E4F62678]);
  v20 = [v12 objectForKey:*MEMORY[0x1E4F62618]];
  v21 = objc_msgSend(v20, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F4F1C8], objc_opt_class());
  int v49 = [v21 BOOLValue];

  v51 = v20;
  v22 = objc_msgSend(v20, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F4F1C0], objc_opt_class());
  int v50 = [v22 BOOLValue];

  v56 = +[SBSyncController sharedInstance];
  v23 = +[SBSetupManager sharedInstance];
  v53 = v23;
  if ([v23 isInSetupMode])
  {
    char v24 = [v23 updateInSetupMode];
    BOOL v25 = [(SBMainWorkspace *)v55 _isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:v11 options:v12 origin:v13];
    if (v24) {
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v25 = [(SBMainWorkspace *)v55 _isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:v11 options:v12 origin:v13];
  }
  if (!v25)
  {
    +[SBApplicationController sharedInstanceIfExists];
    id v26 = v13;
    v28 = v27 = v14;
    v29 = [v28 setupApplication];
    v30 = [v29 processState];
    int v31 = [v30 isForeground];

    id v14 = v27;
    id v13 = v26;
    if (v31)
    {
LABEL_15:
      if (v57 && ([v57 isLaunchableDuringSetup] & 1) == 0) {
        goto LABEL_37;
      }
    }
  }
  v32 = objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA7000], objc_opt_class());
  int v33 = [v32 BOOLValue];

  if (!v33
    || ([v13 hasEntitlement:@"com.apple.springboard.inCallPresentation"] & 1) != 0
    || (+[SBDefaults localDefaults],
        v34 = objc_claimAutoreleasedReturnValue(),
        [v34 inCallPresentationDefaults],
        v35 = objc_claimAutoreleasedReturnValue(),
        char v36 = [v35 skipPromptUnlockEntitlementCheck],
        v35,
        v34,
        (v36 & 1) != 0))
  {
    v37 = objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA70E0], objc_opt_class());

    if (([v13 hasEntitlement:@"com.apple.springboard.display-lookup"] & 1) != 0
      || (char v38 = [v13 hasEntitlement:@"com.apple.springboard.testautomation"], !v37)
      || (v38 & 1) != 0)
    {
      v39 = (void *)v54;
      if (((v49 | v50) & 1) != 0 || [v15 isAnyTerminationAssertionInEffect])
      {
        v40 = v52;
        if (![v15 isAnyTerminationAssertionInEffect])
        {
          char v41 = v48;
          if (v54) {
            char v41 = 1;
          }
          if ((v41 & 1) == 0 && (v49 & v50) == 0) {
            goto LABEL_30;
          }
        }
      }
      else
      {
        v40 = v52;
        if (([v56 isRestoring] & 1) == 0
          && ![v56 isResetting]
          && (__SBWFinishedBoot & 1) != 0)
        {
LABEL_30:
          if (!v15)
          {
            [v57 unauthoritativeTrustState];
LABEL_48:
            id v16 = v15;
            goto LABEL_39;
          }
          if (![(id)SBApp isBundleIdentifierRestrictionDisabled:v11]
            && (!v47
             || ([v57 supportsFetchBackgroundMode] & 1) != 0
             || ([v15 isSystemApplication] & 1) != 0))
          {
            uint64_t v43 = [v57 unauthoritativeTrustState];
            if (v43 == 8) {
              goto LABEL_48;
            }
            if ((v48 & 1) == 0)
            {
              v44 = [(SBMainWorkspace *)v55 _alertItemForPreventingLaunchOfApp:v15 fromTrustState:v43];
              if (v44)
              {
                v45 = +[SBAlertItemsController sharedInstance];
                [v45 activateAlertItem:v44];

                v39 = (void *)v54;
              }
            }
          }
        }
      }
      FBSOpenApplicationErrorCreate();
      id v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_39;
    }
  }
LABEL_37:
  FBSOpenApplicationErrorCreate();
  id v16 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  v40 = v52;
  v39 = (void *)v54;
LABEL_39:

LABEL_40:
  return v16;
}

void __47__SBMainWorkspace_applicationProcessDidLaunch___block_invoke(uint64_t a1)
{
  v2 = +[SBApplicationController sharedInstanceIfExists];
  v3 = [*(id *)(a1 + 32) bundleIdentifier];
  id v7 = [v2 applicationWithBundleIdentifier:v3];

  [v7 _processDidLaunch:*(void *)(a1 + 32)];
  v4 = +[SBApplicationController sharedInstance];
  id v5 = [v4 setupApplication];

  v6 = v7;
  if (v7 == v5)
  {
    [*(id *)(a1 + 40) _handleBuddyLaunchFinished];
    v6 = v7;
  }
}

- (BOOL)_isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:(id)a3 options:(id)a4 origin:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [a4 objectForKey:*MEMORY[0x1E4FA70F8]];
  if (v9)
  {
    int v10 = [v8 hasEntitlement:@"com.apple.springboard.launchAppAfterSetup"];

    if (v10)
    {
      v14[0] = @"com.apple.AppStore";
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      id v12 = v11;
      if (v7) {
        LOBYTE(v9) = [v11 containsObject:v7];
      }
      else {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return (char)v9;
}

uint64_t __42__SBMainWorkspace_transactionDidComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentTransaction:0];
}

- (void)transactionDidComplete:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (SBWorkspaceTransaction *)a3;
  if (self->_currentTransaction != v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBWorkspace.m", 5734, @"Not the same transaction: _currentTransaction = %p vs transaction = %p", self->_currentTransaction, v5);
  }
  int v6 = [(SBWorkspaceTransaction *)v5 isFailed];
  id v7 = SBLogTransactionVerbose();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    if (v8)
    {
      id v9 = SBLogTransactionVerbose();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[SBMainWorkspace transactionDidComplete:]();
      }
    }
    else
    {
      id v9 = SBLogTransaction();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(SBWorkspaceTransaction *)v5 _descriptionProem];
        *(_DWORD *)buf = 138543362;
        int v17 = v11;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Root transaction failed: %{public}@. Attempting to force us back to SB...", buf, 0xCu);
      }
    }

    __SBWorkspaceActivateSpringBoardWithResult(0, 0, 0, 0, 1, 0, 0);
  }
  else
  {
    if (v8)
    {
      int v10 = SBLogTransactionVerbose();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[SBMainWorkspace transactionDidComplete:]();
      }
    }
    else
    {
      int v10 = SBLogTransaction();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(SBWorkspaceTransaction *)v5 _descriptionProem];
        *(_DWORD *)buf = 138543362;
        int v17 = v12;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Root transaction complete: %{public}@", buf, 0xCu);
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ![(SBWorkspaceTransaction *)v5 clearsCompletionAsynchronously])
  {
    id v13 = SBLogTransaction();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "Running next transaction event synchronously.", buf, 2u);
    }

    [(SBMainWorkspace *)self setCurrentTransaction:0];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__SBMainWorkspace_transactionDidComplete___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (id)_transactionForTransitionRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_currentTransaction)
  {
    int v6 = [(SBWorkspace *)self eventQueue];
    id v7 = [v6 executingEvent];

    if (!v7)
    {
      BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"SBWorkspace.m" lineNumber:1966 description:@"must be called from a transaction or on a workspace event"];
    }
  }
  id v9 = [v5 transientOverlayContext];
  if (v9) {
    [(SBMainWorkspace *)self _selectTransactionForTransientOverlayPresentationRequest:v5];
  }
  else {
  int v10 = [(SBMainWorkspace *)self _selectTransactionForAppActivationRequest:v5];
  }
  id v11 = SBLogTransactionVerbose();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  if (v12)
  {
    id v13 = SBLogTransactionVerbose();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SBMainWorkspace _transactionForTransitionRequest:]();
    }
  }
  else
  {
    id v13 = SBLogTransaction();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [MEMORY[0x1E4F4F718] descriptionForObject:v10];
      v15 = [v10 transitionRequest];
      id v16 = [v15 compactDescriptionBuilder];
      int v17 = [v16 build];
      int v19 = 138543618;
      v20 = v14;
      __int16 v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "Prepared %{public}@ for transition request:\n%{public}@", (uint8_t *)&v19, 0x16u);
    }
  }

  return v10;
}

- (void)_updateActivationSettings:(id)a3 forRequestWithOptions:(id)a4 clientProcess:(id)a5 application:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9)
  {
    uint64_t v54 = v12;
    v55 = v11;
    [v9 setFlag:1 forActivationSetting:50];
    id v13 = objc_msgSend(v10, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F625F8], objc_opt_class());
    int v52 = [v13 BOOLValue];

    uint64_t v14 = objc_msgSend(v10, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F62658], objc_opt_class());
    [(id)*MEMORY[0x1E4FB3848] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:42];
    [(id)*MEMORY[0x1E4FB3868] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:43];
    [(id)*MEMORY[0x1E4F38D50] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:54];
    [(id)*MEMORY[0x1E4F44780] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:55];
    [(id)*MEMORY[0x1E4FA7090] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:47];
    [(id)*MEMORY[0x1E4FA7088] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:53];
    [(id)*MEMORY[0x1E4FA7098] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:63];
    [(id)*MEMORY[0x1E4FA7078] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:64];
    [(id)*MEMORY[0x1E4FA7080] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:65];
    [(id)*MEMORY[0x1E4F5AD50] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:45];
    v53 = (void *)v14;
    [(id)*MEMORY[0x1E4F4B778] isEqual:v14];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:59];
    v56 = objc_msgSend(v10, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA7148], objc_opt_class());
    if (v56)
    {
      uint64_t v15 = 0;
      char v16 = 1;
      while (1)
      {
        char v17 = v16;
        uint64_t v18 = [(SBPIPControllerCoordinator *)self->_pipCoordinator controllerForType:v15];
        int v19 = [v18 hostedAppSceneHandles];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __93__SBMainWorkspace__updateActivationSettings_forRequestWithOptions_clientProcess_application___block_invoke;
        v58[3] = &unk_1E6AF5D80;
        id v59 = v56;
        int v20 = objc_msgSend(v19, "bs_containsObjectPassingTest:", v58);

        if (v20) {
          break;
        }

        char v16 = 0;
        uint64_t v15 = 1;
        if ((v17 & 1) == 0) {
          goto LABEL_8;
        }
      }
      [v9 setFlag:1 forActivationSetting:57];
      __int16 v21 = [NSNumber numberWithInteger:v15];
      [v9 setObject:v21 forActivationSetting:58];
    }
LABEL_8:
    if ((v52 & 1) == 0 && +[SBAssistantController isVisible])
    {
      v22 = +[SBAssistantController defaultActivationSettings];
      [v9 applyActivationSettings:v22];
    }
    uint64_t v23 = objc_msgSend(v10, "bs_safeDictionaryForKey:", *MEMORY[0x1E4F62670]);
    char v24 = (void *)[v23 mutableCopy];

    BOOL v25 = +[SBApplicationController sharedInstanceIfExists];
    id v26 = objc_msgSend(v25, "applicationWithPid:", objc_msgSend(v55, "pid"));
    v27 = [v26 bundleIdentifier];

    v28 = (uint64_t *)MEMORY[0x1E4F43688];
    if (!v27)
    {
      v27 = objc_msgSend(v24, "bs_safeStringForKey:", *MEMORY[0x1E4F43688]);
    }
    if ([v9 BOOLForActivationSetting:52])
    {
      [v9 setFlag:BSSettingFlagForBool() forActivationSetting:3];
      v29 = objc_msgSend(v10, "bs_safeStringForKey:", *MEMORY[0x1E4F62648]);
      [v9 setObject:v29 forActivationSetting:17];

      v30 = objc_msgSend(v10, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F62608], objc_opt_class());
      [v9 setObject:v30 forActivationSetting:21];

      int v31 = objc_msgSend(v10, "bs_safeDictionaryForKey:", *MEMORY[0x1E4F62610]);
      [v9 setObject:v31 forActivationSetting:22];

      uint64_t v32 = *v28;
      int v33 = [v24 objectForKey:*v28];

      if (v33)
      {
        uint64_t v34 = objc_msgSend(v24, "bs_safeStringForKey:", v32);

        v27 = (void *)v34;
      }
      v35 = objc_msgSend(v10, "bs_safeNumberForKey:", *MEMORY[0x1E4F62650]);
      unint64_t v36 = [v35 integerValue];

      if (v36)
      {
        if (v52)
        {
          if (v36 >= 5) {
            uint64_t v37 = 2;
          }
          else {
            uint64_t v37 = qword_1D8FD0398[v36 - 1];
          }
        }
        else if (v36 == 4)
        {
          uint64_t v37 = 4;
        }
        else
        {
          uint64_t v37 = 3;
        }
        char v38 = [NSNumber numberWithInteger:v37];
        [v9 setObject:v38 forActivationSetting:30];
      }
      v39 = objc_msgSend(v10, "bs_safeStringForKey:", *MEMORY[0x1E4F62680]);
      [v9 setObject:v39 forActivationSetting:33];
    }
    v40 = [v9 objectForActivationSetting:30];

    if (!v40)
    {
      char v41 = [v54 bundleIdentifier];
      int v42 = [v41 isEqualToString:@"com.apple.InCallService"];

      if (v42) {
        [v9 setObject:&unk_1F33492F0 forActivationSetting:30];
      }
    }
    [v24 removeObjectForKey:*v28];
    uint64_t v43 = objc_msgSend(v10, "bs_safeURLForKey:", *MEMORY[0x1E4F62678]);
    [v9 setObject:v43 forActivationSetting:5];

    [v9 setObject:v24 forActivationSetting:16];
    v44 = objc_msgSend(v10, "bs_safeDictionaryForKey:", *MEMORY[0x1E4F62660]);
    [v9 setObject:v44 forActivationSetting:15];

    v45 = objc_msgSend(v10, "bs_safeNumberForKey:", *MEMORY[0x1E4FA7158]);
    [v45 BOOLValue];
    [v9 setFlag:BSSettingFlagIfYes() forActivationSetting:8];

    [v9 setObject:v27 forActivationSetting:14];
    v46 = objc_msgSend(v10, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F626C0], objc_opt_class());

    if (v46) {
      [v9 setObject:MEMORY[0x1E4F1CC38] forActivationSetting:31];
    }
    BOOL v47 = [v10 objectForKey:*MEMORY[0x1E4FB34F8]];
    [v9 setObject:v47 forActivationSetting:32];

    char v48 = [v10 objectForKey:*MEMORY[0x1E4FB3510]];
    [v9 setObject:v48 forActivationSetting:34];

    int v49 = [v54 bundleIdentifier];
    BOOL v50 = [(SBMainWorkspace *)self _canAppWithBundleIdentifier:v49 requestMovingContentToSceneOpenApplicationOptions:v10];

    if (v50)
    {
      [v9 setFlag:BSSettingFlagForBool() forActivationSetting:67];
      [v9 setFlag:BSSettingFlagForBool() forActivationSetting:68];
      [v9 setFlag:BSSettingFlagForBool() forActivationSetting:31];
    }
  }
  else
  {
    v51 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settings != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMainWorkspace _updateActivationSettings:forRequestWithOptions:clientProcess:application:]();
    }
    [v51 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

void __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  if (!v2) {
    goto LABEL_4;
  }
  if ((*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32)))
  {
    [*(id *)(a1 + 40) _determineSourceForTransitionRequest:*(void *)(a1 + 32)];
LABEL_4:
    v3 = +[SBSceneManagerCoordinator sharedInstance];
    uint64_t v4 = [*(id *)(a1 + 32) displayIdentity];
    uint64_t v32 = [v3 sceneManagerForDisplayIdentity:v4];

    id v5 = [v32 policyAggregator];
    LOBYTE(v4) = [v5 allowsTransitionRequest:*(void *)(a1 + 32)];

    int v6 = *(void **)(a1 + 32);
    if (v4)
    {
      id v7 = [v6 transientOverlayContext];
      int v31 = v7;
      if (v7) {
        objc_msgSend(v7, "transitionType", v7);
      }
      kdebug_trace();
      BOOL v8 = [*(id *)(a1 + 32) applicationContext];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = [v8 applicationSceneEntities];
      uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v9)
      {
        uint64_t v34 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v46 != v34) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            id v12 = objc_msgSend(v11, "application", v31);
            id v13 = +[SBApplicationTestingManager sharedInstance];
            [v13 markUserLaunchInitiationTime];

            uint64_t v14 = +[SBTelephonyManager sharedTelephonyManager];
            uint64_t v15 = [v12 info];
            char v16 = [v15 domainsToPreheat];
            [v14 preHeatDataLinkForDomains:v16];

            objc_initWeak(&location, v8);
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_2;
            v42[3] = &unk_1E6AF5AF0;
            objc_copyWeak(&v43, &location);
            v42[4] = v11;
            [v8 addFinalizeBlock:v42];
            char v17 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
            [v11 setObject:v17 forActivationSetting:18];

            uint64_t v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
            [v11 setObject:v18 forActivationSetting:19];

            int v19 = [v12 info];
            LODWORD(v18) = [v19 isIdentifiedGame];

            if (v18)
            {
              int v20 = dispatch_get_global_queue(25, 0);
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_3;
              block[3] = &unk_1E6AF4AC0;
              id v41 = v12;
              dispatch_async(v20, block);
            }
            objc_destroyWeak(&v43);
            objc_destroyWeak(&location);
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v9);
      }

      __int16 v21 = (void *)MEMORY[0x1E4F624D8];
      v22 = [*(id *)(a1 + 32) eventLabel];
      uint64_t v23 = v22;
      if (!v22)
      {
        uint64_t v23 = [*(id *)(a1 + 32) succinctDescription];
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_4;
      v35[3] = &unk_1E6AF5B18;
      id v24 = *(id *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      id v26 = *(void **)(a1 + 48);
      id v36 = v24;
      uint64_t v37 = v25;
      char v39 = *(unsigned char *)(a1 + 80);
      id v38 = v26;
      v27 = [v21 eventWithName:v23 handler:v35];
      if (!v22) {

      }
      if (*(unsigned char *)(a1 + 81))
      {
        v28 = [*(id *)(a1 + 40) eventQueue];
        v29 = [v28 acquireLockForReason:@"interrupting current transaction"];
        [*(id *)(a1 + 48) interruptForTransitionRequest:*(void *)(a1 + 32)];
        [v28 executeOrPrependEvent:v27];
        [v29 relinquish];
      }
      else
      {
        [v27 execute];
      }
    }
    else
    {
      [v6 declineWithReason:@"Vetoed by policy aggregator."];
    }

    return;
  }
  v30 = *(void **)(a1 + 32);
  [v30 declineWithReason:@"Vetoed by request validator."];
}

- (BOOL)_canExecuteTransitionRequest:(id)a3 forExecution:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = SBLogWorkspace();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = [v6 succinctDescription];
    *(_DWORD *)buf = 138412290;
    v61 = v8;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Can execute transition request: %@", buf, 0xCu);
  }
  if (![(SBMainWorkspace *)self _preflightTransitionRequest:v6 forExecution:v4])
  {
    [v6 declineWithReason:@"Failed preflight"];
    BOOL v17 = 0;
    goto LABEL_48;
  }
  [(SBMainWorkspace *)self _determineSourceForTransitionRequest:v6];
  uint64_t v9 = +[SBSceneManagerCoordinator sharedInstance];
  uint64_t v10 = [v6 displayIdentity];
  id v11 = [v9 sceneManagerForDisplayIdentity:v10];

  id v12 = [v11 policyAggregator];
  LOBYTE(v10) = [v12 allowsTransitionRequest:v6];

  if ((v10 & 1) == 0)
  {
    [v6 declineWithReason:@"Vetoed by policy aggregator."];
    BOOL v17 = 0;
    goto LABEL_47;
  }
  id v13 = +[SBSOSEventHandler sharedInstance];
  int v14 = [v13 isSOSActive];

  uint64_t v15 = [v6 applicationContext];
  int v54 = v14;
  if ([v15 requestedUnlockedEnvironmentMode] == 2)
  {
    if (v14)
    {
      char v16 = [NSString stringWithFormat:@"Requesting app switcher while SOS is active"];
      [v6 declineWithReason:v16];
LABEL_8:
      BOOL v17 = 0;
      goto LABEL_46;
    }
    uint64_t v18 = [(id)SBApp windowSceneManager];
    int v19 = [v6 displayIdentity];
    char v16 = [v18 windowSceneForDisplayIdentity:v19];

    int v20 = [v16 transientOverlayPresenter];
    __int16 v21 = [v20 topmostPresentedViewController];

    if (v21)
    {
      v22 = [v16 switcherController];
      uint64_t v23 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:v21];
      id v24 = [v22 appLayoutForWorkspaceTransientOverlay:v23];

      if (!v24)
      {
        long long v47 = [NSString stringWithFormat:@"Requesting app switcher and presenting switcher ineligible view controller %@", v21];
        [v6 declineWithReason:v47];

        goto LABEL_8;
      }
    }
    int v14 = v54;
  }
  if (!_canExecuteTransitionRequest_forExecution__canAppearOverSOSApps)
  {
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.siri", @"com.apple.InCallService", @"com.apple.SOSBuddy", @"com.apple.MobileSMS", @"com.apple.camera", @"com.apple.mobileslideshow", 0);
    id v26 = (void *)_canExecuteTransitionRequest_forExecution__canAppearOverSOSApps;
    _canExecuteTransitionRequest_forExecution__canAppearOverSOSApps = v25;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  char v16 = [v15 applicationSceneEntities];
  uint64_t v27 = [v16 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (!v27)
  {
    BOOL v17 = 1;
    goto LABEL_46;
  }
  uint64_t v28 = v27;
  int v52 = v11;
  v53 = v6;
  v51 = v15;
  uint64_t v29 = *(void *)v56;
  v30 = @"com.apple.PrintKit.Print-Center";
LABEL_19:
  uint64_t v31 = 0;
  while (1)
  {
    if (*(void *)v56 != v29) {
      objc_enumerationMutation(v16);
    }
    uint64_t v32 = *(void **)(*((void *)&v55 + 1) + 8 * v31);
    int v33 = [v32 application];
    uint64_t v34 = v33;
    if (!v33 || [v33 isUninstalled])
    {
      id v43 = SBLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[SBMainWorkspace _canExecuteTransitionRequest:forExecution:](v32);
      }

      v44 = FBSOpenApplicationErrorCreate();
      long long v45 = @"App is uninstalled";
      goto LABEL_40;
    }
    if ([v34 isAnyTerminationAssertionInEffect])
    {
      long long v46 = SBLogCommon();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[SBMainWorkspace _canExecuteTransitionRequest:forExecution:](v32);
      }

      long long v45 = @"App has outstanding termination assertions";
      v44 = FBSOpenApplicationErrorCreate();
LABEL_40:
      uint64_t v15 = v51;
      [v51 sendActivationResultError:v44];

      id v6 = v53;
      [v53 declineWithReason:v45];

      BOOL v17 = 0;
      id v11 = v52;
      goto LABEL_46;
    }
    v35 = [v34 bundleIdentifier];
    if (v14
      && ([(id)_canExecuteTransitionRequest_forExecution__canAppearOverSOSApps containsObject:v35] & 1) == 0)
    {
      id v38 = v16;
      v40 = [NSString stringWithFormat:@"Requesting application %@ while SOS active", v35];
      long long v48 = v53;
      int v49 = v40;
      goto LABEL_44;
    }
    if (![v35 isEqualToString:v30]) {
      goto LABEL_30;
    }
    uint64_t v36 = v28;
    uint64_t v37 = v30;
    id v38 = v16;
    char v39 = +[SBAppSwitcherServiceManager sharedInstance];
    v40 = [v39 registeredServicesSnapshot];

    id v41 = [(__CFString *)v40 serviceBundleIdentifiers];
    char v42 = [v41 containsObject:v35];

    if ((v42 & 1) == 0) {
      break;
    }

    char v16 = v38;
    int v14 = v54;
    v30 = v37;
    uint64_t v28 = v36;
LABEL_30:

    if (v28 == ++v31)
    {
      uint64_t v28 = [v16 countByEnumeratingWithState:&v55 objects:v59 count:16];
      BOOL v17 = 1;
      if (v28) {
        goto LABEL_19;
      }
      uint64_t v15 = v51;
      id v11 = v52;
      goto LABEL_45;
    }
  }
  int v49 = @"Service not registered";
  long long v48 = v53;
LABEL_44:
  [v48 declineWithReason:v49];

  BOOL v17 = 0;
  uint64_t v15 = v51;
  id v11 = v52;
  char v16 = v38;
LABEL_45:
  id v6 = v53;
LABEL_46:

LABEL_47:
LABEL_48:

  return v17;
}

- (BOOL)_preflightTransitionRequest:(id)a3 forExecution:(BOOL)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 applicationContext];
  uint64_t v69 = 0;
  int v58 = [v7 isBackground];
  v51 = v6;
  uint64_t v8 = [v6 displayIdentity];
  uint64_t v9 = [(id)SBApp windowSceneManager];
  id v59 = [v9 windowSceneForDisplayIdentity:v8];

  uint64_t v10 = +[SBSceneManagerCoordinator sharedInstance];
  uint64_t v50 = (void *)v8;
  id v11 = [v10 sceneManagerForDisplayIdentity:v8];

  int v49 = v11;
  id v12 = [v11 externalForegroundApplicationSceneHandles];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v53 = v7;
  id obj = [v7 applicationSceneEntities];
  uint64_t v13 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
  if (!v13) {
    goto LABEL_47;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v66;
  char v57 = !a4 | v58;
  int v52 = self;
  long long v56 = v12;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v66 != v15) {
        objc_enumerationMutation(obj);
      }
      BOOL v17 = *(void **)(*((void *)&v65 + 1) + 8 * i);
      uint64_t v18 = [v17 sceneHandle];
      int v19 = [v18 application];
      int v20 = [v19 info];
      __int16 v21 = [v17 objectForActivationSetting:5];
      if (v69)
      {
LABEL_43:
        id v41 = [v19 bundleIdentifier];
        int v42 = [v41 isEqualToString:@"com.apple.TVRemote"];

        if (v42)
        {
          id v43 = objc_alloc_init(SBLegacyTVRemoteAppLaunchDeniedAlertItem);
          v44 = +[SBAlertItemsController sharedInstance];
          [v44 activateAlertItem:v43];
        }
        goto LABEL_45;
      }
      if (([v12 containsObject:v18] & 1) == 0
        && _SBWorkspaceCanLaunchApplication(v17, v58, v21, v59, &v69))
      {
        if ([v20 supports64Bit])
        {
          v22 = 0;
          goto LABEL_14;
        }
        uint64_t v69 = 1;
        if (v57)
        {
          v22 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v22 = [[SBApplication32BitDeprecationAlertItem alloc] initWithApplication:v19];
LABEL_14:
        if (!v69)
        {
          uint64_t v23 = [v20 unauthoritativeTrustState];
          if (v23 != 8)
          {
            uint64_t v24 = v23;
            int v54 = SBLogCommon();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
              [(SBMainWorkspace *)v76 _preflightTransitionRequest:&v77 forExecution:v54];
            }

            uint64_t v69 = 3;
            if (v57)
            {
              id v12 = v56;
              goto LABEL_26;
            }
            uint64_t v25 = [(SBMainWorkspace *)v52 _alertItemForPreventingLaunchOfApp:v19 fromTrustState:v24];

            v22 = (SBApplication32BitDeprecationAlertItem *)v25;
          }
          id v12 = v56;
        }
        char v26 = v57;
        if (!v22) {
          char v26 = 1;
        }
        if ((v26 & 1) == 0)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __60__SBMainWorkspace__preflightTransitionRequest_forExecution___block_invoke;
          block[3] = &unk_1E6AF4AC0;
          v22 = v22;
          v64 = v22;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
        goto LABEL_26;
      }
LABEL_27:
      if (v69) {
        goto LABEL_43;
      }
      if ([v20 isArcadeApplication])
      {
        id v27 = [v20 executableURL];
        [v27 fileSystemRepresentation];
        mm0Euuzhc();
        if (v28)
        {
          int v29 = v28;
          v30 = SBLogCommon();
          id v55 = v27;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            uint64_t v31 = [v19 bundleIdentifier];
            int v32 = [v53 isBackground];
            *(_DWORD *)buf = 67109634;
            int v71 = v29;
            __int16 v72 = 2114;
            v73 = v31;
            __int16 v74 = 1024;
            int v75 = v32;
            _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_INFO, "Received FairPlay error %d while trying to launch Arcade app %{public}@ isBackground: %d", buf, 0x18u);

            id v27 = v55;
          }

          BOOL v33 = (v29 + 42587) > 3 || v29 == -42586;
          id v12 = v56;
          if (!v33)
          {
            uint64_t v69 = 3;
            id v34 = objc_alloc(MEMORY[0x1E4F4BCC0]);
            v35 = [v20 bundleIdentifier];
            uint64_t v36 = (void *)[v34 initWithBundleID:v35];

            [v36 setExitReason:16];
            objc_msgSend(v36, "setIsBackground:", objc_msgSend(v53, "isBackground"));
            if (v36)
            {
              ocelotRepairRequests = v52->_ocelotRepairRequests;
              if (!ocelotRepairRequests)
              {
                id v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
                char v39 = v52->_ocelotRepairRequests;
                v52->_ocelotRepairRequests = v38;

                ocelotRepairRequests = v52->_ocelotRepairRequests;
              }
              [(NSMutableSet *)ocelotRepairRequests addObject:v36];
              v40 = [MEMORY[0x1E4F4BCC8] defaultService];
              v61[0] = MEMORY[0x1E4F143A8];
              v61[1] = 3221225472;
              v61[2] = __60__SBMainWorkspace__preflightTransitionRequest_forExecution___block_invoke_376;
              v61[3] = &unk_1E6AF5B68;
              v61[4] = v52;
              id v62 = v36;
              [v40 repairAppWithOptions:v62 replyHandler:v61];

              id v27 = v55;
            }

            id v12 = v56;
          }
        }
      }
      if (v69) {
        goto LABEL_43;
      }
LABEL_45:
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
  }
  while (v14);
LABEL_47:

  if (v69)
  {
    long long v45 = FBSOpenApplicationErrorCreate();
    long long v46 = v53;
    [v53 sendActivationResultError:v45];

    BOOL v47 = v69 == 0;
  }
  else
  {
    BOOL v47 = 1;
    long long v46 = v53;
  }

  return v47;
}

- (BOOL)_executeApplicationTransitionRequest:(id)a3
{
  val = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  v22 = [v21 applicationContext];
  int v3 = [v22 isBackground];
  uint64_t v4 = [v22 animationDisabled];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [v22 applicationSceneEntities];
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    int v6 = v4 ^ 1;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v3 & 1 | ((v6 & 1) == 0)
          || ([*(id *)(*((void *)&v27 + 1) + 8 * i) BOOLForActivationSetting:4] & 1) != 0)
        {
          int v10 = 0;
        }
        else
        {
          int v10 = [v9 BOOLForActivationSetting:1] ^ 1;
        }
        [v9 setFlag:BSSettingFlagForBool() forActivationSetting:1];
        [v9 setFlag:BSSettingFlagForBool() forActivationSetting:3];
        if (v3)
        {
          [v22 setWaitsForSceneUpdates:0];
        }
        else
        {
          if ([v9 flagForActivationSetting:44] == 0x7FFFFFFFFFFFFFFFLL)
          {
            +[SBAssistantController isVisible];
            [v9 setFlag:BSSettingFlagForBool() forActivationSetting:44];
          }
          id v11 = +[SBIconController sharedInstance];
          int v12 = [v11 areAnyIconViewContextMenusShowing];

          if (v12) {
            [v9 setFlag:1 forActivationSetting:27];
          }
          uint64_t v13 = +[SBControlCenterController sharedInstanceIfExists];
          int v14 = [v13 isVisible];

          if (v14) {
            [v9 setFlag:1 forActivationSetting:45];
          }
          if (SBSpotlightIsVisible()) {
            [v9 setFlag:1 forActivationSetting:26];
          }
          uint64_t v15 = [(id)SBApp notificationDispatcher];
          char v16 = [v15 bannerDestination];
          int v17 = [v16 isPresentingBannerInLongLook];

          if (v17) {
            [v9 setFlag:1 forActivationSetting:28];
          }
        }
        v6 &= v10;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
    uint64_t v4 = v6 ^ 1u;
  }

  [v22 setAnimationDisabled:v4];
  if (v3)
  {
    [(SBMainWorkspace *)val _executeSuspendedTransactionForRequest:v21];
    char v18 = 1;
  }
  else
  {
    objc_initWeak(&location, val);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56__SBMainWorkspace__executeApplicationTransitionRequest___block_invoke;
    v24[3] = &unk_1E6AF5BB8;
    objc_copyWeak(&v25, &location);
    char v18 = [(SBMainWorkspace *)val _setCurrentTransactionForRequest:v21 fallbackProvider:v24];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __65__SBMainWorkspace_createRequestWithOptions_displayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  if ((v4 & 2) != 0)
  {
    [v3 setBackground:1];
    id v3 = v5;
    unint64_t v4 = *(void *)(a1 + 32);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  [v5 setAnimationDisabled:1];
  id v3 = v5;
  unint64_t v4 = *(void *)(a1 + 32);
  if ((v4 & 0x10) != 0)
  {
LABEL_4:
    [v5 setSceneless:1];
    id v3 = v5;
    unint64_t v4 = *(void *)(a1 + 32);
  }
LABEL_5:
  if ((v4 & 0x60) != 0)
  {
    [v5 setRetainsSiri:(v4 >> 5) & 1];
    id v3 = v5;
  }
}

- (void)_determineSourceForTransitionRequest:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v11 = [v3 source];
  uint64_t v4 = v9[3];
  if (!v4)
  {
    id v5 = [v3 applicationContext];
    int v6 = [v5 applicationSceneEntities];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__SBMainWorkspace__determineSourceForTransitionRequest___block_invoke;
    v7[3] = &unk_1E6AF5B90;
    v7[4] = &v8;
    [v6 enumerateObjectsUsingBlock:v7];

    uint64_t v4 = v9[3];
  }
  [v3 setSource:v4];
  _Block_object_dispose(&v8, 8);
}

void __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = *(id *)(a1 + 32);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 sceneHandle];
      id v5 = [v4 additionalActionsForActivatingSceneEntity:v3 withTransitionContext:v6];

      if ([v5 count]) {
        [v3 addActions:v5];
      }
    }
    id WeakRetained = v6;
  }
}

uint64_t __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = *(unsigned char *)(a1 + 104);
  if (v4) {
    char v4 = *(unsigned char *)(a1 + 105) != 0;
  }
  if (*(unsigned char *)(a1 + 106))
  {
    if (*(unsigned char *)(a1 + 107)) {
      char v5 = 1;
    }
    else {
      char v5 = v4;
    }
  }
  else
  {
    char v5 = 0;
  }
  BOOL IsValid = SBLayoutRoleIsValid(*(void *)(a1 + 88));
  if ((v5 & 1) != 0 || IsValid)
  {
    uint64_t v7 = [*(id *)(a1 + 32) switcherController];
    uint64_t v8 = [v7 entityWithRole:2];
    v22 = [v7 entityWithRole:3];
    uint64_t v9 = [v7 entityWithRole:4];
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 64);
    int v14 = *(unsigned __int8 *)(a1 + 106);
    if (!*(unsigned char *)(a1 + 104))
    {
      if (*(unsigned char *)(a1 + 106)
        || !v8
        || v11
        || (+[SBWorkspaceEntity entity],
            id v11 = (id)objc_claimAutoreleasedReturnValue(),
            int v14 = *(unsigned __int8 *)(a1 + 106),
            !*(unsigned char *)(a1 + 104)))
      {
        if (v14
          || !v22
          || v12
          || (+[SBWorkspaceEntity entity],
              id v12 = (id)objc_claimAutoreleasedReturnValue(),
              int v14 = *(unsigned __int8 *)(a1 + 106),
              !*(unsigned char *)(a1 + 104)))
        {
          if (!v14 && v9 && !v13)
          {
            id v13 = +[SBWorkspaceEntity entity];
            LOBYTE(v14) = *(unsigned char *)(a1 + 106);
          }
        }
      }
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_5;
    v23[3] = &unk_1E6AF5EE0;
    char v31 = v14;
    char v32 = v5;
    id v24 = v10;
    id v25 = v11;
    id v26 = v12;
    id v27 = v13;
    id v28 = *(id *)(a1 + 72);
    id v15 = *(id *)(a1 + 80);
    char v33 = *(unsigned char *)(a1 + 104);
    uint64_t v16 = *(void *)(a1 + 96);
    id v29 = v15;
    uint64_t v30 = v16;
    id v17 = v13;
    id v18 = v12;
    id v19 = v11;
    id v20 = v10;
    [v3 modifyApplicationContext:v23];
  }
  return 1;
}

- (void)_executeSuspendedTransactionForRequest:(id)a3
{
  id v4 = a3;
  if (!self->_activeSuspendedWorkspaceTransitions)
  {
    char v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeSuspendedWorkspaceTransitions = self->_activeSuspendedWorkspaceTransitions;
    self->_activeSuspendedWorkspaceTransitions = v5;
  }
  uint64_t v7 = [(SBMainWorkspaceTransaction *)[SBSuspendedWorkspaceTransaction alloc] initWithTransitionRequest:v4];
  [(NSMutableSet *)self->_activeSuspendedWorkspaceTransitions addObject:v7];
  uint64_t v8 = [v4 transactionConfigurator];
  uint64_t v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t, SBSuspendedWorkspaceTransaction *))(v8 + 16))(v8, v7);
  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__SBMainWorkspace__executeSuspendedTransactionForRequest___block_invoke;
  v11[3] = &unk_1E6AF5AC8;
  id v10 = v4;
  id v12 = v10;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  [(SBMainWorkspace *)self _addRequestCompletionBlock:v11 toTransaction:v7];
  [(SBSuspendedWorkspaceTransaction *)v7 begin];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __60__SBMainWorkspace__addRequestCompletionBlock_toTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v6;
  }
}

void __58__SBMainWorkspace__executeSuspendedTransactionForRequest___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4 = [a1[4] completionBlock];
  id v8 = (id)v4;
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 5);
  id v6 = objc_loadWeakRetained(a1 + 6);
  uint64_t v7 = v6;
  if (WeakRetained && v6) {
    [WeakRetained[13] removeObject:v6];
  }
}

- (BOOL)_setCurrentTransactionForRequest:(id)a3 fallbackProvider:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, id))a4;
  uint64_t v9 = [(SBWorkspace *)self eventQueue];
  id v10 = [v9 executingEvent];

  if (!v10)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBWorkspace.m" lineNumber:2923 description:@"must only be called when running on the event queue"];
  }
  uint64_t v11 = [v7 transactionProvider];
  id v12 = (void *)v11;
  if (v11)
  {
    id v13 = (*(void (**)(uint64_t, id))(v11 + 16))(v11, v7);
    [v7 setTransactionProvider:0];
    if (!v8) {
      goto LABEL_9;
    }
  }
  else
  {
    id v13 = 0;
    if (!v8) {
      goto LABEL_9;
    }
  }
  if (!v13)
  {
    id v13 = v8[2](v8, v7);
  }
LABEL_9:
  if (!v13)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBWorkspace.m", 2938, @"at this point we must have a transaction : request=%@", v7 object file lineNumber description];
  }
  id v14 = [v13 transitionRequest];

  if (v14 != v7)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"SBWorkspace.m" lineNumber:2939 description:@"the transaction must reference the original request"];
  }
  uint64_t v15 = [v7 transactionConfigurator];
  uint64_t v16 = (void *)v15;
  if (v15) {
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v13);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__SBMainWorkspace__setCurrentTransactionForRequest_fallbackProvider___block_invoke;
  v22[3] = &unk_1E6AF5350;
  id v23 = v7;
  id v17 = v7;
  [(SBMainWorkspace *)self _addRequestCompletionBlock:v22 toTransaction:v13];
  [(SBMainWorkspace *)self setCurrentTransaction:v13];

  return v13 != 0;
}

- (void)setCurrentTransaction:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = (SBWorkspaceTransaction *)a3;
  p_currentTransaction = &self->_currentTransaction;
  if (self->_currentTransaction != v6)
  {
    id v8 = self->_currentTransactionLock;
    currentTransactionLock = self->_currentTransactionLock;
    self->_currentTransactionLock = 0;

    [(BSWatchdog *)self->_transactionWatchdog invalidate];
    transactionWatchdog = self->_transactionWatchdog;
    self->_transactionWatchdog = 0;

    [(SBWorkspaceTransaction *)*p_currentTransaction removeObserver:self];
    uint64_t v11 = *p_currentTransaction;
    *p_currentTransaction = 0;

    [(BSInvalidatable *)self->_displayLayoutTransitionAssertion invalidate];
    displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
    self->_displayLayoutTransitionAssertion = 0;

    if (v6)
    {
      objc_storeStrong((id *)&self->_currentTransaction, a3);
      [(SBWorkspaceTransaction *)*p_currentTransaction addObserver:self];
      id v13 = SBLogTransactionVerbose();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

      if (v14)
      {
        uint64_t v15 = SBLogTransactionVerbose();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[SBMainWorkspace setCurrentTransaction:]();
        }
      }
      else
      {
        uint64_t v15 = SBLogTransaction();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [MEMORY[0x1E4F4F718] descriptionForObject:v6];
          int v42 = [(SBWorkspaceTransaction *)v6 transitionRequest];
          [v42 compactDescriptionBuilder];
          id v17 = v44 = v8;
          [v17 build];
          v18 = id v43 = a2;
          *(_DWORD *)buf = 138543618;
          long long v46 = v16;
          __int16 v47 = 2114;
          long long v48 = v18;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "Running %{public}@ for transition request:\n%{public}@", buf, 0x16u);

          id v8 = v44;
          a2 = v43;
        }
      }

      id v19 = [(SBWorkspace *)self eventQueue];
      id v20 = [v19 acquireLockForReason:@"CurrentTransaction"];
      id v21 = self->_currentTransactionLock;
      self->_currentTransactionLock = v20;

      v22 = [(SBWorkspaceTransaction *)*p_currentTransaction transitionRequest];
      uint64_t v23 = SBMainWorkspaceMapInternalTransitionSourceToExternalTransitionSource([v22 source]);
      id v24 = (void *)v23;
      id v25 = @"SBWorkspace";
      if (v23) {
        id v25 = (__CFString *)v23;
      }
      id v26 = v25;

      id v27 = [(SBWorkspaceTransaction *)v6 windowScene];
      if (!v27)
      {
        uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:a2, self, @"SBWorkspace.m", 2370, @"No window scene to get a publisher: %@", self object file lineNumber description];
      }
      id v28 = [v27 displayLayoutPublisher];
      if (!v28)
      {
        id v38 = [MEMORY[0x1E4F28B00] currentHandler];
        SEL v39 = a2;
        v40 = v8;
        id v41 = v38;
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", v39, self, @"SBWorkspace.m", 2370, @"No publisher for window scene: %@; self: %@",
          v27,
          self);

        id v8 = v40;
      }

      id v29 = [v28 transitionAssertionWithReason:v26];

      uint64_t v30 = self->_displayLayoutTransitionAssertion;
      self->_displayLayoutTransitionAssertion = v29;

      [(SBWorkspaceTransaction *)v6 begin];
      if (([(SBWorkspaceTransaction *)v6 isComplete] & 1) == 0)
      {
        char v31 = +[SBPlatformController sharedInstance];
        int v32 = [v31 isInternalInstall];

        if (v32)
        {
          id v33 = objc_alloc(MEMORY[0x1E4F4F868]);
          id v34 = [(SBTransaction *)v6 queue];
          v35 = (BSWatchdog *)[v33 initWithProvider:v6 queue:v34];
          uint64_t v36 = self->_transactionWatchdog;
          self->_transactionWatchdog = v35;

          [(BSWatchdog *)self->_transactionWatchdog setDelegate:self];
          [(BSWatchdog *)self->_transactionWatchdog start];
        }
      }
    }
    [(BSEventQueueLock *)v8 relinquish];
  }
}

- (void)_addRequestCompletionBlock:(id)a3 toTransaction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    id v8 = [v6 completionBlock];
    uint64_t v9 = (void *)[v8 copy];

    id v10 = (void *)[v5 copy];
    objc_initWeak(&location, v7);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__SBMainWorkspace__addRequestCompletionBlock_toTransaction___block_invoke;
    v13[3] = &unk_1E6AF5BE0;
    objc_copyWeak(&v16, &location);
    id v11 = v9;
    id v14 = v11;
    id v12 = v10;
    id v15 = v12;
    [v7 setCompletionBlock:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __69__SBMainWorkspace__setCurrentTransactionForRequest_fallbackProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) completionBlock];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) completionBlock];
    v5[2](v5, a2);
  }
}

id __56__SBMainWorkspace__executeApplicationTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _selectTransactionForAppActivationRequest:v3];

  return v5;
}

- (id)_selectTransactionForAppActivationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 applicationContext];
  id v6 = [v5 resolvedActivatingWorkspaceEntity];
  id v7 = [v6 applicationSceneEntity];

  if ([v7 BOOLForActivationSetting:60])
  {
    id v8 = [(SBMainWorkspace *)self _selectTransactionForAppActivationUnderMainScreenLockRequest:v4];
  }
  else
  {
    uint64_t v9 = [(id)SBApp windowSceneManager];
    id v10 = [v4 displayIdentity];
    id v11 = [v9 windowSceneForDisplayIdentity:v10];

    id v12 = [v11 transientOverlayPresenter];
    if ([v12 hasActivePresentation]
      && ([v4 shouldPreventDismissalOfUnrelatedTransientOverlays] & 1) == 0)
    {
      id v14 = [v4 applicationContext];
      id v15 = v14;
      if (v14) {
        char v16 = [v14 animationDisabled] ^ 1;
      }
      else {
        char v16 = 0;
      }
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __61__SBMainWorkspace__selectTransactionForAppActivationRequest___block_invoke;
      id v21 = &unk_1E6AF5C58;
      id v22 = v12;
      char v23 = v16;
      [v4 modifyTransientOverlayContext:&v18];
      -[SBMainWorkspace _selectTransactionForTransientOverlayPresentationRequest:](self, "_selectTransactionForTransientOverlayPresentationRequest:", v4, v18, v19, v20, v21);
      id v13 = (SBAppToAppWorkspaceTransaction *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = [[SBAppToAppWorkspaceTransaction alloc] initWithTransitionRequest:v4];
    }
    id v8 = v13;
  }
  return v8;
}

uint64_t __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_2_682(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 execute];
}

uint64_t __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)createRequestWithOptions:(unint64_t)a3 displayConfiguration:(id)a4
{
  id v5 = a4;
  if ((a3 & 0x60) == 0)
  {
    id v6 = +[SBAssistantController sharedInstance];
    int v7 = [v6 isSystemAssistantExperiencePersistentSiriEnabled];

    id v8 = SBLogWorkspace();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9) {
        -[SBMainWorkspace createRequestWithOptions:displayConfiguration:]();
      }
      uint64_t v10 = 32;
    }
    else
    {
      if (v9) {
        -[SBMainWorkspace createRequestWithOptions:displayConfiguration:]();
      }
      uint64_t v10 = 64;
    }

    a3 |= v10;
  }
  id v11 = [SBMainWorkspaceTransitionRequest alloc];
  id v12 = v11;
  if ((a3 & 8) != 0)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F62420], "sb_secureMainConfiguration");
  }
  else
  {
    if (v5)
    {
      id v13 = [(SBMainWorkspaceTransitionRequest *)v11 initWithDisplayConfiguration:v5];
      goto LABEL_16;
    }
    uint64_t v14 = [MEMORY[0x1E4F62420] mainConfiguration];
  }
  id v15 = (void *)v14;
  id v13 = [(SBMainWorkspaceTransitionRequest *)v12 initWithDisplayConfiguration:v14];

LABEL_16:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__SBMainWorkspace_createRequestWithOptions_displayConfiguration___block_invoke;
  v17[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v17[4] = a3;
  [(SBWorkspaceTransitionRequest *)v13 modifyApplicationContext:v17];

  return v13;
}

- (BOOL)_executeTransitionRequest:(id)a3 options:(unint64_t)a4 validator:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = SBLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 succinctDescription];
    *(_DWORD *)buf = 138543362;
    id v67 = v10;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Executing request: %{public}@", buf, 0xCu);
  }
  BOOL v11 = [(SBMainWorkspace *)self _canExecuteTransitionRequest:v7 forExecution:1];
  BOOL v12 = v11;
  if (v11)
  {
    BOOL v53 = v11;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v14 = v13;
    uint64_t v55 = mach_continuous_time();
    id v15 = [(SBMainWorkspace *)self currentTransaction];
    uint64_t v16 = [v7 source];
    id v17 = [v7 applicationContext];
    char v18 = [v17 isBackground];

    int v19 = 0;
    int v20 = 0;
    if ((v18 & 1) == 0 && v16 != 14)
    {
      if ([v15 shouldInterceptTransitionRequest:v7])
      {
        int v20 = 0;
        int v19 = 1;
      }
      else
      {
        int v20 = [v15 canInterruptForTransitionRequest:v7];
        int v19 = 0;
      }
    }
    int v54 = v15;
    uint64_t v21 = objc_msgSend(v7, "displayIdentity", v16);
    id v22 = [(id)SBApp windowSceneManager];
    int v52 = (void *)v21;
    char v23 = [v22 windowSceneForDisplayIdentity:v21];

    id v24 = [v7 applicationContext];
    uint64_t v25 = [v24 requestedUnlockedEnvironmentMode];

    id v56 = v8;
    v51 = v23;
    if (v25 == 2)
    {
      id v26 = [v23 homeScreenController];
      id v27 = [v26 iconManager];
      id v28 = v27;
      if (v27)
      {
        id v29 = v27;
      }
      else
      {
        char v31 = +[SBIconController sharedInstance];
        id v29 = [v31 iconManager];
      }
      int v32 = [v29 currentTransitionAnimator];
      id v33 = v32;
      if (v32)
      {
        id v34 = [v32 childViewController];
        objc_opt_class();
        BOOL v30 = (objc_opt_isKindOfClass() & 1) != 0 && [v33 currentOperation] == 1;
      }
      else
      {
        BOOL v30 = 0;
      }

      id v8 = v56;
    }
    else
    {
      BOOL v30 = 0;
    }
    v35 = (void *)MEMORY[0x1E4F624D8];
    uint64_t v36 = [v7 eventLabel];
    uint64_t v37 = v36;
    if (!v36)
    {
      uint64_t v37 = [v7 succinctDescription];
    }
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke;
    v57[3] = &unk_1E6AF5B40;
    id v61 = v8;
    id v38 = v7;
    id v58 = v38;
    id v59 = self;
    uint64_t v62 = v14;
    uint64_t v63 = v55;
    char v64 = v19;
    id v39 = v54;
    id v60 = v39;
    char v65 = v20;
    v40 = [v35 eventWithName:v37 handler:v57];
    if (!v36) {

    }
    id v41 = [v38 applicationContext];
    int v42 = [v41 isBackground];

    if (((v19 | v20 | v30) & 1) == 0 && !v42)
    {
      if (v50 != 14)
      {
        id v43 = +[SBReachabilityManager sharedInstance];
        [v43 deactivateReachability];
      }
      v44 = [(SBWorkspace *)self eventQueue];
      [v44 executeOrAppendEvent:v40];
LABEL_34:

      id v8 = v56;
      BOOL v12 = v53;
      long long v46 = v51;
      long long v45 = v52;
LABEL_44:

      goto LABEL_45;
    }
    if (v30)
    {
      if (v20) {
        [v39 interruptForTransitionRequest:v38];
      }
      v44 = [(SBWorkspace *)self eventQueue];
      [v44 executeOrPrependEvent:v40];
      goto LABEL_34;
    }
    if (v42)
    {
      __int16 v47 = SBLogWorkspace();
      long long v46 = v51;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        long long v48 = [v40 name];
        *(_DWORD *)buf = 138543362;
        id v67 = v48;
        _os_log_impl(&dword_1D85BA000, v47, OS_LOG_TYPE_DEFAULT, "Executing suspended-activation immediately: %{public}@", buf, 0xCu);
      }
      BOOL v12 = v53;
    }
    else
    {
      BOOL v12 = v53;
      long long v46 = v51;
      if (!v20)
      {
LABEL_43:
        [v40 execute];
        id v8 = v56;
        long long v45 = v52;
        goto LABEL_44;
      }
      __int16 v47 = SBLogWorkspace();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        id v67 = v39;
        __int16 v68 = 2114;
        id v69 = v38;
        _os_log_impl(&dword_1D85BA000, v47, OS_LOG_TYPE_DEFAULT, "Interrupting transaction (%{public}p) for new request: %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_43;
  }
LABEL_45:

  return v12;
}

- (SBWorkspaceTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (BOOL)executeTransitionRequest:(id)a3 withValidator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBMainWorkspace;
  return [(SBWorkspace *)&v5 executeTransitionRequest:a3 withValidator:a4];
}

void __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  [v4 setPrefersCrossfadeTransition:v3];
  [v4 setPrefersCenterZoomTransition:*(unsigned __int8 *)(a1 + 33)];
}

- (SBKeyboardFocusControlling)keyboardFocusController
{
  return self->_keyboardFocusCoordinator;
}

+ (id)_instanceIfExists
{
  return (id)[a1 _sharedInstanceWithNilCheckPolicy:0];
}

uint64_t __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transientOverlayContext];

  if (v2)
  {
    uint64_t result = [*(id *)(a1 + 40) _executeTransientOverlayTransitionRequest:*(void *)(a1 + 32)];
    if (result) {
      return result;
    }
LABEL_11:
    id v6 = @"No transaction created";
    goto LABEL_12;
  }
  id v4 = +[SBLockScreenManager sharedInstance];
  char v5 = [v4 handleTransitionRequest:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = @"Lock screen handled request";
LABEL_12:
    BOOL v9 = *(void **)(a1 + 32);
    return [v9 declineWithReason:v6];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t result = [*(id *)(a1 + 40) _executeApplicationTransitionRequest:v7];
    if (result) {
      return result;
    }
    goto LABEL_11;
  }
  id v8 = *(void **)(a1 + 48);
  return [v8 interceptTransitionRequest:v7];
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  id v8 = (SBIdleTimerProviding *)a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(SBMainWorkspace *)self _activeIdleTimerProvider];
  BOOL v12 = v11;
  if (v11 == v8)
  {
    uint64_t v16 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper proposeIdleTimerBehavior:v9 fromProvider:v8 reason:v10];
  }
  else
  {
    if (v11 != self->_activeIdleTimerProvider)
    {
      uint64_t v13 = [NSString stringWithFormat:@"SBWorkspaceActiveProviderChanged:%@", v10];
      uint64_t v14 = [(SBMainWorkspace *)self _generateIdleTimerBehaviorForReason:v10];
      id v15 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper proposeIdleTimerBehavior:v14 fromProvider:v12 reason:v13];
    }
    uint64_t v16 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper updateProvider:v8 behavior:v9 reason:v10];
  }
  id v17 = (void *)v16;
  [(SBMainWorkspace *)self _setActiveIdleTimerProvider:v12];

  return v17;
}

- (void)_setActiveIdleTimerProvider:(id)a3
{
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return [(SBMainWorkspace *)self _generateIdleTimerBehaviorForReason:@"SBWorkspaceCoordinatorRequested"];
}

- (id)_generateIdleTimerBehaviorForReason:(id)a3
{
  id v5 = a3;
  id v6 = [(SBMainWorkspace *)self _activeIdleTimerProvider];
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBWorkspace.m" lineNumber:2221 description:@"Workspace activeProvider should not be nil"];
  }
  uint64_t v7 = [v6 coordinatorRequestedIdleTimerBehavior:self];
  id v8 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper updateProvider:v6 behavior:v7 reason:v5];

  return v7;
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5 validator:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)SBMainWorkspace;
  return [(SBWorkspace *)&v7 requestTransitionWithOptions:a3 displayConfiguration:a4 builder:a5 validator:a6];
}

uint64_t __104__SBMainWorkspace__handleTrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUserActionRequest:*(void *)(a1 + 40) options:*(void *)(a1 + 48) activationSettings:*(void *)(a1 + 56) origin:*(void *)(a1 + 64) withResult:*(void *)(a1 + 72)];
}

- (void)_handleOpenApplicationRequest:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7
{
  uint64_t v440 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BSDispatchQueueAssertMain();
  if (!v14)
  {
    v129 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"activationSettings != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMainWorkspace _handleOpenApplicationRequest:options:activationSettings:origin:withResult:]();
    }
    [v129 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D868CECCLL);
  }
  id v17 = +[SBApplicationController sharedInstanceIfExists];
  v426[0] = MEMORY[0x1E4F143A8];
  v426[1] = 3221225472;
  v426[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke;
  v426[3] = &unk_1E6AF5DA8;
  id v18 = v16;
  id v427 = v18;
  int v19 = (void (**)(void))MEMORY[0x1D948C7A0](v426);
  id v425 = 0;
  int v20 = [(SBMainWorkspace *)self _validateRequestToOpenApplication:v12 options:v13 origin:v15 error:&v425];
  id v21 = v425;
  id v22 = v21;
  if (!v12 || v20)
  {
    id v342 = v21;
    v344 = v20;
    v346 = v17;
    uint64_t v424 = 0;
    v345 = objc_opt_new();
    char v23 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F625F8], objc_opt_class());
    int v337 = [v23 BOOLValue];

    uint64_t v423 = 0;
    uint64_t v24 = *MEMORY[0x1E4FA7130];
    uint64_t v25 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA7130], objc_opt_class());
    v341 = v13;
    v339 = v25;
    if (v25 && (SBValidateLayoutRoleString(v25, &v424, &v423) & 1) == 0)
    {
      FBSOpenApplicationErrorCreate();
      id v340 = (id)objc_claimAutoreleasedReturnValue();
      v19[2](v19);
      id v29 = 0;
      id v343 = 0;
      char v31 = 0;
      id v347 = 0;
      int v20 = v344;
      id v22 = v342;
LABEL_287:

      id v13 = v341;
      goto LABEL_288;
    }
    v422[2] = 0;
    v422[1] = 0;
    v332 = self;
    int v20 = v344;
    int v328 = v337 ^ 1;
    id v26 = -[SBMainWorkspace _targetWindowSceneForApplication:options:settings:requireForeground:targetDisplayConfiguration:error:](self, "_targetWindowSceneForApplication:options:settings:requireForeground:targetDisplayConfiguration:error:", v344, v13, v14);
    id v340 = 0;
    id v27 = 0;
    v338 = v26;
    if (!v26 && v27)
    {
      id v28 = v27;
      ((void (*)(void (**)(void), id))v19[2])(v19, v27);
      id v29 = 0;
      id v343 = 0;
      id v336 = 0;
      id v347 = 0;
      id v22 = v342;
LABEL_286:

      char v31 = v336;
      goto LABEL_287;
    }
    id v327 = v27;
    v335 = objc_msgSend(v13, "bs_safeStringForKey:", *MEMORY[0x1E4FA7150]);
    v334 = objc_msgSend(v13, "bs_safeArrayForKey:", *MEMORY[0x1E4FA7100]);
    if ([v15 hasEntitlement:@"com.apple.springboard.testautomation"]) {
      int v30 = 1;
    }
    else {
      int v30 = [v15 hasEntitlement:@"com.apple.LaunchApp"];
    }
    int v32 = 0;
    v333 = v19;
    if (v335 && v334)
    {
      id v347 = 0;
      if (v30)
      {
        v422[0] = 0;
        v330 = [[SBWindowingLayoutFormatAdapter alloc] initWithWindowScene:v26];
        [(SBWindowingLayoutFormatAdapter *)v330 parse:v335 bundleIdentifier:v334 error:v422];
        id v33 = v422[0];
        if (v33)
        {
          id v34 = v33;
          ((void (*)(void (**)(void), id))v333[2])(v333, v33);
          id v29 = 0;
          id v343 = 0;
          id v336 = 0;
          id v347 = 0;
LABEL_40:
          id v22 = v342;
LABEL_285:

          id v28 = v327;
          int v19 = v333;
          goto LABEL_286;
        }
        id v331 = v18;
        id v323 = v15;
        id v312 = v12;
        long long v420 = 0u;
        long long v421 = 0u;
        long long v418 = 0u;
        long long v419 = 0u;
        id v34 = v334;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v418 objects:v439 count:16];
        if (!v35)
        {
          id v347 = 0;
          goto LABEL_34;
        }
        uint64_t v36 = v35;
        id v347 = 0;
        uint64_t v37 = *(void *)v419;
LABEL_22:
        uint64_t v38 = 0;
        while (1)
        {
          if (*(void *)v419 != v37) {
            objc_enumerationMutation(v34);
          }
          id v39 = [v17 applicationWithBundleIdentifier:*(void *)(*((void *)&v418 + 1) + 8 * v38)];
          if (!v39) {
            break;
          }
          v40 = v39;
          if (v347)
          {
            [v345 addObject:v39];
          }
          else
          {
            id v347 = v39;
            uint64_t v424 = 1;
          }

          if (v36 == ++v38)
          {
            uint64_t v36 = [v34 countByEnumeratingWithState:&v418 objects:v439 count:16];
            if (!v36)
            {
LABEL_34:

              id v12 = v312;
              id v15 = v323;
              int v32 = v330;
              id v18 = v331;
              int v19 = v333;
              goto LABEL_35;
            }
            goto LABEL_22;
          }
        }
        id v41 = FBSOpenApplicationErrorCreate();
        ((void (*)(void (**)(void), void *))v333[2])(v333, v41);

        id v29 = 0;
        id v343 = 0;
        id v336 = 0;
        id v12 = v312;
        id v15 = v323;
LABEL_39:
        id v18 = v331;
        int v20 = v344;
        goto LABEL_40;
      }
    }
    else
    {
      id v347 = 0;
    }
LABEL_35:
    v330 = v32;
    id v331 = v18;
    int v42 = [v26 switcherController];
    uint64_t v43 = [v42 windowManagementStyle];

    if (SBLayoutRoleIsValid(v424) && v424 != 1 && !v43)
    {
      uint64_t v44 = FBSOpenApplicationErrorCreate();
      long long v45 = v19;
      id v34 = (id)v44;
      ((void (*)(void (**)(void), uint64_t))v45[2])(v45, v44);
      id v29 = 0;
      id v343 = 0;
      id v336 = 0;
      goto LABEL_39;
    }
    long long v46 = [v26 switcherController];
    int v47 = [v46 isChamoisWindowingUIEnabled];

    long long v48 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA70F0], objc_opt_class());
    char v296 = [v48 BOOLValue];

    BOOL v49 = !SBLayoutRoleIsValid(v424);
    if (v424 == 1) {
      BOOL v49 = 1;
    }
    BOOL v297 = v49;
    if (v49)
    {
      id v50 = v344;

      id v51 = 0;
      id v343 = 0;
      id v336 = 0;
      uint64_t v299 = 0;
      uint64_t v300 = 0;
      uint64_t v301 = 0;
      id v347 = v50;
    }
    else if (v424 == 2)
    {
      id v336 = v344;
      id v51 = 0;
      id v343 = 0;
      uint64_t v300 = 0;
      uint64_t v301 = v424;
      uint64_t v299 = 0;
    }
    else
    {
      if (v424 == 3)
      {
        id v343 = v344;
        id v51 = 0;
        id v336 = 0;
        uint64_t v299 = 0;
        uint64_t v300 = v424;
      }
      else
      {
        if (v424 == 4)
        {
          id v51 = v344;
          id v343 = 0;
          id v336 = 0;
          uint64_t v299 = v424;
        }
        else
        {
          id v51 = 0;
          id v343 = 0;
          id v336 = 0;
          uint64_t v299 = 0;
        }
        uint64_t v300 = 0;
      }
      uint64_t v301 = 0;
    }
    v317 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA70C8], objc_opt_class());
    if ([v317 count] >= 1)
    {
      id v18 = v331;
      if (v43)
      {
        long long v416 = 0u;
        long long v417 = 0u;
        long long v414 = 0u;
        long long v415 = 0u;
        id v52 = v317;
        uint64_t v53 = [v52 countByEnumeratingWithState:&v414 objects:v438 count:16];
        if (!v53) {
          goto LABEL_115;
        }
        uint64_t v54 = *(void *)v415;
        v295 = v52;
        id v320 = v14;
        v324 = v15;
        uint64_t v289 = *(void *)v415;
        while (1)
        {
          uint64_t v55 = 0;
          uint64_t v291 = v53;
          do
          {
            if (*(void *)v415 != v54)
            {
              uint64_t v56 = v55;
              objc_enumerationMutation(v52);
              uint64_t v55 = v56;
            }
            uint64_t v293 = v55;
            uint64_t v310 = *(void *)(*((void *)&v414 + 1) + 8 * v55);
            char v57 = objc_msgSend(v52, "bs_safeArrayForKey:");
            if (!v57)
            {
              uint64_t v58 = objc_msgSend(v52, "bs_safeDictionaryForKey:", v310);
              id v59 = (void *)v58;
              if (v58)
              {
                uint64_t v437 = v58;
                char v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v437 count:1];
              }
              else
              {
                char v57 = 0;
              }

              id v52 = v295;
            }
            long long v412 = 0u;
            long long v413 = 0u;
            long long v410 = 0u;
            long long v411 = 0u;
            id obj = v57;
            uint64_t v305 = [obj countByEnumeratingWithState:&v410 objects:v436 count:16];
            if (v305)
            {
              uint64_t v308 = *(void *)v411;
              do
              {
                uint64_t v60 = 0;
                do
                {
                  if (*(void *)v411 != v308) {
                    objc_enumerationMutation(obj);
                  }
                  id v61 = *(void **)(*((void *)&v410 + 1) + 8 * v60);
                  uint64_t v62 = objc_msgSend(v61, "bs_safeObjectForKey:ofType:", v24, objc_opt_class());
                  *(void *)buf = 0;
                  uint64_t v409 = 0;
                  id v14 = v320;
                  if ((SBValidateLayoutRoleString(v62, (uint64_t *)buf, &v409) & 1) == 0
                    || *(void *)buf == 1 && v347 && (v47 & 1) == 0
                    || *(void *)buf == 2 && v336 && (v47 & 1) == 0
                    || *(void *)buf == 3 && v343 && (v47 & 1) == 0
                    || *(void *)buf == 4 && v51 && (v47 & 1) == 0)
                  {
                    v83 = FBSOpenApplicationErrorCreate();
                    ((void (*)(void (**)(void), void *))v333[2])(v333, v83);

                    id v15 = v324;
                    id v18 = v331;
                    int v20 = v344;
                    id v22 = v342;
LABEL_147:

                    goto LABEL_283;
                  }
                  v318 = v51;
                  v403[0] = MEMORY[0x1E4F143A8];
                  v403[1] = 3221225472;
                  v403[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_2;
                  v403[3] = &unk_1E6AF5DD0;
                  id v404 = v17;
                  v408 = v333;
                  v405 = v332;
                  v406 = v61;
                  id v407 = v324;
                  uint64_t v63 = MEMORY[0x1D948C7A0](v403);
                  char v64 = (void *)v63;
                  switch(*(void *)buf)
                  {
                    case 1:
                      char v65 = (*(void (**)(uint64_t, uint64_t))(v63 + 16))(v63, v310);
                      if (!v65) {
                        goto LABEL_100;
                      }
                      id v66 = v65;
                      if (v347) {
                        [v345 addObject:v65];
                      }
                      else {
                        id v347 = v65;
                      }
                      if (!v423) {
                        goto LABEL_105;
                      }
                      goto LABEL_106;
                    case 2:
                      id v67 = (*(void (**)(uint64_t, uint64_t))(v63 + 16))(v63, v310);
                      if (!v67) {
                        goto LABEL_100;
                      }
                      id v66 = v67;
                      if (v336)
                      {
                        [v345 addObject:v67];
                      }
                      else
                      {
                        id v336 = v67;
                        uint64_t v301 = *(void *)buf;
                      }
LABEL_105:
                      uint64_t v423 = v409;
LABEL_106:

                      break;
                    case 3:
                      __int16 v68 = (*(void (**)(uint64_t, uint64_t))(v63 + 16))(v63, v310);
                      if (!v68) {
                        goto LABEL_100;
                      }
                      id v66 = v68;
                      if (!v47)
                      {
                        id v66 = v68;

                        uint64_t v300 = *(void *)buf;
                        id v343 = v66;
                        goto LABEL_106;
                      }
LABEL_99:
                      [v345 addObject:v66];
                      goto LABEL_106;
                    case 4:
                      id v69 = (*(void (**)(uint64_t, uint64_t))(v63 + 16))(v63, v310);
                      if (!v69)
                      {
LABEL_100:
                        int v70 = 0;
                        goto LABEL_108;
                      }
                      id v66 = v69;
                      if (!v47)
                      {
                        id v66 = v69;

                        uint64_t v299 = *(void *)buf;
                        v318 = v66;
                        goto LABEL_106;
                      }
                      goto LABEL_99;
                  }
                  int v70 = 1;
LABEL_108:
                  id v18 = v331;

                  if (!v70)
                  {
                    id v14 = v320;
                    id v15 = v324;
                    int v20 = v344;
                    id v22 = v342;
                    id v51 = v318;
                    goto LABEL_147;
                  }
                  ++v60;
                  id v51 = v318;
                }
                while (v305 != v60);
                uint64_t v71 = [obj countByEnumeratingWithState:&v410 objects:v436 count:16];
                id v14 = v320;
                id v15 = v324;
                id v52 = v295;
                uint64_t v305 = v71;
              }
              while (v71);
            }

            uint64_t v55 = v293 + 1;
            uint64_t v54 = v289;
          }
          while (v293 + 1 != v291);
          uint64_t v53 = [v52 countByEnumeratingWithState:&v414 objects:v438 count:16];
          if (!v53)
          {
LABEL_115:

            goto LABEL_116;
          }
        }
      }
      v78 = FBSOpenApplicationErrorCreate();
      ((void (*)(void (**)(void), void *))v333[2])(v333, v78);
      int v20 = v344;
      id v22 = v342;
LABEL_284:
      id v29 = v51;

      id v34 = v317;
      goto LABEL_285;
    }
LABEL_116:
    uint64_t v72 = [v345 count];
    uint64_t v73 = v424;
    int v316 = 0;
    id v22 = v342;
    if (SBLayoutRoleIsValid(v424) && !v347)
    {
      if (v72) {
        BOOL v74 = 0;
      }
      else {
        BOOL v74 = v73 == 4;
      }
      int v75 = v47 ^ 1;
      if (v74) {
        int v75 = 1;
      }
      int v316 = v75;
    }
    v76 = [v338 switcherController];
    char v77 = [v76 layoutContainsRole:1];

    if (v316 && (v77 & 1) == 0 && (v47 & 1) == 0)
    {
      v78 = FBSOpenApplicationErrorCreate();
      ((void (*)(void (**)(void), void *))v333[2])(v333, v78);
      id v18 = v331;
LABEL_152:
      int v20 = v344;
      goto LABEL_284;
    }
    char v309 = v77;
    id v18 = v331;
    if ((v328 | [v14 BOOLForActivationSetting:52]))
    {
      BOOL v79 = [(SBMainWorkspace *)v332 _canAppWithBundleIdentifier:v12 requestMovingContentToSceneOpenApplicationOptions:v13];
      if (!v337) {
        goto LABEL_138;
      }
      char v80 = v79;
      if (v336 || v343 || v51)
      {
        if (v79) {
          goto LABEL_138;
        }
      }
      else
      {
        if ([v345 count]) {
          char v81 = v80;
        }
        else {
          char v81 = 1;
        }
        if (v81)
        {
LABEL_138:
          v295 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F625F0], objc_opt_class());
          if (v295)
          {
            if (v336 || v343 || v51 || [v345 count])
            {
              v82 = FBSOpenApplicationErrorCreate();
              ((void (*)(void (**)(void), void *))v333[2])(v333, v82);
              int v20 = v344;
              goto LABEL_282;
            }
            v84 = [v295 objectForKey:*MEMORY[0x1E4F4F188]];
            BOOL v261 = v84 != 0;
          }
          else
          {
            BOOL v261 = 0;
          }
          v85 = (void *)MEMORY[0x1E4F1CA80];
          v86 = [v13 objectForKey:*MEMORY[0x1E4F625E0]];
          id obja = [v85 setWithArray:v86];

          v306 = objc_msgSend(v13, "bs_safeURLForKey:", *MEMORY[0x1E4F62678]);
          v302 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F62670], objc_opt_class());
          v87 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F626A0], objc_opt_class());
          int v266 = [v87 BOOLValue];

          v88 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F62688], objc_opt_class());
          int v268 = [v88 BOOLValue];

          v89 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA7000], objc_opt_class());
          if ([v89 BOOLValue])
          {
            v90 = [v344 bundleIdentifier];
            int v313 = [v90 isEqualToString:@"com.apple.InCallService"];
          }
          else
          {
            int v313 = 0;
          }

          v91 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA6EA0], objc_opt_class());
          int v272 = [v91 BOOLValue];

          v294 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F62658], objc_opt_class());
          v92 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F626C0], objc_opt_class());
          int v255 = [v92 BOOLValue];

          v285 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FB3500], objc_opt_class());
          v307 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FB3508], objc_opt_class());
          v93 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA7128], objc_opt_class());
          int v253 = [v93 BOOLValue];

          v94 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA7118], objc_opt_class());
          char v254 = [v94 BOOLValue];

          v95 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA7120], objc_opt_class());
          int v286 = [v95 BOOLValue];

          v96 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA70D8], objc_opt_class());
          [v96 BOOLValue];

          v97 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA7140], objc_opt_class());
          unsigned int v252 = [v97 BOOLValue];

          v98 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA70E8], objc_opt_class());
          v99 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F73078], objc_opt_class());
          int v259 = [v99 BOOLValue];

          if (v98)
          {
            int v251 = [v98 BOOLValue];
          }
          else
          {
            v100 = +[SBAssistantController sharedInstance];
            int v251 = [v100 isSystemAssistantExperiencePersistentSiriEnabled];
          }
          if (v286)
          {
            int v257 = 0;
          }
          else
          {
            v101 = [v344 info];
            int v257 = [v101 alwaysDeliversOpenURLActionsUsingWorkspace];
          }
          id v319 = v51;
          v278 = v98;
          if (v306 && !v307)
          {
            v307 = [v306 absoluteString];
          }
          v102 = [v13 objectForKey:*MEMORY[0x1E4F62618]];
          v282 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F4F1B8], objc_opt_class());
          v281 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F4F1D8], objc_opt_class());
          v280 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F4F1E8], objc_opt_class());
          v279 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F4F1E0], objc_opt_class());
          v103 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F4F1C8], objc_opt_class());
          int v104 = [v103 BOOLValue];

          v105 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F4F1C0], objc_opt_class());
          int v276 = [v105 BOOLValue];

          v106 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F4F1D0], objc_opt_class());
          [v106 BOOLValue];

          v107 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F4F1F0], objc_opt_class());
          int v264 = [v107 BOOLValue];

          v292 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F62580], objc_opt_class());
          v290 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F62588], objc_opt_class());
          v284 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F58BF0], objc_opt_class());
          v288 = v102;
          v283 = objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F58BF8], objc_opt_class());
          v108 = +[SBSetupManager sharedInstance];
          LODWORD(v102) = [v108 isInSetupMode];

          if (v102)
          {
            uint64_t v109 = [v344 info];
            if (v109)
            {
              v110 = (void *)v109;
              v111 = [v344 info];
              char v112 = [v111 isLaunchableDuringSetup];

              if ((v112 & 1) == 0)
              {
                v329 = FBSOpenApplicationErrorCreate();
                ((void (*)(void))v333[2])();
                id v18 = v331;
                int v20 = v344;
                id v22 = v342;
                goto LABEL_209;
              }
            }
          }
          v325 = v15;
          id v113 = v14;
          if ((v104 | v276)) {
            int v114 = 0;
          }
          else {
            int v114 = [v344 isAnyTerminationAssertionInEffect] ^ 1;
          }
          int v249 = v114;
          int v115 = v114 & v328 | v313;
          v116 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", @"__SBWorkspaceOpenOptionUnlockResult", objc_opt_class());
          int v271 = [v116 BOOLValue];

          v117 = [v338 uiLockStateProvider];
          v118 = v117;
          if (v117)
          {
            id v119 = v117;
          }
          else
          {
            id v119 = +[SBLockScreenManager sharedInstance];
          }
          id v22 = v342;
          id v51 = v319;

          v329 = v119;
          if (!v115 || (([v119 isUILocked] ^ 1 | v271) & 1) != 0)
          {
            if (v272)
            {
              v120 = [v338 homeScreenController];
              v121 = [v120 iconManager];
              v122 = v121;
              if (v121)
              {
                id v123 = v121;
              }
              else
              {
                v130 = +[SBIconController sharedInstance];
                id v123 = [v130 iconManager];

                id v51 = v319;
              }

              v131 = [v123 iconModel];
              v132 = [v131 applicationIconForBundleIdentifier:v12];

              if (v132) {
                [v123 scrollToIconListContainingIcon:v132 animate:0];
              }

              id v22 = v342;
            }
            if ((v337 & 1) == 0)
            {
              v133 = +[SBIdleTimerGlobalCoordinator sharedInstance];
              [v133 resetIdleTimerForReason:@"OpenApplication"];
            }
            v134 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F625E8], objc_opt_class());
            uint64_t v135 = objc_msgSend(v13, "bs_safeStringForKey:", *MEMORY[0x1E4FA7110]);
            v136 = (void *)v135;
            if (v134)
            {
              uint64_t v137 = [v134 integerValue];
              id v14 = v113;
LABEL_198:
              id v15 = v325;
              goto LABEL_199;
            }
            id v14 = v113;
            if (!v135)
            {
              uint64_t v137 = -1;
              goto LABEL_198;
            }
            v395[0] = 0;
            v314 = [[SBApplicationClassicModeLaunchArgumentParser alloc] initWithApplication:v344];
            uint64_t v137 = [(SBApplicationClassicModeLaunchArgumentParser *)v314 classicModeForLaunchArgument:v136 error:v395];
            id v142 = v395[0];
            id v15 = v325;
            if (v142)
            {
              ((void (*)(void (**)(void), id))v333[2])(v333, v142);
            }
            else
            {
              v157 = [v344 processState];
              int v270 = [v157 isRunning];

              if (!v270 || v137 == [v344 _classicMode])
              {

                id v22 = v342;
                id v51 = v319;
LABEL_199:

                if (_SBApplicationClassicModeIsClassic(v137) && v336)
                {
                  v138 = FBSOpenApplicationErrorCreate();
                  ((void (*)(void (**)(void), void *))v333[2])(v333, v138);

                  id v17 = v346;
                  id v18 = v331;
                  int v20 = v344;
LABEL_210:
                  v82 = obja;
                  v128 = v294;
LABEL_281:

LABEL_282:
LABEL_283:
                  v78 = v295;
                  goto LABEL_284;
                }
                uint64_t v139 = [v302 objectForKey:*MEMORY[0x1E4F43698]];
                v140 = (void *)v139;
                if (v139 && v336)
                {
                  v141 = FBSOpenApplicationErrorCreate();
                  ((void (*)(void (**)(void), void *))v333[2])(v333, v141);
                  id v17 = v346;
                  id v18 = v331;
                  v128 = v294;
LABEL_279:

                  int v20 = v344;
                  goto LABEL_280;
                }
                uint64_t v273 = v137;
                v269 = (void *)v139;
                uint64_t v267 = [v13 objectForKey:@"SBWorkspaceOpenApplicationResolvedWebClipSceneEntityKey"];
                v143 = v344;
                v144 = &off_1E6AEC000;
                if (!v344) {
                  goto LABEL_220;
                }
                v145 = [v344 info];
                if (([v145 isAppClip] & 1) == 0
                  && ![v344 isWebApplication])
                {
LABEL_219:

                  v143 = v344;
                  goto LABEL_220;
                }

                v143 = v344;
                if (v267)
                {
LABEL_220:
                  v147 = objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FB34F0], objc_opt_class());
                  int v148 = [v147 BOOLValue];

                  v149 = [v143 info];
                  int v150 = [v149 hasViewServicesEntitlement];

                  if (!v150 || !v148)
                  {
                    BOOL v155 = v261;
                    uint64_t v156 = v273;
                    goto LABEL_233;
                  }
                  v151 = [v15 bundleIdentifier];
                  v152 = [v144[488] sharedInstanceIfExists];
                  v153 = [v152 applicationWithBundleIdentifier:v151];

                  if (v153)
                  {
                    v154 = v151;
                    BOOL v155 = v261;
                  }
                  else
                  {
                    v154 = +[SBApplicationSupportServiceRequestContext hostingApplicationBundleIDForPid:](SBApplicationSupportServiceRequestContext, "hostingApplicationBundleIDForPid:", [v15 pid]);

                    v159 = [v144[488] sharedInstanceIfExists];
                    v153 = [v159 applicationWithBundleIdentifier:v154];

                    BOOL v155 = v261;
                    uint64_t v156 = v273;
                    if (!v153)
                    {
LABEL_232:

LABEL_233:
                      uint64_t v274 = v156;
                      int v262 = v297 & [v344 _canLaunchInClassicMode:v156];
                      if (v344)
                      {
                        v160 = [v344 info];
                        int v161 = [v160 hasHiddenTag];

                        uint64_t v162 = [v344 _classicMode];
                        if (v161)
                        {
                          uint64_t v163 = v162;
                          v164 = [v344 processState];
                          int v165 = [v164 isRunning];
                          int v166 = v163 == v156 ? 0 : v165;
                          id v167 = v14;
                          id v168 = v12;
                          int v169 = v166 & v262;

                          BOOL v74 = v169 == 1;
                          id v12 = v168;
                          id v14 = v167;
                          if (v74) {
                            SBWorkspaceTerminateApplication(v344, 5, 0, @"exit for classic mode relaunch", 0);
                          }
                        }
                      }
                      if (v264) {
                        SBWorkspaceTerminateApplication(v344, 5, 0, @"terminate for debugging launch request", 0);
                      }
                      if (v155)
                      {
                        v170 = [SBBackgroundFetchExternalRequest alloc];
                        v171 = [v344 info];
                        id v172 = [(SBBackgroundFetchExternalRequest *)v170 initForAppInfo:v171];

                        v173 = [v172 action];
                        [obja addObject:v173];
                      }
                      else
                      {
                        id v172 = 0;
                      }
                      id v22 = v342;
                      if (v269)
                      {
                        v174 = (void *)[objc_alloc(MEMORY[0x1E4F42A68]) initWithSessionIdentifier:v269];
                        [obja addObject:v174];
                      }
                      if (v306)
                      {
                        v175 = (void *)[objc_alloc(MEMORY[0x1E4F42C20]) initWithURL:v306];
                        [obja addObject:v175];
                      }
                      v176 = v344;
                      if (v12 || ![v292 length])
                      {
                        BOOL v177 = 0;
                      }
                      else if ([v290 length])
                      {
                        v185 = [(SBMainWorkspace *)v332 _handlerForExtensionPoint:v290];
                        BOOL v177 = v185 != 0;
                        if (v185)
                        {
                          v186 = objc_opt_new();
                          objc_msgSend(v186, "bs_setSafeObject:forKey:", v284, *MEMORY[0x1E4FA7060]);
                          objc_msgSend(v186, "bs_setSafeObject:forKey:", v283, *MEMORY[0x1E4FA7068]);
                          if ([v186 count]) {
                            v187 = v186;
                          }
                          else {
                            v187 = 0;
                          }
                          v380[0] = MEMORY[0x1E4F143A8];
                          v380[1] = 3221225472;
                          v380[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_670;
                          v380[3] = &unk_1E6AF5E48;
                          id v381 = v292;
                          v382 = v333;
                          [v185 launchExtensionWithBundleID:v381 options:v187 completion:v380];
                        }
                        v176 = v344;
                        id v22 = v342;
                        id v51 = v319;
                      }
                      else
                      {
                        BOOL v177 = 0;
                        v176 = v344;
                      }
                      if (v176)
                      {
                        char v248 = v47;
                        id v315 = v12;
                        if ([(SBInCallPresentationManager *)v332->_inCallPresentationManager canHandleOpenApplicationRequestForApplication:v176])
                        {
                          [v176 processState];
                          v179 = v178 = v176;
                          uint64_t v180 = [v179 pid];

                          v181 = [MEMORY[0x1E4F62448] sharedInstanceIfExists];
                          v182 = [v181 processForPID:v180];

                          v183 = [v182 workspace];
                          v184 = v178;
                          id v15 = v325;
                          [(SBInCallPresentationManager *)v332->_inCallPresentationManager handleOpenApplicationRequest:v184 clientWorkspace:v183 actions:obja origin:v325 options:v13 withResult:v333];

LABEL_276:
                          id v18 = v331;
LABEL_277:
                          v128 = v294;
                          v140 = v269;

                          id v17 = v346;
LABEL_278:
                          v141 = (void *)v267;
                          goto LABEL_279;
                        }
                        if (v249)
                        {
                          id v322 = v14;
                          v189 = [v338 sceneManager];
                          if (!v340)
                          {
                            id v340 = [v338 _fbsDisplayConfiguration];
                          }
                          int v250 = v257 | v286;
                          v190 = [v189 displayIdentity];
                          v191 = [v13 objectForKey:@"SBWorkspaceOpenApplicationResolvedWebClipSceneEntityKey"];
                          v192 = [v344 info];
                          v258 = v191;
                          if (([v192 isAppClip] & 1) != 0
                            || [v344 isWebApplication])
                          {

                            if (v191)
                            {
                              id v193 = v191;
                              goto LABEL_322;
                            }
                          }
                          else
                          {
                          }
                          if ((v250 | v255) == 1
                            && ([v344 info],
                                v210 = objc_claimAutoreleasedReturnValue(),
                                int v211 = [v210 supportsMultiwindow],
                                v210,
                                v211))
                          {
                            id v193 = +[SBDeviceApplicationSceneEntity newEntityWithApplication:v344 sceneHandleProvider:v189 displayIdentity:v190];
                          }
                          else
                          {
                            if (v285)
                            {
                              v212 = +[SBDeviceApplicationSceneEntity entityWithApplication:v344 scenePersistenceIdentifier:v285 sceneHandleProvider:v189 displayIdentity:v190];
                              v213 = SBLogCommon();
                              if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138543618;
                                *(void *)&uint8_t buf[4] = v285;
                                __int16 v431 = 2114;
                                v432 = v212;
                                _os_log_impl(&dword_1D85BA000, v213, OS_LOG_TYPE_DEFAULT, "did retrieve a workspace primary app scene entity for the received — %{public}@ — scene persistence identifier: %{public}@", buf, 0x16u);
                              }

LABEL_323:
                              if ([obja count]) {
                                [v212 addActions:obja];
                              }
                              [(SBMainWorkspace *)v332 _updateActivationSettings:v14 forRequestWithOptions:v341 clientProcess:v325 application:v344];
                              [v212 applyActivationSettings:v14];
                              if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]()) {
                                int v216 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
                              }
                              else {
                                int v216 = 0;
                              }
                              if (((LCSFeatureEnabled() | v216) & v259) == 1)
                              {
                                [v212 setFlag:1 forActivationSetting:36];
                                [v212 setFlag:1 forActivationSetting:35];
                                v217 = +[SBCaptureApplicationCenter sharedInstance];
                                char v218 = [v217 shouldInstallLaunchMonitoringForCaptureApplicationBundleIdentfier:v315];

                                if ((v218 & 1) == 0) {
                                  [v212 setFlag:1 forActivationSetting:38];
                                }
                              }
                              if (v262)
                              {
                                v219 = [NSNumber numberWithInteger:v274];
                                [v212 setObject:v219 forActivationSetting:20];
                              }
                              if (v276)
                              {
                                [v212 setObject:0 forActivationSetting:15];
                              }
                              else
                              {
                                [v212 setObject:v282 forProcessSetting:1];
                                [v212 setObject:v281 forProcessSetting:2];
                                [v212 setObject:v280 forProcessSetting:3];
                                [v212 setObject:v279 forProcessSetting:4];
                                [v212 setFlag:BSSettingFlagIfYes() forProcessSetting:6];
                                [v212 setFlag:BSSettingFlagIfYes() forProcessSetting:5];
                                [v212 setFlag:BSSettingFlagIfYes() forProcessSetting:7];
                              }
                              v376[0] = MEMORY[0x1E4F143A8];
                              v376[1] = 3221225472;
                              v376[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_674;
                              v376[3] = &unk_1E6AF5E70;
                              id v263 = v189;
                              id v377 = v263;
                              id v260 = v190;
                              id v378 = v260;
                              v256 = v333;
                              id v379 = v256;
                              v277 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v376);
                              v287 = objc_opt_new();
                              if (v297)
                              {
                                id v298 = v212;
                              }
                              else
                              {
                                if (([v212 supportsLayoutRole:v424] & 1) == 0)
                                {
                                  uint64_t v227 = [v212 uniqueIdentifier];
                                  v228 = SBLayoutRoleDescription(v424);
                                  id v220 = (id)v227;
                                  v229 = FBSOpenApplicationErrorCreate();
                                  ((void (*)(void (**)(void), void *))v256[2])(v256, v229);
                                  id v298 = 0;
                                  id v311 = 0;
                                  id v275 = 0;
                                  id v265 = 0;
                                  goto LABEL_401;
                                }
                                switch(v424)
                                {
                                  case 2:
                                    id v311 = v212;
                                    id v298 = 0;
                                    goto LABEL_339;
                                  case 3:
                                    id v275 = v212;
                                    id v298 = 0;
                                    id v311 = 0;
                                    goto LABEL_340;
                                  case 4:
                                    id v235 = v212;
                                    v236 = [v235 application];
                                    v237 = [v236 _dataStore];

                                    id v265 = v235;
                                    v238 = [v235 uniqueIdentifier];
                                    v239 = [v237 sceneStoreForIdentifier:v238 creatingIfNecessary:0];
                                    v240 = v239;
                                    if (v239) {
                                      [v239 setObject:MEMORY[0x1E4F1CC38] forKey:@"originatedInCenterWindow"];
                                    }

                                    id v298 = 0;
                                    id v311 = 0;
                                    id v275 = 0;
LABEL_341:
                                    if (v347 && !v298)
                                    {
                                      ((void (**)(void, id, uint64_t))v277)[2](v277, v347, 1);
                                      id v298 = (id)objc_claimAutoreleasedReturnValue();
                                    }
                                    if (!v336
                                      || v311
                                      || (((void (**)(void, id, uint64_t))v277)[2](v277, v336, v301),
                                          (id v311 = (id)objc_claimAutoreleasedReturnValue()) != 0))
                                    {
                                      if (!v343
                                        || v275
                                        || (((void (**)(void, id, uint64_t))v277)[2](v277, v343, v300),
                                            (id v275 = (id)objc_claimAutoreleasedReturnValue()) != 0))
                                      {
                                        if (!v319
                                          || v265
                                          || (((void (**)(void, id, uint64_t))v277)[2](v277, v319, v299),
                                              (id v265 = (id)objc_claimAutoreleasedReturnValue()) != 0))
                                        {
                                          long long v374 = 0u;
                                          long long v375 = 0u;
                                          long long v372 = 0u;
                                          long long v373 = 0u;
                                          id v220 = v345;
                                          uint64_t v221 = [v220 countByEnumeratingWithState:&v372 objects:v429 count:16];
                                          if (v221)
                                          {
                                            uint64_t v222 = v221;
                                            uint64_t v223 = *(void *)v373;
LABEL_355:
                                            uint64_t v224 = 0;
                                            while (1)
                                            {
                                              if (*(void *)v373 != v223) {
                                                objc_enumerationMutation(v220);
                                              }
                                              uint64_t v225 = v277[2](v277, *(void *)(*((void *)&v372 + 1) + 8 * v224), 2);
                                              if (!v225) {
                                                goto LABEL_402;
                                              }
                                              v226 = (void *)v225;
                                              [v287 addObject:v225];

                                              if (v222 == ++v224)
                                              {
                                                uint64_t v222 = [v220 countByEnumeratingWithState:&v372 objects:v429 count:16];
                                                if (v222) {
                                                  goto LABEL_355;
                                                }
                                                break;
                                              }
                                            }
                                          }

                                          if ((v271 & 1) == 0) {
                                            [v329 isUILocked];
                                          }
                                          [v298 setFlag:BSSettingFlagIfYes() forActivationSetting:29];
                                          [v311 setFlag:BSSettingFlagIfYes() forActivationSetting:29];
                                          [v275 setFlag:BSSettingFlagIfYes() forActivationSetting:29];
                                          [v265 setFlag:BSSettingFlagIfYes() forActivationSetting:29];
                                          long long v370 = 0u;
                                          long long v371 = 0u;
                                          long long v368 = 0u;
                                          long long v369 = 0u;
                                          id v230 = v287;
                                          uint64_t v231 = [v230 countByEnumeratingWithState:&v368 objects:v428 count:16];
                                          if (v231)
                                          {
                                            uint64_t v232 = v231;
                                            uint64_t v233 = *(void *)v369;
                                            do
                                            {
                                              for (uint64_t i = 0; i != v232; ++i)
                                              {
                                                if (*(void *)v369 != v233) {
                                                  objc_enumerationMutation(v230);
                                                }
                                                [*(id *)(*((void *)&v368 + 1) + 8 * i) setFlag:BSSettingFlagIfYes() forActivationSetting:29];
                                              }
                                              uint64_t v232 = [v230 countByEnumeratingWithState:&v368 objects:v428 count:16];
                                            }
                                            while (v232);
                                          }

                                          BOOL v326 = -[SBMainWorkspace _isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:options:origin:](v332, "_isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:options:origin:", v315, v341, v325)|| [v294 isEqualToString:*MEMORY[0x1E4F4A480]];
                                          if (v337)
                                          {
                                            uint64_t v241 = 2;
                                          }
                                          else
                                          {
                                            int v242 = [v298 BOOLForActivationSetting:3];
                                            uint64_t v241 = 2;
                                            if (!v242) {
                                              uint64_t v241 = 0;
                                            }
                                          }
                                          if (v253) {
                                            v241 |= 4uLL;
                                          }
                                          if (v250) {
                                            v241 |= 0x10uLL;
                                          }
                                          uint64_t v243 = 64;
                                          if (v251) {
                                            uint64_t v243 = 32;
                                          }
                                          v244 = [(SBMainWorkspace *)v332 createRequestForApplicationActivation:v212 withDisplayConfiguration:v340 options:v241 | v243];
                                          [v244 setOriginatingProcess:v325];
                                          v245 = [v212 uniqueIdentifier];
                                          [v325 pid];
                                          v246 = BSProcessDescriptionForPID();
                                          [v244 setEventLabelWithFormat:@"OpenApplication(%@)ForRequester(%@)", v245, v246];

                                          [v244 setShouldPreventDismissalOfUnrelatedTransientOverlays:v252];
                                          v228 = [v244 applicationContext];
                                          v365[0] = MEMORY[0x1E4F143A8];
                                          v365[1] = 3221225472;
                                          v365[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_2_682;
                                          v365[3] = &unk_1E6AF5E98;
                                          v367 = v256;
                                          id v366 = v172;
                                          [v228 setResultBlock:v365];
                                          v362[0] = MEMORY[0x1E4F143A8];
                                          v362[1] = 3221225472;
                                          v362[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_3;
                                          v362[3] = &__block_descriptor_34_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
                                          BOOL v363 = v326;
                                          char v364 = v254;
                                          [v244 modifyApplicationContext:v362];
                                          [(SBMainWorkspace *)v332 _determineSourceForTransitionRequest:v244];
                                          id v220 = v244;
                                          if (![v244 source]) {
                                            [v244 setSource:13];
                                          }
                                          v348[0] = MEMORY[0x1E4F143A8];
                                          v348[1] = 3221225472;
                                          v348[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_4;
                                          v348[3] = &unk_1E6AF5F08;
                                          char v358 = v316;
                                          char v359 = v309;
                                          char v360 = v248;
                                          char v361 = v296;
                                          uint64_t v356 = v424;
                                          id v349 = v338;
                                          id v298 = v298;
                                          id v350 = v298;
                                          id v311 = v311;
                                          id v351 = v311;
                                          id v275 = v275;
                                          id v352 = v275;
                                          id v265 = v265;
                                          id v353 = v265;
                                          id v354 = v230;
                                          v355 = v330;
                                          uint64_t v357 = v423;
                                          [(SBMainWorkspace *)v332 executeTransitionRequest:v244 withValidator:v348];

                                          v229 = v367;
LABEL_401:

LABEL_402:
                                          goto LABEL_403;
                                        }
                                        id v265 = 0;
                                      }
                                      else
                                      {
                                        id v275 = 0;
                                      }
                                    }
                                    else
                                    {
                                      id v311 = 0;
                                    }
LABEL_403:

                                    id v12 = v315;
                                    id v14 = v322;
                                    id v15 = v325;
                                    id v18 = v331;
                                    id v22 = v342;
                                    id v51 = v319;
                                    goto LABEL_277;
                                }
                                id v298 = 0;
                              }
                              id v311 = 0;
LABEL_339:
                              id v275 = 0;
LABEL_340:
                              id v265 = 0;
                              goto LABEL_341;
                            }
                            id v193 = +[SBDeviceApplicationSceneEntity defaultEntityWithApplication:v344 targetContentIdentifier:v307 sceneHandleProvider:v189 displayIdentity:v190];
                          }
LABEL_322:
                          v212 = v193;
                          goto LABEL_323;
                        }
                        v194 = FBSOpenApplicationErrorCreate();
                        ((void (*)(void (**)(void), void *))v333[2])(v333, v194);
                      }
                      else if ([obja count])
                      {
                        v188 = [(id)SBApp _mainScene];
                        [v188 sendActions:obja];

                        ((void (*)(void (**)(void), void))v333[2])(v333, 0);
                      }
                      else if (!v177)
                      {
                        __SBWorkspaceActivateSpringBoardWithResult(0, 0, 0, 0, 0, v333, 0);
                      }
                      id v15 = v325;
                      goto LABEL_276;
                    }
                  }
                  uint64_t v156 = [v153 _classicMode];

                  goto LABEL_232;
                }
                v321 = v14;
                v146 = v12;
                if (v288)
                {
                  v145 = SBLogCommon();
                  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D85BA000, v145, OS_LOG_TYPE_DEFAULT, "Trying to launch an app clip, but this looks like a launch from Xcode. Falling back to default application launch path", buf, 2u);
                  }
                  id v15 = v325;
                  id v51 = v319;
                  goto LABEL_219;
                }
                v196 = [(id)SBApp webClipService];
                id v197 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [MEMORY[0x1E4F43048] clipsIncludingWebClips:1 includingAppClips:1];
                long long v391 = 0u;
                long long v392 = 0u;
                long long v393 = 0u;
                long long v394 = 0u;
                id v198 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v199 = [v198 countByEnumeratingWithState:&v391 objects:v435 count:16];
                if (v199)
                {
                  uint64_t v200 = v199;
                  uint64_t v201 = *(void *)v392;
                  do
                  {
                    for (uint64_t j = 0; j != v200; ++j)
                    {
                      if (*(void *)v392 != v201) {
                        objc_enumerationMutation(v198);
                      }
                      uint64_t v203 = *(void *)(*((void *)&v391 + 1) + 8 * j);
                      v204 = [v196 targetApplicationBundleIdentifierForWebClip:v203];
                      if (v204 && BSEqualStrings()) {
                        [v197 addObject:v203];
                      }
                    }
                    uint64_t v200 = [v198 countByEnumeratingWithState:&v391 objects:v435 count:16];
                  }
                  while (v200);
                }

                uint64_t v205 = +[SBWebClipService bestWebClipForTargetContentIdentifier:v307 fromWebClips:v197];
                if (v205)
                {
                  v206 = (void *)v205;
                  v207 = SBLogCommon();
                  if (!os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_315;
                  }
                  id v208 = [v206 pageURL];
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v146;
                  __int16 v431 = 2114;
                  v432 = v307;
                  __int16 v433 = 2114;
                  id v434 = v208;
                  v209 = "Best web clip found for app clip '%{public}@' with targetContentIdentifier '%{public}@': '%{public}@'.";
                }
                else
                {
                  v206 = [v197 lastObject];
                  v207 = SBLogCommon();
                  if (!os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_315;
                  }
                  id v208 = [v206 pageURL];
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v146;
                  __int16 v431 = 2114;
                  v432 = v307;
                  __int16 v433 = 2114;
                  id v434 = v208;
                  v209 = "Couldn't find a web clip for '%{public}@' with targetContentIdentifier '%{public}@'. Picking: '%{public}@'.";
                }
                _os_log_impl(&dword_1D85BA000, v207, OS_LOG_TYPE_DEFAULT, v209, buf, 0x20u);

LABEL_315:
                v214 = [v206 identifier];
                if (v214)
                {
                  v383[0] = MEMORY[0x1E4F143A8];
                  v383[1] = 3221225472;
                  v383[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_655;
                  v383[3] = &unk_1E6AF5E20;
                  v384 = v341;
                  v385 = v332;
                  id v386 = v146;
                  id v387 = v321;
                  id v388 = v325;
                  v390 = v333;
                  id v389 = v214;
                  [v196 prepareToLaunchWebClipWithIdentifier:v389 handler:v383];

                  v215 = v384;
                }
                else
                {
                  v215 = SBLogCommon();
                  if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR)) {
                    -[SBMainWorkspace _handleOpenApplicationRequest:options:activationSettings:origin:withResult:]();
                  }
                }

                id v12 = v146;
                id v14 = v321;
                id v15 = v325;
                v143 = v344;
                id v51 = v319;
                id v13 = v341;
                v144 = &off_1E6AEC000;
                if (v214)
                {
                  id v17 = v346;
                  id v18 = v331;
                  id v22 = v342;
                  v128 = v294;
                  v140 = v269;
                  goto LABEL_278;
                }
                goto LABEL_220;
              }
              v247 = [v344 bundleIdentifier];
              v195 = FBSOpenApplicationErrorCreate();
              ((void (*)(void (**)(void), void *))v333[2])(v333, v195);

              id v22 = v342;
            }

            id v17 = v346;
            id v18 = v331;
            int v20 = v344;
LABEL_209:
            id v51 = v319;
            goto LABEL_210;
          }
          id v14 = v113;
          id v15 = v325;
          if (((v266 | v268) & 1) == 0)
          {
            id v402 = 0;
            BOOL v124 = [(SBMainWorkspace *)v332 _canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin:v325 givenOrigin:v294 trustedRequest:1 outReason:&v402];
            id v125 = v402;
            v126 = v125;
            if (!v124)
            {

              v158 = FBSOpenApplicationErrorCreate();
              ((void (*)(void (**)(void), void *))v333[2])(v333, v158);

              id v18 = v331;
              int v20 = v344;
              v128 = v294;
              goto LABEL_280;
            }
            v127 = SBLogWorkspace();
            if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v126;
              __int16 v431 = 2112;
              v432 = v325;
              _os_log_impl(&dword_1D85BA000, v127, OS_LOG_TYPE_DEFAULT, "Allowing openApplication unlock attempt because we're authenticated and %@: %@", buf, 0x16u);
            }
          }
          v395[1] = (id)MEMORY[0x1E4F143A8];
          v395[2] = (id)3221225472;
          v395[3] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_633;
          v395[4] = &unk_1E6AF5DF8;
          id v396 = v13;
          v397 = v332;
          id v398 = v12;
          id v399 = v14;
          id v400 = v325;
          v401 = v333;
          v128 = v294;
          int v20 = v344;
          -[SBMainWorkspace _attemptUnlockToApplication:showPasscode:origin:givenOrigin:options:completion:](v332, "_attemptUnlockToApplication:showPasscode:origin:givenOrigin:options:completion:");

          id v18 = v331;
LABEL_280:
          v82 = obja;
          goto LABEL_281;
        }
      }
    }
    v78 = FBSOpenApplicationErrorCreate();
    ((void (*)(void (**)(void), void *))v333[2])(v333, v78);
    goto LABEL_152;
  }
  ((void (*)(void (**)(void), id))v19[2])(v19, v21);
LABEL_288:
}

- (BOOL)_canAppWithBundleIdentifier:(id)a3 requestMovingContentToSceneOpenApplicationOptions:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4FA7138];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v6, "bs_safeNumberForKey:", v5);
  char v9 = [v8 BOOLValue];

  uint64_t v10 = objc_msgSend(v6, "bs_safeStringForKey:", *MEMORY[0x1E4FA7130]);
  char v11 = [(id)v10 isEqualToString:*MEMORY[0x1E4FA70A0]];

  LOBYTE(v10) = [v7 isEqualToString:@"com.apple.mobilemail"];
  id v12 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x1E4F625F8]);

  LOBYTE(v6) = [v12 BOOLValue];
  return v9 & v10 & v11 & v6;
}

- (id)createRequestForApplicationActivation:(id)a3 withDisplayConfiguration:(id)a4 options:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SBMainWorkspace;
  uint64_t v5 = [(SBWorkspace *)&v7 createRequestForApplicationActivation:a3 withDisplayConfiguration:a4 options:a5];
  return v5;
}

void __59__SBMainWorkspace_process_stateDidChangeFromState_toState___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isApplicationProcess])
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = [*(id *)(a1 + 32) bundleIdentifier];
    id v4 = [v2 _applicationForIdentifier:v3];

    [v4 _noteProcess:*(void *)(a1 + 32) didChangeToState:*(void *)(a1 + 48)];
  }
}

- (id)_applicationForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SBApplicationController sharedInstanceIfExists];
  uint64_t v5 = [v4 applicationWithBundleIdentifier:v3];

  return v5;
}

void __48__SBMainWorkspace_applicationProcessWillLaunch___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SBApplicationController sharedInstanceIfExists];
  id v3 = [*(id *)(a1 + 32) bundleIdentifier];
  id v4 = [v2 applicationWithBundleIdentifier:v3];

  [v4 _processWillLaunch:*(void *)(a1 + 32)];
}

- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  char v9 = [v7 bundleIdentifier];
  uint64_t v10 = [v7 clientProcess];
  uint64_t v11 = [MEMORY[0x1E4F624C8] currentOpenApplicationInstance];
  id v12 = SBLogWorkspace();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  id v54 = v8;
  if (v11)
  {
    if (!v13) {
      goto LABEL_11;
    }
    int v14 = [v7 isTrusted];
    id v15 = @"untrusted";
    *(_DWORD *)buf = 138544130;
    if (v14) {
      id v15 = @"trusted";
    }
    uint64_t v56 = v15;
    __int16 v57 = 2114;
    uint64_t v58 = v11;
    __int16 v59 = 2114;
    uint64_t v60 = v9;
    __int16 v61 = 2114;
    uint64_t v62 = v10;
    id v16 = "Received %{public}@ open application request to %{public}@ for \"%{public}@\" from %{public}@.";
    id v17 = v12;
    uint32_t v18 = 42;
  }
  else
  {
    if (!v13) {
      goto LABEL_11;
    }
    int v19 = [v7 isTrusted];
    int v20 = @"untrusted";
    *(_DWORD *)buf = 138543874;
    if (v19) {
      int v20 = @"trusted";
    }
    uint64_t v56 = v20;
    __int16 v57 = 2114;
    uint64_t v58 = (uint64_t)v9;
    __int16 v59 = 2114;
    uint64_t v60 = v10;
    id v16 = "Received %{public}@ open application request for \"%{public}@\" from %{public}@.";
    id v17 = v12;
    uint32_t v18 = 32;
  }
  _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_11:
  uint64_t v52 = v11;

  int v21 = [v7 isTrusted];
  id v22 = [MEMORY[0x1E4F1CA60] dictionary];
  char v23 = [v7 options];
  uint64_t v24 = [v23 dictionary];

  if (v24)
  {
    uint64_t v25 = objc_msgSend(v7, "options", v52);
    id v26 = [v25 dictionary];
    [v22 addEntriesFromDictionary:v26];
  }
  SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary();
  int v27 = [v10 hasEntitlement:@"com.apple.LaunchApp"];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v27 && has_internal_diagnostics)
  {
    id v29 = objc_msgSend(v22, "bs_safeArrayForKey:", *MEMORY[0x1E4F62640]);
    if (v29)
    {
      int v30 = [(SBMainWorkspace *)self _parseShellArguments:v29];
      [v22 addEntriesFromDictionary:v30];
      if (!v9)
      {
        char v31 = objc_msgSend(v22, "bs_safeArrayForKey:", *MEMORY[0x1E4FA7100]);
        char v9 = [v31 firstObject];
      }
    }
  }
  int v32 = +[SBApplicationController sharedInstanceIfExists];
  id v33 = [v32 applicationWithBundleIdentifier:v9];

  if (v33)
  {
    id v34 = [v33 info];
    int v35 = [v34 shouldLaunchSuspendedAlways];

    uint64_t v36 = *MEMORY[0x1E4F625F8];
    if (v35)
    {
      [v22 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F625F8]];
      int v21 = 1;
    }
  }
  else
  {
    uint64_t v36 = *MEMORY[0x1E4F625F8];
  }
  if ([v9 isEqualToString:@"com.apple.DataActivation"])
  {
    [v22 setObject:MEMORY[0x1E4F1CC38] forKey:v36];
    int v21 = 1;
  }
  uint64_t v37 = objc_msgSend(v22, "bs_safeNumberForKey:", v36);
  int v38 = [v37 BOOLValue];

  id v39 = objc_msgSend(v22, "bs_safeNumberForKey:", *MEMORY[0x1E4FA7000]);
  if ([v39 BOOLValue]) {
    char v40 = [v9 isEqualToString:@"com.apple.InCallService"];
  }
  else {
    char v40 = 0;
  }

  if (v38 && (v40 & 1) == 0)
  {
    [v22 removeObjectForKey:*MEMORY[0x1E4F626A0]];
    [v22 removeObjectForKey:*MEMORY[0x1E4F62688]];
  }
  id v41 = objc_msgSend(v22, "bs_safeNumberForKey:", *MEMORY[0x1E4FA6E80]);
  int v42 = [v41 BOOLValue];

  if (v42)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v44 = *MEMORY[0x1E4F62670];
    long long v45 = objc_msgSend(v22, "bs_safeDictionaryForKey:", *MEMORY[0x1E4F62670]);
    if (v45) {
      [v43 addEntriesFromDictionary:v45];
    }
    [v43 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F43680]];
    [v22 setObject:v43 forKey:v44];
  }
  long long v46 = [v10 bundleIdentifier];
  int v47 = [v46 isEqualToString:@"com.apple.Spotlight"];

  if (v47) {
    [v22 setObject:*MEMORY[0x1E4FA7090] forKey:*MEMORY[0x1E4F62658]];
  }
  long long v48 = objc_alloc_init(SBActivationSettings);
  [(SBActivationSettings *)v48 setFlag:BSSettingFlagForBool() forActivationSetting:52];
  BOOL v49 = [MEMORY[0x1E4F624C8] currentOpenApplicationInstance];
  if (v49) {
    [(SBActivationSettings *)v48 setObject:v49 forActivationSetting:51];
  }
  id v50 = [v10 handle];
  if (v21)
  {
    id v51 = v54;
    [(SBMainWorkspace *)self _handleTrustedOpenRequestForApplication:v9 options:v22 activationSettings:v48 origin:v50 withResult:v54];
  }
  else
  {
    id v51 = v54;
    [(SBMainWorkspace *)self _handleUntrustedOpenRequestForApplication:v9 options:v22 activationSettings:v48 origin:v50 withResult:v54];
  }
}

- (void)_handleTrustedOpenRequestForApplication:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v16)
  {
    int v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"result"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMainWorkspace _handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_20:
    JUMPOUT(0x1D8699F70);
  }
  if (!v14)
  {
    char v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settings"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMainWorkspace _handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8699FD4);
  }
  id v17 = v16;
  if (([v14 BOOLForActivationSetting:52] & 1) == 0)
  {
    int v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[settings BOOLForActivationSetting:kSBAppActivationSettingFromTrustedSystemServiceRequest]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMainWorkspace _handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:]((uint64_t)v32);
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_20;
  }
  if (objc_msgSend(v13, "bs_BOOLForKey:", *MEMORY[0x1E4F625F8]))
  {
    [(SBMainWorkspace *)self _handleOpenApplicationRequest:v12 options:v13 activationSettings:v14 origin:v15 withResult:v17];
  }
  else
  {
    uint32_t v18 = objc_msgSend(v13, "bs_safeURLForKey:", *MEMORY[0x1E4F62678]);
    int v19 = SBWorkspaceOpenURLIsHandledBySpringBoard(v18);

    id v33 = self;
    if (v19)
    {
      uint64_t v20 = [NSString stringWithFormat:@"FBSystemService-SpringBoardURL: %@", v12];
      int v21 = (void *)MEMORY[0x1E4F624D8];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __104__SBMainWorkspace__handleTrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke;
      v42[3] = &unk_1E6AF5F30;
      v42[4] = self;
      int v35 = &v43;
      id v43 = v12;
      id v34 = &v44;
      id v44 = v13;
      id v22 = &v45;
      id v45 = v14;
      char v23 = &v46;
      id v46 = v15;
      uint64_t v24 = &v47;
      id v47 = v17;
      uint64_t v25 = v42;
    }
    else
    {
      uint64_t v20 = [NSString stringWithFormat:@"FBSystemService-TrustedRequest: %@", v12];
      int v21 = (void *)MEMORY[0x1E4F624D8];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __104__SBMainWorkspace__handleTrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke_2;
      v36[3] = &unk_1E6AF5F30;
      v36[4] = self;
      int v35 = &v37;
      id v37 = v12;
      id v34 = &v38;
      id v38 = v13;
      id v22 = &v39;
      id v39 = v14;
      char v23 = &v40;
      id v40 = v15;
      uint64_t v24 = &v41;
      id v41 = v17;
      uint64_t v25 = v36;
    }
    id v26 = v21;
    int v27 = (void *)v20;
    id v28 = [v26 eventWithName:v20 handler:v25];

    id v29 = [(SBWorkspace *)v33 eventQueue];
    [v29 executeOrAppendEvent:v28];
  }
}

- (void)_handleUserActionRequest:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (__CFString *)a6;
  id v15 = a7;
  BSDispatchQueueAssertMain();
  int v114 = (void (**)(void, void))v15;
  if (!v15)
  {
    v93 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"result"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMainWorkspace _handleUserActionRequest:options:activationSettings:origin:withResult:]();
    }
    [v93 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86B7DC0);
  }
  if (!v13)
  {
    v94 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"activationSettings"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMainWorkspace _handleUserActionRequest:options:activationSettings:origin:withResult:]();
    }
    [v94 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D86B7E24);
  }
  id v16 = objc_msgSend(v12, "bs_safeURLForKey:", *MEMORY[0x1E4F62678]);
  id v17 = +[SBApplicationController sharedInstance];
  char v112 = v13;
  int v18 = [v13 BOOLForActivationSetting:52];
  id v113 = v16;
  int v19 = [v16 scheme];
  int v20 = [v19 isEqualToString:@"test"];

  v110 = v17;
  int v21 = [v17 dataActivationApplication];
  id v22 = [v21 bundleIdentifier];
  int v23 = [v11 isEqualToIgnoringCase:v22];

  uint64_t v24 = objc_msgSend(v12, "bs_safeObjectForKey:ofType:", @"__SBWorkspaceOpenOptionUnlockResult", objc_opt_class());
  int v115 = [v24 BOOLValue];

  uint64_t v109 = objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F62658], objc_opt_class());
  long long v134 = 0u;
  long long v135 = 0u;
  uint64_t v25 = [(__CFString *)v14 auditToken];
  id v26 = v25;
  if (v25)
  {
    [v25 realToken];
  }
  else
  {
    long long v134 = 0u;
    long long v135 = 0u;
  }

  int v27 = SBRunningApplicationForAuditToken();
  id v28 = v27;
  char v29 = v27 != 0;
  if (v27) {
    int v30 = v18;
  }
  else {
    int v30 = 1;
  }
  if (!v30) {
    char v29 = v115 | v23;
  }
  char v31 = v112;
  v111 = v14;
  if (v27
    && (v29 & 1) == 0
    && (SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication(v27) & 1) == 0
    && ![(SBMainWorkspace *)self isApplicationRunningAsViewService:v28]
    && ([(__CFString *)v14 hasEntitlement:@"com.apple.springboard.openurlinbackground"] & 1) == 0)
  {
    id v36 = [v28 bundleIdentifier];
    uint64_t v58 = FBSOpenApplicationErrorCreate();
    ((void (**)(void, void *))v114)[2](v114, v58);

    goto LABEL_99;
  }
  int v104 = v20;
  int v105 = v23;
  int v32 = [MEMORY[0x1E4F62448] sharedInstance];
  id v33 = objc_msgSend(v32, "processForPID:", -[__CFString pid](v14, "pid"));

  v107 = v33;
  int v34 = [v33 isExtensionProcess];
  int v35 = v34 & (v18 | v115);
  if (!v34 || (v35 & 1) != 0)
  {
LABEL_59:
    if (!v113)
    {
      [(SBMainWorkspace *)self _handleOpenApplicationRequest:v11 options:v12 activationSettings:v31 origin:v111 withResult:v114];
LABEL_98:
      id v36 = v107;
      goto LABEL_99;
    }
    if (v105) {
      [v110 dataActivationApplication];
    }
    else {
    char v64 = [v110 applicationWithBundleIdentifier:v11];
    }
    char v65 = objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F625F8], objc_opt_class());
    int v66 = [v65 BOOLValue];

    id v133 = 0;
    id v67 = [(SBMainWorkspace *)self _targetWindowSceneForApplication:v64 options:v12 settings:v31 requireForeground:v66 ^ 1u targetDisplayConfiguration:0 error:&v133];
    id v68 = v133;
    id v69 = v68;
    if (!v67 && v68)
    {
      ((void (**)(void, id))v114)[2](v114, v68);
LABEL_97:

      goto LABEL_98;
    }
    v98 = v64;
    int v70 = objc_msgSend(v67, "uiLockStateProvider", v95, v96);
    uint64_t v71 = v70;
    if (v70)
    {
      id v72 = v70;
    }
    else
    {
      id v72 = +[SBLockScreenManager sharedInstance];
    }
    uint64_t v73 = v72;

    BOOL v74 = [v67 authenticationStatusProvider];
    int v75 = v74;
    if (v74)
    {
      id v76 = v74;
    }
    else
    {
      id v76 = [(id)SBApp authenticationController];
    }
    char v77 = v76;

    v101 = v73;
    int v78 = [v73 isUILocked];
    if ((v104 | [v77 isAuthenticatedCached] | v78 ^ 1 | v115))
    {
      char v64 = v98;
      if (!v11 || v98)
      {
        BOOL v79 = v101;
        if (v98)
        {
          [(SBMainWorkspace *)self _updateActivationSettings:v31 forRequestWithOptions:v12 clientProcess:v111 application:v98];
          if ((v115 & 1) == 0) {
            [v101 isUILocked];
          }
          [v31 setFlag:BSSettingFlagIfYes() forActivationSetting:29];
        }
      }
      else
      {
        BOOL v79 = v101;
        if (([v11 isEqualToString:@"com.apple.springboard"] & 1) == 0)
        {
          char v80 = FBSOpenApplicationErrorCreate();
          ((void (**)(void, void *))v114)[2](v114, v80);

          BOOL v79 = v101;
LABEL_96:

          goto LABEL_97;
        }
      }
      if (v105)
      {
        v91 = +[SBWorkspace mainWorkspace];
        v117[0] = MEMORY[0x1E4F143A8];
        v117[1] = 3221225472;
        v117[2] = __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke_2;
        v117[3] = &unk_1E6AF5F80;
        v118 = v111;
        id v119 = v98;
        id v120 = v31;
        v121 = v114;
        [v91 requestTransitionWithBuilder:v117];

        BOOL v79 = v101;
      }
      else
      {
        [(id)SBApp applicationOpenURL:v113 withApplication:v98 animating:1 activationSettings:v31 origin:v111 notifyLSOnFailure:0 withResult:v114];
      }
      goto LABEL_96;
    }
    v116 = v67;
    v103 = v11;
    char v81 = objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F626A0], objc_opt_class());
    int v82 = [v81 BOOLValue];

    v83 = objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F62688], objc_opt_class());
    int v84 = [v83 BOOLValue];

    v85 = v111;
    if ([(__CFString *)v111 hasEntitlement:@"com.apple.springboard.openurlswhenlocked"]) {
      goto LABEL_83;
    }
    v106 = v69;
    id v132 = 0;
    BOOL v86 = -[SBMainWorkspace _canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin:givenOrigin:trustedRequest:outReason:](self, "_canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin:givenOrigin:trustedRequest:outReason:", v111, v109, [v112 BOOLForActivationSetting:52], &v132);
    v87 = (__CFString *)v132;
    v88 = v87;
    if (v86)
    {
      v89 = SBLogWorkspace();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v137 = v88;
        __int16 v138 = 2112;
        uint64_t v139 = v111;
        _os_log_impl(&dword_1D85BA000, v89, OS_LOG_TYPE_DEFAULT, "Allowing openURL unlock attempt for un-entitled process because we're authenticated and %@: %@", buf, 0x16u);
      }

      v85 = v111;
      id v69 = v106;
      goto LABEL_83;
    }

    if (v82 | v84)
    {
      v85 = v111;
      id v69 = v106;
      if (v35)
      {
LABEL_83:
        uint64_t v122 = MEMORY[0x1E4F143A8];
        uint64_t v123 = 3221225472;
        BOOL v124 = __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke;
        id v125 = &unk_1E6AF5DF8;
        id v126 = v12;
        v127 = self;
        id v11 = v103;
        id v128 = v103;
        char v31 = v112;
        id v129 = v112;
        v130 = v85;
        v131 = v114;
        char v64 = v98;
        -[SBMainWorkspace _attemptUnlockToApplication:showPasscode:origin:givenOrigin:options:completion:](self, "_attemptUnlockToApplication:showPasscode:origin:givenOrigin:options:completion:");

        BOOL v79 = v101;
LABEL_84:
        id v67 = v116;
        goto LABEL_96;
      }
      v90 = FBSOpenApplicationErrorCreate();
      ((void (**)(void, void *))v114)[2](v114, v90);

      id v11 = v103;
      char v31 = v112;
    }
    else
    {
      id v11 = v103;
      v92 = FBSOpenApplicationErrorCreate();
      ((void (**)(void, void *))v114)[2](v114, v92);

      char v31 = v112;
      id v69 = v106;
    }
    BOOL v79 = v101;
    char v64 = v98;
    goto LABEL_84;
  }
  id v36 = v107;
  id v37 = [v36 extensionInfo];
  id v38 = [v37 typeIdentifier];
  uint64_t v39 = objc_msgSend(v37, "sb_type");
  unint64_t v40 = v39;
  v99 = v28;
  if (v39)
  {
    NSStringFromSBExtensionType(v39);
    id v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v41 = v38;
  }
  int v42 = v41;
  FBSProcessPrettyDescription();
  id v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v44 = SBLogCommon();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v137 = v43;
    __int16 v138 = 2114;
    uint64_t v139 = v42;
    _os_log_impl(&dword_1D85BA000, v44, OS_LOG_TYPE_INFO, "Verifying request for <%{public}@> of extension type \"%{public}@\"...", buf, 0x16u);
  }

  v100 = v42;
  id v102 = v11;
  if (v40 == 15)
  {
    id v45 = [MEMORY[0x1E4F96408] identityOfCurrentProcess];
    id v46 = [v36 identity];
    id v47 = [v46 hostIdentity];
    int v48 = [(__CFString *)v45 isEqual:v47];

    if (!v48)
    {
      v95 = v38;
      v96 = v45;
      id v54 = v38;
      BOOL v49 = FBSOpenApplicationErrorCreate();
      ((void (**)(void, void *))v114)[2](v114, v49);
      int v35 = 0;
      int v57 = 1;
      goto LABEL_58;
    }
    BOOL v49 = [v37 extensionIdentifier];
    id v50 = [(id)SBApp notificationDispatcher];
    int v51 = [v50 isNotificationContentExtensionVisible:v49];

    uint64_t v52 = SBLogCommon();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      uint64_t v53 = @"NOT VISIBLE";
      if (v51) {
        uint64_t v53 = @"VISIBLE";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v137 = v43;
      __int16 v138 = 2114;
      uint64_t v139 = v53;
      _os_log_impl(&dword_1D85BA000, v52, OS_LOG_TYPE_INFO, "NotificationUI extension <%{public}@> visibility is: %{public}@", buf, 0x16u);
    }

    id v54 = v38;
    if ((v51 & 1) == 0)
    {
      int v42 = v100;
      goto LABEL_46;
    }
LABEL_53:
    int v62 = 1;
    goto LABEL_54;
  }
  uint64_t v97 = [v37 extensionIdentifier];
  if (v40 > 0xE) {
    goto LABEL_41;
  }
  if (((1 << v40) & 0x3EFE) != 0)
  {
    uint64_t v55 = SBLogCommon();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v54 = v38;
      uint64_t v137 = v38;
      uint64_t v56 = "Extension type \"<%{public}@>\" predates 10.0 -- ignoring visibility check and allowing the openURL request.";
LABEL_35:
      _os_log_impl(&dword_1D85BA000, v55, OS_LOG_TYPE_INFO, v56, buf, 0xCu);
LABEL_52:
      BOOL v49 = (void *)v97;

      id v45 = 0;
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  if (v40 == 14)
  {
    uint64_t v55 = SBLogCommon();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v137 = v43;
      _os_log_impl(&dword_1D85BA000, v55, OS_LOG_TYPE_INFO, "Extension <%{public}@> is not allowed to open URLs, period.", buf, 0xCu);
    }
  }
  else
  {
LABEL_41:
    __int16 v59 = _SBApplicationStateGetMonitor();
    int v60 = objc_msgSend(v59, "mostElevatedApplicationStateForPID:", objc_msgSend(v36, "pid"));

    uint64_t v55 = SBLogCommon();
    BOOL v61 = os_log_type_enabled(v55, OS_LOG_TYPE_INFO);
    if ((v60 & 8) != 0)
    {
      if (v61)
      {
        id v54 = v38;
        *(_DWORD *)buf = 138543362;
        uint64_t v137 = v43;
        uint64_t v56 = "Extension <%{public}@> is considered foreground-running.";
        goto LABEL_35;
      }
LABEL_51:
      id v54 = v38;
      goto LABEL_52;
    }
    if (v61)
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v137 = v43;
      __int16 v138 = 1024;
      LODWORD(v139) = v60;
      _os_log_impl(&dword_1D85BA000, v55, OS_LOG_TYPE_INFO, "Extension <%{public}@> is not considered foreground-running (state: %u).", buf, 0x12u);
    }
    int v42 = v100;
  }
  BOOL v49 = (void *)v97;
  id v54 = v38;

  id v45 = 0;
LABEL_46:
  if ([(__CFString *)v111 hasEntitlement:@"com.apple.springboard.openurlinbackground"])
  {
    int v62 = 0;
LABEL_54:
    uint64_t v63 = SBLogCommon();
    int v35 = 1;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v137 = v43;
      __int16 v138 = 1024;
      LODWORD(v139) = v62;
      _os_log_impl(&dword_1D85BA000, v63, OS_LOG_TYPE_INFO, "Allowing openURL request from extension <%{public}@> because it is visible (%d) or entitled.", buf, 0x12u);
    }
    int v57 = 0;
    goto LABEL_57;
  }
  v95 = v42;
  v96 = v43;
  uint64_t v63 = FBSOpenApplicationErrorCreate();
  ((void (**)(void, NSObject *))v114)[2](v114, v63);
  int v35 = 0;
  int v57 = 1;
LABEL_57:

LABEL_58:
  id v11 = v102;
  char v31 = v112;
  id v28 = v99;
  if (!v57) {
    goto LABEL_59;
  }
LABEL_99:
}

- (id)_targetWindowSceneForApplication:(id)a3 options:(id)a4 settings:(id)a5 requireForeground:(BOOL)a6 targetDisplayConfiguration:(id *)a7 error:(id *)a8
{
  uint64_t v10 = a6;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = [a5 objectForActivationSetting:51];
  if (![v16 isEqualToString:*MEMORY[0x1E4FA6F18]])
  {
    int v21 = objc_msgSend(v15, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA70E0], objc_opt_class());
    if (![v21 length]) {
      goto LABEL_27;
    }
    if ((SBFIsChamoisExternalDisplayControllerAvailable() & 1) != 0
      || +[SBContinuitySessionManager areContinuitySessionsAllowed])
    {
      int v48 = self;
      unsigned int v49 = v10;
      id v50 = a8;
      int v51 = a7;
      id v52 = v14;
      uint64_t v53 = v21;
      id v22 = v21;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      int v23 = [(id)SBApp windowSceneManager];
      uint64_t v24 = [v23 connectedWindowScenes];

      uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v55;
LABEL_11:
        uint64_t v28 = 0;
        while (1)
        {
          if (*(void *)v55 != v27) {
            objc_enumerationMutation(v24);
          }
          char v29 = [*(id *)(*((void *)&v54 + 1) + 8 * v28) _fbsDisplayConfiguration];
          int v30 = [v29 deviceName];
          char v31 = [v30 isEqualToString:v22];

          if (v31) {
            break;
          }

          if (v26 == ++v28)
          {
            uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v58 count:16];
            if (v26) {
              goto LABEL_11;
            }
            goto LABEL_17;
          }
        }

        id v32 = v29;
        if (!v32) {
          goto LABEL_23;
        }
        id v33 = v32;
        id v34 = 0;
        char v35 = 1;
      }
      else
      {
LABEL_17:

LABEL_23:
        id v36 = [(id)SBApp windowSceneManager];
        id v37 = [v36 connectedWindowScenes];
        id v38 = [v37 allObjects];
        uint64_t v39 = objc_msgSend(v38, "bs_mapNoNulls:", &__block_literal_global_1256);

        unint64_t v40 = NSString;
        id v41 = [v39 componentsJoinedByString:@"\n"];
        id v34 = [v40 stringWithFormat:@"Connected displays device names:\n\n%@\n\n", v41];

        char v35 = 0;
        id v33 = 0;
      }
      id v14 = v52;

      id v42 = v33;
      id v43 = v34;
      id v44 = v43;
      int v21 = v53;
      if (v35)
      {

        a7 = v51;
        uint64_t v10 = v49;
        self = v48;
        if (v42)
        {
          id v45 = [(id)SBApp windowSceneManager];
          id v46 = [v42 identity];
          int v19 = [v45 windowSceneForDisplayIdentity:v46];

          goto LABEL_28;
        }
LABEL_27:
        id v42 = [0 identity];
        int v19 = [(SBMainWorkspace *)self _targetWindowSceneForApplication:v14 preferringDisplay:v42 requireForeground:v10 options:v15];
LABEL_28:

        if (a7)
        {
          *a7 = [v19 _sbDisplayConfiguration];
        }
        goto LABEL_36;
      }
      if (v50)
      {
        FBSOpenApplicationErrorCreate();
        *id v50 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a8)
    {
      FBSOpenApplicationErrorCreate();
      int v19 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    }
    int v19 = 0;
LABEL_36:

    goto LABEL_37;
  }
  id v17 = +[SBContinuitySessionManager sharedInstance];
  int v18 = [v17 currentSession];
  int v19 = [v18 mainWindowScene];

  if (v19)
  {
    if (a7)
    {
      *a7 = [v19 _sbDisplayConfiguration];
    }
    id v20 = v19;
  }
  else if (a8)
  {
    FBSOpenApplicationErrorCreate();
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_37:
  return v19;
}

- (id)_targetWindowSceneForApplication:(id)a3 preferringDisplay:(id)a4 requireForeground:(BOOL)a5 options:(id)a6
{
  BOOL v7 = a5;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!v10)
  {
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v14 = +[SBMainSwitcherControllerCoordinator sharedInstanceIfExists];
    id v15 = (void *)v14;
    if (v14)
    {
      BOOL v45 = v7;
      id v41 = self;
      id v42 = (void *)v14;
      int v48 = objc_msgSend(v11, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FB3508], objc_opt_class());
      if (!v48)
      {
        id v16 = objc_msgSend(v11, "bs_safeURLForKey:", *MEMORY[0x1E4F62678]);
        int v48 = [v16 absoluteString];
      }
      id v43 = v11;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v17 = [(id)SBApp windowSceneManager];
      int v18 = [v17 connectedWindowScenes];

      id obj = v18;
      uint64_t v50 = [v18 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v50)
      {
        uint64_t v47 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v54 != v47) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            int v21 = [v20 sceneManager];
            id v22 = [v20 _fbsDisplayIdentity];
            int v23 = [v21 sceneIdentityForApplication:v49 targetContentIdentifier:v48 allowCanMatches:1 preferNewScene:0 allowSceneCreation:0 visibleIdentifiers:0 preferredDisplay:v22];

            if (v23)
            {
              uint64_t v24 = [v21 existingSceneHandleForSceneIdentity:v23];
              uint64_t v25 = [v24 contentState];
              uint64_t v26 = [v24 sceneIfExists];
              uint64_t v27 = [v26 settings];
              uint64_t v28 = objc_msgSend(v27, "sb_displayIdentityForSceneManagers");
              char v29 = [v21 displayIdentity];
              int v30 = [v28 isEqual:v29];

              if (v24)
              {
                if (v45)
                {
                  if (v25) {
                    char v31 = v30;
                  }
                  else {
                    char v31 = 0;
                  }
                  if ((v31 & 1) == 0) {
                    goto LABEL_21;
                  }
LABEL_20:
                  [v44 addObject:v24];
                }
                else if (v30)
                {
                  goto LABEL_20;
                }
              }
LABEL_21:
            }
          }
          uint64_t v50 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v50);
      }

      id v11 = v43;
      id v10 = 0;
      self = v41;
      id v15 = v42;
    }
    id v32 = [(SBKeyboardFocusControlling *)self->_keyboardFocusCoordinator externalSceneWithFocus];
    id v33 = [(SBMainWorkspace *)self _sceneComparatorForApplication:v49 keyboardFocusScene:v32];
    id v34 = [v44 firstObject];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __96__SBMainWorkspace__targetWindowSceneForApplication_preferringDisplay_requireForeground_options___block_invoke;
    v51[3] = &unk_1E6AF5D10;
    id v35 = v33;
    id v52 = v35;
    id v36 = objc_msgSend(v44, "bs_reduce:block:", v34, v51);

    id v37 = [(id)SBApp windowSceneManager];
    id v38 = v37;
    if (v36)
    {
      uint64_t v39 = [v36 displayIdentity];
      id v13 = [v38 windowSceneForDisplayIdentity:v39];
    }
    else
    {
      id v13 = [v37 activeDisplayWindowScene];
    }

    goto LABEL_29;
  }
  id v12 = [(id)SBApp windowSceneManager];
  id v13 = [v12 windowSceneForDisplayIdentity:v10];

LABEL_29:
  return v13;
}

- (id)_sceneComparatorForApplication:(id)a3 keyboardFocusScene:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__SBMainWorkspace__sceneComparatorForApplication_keyboardFocusScene___block_invoke;
  v11[3] = &unk_1E6AF5CE8;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  char v9 = (void *)MEMORY[0x1D948C7A0](v11);

  return v9;
}

- (void)processManager:(id)a3 didAddProcess:(id)a4
{
  id v5 = a4;
  if ([v5 isApplicationProcess] && (objc_msgSend(v5, "isCurrentProcess") & 1) == 0) {
    [v5 addObserver:self];
  }
}

- (void)applicationProcessWillLaunch:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SBMainWorkspace_applicationProcessWillLaunch___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)applicationProcessDidLaunch:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SBMainWorkspace_applicationProcessDidLaunch___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__SBMainWorkspace__determineSourceForTransitionRequest___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v8 = a2;
  if ([v8 BOOLForActivationSetting:40])
  {
    uint64_t v5 = 7;
LABEL_34:
    id v6 = v8;
LABEL_35:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
    goto LABEL_36;
  }
  if ([v8 BOOLForActivationSetting:41])
  {
    uint64_t v5 = 10;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:47]) {
    goto LABEL_6;
  }
  if ([v8 BOOLForActivationSetting:54])
  {
    uint64_t v5 = 19;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:42])
  {
    uint64_t v5 = 6;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:43])
  {
    uint64_t v5 = 4;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:44])
  {
    uint64_t v5 = 8;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:45])
  {
    uint64_t v5 = 5;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:39])
  {
    uint64_t v5 = 1;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:48])
  {
    uint64_t v5 = 15;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:49])
  {
    uint64_t v5 = 16;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:47])
  {
LABEL_6:
    uint64_t v5 = 2;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:59])
  {
    uint64_t v5 = 47;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:57])
  {
    uint64_t v5 = 53;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:63])
  {
    uint64_t v5 = 61;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:64])
  {
    uint64_t v5 = 67;
    goto LABEL_34;
  }
  if ([v8 BOOLForActivationSetting:65])
  {
    uint64_t v5 = 70;
    goto LABEL_34;
  }
  int v7 = [v8 BOOLForActivationSetting:50];
  id v6 = v8;
  if (v7)
  {
    uint64_t v5 = 13;
    goto LABEL_35;
  }
LABEL_36:
  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 0;
}

id __96__SBMainWorkspace__targetWindowSceneForApplication_preferringDisplay_requireForeground_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  id v8 = v6;
  if (v7 == -1) {
    goto LABEL_4;
  }
  if (v7 == 1)
  {
    id v8 = v5;
LABEL_4:
    id v9 = v8;
    goto LABEL_6;
  }
  id v9 = 0;
LABEL_6:

  return v9;
}

uint64_t __69__SBMainWorkspace__sceneComparatorForApplication_keyboardFocusScene___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 application];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if [v5 isEqual:v6] && (v8)
  {
    uint64_t v9 = 1;
  }
  else
  {
    id v10 = [v6 application];
    uint64_t v11 = [v10 isEqual:*(void *)(a1 + 32)];

    if ((v8 & v11) == 1)
    {
      uint64_t v12 = [v5 contentState];
      uint64_t v13 = [v6 contentState];
      if (v12 && v13)
      {
        uint64_t v14 = *(void **)(a1 + 40);
        if (v14)
        {
          id v15 = [v14 settings];
          id v16 = [v15 displayIdentity];

          id v17 = [v5 displayIdentity];
          unsigned int v18 = [v17 isEqual:v16];
          int v19 = [v6 displayIdentity];
          int v20 = [v19 isEqual:v16];
          if (v18 && v20)
          {
            int v21 = *(void **)(a1 + 40);
            id v22 = [v6 sceneIfExists];
            LOBYTE(v21) = [v21 isEqual:v22];

            if (v21)
            {
              uint64_t v9 = -1;
            }
            else
            {
              uint64_t v24 = *(void **)(a1 + 40);
              uint64_t v25 = [v5 sceneIfExists];
              LODWORD(v9) = [v24 isEqual:v25];

              uint64_t v9 = v9;
            }
          }
          else if (v20)
          {
            uint64_t v9 = -1;
          }
          else
          {
            uint64_t v9 = v18;
          }
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        if (v12) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = -1;
        }
        if (!(v12 | v13))
        {
          int v23 = [v5 sceneIfExists];
          if (v23) {
            uint64_t v9 = 1;
          }
          else {
            uint64_t v9 = -1;
          }
        }
      }
    }
    else if (v8)
    {
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v9 = v11 << 63 >> 63;
    }
  }

  return v9;
}

- (void)process:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SBMainWorkspace_process_stateDidChangeFromState_toState___block_invoke;
  block[3] = &unk_1E6AF4E00;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

+ (id)start
{
  id v3 = SBLogWorkspace();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "[SBWorkspace] start", v6, 2u);
  }

  id v4 = [a1 _sharedInstanceWithNilCheckPolicy:2];
  [v4 _resume];
  return v4;
}

- (SBMainWorkspace)init
{
  id v3 = [MEMORY[0x1E4F624E0] sharedInstance];
  v32.receiver = self;
  v32.super_class = (Class)SBMainWorkspace;
  id v4 = [(SBWorkspace *)&v32 initWithEventQueue:v3];

  if (v4)
  {
    id v5 = [[SBIdleTimerCoordinatorHelper alloc] initWithSourceProvider:v4];
    idleTimerCoordinatorHelper = v4->_idleTimerCoordinatorHelper;
    v4->_idleTimerCoordinatorHelper = v5;

    id v7 = [MEMORY[0x1E4F5AD08] sharedInstance];
    [v7 registerEndpoint:v4];

    id v8 = objc_alloc_init(SBOrientationAggdLogger);
    orientationAggdLogger = v4->_orientationAggdLogger;
    v4->_orientationAggdLogger = v8;

    id v10 = [SBTransientOverlayPresentationManager alloc];
    uint64_t v11 = [(id)SBApp windowSceneManager];
    id v12 = +[SBAlertItemsController sharedInstance];
    uint64_t v13 = +[SBLockStateAggregator sharedInstance];
    id v14 = +[SBReachabilityManager sharedInstance];
    uint64_t v15 = [(SBTransientOverlayPresentationManager *)v10 initWithWindowSceneManager:v11 alertItemsController:v12 lockStateAggregator:v13 reachabilityManager:v14];
    transientOverlayPresentationManager = v4->_transientOverlayPresentationManager;
    v4->_transientOverlayPresentationManager = (SBTransientOverlayPresentationManager *)v15;

    id v17 = v4->_transientOverlayPresentationManager;
    unsigned int v18 = [(id)SBApp bannerManager];
    [(SBTransientOverlayPresentationManager *)v17 setBannerManager:v18];

    [(SBTransientOverlayPresentationManager *)v4->_transientOverlayPresentationManager setPresenterDelegate:v4];
    [(SBTransientOverlayPresentationManager *)v4->_transientOverlayPresentationManager setIdleTimerCoordinator:v4];
    BOOL v19 = +[SBInCallPresentationManager isSpecializedAPISupported];
    if (v19) {
      int v20 = 0;
    }
    else {
      int v20 = objc_alloc_init(SBInCallTransientOverlayManager);
    }
    objc_storeStrong((id *)&v4->_inCallTransientOverlayManager, v20);
    if (!v19) {

    }
    uint64_t v21 = +[SBKeyboardFocusCoordinator sharedInstance];
    keyboardFocusCoordinator = v4->_keyboardFocusCoordinator;
    v4->_keyboardFocusCoordinator = (SBKeyboardFocusControlling *)v21;

    int v23 = [SBUniversalControlServer alloc];
    uint64_t v24 = v4->_keyboardFocusCoordinator;
    uint64_t v25 = +[SBKeyboardSuppressionManager sharedInstance];
    uint64_t v26 = [(SBUniversalControlServer *)v23 initWithKeyboardFocusController:v24 keyboardSuppressionManager:v25];
    universalControlServer = v4->_universalControlServer;
    v4->_universalControlServer = (SBUniversalControlServer *)v26;

    [(SBMainWorkspace *)v4 _updateMedusaCapabilitySendingNotification:0];
    uint64_t v28 = [MEMORY[0x1E4F74230] sharedConnection];
    [v28 registerObserver:v4];
    char v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v4 selector:sel__coversheetDidPresent name:@"SBCoverSheetDidPresentNotification" object:0];
    [v29 addObserver:v4 selector:sel__coversheetDidDismiss name:@"SBCoverSheetDidDismissNotification" object:0];
    [v29 addObserver:v4 selector:sel__handleKeyShortcutHUDVisibilityDidPresent_ name:*MEMORY[0x1E4F43A90] object:0];
    [v29 addObserver:v4 selector:sel__handleKeyShortcutHUDVisibilityDidDismiss name:*MEMORY[0x1E4F43A88] object:0];
    [(SBMainWorkspace *)v4 _suspend];
    int v30 = [MEMORY[0x1E4FA99A0] monitorUsingMainQueue];
    [v30 addObserver:v4];

    [(SBMainWorkspace *)v4 _initializeAndObserveDefaults];
    [(SBMainWorkspace *)v4 _addStateCaptureHandlers];
  }
  return v4;
}

- (SBMainWorkspace)initWithEventQueue:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBWorkspace.m" lineNumber:1803 description:@"just don't call this"];

  return [(SBMainWorkspace *)self init];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4F624C8] sharedInstance];
  [v4 setDelegate:0];

  id v5 = [MEMORY[0x1E4F62448] sharedInstance];
  [v5 removeObserver:self];

  id v6 = [MEMORY[0x1E4F74230] sharedConnection];
  [v6 unregisterObserver:self];

  [(SBPowerDownViewController *)self->_powerDownViewController setDelegate:0];
  if (self->_powerDownLongPressDurationAssertion)
  {
    id v7 = [(id)SBApp homeHardwareButton];
    [v7 removeLongPressDurationAssertion:self->_powerDownLongPressDurationAssertion];
  }
  [(BSEventQueueLock *)self->_currentTransactionLock relinquish];
  [(SBWindowSceneStatusBarSettingsAssertion *)self->_statusBarAssertion invalidate];
  v8.receiver = self;
  v8.super_class = (Class)SBMainWorkspace;
  [(SBMainWorkspace *)&v8 dealloc];
}

+ (id)debugDescription
{
  uint64_t v2 = [a1 sharedInstance];
  id v3 = [v2 debugDescription];

  return v3;
}

- (NSString)debugDescription
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 setUseDebugDescription:1];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __35__SBMainWorkspace_debugDescription__block_invoke;
  id v10 = &unk_1E6AF5290;
  id v11 = v3;
  id v12 = self;
  id v4 = v3;
  [v4 appendBodySectionWithName:0 multilinePrefix:0 block:&v7];
  id v5 = objc_msgSend(v4, "build", v7, v8, v9, v10);

  return (NSString *)v5;
}

void __35__SBMainWorkspace_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F62490] sharedInstance];
  id v4 = (id)[v2 appendObject:v3 withName:@"sceneManager"];

  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 224) withName:@"transientOverlayPresentationManager"];
  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"currentTransaction"];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) eventQueue];
  id v9 = (id)[v7 appendObject:v8 withName:@"eventQueue"];

  id v10 = *(void **)(a1 + 32);
  id v12 = +[SBDaemonHandler stateDescription];
  id v11 = (id)[v10 appendObject:v12 withName:@"daemonHandlers"];
}

- (void)_addStateCaptureHandlers
{
  uint64_t v2 = (void *)MEMORY[0x1E4F14428];
  id v3 = (id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();
  id v4 = (id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();

  id v5 = (id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();
  id v6 = (id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();
}

uint64_t __43__SBMainWorkspace__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) description];
}

__CFString *__43__SBMainWorkspace__addStateCaptureHandlers__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    id v3 = [v2 debugDescription];
    if (([(id)SBApp _isRemoteStateDumpEnabled] & 1) != 0
      || BSLogStateCaptureCheckPlistSizeIsPermitted())
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [*(id *)(*(void *)(a1 + 32) + 64) description];
    }
    id v5 = v4;
  }
  else
  {
    id v5 = @"None";
  }
  return v5;
}

id __43__SBMainWorkspace__addStateCaptureHandlers__block_invoke_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) eventQueue];
  uint64_t v2 = [v1 description];

  return v2;
}

id __43__SBMainWorkspace__addStateCaptureHandlers__block_invoke_4()
{
  return +[SBDaemonHandler stateDescription];
}

- (id)createRequestWithOptions:(unint64_t)a3
{
  return [(SBMainWorkspace *)self createRequestWithOptions:a3 displayConfiguration:0];
}

- (id)createRequestForApplicationActivation:(id)a3 options:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBMainWorkspace;
  id v4 = [(SBWorkspace *)&v6 createRequestForApplicationActivation:a3 options:a4];
  return v4;
}

- (BOOL)requestTransitionWithBuilder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainWorkspace;
  return [(SBWorkspace *)&v4 requestTransitionWithBuilder:a3];
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 builder:(id)a4 validator:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)SBMainWorkspace;
  return [(SBWorkspace *)&v6 requestTransitionWithOptions:a3 builder:a4 validator:a5];
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)SBMainWorkspace;
  return [(SBWorkspace *)&v6 requestTransitionWithOptions:a3 displayConfiguration:a4 builder:a5];
}

- (BOOL)executeTransitionRequest:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainWorkspace;
  return [(SBWorkspace *)&v4 executeTransitionRequest:a3];
}

- (BOOL)canExecuteTransitionRequest:(id)a3
{
  return [(SBMainWorkspace *)self _canExecuteTransitionRequest:a3 forExecution:0];
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper targetCoordinator];
}

- (void)setIdleTimerCoordinator:(id)a3
{
}

- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    char v11 = [v9 animatePresentation];
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke;
    v16[3] = &unk_1E6AF5A28;
    objc_copyWeak(&v21, &location);
    id v17 = v8;
    id v18 = v9;
    BOOL v19 = self;
    char v22 = v11;
    id v20 = v10;
    id v12 = (void *)MEMORY[0x1D948C7A0](v16);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke_3;
    v14[3] = &unk_1E6AF5A50;
    id v13 = v12;
    id v15 = v13;
    [(SBMainWorkspace *)self _dismissPresentedControlCenterModule:v14];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [(SBMainWorkspace *)self _dismissPresentedControlCenterModule:0];
  }
}

void __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = [[SBControlCenterModuleTransientOverlayViewController alloc] initWithModuleIdentifier:*(void *)(a1 + 32) presentationOptions:*(void *)(a1 + 40)];
    [(SBControlCenterModuleTransientOverlayViewController *)v3 setDelegate:*(void *)(a1 + 48)];
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 136), v3);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke_2;
    v7[3] = &unk_1E6AF5A00;
    id v9 = *(id *)(a1 + 56);
    v7[4] = WeakRetained;
    id v5 = v3;
    id v8 = v5;
    if (([WeakRetained presentTransientOverlayViewController:v5 animated:v4 completion:v7] & 1) == 0)
    {
      uint64_t v6 = *(void *)(a1 + 56);
      if (v6) {
        (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
      }
    }
  }
}

void __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  id v3 = (void *)a1[5];
  uint64_t v4 = (id *)(a1[4] + 136);
  objc_storeStrong(v4, v3);
}

uint64_t __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_dismissPresentedControlCenterModule:(id)a3
{
  id v4 = a3;
  presentedControlCenterModuleTransientOverlayViewController = self->_presentedControlCenterModuleTransientOverlayViewController;
  if (presentedControlCenterModuleTransientOverlayViewController)
  {
    uint64_t v6 = [(SBControlCenterModuleTransientOverlayViewController *)presentedControlCenterModuleTransientOverlayViewController presentationOptions];
    uint64_t v7 = [v6 animateDismissal];

    id v8 = self->_presentedControlCenterModuleTransientOverlayViewController;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__SBMainWorkspace__dismissPresentedControlCenterModule___block_invoke;
    v9[3] = &unk_1E6AF5A78;
    v9[4] = self;
    id v10 = v4;
    [(SBMainWorkspace *)self dismissTransientOverlayViewController:v8 animated:v7 completion:v9];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __56__SBMainWorkspace__dismissPresentedControlCenterModule___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 136);
  *(void *)(v3 + 136) = 0;
}

- (void)controlCenterModuleTransientOverlayViewControllerNeedsDismissal:(id)a3
{
  id v7 = a3;
  id v4 = [v7 presentationOptions];
  if (v4)
  {
    id v5 = [v7 presentationOptions];
    uint64_t v6 = [v5 animatePresentation];
  }
  else
  {
    uint64_t v6 = 1;
  }

  [(SBMainWorkspace *)self dismissTransientOverlayViewController:v7 animated:v6 completion:0];
}

- (id)inCallPresentationManager:(id)a3 createPresentationSessionWithSceneHandle:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [SBInCallPresentationSession alloc];
  BOOL v19 = [(id)SBApp bannerManager];
  id v18 = +[SBLockScreenManager sharedInstance];
  id v20 = +[SBSceneManagerCoordinator sharedInstance];
  id v17 = [v20 sceneDeactivationManager];
  id v16 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  id v7 = +[SBBacklightController sharedInstance];
  id v8 = [(SBMainWorkspace *)self keyboardFocusController];
  uint64_t v9 = SBApp;
  id v10 = +[SBSetupManager sharedInstance];
  char v11 = +[SBUIController sharedInstance];
  pipCoordinator = self->_pipCoordinator;
  id v13 = [(id)SBApp lockOutController];
  id v15 = [(SBInCallPresentationSession *)v6 initWithSceneHandle:v5 workspace:self bannerManager:v19 lockScreenManager:v18 deactivationManager:v17 mainSwitcherCoordinator:v16 backlightController:v7 keyboardFocusController:v8 springBoard:v9 setupManager:v10 uiController:v11 pipCoordinator:pipCoordinator lockoutStateProvider:v13];

  return v15;
}

- (int64_t)inCallPresentationManager:(id)a3 interfaceOrientationForBannerPresentationInWindowScene:(id)a4
{
  id v4 = a4;
  if ([v4 isMainDisplayWindowScene]) {
    uint64_t v5 = [(id)SBApp activeInterfaceOrientation];
  }
  else {
    uint64_t v5 = [v4 interfaceOrientation];
  }
  int64_t v6 = v5;

  return v6;
}

- (int64_t)inCallPresentationManager:(id)a3 interfaceOrientationForTransientOverlayPresentationInWindowScene:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "transientOverlayPresenter", a3);
  int64_t v6 = [(SBMainWorkspace *)self defaultPreferredInterfaceOrientationForPresentationForTransientOverlayScenePresenter:v5];

  return v6;
}

- (void)inCallPresentationManagerRequestsHandlingOfDeferredUILock:(id)a3
{
}

- (void)_proposeIdleTimerBehaviorForReason:(id)a3
{
  id v7 = a3;
  id v4 = [(SBMainWorkspace *)self _activeIdleTimerProvider];
  [(SBMainWorkspace *)self _setActiveIdleTimerProvider:v4];
  uint64_t v5 = [(SBMainWorkspace *)self _generateIdleTimerBehaviorForReason:v7];
  id v6 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper proposeIdleTimerBehavior:v5 fromProvider:v4 reason:v7];
}

- (void)presentPowerDownTransientOverlay
{
  v14[3] = *MEMORY[0x1E4F143B8];
  if (!self->_powerDownViewController)
  {
    uint64_t v3 = [SBPowerDownViewController alloc];
    id v4 = [(id)SBApp windowSceneManager];
    uint64_t v5 = [(SBPowerDownViewController *)v3 initWithWindowSceneManager:v4];
    powerDownViewController = self->_powerDownViewController;
    self->_powerDownViewController = v5;

    [(SBPowerDownViewController *)self->_powerDownViewController setDelegate:self];
    id v7 = [[SBHomeHardwareButtonLongPressDurationAssertion alloc] initWithReason:@"SBPowerDownViewController" duration:5.0];
    powerDownLongPressDurationAssertion = self->_powerDownLongPressDurationAssertion;
    self->_powerDownLongPressDurationAssertion = v7;

    uint64_t v9 = [(id)SBApp homeHardwareButton];
    [v9 addLongPressDurationAssertion:self->_powerDownLongPressDurationAssertion];

    id v10 = [(id)SBApp authenticationController];
    LODWORD(v4) = [v10 hasPasscodeSet];

    if (v4)
    {
      v13[0] = @"SBUILockOptionsForceBioLockoutKey";
      v13[1] = @"SBUILockOptionsForceLockKey";
      v14[0] = MEMORY[0x1E4F1CC38];
      v14[1] = MEMORY[0x1E4F1CC38];
      v13[2] = @"SBUILockOptionsUseScreenOffModeKey";
      void v14[2] = MEMORY[0x1E4F1CC28];
      char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
      id v12 = +[SBLockScreenManager sharedInstance];
      [v12 lockUIFromSource:23 withOptions:v11];
    }
    [(SBMainWorkspace *)self presentTransientOverlayViewController:self->_powerDownViewController animated:1 completion:0];
  }
}

- (void)dismissPowerDownTransientOverlayWithCompletion:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    char v11 = [NSString stringWithUTF8String:"-[SBMainWorkspace dismissPowerDownTransientOverlayWithCompletion:]"];
    [v10 handleFailureInFunction:v11 file:@"SBWorkspace.m" lineNumber:2284 description:@"this call must be made on the main thread"];
  }
  if (self->_powerDownViewController)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __66__SBMainWorkspace_dismissPowerDownTransientOverlayWithCompletion___block_invoke;
    v14[3] = &unk_1E6AF5AA0;
    void v14[4] = self;
    id v15 = v4;
    uint64_t v5 = (void (**)(void, void))MEMORY[0x1D948C7A0](v14);
    id v6 = [(id)SBApp authenticationController];
    int v7 = [v6 hasPasscodeSet];

    if (v7)
    {
      v16[0] = @"SBUILockOptionsForceBioLockoutKey";
      v16[1] = @"SBUILockOptionsForceLockKey";
      v17[0] = MEMORY[0x1E4F1CC38];
      v17[1] = MEMORY[0x1E4F1CC38];
      v16[2] = @"SBUILockOptionsUseScreenOffModeKey";
      v17[2] = MEMORY[0x1E4F1CC28];
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
      uint64_t v9 = +[SBLockScreenManager sharedInstance];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __66__SBMainWorkspace_dismissPowerDownTransientOverlayWithCompletion___block_invoke_2;
      v12[3] = &unk_1E6AF5A50;
      id v13 = v5;
      [v9 lockUIFromSource:23 withOptions:v8 completion:v12];
    }
    else
    {
      v5[2](v5, 1);
    }
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __66__SBMainWorkspace_dismissPowerDownTransientOverlayWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dismissTransientOverlayViewController:*(void *)(*(void *)(a1 + 32) + 120) animated:a2 completion:*(void *)(a1 + 40)];
}

void __66__SBMainWorkspace_dismissPowerDownTransientOverlayWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v1 = +[SBLockScreenManager sharedInstance];
  [v1 setPasscodeVisible:1 animated:1];
}

- (BOOL)isPowerDownTransientOverlayTopmost
{
  return self->_powerDownViewController
      && -[SBTransientOverlayPresentationManager isTopmostPresentedViewController:](self->_transientOverlayPresentationManager, "isTopmostPresentedViewController:");
}

- (void)powerDownViewControllerRequestsPowerDown:(id)a3
{
  id v4 = [[SBShutdownContext alloc] initWithReason:@"Powerdown UI"];
  [(SBShutdownContext *)v4 setFromUserPowerDown:1];
  uint64_t v3 = [(id)SBApp restartManager];
  [v3 shutdownWithContext:v4];
}

- (void)powerDownViewControllerRequestsDismissal:(id)a3
{
}

- (void)powerDownViewControllerDidDisappear:(id)a3
{
  powerDownViewController = self->_powerDownViewController;
  self->_powerDownViewController = 0;

  uint64_t v5 = [(id)SBApp homeHardwareButton];
  [v5 removeLongPressDurationAssertion:self->_powerDownLongPressDurationAssertion];

  powerDownLongPressDurationAssertion = self->_powerDownLongPressDurationAssertion;
  self->_powerDownLongPressDurationAssertion = 0;
}

- (void)_broadcastCurrentTransaction
{
  if ([(id)SBApp _isRemoteStateDumpEnabled])
  {
    uint64_t v3 = [(SBWorkspaceTransaction *)self->_currentTransaction debugDescription];
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__SBMainWorkspace__broadcastCurrentTransaction__block_invoke;
    block[3] = &unk_1E6AF4AC0;
    id v7 = v3;
    id v5 = v3;
    dispatch_async(v4, block);
  }
}

void __47__SBMainWorkspace__broadcastCurrentTransaction__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)SBApp;
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = @"SpringBoard - CurrentTransaction";
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v1 _broadcastStateCaptureToConnectedRemotePeers:v3];
}

- (void)_initializeAndObserveDefaults
{
  uint64_t v2 = +[SBDefaults localDefaults];
  uint64_t v3 = [v2 soundDefaults];
  __playSoundOnWake = [v3 playSoundOnDeviceWake];
  id v4 = [NSString stringWithUTF8String:"playSoundOnDeviceWake"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke;
  v19[3] = &unk_1E6AF4AC0;
  id v20 = v3;
  id v5 = v3;
  id v6 = (void *)MEMORY[0x1E4F14428];
  id v7 = (id)[v5 observeDefault:v4 onQueue:MEMORY[0x1E4F14428] withBlock:v19];

  id v8 = [v2 powerDefaults];
  SBWorkspaceSetPreventIdleSleepForReason([v8 disableIdleSleep], @"SBPowerDefaults");
  uint64_t v9 = [NSString stringWithUTF8String:"disableIdleSleep"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke_2;
  v17[3] = &unk_1E6AF4AC0;
  id v10 = v8;
  id v18 = v10;
  id v11 = (id)[v10 observeDefault:v9 onQueue:v6 withBlock:v17];

  id v12 = [NSString stringWithUTF8String:"trackPowerEvents"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke_3;
  v15[3] = &unk_1E6AF4AC0;
  id v16 = v10;
  id v13 = v10;
  id v14 = (id)[v13 observeDefault:v12 onQueue:v6 withBlock:v15];
}

uint64_t __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) playSoundOnDeviceWake];
  __playSoundOnWake = result;
  return result;
}

void __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) disableIdleSleep];
  SBWorkspaceSetPreventIdleSleepForReason(v1, @"SBPowerDefaults");
}

void __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke_3(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) trackPowerEvents];
  _SBWorkspaceTrackPowerEvents(v1);
}

void __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_3(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F63B70] sharedInstance];
  uint64_t v2 = [*(id *)(a1 + 32) bundleIdentifier];
  [v3 gameDidLaunch:v2];
}

- (id)_alertItemForPreventingLaunchOfApp:(id)a3 fromTrustState:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  id v7 = 0;
  switch(a4)
  {
    case 2uLL:
      id v8 = SBAppDeniedAlertItem;
      goto LABEL_13;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      id v8 = SBAppProfileExpiredAlertItem;
      goto LABEL_13;
    case 6uLL:
      id v8 = SBAppProfileNeedsValidationAlertItem;
      goto LABEL_13;
    case 7uLL:
      uint64_t v9 = [v5 info];
      if ([v9 isUPPProvisioningProfileValidated])
      {
      }
      else
      {
        id v15 = [v6 info];
        int v16 = [v15 isFreeDeveloperProvisioningProfileValidated];

        if (v16)
        {
          id v8 = SBAppFreeDevProfileNotTrustedAlertItem;
          goto LABEL_13;
        }
      }
      id v8 = SBAppProfileNotTrustedAlertItem;
LABEL_13:
      id v14 = (SBAppDeveloperModeRequiredAlertItem *)[[v8 alloc] initWithApp:v6];
LABEL_14:
      id v7 = v14;
LABEL_15:

      return v7;
    case 9uLL:
      id v10 = objc_alloc(MEMORY[0x1E4F223C8]);
      id v11 = [v6 bundleIdentifier];
      id v12 = (void *)[v10 initWithBundleIdentifier:v11 allowPlaceholder:0 error:0];

      if (v12) {
        BOOL v13 = [v12 updateAvailability] == 1;
      }
      else {
        BOOL v13 = 0;
      }
      id v18 = [v6 info];
      int v19 = [v18 isProvisioningProfileValidated];

      id v20 = [MEMORY[0x1E4F74230] sharedConnection];
      int v21 = [v20 isOnDeviceAppInstallationAllowed];

      char v22 = [v6 info];
      int v23 = [v22 isLicensedToDevice];

      uint64_t v24 = SBLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v26[0] = 67109888;
        v26[1] = v13;
        __int16 v27 = 1024;
        int v28 = v19 ^ 1;
        __int16 v29 = 1024;
        int v30 = v21;
        __int16 v31 = 1024;
        int v32 = v23;
        _os_log_debug_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEBUG, "Signature error: hasUpdateAvailable: %d, isAppStoreApp: %d, isAppInstallationAllowed: %d, isAppLicensedToDevice: %d", (uint8_t *)v26, 0x1Au);
      }

      if (v19 | v23 | !v13 | v21 ^ 1) {
        uint64_t v25 = off_1E6AED070;
      }
      else {
        uint64_t v25 = off_1E6AED068;
      }
      id v7 = (SBAppDeveloperModeRequiredAlertItem *)[objc_alloc(*v25) initWithApplication:v6];

      goto LABEL_15;
    case 0xAuLL:
      id v14 = [[SBAppDeveloperModeRequiredAlertItem alloc] initWithApplication:v5];
      goto LABEL_14;
    default:
      goto LABEL_15;
  }
}

void __60__SBMainWorkspace__preflightTransitionRequest_forExecution___block_invoke(uint64_t a1)
{
  id v2 = +[SBAlertItemsController sharedInstance];
  [v2 activateAlertItem:*(void *)(a1 + 32)];
}

void __60__SBMainWorkspace__preflightTransitionRequest_forExecution___block_invoke_376(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  BSDispatchMain();
}

uint64_t __60__SBMainWorkspace__preflightTransitionRequest_forExecution___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupAppRepairRequest:*(void *)(a1 + 40)];
}

- (BOOL)_executeTransientOverlayTransitionRequest:(id)a3
{
  id v5 = a3;
  id v6 = [(SBWorkspace *)self eventQueue];
  id v7 = [v6 executingEvent];

  if (!v7)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBWorkspace.m" lineNumber:2843 description:@"must only be called when running on the event queue"];
  }
  id v8 = [v5 transientOverlayContext];
  uint64_t v9 = [v5 applicationContext];
  if ([v8 shouldPreserveAppSwitcher])
  {
    id v10 = [(id)SBApp windowSceneManager];
    id v11 = [v5 displayIdentity];
    id v12 = [v10 windowSceneForDisplayIdentity:v11];
    BOOL v13 = [v12 switcherController];

    if (!v13)
    {
      id v14 = SBLogCommon();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

      if (v15) {
        NSLog(&cfstr_ExpectedASwitc.isa);
      }
    }
    if ([v13 unlockedEnvironmentMode] == 2) {
      [v9 setRequestedUnlockedEnvironmentMode:2];
    }
  }
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __61__SBMainWorkspace__executeTransientOverlayTransitionRequest___block_invoke;
  v19[3] = &unk_1E6AF5BB8;
  objc_copyWeak(&v20, &location);
  BOOL v16 = [(SBMainWorkspace *)self _setCurrentTransactionForRequest:v5 fallbackProvider:v19];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v16;
}

id __61__SBMainWorkspace__executeTransientOverlayTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _selectTransactionForTransientOverlayPresentationRequest:v3];

  return v5;
}

- (id)_selectTransactionForTransientOverlayPresentationRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 transientOverlayContext];
  uint64_t v5 = [v4 transitionType];
  id v6 = off_1E6AF1080;
  if (v5) {
    id v6 = off_1E6AF1068;
  }
  id v7 = (void *)[objc_alloc(*v6) initWithTransitionRequest:v3];

  return v7;
}

- (id)_selectTransactionForReturningToTheLockScreenAndForceToBuddy:(BOOL)a3
{
  uint64_t v5 = [(SBMainWorkspace *)self createRequestWithOptions:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__SBMainWorkspace__selectTransactionForReturningToTheLockScreenAndForceToBuddy___block_invoke;
  v8[3] = &unk_1E6AF5C08;
  BOOL v9 = a3;
  v8[4] = self;
  [v5 modifyApplicationContext:v8];
  id v6 = [(SBMainWorkspace *)self _selectTransactionForReturningToTheLockScreenWithRequest:v5];

  return v6;
}

void __80__SBMainWorkspace__selectTransactionForReturningToTheLockScreenAndForceToBuddy___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 setAnimationDisabled:1];
  id v3 = +[SBSetupManager sharedInstance];
  if ([v3 isInSetupMode] && (objc_msgSend(v3, "updateInSetupMode") & 1) != 0
    || *(unsigned char *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) _applicationForIdentifier:@"com.apple.purplebuddy"];
    uint64_t v5 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v4];
    [v6 setEntity:v5 forLayoutRole:1];
  }
  else
  {
    id v4 = +[SBWorkspaceEntity entity];
    [v6 setActivatingEntity:v4];
  }
}

- (id)_selectTransactionForReturningToTheLockScreenWithRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBWorkspace.m", 3004, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  id v6 = +[SBLockScreenManager sharedInstance];
  id v7 = [v6 lockScreenEnvironment];
  id v8 = [[SBReturnToLockscreenWorkspaceTransaction alloc] initWithTransitionRequest:v5 toLockScreenEnvironment:v7];

  return v8;
}

- (id)_selectTransactionForAppActivationUnderMainScreenLock:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBMainWorkspace *)self createRequestWithOptions:0];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  BOOL v15 = __84__SBMainWorkspace__selectTransactionForAppActivationUnderMainScreenLock_withResult___block_invoke;
  BOOL v16 = &unk_1E6AF5C30;
  id v17 = v6;
  id v18 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 modifyApplicationContext:&v13];
  id v11 = -[SBMainWorkspace _selectTransactionForAppActivationUnderMainScreenLockRequest:](self, "_selectTransactionForAppActivationUnderMainScreenLockRequest:", v8, v13, v14, v15, v16);

  return v11;
}

void __84__SBMainWorkspace__selectTransactionForAppActivationUnderMainScreenLock_withResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    [a2 setActivatingEntity:v3];
  }
  else
  {
    id v4 = a2;
    id v5 = +[SBWorkspaceEntity entity];
    [v4 setActivatingEntity:v5];
  }
  [a2 setResultBlock:*(void *)(a1 + 40)];
}

- (id)_selectTransactionForAppActivationUnderMainScreenLockRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBWorkspace.m", 3025, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  id v6 = [SBActivateAppUnderLockScreenWorkspaceTransaction alloc];
  id v7 = +[SBLockScreenManager sharedInstance];
  id v8 = [v7 lockScreenEnvironment];
  id v9 = [(SBActivateAppUnderLockScreenWorkspaceTransaction *)v6 initWithTransitionRequest:v5 lockScreenEnvironment:v8];

  id v10 = [(SBWorkspaceTransaction *)v9 transitionRequest];

  return v9;
}

- (id)_selectTransactionForAppRelaunch:(id)a3
{
  id v4 = a3;
  id v5 = [(id)SBApp windowSceneManager];
  id v6 = [v4 sceneHandle];
  id v7 = [v6 displayIdentity];
  id v8 = [v5 windowSceneForDisplayIdentity:v7];

  id v9 = [v8 uiLockStateProvider];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[SBLockScreenManager sharedInstance];
  }
  id v12 = v11;

  if ([v12 isUILocked] && (objc_msgSend(v4, "BOOLForActivationSetting:", 3) & 1) == 0)
  {
    uint64_t v14 = [(SBMainWorkspace *)self _selectTransactionForAppActivationUnderMainScreenLock:v4 withResult:0];
  }
  else
  {
    uint64_t v13 = [(SBMainWorkspace *)self createRequestForApplicationActivation:v4 options:4];
    uint64_t v14 = [(SBMainWorkspace *)self _selectTransactionForAppActivationRequest:v13];
  }
  return v14;
}

- (id)_selectTransactionForAppEntityRemoved:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sceneHandle];
  id v6 = [v5 sceneIfExists];
  id v7 = [v6 settings];
  id v8 = objc_msgSend(v7, "sb_displayIdentityForSceneManagers");

  id v9 = [(id)SBApp windowSceneManager];
  id v10 = [v9 windowSceneForDisplayIdentity:v8];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v9 embeddedDisplayWindowScene];
  }
  uint64_t v13 = v12;

  uint64_t v14 = [(id)SBApp lockOutController];
  BOOL v15 = [v13 authenticationStatusProvider];
  BOOL v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [(id)SBApp authenticationController];
  }
  id v18 = v17;

  if (([v14 isBlocked] & 1) != 0 || (objc_msgSend(v18, "isAuthenticated") & 1) == 0)
  {
    uint64_t v25 = [(SBMainWorkspace *)self _selectTransactionForReturningToTheLockScreenAndForceToBuddy:0];
  }
  else
  {
    int v19 = objc_alloc_init(SBMainWorkspaceLayoutStateContingencyPlan);
    id v20 = [v13 switcherController];
    int v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    int v28 = v19;
    char v22 = [(SBMainWorkspaceLayoutStateContingencyPlan *)v19 transitionContextForLayoutContext:v20 failedEntities:v21];

    if (v22)
    {
      [v22 setAnimationDisabled:1];
      int v23 = [v13 _fbsDisplayConfiguration];
      uint64_t v24 = [(SBMainWorkspace *)self createRequestWithOptions:0 displayConfiguration:v23];

      [v24 setApplicationContext:v22];
      uint64_t v25 = [(SBToAppsWorkspaceTransaction *)[SBAppExitedWorkspaceTransaction alloc] initWithTransitionRequest:v24];
      uint64_t v26 = [(SBWorkspaceTransaction *)v25 transitionRequest];
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  return v25;
}

void __61__SBMainWorkspace__selectTransactionForAppActivationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:1];
  [v3 setScenePresenter:*(void *)(a1 + 32)];
  [v3 setAnimated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_updateMedusaCapabilitySendingNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[SBPlatformController sharedInstance];
  int v6 = [v5 isMedusaCapable];

  if (self->_medusaCapable != v6)
  {
    self->_medusaCapable = v6;
    if (v3)
    {
      id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 postNotificationName:@"SBWorkspaceMedusaCapabilityChangedNotification" object:0];
    }
  }
}

- (void)_suspend
{
  if (!self->_suspensionLock)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4F750]);
    id v6 = [(SBWorkspace *)self eventQueue];
    id v4 = (BSEventQueueLock *)[v3 initWithEventQueue:v6 reason:@"SBWorkspaceSuspended"];
    suspensionLock = self->_suspensionLock;
    self->_suspensionLock = v4;
  }
}

- (void)_resume
{
  suspensionLock = self->_suspensionLock;
  if (suspensionLock)
  {
    id v4 = suspensionLock;
    id v5 = self->_suspensionLock;
    self->_suspensionLock = 0;

    if (!self->_initialized)
    {
      id v6 = [(SBWorkspace *)self eventQueue];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __26__SBMainWorkspace__resume__block_invoke;
      v8[3] = &unk_1E6AF4AC0;
      v8[4] = self;
      id v7 = [MEMORY[0x1E4F4F748] eventWithName:@"SBWorkspaceFinishInitialization" handler:v8];
      [v6 executeOrInsertEvent:v7 atPosition:0];
    }
    [(BSEventQueueLock *)v4 relinquish];
  }
}

uint64_t __26__SBMainWorkspace__resume__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishInitialization];
}

- (void)_finishInitialization
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!self->_initialized)
  {
    self->_initialized = 1;
    id v3 = [MEMORY[0x1E4F624C8] sharedInstance];
    [v3 setDelegate:self];

    id v4 = +[SBBacklightController sharedInstance];
    [v4 addObserver:self];

    id v5 = +[SBApplicationController sharedInstanceIfExists];
    id v6 = [MEMORY[0x1E4F62448] sharedInstance];
    [v6 addObserver:self];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v7 = objc_msgSend(v6, "allProcesses", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          [(SBMainWorkspace *)self processManager:v6 didAddProcess:v12];
          if ([v12 isApplicationProcess] && objc_msgSend(v12, "isRunning"))
          {
            uint64_t v13 = [v12 bundleIdentifier];
            uint64_t v14 = [v5 applicationWithBundleIdentifier:v13];

            [v14 _processWillLaunch:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v9);
    }

    BOOL v15 = [SBInCallPresentationManager alloc];
    BOOL v16 = [(id)SBApp windowSceneManager];
    id v17 = +[SBApplicationController sharedInstance];
    id v18 = [(id)SBApp bannerManager];
    int v19 = [(SBInCallPresentationManager *)v15 initWithWindowSceneManager:v16 applicationController:v17 bannerManager:v18];
    inCallPresentationManager = self->_inCallPresentationManager;
    self->_inCallPresentationManager = v19;

    [(SBInCallPresentationManager *)self->_inCallPresentationManager setDelegate:self];
    int v21 = objc_alloc_init(SBFocusModesHomeScreenSettingsManager);
    focusModesHomeScreenSnapshotManager = self->_focusModesHomeScreenSnapshotManager;
    self->_focusModesHomeScreenSnapshotManager = v21;

    int v23 = objc_alloc_init(SBHomeScreenConfigurationManager);
    homeScreenConfigurationManager = self->_homeScreenConfigurationManager;
    self->_homeScreenConfigurationManager = v23;

    transientOverlayPresentationManager = self->_transientOverlayPresentationManager;
    uint64_t v26 = +[SBCoverSheetPresentationManager sharedInstance];
    [(SBTransientOverlayPresentationManager *)transientOverlayPresentationManager setCoverSheetPresentationManager:v26];

    Class v27 = NSClassFromString(&cfstr_Uikeyboardarbi.isa);
    if (objc_opt_respondsToSelector())
    {
      int v28 = [(objc_class *)v27 performSelector:sel_sharedArbiterManager];
    }
    else
    {
      int v28 = 0;
    }
    __int16 v29 = [SBKeyboardDismissalManager alloc];
    int v30 = [MEMORY[0x1E4F4F3D8] sharedInstance];
    __int16 v31 = +[SBSystemGestureManager mainDisplayManager];
    int v32 = [(SBMainWorkspace *)self keyboardFocusController];
    uint64_t v33 = [(SBKeyboardDismissalManager *)v29 initWithTouchDeliveryService:v30 systemGestureManager:v31 keyboardArbiterManager:v28 focusController:v32];
    keyboardDismissalManager = self->_keyboardDismissalManager;
    self->_keyboardDismissalManager = v33;

    id v35 = +[SBKeyboardFocusCoordinator sharedInstance];
    id v36 = +[SBKeyboardFocusArbitrationReason workspaceDidFinishInitialization];
    [v35 requestArbitrationForSBWindowScene:0 forReason:v36];
  }
}

- (void)setPipCoordinator:(id)a3
{
  id v32 = a3;
  p_pipCoordinator = &self->_pipCoordinator;
  if (self->_pipCoordinator)
  {
    int v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SBWorkspace.m" lineNumber:3184 description:@"PIP Coordinator must be configured exactly once"];
  }
  objc_storeStrong((id *)&self->_pipCoordinator, a3);
  if (+[SBPIPPegasusAdapter isSupported])
  {
    id v7 = objc_alloc_init(SBPIPPegasusAdapter);
    uint64_t v8 = [SBPIPController alloc];
    double v9 = *MEMORY[0x1E4F43F20] + 5.0 + 25.0;
    uint64_t v10 = +[SBPIPSettingsDomain rootSettings];
    id v11 = [v10 interactionSettings];
    id v12 = [(SBPIPController *)v8 initWithIdleTimerCoordinator:self windowLevel:v11 interactionSettings:v7 adapter:v9];

    [(SBPIPControllerCoordinator *)*p_pipCoordinator registerController:v12 forType:0];
  }
  Class v13 = NSClassFromString(&cfstr_Uikeyboardarbi.isa);
  if (objc_opt_respondsToSelector())
  {
    __int16 v31 = [(objc_class *)v13 performSelector:sel_sharedArbiterManager];
  }
  else
  {
    __int16 v31 = 0;
  }
  __int16 v29 = [SBSystemNotesManager alloc];
  uint64_t v14 = *p_pipCoordinator;
  int v28 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  Class v27 = [MEMORY[0x1E4F62490] sharedInstance];
  int v30 = +[SBSceneManagerCoordinator sharedInstance];
  uint64_t v26 = [v30 sceneDeactivationManager];
  uint64_t v25 = +[SBKeyboardSuppressionManager sharedInstance];
  keyboardDismissalManager = self->_keyboardDismissalManager;
  uint64_t v24 = +[SBApplicationController sharedInstance];
  BOOL v16 = +[SBSystemGestureManager mainDisplayManager];
  id v17 = [(id)SBApp windowSceneManager];
  id v18 = [v17 embeddedDisplayWindowScene];
  int v19 = [v18 systemPointerInteractionManager];
  id v20 = [MEMORY[0x1E4F74230] sharedConnection];
  int v21 = [(SBSystemNotesManager *)v29 initWithControllerCoordinator:v14 workspace:self sceneManager:v28 keyboardArbiterManager:v31 fbSceneManager:v27 sceneDeactivationManager:v26 keyboardSuppressionManager:v25 keyboardDismissalManager:keyboardDismissalManager applicationController:v24 systemGestureManager:v16 systemPointerInteractionManager:v19 idleTimerCoordinator:self managedProfileConnection:v20];
  systemNotesManager = self->_systemNotesManager;
  self->_systemNotesManager = v21;
}

- (id)pipControllerForType:(int64_t)a3
{
  return [(SBPIPControllerCoordinator *)self->_pipCoordinator controllerForType:a3];
}

- (void)_handleBuddyLaunchFinished
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v2 = [(id)SBApp restartManager];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 startupTransition];
    if (v4)
    {
    }
    else
    {
      id v5 = +[SBSetupManager sharedInstance];
      char v6 = [v5 isInSetupModeForDeviceMigration];

      if ((v6 & 1) == 0)
      {
        id v7 = +[SBLockScreenManager sharedInstance];
        v19[0] = @"SBUILockOptionsUseScreenOffModeKey";
        uint64_t v8 = [NSNumber numberWithBool:0];
        v20[0] = v8;
        v19[1] = @"SBUILockOptionsLockAutomaticallyKey";
        double v9 = [NSNumber numberWithBool:1];
        v20[1] = v9;
        v19[2] = @"SBUILockOptionsForceLockKey";
        uint64_t v10 = [NSNumber numberWithBool:1];
        v20[2] = v10;
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
        [v7 lockUIFromSource:16 withOptions:v11];

        id v12 = +[SBDefaults localDefaults];
        Class v13 = [v12 setupDefaults];
        LODWORD(v9) = [v13 inSetupModeForActivationChange];

        if (v9)
        {
          uint64_t v14 = [SBBuddyLockScreenDismissOnlyAlertItem alloc];
          BOOL v15 = [MEMORY[0x1E4F28B50] mainBundle];
          BOOL v16 = [v15 localizedStringForKey:@"ACTIVATION_REQUIRED" value:@"Activation Required" table:@"SpringBoard"];
          id v17 = [(SBDismissOnlyAlertItem *)v14 initWithTitle:v16 body:0];

          id v18 = +[SBAlertItemsController sharedInstance];
          [v18 activateAlertItem:v17];
        }
      }
    }
  }
}

- (BOOL)_handleSetupExited:(id)a3
{
  id v3 = +[SBSetupManager sharedInstance];
  [v3 updateInSetupMode];
  id v4 = +[SBSyncController sharedInstance];
  if (![v3 isInSetupMode]
    || ([v3 isInSetupModeForDeviceMigration] & 1) != 0
    || ([v4 isRestoring] & 1) != 0
    || [v4 isResetting])
  {
    id v5 = [(id)SBApp bannerManager];
    [v5 setSuspended:0 forReason:@"com.apple.purplebuddy"];

    char v6 = +[SBSetupManager sharedInstance];
    [v6 setDeferringDeviceOrientationUpdates:0];

    id v7 = +[SBOrientationLockManager sharedInstance];
    [v7 restoreStateFromPrefs];

    uint64_t v8 = +[SBDefaults localDefaults];
    double v9 = [v8 setupDefaults];
    [v9 setInSetupModeForActivationChange:0];

    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"SBSetupBuddyCompletedNotification" object:0];

    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)_applicationProcessExited:(id)a3 withContext:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[SBApplicationController sharedInstanceIfExists];
  double v9 = [v7 bundleIdentifier];

  uint64_t v10 = [v8 applicationWithBundleIdentifier:v9];

  if (v10)
  {
    BOOL v11 = +[SBApplicationController sharedInstance];
    id v12 = [v11 setupApplication];

    BOOL v13 = v10 == v12 && [(SBMainWorkspace *)self _handleSetupExited:v10];
    char v14 = [v6 exitReason];
    uint64_t v15 = [v6 terminationReason];
    if ((FBSApplicationTerminationReasonIsGraceful() & 1) == 0 && v15 != 7 && (v14 & 1) == 0 && (v14 & 0x10) == 0)
    {
      BOOL v16 = [v10 bundleIdentifier];
      char v17 = [v16 isEqualToString:@"com.apple.siri"];

      if ((v17 & 1) == 0)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __57__SBMainWorkspace__applicationProcessExited_withContext___block_invoke;
        block[3] = &unk_1E6AF4AC0;
        id v22 = v10;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    if (v13)
    {
      id v18 = SBLogWorkspace();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = [v10 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v19;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_INFO, "%{public}@ should relaunch on exit", buf, 0xCu);
      }
    }
    [v10 _didExitWithContext:v6];
    if ((v14 & 0x10) != 0) {
      [(id)*MEMORY[0x1E4F43630] didReceiveMemoryWarning];
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

void __57__SBMainWorkspace__applicationProcessExited_withContext___block_invoke(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x1E4F1C9E8];
  id v2 = [*(id *)(a1 + 32) bundleIdentifier];
  objc_msgSend(v1, "dictionaryWithObjectsAndKeys:", v2, *MEMORY[0x1E4F436F0], 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  [(id)SBApp failedTest:0 withResults:v3];
}

- (void)_noteDidWakeFromSleep
{
  BSDispatchQueueAssertMain();
  __SBWIsSleeping = 0;
  if (__SBWGatherUsageTime == 1 && *(double *)&__SBWLastUsageTimeGMT != 0.0)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", *(double *)&__SBWLastUsageTimeGMT);
    __SBWLastUsageTimeGMT = v2;
  }
  _SBWorkspaceNoteSleepOrWake(1);
  id v3 = (void *)_noteDidWakeFromSleep___WakeSound;
  if (__playSoundOnWake)
  {
    if (!_noteDidWakeFromSleep___WakeSound)
    {
      id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/AppleInternal/Library/PreferenceBundles/Internal Settings.bundle/4_note_rising.aiff"];
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F153C8]) initWithContentsOfURL:v4 error:0];
      id v6 = (void *)_noteDidWakeFromSleep___WakeSound;
      _noteDidWakeFromSleep___WakeSound = v5;

      id v3 = (void *)_noteDidWakeFromSleep___WakeSound;
    }
    [v3 play];
  }
  else if (_noteDidWakeFromSleep___WakeSound)
  {
    _noteDidWakeFromSleep___WakeSound = 0;
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"SBWorkspaceDidWakeFromSleepNotification" object:0 userInfo:0];
}

- (void)_coversheetDidPresent
{
}

uint64_t __40__SBMainWorkspace__coversheetDidPresent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _proposeIdleTimerBehaviorForReason:@"CoverSheetDidPresent"];
}

- (void)_coversheetDidDismiss
{
}

uint64_t __40__SBMainWorkspace__coversheetDidDismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _proposeIdleTimerBehaviorForReason:@"CoverSheetDidDismiss"];
}

- (void)_destroyApplicationSceneEntity:(id)a3
{
  id v26 = a3;
  id v4 = [v26 uniqueIdentifier];
  if (v4)
  {
    uint64_t v5 = [v26 application];
    id v6 = [MEMORY[0x1E4F62490] sharedInstance];
    id v7 = +[SBApplicationSceneHandle lookupOrCreatePersistenceIDFromApplication:v5 sceneID:v4];
    if (v7
      && ([v5 processState],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isRunning],
          v8,
          v9))
    {
      id v10 = objc_alloc(MEMORY[0x1E4F42938]);
      BOOL v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
      id v12 = (void *)[v10 initWithPersistedIdentifiers:v11 preferredAnimationType:1 callbackQueue:0 completion:0];

      BOOL v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
    }
    else
    {
      BOOL v13 = 0;
    }
    char v14 = [v6 sceneWithIdentifier:v4];

    if (v14)
    {
      if (v13)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F62AB8]);
        [v15 setActions:v13];
      }
      else
      {
        id v15 = 0;
      }
      [v6 destroyScene:v4 withTransitionContext:v15];
    }
    else if (v13)
    {
      BOOL v16 = [MEMORY[0x1E4F62448] sharedInstance];
      char v17 = [v5 bundleIdentifier];
      id v18 = [v16 applicationProcessesForBundleIdentifier:v17];
      int v19 = [v18 lastObject];

      id v20 = [v19 workspace];
      [v20 sendActions:v13];
    }
    else
    {
      [(SBMainWorkspace *)self _cleanupForRemovedAppEntity:v26];
    }
    [v5 flushSnapshotsForSceneID:v4];
    int v21 = [v5 _dataStore];
    [v21 removeSceneStoreForIdentifier:v4];

    id v22 = [v5 bundleIdentifier];
    int v23 = [v5 info];
    uint64_t v24 = [v23 restorationArchiveContainerURL];
    uint64_t v25 = [v24 path];
    _deleteStateRestorationArchiveForApplication();
  }
}

- (void)_cleanupForRemovedAppEntity:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uniqueIdentifier];
  if (v5)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v6 = [(id)SBApp windowSceneManager];
    id v7 = [v6 connectedWindowScenes];

    uint64_t v30 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (!v30)
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v25 = self;
    id v26 = v4;
    char v27 = 0;
    int v28 = v7;
    uint64_t v29 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(v7);
        }
        int v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v10 = [v9 layoutStateProvider];
        BOOL v11 = [v10 layoutState];
        id v12 = [v11 elements];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v34;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v34 != v15) {
                objc_enumerationMutation(v12);
              }
              char v17 = [*(id *)(*((void *)&v33 + 1) + 8 * j) workspaceEntity];
              id v18 = [v17 applicationSceneEntity];
              int v19 = [v18 uniqueIdentifier];
              char v20 = [v19 isEqualToString:v5];

              if (v20)
              {
                char v27 = 1;
                goto LABEL_17;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v14) {
              continue;
            }
            break;
          }
LABEL_17:
          id v7 = v28;
        }
      }
      uint64_t v30 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v30);

    id v4 = v26;
    if (v27)
    {
      uint64_t v21 = [NSString stringWithFormat:@"ApplicationEntity was removed = %@", v5];
      id v22 = (void *)MEMORY[0x1E4F624D8];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __47__SBMainWorkspace__cleanupForRemovedAppEntity___block_invoke;
      v31[3] = &unk_1E6AF5290;
      v31[4] = v25;
      id v32 = v26;
      int v23 = [v22 eventWithName:v21 handler:v31];
      id v7 = (void *)v21;
      uint64_t v24 = [(SBWorkspace *)v25 eventQueue];
      [v24 executeOrPrependEvent:v23];

      goto LABEL_22;
    }
  }
LABEL_23:
}

void __47__SBMainWorkspace__cleanupForRemovedAppEntity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _selectTransactionForAppEntityRemoved:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCurrentTransaction:v2];
}

- (void)_removeApplicationEntities:(id)a3 withDestructionIntent:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  int v11 = [v9 shouldRemoveFromHistory];
  __int16 v31 = v8;
  id v12 = [MEMORY[0x1E4F1CA80] setWithSet:v8];
  uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v14 = [(SBPIPControllerCoordinator *)self->_pipCoordinator controllerForType:0];
  uint64_t v15 = [v14 hostedAppSceneHandles];
  [v13 addObjectsFromArray:v15];

  BOOL v16 = [(SBPIPControllerCoordinator *)self->_pipCoordinator controllerForType:1];
  char v17 = [v16 hostedAppSceneHandles];
  [v13 addObjectsFromArray:v17];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __79__SBMainWorkspace__removeApplicationEntities_withDestructionIntent_completion___block_invoke;
  v33[3] = &unk_1E6AF5C80;
  id v30 = v13;
  id v34 = v30;
  id v18 = objc_msgSend(v12, "bs_filter:", v33);
  [v12 minusSet:v18];
  int v19 = 0;
  if (v11)
  {
    int v19 = objc_msgSend(v12, "bs_filter:", &__block_literal_global_467);
    [v12 minusSet:v19];
  }
  id v20 = v12;
  BOOL v21 = [v19 count] == 0;
  BOOL v22 = [v20 count] == 0;
  if ([v19 count])
  {
    int v23 = SBLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v36 = v19;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "asking switcher to remove the following entities: %{public}@", buf, 0xCu);
    }

    uint64_t v24 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    uint64_t v25 = [v19 allObjects];
    [v24 handleApplicationSceneEntityDestructionIntent:v9 forEntities:v25];

    BOOL v21 = 1;
  }
  if ([v20 count])
  {
    id v26 = SBLogCommon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v36 = v20;
      _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "asking workspace to remove the following entities: %{public}@", buf, 0xCu);
    }

    id v32 = 0;
    BOOL v22 = [(SBMainWorkspace *)self _removeApplicationEntitiesFromWorkspace:v20 error:&v32];
    id v27 = v32;
  }
  else
  {
    id v27 = 0;
  }
  if ([v18 count])
  {
    int v28 = SBLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v36 = v18;
      _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "asking pip coordinator to remove the following entities: %{public}@", buf, 0xCu);
    }

    uint64_t v29 = objc_msgSend(v18, "bs_map:", &__block_literal_global_471);
    [(SBPIPControllerCoordinator *)self->_pipCoordinator handleDestructionRequestForSceneHandles:v29];
  }
  if (v10) {
    v10[2](v10, v22 & v21, v27);
  }
}

uint64_t __79__SBMainWorkspace__removeApplicationEntities_withDestructionIntent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sceneHandle];
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];

  return v4;
}

uint64_t __79__SBMainWorkspace__removeApplicationEntities_withDestructionIntent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 sceneHandle];
  id v3 = [v2 _definition];
  uint64_t v4 = [v3 specification];
  uint64_t v5 = [v4 uiSceneSessionRole];

  if ([v5 isEqual:*MEMORY[0x1E4F43F38]]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [v5 isEqual:*MEMORY[0x1E4F43C90]];
  }

  return v6;
}

uint64_t __79__SBMainWorkspace__removeApplicationEntities_withDestructionIntent_completion___block_invoke_468(uint64_t a1, void *a2)
{
  return [a2 sceneHandle];
}

- (BOOL)_removeApplicationEntitiesFromWorkspace:(id)a3 error:(id *)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v49 = [MEMORY[0x1E4F62490] sharedInstance];
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v50 = [MEMORY[0x1E4F1CA80] set];
  int v48 = [MEMORY[0x1E4F1CA80] set];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v4;
  uint64_t v53 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v72;
    long long v56 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v72 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = v6;
        id v7 = [*(id *)(*((void *)&v71 + 1) + 8 * v6) uniqueIdentifier];
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v8 = [(id)SBApp windowSceneManager];
        id v9 = [v8 connectedWindowScenes];

        id v55 = v9;
        uint64_t v58 = [v9 countByEnumeratingWithState:&v67 objects:v81 count:16];
        if (v58)
        {
          uint64_t v57 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v68 != v57) {
                objc_enumerationMutation(v55);
              }
              int v11 = *(void **)(*((void *)&v67 + 1) + 8 * i);
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              id v12 = [v11 layoutStateProvider];
              uint64_t v13 = [v12 layoutState];
              uint64_t v14 = [v13 elements];

              uint64_t v15 = [v14 countByEnumeratingWithState:&v63 objects:v80 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v64;
                while (2)
                {
                  for (uint64_t j = 0; j != v16; ++j)
                  {
                    if (*(void *)v64 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    int v19 = [*(id *)(*((void *)&v63 + 1) + 8 * j) workspaceEntity];
                    id v20 = [v19 applicationSceneEntity];
                    BOOL v21 = [v20 uniqueIdentifier];
                    int v22 = [v21 isEqualToString:v7];

                    if (v22)
                    {
                      [v56 addObject:v7];
                      goto LABEL_21;
                    }
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v63 objects:v80 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
              }
LABEL_21:
            }
            uint64_t v58 = [v55 countByEnumeratingWithState:&v67 objects:v81 count:16];
          }
          while (v58);
        }

        uint64_t v5 = v56;
        if (([v56 containsObject:v7] & 1) == 0)
        {
          int v23 = [v49 sceneWithIdentifier:v7];

          uint64_t v24 = v50;
          if (v23)
          {
            [v49 destroyScene:v7 withTransitionContext:0];
            uint64_t v24 = v48;
          }
          [v24 addObject:v7];
        }

        uint64_t v6 = v54 + 1;
      }
      while (v54 + 1 != v53);
      uint64_t v53 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
    }
    while (v53);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v25 = [v48 allObjects];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v59 objects:v79 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v60;
LABEL_31:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v60 != v28) {
        objc_enumerationMutation(v25);
      }
      uint64_t v30 = *(void *)(*((void *)&v59 + 1) + 8 * v29);
      __int16 v31 = [v49 sceneWithIdentifier:v30];

      if (v31) {
        break;
      }
      if (v27 == ++v29)
      {
        uint64_t v27 = [v25 countByEnumeratingWithState:&v59 objects:v79 count:16];
        if (v27) {
          goto LABEL_31;
        }
        goto LABEL_37;
      }
    }
    id v32 = [NSString stringWithFormat:@"The scene with identifier — %@ — was not destroyed synchronously by FBSceneManager as we relied upon", v30];
    long long v33 = SBLogCommon();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();
    }

    id v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = SBMainWorkspaceErrorDomain;
    uint64_t v77 = *MEMORY[0x1E4F28228];
    int v78 = v32;
    id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    uint64_t v37 = [v34 errorWithDomain:v35 code:2 userInfo:v36];

    if (v37)
    {
      BOOL v38 = 0;
      goto LABEL_52;
    }
  }
  else
  {
LABEL_37:
  }
  long long v39 = [MEMORY[0x1E4F28E78] string];
  if ([v5 count])
  {
    [v39 appendString:@"The following scenes where not destroyed since they are laid out as foreground and we were asked to not remove their sessions (destroySessions flag is false): "];
    long long v40 = [v5 description];
    [v39 appendString:v40];
  }
  if ([v50 count])
  {
    [v39 appendString:@"\n The following scenes couldn't be found: "];
    id v41 = [v50 description];
    [v39 appendString:v41];
  }
  if ([v39 length])
  {
    uint64_t v42 = SBLogCommon();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();
    }

    uint64_t v43 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v44 = SBMainWorkspaceErrorDomain;
    uint64_t v75 = *MEMORY[0x1E4F28228];
    id v76 = v39;
    BOOL v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    uint64_t v37 = [v43 errorWithDomain:v44 code:2 userInfo:v45];
  }
  else
  {
    uint64_t v37 = 0;
  }

  BOOL v38 = 1;
LABEL_52:
  if (a4) {
    *a4 = v37;
  }

  return v38;
}

- (void)_cleanupAppRepairRequest:(id)a3
{
  [(NSMutableSet *)self->_ocelotRepairRequests removeObject:a3];
  if (![(NSMutableSet *)self->_ocelotRepairRequests count])
  {
    ocelotRepairRequests = self->_ocelotRepairRequests;
    self->_ocelotRepairRequests = 0;
  }
}

- (void)_handleKeyShortcutHUDVisibilityDidPresent:(id)a3
{
  if (!self->_lockKeyboardFocusAssertion)
  {
    keyboardFocusCoordinator = self->_keyboardFocusCoordinator;
    id v9 = [a3 object];
    uint64_t v5 = [v9 _sbWindowScene];
    uint64_t v6 = +[SBKeyboardFocusLockReason keyShortcutHUD];
    id v7 = [(SBKeyboardFocusControlling *)keyboardFocusCoordinator focusLockSpringBoardWindowScene:v5 forReason:v6];
    lockKeyboardFocusAssertion = self->_lockKeyboardFocusAssertion;
    self->_lockKeyboardFocusAssertion = v7;
  }
}

- (void)_handleKeyShortcutHUDVisibilityDidDismiss
{
  lockKeyboardFocusAssertion = self->_lockKeyboardFocusAssertion;
  if (lockKeyboardFocusAssertion)
  {
    [(BSInvalidatable *)lockKeyboardFocusAssertion invalidate];
    id v4 = self->_lockKeyboardFocusAssertion;
    self->_lockKeyboardFocusAssertion = 0;
  }
}

- (void)processDidExit:(id)a3
{
}

- (void)applicationProcessDidExit:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke;
  block[3] = &unk_1E6AF4E00;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke(uint64_t a1)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)SBApp restartManager];
  int v3 = [v2 isPendingExit];

  if (!v3)
  {
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v6 = [(id)SBApp windowSceneManager];
    id v7 = [v6 connectedWindowScenes];

    id obj = v7;
    uint64_t v74 = [v7 countByEnumeratingWithState:&v90 objects:v99 count:16];
    if (v74)
    {
      uint64_t v75 = 0;
      uint64_t v73 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v74; ++i)
        {
          if (*(void *)v91 != v73) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          long long v86 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          id v10 = [v9 layoutStateProvider];
          id v11 = [v10 layoutState];
          id v12 = [v11 elements];

          uint64_t v13 = [v12 countByEnumeratingWithState:&v86 objects:v98 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v76 = i;
            uint64_t v15 = *(void *)v87;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v87 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = [*(id *)(*((void *)&v86 + 1) + 8 * j) workspaceEntity];
                id v18 = [v17 applicationSceneEntity];

                int v19 = [v18 sceneHandle];
                id v20 = [v19 sceneIfExists];
                BOOL v21 = [v20 clientProcess];
                uint64_t v22 = a1;
                int v23 = *(void **)(a1 + 32);

                if (v21 == v23)
                {

                  uint64_t v75 = v18;
                  a1 = v22;
                  goto LABEL_19;
                }

                a1 = v22;
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v86 objects:v98 count:16];
              if (v14) {
                continue;
              }
              break;
            }
LABEL_19:
            uint64_t i = v76;
          }
        }
        uint64_t v74 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
      }
      while (v74);
    }
    else
    {
      uint64_t v75 = 0;
    }

    uint64_t v24 = SBLogWorkspace();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v95 = v25;
      __int16 v96 = 2114;
      uint64_t v97 = v26;
      _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Process exited: %{public}@ -> %{public}@", buf, 0x16u);
    }

    uint64_t v27 = +[SBApplicationController sharedInstanceIfExists];
    uint64_t v28 = [*(id *)(a1 + 32) bundleIdentifier];
    uint64_t v29 = [v27 applicationWithBundleIdentifier:v28];

    if (!v29)
    {
      long long v33 = SBLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_cold_1((id *)(a1 + 32));
      }
      goto LABEL_73;
    }
    if ([*(id *)(a1 + 48) _applicationProcessExited:*(void *)(a1 + 32) withContext:*(void *)(a1 + 40)])
    {
      if (![v29 isAnyTerminationAssertionHeld])
      {
        uint64_t v32 = a1;
        int v34 = 1;
LABEL_37:
        long long v33 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
        id v36 = +[SBLockScreenManager sharedInstance];
        if ([v36 isUILocked])
        {

          uint64_t v37 = v32;
        }
        else
        {
          BOOL v38 = [(id)SBApp lockOutController];
          int v39 = [v38 isLockedOut];

          uint64_t v37 = v32;
          if (v39)
          {
            if (v34)
            {
              long long v40 = [v29 bundleIdentifier];
              int v41 = [v40 isEqualToString:@"com.apple.purplebuddy"];
            }
            else
            {
              int v41 = 0;
            }
            if ((v41 & 1) != 0 || v75)
            {
              uint64_t v57 = SBLogCommon();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v95) = v41;
                _os_log_impl(&dword_1D85BA000, v57, OS_LOG_TYPE_DEFAULT, "Application exit detected and we need to return to the lock-screen: forceSetup: %d", buf, 8u);
              }

              uint64_t v58 = NSString;
              long long v59 = [v29 bundleIdentifier];
              uint64_t v52 = [v58 stringWithFormat:@"ReturnToLockscreenFromApplicationExited = %@", v59];

              v84[0] = MEMORY[0x1E4F143A8];
              v84[1] = 3221225472;
              v84[2] = __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_501;
              v84[3] = &unk_1E6AF5D38;
              v84[4] = *(void *)(v32 + 48);
              char v85 = v41;
              long long v60 = [MEMORY[0x1E4F624D8] eventWithName:v52 handler:v84];
              [v33 addObject:v60];

              int v34 = 1;
              goto LABEL_56;
            }
            int v34 = 1;
LABEL_57:
            long long v61 = +[SBApplicationController sharedInstance];
            long long v62 = [v61 setupApplication];

            long long v63 = +[SBSetupManager sharedInstance];
            long long v64 = v63;
            if (v29 != v62
              && [v63 isInSetupMode]
              && ((v34 | [v64 updateInSetupMode] ^ 1) & 1) == 0
              && v75)
            {
              long long v65 = SBLogCommon();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D85BA000, v65, OS_LOG_TYPE_DEFAULT, "Activating Setup on a process exit because we're in setup mode.", buf, 2u);
              }

              SBWorkspaceActivateApplicationWithActionsAndResult(v62, 0, 0);
            }
            uint64_t v66 = [v33 count];
            uint64_t v67 = [v35 count];
            if (v66 | v67)
            {
              uint64_t v69 = v67;
              if (v66)
              {
                long long v70 = +[SBReachabilityManager sharedInstance];
                [v70 deactivateReachability];

                long long v71 = [*(id *)(v37 + 48) eventQueue];
                [v71 executeOrPrependEvents:v33];
              }
              if (!v69) {
                goto LABEL_72;
              }
              long long v68 = [*(id *)(v37 + 48) eventQueue];
              [v68 executeOrInsertEvents:v35 atPosition:1];
            }
            else
            {
              long long v68 = SBLogWorkspace();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D85BA000, v68, OS_LOG_TYPE_INFO, "No transaction needed for exiting app.", buf, 2u);
              }
            }

LABEL_72:
LABEL_73:

            id v4 = v75;
            goto LABEL_74;
          }
        }
        if (v75) {
          char v42 = v34;
        }
        else {
          char v42 = 1;
        }
        if ((v42 & 1) == 0)
        {
          uint64_t v43 = NSString;
          uint64_t v44 = [v29 bundleIdentifier];
          BOOL v45 = [v43 stringWithFormat:@"ApplicationExited = %@", v44];

          id v46 = (void *)MEMORY[0x1E4F624D8];
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_2;
          v80[3] = &unk_1E6AF4E00;
          id v47 = v29;
          uint64_t v48 = *(void *)(v37 + 48);
          id v81 = v47;
          uint64_t v82 = v48;
          uint64_t v83 = v75;
          id v49 = [v46 eventWithName:v45 handler:v80];
          [v33 addObject:v49];
        }
        if (v34)
        {
          uint64_t v50 = NSString;
          int v51 = [v29 bundleIdentifier];
          uint64_t v52 = [v50 stringWithFormat:@"RelaunchAfterApplicationExited = %@", v51];

          uint64_t v53 = (void *)MEMORY[0x1E4F624D8];
          v77[0] = MEMORY[0x1E4F143A8];
          v77[1] = 3221225472;
          v77[2] = __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_3;
          v77[3] = &unk_1E6AF5290;
          id v54 = v29;
          uint64_t v55 = *(void *)(v37 + 48);
          id v78 = v54;
          uint64_t v79 = v55;
          long long v56 = [v53 eventWithName:v52 handler:v77];
          [v33 addObject:v56];

          int v34 = 0;
LABEL_56:

          goto LABEL_57;
        }
        goto LABEL_57;
      }
      uint64_t v30 = SBLogWorkspace();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v95 = v31;
        _os_log_impl(&dword_1D85BA000, v30, OS_LOG_TYPE_INFO, "Not actually relaunching %@ because it has outstanding termination assertions", buf, 0xCu);
      }
      uint64_t v32 = a1;
    }
    else
    {
      uint64_t v32 = a1;
    }
    int v34 = 0;
    goto LABEL_37;
  }
  id v4 = SBLogWorkspace();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v95 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Ignoring application exit of %@ because we are pending exit.", buf, 0xCu);
  }
LABEL_74:
}

void __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_501(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _selectTransactionForReturningToTheLockScreenAndForceToBuddy:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) setCurrentTransaction:v2];
}

void __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) processState];
  char v3 = [v2 isRunning];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 40) _selectTransactionForAppEntityRemoved:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setCurrentTransaction:v4];
  }
}

void __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) processState];
  char v3 = [v2 isRunning];

  if (v3)
  {
    id v4 = SBLogWorkspace();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      id v9 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Not creating an app relaunch transaction because %{public}@ is already running", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
    id v6 = objc_msgSend(*(id *)(a1 + 40), "_selectTransactionForAppRelaunch:");
    [*(id *)(a1 + 40) setCurrentTransaction:v6];
  }
}

- (void)applicationProcessDebuggingStateDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__SBMainWorkspace_applicationProcessDebuggingStateDidChange___block_invoke;
  v6[3] = &unk_1E6AF5290;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __61__SBMainWorkspace_applicationProcessDebuggingStateDidChange___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) bundleIdentifier];
  id v7 = [v2 _applicationForIdentifier:v3];

  id v4 = *(void **)(a1 + 40);
  id v5 = [v4 state];
  [v7 _noteProcess:v4 didChangeToState:v5];

  id v6 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  [v6 resetIdleTimerForReason:@"DebuggingStateDidChange"];
}

- (id)systemServiceApplicationInfoProvider:(id)a3
{
  char v3 = +[SBApplicationController sharedInstance];
  id v4 = [v3 _appLibrary];

  return v4;
}

- (void)systemService:(id)a3 canActivateApplication:(id)a4 withResult:(id)a5
{
  id v13 = a4;
  id v6 = (void (**)(id, uint64_t))a5;
  id v7 = +[SBApplicationController sharedInstance];
  id v8 = [v7 applicationWithBundleIdentifier:v13];

  if (!v13)
  {
    uint64_t v12 = 2;
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (!v8)
  {
    uint64_t v12 = 4;
    if (!v6) {
      goto LABEL_11;
    }
LABEL_10:
    v6[2](v6, v12);
    goto LABEL_11;
  }
  id v9 = +[SBIconController sharedInstance];
  uint64_t v10 = [v9 model];

  id v11 = [v10 applicationIconForBundleIdentifier:v13];
  if (([(id)SBApp isBundleIdentifierRestrictionDisabled:v13] & 1) != 0
    || ([v10 isIconVisible:v11] & 1) == 0)
  {
    uint64_t v12 = 5;
  }
  else
  {
    uint64_t v12 = 0;
  }

  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
}

- (id)_parseShellArguments:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v3 count] != 1)
  {
    uint64_t v6 = 0;
    uint64_t v17 = *MEMORY[0x1E4FA7110];
    uint64_t v18 = *MEMORY[0x1E4FA70E0];
    uint64_t v19 = *MEMORY[0x1E4FA7100];
    uint64_t v7 = *MEMORY[0x1E4FA7150];
    do
    {
      id v8 = [v3 objectAtIndex:v6];
      id v9 = [v8 lowercaseString];

      uint64_t v10 = v6 + 1;
      id v11 = [v3 objectAtIndex:v6 + 1];
      if ([v9 isEqualToString:@"-grid"])
      {
        uint64_t v12 = v4;
        id v13 = v11;
        uint64_t v14 = v7;
      }
      else
      {
        if ([v9 isEqualToString:@"-launch"])
        {
          uint64_t v15 = [v11 componentsSeparatedByString:@","];
          uint64_t v16 = objc_msgSend(v15, "bs_compactMap:", &__block_literal_global_532);

          [v4 setObject:v16 forKeyedSubscript:v19];
          goto LABEL_11;
        }
        if (![v9 isEqualToString:@"-display"])
        {
          if ([v9 isEqualToString:@"-classicmode"])
          {
            [v4 setObject:v11 forKeyedSubscript:v17];
            uint64_t v10 = v6 + 2;
          }
          goto LABEL_11;
        }
        uint64_t v12 = v4;
        id v13 = v11;
        uint64_t v14 = v18;
      }
      [v12 setObject:v13 forKeyedSubscript:v14];
LABEL_11:

      uint64_t v6 = v10 + 1;
    }
    while (v10 + 1 < (unint64_t)([v3 count] - 1));
  }

  return v4;
}

id __40__SBMainWorkspace__parseShellArguments___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28B88];
  id v3 = a2;
  id v4 = [v2 whitespaceCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

uint64_t __93__SBMainWorkspace__updateActivationSettings_forRequestWithOptions_clientProcess_application___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sceneIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 applicationWithBundleIdentifier:v4];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = (void *)a1[5];
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[7];
    id v15 = 0;
    uint64_t v10 = [v7 _validateRequestToOpenApplication:v4 options:v8 origin:v9 error:&v15];

    id v11 = v15;
    if (!v10) {
      (*(void (**)(void))(a1[8] + 16))();
    }
  }
  else
  {
    uint64_t v12 = a1[8];
    id v13 = FBSOpenApplicationErrorCreate();

    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    uint64_t v10 = 0;
  }
  return v10;
}

void __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_633(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = (id)[*(id *)(a1 + 32) mutableCopy];
    [v4 removeObjectForKey:*MEMORY[0x1E4F626A0]];
    [v4 removeObjectForKey:*MEMORY[0x1E4F62688]];
    [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"__SBWorkspaceOpenOptionUnlockResult"];
    [*(id *)(a1 + 40) _handleOpenApplicationRequest:*(void *)(a1 + 48) options:v4 activationSettings:*(void *)(a1 + 56) origin:*(void *)(a1 + 64) withResult:*(void *)(a1 + 72)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 72);
    FBSOpenApplicationErrorCreate();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

void __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_655(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isDeviceApplicationSceneEntity])
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) mutableCopy];
    [v3 setObject:v5 forKey:@"SBWorkspaceOpenApplicationResolvedWebClipSceneEntityKey"];
    [*(id *)(a1 + 40) _handleOpenApplicationRequest:*(void *)(a1 + 48) options:v3 activationSettings:*(void *)(a1 + 56) origin:*(void *)(a1 + 64) withResult:*(void *)(a1 + 80)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 80);
    uint64_t v3 = FBSOpenApplicationErrorCreate();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_670(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = SBLogWidgets();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "launchExtensionWithBundleID: %@ completed with success=%d error: %@", (uint8_t *)&v9, 0x1Cu);
  }

  if (a2) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7);
}

id __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_674(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = +[SBDeviceApplicationSceneEntity newEntityWithApplication:a2 sceneHandleProvider:a1[4] displayIdentity:a1[5]];
  if (([v5 supportsLayoutRole:a3] & 1) == 0)
  {
    uint64_t v6 = a1[6];
    id v7 = [v5 uniqueIdentifier];
    uint64_t v10 = SBLayoutRoleDescription(a3);
    uint64_t v8 = FBSOpenApplicationErrorCreate();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);
  }
  return v5;
}

void __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 89);
    uint64_t v6 = objc_opt_new();
    objc_msgSend(v6, "bs_safeAddObject:", *(void *)(a1 + 32));
    objc_msgSend(v6, "bs_safeAddObject:", *(void *)(a1 + 40));
    objc_msgSend(v6, "bs_safeAddObject:", *(void *)(a1 + 48));
    objc_msgSend(v6, "bs_safeAddObject:", *(void *)(a1 + 56));
    [v6 addObjectsFromArray:*(void *)(a1 + 64)];
    [v4 setEntities:v6 withPolicy:v5 centerEntity:0 floatingEntity:0];
    id v7 = *(void **)(a1 + 72);
    if (v7)
    {
      uint64_t v18 = a1;
      uint64_t v8 = [v7 layoutRoleToLayoutAttributes];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      int v9 = [v4 entities];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ([v14 isApplicationSceneEntity])
            {
              uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "layoutRole"));
              uint64_t v16 = [v8 objectForKey:v15];

              if (v16) {
                [v4 setRequestedLayoutAttributes:v16 forEntity:v14];
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v11);
      }

      a1 = v18;
    }
    if (*(unsigned char *)(a1 + 90) || *(unsigned char *)(a1 + 89))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      if (!v17)
      {
        uint64_t v17 = *(void *)(a1 + 40);
        if (!v17)
        {
          uint64_t v17 = *(void *)(a1 + 48);
          if (!v17) {
            uint64_t v17 = *(void *)(a1 + 56);
          }
        }
      }
      [v4 _setRequestedFrontmostEntity:v17];
    }
  }
  else
  {
    [v3 setEntity:*(void *)(a1 + 32) forLayoutRole:1];
    [v4 setEntity:*(void *)(a1 + 40) forLayoutRole:2];
    [v4 setEntity:*(void *)(a1 + 48) forLayoutRole:3];
    [v4 setEntity:*(void *)(a1 + 56) forLayoutRole:4];
  }
  [v4 setRequestedSpaceConfiguration:*(void *)(a1 + 80)];
}

- (BOOL)isApplicationRunningAsViewService:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 processState];
  if (([v4 isRunning] & 1) == 0)
  {

    goto LABEL_13;
  }
  uint64_t v5 = [v3 info];
  int v6 = [v5 hasViewServicesEntitlement];

  if (!v6)
  {
LABEL_13:
    BOOL v18 = 0;
    goto LABEL_16;
  }
  id v7 = _SBApplicationStateGetMonitor();
  uint64_t v8 = [v3 bundleIdentifier];
  int v9 = [v7 applicationInfoForApplication:v8];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E4F4F1B0], 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    uint64_t v14 = *MEMORY[0x1E4F4F1A8];
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) objectForKey:v14];
        int v17 = [v16 unsignedIntValue];

        if (v17 == 9)
        {
          BOOL v18 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 0;
LABEL_15:

LABEL_16:
  return v18;
}

uint64_t __104__SBMainWorkspace__handleTrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleOpenApplicationRequest:*(void *)(a1 + 40) options:*(void *)(a1 + 48) activationSettings:*(void *)(a1 + 56) origin:*(void *)(a1 + 64) withResult:*(void *)(a1 + 72)];
}

- (void)_handleUntrustedOpenRequestForApplication:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v16)
  {
    uint64_t v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"result"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMainWorkspace _handleUntrustedOpenRequestForApplication:options:activationSettings:origin:withResult:]();
    }
LABEL_9:
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D87227A0);
  }
  int v17 = v16;
  if (!v14)
  {
    uint64_t v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"settings"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMainWorkspace _handleUntrustedOpenRequestForApplication:options:activationSettings:origin:withResult:]();
    }
    goto LABEL_9;
  }
  BOOL v18 = [NSString stringWithFormat:@"FBSystemService-UntrustedRequest: %@", v12];
  long long v19 = [(SBWorkspace *)self eventQueue];
  long long v20 = (void *)MEMORY[0x1E4F624D8];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __106__SBMainWorkspace__handleUntrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke;
  v28[3] = &unk_1E6AF5F30;
  v28[4] = self;
  id v29 = v12;
  id v30 = v13;
  id v31 = v14;
  id v32 = v15;
  id v33 = v17;
  id v21 = v17;
  id v22 = v15;
  id v23 = v14;
  id v24 = v13;
  id v25 = v12;
  uint64_t v26 = [v20 eventWithName:v18 handler:v28];
  [v19 executeOrAppendEvent:v26];
}

uint64_t __106__SBMainWorkspace__handleUntrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUserActionRequest:*(void *)(a1 + 40) options:*(void *)(a1 + 48) activationSettings:*(void *)(a1 + 56) origin:*(void *)(a1 + 64) withResult:*(void *)(a1 + 72)];
}

void __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = (id)[*(id *)(a1 + 32) mutableCopy];
    [v4 removeObjectForKey:*MEMORY[0x1E4F626A0]];
    [v4 removeObjectForKey:*MEMORY[0x1E4F62688]];
    [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"__SBWorkspaceOpenOptionUnlockResult"];
    [*(id *)(a1 + 40) _handleUserActionRequest:*(void *)(a1 + 48) options:v4 activationSettings:*(void *)(a1 + 56) origin:*(void *)(a1 + 64) withResult:*(void *)(a1 + 72)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 72);
    FBSOpenApplicationErrorCreate();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

void __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setOriginatingProcess:v3];
  [v4 setSource:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke_3;
  v5[3] = &unk_1E6AF5F58;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v4 modifyApplicationContext:v5];
}

void __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:a1[4]];
  [(SBWorkspaceEntity *)v4 applyActivationSettings:a1[5]];
  [(SBWorkspaceEntity *)v4 setObject:&unk_1F3349308 forActivationSetting:30];
  [v3 setResultBlock:a1[6]];
  [v3 setEntity:v4 forLayoutRole:1];
}

- (BOOL)_canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin:(id)a3 givenOrigin:(id)a4 trustedRequest:(BOOL)a5 outReason:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(id)SBApp authenticationController];
  int v12 = [v11 isAuthenticated];

  if (v12)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __117__SBMainWorkspace__canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin_givenOrigin_trustedRequest_outReason___block_invoke;
    v30[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
    v30[4] = a6;
    id v13 = (void (**)(void, void))MEMORY[0x1D948C7A0](v30);
    id v14 = [MEMORY[0x1E4F62448] sharedInstance];
    id v15 = objc_msgSend(v14, "processForPID:", objc_msgSend(v9, "pid"));

    if ([v15 isApplicationProcess]) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    int v17 = [v16 applicationInfo];
    char v18 = [v17 hasViewServicesEntitlement];

    LODWORD(v17) = getpid();
    int v19 = [v9 pid];
    char v20 = [v10 isEqualToString:*MEMORY[0x1E4FA7090]];
    BOOL v21 = v17 == v19 || a5;
    unsigned __int8 v22 = v21 | v20 | v18;
    if (SBSpotlightIsVisible())
    {
      id v23 = +[SBLockScreenManager sharedInstance];
      char v24 = [v23 isUILocked];

      char v25 = v24 ^ 1;
    }
    else
    {
      char v25 = 1;
    }
    uint64_t v27 = +[SBBacklightController sharedInstance];
    unsigned __int8 v28 = [v27 screenIsOn];

    if (((v28 ^ 1 | v25 | v22 ^ 1) & 1) == 0) {
      ((void (**)(void, __CFString *))v13)[2](v13, @"lock-screen Spotlight is visible");
    }
    char v26 = (v28 ^ 1 | v25 | v22 ^ 1) ^ 1;
  }
  else
  {
    char v26 = 0;
  }

  return v26;
}

void **__117__SBMainWorkspace__canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin_givenOrigin_trustedRequest_outReason___block_invoke(void **result, id a2)
{
  if (result[4])
  {
    id v2 = result;
    uint64_t result = (void **)a2;
    *v2[4] = result;
  }
  return result;
}

- (void)_attemptUnlockToApplication:(id)a3 showPasscode:(BOOL)a4 origin:(id)a5 givenOrigin:(id)a6 options:(id)a7 completion:(id)a8
{
  BOOL v62 = a4;
  id v67 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = SBApp;
  id v16 = a8;
  int v17 = [(id)v15 authenticationController];
  LOBYTE(v15) = [v17 hasAuthenticatedAtLeastOnceSinceBoot];

  long long v65 = v12;
  id v56 = v16;
  if (v15)
  {
    int CanLaunchWhilePasscodeLocked = SBWorkspaceApplicationCanLaunchWhilePasscodeLocked(v67);
    int CanResumeWhilePasscodeLocked = SBWorkspaceApplicationCanResumeWhilePasscodeLocked(v67);
    char CanLaunchWhilePasscodeLockedIfSecureLaunchRequested = SBWorkspaceApplicationCanLaunchWhilePasscodeLockedIfSecureLaunchRequested(v67);
  }
  else
  {
    int CanResumeWhilePasscodeLocked = SBWorkspaceApplicationCanResumeWhilePasscodeLocked(v67);
    char CanLaunchWhilePasscodeLockedIfSecureLaunchRequested = 0;
    int CanLaunchWhilePasscodeLocked = 0;
  }
  long long v64 = objc_msgSend(v14, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA7108], objc_opt_class());
  char v57 = [v64 isEqualToString:*MEMORY[0x1E4FA7070]];
  int v19 = objc_msgSend(v14, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F73078], objc_opt_class());
  int v20 = [v19 BOOLValue];

  BOOL v21 = +[SBCoverSheetPresentationManager sharedInstance];
  unsigned __int8 v22 = [v21 secureAppViewController];
  id v23 = [v22 applicationSceneHandle];
  char v24 = [v23 application];

  int v25 = [v13 isEqualToString:*MEMORY[0x1E4F5AD50]];
  uint64_t v55 = *MEMORY[0x1E4F38D50];
  int v61 = objc_msgSend(v13, "isEqualToString:");
  int v26 = [v13 isEqualToString:*MEMORY[0x1E4F4A480]];
  char v27 = [v13 isEqualToString:*MEMORY[0x1E4FA7078]];
  uint64_t v66 = v14;
  unsigned __int8 v28 = objc_msgSend(v14, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4FA7000], objc_opt_class());
  int v29 = v20;
  if ([v28 BOOLValue])
  {
    id v30 = [v67 bundleIdentifier];
    char v31 = [v30 isEqualToString:@"com.apple.InCallService"];
  }
  else
  {
    char v31 = 0;
  }
  long long v60 = v13;

  char v32 = CanLaunchWhilePasscodeLocked | CanResumeWhilePasscodeLocked;
  long long v63 = v24;
  if ((CanLaunchWhilePasscodeLocked | CanResumeWhilePasscodeLocked) == 1)
  {
    int v33 = v26;
    if (([v24 isEqual:v67] ^ 1 | v25)) {
      char v34 = 0;
    }
    else {
      char v34 = (v26 | v27) ^ 1;
    }
  }
  else
  {
    int v33 = v26;
    char v34 = 0;
  }
  uint64_t v35 = objc_msgSend(v66, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F73070], objc_opt_class());
  char v36 = [v35 BOOLValue];

  char v37 = v36 & CanLaunchWhilePasscodeLocked;
  if (v25)
  {
    BOOL v38 = [v67 bundleIdentifier];
    int v39 = [v38 isEqualToString:@"com.apple.camera"] & (v29 ^ 1);
  }
  else
  {
    LOBYTE(v39) = 0;
  }
  if (v62) {
    unsigned int v40 = 3;
  }
  else {
    unsigned int v40 = 1;
  }
  if (v34 & 1 | ((((v32 | CanLaunchWhilePasscodeLockedIfSecureLaunchRequested & v57) | v29) & 1) == 0) | ((v31 | v37) | v39) & 1) {
    uint64_t v41 = v40;
  }
  else {
    uint64_t v41 = 0;
  }
  int v42 = [v65 pid];
  if (v42 == getpid()) {
    id v43 = 0;
  }
  else {
    id v43 = v65;
  }
  uint64_t v44 = objc_alloc_init(SBLockScreenUnlockRequest);
  [(SBLockScreenUnlockRequest *)v44 setSource:18];
  if (v25) {
    [(SBLockScreenUnlockRequest *)v44 setSource:26];
  }
  if (v33) {
    [(SBLockScreenUnlockRequest *)v44 setSource:13];
  }
  [(SBLockScreenUnlockRequest *)v44 setIntent:v41];
  BOOL v45 = NSString;
  id v46 = [v67 bundleIdentifier];
  id v47 = [v45 stringWithFormat:@"SBWorkspaceRequest: Open \"%@\"", v46];
  [(SBLockScreenUnlockRequest *)v44 setName:v47];

  [(SBLockScreenUnlockRequest *)v44 setProcess:v43];
  if ((v31 & 1) == 0) {
    [(SBLockScreenUnlockRequest *)v44 setDestinationApplication:v67];
  }
  [(SBLockScreenUnlockRequest *)v44 setWantsBiometricPresentation:1];
  if (v61) {
    [(SBLockScreenUnlockRequest *)v44 setForceAlertAuthenticationUI:1];
  }
  uint64_t v48 = *MEMORY[0x1E4FA70D0];
  id v49 = [v66 objectForKey:*MEMORY[0x1E4FA70D0]];

  if (v49)
  {
    uint64_t v50 = [v66 objectForKeyedSubscript:v48];
    -[SBLockScreenUnlockRequest setConfirmedNotInPocket:](v44, "setConfirmedNotInPocket:", [v50 BOOLValue]);

    int v51 = v56;
  }
  else
  {
    char v52 = [v60 isEqualToString:v55];
    int v53 = [v60 isEqualToString:*MEMORY[0x1E4FA7090]];
    int v51 = v56;
    if ((v52 & 1) != 0 || v53) {
      [(SBLockScreenUnlockRequest *)v44 setConfirmedNotInPocket:1];
    }
  }
  id v54 = +[SBLockScreenManager sharedInstance];
  [v54 unlockWithRequest:v44 completion:v51];
}

- (void)systemService:(id)a3 isPasscodeLockedOrBlockedWithResult:(id)a4
{
  if (a4)
  {
    uint64_t v5 = (void *)SBApp;
    id v6 = a4;
    id v7 = [v5 lockOutController];
    (*((void (**)(id, uint64_t))a4 + 2))(v6, [v7 isLockedOut]);
  }
}

- (void)systemService:(id)a3 handleActions:(id)a4 origin:(id)a5 withResult:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(SBWorkspace *)self eventQueue];
  id v13 = (void *)MEMORY[0x1E4F624D8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__SBMainWorkspace_systemService_handleActions_origin_withResult___block_invoke;
  v18[3] = &unk_1E6AF5FC8;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  int v17 = [v13 eventWithName:@"FBSystemService-HandleActions" handler:v18];
  [v12 executeOrAppendEvent:v17];
}

void __65__SBMainWorkspace_systemService_handleActions_origin_withResult___block_invoke(void *a1)
{
  id v2 = +[SBActionHandler sharedInstance];
  [v2 handleActions:a1[4] origin:a1[5] withResult:a1[6]];
}

- (void)systemServicePrepareForExit:(id)a3 andRelaunch:(BOOL)a4
{
  objc_msgSend((id)SBApp, "restartManager", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 _exitIsImminent];
}

- (void)systemService:(id)a3 prepareForShutdownWithOptions:(id)a4 origin:(id)a5
{
  if (objc_msgSend(a4, "isUserInitiated", a3))
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [(id)SBApp restartManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__SBMainWorkspace_systemService_prepareForShutdownWithOptions_origin___block_invoke;
    v10[3] = &unk_1E6AF4AC0;
    dispatch_semaphore_t v11 = v5;
    id v7 = v5;
    [v6 _playShutdownSound:v10];

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    id v8 = [(id)SBApp restartManager];
    [v8 _exitIsImminent];
  }
  else
  {
    id v9 = [(id)SBApp restartManager];
    [v9 _exitIsImminent];
  }
}

intptr_t __70__SBMainWorkspace_systemService_prepareForShutdownWithOptions_origin___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)backlightController:(id)a3 didAnimateBacklightToFactor:(float)a4 source:(int64_t)a5
{
  id v7 = +[SBKeyboardFocusCoordinator sharedInstance];
  dispatch_semaphore_t v5 = +[SBKeyboardFocusArbitrationReason backlightControllerDidAnimate];
  id v6 = [v5 annotatedWithSourceName:@"SBWorkspace"];
  [v7 requestArbitrationForSBWindowScene:0 forReason:v6];
}

- (void)watchdogFired:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (BSIsBeingDebugged())
  {
    id v4 = SBLogTransaction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      dispatch_semaphore_t v5 = "Ignoring transaction watchdog while FrontBoard is being debugged.";
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }
  else
  {
    p_currentTransaction = (uint64_t *)&self->_currentTransaction;
    if ([(SBWorkspaceTransaction *)self->_currentTransaction isComplete])
    {
      id v4 = SBLogTransaction();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        dispatch_semaphore_t v5 = "Ignoring transaction watchdog because the transaction is complete.";
        goto LABEL_7;
      }
    }
    else
    {
      id v7 = (void *)*p_currentTransaction;
      id v12 = 0;
      int v8 = [v7 shouldWatchdog:&v12];
      id v4 = v12;
      if (v8)
      {
        id v9 = SBLogTransactionVerbose();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

        if (v10)
        {
          dispatch_semaphore_t v11 = SBLogTransactionVerbose();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
            -[SBMainWorkspace watchdogFired:](p_currentTransaction, v11);
          }
        }
        else
        {
          dispatch_semaphore_t v11 = SBLogTransaction();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
            -[SBMainWorkspace watchdogFired:]();
          }
        }
      }
      else
      {
        dispatch_semaphore_t v11 = SBLogTransaction();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v14 = v4;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "Ignoring transaction watchdog for reason: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (id)currentStatusBarSettingsForTransientOverlayScenePresenter:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = objc_alloc_init(SBMutableStatusBarSettings);
  id v6 = [v4 windowScene];

  id v7 = [v6 statusBarManager];

  int v8 = NSNumber;
  id v9 = [v7 assertionManager];
  char v10 = [v9 isFrontmostStatusBarHidden];
  if (v10)
  {
    double v11 = 0.0;
  }
  else
  {
    id v3 = +[SBBacklightController sharedInstance];
    int v12 = [v3 screenIsOn];
    double v11 = 0.0;
    if (v12) {
      double v11 = 1.0;
    }
  }
  id v13 = [v8 numberWithDouble:v11];
  [(SBMutableStatusBarSettings *)v5 setAlpha:v13];

  if ((v10 & 1) == 0) {
  id v14 = [v7 frontmostStatusBarStyleRequest];
  }
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F43228], "sharedInstanceForStyle:", objc_msgSend(v14, "legibilityStyle"));
  [(SBMutableStatusBarSettings *)v5 setLegibilitySettings:v15];

  -[SBMutableStatusBarSettings setStyle:](v5, "setStyle:", [v14 style]);
  return v5;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireHideAppStatusBarAssertionWithReason:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  int v8 = [a3 windowScene];
  id v9 = [v8 switcherController];
  char v10 = [v9 requestInAppStatusBarHiddenAssertionForReason:v7 animated:v5];

  return v10;
}

- (int64_t)defaultPreferredInterfaceOrientationForPresentationForTransientOverlayScenePresenter:(id)a3
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation", a3);
}

- (BOOL)defaultShouldAutorotateForTransientOverlayScenePresenter:(id)a3
{
  return objc_msgSend((id)SBApp, "homeScreenRotationStyle", a3) != 0;
}

- (BOOL)isKeyboardVisibleForSpringBoardForTransientOverlayScenePresenter:(id)a3
{
  id v3 = [a3 windowScene];
  id v4 = [v3 medusaHostedKeyboardWindowController];
  char v5 = [v4 isKeyboardVisibleForSpringBoard];

  return v5;
}

- (unint64_t)defaultSupportedInterfaceOrientationsForTransientOverlayScenePresenter:(id)a3
{
  if (!objc_msgSend((id)SBApp, "homeScreenRotationStyle", a3)) {
    return 2;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      return 30;
    }
    else {
      return 26;
    }
  }
  else
  {
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom] == 1) {
      unint64_t v3 = 30;
    }
    else {
      unint64_t v3 = 26;
    }
  }
  return v3;
}

- (void)transientOverlayScenePresenterRequestsAppIconForceTouchDismissal:(id)a3 animated:(BOOL)a4
{
  id v4 = +[SBIconController sharedInstance];
  [v4 dismissAppIconForceTouchControllers:0];
}

- (id)transientOverlayScenePresenter:(id)a3 acquireDisableAutoUnlockAssertionWithReason:(id)a4
{
  id v4 = a4;
  char v5 = +[SBLockScreenManager sharedInstanceIfExists];
  id v6 = [v5 biometricAuthenticationCoordinator];
  id v7 = [v6 acquireDisableAutoUnlockAssertionForReason:v4];

  return v7;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireProximitySensorEnabledAssertionWithReason:(id)a4
{
  id v4 = a4;
  char v5 = [(id)SBApp proximitySensorManager];
  [v5 client:v4 wantsProximityDetectionEnabled:1];

  id v6 = objc_alloc(MEMORY[0x1E4F4F838]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__SBMainWorkspace_transientOverlayScenePresenter_acquireProximitySensorEnabledAssertionWithReason___block_invoke;
  v10[3] = &unk_1E6AF4940;
  id v11 = v4;
  id v7 = v4;
  int v8 = (void *)[v6 initWithIdentifier:@"transientOverlayScenePresenterProximitySensorEnabledAssertion" forReason:v7 invalidationBlock:v10];

  return v8;
}

void __99__SBMainWorkspace_transientOverlayScenePresenter_acquireProximitySensorEnabledAssertionWithReason___block_invoke(uint64_t a1)
{
  id v2 = [(id)SBApp proximitySensorManager];
  [v2 client:*(void *)(a1 + 32) wantsProximityDetectionEnabled:0];
}

- (id)transientOverlayScenePresenter:(id)a3 acquireInteractiveScreenshotGestureDisabledAssertionWithReason:(id)a4
{
  id v4 = (void *)SBApp;
  id v5 = a4;
  id v6 = [v4 interactiveScreenshotGestureManager];
  id v7 = [v6 acquireDisableGestureAssertionWithReason:v5];

  return v7;
}

- (id)bannerLongLookPresentationObservationTokenForTransientOverlayScenePresenter:(id)a3
{
  id v3 = a3;
  id v4 = [SBNotificationLongLookBannerPresentationObservationToken alloc];
  id v5 = [(id)SBApp notificationDispatcher];
  id v6 = [v5 bannerDestination];
  id v7 = [v3 windowScene];

  int v8 = [(SBNotificationLongLookBannerPresentationObservationToken *)v4 initWithNotificationBannerDestination:v6 scene:v7];
  return v8;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireBannerLongLookWindowLevelAssertionWithReason:(id)a4 windowLevel:(double)a5
{
  id v7 = (void *)SBApp;
  id v8 = a4;
  id v9 = a3;
  char v10 = [v7 bannerManager];
  id v11 = [v9 windowScene];

  int v12 = [v10 acquireWindowLevelAssertionWithPriority:0 windowLevel:v11 windowScene:v8 reason:a5];

  return v12;
}

- (id)controlCenterPresentationObservationTokenForTransientOverlayScenePresenter:(id)a3
{
  id v3 = a3;
  id v4 = [SBControlCenterPresentationObservationToken alloc];
  id v5 = +[SBControlCenterController sharedInstance];
  id v6 = [v3 windowScene];

  id v7 = [(SBControlCenterPresentationObservationToken *)v4 initWithControlCenterController:v5 scene:v6];
  return v7;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireControlCenterWindowLevelAssertionWithReason:(id)a4 windowLevel:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[SBControlCenterController sharedInstance];
  char v10 = [v8 windowScene];

  id v11 = [v9 acquireWindowLevelAssertionWithPriority:0 windowLevel:v10 windowScene:v7 reason:a5];

  return v11;
}

- (void)transientOverlayScenePresenterRequestsControlCenterDismissal:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[SBControlCenterController sharedInstance];
  [v5 dismissAnimated:v4];
}

- (id)transientOverlayScenePresenter:(id)a3 acquireDeviceOrientationUpdateDeferralAssertionWithReason:(id)a4
{
  return (id)[(id)SBApp deviceOrientationUpdateDeferralAssertionWithReason:a4];
}

- (id)siriPresentationObservationTokenForTransientOverlayScenePresenter:(id)a3
{
  id v3 = a3;
  BOOL v4 = [SBAssistantPresentationObservationToken alloc];
  id v5 = +[SBAssistantController sharedInstance];
  id v6 = [v3 windowScene];

  id v7 = [(SBAssistantPresentationObservationToken *)v4 initWithAssistantController:v5 scene:v6];
  return v7;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireWallpaperAnimationSuspensionAssertionWithReason:(id)a4
{
  id v4 = a4;
  id v5 = +[SBWallpaperController sharedInstance];
  id v6 = [v5 suspendWallpaperAnimationForReason:v4];

  return v6;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireSiriWindowLevelAssertionWithReason:(id)a4 windowLevel:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[SBAssistantController sharedInstance];
  char v10 = [v8 windowScene];

  id v11 = [v9 acquireWindowLevelAssertionWithPriority:0 windowLevel:v10 windowScene:v7 reason:a5];

  return v11;
}

- (void)transientOverlayScenePresenterRequestsSiriDismissal:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[SBAssistantController sharedInstance];
  [v5 dismissAssistantViewInEverySceneIfNecessaryWithAnimation:v4];
}

- (id)transientOverlayScenePresenter:(id)a3 newSceneDeactivationAssertionWithReason:(int64_t)a4
{
  id v5 = +[SBSceneManagerCoordinator sharedInstance];
  id v6 = [v5 sceneDeactivationManager];
  id v7 = (void *)[v6 newAssertionWithReason:a4];

  return v7;
}

- (void)transientOverlayScenePresenter:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5
{
  BOOL v5 = a5;
  id v21 = [a3 windowScene];
  id v6 = [v21 pictureInPictureManager];
  [v6 updatePictureInPictureWindowLevels];

  id v7 = v21;
  if (v5)
  {
    id v8 = [v21 switcherController];
    id v9 = [v8 layoutStatePrimaryElement];
    char v10 = [v9 workspaceEntity];
    id v11 = [v10 applicationSceneEntity];
    int v12 = [v11 sceneHandle];

    id v13 = +[SBLockScreenManager sharedInstance];
    id v14 = [v13 lockScreenEnvironment];
    uint64_t v15 = [v14 backlightController];
    char v16 = [v15 isInScreenOffMode];

    if (v21) {
      char v17 = [v21 isMainDisplayWindowScene] ^ 1;
    }
    else {
      char v17 = 0;
    }
    if (v12) {
      char v18 = 1;
    }
    else {
      char v18 = v16;
    }
    if ((v18 & 1) == 0 && (v17 & 1) == 0)
    {
      id v19 = +[SBIdleTimerGlobalCoordinator sharedInstance];
      [v19 resetIdleTimerForReason:@"TransientOverlayDismissed"];
    }
    id v20 = +[SBMainStatusBarStateProvider sharedInstance];
    [v20 updateTimeEnabledImmediately:1];

    id v7 = v21;
  }
}

- (void)transientOverlayScenePresenter:(id)a3 preferredWhitePointAdaptivityStyleDidChangeWithAnimationSettings:(id)a4
{
  id v4 = a4;
  id v5 = +[SBSceneLayoutWhitePointAdaptationController sharedInstance];
  [v5 updateWhitePointAdaptationStrengthWithAnimationSettings:v4];
}

- (void)transientOverlayScenePresenter:(id)a3 registerCoverSheetExternalBehaviorProvider:(id)a4
{
  id v4 = a4;
  id v6 = +[SBLockScreenManager sharedInstance];
  id v5 = [v6 coverSheetViewController];
  [v5 registerExternalBehaviorProvider:v4];
}

- (void)transientOverlayScenePresenter:(id)a3 unregisterCoverSheetExternalBehaviorProvider:(id)a4
{
  id v4 = a4;
  id v6 = +[SBLockScreenManager sharedInstance];
  id v5 = [v6 coverSheetViewController];
  [v5 unregisterExternalBehaviorProvider:v4];
}

- (void)transientOverlayScenePresenter:(id)a3 willChangeTopmostViewControllerInterfaceOrientationToOrientation:(int64_t)a4
{
}

- (void)transientOverlayScenePresenter:(id)a3 willPresentViewController:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 windowScene];
  if (!v7)
  {
    char v17 = [NSString stringWithFormat:@"transient overlay presenter has unknown windowScene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBMainWorkspace transientOverlayScenePresenter:willPresentViewController:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8724830);
  }
  id v8 = (void *)v7;
  id v9 = +[SBKeyboardFocusCoordinator sharedInstance];
  char v10 = [v6 _sbWindowScene];
  id v11 = +[SBKeyboardFocusArbitrationReason willPresentTransientOverlayScene];
  [v9 requestArbitrationForSBWindowScene:v10 forReason:v11];

  [(id)SBApp frontDisplayDidChange:v6];
  int v12 = [v8 pictureInPictureManager];
  [v12 updatePictureInPictureWindowLevels];

  id v13 = +[SBMainStatusBarStateProvider sharedInstance];
  [v13 updateTimeEnabled];

  id v14 = +[SBIconController sharedInstance];
  [v14 noteTransientOverlayPresented];

  if (([v8 isContinuityDisplayWindowScene] & 1) == 0)
  {
    uint64_t v15 = [v8 lockScreenManager];
    char v18 = @"SBUIUnlockOptionsTurnOnScreenFirstKey";
    v19[0] = MEMORY[0x1E4F1CC38];
    char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v15 unlockUIFromSource:9 withOptions:v16];
  }
}

- (BOOL)transientOverlayScenePresenter:(id)a3 shouldResignFirstResponderForKeyWindow:(id)a4
{
  id v4 = a4;
  id v5 = +[SBCoverSheetPresentationManager sharedInstance];
  id v6 = [v5 coverSheetWindow];
  if (v6 == v4)
  {
    uint64_t v7 = +[SBCoverSheetPresentationManager sharedInstance];
    char v8 = [v7 isVisible];

    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v9 = +[SBAssistantController sharedInstance];
  id v10 = [v9 window];
  if (v10 == v4)
  {
    id v11 = +[SBAssistantController sharedInstance];
    char v12 = [v11 isVisible];

    if (v12) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v13 = +[SBControlCenterController sharedInstance];
  id v14 = [v13 _controlCenterWindow];
  if (v14 != v4)
  {

    goto LABEL_11;
  }
  uint64_t v15 = +[SBControlCenterController sharedInstance];
  char v16 = [v15 isVisible];

  if ((v16 & 1) == 0)
  {
LABEL_11:
    char v18 = [(id)SBApp notificationDispatcher];
    id v19 = [v18 bannerDestination];

    id v20 = [(id)SBApp bannerManager];
    id v21 = [v4 windowScene];
    uint64_t v22 = objc_opt_class();
    id v23 = v21;
    if (v22)
    {
      if (objc_opt_isKindOfClass()) {
        char v24 = v23;
      }
      else {
        char v24 = 0;
      }
    }
    else
    {
      char v24 = 0;
    }
    id v25 = v24;

    id v26 = [v20 bannerWindowInWindowScene:v25];

    if (v26 == v4)
    {
      char v27 = [v19 isPresentingBannerInLongLook];

      if (v27)
      {
        BOOL v17 = 1;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
    }
    BOOL v17 = 0;
    goto LABEL_21;
  }
LABEL_10:
  BOOL v17 = 1;
LABEL_22:

  return v17;
}

- (BOOL)transientOverlayScenePresenter:(id)a3 shouldRestoreFirstResponderForKeyWindow:(id)a4
{
  return 1;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
}

- (void)registerHandler:(id)a3 forExtensionPoint:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11 && [v6 length])
  {
    extensionHandlersByType = self->_extensionHandlersByType;
    if (!extensionHandlersByType)
    {
      char v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v9 = self->_extensionHandlersByType;
      self->_extensionHandlersByType = v8;

      extensionHandlersByType = self->_extensionHandlersByType;
    }
    id v10 = [(NSMutableDictionary *)extensionHandlersByType objectForKey:v6];

    if (!v10 && (objc_opt_respondsToSelector() & 1) != 0) {
      [(NSMutableDictionary *)self->_extensionHandlersByType setObject:v11 forKey:v6];
    }
  }
}

- (void)unregisterHandler:(id)a3 forExtensionPoint:(id)a4
{
}

- (id)_handlerForExtensionPoint:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(NSMutableDictionary *)self->_extensionHandlersByType objectForKey:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  id v4 = (void (**)(void))a4;
  id v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillSleep", v6, 2u);
  }

  _SBWorkspaceUpdateBatteryUsageTime(0);
  __SBWIsSleeping = 1;
  _SBWorkspaceNoteSleepOrWake(0);
  v4[2](v4);
}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillNotSleep", v5, 2u);
  }

  [(SBMainWorkspace *)self _noteDidWakeFromSleep];
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
  id v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillPowerOn", v4, 2u);
  }
}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  id v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Got kIOMessageSystemHasPoweredOn", v5, 2u);
  }

  [(SBMainWorkspace *)self _noteDidWakeFromSleep];
}

- (BOOL)dismissAllTransientOverlayPresentationsAnimated:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__SBMainWorkspace_dismissAllTransientOverlayPresentationsAnimated___block_invoke;
  v4[3] = &__block_descriptor_33_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
  BOOL v5 = a3;
  return [(SBMainWorkspace *)self requestTransitionWithOptions:0 builder:v4 validator:&__block_literal_global_786];
}

void __67__SBMainWorkspace_dismissAllTransientOverlayPresentationsAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEventLabelWithFormat:@"DismissAllFromLock"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__SBMainWorkspace_dismissAllTransientOverlayPresentationsAnimated___block_invoke_2;
  v4[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceTransientOverlayTransitionContext_8l;
  char v5 = *(unsigned char *)(a1 + 32);
  [v3 modifyTransientOverlayContext:v4];
}

void __67__SBMainWorkspace_dismissAllTransientOverlayPresentationsAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:1];
  [v3 setAnimated:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __67__SBMainWorkspace_dismissAllTransientOverlayPresentationsAnimated___block_invoke_3()
{
  return 1;
}

- (BOOL)dismissTransientOverlayViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:v8];
  id v11 = [v8 _fbsDisplayConfiguration];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke;
  void v16[3] = &unk_1E6AF6098;
  id v17 = v8;
  char v18 = v10;
  BOOL v20 = a4;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  LOBYTE(self) = [(SBMainWorkspace *)self requestTransitionWithOptions:0 displayConfiguration:v11 builder:v16 validator:&__block_literal_global_793];

  return (char)self;
}

void __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  [v3 setEventLabelWithFormat:@"DismissTransientOverlay = %@", v5];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_2;
  v9[3] = &unk_1E6AF6050;
  id v10 = *(id *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 56);
  id v11 = *(id *)(a1 + 32);
  [v3 modifyTransientOverlayContext:v9];
  [v3 modifyApplicationContext:&__block_literal_global_791];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_4;
  v7[3] = &unk_1E6AF5A50;
  id v8 = *(id *)(a1 + 48);
  id v6 = (id)[v3 addCompletionHandler:v7];
}

void __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:1];
  [v3 setTransientOverlay:*(void *)(a1 + 32)];
  [v3 setAnimated:*(unsigned __int8 *)(a1 + 48)];
  objc_msgSend(v3, "setShouldPreserveAppSwitcher:", objc_msgSend(*(id *)(a1 + 40), "preservesAppSwitcherDuringPresentationAndDismissal"));
}

uint64_t __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setWaitsForSceneUpdates:0];
}

uint64_t __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_5()
{
  return 1;
}

- (BOOL)presentTransientOverlayViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:v8];
  if ([v8 prefersContinuityDisplayPresentation]
    && +[SBContinuitySessionManager areContinuitySessionsAllowed])
  {
    id v11 = +[SBContinuitySessionManager sharedInstance];
    char v12 = [v11 currentSession];

    if ([v12 state] == 10)
    {
      id v13 = [v12 mainWindowScene];
      id v14 = [v13 _fbsDisplayConfiguration];

      if (v14) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if (![v8 prefersEmbeddedDisplayPresentation]
    || ([(SBMainWorkspace *)self mainWindowScene],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        [v15 _fbsDisplayConfiguration],
        id v14 = objc_claimAutoreleasedReturnValue(),
        v15,
        !v14))
  {
    id v14 = [(SBTransientOverlayPresentationManager *)self->_transientOverlayPresentationManager defaultDisplayConfigurationForTransientOverlayPresentation];
  }
LABEL_10:
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke;
  v21[3] = &unk_1E6AF6098;
  id v22 = v8;
  id v23 = v10;
  BOOL v25 = a4;
  id v24 = v9;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  BOOL v19 = [(SBMainWorkspace *)self requestTransitionWithOptions:0 displayConfiguration:v14 builder:v21 validator:&__block_literal_global_800];

  return v19;
}

void __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  [v3 setEventLabelWithFormat:@"PresentTransientOverlay = %@", v5];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_2;
  v9[3] = &unk_1E6AF6050;
  id v10 = *(id *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 56);
  id v11 = *(id *)(a1 + 32);
  [v3 modifyTransientOverlayContext:v9];
  [v3 modifyApplicationContext:&__block_literal_global_798];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_4;
  v7[3] = &unk_1E6AF5A50;
  id v8 = *(id *)(a1 + 48);
  id v6 = (id)[v3 addCompletionHandler:v7];
}

void __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:0];
  [v3 setTransientOverlay:*(void *)(a1 + 32)];
  [v3 setAnimated:*(unsigned __int8 *)(a1 + 48)];
  objc_msgSend(v3, "setShouldPreserveAppSwitcher:", objc_msgSend(*(id *)(a1 + 40), "preservesAppSwitcherDuringPresentationAndDismissal"));
  objc_msgSend(v3, "setShouldDismissSiriUponPresentation:", objc_msgSend(*(id *)(a1 + 40), "dismissesSiriForPresentation"));
}

uint64_t __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setWaitsForSceneUpdates:0];
}

uint64_t __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_5()
{
  return 1;
}

- (SBHardwareButtonZStackClient)zStackHardwareButtonClient
{
  return self->_zStackHardwareButtonClient;
}

- (SBInCallTransientOverlayManager)inCallTransientOverlayManager
{
  return self->_inCallTransientOverlayManager;
}

- (SBUniversalControlServer)universalControlServer
{
  return self->_universalControlServer;
}

- (SBKeyboardDismissalManager)keyboardDismissalManager
{
  return self->_keyboardDismissalManager;
}

- (SBSystemNotesManager)systemNotesManager
{
  return self->_systemNotesManager;
}

- (SBWindowScene)mainWindowScene
{
  return self->_mainWindowScene;
}

- (void)setMainWindowScene:(id)a3
{
}

- (FBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_pipCoordinator, 0);
  objc_storeStrong((id *)&self->_mainWindowScene, 0);
  objc_storeStrong((id *)&self->_inCallPresentationManager, 0);
  objc_storeStrong((id *)&self->_keyboardDismissalManager, 0);
  objc_storeStrong((id *)&self->_transientOverlayPresentationManager, 0);
  objc_storeStrong((id *)&self->_inCallTransientOverlayManager, 0);
  objc_storeStrong((id *)&self->_zStackHardwareButtonClient, 0);
  objc_storeStrong((id *)&self->_activeIdleTimerProvider, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigurationManager, 0);
  objc_storeStrong((id *)&self->_focusModesHomeScreenSnapshotManager, 0);
  objc_storeStrong((id *)&self->_systemNotesManager, 0);
  objc_storeStrong((id *)&self->_lockKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardFocusCoordinator, 0);
  objc_storeStrong((id *)&self->_universalControlServer, 0);
  objc_storeStrong((id *)&self->_ocelotRepairRequests, 0);
  objc_storeStrong((id *)&self->_presentedControlCenterModuleTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_powerDownLongPressDurationAssertion, 0);
  objc_storeStrong((id *)&self->_powerDownViewController, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_activeSuspendedWorkspaceTransitions, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_extensionHandlersByType, 0);
  objc_storeStrong((id *)&self->_transactionWatchdog, 0);
  objc_storeStrong((id *)&self->_currentTransactionLock, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_orientationAggdLogger, 0);
  objc_storeStrong((id *)&self->_suspensionLock, 0);
}

- (void)createRequestWithOptions:displayConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "Using workspace transition option \"do not dismiss Siri\" because no Siri dismissal option was specified and SAE is enabled", v1, 2u);
}

- (void)createRequestWithOptions:displayConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "Using workspace transition option \"dismiss Siri\" because no Siri dismissal option was specified and SAE is disabled", v1, 2u);
}

- (void)_transactionForTransitionRequest:.cold.1()
{
  OUTLINED_FUNCTION_9();
  id v1 = [MEMORY[0x1E4F4F718] descriptionForObject:v0];
  id v2 = [v0 transitionRequest];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "Prepared %{public}@ for transition request:\n%{public}@", v5, v6, v7, v8, v9);
}

- (void)_canExecuteTransitionRequest:(void *)a1 forExecution:.cold.1(void *a1)
{
  id v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "Application scene '%{public}@' cannot be launched because it has been uninstalled.", v4, v5, v6, v7, v8);
}

- (void)_canExecuteTransitionRequest:(void *)a1 forExecution:.cold.2(void *a1)
{
  id v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "Application scene '%{public}@' cannot be launched because it has outstanding termination assertions.", v4, v5, v6, v7, v8);
}

- (void)setCurrentTransaction:.cold.1()
{
  OUTLINED_FUNCTION_9();
  id v1 = [MEMORY[0x1E4F4F718] descriptionForObject:v0];
  uint64_t v2 = [v0 transitionRequest];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "Running %{public}@ for transition request:\n%{public}@", v5, v6, v7, v8, v9);
}

- (void)_preflightTransitionRequest:(void *)a3 forExecution:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 uniqueIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1D85BA000, a4, OS_LOG_TYPE_ERROR, "Attempted to launch an untrusted application scene %{public}@", a1, 0xCu);
}

void __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_cold_1(id *a1)
{
  id v1 = [*a1 bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "An application that SpringBoard is not tracking with bundle identifier %{public}@ just exited.", v4, v5, v6, v7, v8);
}

- (void)_updateActivationSettings:forRequestWithOptions:clientProcess:application:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_handleOpenApplicationRequest:options:activationSettings:origin:withResult:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_handleOpenApplicationRequest:options:activationSettings:origin:withResult:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_ERROR, "Trying to launch an app clip, but no webClipIdentifier found. Falling back to default application launch path", v1, 2u);
}

- (void)_handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_handleTrustedOpenRequestForApplication:(uint64_t)a1 options:activationSettings:origin:withResult:.cold.3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithUTF8String:"-[SBMainWorkspace _handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:]"];
  int v3 = 138544130;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = @"SBWorkspace.m";
  __int16 v7 = 1024;
  int v8 = 5263;
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);
}

- (void)_handleUntrustedOpenRequestForApplication:options:activationSettings:origin:withResult:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_handleUntrustedOpenRequestForApplication:options:activationSettings:origin:withResult:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_handleUserActionRequest:options:activationSettings:origin:withResult:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_handleUserActionRequest:options:activationSettings:origin:withResult:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)watchdogFired:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_FAULT, "Transaction watchdog fired: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)watchdogFired:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  _os_log_fault_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_FAULT, "Transaction watchdog fired. Asking for state capture info.", v1, 2u);
}

- (void)transactionDidComplete:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "Root transaction failed: %{public}@. Attempting to force us back to SB...", v1, 0xCu);
}

- (void)transactionDidComplete:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "Root transaction complete: %{public}@", v1, 0xCu);
}

- (void)transientOverlayScenePresenter:willPresentViewController:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  int v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end