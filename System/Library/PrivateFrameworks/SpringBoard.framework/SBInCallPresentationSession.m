@interface SBInCallPresentationSession
- (BOOL)_allowsInitiallyDismissedPresentation;
- (BOOL)_allowsNonModalPresentation;
- (BOOL)_hasExistingSceneSettingsPresentationModeForLayoutState:(id)a3;
- (BOOL)_isAmbientPresentationActive;
- (BOOL)_isCallConnectedForScene;
- (BOOL)_isDismissedForLayoutState:(id)a3;
- (BOOL)_isInSwitcherModel;
- (BOOL)_isProximityReaderPresented;
- (BOOL)_isShowingFullScreenForLayoutState:(id)a3;
- (BOOL)_isShowingInPIP;
- (BOOL)_isValidForSceneUpdates;
- (BOOL)_sceneSupportsHandlingDeviceLock;
- (BOOL)_shouldConsiderScenePrimaryForLayoutState:(id)a3;
- (BOOL)_shouldExcludeFromSwitcherWhenDismissed;
- (BOOL)_shouldUseTransientOverlayForFullScreenPresentation;
- (BOOL)_systemControlsShouldPresentAsEmbeddedForLayoutState:(id)a3;
- (BOOL)areNonModalPresentationsSuppressed;
- (BOOL)canHostAnApp;
- (BOOL)disablesSystemVolumeHUDForCategory:(id)a3;
- (BOOL)disallowsLockHardwareButtonDoublePress;
- (BOOL)handleAccessoryAttachWithCompletion:(id)a3;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)inCallTransientOverlayViewControllerShouldPreventBannerPresentations:(id)a3;
- (BOOL)inCallTransientOverlayViewControllerShouldSupportAlwaysOnDisplay:(id)a3;
- (BOOL)isFullscreenCallInSwitcher;
- (BOOL)isHostingAnApp;
- (BOOL)isShowingOnEmbeddedDisplay;
- (BOOL)sceneHandle:(id)a3 didReceiveAction:(id)a4;
- (BOOL)shouldIgnoreHomeIndicatorAutoHiddenClientSettings;
- (BOOL)supportsBecomingVisibleWhenUnlockingFromSource:(int)a3 wakingDisplay:(BOOL)a4;
- (BOOL)supportsHandlingDeviceLock;
- (CGRect)_presentedBannerBoundsInWindowScene:(id)a3;
- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4;
- (NSString)description;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (SBInCallPresentationSession)initWithSceneHandle:(id)a3 workspace:(id)a4 bannerManager:(id)a5 lockScreenManager:(id)a6 deactivationManager:(id)a7 mainSwitcherCoordinator:(id)a8 backlightController:(id)a9 keyboardFocusController:(id)a10 springBoard:(id)a11 setupManager:(id)a12 uiController:(id)a13 pipCoordinator:(id)a14 lockoutStateProvider:(id)a15;
- (SBInCallPresentationSessionDelegate)delegate;
- (SBWindowScene)windowScene;
- (UIEdgeInsets)preferredPIPDodgingInsets;
- (double)preferredBannerHeight;
- (id)_acquireAssertionForAnalyticsSource:(id)a3;
- (id)_clientSettingsIfExists;
- (id)_createTransientOverlayViewController;
- (id)_inCallSceneClientSettingsDiffInspector;
- (id)_sceneManager;
- (id)_screen;
- (id)bannerUnfurlSourceContextForTransitionRequest:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
- (id)overrideAppSceneEntityForLaunchingApplication:(id)a3;
- (id)previousLayoutStateForApplicationTransitionContext:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_currentPresentationModeForLayoutState:(id)a3;
- (int64_t)sceneElement:(id)a3 decisionForLaunchActionOfAppWithBundleIdentifier:(id)a4 persistenceIdentifier:(id)a5;
- (unint64_t)_incrementPresentationModeRevisionIDWithReason:(id)a3;
- (void)_activeJindoElementIfNeeded;
- (void)_addSystemAnimationDeactivationReason:(id)a3;
- (void)_addSystemGestureDeactivationReason:(id)a3;
- (void)_appendToMutableInCallSceneSettings:(id)a3 presentationMode:(int64_t)a4 shouldPresentAsEmbedded:(BOOL)a5;
- (void)_configureTransitionRequest:(id)a3 forPresentingTransientOverlay:(id)a4 animated:(BOOL)a5;
- (void)_createJindoElement;
- (void)_createJindoElementIfNeeded;
- (void)_destroySceneEntityIfExists;
- (void)_dispatchBlockToMainEventQueueWithReason:(id)a3 block:(id)a4;
- (void)_handleRequestInCallPresentationModeAction:(id)a3;
- (void)_handleTransitionToSceneHandle:(id)a3 sceneManager:(id)a4;
- (void)_insertIntoSwitcherAsDismissedWithAnalyticsSource:(id)a3 transitionValidator:(id)a4 completion:(id)a5;
- (void)_invalidateJindoElementIfNeeded;
- (void)_notifySceneOfDeviceLockFromSource:(int)a3 completion:(id)a4;
- (void)_performBannerDismissalTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5;
- (void)_performBannerPresentationTransitionWithAnalyticsSource:(id)a3 completion:(id)a4;
- (void)_performBannerToFullScreenPresentationTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5;
- (void)_performBannerToTransientOverlayPresentationTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5;
- (void)_performBlockUsingMainEventQueueWithReason:(id)a3 handler:(id)a4;
- (void)_performPresentationWithRequestedPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4 animated:(BOOL)a5 analyticsSource:(id)a6 completion:(id)a7;
- (void)_performSceneUpdateTransactionWithContext:(id)a3;
- (void)_performSwitcherDismissalTransitionAnimated:(BOOL)a3 shouldDestroyScene:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6;
- (void)_performSwitcherPresentationTransitionAnimated:(BOOL)a3 isUserInitiated:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6;
- (void)_performTransientOverlayDismissalTransitionAnimated:(BOOL)a3 shouldInsertIntoSwitcherModel:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6;
- (void)_performTransientOverlayPresentationTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5;
- (void)_prepareForTransientOverlayPresentationTransactionWithAnimation:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5;
- (void)_presentWithRequestedConfiguration:(id)a3 animated:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6;
- (void)_removeFromSwitcherForPrefersHiddenWhenDismissedWithValidator:(id)a3;
- (void)_removeSystemAnimationDeactivationReason:(id)a3;
- (void)_removeSystemGestureDeactivationReason:(id)a3;
- (void)_sendShowNoticeForSystemControlsActionIfNeeded;
- (void)_setNonModalPresentationActive:(BOOL)a3;
- (void)_setTransientOverlayPresentationActive:(BOOL)a3;
- (void)_uiLockStateDidChange:(id)a3;
- (void)_updateAmbientPresentationSettingsForInCallSettings:(id)a3;
- (void)_updateAppStatusBarSettingsAssertionForLayoutState:(id)a3;
- (void)_updateKeyboardFocusPreventionAssertionWithLayoutState:(id)a3;
- (void)_updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:(int64_t)a3 shouldConsiderPrimary:(BOOL)a4;
- (void)_updateSceneDeactivationAssertions;
- (void)_updateSceneHandleToObserveForSendingShowNoticeForSystemControlsAction:(id)a3;
- (void)_updateSceneSettingsForAmbientPresentationSettingsUpdate;
- (void)_updateSystemControlsShouldPresentAsEmbedded;
- (void)_updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:(id)a3;
- (void)_windowedAccessoryDidAttachOrDetach:(id)a3;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)applicationSceneHandle:(id)a3 appendToSceneSettings:(id)a4 fromRequestContext:(id)a5 entity:(id)a6;
- (void)applicationSceneHandle:(id)a3 appendToTransitionContext:(id)a4 fromRequestContext:(id)a5 entity:(id)a6;
- (void)dismissAndFinalizeSceneDestructionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5;
- (void)dismissAnimated:(BOOL)a3 shouldFinalizeSceneDestruction:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6;
- (void)ensureInclusionInSwitcherForRestoreFromPIPWithCompletion:(id)a3;
- (void)handleDeviceLockFromSource:(int)a3 completion:(id)a4;
- (void)handleRingerButtonDown;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)inCallBannerPresentableViewController:(id)a3 didDisappearWithReason:(id)a4;
- (void)inCallBannerPresentableViewController:(id)a3 viewWillTransitionSizeWithAnimationSettings:(id)a4;
- (void)inCallBannerPresentableViewController:(id)a3 willDisappearWithReason:(id)a4;
- (void)inCallBannerPresentableViewControllerCallConnectedStatusChanged:(id)a3;
- (void)inCallBannerPresentableViewControllerDidAppear:(id)a3;
- (void)inCallBannerPresentableViewControllerDidCrossDefaultDraggingThreshold:(id)a3;
- (void)inCallBannerPresentableViewControllerDidReceiveTap:(id)a3;
- (void)inCallBannerPresentableViewControllerUserInteractionDidEnd:(id)a3;
- (void)inCallBannerPresentableViewControllerUserInteractionWillBegin:(id)a3;
- (void)inCallBannerPresentableViewControllerWillAppear:(id)a3;
- (void)inCallTransientOverlayViewController:(id)a3 didAppearAnimated:(BOOL)a4;
- (void)inCallTransientOverlayViewController:(id)a3 didDisappearAnimated:(BOOL)a4;
- (void)inCallTransientOverlayViewController:(id)a3 viewWillTransitionSizeWithAnimationSettings:(id)a4;
- (void)inCallTransientOverlayViewController:(id)a3 willAppearAnimated:(BOOL)a4;
- (void)inCallTransientOverlayViewController:(id)a3 willDisappearAnimated:(BOOL)a4;
- (void)inCallTransientOverlayViewControllerDidUpdateAmbientPresentationIsAmbientPresented:(BOOL)a3 ambientDisplayStyle:(int64_t)a4;
- (void)inCallTransientOverlayViewControllerRequestsDismissal:(id)a3;
- (void)invalidate;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)presentWithRequestedConfiguration:(id)a3 animated:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)sceneHandle:(id)a3 didMoveFromSceneManager:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5;
- (void)sceneHandle:(id)a3 replacedWithSceneHandle:(id)a4;
- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setNonModalPresentationsSuppressed:(BOOL)a3;
- (void)setPreferredBannerHeight:(double)a3;
- (void)setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:(BOOL)a3;
- (void)transitionToSceneHandleIfNeeded:(id)a3;
- (void)transitionToSceneManagerIfNeeded:(id)a3;
@end

@implementation SBInCallPresentationSession

- (SBInCallPresentationSession)initWithSceneHandle:(id)a3 workspace:(id)a4 bannerManager:(id)a5 lockScreenManager:(id)a6 deactivationManager:(id)a7 mainSwitcherCoordinator:(id)a8 backlightController:(id)a9 keyboardFocusController:(id)a10 springBoard:(id)a11 setupManager:(id)a12 uiController:(id)a13 pipCoordinator:(id)a14 lockoutStateProvider:(id)a15
{
  id v20 = a3;
  id v51 = a4;
  id v40 = a5;
  id v21 = a5;
  v22 = v20;
  id v50 = v21;
  id v41 = a6;
  id v49 = a6;
  id v48 = a7;
  id v53 = a8;
  id v47 = a9;
  id v46 = a10;
  id v45 = a11;
  id v44 = a12;
  id v54 = a13;
  id v43 = a14;
  id v42 = a15;
  v57.receiver = self;
  v57.super_class = (Class)SBInCallPresentationSession;
  v23 = [(SBInCallPresentationSession *)&v57 init];
  v24 = v23;
  if (v23)
  {
    [(SBInCallPresentationSession *)v23 transitionToSceneHandleIfNeeded:v20];
    objc_storeStrong((id *)&v24->_workspace, a4);
    objc_storeStrong((id *)&v24->_springBoard, a11);
    objc_storeStrong((id *)&v24->_bannerManager, v40);
    objc_storeStrong((id *)&v24->_lockScreenManager, v41);
    objc_storeStrong((id *)&v24->_deactivationManager, a7);
    objc_storeStrong((id *)&v24->_mainSwitcherCoordinator, a8);
    objc_storeStrong((id *)&v24->_backlightController, a9);
    objc_storeStrong((id *)&v24->_keyboardFocusCoordinator, a10);
    objc_storeStrong((id *)&v24->_setupManager, a12);
    objc_storeStrong((id *)&v24->_pipControllerCoordinator, a14);
    objc_storeStrong((id *)&v24->_lockoutStateProvider, a15);
    id v25 = objc_alloc(MEMORY[0x1E4F4F740]);
    v26 = NSString;
    v27 = [(SBDeviceApplicationSceneHandle *)v24->_sceneHandle sceneIdentifier];
    v28 = [v26 stringWithFormat:@"SBInCallPresentationSession-%@", v27];
    uint64_t v29 = [v25 initWithName:v28 onQueue:MEMORY[0x1E4F14428]];
    localEventQueue = v24->_localEventQueue;
    v24->_localEventQueue = (BSEventQueue *)v29;

    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v32 = [(SBApplicationSceneHandle *)v24->_sceneHandle application];
    v33 = [(SBDeviceApplicationSceneHandle *)v24->_sceneHandle sceneIdentifier];
    v34 = [NSString stringWithFormat:@"SBInCallPresentationSession - %@", v33];
    if (v32)
    {
      v35 = [v32 bundleIdentifier];
      uint64_t v36 = [v53 acquireAllowHiddenAppAssertionForBundleIdentifier:v35 reason:v34];
      allowHiddenAppAssertion = v24->_allowHiddenAppAssertion;
      v24->_allowHiddenAppAssertion = (BSInvalidatable *)v36;
    }
    [v31 addObserver:v24 selector:sel__uiLockStateDidChange_ name:*MEMORY[0x1E4FA7A38] object:0];
    [(SpringBoard *)v24->_springBoard addActiveOrientationObserver:v24];
    objc_storeStrong((id *)&v24->_uiController, a13);
    v24->_isAttachedToWindowedAccessory = [(SBUIController *)v24->_uiController isConnectedToWindowedAccessory];
    [v31 addObserver:v24 selector:sel__windowedAccessoryDidAttachOrDetach_ name:@"SBUIWindowedAccessoryDidAttachOrDetachNotification" object:v54];
    objc_initWeak(&location, v24);
    objc_copyWeak(&v55, &location);
    id v38 = (id)BSLogAddStateCaptureBlockWithTitle();

    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);

    v22 = v20;
  }

  return v24;
}

id __255__SBInCallPresentationSession_initWithSceneHandle_workspace_bannerManager_lockScreenManager_deactivationManager_mainSwitcherCoordinator_backlightController_keyboardFocusController_springBoard_setupManager_uiController_pipCoordinator_lockoutStateProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)transitionToSceneManagerIfNeeded:(id)a3
{
}

- (void)transitionToSceneHandleIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sceneManager];
  [(SBInCallPresentationSession *)self _handleTransitionToSceneHandle:v4 sceneManager:v5];
}

- (void)_handleTransitionToSceneHandle:(id)a3 sceneManager:(id)a4
{
  v7 = (SBDeviceApplicationSceneHandle *)a3;
  v8 = self->_sceneHandle;
  id v9 = a4;
  id v10 = [(SBInCallPresentationSession *)self _sceneManager];

  if (v8 != v7 || v10 != v9)
  {
    objc_super v57 = [(SBInCallPresentationSession *)self delegate];
    if (v8 && v8 != v7)
    {
      v12 = [(SBDeviceApplicationSceneHandle *)v7 sceneIfExists];
      v13 = [(SBDeviceApplicationSceneHandle *)v8 sceneIfExists];

      if (v12 != v13)
      {
        v14 = SBLogInCallPresentation();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[SBInCallPresentationSession _handleTransitionToSceneHandle:sceneManager:](v14, v15, v16, v17, v18, v19, v20, v21);
        }
      }
      [(SBApplicationSceneHandle *)v8 removeSceneUpdateContributer:self];
      [(SBDeviceApplicationSceneHandle *)v8 removeActionConsumer:self];
      [(SBDeviceApplicationSceneHandle *)v8 removeObserver:self];
      v22 = [(SBDeviceApplicationSceneHandle *)v8 statusBarStateProvider];
      [v22 removeStatusBarObserver:self];
    }
    if (v10 != v9)
    {
      v23 = [(SBInCallPresentationSession *)self _sceneManager];
      v24 = [v23 _layoutStateTransitionCoordinator];

      [v24 removeObserver:self];
      [(BSInvalidatable *)self->_ignoreSuspendedUnderLockAssertion invalidate];
      ignoreSuspendedUnderLockAssertion = self->_ignoreSuspendedUnderLockAssertion;
      self->_ignoreSuspendedUnderLockAssertion = 0;
    }
    objc_storeStrong((id *)&self->_sceneHandle, a3);
    v26 = [(id)SBApp windowSceneManager];
    v27 = [(SBDeviceApplicationSceneHandle *)v7 displayIdentity];
    v28 = [v26 windowSceneForDisplayIdentity:v27];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    char v54 = [WeakRetained isMainDisplayWindowScene];
    char v53 = [v28 isMainDisplayWindowScene];
    v56 = v28;
    objc_storeWeak((id *)&self->_windowScene, v28);
    if (v8 != v7)
    {
      [(SBApplicationSceneHandle *)self->_sceneHandle addSceneUpdateContributer:self];
      [(SBDeviceApplicationSceneHandle *)self->_sceneHandle addActionConsumer:self];
      [(SBDeviceApplicationSceneHandle *)self->_sceneHandle addObserver:self];
      uint64_t v29 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle statusBarStateProvider];
      [v29 addStatusBarObserver:self];
    }
    v30 = [(SBInCallPresentationSession *)self _sceneManager];
    v31 = [v30 _layoutStateTransitionCoordinator];

    [v31 addObserver:self];
    v32 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIdentifier];
    if (v32)
    {
      if (!self->_ignoreSuspendedUnderLockAssertion)
      {
        v33 = [(SBInCallPresentationSession *)self _sceneManager];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v35 = [NSString stringWithFormat:@"SBInCallPresentationSession - %@", v32];
          uint64_t v36 = [(SBInCallPresentationSession *)self _sceneManager];
          v37 = [v36 acquireIgnoreSuspendedUnderLockAssertionForSceneIdentifier:v32 reason:v35];
          id v38 = self->_ignoreSuspendedUnderLockAssertion;
          self->_ignoreSuspendedUnderLockAssertion = v37;
        }
      }
    }
    v39 = [SBInCallPresentationSceneUpdateContext alloc];
    id v40 = [(SBInCallPresentationSession *)self _screen];
    id v41 = [v40 fixedCoordinateSpace];
    [v41 bounds];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    uint64_t v50 = *MEMORY[0x1E4FA7E30];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __75__SBInCallPresentationSession__handleTransitionToSceneHandle_sceneManager___block_invoke;
    v59[3] = &unk_1E6AFF350;
    char v62 = v54;
    char v63 = v53;
    id v60 = v57;
    v61 = self;
    id v51 = v57;
    v52 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v39, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v50, v59, v43, v45, v47, v49);

    [(SBInCallPresentationSceneUpdateContext *)v52 setExecutionTarget:1];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __75__SBInCallPresentationSession__handleTransitionToSceneHandle_sceneManager___block_invoke_3;
    v58[3] = &unk_1E6AFBD00;
    v58[4] = self;
    [(SBInCallPresentationSceneUpdateContext *)v52 setValidatorHandler:v58];
    [(SBInCallPresentationSession *)self _performSceneUpdateTransactionWithContext:v52];
  }
}

void __75__SBInCallPresentationSession__handleTransitionToSceneHandle_sceneManager___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__SBInCallPresentationSession__handleTransitionToSceneHandle_sceneManager___block_invoke_2;
  v7[3] = &unk_1E6AFF328;
  __int16 v10 = *(_WORD *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = (id)[a2 addCompletionHandler:v7];
}

uint64_t __75__SBInCallPresentationSession__handleTransitionToSceneHandle_sceneManager___block_invoke_2(uint64_t result)
{
  if (*(unsigned __int8 *)(result + 48) != *(unsigned __int8 *)(result + 49)) {
    return [*(id *)(result + 32) inCallClientPresentationSessionInvalidateBacklightEnvironment:*(void *)(result + 40)];
  }
  return result;
}

uint64_t __75__SBInCallPresentationSession__handleTransitionToSceneHandle_sceneManager___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 applicationContext];
  id v4 = [v3 layoutState];
  uint64_t v5 = [v2 _hasExistingSceneSettingsPresentationModeForLayoutState:v4] ^ 1;

  return v5;
}

- (NSString)description
{
  return (NSString *)[(SBInCallPresentationSession *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBInCallPresentationSession *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBInCallPresentationSession *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBInCallPresentationSession *)self succinctDescriptionBuilder];
  BOOL v6 = self->_systemGestureSceneDeactivationAssertion != 0;
  BOOL v7 = self->_systemAnimationSceneDeactivationAssertion != 0;
  id v8 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__SBInCallPresentationSession_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E6AFDD40;
  id v9 = v5;
  id v13 = v9;
  v14 = self;
  BOOL v15 = v6;
  BOOL v16 = v7;
  [v9 appendBodySectionWithName:v8 multilinePrefix:v4 block:v12];

  id v10 = v9;
  return v10;
}

id __69__SBInCallPresentationSession_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(*(void *)(a1 + 40) + 384) persistenceIdentifier];
  [v2 appendString:v3 withName:@"_sceneHandle.persistenceIdentifier"];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 312) UUIDString];
  [v4 appendString:v5 withName:@"_requestedPresentationConfigurationIdentifier"];

  id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 208) withName:@"_isInvalidated" ifEqualTo:1];
  id v7 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 91) withName:@"hasReceivedFinalizeSceneDestructionRequest" ifEqualTo:1];
  id v8 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 210) withName:@"_isTransientOverlayPresentationActive" ifEqualTo:1];
  id v9 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 209) withName:@"_isNonModalPresentationActive" ifEqualTo:1];
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = *(unsigned char *)(a1 + 49) == 0;
  }
  id v11 = (id)[*(id *)(a1 + 32) appendBool:v10 withName:@"No deactivation assertions" ifEqualTo:1];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = (id)[*(id *)(a1 + 32) appendObject:v12 withName:@"System Gesture Deactivation Reasons"];
  if (*(unsigned char *)(a1 + 49)) {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 16);
  }
  else {
    uint64_t v14 = 0;
  }
  return (id)[*(id *)(a1 + 32) appendObject:v14 withName:@"System Animation Deactivation Reasons"];
}

- (void)invalidate
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_isInvalidated)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"SBInCallPresentationSession.m" lineNumber:351 description:@"Attempting to -invalidate twice; this is unsupported."];
  }
  self->_isInvalidated = 1;
  [(SBInCallPresentationSession *)self _invalidateJindoElementIfNeeded];
  [(SpringBoard *)self->_springBoard removeActiveOrientationObserver:self];
  [(SBInCallBannerPresentableViewController *)self->_bannerPresentableViewController invalidate];
  bannerPresentableViewController = self->_bannerPresentableViewController;
  self->_bannerPresentableViewController = 0;

  [(SBInCallTransientOverlayViewController *)self->_transientOverlayViewController invalidate];
  transientOverlayViewController = self->_transientOverlayViewController;
  self->_transientOverlayViewController = 0;

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4FA7A38] object:0];
  [v5 removeObserver:self name:@"SBUIWindowedAccessoryDidAttachOrDetachNotification" object:self->_uiController];
  [(BSInvalidatable *)self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion invalidate];
  suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion = self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion;
  self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion = 0;

  [(BSInvalidatable *)self->_ignoreSuspendedUnderLockAssertion invalidate];
  ignoreSuspendedUnderLockAssertion = self->_ignoreSuspendedUnderLockAssertion;
  self->_ignoreSuspendedUnderLockAssertion = 0;

  [(SBApplicationSceneHandle *)self->_sceneHandle removeSceneUpdateContributer:self];
  [(SBDeviceApplicationSceneHandle *)self->_sceneHandle removeActionConsumer:self];
  [(SBDeviceApplicationSceneHandle *)self->_sceneHandle removeObserver:self];
  id v8 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle statusBarStateProvider];
  [v8 removeStatusBarObserver:self];

  [(BSInvalidatable *)self->_allowHiddenAppAssertion invalidate];
  allowHiddenAppAssertion = self->_allowHiddenAppAssertion;
  self->_allowHiddenAppAssertion = 0;

  [(SBWindowSceneStatusBarSettingsAssertion *)self->_appStatusBarSettingsAssertion invalidate];
  appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
  self->_appStatusBarSettingsAssertion = 0;

  [(BSInvalidatable *)self->_preventKeyboardFocusAssertion invalidate];
  preventKeyboardFocusAssertion = self->_preventKeyboardFocusAssertion;
  self->_preventKeyboardFocusAssertion = 0;

  [(BSInvalidatable *)self->_hideSharePlayContentFromClonedDisplayAssertion invalidate];
  hideSharePlayContentFromClonedDisplayAssertion = self->_hideSharePlayContentFromClonedDisplayAssertion;
  self->_hideSharePlayContentFromClonedDisplayAssertion = 0;

  id v13 = [(SBInCallPresentationSession *)self _sceneManager];
  uint64_t v14 = [v13 _layoutStateTransitionCoordinator];

  [v14 removeObserver:self];
  BOOL v15 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIdentifier];
  if (v15)
  {
    BOOL v16 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
    uint64_t v17 = [v16 _dataStore];
    [v17 removeSceneStoreForIdentifier:v15];
  }
  uint64_t v18 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  [v18 removeObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v20 = [WeakRetained layoutStateProvider];
  uint64_t v21 = [v20 layoutState];
  [(SBInCallPresentationSession *)self _updateAppStatusBarSettingsAssertionForLayoutState:v21];

  [(SBInCallPresentationSession *)self _updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:0 shouldConsiderPrimary:0];
  v22 = SBLogInCallPresentation();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543362;
    v26 = self;
    _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Invalidated: %{public}@", (uint8_t *)&v25, 0xCu);
  }
}

- (BOOL)canHostAnApp
{
  return 1;
}

- (BOOL)isHostingAnApp
{
  return 1;
}

- (id)hostedAppSceneHandle
{
  if ([(SBInCallPresentationSession *)self isHostingAnApp]) {
    sceneHandle = self->_sceneHandle;
  }
  else {
    sceneHandle = 0;
  }
  return sceneHandle;
}

- (id)hostedAppSceneHandles
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(SBInCallPresentationSession *)self isHostingAnApp])
  {
    v5[0] = self->_sceneHandle;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBInCallPresentationSession.m", 430, @"%@ should never be called", v5 object file lineNumber description];
}

- (void)setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:(BOOL)a3
{
  self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings = a3;
  -[SBInCallTransientOverlayViewController setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:](self->_transientOverlayViewController, "setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:");
}

- (void)applicationSceneHandle:(id)a3 appendToSceneSettings:(id)a4 fromRequestContext:(id)a5 entity:(id)a6
{
  id v9 = a4;
  if (self->_sceneHandle == a3)
  {
    id v15 = v9;
    id v10 = a5;
    id v11 = [v10 layoutState];
    int64_t v12 = [(SBInCallPresentationSession *)self _currentPresentationModeForLayoutState:v11];

    id v13 = [v10 layoutState];

    BOOL v14 = [(SBInCallPresentationSession *)self _systemControlsShouldPresentAsEmbeddedForLayoutState:v13];
    [(SBInCallPresentationSession *)self _appendToMutableInCallSceneSettings:v15 presentationMode:v12 shouldPresentAsEmbedded:v14];
    id v9 = v15;
  }
}

- (void)_appendToMutableInCallSceneSettings:(id)a3 presentationMode:(int64_t)a4 shouldPresentAsEmbedded:(BOOL)a5
{
  BOOL v5 = a5;
  *(void *)&v27[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = SBLogInCallPresentation();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = SBSInCallPresentationModeDescription();
    *(_DWORD *)buf = 138543362;
    *(void *)uint64_t v27 = v10;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Setting presentation mode on scene settings: %{public}@", buf, 0xCu);
  }
  [v8 setInterruptionPolicy:3];
  [v8 setInCallPresentationMode:a4];
  if (a4) {
    BOOL v11 = [(SBLockScreenManager *)self->_lockScreenManager isUILocked];
  }
  else {
    BOOL v11 = 0;
  }
  [v8 setBeingShownAboveCoverSheet:v11];
  BOOL isAttachedToWindowedAccessory = self->_isAttachedToWindowedAccessory;
  [(SBUIController *)self->_uiController visibleScreenCoordinatesForWindowedAccessory];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = SBLogInCallPresentation();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)int v25 = v14;
    *(double *)&v25[1] = v16;
    *(double *)&v25[2] = v18;
    *(double *)&v25[3] = v20;
    v22 = [MEMORY[0x1E4F29238] valueWithBytes:v25 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    *(_DWORD *)buf = 67109378;
    v27[0] = isAttachedToWindowedAccessory;
    LOWORD(v27[1]) = 2114;
    *(void *)((char *)&v27[1] + 2) = v22;
    _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "Setting device attachedToWindowedAccessory: %{BOOL}u windowedAccessoryCutoutFrameInScreen: %{public}@", buf, 0x12u);
  }
  [v8 setAttachedToWindowedAccessory:isAttachedToWindowedAccessory];
  objc_msgSend(v8, "setWindowedAccessoryCutoutFrameInScreen:", v14, v16, v18, v20);
  [v8 setScreenSharingPresentation:self->_isScreenSharingPresentation];
  [v8 setRequestedPresentationConfigurationIdentifier:self->_requestedPresentationConfigurationIdentifier];
  [v8 setSystemControlsShouldPresentAsEmbedded:v5];
  if (a4 == 1)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F4F700]);
    +[SBInCallBannerPresentableViewController cornerRadius];
    v24 = objc_msgSend(v23, "initWithCornerRadius:");
    [v8 setCornerRadiusConfiguration:v24];
  }
  [(SBInCallPresentationSession *)self _updateAmbientPresentationSettingsForInCallSettings:v8];
}

- (void)applicationSceneHandle:(id)a3 appendToTransitionContext:(id)a4 fromRequestContext:(id)a5 entity:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (self->_sceneHandle != a3) {
    goto LABEL_12;
  }
  assertionAnalyticSources = self->_assertionAnalyticSources;
  id v11 = a4;
  id v12 = [(NSMutableArray *)assertionAnalyticSources lastObject];
  if (!v12)
  {
    double v13 = [v9 request];
    uint64_t v14 = [v13 source];

    if ((unint64_t)(v14 - 11) >= 2)
    {
      if (v14 != 20)
      {
        id v12 = 0;
        goto LABEL_9;
      }
      double v15 = (id *)MEMORY[0x1E4FA7E38];
    }
    else
    {
      double v15 = (id *)MEMORY[0x1E4FA7E68];
    }
    id v12 = *v15;
  }
LABEL_9:
  double v16 = SBLogInCallPresentation();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v12;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Setting analytics source on transition context: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(v11, "SBSUI_setInCallAnalyticsSource:", v12);
LABEL_12:
}

- (id)bannerUnfurlSourceContextForTransitionRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 applicationContext];
  BOOL v5 = [v4 entityForLayoutRole:1];

  if ([v5 isDeviceApplicationSceneEntity])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = self->_entityToUnfurlSourceContext;
    uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "isAnalogousToEntity:", v5, (void)v14))
          {
            id v12 = [(NSMapTable *)self->_entityToUnfurlSourceContext objectForKey:v11];
            goto LABEL_13;
          }
        }
        uint64_t v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v12 = 0;
LABEL_13:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)inCallBannerPresentableViewControllerDidCrossDefaultDraggingThreshold:(id)a3
{
  BOOL v4 = [(SBLockScreenManager *)self->_lockScreenManager isUILocked];
  uint64_t v5 = *MEMORY[0x1E4FA7E08];
  if (v4)
  {
    [(SBInCallPresentationSession *)self _performBannerToTransientOverlayPresentationTransitionAnimated:1 analyticsSource:v5 completion:0];
  }
  else
  {
    [(SBInCallPresentationSession *)self _performBannerToFullScreenPresentationTransitionAnimated:1 analyticsSource:v5 completion:0];
  }
}

- (void)inCallBannerPresentableViewControllerDidReceiveTap:(id)a3
{
}

- (void)inCallBannerPresentableViewControllerWillAppear:(id)a3
{
  [(SBInCallPresentationSession *)self _addSystemAnimationDeactivationReason:@"banner"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  BOOL v4 = [WeakRetained layoutStateProvider];
  uint64_t v5 = [v4 layoutState];
  [(SBInCallPresentationSession *)self _updateAppStatusBarSettingsAssertionForLayoutState:v5];
}

- (void)inCallBannerPresentableViewControllerDidAppear:(id)a3
{
}

- (void)inCallBannerPresentableViewController:(id)a3 willDisappearWithReason:(id)a4
{
}

- (void)inCallBannerPresentableViewController:(id)a3 didDisappearWithReason:(id)a4
{
  id v6 = (SBInCallBannerPresentableViewController *)a3;
  id v7 = a4;
  [(SBInCallPresentationSession *)self _removeSystemAnimationDeactivationReason:@"banner"];
  [(SBInCallBannerPresentableViewController *)v6 invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v9 = [WeakRetained layoutStateProvider];
  id v10 = [v9 layoutState];
  [(SBInCallPresentationSession *)self _updateAppStatusBarSettingsAssertionForLayoutState:v10];

  if (self->_bannerPresentableViewController == v6)
  {
    self->_bannerPresentableViewController = 0;
  }
  [(SBInCallPresentationSession *)self _setNonModalPresentationActive:0];
  if (([v7 isEqualToString:@"_SBInCallBannerRevocationReasonBannerUnfurl"] & 1) == 0
    && ([v7 isEqualToString:@"_SBInCallBannerRevocationReasonSessionRequest"] & 1) == 0
    && ([v7 isEqualToString:@"_SBInCallBannerRevocationReasonTransientOverlayPresentation"] & 1) == 0)
  {
    workspace = self->_workspace;
    id v12 = [WeakRetained _fbsDisplayConfiguration];
    double v13 = [(SBMainWorkspace *)workspace createRequestWithOptions:0 displayConfiguration:v12];

    long long v14 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:self->_sceneHandle];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke;
    v37[3] = &unk_1E6AF57C0;
    id v38 = v14;
    long long v15 = v14;
    [v13 modifyApplicationContext:v37];
    [v13 finalize];
    long long v16 = [v13 applicationContext];
    [v16 frameForApplicationSceneEntity:v15];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    int v25 = [SBInCallPresentationSceneUpdateContext alloc];
    uint64_t v26 = *MEMORY[0x1E4FA7E00];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_2;
    v35[3] = &unk_1E6AF57E8;
    id v36 = v16;
    id v27 = v16;
    v28 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v25, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v26, v35, v18, v20, v22, v24);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_4;
    v32 = &unk_1E6AFF378;
    v33 = self;
    id v34 = WeakRetained;
    [(SBInCallPresentationSceneUpdateContext *)v28 setPostSceneUpdateHandler:&v29];
    -[SBInCallPresentationSession _performSceneUpdateTransactionWithContext:](self, "_performSceneUpdateTransactionWithContext:", v28, v29, v30, v31, v32, v33);
  }
}

void __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setEntity:v2 forLayoutRole:1];
  id v4 = +[SBWorkspaceEntity entity];
  [v3 setEntity:v4 forLayoutRole:2];
}

void __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_3;
  v3[3] = &unk_1E6AF57C0;
  id v4 = *(id *)(a1 + 32);
  [a2 modifyApplicationContext:v3];
}

void __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setInterfaceOrientation:", objc_msgSend(v2, "interfaceOrientation"));
}

void __92__SBInCallPresentationSession_inCallBannerPresentableViewController_didDisappearWithReason___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3;
  uint64_t v9 = v5;
  if (a2)
  {
    char v6 = [*(id *)(a1 + 32) _shouldExcludeFromSwitcherWhenDismissed];
    uint64_t v5 = v9;
    if ((v6 & 1) == 0)
    {
      id v7 = [*(id *)(*(void *)(a1 + 32) + 384) displayItemRepresentation];
      uint64_t v8 = [*(id *)(a1 + 40) switcherController];
      [v8 addAppLayoutForDisplayItem:v7 completion:0];

      uint64_t v5 = v9;
    }
  }
  if (v5)
  {
    v5[2](v5, a2);
    uint64_t v5 = v9;
  }
}

- (void)inCallBannerPresentableViewControllerUserInteractionWillBegin:(id)a3
{
}

- (void)inCallBannerPresentableViewControllerUserInteractionDidEnd:(id)a3
{
}

- (void)inCallBannerPresentableViewControllerCallConnectedStatusChanged:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained inCallClientPresentationSession:self callConnectedStatusChangedForPresentableViewController:v5];
}

- (void)inCallTransientOverlayViewController:(id)a3 willAppearAnimated:(BOOL)a4
{
}

- (void)inCallTransientOverlayViewController:(id)a3 didAppearAnimated:(BOOL)a4
{
  id v8 = a3;
  if (self->_preventsBannersWhenPresentedAsOverlay)
  {
    id v5 = [v8 _sbWindowScene];

    if (v5)
    {
      bannerManager = self->_bannerManager;
      id v7 = [v8 _sbWindowScene];
      [(SBBannerManager *)bannerManager dismissAllBannersInWindowScene:v7 animated:1 reason:@"SBInCallPresentationSession requests dismissall of all banners"];
    }
  }
  [(SBInCallPresentationSession *)self _removeSystemAnimationDeactivationReason:@"transientOverlay"];
}

- (void)inCallTransientOverlayViewController:(id)a3 willDisappearAnimated:(BOOL)a4
{
}

- (void)inCallTransientOverlayViewController:(id)a3 didDisappearAnimated:(BOOL)a4
{
  id v5 = (SBInCallTransientOverlayViewController *)a3;
  [(SBInCallPresentationSession *)self _removeSystemAnimationDeactivationReason:@"transientOverlay"];
  [(SBInCallTransientOverlayViewController *)v5 invalidate];
  [(BSInvalidatable *)self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion invalidate];
  suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion = self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion;
  self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion = 0;

  if (self->_transientOverlayViewController == v5)
  {
    self->_transientOverlayViewController = 0;
  }
  if (self->_isTransientOverlayPresentationActive)
  {
    [(SBInCallPresentationSession *)self _setTransientOverlayPresentationActive:0];
    id v7 = [SBInCallPresentationSceneUpdateContext alloc];
    id v8 = [(SBInCallPresentationSession *)self _screen];
    uint64_t v9 = [v8 fixedCoordinateSpace];
    [v9 bounds];
    id v10 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v7, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", *MEMORY[0x1E4FA7E30], &__block_literal_global_120);

    [(SBInCallPresentationSceneUpdateContext *)v10 setExecutionTarget:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_2;
    v12[3] = &unk_1E6AFBD00;
    void v12[4] = self;
    [(SBInCallPresentationSceneUpdateContext *)v10 setValidatorHandler:v12];
    [(SBInCallPresentationSession *)self _performSceneUpdateTransactionWithContext:v10];
    if (!self->_isHandlingTransientOverlayDismissalRequest
      && ![(SBInCallPresentationSession *)self _shouldExcludeFromSwitcherWhenDismissed])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_3;
      v11[3] = &unk_1E6AF6698;
      v11[4] = self;
      [(SBInCallPresentationSession *)self _performBlockUsingMainEventQueueWithReason:@"SBInCallPresentationSession - inCallTransientOverlayViewController:" handler:v11];
    }
  }
}

uint64_t __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 applicationContext];
  id v4 = [v3 layoutState];
  uint64_t v5 = [v2 _hasExistingSceneSettingsPresentationModeForLayoutState:v4] ^ 1;

  return v5;
}

void __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 384) displayItemRepresentation];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 392));
  char v6 = [WeakRetained switcherController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_4;
  v8[3] = &unk_1E6AFA3D8;
  id v9 = v3;
  id v7 = v3;
  [v6 addAppLayoutForDisplayItem:v4 completion:v8];
}

uint64_t __89__SBInCallPresentationSession_inCallTransientOverlayViewController_didDisappearAnimated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)inCallTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  self->_isHandlingTransientOverlayDismissalRequest = 1;
  BOOL v4 = [(SBInCallPresentationSession *)self _shouldExcludeFromSwitcherWhenDismissed];
  uint64_t v5 = *MEMORY[0x1E4FA7E30];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__SBInCallPresentationSession_inCallTransientOverlayViewControllerRequestsDismissal___block_invoke;
  v6[3] = &unk_1E6AF5350;
  v6[4] = self;
  [(SBInCallPresentationSession *)self _performTransientOverlayDismissalTransitionAnimated:1 shouldInsertIntoSwitcherModel:!v4 analyticsSource:v5 completion:v6];
}

uint64_t __85__SBInCallPresentationSession_inCallTransientOverlayViewControllerRequestsDismissal___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 213) = 0;
  return result;
}

- (BOOL)inCallTransientOverlayViewControllerShouldSupportAlwaysOnDisplay:(id)a3
{
  return !self->_isScreenSharingPresentation
      && [(SBInCallPresentationSession *)self supportsBecomingVisibleWhenUnlockingFromSource:32 wakingDisplay:1];
}

- (BOOL)inCallTransientOverlayViewControllerShouldPreventBannerPresentations:(id)a3
{
  return self->_preventsBannersWhenPresentedAsOverlay;
}

- (void)inCallTransientOverlayViewControllerDidUpdateAmbientPresentationIsAmbientPresented:(BOOL)a3 ambientDisplayStyle:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_BOOL isAmbientPresented = a3;
  self->_int64_t ambientDisplayStyle = a4;
  if ([(SBInCallPresentationSession *)self _isValidForSceneUpdates])
  {
    uint64_t v5 = SBLogInCallPresentation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isAmbientPresented = self->_isAmbientPresented;
      int64_t ambientDisplayStyle = self->_ambientDisplayStyle;
      v8[0] = 67109376;
      v8[1] = isAmbientPresented;
      __int16 v9 = 2048;
      int64_t v10 = ambientDisplayStyle;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Updating scene settings to ambient presentation change isAmbientPresented: %{BOOL}d ambientDisplayStyle: %lu", (uint8_t *)v8, 0x12u);
    }

    [(SBInCallPresentationSession *)self _updateSceneSettingsForAmbientPresentationSettingsUpdate];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v7 = [v5 fromLayoutState];
  SBSafeCast(v6, v7);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = objc_opt_class();
  __int16 v9 = [v5 toLayoutState];

  int64_t v10 = SBSafeCast(v8, v9);

  if ((BSEqualObjects() & 1) == 0 && !self->_isPerformingSwitcherPresentation)
  {
    preferredDismissalPrimaryElement = self->_preferredDismissalPrimaryElement;
    self->_preferredDismissalPrimaryElement = 0;
  }
  [(SBInCallPresentationSession *)self _updateKeyboardFocusPreventionAssertionWithLayoutState:v10];
  -[SBInCallPresentationSession _updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:](self, "_updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:", [v10 unlockedEnvironmentMode], -[SBInCallPresentationSession _shouldConsiderScenePrimaryForLayoutState:](self, "_shouldConsiderScenePrimaryForLayoutState:", v10));
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  __int16 v9 = [v7 fromLayoutState];
  int64_t v10 = SBSafeCast(v8, v9);

  uint64_t v11 = objc_opt_class();
  id v12 = [v7 toLayoutState];

  double v13 = SBSafeCast(v11, v12);

  LODWORD(v12) = [(SBInCallPresentationSession *)self _shouldConsiderScenePrimaryForLayoutState:v10];
  BOOL v14 = [(SBInCallPresentationSession *)self _shouldConsiderScenePrimaryForLayoutState:v13];
  BOOL v15 = v14;
  if (v12 && !v14)
  {
    long long v16 = [(SBInCallPresentationSession *)self sceneHandle];
    double v17 = [v16 sceneIdentifier];

    double v18 = [v10 elementWithIdentifier:v17];
    double v19 = [v6 sceneEntityFrameProvider];
    double v20 = [v18 workspaceEntity];
    [v19 sceneEntityFrameForWorkspaceEntity:v20 inLayoutState:v10];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    uint64_t v29 = [SBInCallPresentationSceneUpdateContext alloc];
    uint64_t v30 = *MEMORY[0x1E4FA7E60];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
    v34[3] = &unk_1E6AF67B0;
    id v35 = v10;
    id v36 = v18;
    id v31 = v18;
    v32 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v29, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v30, v34, v22, v24, v26, v28);
    [(SBInCallPresentationSceneUpdateContext *)v32 setExecutionTarget:1];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_3;
    v33[3] = &unk_1E6AFBD00;
    v33[4] = self;
    [(SBInCallPresentationSceneUpdateContext *)v32 setValidatorHandler:v33];
    [(SBInCallPresentationSession *)self _performSceneUpdateTransactionWithContext:v32];
  }
  [(SBInCallPresentationSession *)self _updateKeyboardFocusPreventionAssertionWithLayoutState:v13];
  -[SBInCallPresentationSession _updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:](self, "_updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:", [v13 unlockedEnvironmentMode], v15);
  [(SBInCallPresentationSession *)self _updateAppStatusBarSettingsAssertionForLayoutState:v13];
  [(SBInCallPresentationSession *)self _updateSceneHandleToObserveForSendingShowNoticeForSystemControlsAction:v13];
  [(SBInCallPresentationSession *)self _updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:v13];
}

void __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2;
  v4[3] = &unk_1E6AF5638;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 modifyApplicationContext:v4];
}

void __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = a2;
  BOOL v4 = [v2 layoutAttributesForElement:v3];
  uint64_t v5 = [v4 contentOrientation];

  [v6 setInterfaceOrientation:v5];
}

uint64_t __102__SBInCallPresentationSession_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 applicationContext];
  BOOL v4 = [v3 layoutState];
  uint64_t v5 = [v2 _hasExistingSceneSettingsPresentationModeForLayoutState:v4] ^ 1;

  return v5;
}

- (void)_updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:(int64_t)a3 shouldConsiderPrimary:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(id)SBApp windowSceneManager];
  id v37 = [v7 embeddedDisplayWindowScene];

  double v8 = *MEMORY[0x1E4F437F8];
  double v9 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  if (a3 == 3 && v4)
  {
    id v12 = [(SBPIPControllerCoordinator *)self->_pipControllerCoordinator controllerForType:0];
    int v13 = [v12 isPictureInPictureWindowVisibleOnWindowScene:v37];

    if (v13)
    {
      BOOL v14 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
      BOOL v15 = [v14 clientSettings];
      uint64_t v16 = objc_opt_class();
      id v17 = v15;
      if (v16)
      {
        if (objc_opt_isKindOfClass()) {
          double v18 = v17;
        }
        else {
          double v18 = 0;
        }
      }
      else
      {
        double v18 = 0;
      }
      id v19 = v18;

      [v19 expanseHUDDodgingInsets];
      double v8 = v20;
      double v9 = v21;
      double v10 = v22;
      double v11 = v23;
    }
  }
  if (self->_preferredPIPDodgingInsets.left != v9
    || self->_preferredPIPDodgingInsets.top != v8
    || self->_preferredPIPDodgingInsets.right != v11
    || self->_preferredPIPDodgingInsets.bottom != v10)
  {
    self->_preferredPIPDodgingInsets.top = v8;
    self->_preferredPIPDodgingInsets.left = v9;
    self->_preferredPIPDodgingInsets.bottom = v10;
    self->_preferredPIPDodgingInsets.right = v11;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained inCallClientPresentationSessionResolvedPIPDodgingInsets:self];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;

    id v36 = [v37 pictureInPictureManager];
    objc_msgSend(v36, "applyPictureInPictureInsets:forSource:", 8, v29, v31, v33, v35);
  }
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  id v7 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", a3, a5, a4);
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v9 = [SBInCallPresentationSceneUpdateContext alloc];
    double v10 = [(SBInCallPresentationSession *)self _screen];
    double v11 = [v10 fixedCoordinateSpace];
    [v11 bounds];
    uint64_t v12 = *MEMORY[0x1E4FA7E48];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke;
    v15[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
    v15[4] = a3;
    int v13 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v9, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v12, v15);

    [(SBInCallPresentationSceneUpdateContext *)v13 setExecutionTarget:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_3;
    v14[3] = &unk_1E6AFF3C0;
    v14[4] = self;
    v14[5] = a3;
    [(SBInCallPresentationSceneUpdateContext *)v13 setValidatorHandler:v14];
    [(SBInCallPresentationSession *)self _performSceneUpdateTransactionWithContext:v13];
  }
}

uint64_t __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_2;
  v3[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 modifyApplicationContext:v3];
}

uint64_t __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setInterfaceOrientation:*(void *)(a1 + 32)];
}

BOOL __120__SBInCallPresentationSession_activeInterfaceOrientationDidChangeToOrientation_willAnimateWithDuration_fromOrientation___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 384) sceneIfExists];
  uint64_t v3 = [v2 settings];
  uint64_t v4 = [v3 interfaceOrientation];

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v5 + 210)) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = *(unsigned char *)(v5 + 209) == 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 392));
  double v9 = [WeakRetained layoutStateProvider];
  double v10 = [v9 layoutState];
  double v11 = [*(id *)(*(void *)(a1 + 32) + 384) sceneIdentifier];
  uint64_t v12 = [v10 elementWithIdentifier:v11];

  if (v4 == v6) {
    return 0;
  }
  if (v12) {
    return 0;
  }
  return v7;
}

- (BOOL)handleAccessoryAttachWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_isAttachedToWindowedAccessory
    && ![(SBLockScreenManager *)self->_lockScreenManager isUILocked]
    && [(SBInCallPresentationSession *)self _isValidForSceneUpdates]
    && !self->_isTransientOverlayPresentationActive
    && ([(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint64_t v8 = *MEMORY[0x1E4FA7E78];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__SBInCallPresentationSession_handleAccessoryAttachWithCompletion___block_invoke;
    v9[3] = &unk_1E6AF5A50;
    id v10 = v4;
    [(SBInCallPresentationSession *)self _performTransientOverlayPresentationTransitionAnimated:0 analyticsSource:v8 completion:v9];

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __67__SBInCallPresentationSession_handleAccessoryAttachWithCompletion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SBInCallPresentationSession_handleAccessoryAttachWithCompletion___block_invoke_2;
  block[3] = &unk_1E6AF5300;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__SBInCallPresentationSession_handleAccessoryAttachWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_windowedAccessoryDidAttachOrDetach:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  sceneHandle = self->_sceneHandle;
  id v5 = a3;
  uint64_t v6 = [(SBDeviceApplicationSceneHandle *)sceneHandle sceneIfExists];
  BOOL v7 = [v5 userInfo];

  uint64_t v8 = [v7 objectForKey:@"SBUIWindowedAccessoryAttachedKey"];
  int v9 = [v8 BOOLValue];

  self->_BOOL isAttachedToWindowedAccessory = v9;
  if ([(SBInCallPresentationSession *)self _isValidForSceneUpdates])
  {
    [(SBUIController *)self->_uiController visibleScreenCoordinatesForWindowedAccessory];
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    double v18 = SBLogInCallPresentation();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22[0] = v11;
      v22[1] = v13;
      v22[2] = v15;
      v22[3] = v17;
      id v19 = [MEMORY[0x1E4F29238] valueWithBytes:v22 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      *(_DWORD *)buf = 67109378;
      int v24 = v9;
      __int16 v25 = 2114;
      double v26 = v19;
      _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Updating scene settings to attachedToWindowedAccessory: %{BOOL}u windowedAccessoryCutoutFrameInScreen: %{public}@", buf, 0x12u);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__SBInCallPresentationSession__windowedAccessoryDidAttachOrDetach___block_invoke;
    v20[3] = &__block_descriptor_65_e33_v16__0__FBSMutableSceneSettings_8l;
    char v21 = v9;
    v20[4] = v11;
    v20[5] = v13;
    v20[6] = v15;
    v20[7] = v17;
    [v6 updateSettingsWithBlock:v20];
  }
}

void __67__SBInCallPresentationSession__windowedAccessoryDidAttachOrDetach___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  id v4 = a2;
  [v4 setAttachedToWindowedAccessory:v3];
  objc_msgSend(v4, "setWindowedAccessoryCutoutFrameInScreen:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_updateSceneDeactivationAssertions
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_deactivationManager;
  id v4 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  if ([v4 isValid])
  {
    id v5 = [v4 identifier];
    uint64_t v33 = 0;
    double v34 = &v33;
    uint64_t v35 = 0x3032000000;
    id v36 = __Block_byref_object_copy__38;
    id v37 = __Block_byref_object_dispose__38;
    id v38 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke;
    v32[3] = &unk_1E6AFF408;
    v32[4] = &v33;
    uint64_t v6 = (void (**)(void))MEMORY[0x1D948C7A0](v32);
    uint64_t v7 = [(NSMutableSet *)self->_activeSystemAnimationDeactivationReasons count];
    char v8 = (v7 != 0) ^ (self->_systemAnimationSceneDeactivationAssertion == 0);
    if ((v7 != 0) == (self->_systemAnimationSceneDeactivationAssertion == 0))
    {
      if (v7)
      {
        int v9 = (UIApplicationSceneDeactivationAssertion *)[(UIApplicationSceneDeactivationManager *)v3 newAssertionWithReason:5];
        systemAnimationSceneDeactivationAssertion = self->_systemAnimationSceneDeactivationAssertion;
        self->_systemAnimationSceneDeactivationAssertion = v9;

        uint64_t v11 = self->_systemAnimationSceneDeactivationAssertion;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke_2;
        v30[3] = &unk_1E6AF9A10;
        double v31 = v5;
        [(UIApplicationSceneDeactivationAssertion *)v11 acquireWithPredicate:v30 transitionContext:0];
        uint64_t v12 = v31;
      }
      else
      {
        v6[2](v6);
        uint64_t v12 = self->_systemAnimationSceneDeactivationAssertion;
        self->_systemAnimationSceneDeactivationAssertion = 0;
      }
    }
    uint64_t v13 = [(NSMutableSet *)self->_activeSystemGestureDeactivationReasons count];
    if ((v13 != 0) != (self->_systemGestureSceneDeactivationAssertion == 0))
    {
      char v14 = v8 ^ 1;
    }
    else
    {
      if (v13)
      {
        uint64_t v15 = (UIApplicationSceneDeactivationAssertion *)[(UIApplicationSceneDeactivationManager *)v3 newAssertionWithReason:0];
        systemGestureSceneDeactivationAssertion = self->_systemGestureSceneDeactivationAssertion;
        self->_systemGestureSceneDeactivationAssertion = v15;

        uint64_t v17 = self->_systemGestureSceneDeactivationAssertion;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke_3;
        v28[3] = &unk_1E6AF9A10;
        double v29 = v5;
        [(UIApplicationSceneDeactivationAssertion *)v17 acquireWithPredicate:v28 transitionContext:0];
        double v18 = v29;
      }
      else
      {
        v6[2](v6);
        double v18 = self->_systemGestureSceneDeactivationAssertion;
        self->_systemGestureSceneDeactivationAssertion = 0;
      }

      char v14 = 1;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = (id)v34[5];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "relinquish", (void)v24);
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v41 count:16];
      }
      while (v20);
    }
    else
    {

      if ((v14 & 1) == 0)
      {
LABEL_25:

        _Block_object_dispose(&v33, 8);
        goto LABEL_26;
      }
    }
    double v23 = SBLogInCallPresentation();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v40 = self;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "Updated deactivation assertions for session %{public}@", buf, 0xCu);
    }

    goto LABEL_25;
  }
LABEL_26:
}

void __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v8 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v4 addObject:v8];
    id v3 = v8;
  }
}

uint64_t __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __65__SBInCallPresentationSession__updateSceneDeactivationAssertions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)inCallBannerPresentableViewController:(id)a3 viewWillTransitionSizeWithAnimationSettings:(id)a4
{
  id v6 = a4;
  if (self->_isNonModalPresentationActive)
  {
    id v7 = a3;
    uint64_t v8 = [v7 interfaceOrientation];
    int v9 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (v8) {
      BOOL v11 = (v10 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11) {
      uint64_t v12 = v8;
    }
    else {
      uint64_t v12 = 1;
    }
    uint64_t v13 = [v7 view];
    char v14 = [v13 superview];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    bannerManager = self->_bannerManager;
    long long v24 = [(SBBannerManager *)bannerManager windowSceneForPresentable:v7];
    long long v25 = [(SBBannerManager *)bannerManager layoutManagerInWindowScene:v24];

    long long v26 = [(SBInCallPresentationSession *)self _screen];
    double v27 = v18;
    double v62 = v18;
    objc_msgSend(v25, "useableContainerFrameInContainerBounds:onScreen:", v26, v16, v18, v20, v22);
    double v29 = v28;
    double v61 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;

    id v36 = [(SBInCallPresentationSession *)self _screen];
    [v36 scale];
    objc_msgSend(v25, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v33, v35, v29, v31, v33, v35, *(void *)&v16, *(void *)&v27, *(void *)&v20, *(void *)&v22, v37);
    double v39 = v38;
    double v41 = v40;

    objc_msgSend(v7, "preferredContentSizeWithPresentationSize:containerSize:", v39, v41, v20, v22);
    double v43 = v42;
    double v45 = v44;

    double v46 = [(SBInCallPresentationSession *)self _screen];
    [v46 scale];
    objc_msgSend(v25, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v43, v45, v61, v31, v33, v35, *(void *)&v16, *(void *)&v62, *(void *)&v20, *(void *)&v22, v47);

    BSRectWithSize();
    double v48 = [(SBInCallPresentationSession *)self _screen];
    double v49 = [v48 fixedCoordinateSpace];
    [v49 bounds];
    _UIWindowConvertRectFromOrientationToOrientation();
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;

    v58 = [SBInCallPresentationSceneUpdateContext alloc];
    uint64_t v59 = *MEMORY[0x1E4FA7E58];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __113__SBInCallPresentationSession_inCallBannerPresentableViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke;
    v63[3] = &unk_1E6AFF458;
    uint64_t v65 = v12;
    id v64 = v6;
    id v60 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v58, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v59, v63, v51, v53, v55, v57);
    [(SBInCallPresentationSceneUpdateContext *)v60 setExecutionTarget:1];
    [(SBInCallPresentationSession *)self _performSceneUpdateTransactionWithContext:v60];
  }
}

void __113__SBInCallPresentationSession_inCallBannerPresentableViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __113__SBInCallPresentationSession_inCallBannerPresentableViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke_2;
  v4[3] = &unk_1E6AFF430;
  id v3 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = v3;
  [a2 modifyApplicationContext:v4];
}

void __113__SBInCallPresentationSession_inCallBannerPresentableViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setInterfaceOrientation:v3];
  [v4 setAnimationSettings:*(void *)(a1 + 32)];
  [v4 setFencesAnimations:1];
}

- (void)_dispatchBlockToMainEventQueueWithReason:(id)a3 block:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __78__SBInCallPresentationSession__dispatchBlockToMainEventQueueWithReason_block___block_invoke;
  v8[3] = &unk_1E6AFF480;
  id v9 = v6;
  id v7 = v6;
  [(SBInCallPresentationSession *)self _performBlockUsingMainEventQueueWithReason:a3 handler:v8];
}

void __78__SBInCallPresentationSession__dispatchBlockToMainEventQueueWithReason_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  v4[2]();
}

- (void)_performBlockUsingMainEventQueueWithReason:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBWorkspace *)self->_workspace eventQueue];
  objc_initWeak(&location, v8);
  id v9 = (void *)MEMORY[0x1E4F624D8];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  double v15 = __82__SBInCallPresentationSession__performBlockUsingMainEventQueueWithReason_handler___block_invoke;
  double v16 = &unk_1E6AF6A20;
  objc_copyWeak(&v19, &location);
  id v10 = v6;
  id v17 = v10;
  id v11 = v7;
  id v18 = v11;
  uint64_t v12 = [v9 eventWithName:v10 handler:&v13];
  objc_msgSend(v8, "executeOrAppendEvent:", v12, v13, v14, v15, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __82__SBInCallPresentationSession__performBlockUsingMainEventQueueWithReason_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = [NSString stringWithFormat:@"SBInCallPresentationSessionEvent-%@", *(void *)(a1 + 32)];
    id v4 = [WeakRetained acquireLockForReason:v3];

    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __82__SBInCallPresentationSession__performBlockUsingMainEventQueueWithReason_handler___block_invoke_2;
    v8[3] = &unk_1E6AF5290;
    id v9 = WeakRetained;
    id v10 = v4;
    id v6 = *(void (**)(uint64_t, void *))(v5 + 16);
    id v7 = v4;
    v6(v5, v8);
  }
}

uint64_t __82__SBInCallPresentationSession__performBlockUsingMainEventQueueWithReason_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) relinquishLock:*(void *)(a1 + 40)];
}

- (void)inCallTransientOverlayViewController:(id)a3 viewWillTransitionSizeWithAnimationSettings:(id)a4
{
  id v6 = a4;
  if (self->_isTransientOverlayPresentationActive)
  {
    id v7 = a3;
    uint64_t v8 = [v7 interfaceOrientation];
    id v9 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if (v8) {
      BOOL v11 = (v10 & 0xFFFFFFFFFFFFFFFBLL) == 1;
    }
    else {
      BOOL v11 = 0;
    }
    if (!v11) {
      uint64_t v8 = 1;
    }
    uint64_t v12 = [v7 contentView];

    [v12 bounds];
    BSRectWithSize();
    uint64_t v13 = [(SBInCallPresentationSession *)self _screen];
    uint64_t v14 = [v13 fixedCoordinateSpace];
    [v14 bounds];
    _UIWindowConvertRectFromOrientationToOrientation();
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = [SBInCallPresentationSceneUpdateContext alloc];
    uint64_t v24 = *MEMORY[0x1E4FA7E58];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    double v28 = __112__SBInCallPresentationSession_inCallTransientOverlayViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke;
    double v29 = &unk_1E6AFF458;
    uint64_t v31 = v8;
    id v30 = v6;
    long long v25 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v23, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v24, &v26, v16, v18, v20, v22);
    -[SBInCallPresentationSceneUpdateContext setExecutionTarget:](v25, "setExecutionTarget:", 1, v26, v27, v28, v29);
    [(SBInCallPresentationSession *)self _performSceneUpdateTransactionWithContext:v25];
  }
}

void __112__SBInCallPresentationSession_inCallTransientOverlayViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __112__SBInCallPresentationSession_inCallTransientOverlayViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke_2;
  v4[3] = &unk_1E6AFF430;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = v3;
  [a2 modifyApplicationContext:v4];
}

void __112__SBInCallPresentationSession_inCallTransientOverlayViewController_viewWillTransitionSizeWithAnimationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setInterfaceOrientation:v3];
  [v4 setAnimationSettings:*(void *)(a1 + 32)];
  [v4 setFencesAnimations:1];
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v7 = [WeakRetained layoutStateProvider];
  id v8 = [v7 layoutState];

  [(SBInCallPresentationSession *)self _updateAppStatusBarSettingsAssertionForLayoutState:v8];
  [(SBInCallPresentationSession *)self _updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:v8];
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v6 = a4;
  if ([a3 isEqual:self->_sceneHandle]) {
    [v6 addObserver:self];
  }
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandleToObserveForShowSystemControlsAction);
  if ([v10 isEqual:self->_sceneHandle])
  {
    id v9 = [(SBInCallPresentationSession *)self _inCallSceneClientSettingsDiffInspector];
    [v9 inspectDiff:v7 withContext:0];
  }
  else if (WeakRetained && [v10 isEqual:WeakRetained])
  {
    [(SBInCallPresentationSession *)self _sendShowNoticeForSystemControlsActionIfNeeded];
  }
}

- (id)_inCallSceneClientSettingsDiffInspector
{
  inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  if (!inCallSceneClientSettingsDiffInspector)
  {
    id v4 = (SBSUIInCallSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4FA7B98]);
    id v5 = self->_inCallSceneClientSettingsDiffInspector;
    self->_inCallSceneClientSettingsDiffInspector = v4;

    objc_initWeak(&location, self);
    id v6 = self->_inCallSceneClientSettingsDiffInspector;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke;
    v14[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v15, &location);
    [(SBSUIInCallSceneClientSettingsDiffInspector *)v6 observeExpanseHUDDodgingInsetsWithBlock:v14];
    id v7 = self->_inCallSceneClientSettingsDiffInspector;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke_2;
    v12[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v13, &location);
    [(SBSUIInCallSceneClientSettingsDiffInspector *)v7 observePrefersBannersHiddenFromClonedDisplayWithBlock:v12];
    id v8 = self->_inCallSceneClientSettingsDiffInspector;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke_3;
    v10[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v11, &location);
    [(SBSUIInCallSceneClientSettingsDiffInspector *)v8 observePrefersHiddenWhenDismissedWithBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  }
  return inCallSceneClientSettingsDiffInspector;
}

void __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v2 = [WeakRetained _sceneManager];
    uint64_t v3 = [v2 _layoutStateTransitionCoordinator];
    char v4 = [v3 isTransitioning];

    id WeakRetained = v8;
    if ((v4 & 1) == 0)
    {
      id v5 = objc_loadWeakRetained(v8 + 49);
      id v6 = [v5 layoutStateProvider];
      id v7 = [v6 layoutState];

      objc_msgSend(v8, "_updatePIPInsetsForExpanseHUDForUnlockedEnvironmentMode:shouldConsiderPrimary:", objc_msgSend(v7, "unlockedEnvironmentMode"), objc_msgSend(v8, "_currentPresentationModeForLayoutState:", v7) == 2);
      id WeakRetained = v8;
    }
  }
}

void __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained;
    uint64_t v3 = [WeakRetained _clientSettingsIfExists];
    int v4 = [v3 prefersBannersHiddenFromClonedDisplay];

    uint64_t v2 = v12;
    id v5 = v12[44];
    if (v4)
    {
      if (v5) {
        goto LABEL_7;
      }
      id v6 = objc_loadWeakRetained(v12 + 46);
      id v7 = NSString;
      id v8 = [v12[48] sceneIdentifier];
      id v9 = [v7 stringWithFormat:@"SBInCallPresentationSession for %@", v8];
      uint64_t v10 = [v6 inCallClientPresentationSession:v12 acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:v9];
      id v11 = v12[44];
      v12[44] = (id)v10;
    }
    else
    {
      [v5 invalidate];
      id v6 = v12[44];
      v12[44] = 0;
    }

    uint64_t v2 = v12;
  }
LABEL_7:
}

void __70__SBInCallPresentationSession__inCallSceneClientSettingsDiffInspector__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(WeakRetained + 49);
  uint64_t v2 = [v1 layoutStateProvider];
  uint64_t v3 = [v2 layoutState];
  [WeakRetained _updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:v3];
}

- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v5 = [WeakRetained layoutStateProvider];
  id v6 = [v5 layoutState];
  [(SBInCallPresentationSession *)self _updateAppStatusBarSettingsAssertionForLayoutState:v6];
}

- (BOOL)sceneHandle:(id)a3 didReceiveAction:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = SBLogInCallPresentation();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      double v17 = self;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "SBSUIInCallDestroySceneAction received for %{public}@", buf, 0xCu);
    }

    id v7 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v9 = [v7 destructionReason];
    uint64_t v10 = [v7 analyticsSource];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__SBInCallPresentationSession_sceneHandle_didReceiveAction___block_invoke;
    v14[3] = &unk_1E6AF5350;
    id v15 = v7;
    id v11 = v7;
    [WeakRetained inCallClientPresentationSession:self handleDestroySceneActionWithReason:v9 analyticsSource:v10 completion:v14];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v12 = 0;
      goto LABEL_9;
    }
    [(SBInCallPresentationSession *)self _handleRequestInCallPresentationModeAction:v5];
  }
  BOOL v12 = 1;
LABEL_9:

  return v12;
}

void __60__SBInCallPresentationSession_sceneHandle_didReceiveAction___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canSendResponse])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = [MEMORY[0x1E4F4F678] response];
    [v2 sendResponse:v3];
  }
}

- (void)_handleRequestInCallPresentationModeAction:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogInCallPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 requestedPresentationMode];
    id v6 = SBSInCallPresentationModeDescription();
    *(_DWORD *)buf = 138543362;
    double v17 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Handling SBSUIInCallRequestPresentationModeAction with presentation mode: %{public}@", buf, 0xCu);
  }
  uint64_t v7 = [v4 requestedPresentationMode];
  [(SBInCallPresentationSession *)self setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:v7 == 3];
  char v8 = 0;
  if (v7 == 3 && !self->_isScreenSharingPresentation) {
    char v8 = objc_msgSend(v4, "isUserInitiated", 0);
  }
  self->_transientOverlayShouldAlwaysPreventHomeGestureDismissal = v8;
  -[SBInCallTransientOverlayViewController setShouldAlwaysPreventHomeGestureDismissal:](self->_transientOverlayViewController, "setShouldAlwaysPreventHomeGestureDismissal:");
  if (self->_isNonModalPresentationActive)
  {
    bannerPresentableViewController = self->_bannerPresentableViewController;
    if (bannerPresentableViewController)
    {
      if (![(SBInCallBannerPresentableViewController *)bannerPresentableViewController isPresented])
      {
        uint64_t v10 = [v4 analyticsSource];
        [(SBInCallPresentationSession *)self _performBannerDismissalTransitionAnimated:0 analyticsSource:v10 completion:&__block_literal_global_120];
      }
    }
  }
  if ([v4 requestedPresentationMode] == 2
    && [(SBInCallPresentationSession *)self _isAmbientPresentationActive])
  {
    [v4 sendCompletionResponseWithSuccess:0];
  }
  else
  {
    uint64_t v11 = [v4 requestedPresentationMode];
    uint64_t v12 = [v4 isUserInitiated];
    id v13 = [v4 analyticsSource];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__SBInCallPresentationSession__handleRequestInCallPresentationModeAction___block_invoke_2;
    v14[3] = &unk_1E6AF5350;
    id v15 = v4;
    [(SBInCallPresentationSession *)self _performPresentationWithRequestedPresentationMode:v11 isUserInitiated:v12 animated:1 analyticsSource:v13 completion:v14];
  }
}

uint64_t __74__SBInCallPresentationSession__handleRequestInCallPresentationModeAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendCompletionResponseWithSuccess:a2];
}

- (void)ensureInclusionInSwitcherForRestoreFromPIPWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  BOOL v5 = [(SBInCallPresentationSession *)self _isInSwitcherModel];
  if (![(SBInCallPresentationSession *)self _isValidForSceneUpdates]
    || self->_isNonModalPresentationActive
    || self->_isTransientOverlayPresentationActive)
  {
    v4[2](v4, 0);
  }
  else if (v5)
  {
    v4[2](v4, 1);
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4FA7E18];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __88__SBInCallPresentationSession_ensureInclusionInSwitcherForRestoreFromPIPWithCompletion___block_invoke;
    v7[3] = &unk_1E6AFBD00;
    void v7[4] = self;
    [(SBInCallPresentationSession *)self _insertIntoSwitcherAsDismissedWithAnalyticsSource:v6 transitionValidator:v7 completion:v4];
  }
}

uint64_t __88__SBInCallPresentationSession_ensureInclusionInSwitcherForRestoreFromPIPWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 applicationContext];
  BOOL v5 = [v3 layoutStateForApplicationTransitionContext:v4];

  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      char v8 = v7;
    }
    else {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }
  id v9 = v8;

  if ([*(id *)(a1 + 32) _isValidForSceneUpdates]) {
    uint64_t v10 = [*(id *)(a1 + 32) _isDismissedForLayoutState:v9];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)overrideAppSceneEntityForLaunchingApplication:(id)a3
{
  if ([a3 isFaceTime]
    && [(SBInCallPresentationSession *)self _isValidForSceneUpdates]
    && !self->_isScreenSharingPresentation)
  {
    id v4 = [(SBInCallPresentationSession *)self _clientSettingsIfExists];
    if (([v4 shouldNeverBeShownWhenLaunchingFaceTime] & 1) != 0
      || ([(SBDeviceApplicationSceneHandle *)self->_sceneHandle isContentReady] & 1) == 0)
    {
    }
    else
    {
      bannerPresentableViewController = self->_bannerPresentableViewController;

      if (!bannerPresentableViewController)
      {
        uint64_t v6 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:self->_sceneHandle];
        goto LABEL_10;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_10:
  return v6;
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a3, "isEqual:", self->_sceneHandle, a4))
  {
    BOOL v5 = SBLogInCallPresentation();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      char v8 = self;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "FBScene for %{public}@ was destroyed.", (uint8_t *)&v7, 0xCu);
    }

    if ([(SBInCallPresentationSession *)self _isValidForSceneUpdates])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained inCallClientPresentationSessionSceneWasDestroyed:self];
    }
  }
}

- (void)sceneHandle:(id)a3 replacedWithSceneHandle:(id)a4
{
  id v6 = a4;
  if ([(SBDeviceApplicationSceneHandle *)self->_sceneHandle isEqual:a3]) {
    [(SBInCallPresentationSession *)self transitionToSceneHandleIfNeeded:v6];
  }
}

- (void)sceneHandle:(id)a3 didMoveFromSceneManager:(id)a4
{
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 request];
  BOOL v5 = [v4 layoutStateForApplicationTransitionContext:v3];

  return v5;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 request];
  BOOL v5 = [v4 previousLayoutStateForApplicationTransitionContext:v3];

  return v5;
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 request];
  [v8 applicationTransitionContext:v6 frameForApplicationSceneEntity:v7];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v17 = self->_entityToSceneUpdateContext;
  uint64_t v18 = [(NSMapTable *)v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
LABEL_3:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v33 != v20) {
        objc_enumerationMutation(v17);
      }
      double v22 = *(void **)(*((void *)&v32 + 1) + 8 * v21);
      if (objc_msgSend(v22, "isAnalogousToEntity:", v7, (void)v32)) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [(NSMapTable *)v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v19) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    double v23 = [(NSMapTable *)self->_entityToSceneUpdateContext objectForKey:v22];

    if (!v23) {
      goto LABEL_13;
    }
    [(NSMapTable *)v23 referenceFrame];
    double v10 = v24;
    double v12 = v25;
    double v14 = v26;
    double v16 = v27;
    double v17 = v23;
  }
LABEL_12:

LABEL_13:
  double v28 = v10;
  double v29 = v12;
  double v30 = v14;
  double v31 = v16;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (unint64_t)_incrementPresentationModeRevisionIDWithReason:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  ++self->_presentationModeRevisionID;
  BOOL v5 = SBLogInCallPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [NSNumber numberWithUnsignedLongLong:self->_presentationModeRevisionID];
    id v7 = [(SBInCallPresentationSession *)self sceneHandle];
    char v8 = [v7 persistenceIdentifier];
    int v11 = 138412802;
    double v12 = v6;
    __int16 v13 = 2114;
    double v14 = v8;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "_incrementPresentationModeRevisionIDWithReason: %@ %{public}@ %{public}@", (uint8_t *)&v11, 0x20u);
  }
  unint64_t presentationModeRevisionID = self->_presentationModeRevisionID;

  return presentationModeRevisionID;
}

- (void)_performSwitcherPresentationTransitionAnimated:(BOOL)a3 isUserInitiated:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  if ([(SBInCallPresentationSession *)self _isValidForSceneUpdates])
  {
    __int16 v13 = NSStringFromSelector(a2);
    unint64_t v14 = [(SBInCallPresentationSession *)self _incrementPresentationModeRevisionIDWithReason:v13];

    __int16 v15 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:self->_sceneHandle];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke;
    v50[3] = &unk_1E6AFF350;
    v50[4] = self;
    id v16 = v15;
    double v51 = v16;
    BOOL v52 = a3;
    BOOL v53 = a4;
    uint64_t v17 = (void *)MEMORY[0x1D948C7A0](v50);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_3;
    v45[3] = &unk_1E6AFF520;
    v45[4] = self;
    unint64_t v49 = v14;
    id v18 = v17;
    id v47 = v18;
    id v48 = v12;
    id v19 = v11;
    id v46 = v19;
    uint64_t v20 = (void (**)(void))MEMORY[0x1D948C7A0](v45);
    if ([(SBDeviceApplicationSceneHandle *)self->_sceneHandle contentState])
    {
      v20[2](v20);
    }
    else
    {
      workspace = self->_workspace;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      double v28 = [WeakRetained _fbsDisplayConfiguration];
      double v29 = [(SBMainWorkspace *)workspace createRequestWithOptions:0 displayConfiguration:v28];

      (*((void (**)(id, void *))v18 + 2))(v18, v29);
      [v29 finalize];
      double v30 = [v29 applicationContext];
      [v30 frameForApplicationSceneEntity:v16];
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      double v39 = [SBInCallPresentationSceneUpdateContext alloc];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_7;
      v43[3] = &unk_1E6AF7240;
      id v44 = v18;
      double v40 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v39, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v19, v43, v32, v34, v36, v38);
      [(SBInCallPresentationSceneUpdateContext *)v40 setExecutionTarget:1];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_8;
      v41[3] = &unk_1E6AF5A50;
      double v42 = v20;
      [(SBInCallPresentationSceneUpdateContext *)v40 setCompletionHandler:v41];
      [(SBInCallPresentationSession *)self _performSceneUpdateTransactionWithContext:v40];
    }
  }
  else
  {
    uint64_t v21 = SBLogInCallPresentation();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SBInCallPresentationSession _performSwitcherPresentationTransitionAnimated:isUserInitiated:analyticsSource:completion:]((uint64_t)self, v21);
    }

    double v22 = +[SBDefaults localDefaults];
    double v23 = [v22 inCallPresentationDefaults];
    int v24 = [v23 assertNoZombieInCallScenes];

    if (v24)
    {
      double v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"SBInCallPresentationSession.m", 1108, @"ICSZOMBIE: Found a zombie ICS presentation %@", self object file lineNumber description];
    }
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

void __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 48) layoutMode] >= 2) {
    [v3 setSource:61];
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_2;
  v5[3] = &unk_1E6AFCFB8;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  char v7 = *(unsigned char *)(a1 + 48);
  [v3 modifyApplicationContext:v5];
  [v3 setShouldPreventEmergencyNotificationBannerDismissal:*(unsigned char *)(a1 + 49) == 0];
}

void __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 384);
  id v9 = a2;
  uint64_t v4 = [v3 currentInterfaceOrientation];
  BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 384) sceneIfExists];
  id v6 = [v5 uiSettings];
  uint64_t v7 = [v6 interfaceOrientationMode];

  if (v7 == 1) {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 384) _bestSupportedInterfaceOrientationForOrientation:v4];
  }
  [v9 setEntity:*(void *)(a1 + 40) forLayoutRole:1];
  char v8 = +[SBWorkspaceEntity entity];
  [v9 setEntity:v8 forLayoutRole:2];

  [v9 setRequestedUnlockedEnvironmentMode:3];
  [v9 setInterfaceOrientation:v4];
  [v9 setPrefersCrossfadeTransition:1];
  [v9 setAnimationDisabled:*(unsigned char *)(a1 + 48) == 0];
}

void __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 216) == *(void *)(a1 + 64))
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__38;
    v17[4] = __Block_byref_object_dispose__38;
    id v18 = 0;
    id v3 = *(void **)(v2 + 144);
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 392));
    BOOL v5 = [WeakRetained _fbsDisplayConfiguration];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_4;
    v13[3] = &unk_1E6AFF4D0;
    id v14 = *(id *)(a1 + 48);
    id v16 = v17;
    id v6 = *(id *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 32);
    id v15 = v6;
    v13[4] = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_6;
    v10[3] = &unk_1E6AFF4F8;
    void v10[4] = v7;
    id v12 = v17;
    id v11 = *(id *)(a1 + 40);
    [v3 requestTransitionWithOptions:0 displayConfiguration:v5 builder:v13 validator:v10];

    _Block_object_dispose(v17, 8);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
      v9();
    }
  }
}

void __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_5;
  v7[3] = &unk_1E6AFF4A8;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v6;
  long long v8 = v6;
  void v7[4] = *(void *)(a1 + 32);
  id v5 = (id)[v3 addCompletionHandler:v7];
}

uint64_t __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_5(void *a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1[6] + 8) + 40) invalidate];
  uint64_t result = a1[5];
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  *(unsigned char *)(a1[4] + 212) = 0;
  return result;
}

uint64_t __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = [a2 applicationContext];
  id v4 = [v3 previousLayoutState];
  id v5 = [v3 layoutState];
  long long v6 = v5;
  if (v5 == v4
    || ([v5 isEqual:v4] & 1) != 0
    || ![*(id *)(a1 + 32) _isValidForSceneUpdates])
  {
    uint64_t v13 = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 212) = 1;
    if (!*(void *)(*(void *)(a1 + 32) + 288))
    {
      uint64_t v7 = [v4 elementWithRole:1];
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 288);
      *(void *)(v8 + 288) = v7;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v10 = [*(id *)(a1 + 32) _acquireAssertionForAnalyticsSource:*(void *)(a1 + 40)];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    uint64_t v13 = 1;
  }

  return v13;
}

uint64_t __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __121__SBInCallPresentationSession__performSwitcherPresentationTransitionAnimated_isUserInitiated_analyticsSource_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_insertIntoSwitcherAsDismissedWithAnalyticsSource:(id)a3 transitionValidator:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v13 = [WeakRetained switcherController];
  id v14 = NSStringFromSelector(a2);
  unint64_t v15 = [(SBInCallPresentationSession *)self _incrementPresentationModeRevisionIDWithReason:v14];

  id v16 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:self->_sceneHandle];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke;
  v40[3] = &unk_1E6AFF5C0;
  v40[4] = self;
  id v17 = v13;
  id v41 = v17;
  id v18 = v11;
  id v43 = v18;
  unint64_t v45 = v15;
  id v19 = v10;
  id v44 = v19;
  id v20 = v9;
  id v42 = v20;
  uint64_t v21 = (void (**)(void))MEMORY[0x1D948C7A0](v40);
  if ([(SBDeviceApplicationSceneHandle *)self->_sceneHandle contentState])
  {
    v21[2](v21);
  }
  else
  {
    workspace = self->_workspace;
    double v23 = [WeakRetained _fbsDisplayConfiguration];
    int v24 = [(SBMainWorkspace *)workspace createRequestWithOptions:2 displayConfiguration:v23];

    [v24 finalize];
    double v35 = [v24 applicationContext];
    [v35 frameForApplicationSceneEntity:v16];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v33 = [SBInCallPresentationSceneUpdateContext alloc];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_5;
    v38[3] = &unk_1E6AF57E8;
    id v39 = v17;
    double v34 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v33, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v20, v38, v26, v28, v30, v32);
    [(SBInCallPresentationSceneUpdateContext *)v34 setExecutionTarget:1];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_7;
    v36[3] = &unk_1E6AF5A50;
    double v37 = v21;
    [(SBInCallPresentationSceneUpdateContext *)v34 setCompletionHandler:v36];
    [(SBInCallPresentationSession *)self _performSceneUpdateTransactionWithContext:v34];
  }
}

void __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke(uint64_t a1)
{
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__38;
  v15[4] = __Block_byref_object_dispose__38;
  id v16 = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 144);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_2;
  v11[3] = &unk_1E6AFF570;
  id v14 = v15;
  v11[4] = v2;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_4;
  v6[3] = &unk_1E6AFF598;
  id v5 = *(void **)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  v6[4] = *(void *)(a1 + 32);
  uint64_t v10 = v4;
  id v8 = v5;
  id v9 = v15;
  id v7 = *(id *)(a1 + 48);
  [v3 requestTransitionWithOptions:2 builder:v11 validator:v6];

  _Block_object_dispose(v15, 8);
}

void __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_3;
  v7[3] = &unk_1E6AFF548;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  void v7[4] = v4;
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v6 = (id)[a2 addCompletionHandler:v7];
}

uint64_t __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_3(uint64_t a1, int a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidate];
  if (a2)
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 384) displayItemRepresentation];
    [*(id *)(a1 + 40) addAppLayoutForDisplayItem:v4 completion:0];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

uint64_t __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4[27] == *(void *)(a1 + 64)
    && ([v4 _isInSwitcherModel] & 1) == 0
    && [*(id *)(a1 + 32) _isValidForSceneUpdates]
    && (*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v5 = [*(id *)(a1 + 32) _acquireAssertionForAnalyticsSource:*(void *)(a1 + 40)];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_5(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_6;
  v3[3] = &unk_1E6AF57C0;
  id v4 = *(id *)(a1 + 32);
  [a2 modifyApplicationContext:v3];
}

void __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setInterfaceOrientation:", objc_msgSend(v2, "interfaceOrientation"));
}

uint64_t __112__SBInCallPresentationSession__insertIntoSwitcherAsDismissedWithAnalyticsSource_transitionValidator_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removeFromSwitcherForPrefersHiddenWhenDismissedWithValidator:(id)a3
{
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(a2);
  unint64_t v7 = [(SBInCallPresentationSession *)self _incrementPresentationModeRevisionIDWithReason:v6];

  workspace = self->_workspace;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__SBInCallPresentationSession__removeFromSwitcherForPrefersHiddenWhenDismissedWithValidator___block_invoke;
  v10[3] = &unk_1E6AFF5E8;
  id v11 = v5;
  unint64_t v12 = v7;
  void v10[4] = self;
  id v9 = v5;
  [(SBMainWorkspace *)workspace requestTransitionWithOptions:2 builder:0 validator:v10];
}

uint64_t __93__SBInCallPresentationSession__removeFromSwitcherForPrefersHiddenWhenDismissedWithValidator___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  if (a1[6] == *(void *)(v4 + 216)
    && ([*(id *)(v4 + 152) isAnySwitcherVisible] & 1) == 0
    && (*(unsigned int (**)(void))(a1[5] + 16))())
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void **)(v5 + 152);
    unint64_t v7 = [*(id *)(v5 + 384) displayItemRepresentation];
    [v6 removeAppLayoutForDisplayItem:v7 shouldDestroyScene:0];

    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_performTransientOverlayPresentationTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSStringFromSelector(a2);
  unint64_t v12 = [(SBInCallPresentationSession *)self _incrementPresentationModeRevisionIDWithReason:v11];

  BOOL v13 = v6 && [(SBBacklightController *)self->_backlightController screenIsOn];
  workspace = self->_workspace;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke;
  v18[3] = &unk_1E6AFF638;
  BOOL v21 = v13;
  id v19 = v9;
  id v20 = v10;
  v18[4] = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4;
  v17[3] = &unk_1E6AFF3C0;
  v17[4] = self;
  void v17[5] = v12;
  id v15 = v9;
  id v16 = v10;
  [(SBMainWorkspace *)workspace requestTransitionWithOptions:0 builder:v18 validator:v17];
}

void __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2;
  v8[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceTransientOverlayTransitionContext_8l;
  char v9 = *(unsigned char *)(a1 + 56);
  id v3 = a2;
  [v3 modifyTransientOverlayContext:v8];
  id v4 = (id)[v3 addCompletionHandler:*(void *)(a1 + 48)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3;
  v6[3] = &unk_1E6AFF610;
  uint64_t v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v3 setTransactionProvider:v6];
}

uint64_t __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAnimated:*(unsigned __int8 *)(a1 + 32)];
}

SBInCallTransientOverlayPresentationWorkspaceTransaction *__113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SBInCallTransientOverlayPresentationWorkspaceTransaction alloc] initWithTransitionRequest:v3 sourcePresentationSession:*(void *)(a1 + 32) analyticsSource:*(void *)(a1 + 40)];

  return v4;
}

uint64_t __113__SBInCallPresentationSession__performTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[27] != *(void *)(a1 + 40) || ![v2 _isValidForSceneUpdates]) {
    return 0;
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = 1;
  [v3 _setTransientOverlayPresentationActive:1];
  return v4;
}

- (void)_performBannerToFullScreenPresentationTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = NSStringFromSelector(a2);
  unint64_t v12 = [(SBInCallPresentationSession *)self _incrementPresentationModeRevisionIDWithReason:v11];

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__38;
  v31[4] = __Block_byref_object_dispose__38;
  id v32 = 0;
  BOOL v13 = [(id)SBApp windowSceneManager];
  id v14 = [v13 windowSceneForSceneHandle:self->_sceneHandle];

  id v15 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:self->_sceneHandle];
  workspace = self->_workspace;
  id v17 = [v14 _sbDisplayConfiguration];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke;
  v26[3] = &unk_1E6AFF688;
  v26[4] = self;
  BOOL v30 = a3;
  double v27 = v15;
  double v29 = v31;
  id v18 = v10;
  id v28 = v18;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4;
  v21[3] = &unk_1E6AFF6B0;
  int v24 = v31;
  unint64_t v25 = v12;
  v21[4] = self;
  id v19 = v9;
  id v22 = v19;
  id v20 = v27;
  double v23 = v20;
  [(SBMainWorkspace *)workspace requestTransitionWithOptions:0 displayConfiguration:v17 builder:v26 validator:v21];

  _Block_object_dispose(v31, 8);
}

void __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:37];
  [v3 setBannerUnfurlSourceContextProvider:*(void *)(a1 + 32)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2;
  v11[3] = &unk_1E6AF5C08;
  id v12 = *(id *)(a1 + 40);
  char v13 = *(unsigned char *)(a1 + 64);
  [v3 modifyApplicationContext:v11];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3;
  v8[3] = &unk_1E6AFF660;
  uint64_t v4 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = (id)[v3 addCompletionHandler:v8];
}

void __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v10[0] = *(void *)(a1 + 32);
  BOOL v4 = 1;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v3 setEntities:v5 withPolicy:0 centerEntity:0 floatingEntity:0];

  if (*(unsigned char *)(a1 + 40))
  {
    id v6 = +[SBAppSwitcherDomain rootSettings];
    long long v7 = [v6 animationSettings];
    uint64_t v8 = [v7 bannerUnfurlSettings];

    [v8 dampingRatio];
    [v8 response];
    convertDampingRatioAndResponseToTensionAndFriction();
    id v9 = [MEMORY[0x1E4F4F840] settingsWithMass:1.0 stiffness:0.0 damping:0.0];
    [v3 setAnimationSettings:v9];

    [v3 setFencesAnimations:1];
    BOOL v4 = *(unsigned char *)(a1 + 40) == 0;
  }
  [v3 setAnimationDisabled:v4];
}

uint64_t __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3(void *a1)
{
  [*(id *)(a1[4] + 136) removeObjectForKey:a1[5]];
  if (![*(id *)(a1[4] + 136) count])
  {
    uint64_t v2 = a1[4];
    id v3 = *(void **)(v2 + 136);
    *(void *)(v2 + 136) = 0;
  }
  *(unsigned char *)(a1[4] + 212) = 0;
  [*(id *)(*(void *)(a1[7] + 8) + 40) invalidate];
  uint64_t result = a1[6];
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __115__SBInCallPresentationSession__performBannerToFullScreenPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  if (v4[27] == *(void *)(a1 + 64) && [v4 _isValidForSceneUpdates])
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v5 = [*(id *)(a1 + 32) _acquireAssertionForAnalyticsSource:*(void *)(a1 + 40)];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      long long v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v8 + 209))
    {
      *(unsigned char *)(v8 + 209) = 0;
      id v9 = *(void **)(a1 + 32);
      long long v10 = (void *)v9[5];
      if (v10)
      {
        id v11 = [v10 view];
        id v12 = [*(id *)(a1 + 32) _screen];
        char v13 = [v12 fixedCoordinateSpace];

        [v11 bounds];
        objc_msgSend(v11, "convertRect:toCoordinateSpace:", v13);
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        id v22 = objc_alloc_init(SBMutableBannerUnfurlSourceContext);
        -[SBMutableBannerUnfurlSourceContext setReferenceFrame:](v22, "setReferenceFrame:", v15, v17, v19, v21);
        [v13 bounds];
        -[SBMutableBannerUnfurlSourceContext setReferenceCoordinateSpaceBounds:](v22, "setReferenceCoordinateSpaceBounds:");
        +[SBInCallBannerPresentableViewController cornerRadius];
        -[SBMutableBannerUnfurlSourceContext setCornerRadius:](v22, "setCornerRadius:");
        [*(id *)(*(void *)(a1 + 32) + 40) velocityInCoordinateSpace:v13];
        -[SBMutableBannerUnfurlSourceContext setReferenceVelocity:](v22, "setReferenceVelocity:");
        double v23 = *(void **)(*(void *)(a1 + 32) + 136);
        if (!v23)
        {
          uint64_t v24 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          uint64_t v25 = *(void *)(a1 + 32);
          double v26 = *(void **)(v25 + 136);
          *(void *)(v25 + 136) = v24;

          double v23 = *(void **)(*(void *)(a1 + 32) + 136);
        }
        [v23 setObject:v22 forKey:*(void *)(a1 + 48)];
        uint64_t v27 = *(void *)(a1 + 32);
        id v28 = *(void **)(v27 + 64);
        double v29 = [MEMORY[0x1E4F4F5E8] uniqueIdentificationForPresentable:*(void *)(v27 + 40)];
        id v30 = (id)[v28 revokePresentablesWithIdentification:v29 reason:@"_SBInCallBannerRevocationReasonBannerUnfurl" options:0 animated:0 userInfo:0 error:0];

        [*(id *)(a1 + 32) _setNonModalPresentationActive:0];
        id v9 = *(void **)(a1 + 32);
      }
      double v31 = [v3 applicationContext];
      id v32 = [v31 layoutState];
      uint64_t v33 = objc_opt_class();
      id v34 = v32;
      if (v33)
      {
        if (objc_opt_isKindOfClass()) {
          double v35 = v34;
        }
        else {
          double v35 = 0;
        }
      }
      else
      {
        double v35 = 0;
      }
      id v37 = v35;

      [v9 _updateAppStatusBarSettingsAssertionForLayoutState:v37];
      uint64_t v8 = *(void *)(a1 + 32);
      if (!*(void *)(v8 + 288))
      {
        double v38 = [v3 applicationContext];
        id v39 = [v38 previousLayoutState];
        uint64_t v40 = [v39 elementWithRole:1];
        uint64_t v41 = *(void *)(a1 + 32);
        id v42 = *(void **)(v41 + 288);
        *(void *)(v41 + 288) = v40;

        uint64_t v8 = *(void *)(a1 + 32);
      }
    }
    uint64_t v36 = 1;
    *(unsigned char *)(v8 + 212) = 1;
  }
  else
  {
    uint64_t v36 = 0;
  }

  return v36;
}

- (void)_performBannerToTransientOverlayPresentationTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = NSStringFromSelector(a2);
  unint64_t v12 = [(SBInCallPresentationSession *)self _incrementPresentationModeRevisionIDWithReason:v11];

  workspace = self->_workspace;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke;
  v17[3] = &unk_1E6AFF638;
  BOOL v20 = a3;
  id v18 = v9;
  id v19 = v10;
  v17[4] = self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4;
  v16[3] = &unk_1E6AFF3C0;
  v16[4] = self;
  v16[5] = v12;
  id v14 = v9;
  id v15 = v10;
  [(SBMainWorkspace *)workspace requestTransitionWithOptions:0 builder:v17 validator:v16];
}

void __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2;
  v8[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceTransientOverlayTransitionContext_8l;
  char v9 = *(unsigned char *)(a1 + 56);
  id v3 = a2;
  [v3 modifyTransientOverlayContext:v8];
  id v4 = (id)[v3 addCompletionHandler:*(void *)(a1 + 48)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3;
  v6[3] = &unk_1E6AFF610;
  uint64_t v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v3 setTransactionProvider:v6];
}

uint64_t __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAnimated:*(unsigned __int8 *)(a1 + 32)];
}

SBInCallTransientOverlayPresentationWorkspaceTransaction *__121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SBInCallTransientOverlayPresentationWorkspaceTransaction alloc] initWithTransitionRequest:v3 sourcePresentationSession:*(void *)(a1 + 32) analyticsSource:*(void *)(a1 + 40)];

  return v4;
}

uint64_t __121__SBInCallPresentationSession__performBannerToTransientOverlayPresentationTransitionAnimated_analyticsSource_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[27] != *(void *)(a1 + 40) || ![v2 _isValidForSceneUpdates]) {
    return 0;
  }
  uint64_t v3 = 1;
  [*(id *)(a1 + 32) _setTransientOverlayPresentationActive:1];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 209))
  {
    uint64_t v5 = *(void **)(v4 + 64);
    uint64_t v6 = [MEMORY[0x1E4F4F5E8] uniqueIdentificationForPresentable:*(void *)(v4 + 40)];
    id v7 = (id)[v5 revokePresentablesWithIdentification:v6 reason:@"_SBInCallBannerRevocationReasonTransientOverlayPresentation" options:0 animated:0 userInfo:0 error:0];

    [*(id *)(a1 + 32) _setNonModalPresentationActive:0];
    return 1;
  }
  return v3;
}

- (void)_performBannerPresentationTransitionWithAnalyticsSource:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = NSStringFromSelector(a2);
  unint64_t v10 = [(SBInCallPresentationSession *)self _incrementPresentationModeRevisionIDWithReason:v9];

  [(SBInCallPresentationSession *)self _setNonModalPresentationActive:1];
  id v11 = [(SBInCallPresentationSession *)self windowScene];
  [(SBInCallPresentationSession *)self _presentedBannerBoundsInWindowScene:v11];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v38 = v18;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v20 = [WeakRetained inCallClientPresentationSessionInterfaceOrientationForBannerPresentation:self];

  double v21 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  if (v20) {
    BOOL v23 = (v22 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else {
    BOOL v23 = 0;
  }
  if (v23) {
    uint64_t v24 = v20;
  }
  else {
    uint64_t v24 = 1;
  }
  uint64_t v25 = [(SBInCallPresentationSession *)self _screen];
  double v26 = [v25 fixedCoordinateSpace];
  [v26 bounds];
  _UIWindowConvertRectFromOrientationToOrientation();
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  double v35 = [SBInCallPresentationSceneUpdateContext alloc];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke;
  v46[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
  v46[4] = v24;
  uint64_t v36 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v35, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v7, v46, v28, v30, v32, v34);
  [(SBInCallPresentationSceneUpdateContext *)v36 setExecutionTarget:1];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_3;
  v39[3] = &unk_1E6AFF6D8;
  id v40 = v7;
  unint64_t v41 = v10;
  uint64_t v42 = v13;
  uint64_t v43 = v15;
  uint64_t v44 = v17;
  uint64_t v45 = v38;
  v39[4] = self;
  id v37 = v7;
  [(SBInCallPresentationSceneUpdateContext *)v36 setPostSceneUpdateHandler:v39];
  [(SBInCallPresentationSceneUpdateContext *)v36 setCompletionHandler:v8];

  [(SBInCallPresentationSession *)self _performSceneUpdateTransactionWithContext:v36];
}

uint64_t __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_2;
  v3[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 modifyApplicationContext:v3];
}

uint64_t __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setInterfaceOrientation:*(void *)(a1 + 32)];
}

void __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 216) == *(void *)(a1 + 48))
  {
    uint64_t v6 = *(void *)(v5 + 40);
    if (!v6)
    {
      id v7 = [[SBInCallBannerPresentableViewController alloc] initWithSceneHandle:*(void *)(*(void *)(a1 + 32) + 384)];
      uint64_t v8 = *(void *)(a1 + 32);
      char v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setDelegate:");
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setPreferredBannerContentSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 40);
    }
    if ([*(id *)(v5 + 64) postPresentable:v6 withOptions:1 userInfo:0 error:0])
    {
      v4[2](v4, 1);
    }
    else
    {
      [*(id *)(a1 + 32) _setNonModalPresentationActive:0];
      uint64_t v12 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_4;
      v13[3] = &unk_1E6AF5A50;
      uint64_t v14 = v4;
      [v12 _performPresentationWithRequestedPresentationMode:2 isUserInitiated:0 animated:1 analyticsSource:v11 completion:v13];
    }
  }
  else
  {
    if (*(unsigned char *)(v5 + 209))
    {
      if (*(void *)(v5 + 40))
      {
        BOOL v10 = 1;
      }
      else
      {
        [(id)v5 _setNonModalPresentationActive:0];
        BOOL v10 = *(unsigned char *)(*(void *)(a1 + 32) + 209) != 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
    v4[2](v4, v10);
  }
}

uint64_t __98__SBInCallPresentationSession__performBannerPresentationTransitionWithAnalyticsSource_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setNonModalPresentationsSuppressed:(BOOL)a3
{
  if (self->_nonModalPresentationsSuppressed != a3)
  {
    self->_nonModalPresentationsSuppressed = a3;
    if (!a3)
    {
      jindoElement = self->_jindoElement;
      if (jindoElement)
      {
        if (!self->_jindoInvalidatable
          && [(SBSystemApertureSceneElement *)jindoElement isReadyForPresentation]
          && !self->_isInvalidated)
        {
          id v7 = [(id)SBApp systemApertureControllerForMainDisplay];
          uint64_t v5 = [v7 registerElement:self->_jindoElement];
          jindoInvalidatable = self->_jindoInvalidatable;
          self->_jindoInvalidatable = v5;
        }
      }
    }
  }
}

- (void)_createJindoElementIfNeeded
{
  if (SBUIIsSystemApertureEnabled() && !self->_jindoElement)
  {
    [(SBInCallPresentationSession *)self _createJindoElement];
  }
}

- (void)_createJindoElement
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4FA7DA0]);
  uint64_t v4 = (void *)MEMORY[0x1E4F963F8];
  uint64_t v5 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  uint64_t v6 = [v5 processState];
  id v7 = objc_msgSend(v4, "identifierWithPid:", objc_msgSend(v6, "pid"));

  uint64_t v8 = [MEMORY[0x1E4F963E8] handleForIdentifier:v7 error:0];
  char v9 = [v8 identity];
  BOOL v10 = [FBSSceneClientIdentity identityForProcessIdentity:v9];
  uint64_t v11 = [(id)SBApp systemApertureControllerForMainDisplay];
  uint64_t v12 = [SBSystemApertureSceneElement alloc];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__SBInCallPresentationSession__createJindoElement__block_invoke;
  v17[3] = &unk_1E6AF91A0;
  objc_copyWeak(&v19, &location);
  id v13 = v11;
  id v18 = v13;
  uint64_t v14 = [(SBSystemApertureSceneElement *)v12 initWithSceneSpecification:v3 sceneClientIdentity:v10 statusBarBackgroundActivitiesSuppresser:v13 readyForPresentationHandler:v17];
  jindoElement = self->_jindoElement;
  self->_jindoElement = v14;

  uint64_t v16 = objc_alloc_init(SBSystemApertureSceneElementConfiguration);
  [(SBSystemApertureSceneElementConfiguration *)v16 setEntersBackgroundWhenBacklightIsOff:1];
  [(SBSystemApertureSceneElementConfiguration *)v16 setMinimalPresentationPossible:1];
  [(SBSystemApertureSceneElement *)self->_jindoElement setConfiguration:v16];
  [(SBSystemApertureSceneElement *)self->_jindoElement setLaunchActionHandler:self];
  [(SBSystemApertureSceneElement *)self->_jindoElement setAlwaysAllowTapToAppForBodyTaps:1];
  [(SBSystemApertureSceneElement *)self->_jindoElement setAssociatedApplicationSceneHandle:self->_sceneHandle];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __50__SBInCallPresentationSession__createJindoElement__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained && a3 && ([WeakRetained areNonModalPresentationsSuppressed] & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 32) registerElement:v9];
    uint64_t v8 = (void *)v6[7];
    v6[7] = v7;
  }
}

- (void)_activeJindoElementIfNeeded
{
  jindoElement = self->_jindoElement;
  if (jindoElement && ![(SBSystemApertureSceneElement *)jindoElement isActivated])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    uint64_t v4 = [(SBApplicationSceneHandle *)self->_sceneHandle persistenceIdentifier];
    objc_msgSend(v5, "SBUISA_setString:forSetting:", v4, 3213023);

    [(SBSystemApertureSceneElement *)self->_jindoElement activateWithInitialOtherClientSettings:v5];
  }
}

- (void)_invalidateJindoElementIfNeeded
{
  uint64_t v6 = self->_jindoElement;
  id v3 = self->_jindoInvalidatable;
  jindoElement = self->_jindoElement;
  self->_jindoElement = 0;

  jindoInvalidatable = self->_jindoInvalidatable;
  self->_jindoInvalidatable = 0;

  if ([(SBSystemApertureSceneElement *)v6 isActivated]
    && ![(SBSystemApertureSceneElement *)v6 isDeactivating])
  {
    [(SBSystemApertureSceneElement *)v6 deactivateWhenRemovedWithHandler:0];
  }
  if ([(SAInvalidatable *)v3 isValid]) {
    [(SAInvalidatable *)v3 invalidateWithReason:@"SBInCallPresentationSession request"];
  }
}

- (int64_t)sceneElement:(id)a3 decisionForLaunchActionOfAppWithBundleIdentifier:(id)a4 persistenceIdentifier:(id)a5
{
  id v7 = a5;
  sceneHandle = self->_sceneHandle;
  id v9 = a4;
  BOOL v10 = [(SBApplicationSceneHandle *)sceneHandle application];
  uint64_t v11 = [v10 bundleIdentifier];
  char v12 = BSEqualStrings();

  if ((v12 & 1) != 0
    || !v9
    && ([(SBApplicationSceneHandle *)self->_sceneHandle persistenceIdentifier],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v7 isEqualToString:v16],
        v16,
        v17))
  {
    id v13 = objc_alloc(MEMORY[0x1E4FA7B88]);
    int64_t v14 = 1;
    uint64_t v15 = (void *)[v13 initWithRequestedPresentationMode:2 isUserInitiated:1 analyticsSource:*MEMORY[0x1E4FA7E10] responseHandler:&__block_literal_global_147];
    [(SBInCallPresentationSession *)self _handleRequestInCallPresentationModeAction:v15];
  }
  else
  {
    int64_t v14 = 2;
  }

  return v14;
}

- (void)_performBannerDismissalTransitionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v22 = a4;
  id v9 = (void (**)(id, void))a5;
  if (!self->_isNonModalPresentationActive)
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"SBInCallPresentationSession.m" lineNumber:1537 description:@"_performBannerDismissalTransitionAnimated without an active presentation"];
  }
  BOOL v10 = NSStringFromSelector(a2);
  [(SBInCallPresentationSession *)self _incrementPresentationModeRevisionIDWithReason:v10];

  if (v9)
  {
    uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    bannerDidDisappearHandlerByUUID = self->_bannerDidDisappearHandlerByUUID;
    if (!bannerDidDisappearHandlerByUUID)
    {
      id v13 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      int64_t v14 = self->_bannerDidDisappearHandlerByUUID;
      self->_bannerDidDisappearHandlerByUUID = v13;

      bannerDidDisappearHandlerByUUID = self->_bannerDidDisappearHandlerByUUID;
    }
    uint64_t v15 = (void *)MEMORY[0x1D948C7A0](v9);
    [(NSMutableDictionary *)bannerDidDisappearHandlerByUUID setObject:v15 forKey:v11];
  }
  else
  {
    uint64_t v11 = 0;
  }
  bannerManager = self->_bannerManager;
  int v17 = [MEMORY[0x1E4F4F5E8] uniqueIdentificationForPresentable:self->_bannerPresentableViewController];
  id v18 = [(SBBannerManager *)bannerManager revokePresentablesWithIdentification:v17 reason:@"_SBInCallBannerRevocationReasonSessionRequest" options:0 animated:v6 userInfo:0 error:0];

  if (!v18)
  {
    if (v11)
    {
      id v19 = [(NSMutableDictionary *)self->_bannerDidDisappearHandlerByUUID objectForKey:v11];

      if (v19)
      {
        [(NSMutableDictionary *)self->_bannerDidDisappearHandlerByUUID removeObjectForKey:v11];
        v9[2](v9, 0);
      }
    }
  }
  if (!v6
    || ![(SBInCallBannerPresentableViewController *)self->_bannerPresentableViewController _appearState])
  {
    bannerPresentableViewController = self->_bannerPresentableViewController;
    self->_bannerPresentableViewController = 0;

    [(SBInCallPresentationSession *)self _setNonModalPresentationActive:0];
  }
}

- (void)_performSwitcherDismissalTransitionAnimated:(BOOL)a3 shouldDestroyScene:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  char v12 = NSStringFromSelector(a2);
  unint64_t v13 = [(SBInCallPresentationSession *)self _incrementPresentationModeRevisionIDWithReason:v12];

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__38;
  void v28[4] = __Block_byref_object_dispose__38;
  id v29 = 0;
  if (v7) {
    [(SBInCallPresentationSession *)self _invalidateJindoElementIfNeeded];
  }
  workspace = self->_workspace;
  uint64_t v15 = [(SBInCallPresentationSession *)self windowScene];
  uint64_t v16 = [v15 _fbsDisplayConfiguration];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke;
  v24[3] = &unk_1E6AFF728;
  BOOL v27 = v7;
  v24[4] = self;
  double v26 = v28;
  id v17 = v11;
  id v25 = v17;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_2_156;
  v19[3] = &unk_1E6AFF750;
  double v21 = v28;
  unint64_t v22 = v13;
  BOOL v23 = v7;
  v19[4] = self;
  id v18 = v10;
  id v20 = v18;
  [(SBMainWorkspace *)workspace requestTransitionWithOptions:0 displayConfiguration:v16 builder:v24 validator:v19];

  _Block_object_dispose(v28, 8);
}

void __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:69];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_2;
  v11[3] = &unk_1E6AFCFB8;
  uint64_t v4 = *(void *)(a1 + 32);
  char v13 = *(unsigned char *)(a1 + 56);
  void v11[4] = v4;
  id v12 = v3;
  id v5 = v3;
  [v5 modifyApplicationContext:v11];
  [v5 setShouldPreventEmergencyNotificationBannerDismissal:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_155;
  v9[3] = &unk_1E6AFF700;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v10 = v8;
  id v7 = (id)[v5 addCompletionHandler:v9];
}

void __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:*(void *)(*(void *)(a1 + 32) + 384)];
  [v3 setDeactivatingEntity:v4];
  [v3 setPrefersCrossfadeTransition:1];
  [v3 setAnimationDisabled:0];
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = [[SBWorkspaceEntityRemovalContext alloc] initWithAnimationStyle:1 removalActionType:1];
    [v3 setRemovalContext:v5 forEntity:v4];
  }
  id v6 = [v3 previousLayoutState];
  uint64_t v7 = objc_opt_class();
  long long v8 = SBSafeCast(v7, v6);
  if ([v8 unlockedEnvironmentMode] == 2) {
    [v3 setRequestedUnlockedEnvironmentMode:2];
  }
  id v9 = [*(id *)(*(void *)(a1 + 32) + 384) sceneIdentifier];
  long long v10 = objc_msgSend(v6, "elementWithRole:");
  id v11 = [v10 uniqueIdentifier];
  double v26 = v4;
  if ([v11 isEqualToString:v9])
  {
    id v12 = [v6 elementWithRole:2];
    BOOL v13 = v12 == 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  int64_t v14 = [*(id *)(*(void *)(a1 + 32) + 288) workspaceEntity];
  uint64_t v15 = [v14 deviceApplicationSceneEntity];
  uint64_t v16 = [v15 sceneHandle];
  id v17 = [v16 displayItemRepresentation];

  if (v14 && ([*(id *)(*(void *)(a1 + 32) + 152) hasAppLayoutForDisplayItem:v17] & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 368));
    int v19 = [WeakRetained inCallClientPresentationSession:*(void *)(a1 + 32) canRestoreToPreviousEntity:v14];

    if (v19)
    {
      id v20 = SBLogInCallPresentation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v28 = v14;
        _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "setting preferredDismissalPrimaryElement %@", buf, 0xCu);
      }

      [v3 setActivatingEntity:v14];
      [v3 setEntity:v14 forLayoutRole:1];
      double v21 = [*(id *)(a1 + 40) workspace];
      int v22 = [v21 canExecuteTransitionRequest:*(void *)(a1 + 40)];

      if ((v13 & ~v22 & 1) == 0) {
        goto LABEL_20;
      }
LABEL_16:
      if ([v8 unlockedEnvironmentMode] == 2)
      {
        BOOL v23 = +[SBWorkspaceEntity entity];
        [v3 setEntity:v23 forLayoutRole:1];
      }
      else
      {
        uint64_t v24 = +[SBWorkspaceEntity entity];
        [v3 setActivatingEntity:v24];

        [v3 setEntity:0 forLayoutRole:1];
      }
      goto LABEL_23;
    }
    if (v13) {
      goto LABEL_16;
    }
  }
  else if (v13)
  {
    goto LABEL_16;
  }
LABEL_20:
  id v25 = [v6 elementWithIdentifier:v9];

  if (!v25 && [v8 unlockedEnvironmentMode] != 2) {
    [*(id *)(a1 + 40) setShouldPreventDismissalOfUnrelatedTransientOverlays:1];
  }
LABEL_23:
}

uint64_t __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_155(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __121__SBInCallPresentationSession__performSwitcherDismissalTransitionAnimated_shouldDestroyScene_analyticsSource_completion___block_invoke_2_156(uint64_t a1, void *a2)
{
  if (*(void *)(*(void *)(a1 + 32) + 216) != *(void *)(a1 + 56)) {
    return 0;
  }
  id v3 = [a2 applicationContext];
  uint64_t v4 = [v3 previousLayoutState];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 384) sceneIdentifier];
  id v6 = [v4 elementWithIdentifier:v5];
  if (v6)
  {

    goto LABEL_4;
  }
  if (!*(unsigned char *)(a1 + 64))
  {

    uint64_t v7 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 152);
  long long v10 = [*(id *)(v8 + 384) displayItemRepresentation];
  LOBYTE(v9) = [v9 hasAppLayoutForDisplayItem:v10];

  if ((v9 & 1) == 0) {
    return 0;
  }
LABEL_4:
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v11 = [*(id *)(a1 + 32) _acquireAssertionForAnalyticsSource:*(void *)(a1 + 40)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v3 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
    uint64_t v7 = 1;
LABEL_11:

    return v7;
  }
  return 1;
}

- (void)_performTransientOverlayDismissalTransitionAnimated:(BOOL)a3 shouldInsertIntoSwitcherModel:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = NSStringFromSelector(a2);
  unint64_t v14 = [(SBInCallPresentationSession *)self _incrementPresentationModeRevisionIDWithReason:v13];

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__38;
  v31[4] = __Block_byref_object_dispose__38;
  id v32 = 0;
  uint64_t v15 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:self->_transientOverlayViewController];
  workspace = self->_workspace;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke;
  v24[3] = &unk_1E6AFF7A0;
  id v17 = v15;
  BOOL v29 = a3;
  BOOL v30 = a4;
  id v25 = v17;
  double v26 = self;
  double v28 = v31;
  id v18 = v12;
  id v27 = v18;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_5;
  v20[3] = &unk_1E6AFF7C8;
  int v22 = v31;
  unint64_t v23 = v14;
  v20[4] = self;
  id v19 = v11;
  id v21 = v19;
  [(SBMainWorkspace *)workspace requestTransitionWithOptions:0 builder:v24 validator:v20];

  _Block_object_dispose(v31, 8);
}

void __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEventLabelWithFormat:@"DismissInCallTransientOverlay(%llu) = %@", ++_SBInCallPresentationDeactivationReasonTransientOverlay_block_invoke_uniqueEventKey, *(void *)(a1 + 32)];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_2;
  v10[3] = &unk_1E6AF5C58;
  id v11 = *(id *)(a1 + 32);
  char v12 = *(unsigned char *)(a1 + 64);
  [v3 modifyTransientOverlayContext:v10];
  [v3 modifyApplicationContext:&__block_literal_global_162];
  [v3 setShouldPreventEmergencyNotificationBannerDismissal:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_4;
  v7[3] = &unk_1E6AFF778;
  char v9 = *(unsigned char *)(a1 + 65);
  void v7[4] = *(void *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v6;
  long long v8 = v6;
  id v5 = (id)[v3 addCompletionHandler:v7];
}

void __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTransitionType:1];
  [v3 setTransientOverlay:*(void *)(a1 + 32)];
  [v3 setAnimated:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setWaitsForSceneUpdates:0];
}

uint64_t __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 384) displayItemRepresentation];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 392));
    id v4 = [WeakRetained switcherController];
    [v4 addAppLayoutForDisplayItem:v2 completion:0];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    long long v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

BOOL __140__SBInCallPresentationSession__performTransientOverlayDismissalTransitionAnimated_shouldInsertIntoSwitcherModel_analyticsSource_completion___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = v4[27];
  uint64_t v6 = a1[7];
  if (v5 == v6 && !*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v7 = [v4 _acquireAssertionForAnalyticsSource:a1[5]];
    uint64_t v8 = *(void *)(a1[6] + 8);
    char v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  return v5 == v6;
}

- (void)_performPresentationWithRequestedPresentationMode:(int64_t)a3 isUserInitiated:(BOOL)a4 animated:(BOOL)a5 analyticsSource:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = a7;
  unint64_t v14 = (void (**)(void, void))v13;
  switch(a3)
  {
    case 0:
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke;
      v37[3] = &unk_1E6AF5A50;
      id v38 = v13;
      [(SBInCallPresentationSession *)self dismissAnimated:v8 shouldFinalizeSceneDestruction:0 analyticsSource:v12 completion:v37];
      uint64_t v15 = v38;
      goto LABEL_24;
    case 1:
      if (![(SBInCallPresentationSession *)self _allowsNonModalPresentation]) {
        goto LABEL_9;
      }
      if (!self->_jindoElement)
      {
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_163;
        v35[3] = &unk_1E6AF5A50;
        uint64_t v36 = v14;
        [(SBInCallPresentationSession *)self _performNonModalPresentationTransitionWithAnalyticsSource:v12 completion:v35];
        uint64_t v15 = v36;
        goto LABEL_24;
      }
      uint64_t v16 = SBLogInCallPresentation();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SBInCallPresentationSession _performPresentationWithRequestedPresentationMode:isUserInitiated:animated:analyticsSource:completion:]((uint64_t)self, v16);
      }

      if (!v14) {
        goto LABEL_25;
      }
      goto LABEL_14;
    case 2:
LABEL_9:
      if (self->_isScreenSharingPresentation
        && [(SBLockScreenManager *)self->_lockScreenManager isUILocked])
      {
        id v17 = SBLogInCallPresentation();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[SBInCallPresentationSession _performPresentationWithRequestedPresentationMode:isUserInitiated:animated:analyticsSource:completion:](v17, v18, v19, v20, v21, v22, v23, v24);
        }

LABEL_14:
        v14[2](v14, 0);
      }
      else
      {
        if ([(SBInCallPresentationSession *)self _shouldUseTransientOverlayForFullScreenPresentation])
        {
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_164;
          v33[3] = &unk_1E6AF5A50;
          double v34 = v14;
          [(SBInCallPresentationSession *)self _performTransientOverlayPresentationTransitionAnimated:v8 analyticsSource:v12 completion:v33];
          uint64_t v15 = v34;
        }
        else if (self->_isNonModalPresentationActive)
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_2;
          v31[3] = &unk_1E6AF5A50;
          id v32 = v14;
          [(SBInCallPresentationSession *)self _performBannerToFullScreenPresentationTransitionAnimated:v8 analyticsSource:v12 completion:v31];
          uint64_t v15 = v32;
        }
        else
        {
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_3;
          v29[3] = &unk_1E6AF5A50;
          BOOL v30 = v14;
          [(SBInCallPresentationSession *)self _performSwitcherPresentationTransitionAnimated:v8 isUserInitiated:v9 analyticsSource:v12 completion:v29];
          uint64_t v15 = v30;
        }
LABEL_24:
      }
LABEL_25:

      return;
    case 3:
      self->_hasAdoptedFullscreenOverlayAPI = 1;
      if (self->_isNonModalPresentationActive)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_4;
        v27[3] = &unk_1E6AF5A50;
        id v28 = v13;
        [(SBInCallPresentationSession *)self _performBannerToTransientOverlayPresentationTransitionAnimated:v8 analyticsSource:v12 completion:v27];
        uint64_t v15 = v28;
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_5;
        v25[3] = &unk_1E6AF5A50;
        id v26 = v13;
        [(SBInCallPresentationSession *)self _performTransientOverlayPresentationTransitionAnimated:v8 analyticsSource:v12 completion:v25];
        uint64_t v15 = v26;
      }
      goto LABEL_24;
    default:
      goto LABEL_25;
  }
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_163(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_164(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __133__SBInCallPresentationSession__performPresentationWithRequestedPresentationMode_isUserInitiated_animated_analyticsSource_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_uiLockStateDidChange:(id)a3
{
  [(SBInCallPresentationSession *)self _updateSceneDeactivationAssertions];
  id v4 = [SBInCallPresentationSceneUpdateContext alloc];
  uint64_t v5 = [(SBInCallPresentationSession *)self _screen];
  uint64_t v6 = [v5 fixedCoordinateSpace];
  [v6 bounds];
  uint64_t v7 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v4, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", *MEMORY[0x1E4FA7E20], &__block_literal_global_166_0);

  [(SBInCallPresentationSceneUpdateContext *)v7 setExecutionTarget:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __53__SBInCallPresentationSession__uiLockStateDidChange___block_invoke_2;
  v8[3] = &unk_1E6AFBD00;
  void v8[4] = self;
  [(SBInCallPresentationSceneUpdateContext *)v7 setValidatorHandler:v8];
  [(SBInCallPresentationSession *)self _performSceneUpdateTransactionWithContext:v7];
  [(SBInCallPresentationSession *)self _updateSystemControlsShouldPresentAsEmbedded];
  if (self->_isTransientOverlayPresentationActive) {
    [(SBTransientOverlayViewController *)self->_transientOverlayViewController setNeedsIdleTimerReset];
  }
}

uint64_t __53__SBInCallPresentationSession__uiLockStateDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 applicationContext];
  id v4 = [v3 layoutState];
  uint64_t v5 = [v2 _hasExistingSceneSettingsPresentationModeForLayoutState:v4] ^ 1;

  return v5;
}

- (void)presentWithRequestedConfiguration:(id)a3 animated:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = SBLogInCallPresentation();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = self;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ handling presentation request with config %{public}@", buf, 0x16u);
  }

  self->_preventsBannersWhenPresentedAsOverlay = [v10 shouldPreventBannersWhenPresentedAsOverlay];
  self->_prefersContinuityDisplayForFullScreenPresentation = [v10 shouldPreferContinuityDisplayForFullScreenPresentation];
  if (([v10 isScreenSharingPresentation] & 1) != 0
    || [v10 preferredPresentationMode] != 3)
  {
    char v14 = 0;
  }
  else
  {
    char v14 = [v10 isUserInitiated];
  }
  self->_transientOverlayShouldAlwaysPreventHomeGestureDismissal = v14;
  if ([(SBInCallPresentationSession *)self _isValidForSceneUpdates])
  {
    self->_hasBegunHandlingPresentationRequest = 1;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __101__SBInCallPresentationSession_presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke;
    v15[3] = &unk_1E6AF6828;
    v15[4] = self;
    id v16 = v12;
    [(SBInCallPresentationSession *)self _presentWithRequestedConfiguration:v10 animated:v8 analyticsSource:v11 completion:v15];
  }
}

uint64_t __101__SBInCallPresentationSession_presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 90) = 1;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_presentWithRequestedConfiguration:(id)a3 animated:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 preferredPresentationMode];
  uint64_t v14 = [v10 isUserInitiated];
  self->_isScreenSharingPresentation = [v10 isScreenSharingPresentation];
  uint64_t v15 = [v10 identifier];
  requestedPresentationConfigurationIdentifier = self->_requestedPresentationConfigurationIdentifier;
  self->_requestedPresentationConfigurationIdentifier = v15;

  if ([(SBInCallPresentationSession *)self _isProximityReaderPresented]) {
    uint64_t v13 = 0;
  }
  if ([v10 supportsSystemAperture])
  {
    [(SBInCallPresentationSession *)self _createJindoElementIfNeeded];
    if (v13 == 1)
    {
      if (![(SBInCallPresentationSession *)self _allowsNonModalPresentation])
      {
        uint64_t v13 = 1;
        if (![v10 supportsAmbient]) {
          goto LABEL_16;
        }
        goto LABEL_8;
      }
      uint64_t v13 = self->_jindoElement == 0;
    }
  }
  if (([v10 supportsAmbient] & 1) == 0) {
    goto LABEL_9;
  }
LABEL_8:
  if (![(SBInCallPresentationSession *)self _isAmbientPresentationActive])
  {
LABEL_9:
    if (v13) {
      goto LABEL_16;
    }
  }
  if ([(SBInCallPresentationSession *)self _allowsInitiallyDismissedPresentation])
  {
    [v10 requiresDismissedPresentationmode];
    goto LABEL_17;
  }
  id v17 = SBLogInCallPresentation();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SBInCallPresentationSession _presentWithRequestedConfiguration:animated:analyticsSource:completion:](v17, v18, v19, v20, v21, v22, v23, v24);
  }

  uint64_t v13 = 2;
LABEL_16:
  if (![v10 requiresDismissedPresentationmode])
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke_3;
    v28[3] = &unk_1E6AFF0E8;
    void v28[4] = self;
    id v29 = v12;
    id v27 = v12;
    [(SBInCallPresentationSession *)self _performPresentationWithRequestedPresentationMode:v13 isUserInitiated:v14 animated:v8 analyticsSource:v11 completion:v28];
    id v26 = v29;
    goto LABEL_19;
  }
LABEL_17:
  [(SBInCallPresentationSession *)self _activeJindoElementIfNeeded];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke;
  v32[3] = &unk_1E6AFBD00;
  v32[4] = self;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke_2;
  v30[3] = &unk_1E6AF5A50;
  id v31 = v12;
  id v25 = v12;
  [(SBInCallPresentationSession *)self _insertIntoSwitcherAsDismissedWithAnalyticsSource:v11 transitionValidator:v32 completion:v30];
  id v26 = v31;
LABEL_19:
}

uint64_t __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _isValidForSceneUpdates];
}

uint64_t __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __102__SBInCallPresentationSession__presentWithRequestedConfiguration_animated_analyticsSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 _activeJindoElementIfNeeded];
}

- (void)dismissAndFinalizeSceneDestructionAnimated:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  self->_hasReceivedFinalizeSceneDestructionRequest = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__SBInCallPresentationSession_dismissAndFinalizeSceneDestructionAnimated_analyticsSource_completion___block_invoke;
  v12[3] = &unk_1E6AFF7F0;
  BOOL v15 = a3;
  id v13 = v8;
  id v14 = v9;
  void v12[4] = self;
  id v10 = v8;
  id v11 = v9;
  [(SBInCallPresentationSession *)self _dispatchBlockToMainEventQueueWithReason:@"SBInCallPresentationSession - dismissAndFinalizeSceneDestructionAnimated" block:v12];
}

void __101__SBInCallPresentationSession_dismissAndFinalizeSceneDestructionAnimated_analyticsSource_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogInCallPresentation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v3;
    __int16 v13 = 1024;
    int v14 = v4;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ handling dismissAndFinalizeSceneDestructionAnimated %{BOOL}u", buf, 0x12u);
  }

  uint64_t v5 = *(unsigned char **)(a1 + 32);
  if (v5[89])
  {
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __101__SBInCallPresentationSession_dismissAndFinalizeSceneDestructionAnimated_analyticsSource_completion___block_invoke_170;
    v9[3] = &unk_1E6AF5A50;
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v5 dismissAnimated:v6 shouldFinalizeSceneDestruction:1 analyticsSource:v7 completion:v9];
  }
  else
  {
    [*(id *)(a1 + 32) _destroySceneEntityIfExists];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
    }
  }
}

uint64_t __101__SBInCallPresentationSession_dismissAndFinalizeSceneDestructionAnimated_analyticsSource_completion___block_invoke_170(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismissAnimated:(BOOL)a3 shouldFinalizeSceneDestruction:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = SBLogInCallPresentation();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SBInCallPresentationSession dismissAnimated:shouldFinalizeSceneDestruction:analyticsSource:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v34 = 1;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 1;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke;
  v26[3] = &unk_1E6AFF840;
  id v28 = v31;
  id v29 = buf;
  BOOL v30 = v7;
  v26[4] = self;
  id v13 = v11;
  id v27 = v13;
  int v14 = (void *)MEMORY[0x1D948C7A0](v26);
  uint64_t v15 = v14;
  if (self->_isTransientOverlayPresentationActive)
  {
    ++*(void *)(*(void *)&buf[8] + 24);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_3;
    v24[3] = &unk_1E6AF5A50;
    id v25 = v14;
    [(SBInCallPresentationSession *)self _performTransientOverlayDismissalTransitionAnimated:v8 shouldInsertIntoSwitcherModel:0 analyticsSource:v10 completion:v24];
  }
  if (self->_isNonModalPresentationActive)
  {
    ++*(void *)(*(void *)&buf[8] + 24);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_4;
    v22[3] = &unk_1E6AF5A50;
    id v23 = v15;
    [(SBInCallPresentationSession *)self _performNonModalDismissalTransitionAnimated:v8 analyticsSource:v10 completion:v22];
  }
  ++*(void *)(*(void *)&buf[8] + 24);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_5;
  v18[3] = &unk_1E6AF6980;
  v18[4] = self;
  BOOL v21 = v8;
  id v16 = v10;
  id v19 = v16;
  id v17 = v15;
  id v20 = v17;
  [(SBInCallPresentationSession *)self _performSwitcherDismissalTransitionAnimated:v8 shouldDestroyScene:v7 analyticsSource:v16 completion:v18];
  (*((void (**)(id, uint64_t, void))v17 + 2))(v17, 1, 0);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(buf, 8);
}

void __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke(uint64_t a1, char a2, int a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a2;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  if (!--*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 64))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_2;
      v13[3] = &unk_1E6AFF818;
      void v13[4] = *(void *)(a1 + 32);
      long long v12 = *(_OWORD *)(a1 + 40);
      id v7 = (id)v12;
      long long v14 = v12;
      uint64_t v8 = MEMORY[0x1D948C7A0](v13);
      id v9 = (void *)v8;
      if (a3) {
        (*(void (**)(uint64_t))(v8 + 16))(v8);
      }
      else {
        [*(id *)(a1 + 32) _dispatchBlockToMainEventQueueWithReason:@"SBInCallPresentationSession - dismissAnimated:shouldFinalizeSceneDestruction:" block:v8];
      }
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 40);
      if (v10)
      {
        id v11 = *(void (**)(void))(v10 + 16);
        v11();
      }
    }
  }
}

uint64_t __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    uint64_t v3 = *(unsigned char **)(a1 + 32);
    if (!v3[210] && !v3[209])
    {
      if (![v3 _isInSwitcherModel])
      {
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 392));
        uint64_t v10 = [WeakRetained layoutStateProvider];
        id v11 = [v10 layoutState];
        long long v12 = [*(id *)(*(void *)(a1 + 32) + 384) sceneIdentifier];
        id v13 = [v11 elementWithIdentifier:v12];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13 == 0;

        goto LABEL_7;
      }
      uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    *(unsigned char *)(v2 + 24) = 0;
  }
LABEL_7:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    char v4 = [MEMORY[0x1E4F62490] sharedInstance];
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 384) sceneIdentifier];
    uint64_t v6 = [v4 sceneWithIdentifier:v5];

    if (v6) {
      [*(id *)(a1 + 32) _destroySceneEntityIfExists];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

uint64_t __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[210])
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_6;
    v9[3] = &unk_1E6AFF0E8;
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    void v9[4] = *(void *)(a1 + 32);
    id v10 = v5;
    [v2 _performTransientOverlayDismissalTransitionAnimated:v3 shouldInsertIntoSwitcherModel:0 analyticsSource:v4 completion:v9];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 32) _isInSwitcherModel] ^ 1;
    uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v8(v6, v7, 1);
  }
}

uint64_t __105__SBInCallPresentationSession_dismissAnimated_shouldFinalizeSceneDestruction_analyticsSource_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2) {
    a2 = [*(id *)(a1 + 32) _isInSwitcherModel] ^ 1;
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v3(v2, a2, 1);
}

- (BOOL)supportsHandlingDeviceLock
{
  return self->_isHandlingDeviceLock && !self->_hasReceivedFinalizeSceneDestructionRequest
      || [(SBInCallPresentationSession *)self _sceneSupportsHandlingDeviceLock];
}

- (BOOL)disallowsLockHardwareButtonDoublePress
{
  BOOL v3 = [(SBInCallPresentationSession *)self supportsHandlingDeviceLock];
  if (v3) {
    LOBYTE(v3) = ![(SBInCallPresentationSession *)self _isCallConnectedForScene];
  }
  return v3;
}

- (BOOL)supportsBecomingVisibleWhenUnlockingFromSource:(int)a3 wakingDisplay:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(SBInCallPresentationSession *)self _isValidForSceneUpdates])
  {
    uint64_t v7 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
    uint64_t v8 = v7;
    if (!v7)
    {
      char v10 = 0;
LABEL_16:

      return v10;
    }
    id v9 = [v7 clientSettings];
    if ([(SBInCallPresentationSession *)self _isAmbientPresentationActive]) {
      goto LABEL_4;
    }
    if (a3 == 31)
    {
      char v10 = 1;
      goto LABEL_15;
    }
    if (a3 == 32)
    {
      char v10 = [v9 shouldBecomeVisibleWhenWakingDisplay];
      if ((v10 & 1) != 0 || !v4) {
        goto LABEL_15;
      }
    }
    else if (!v4)
    {
LABEL_4:
      char v10 = 0;
LABEL_15:

      goto LABEL_16;
    }
    char v10 = [v9 shouldBecomeVisibleWhenWakingDisplay];
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 3;
  }
  return [(SBDeviceApplicationSceneHandle *)self->_sceneHandle handleHardwareButtonEventType:v3];
}

- (void)handleDeviceLockFromSource:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (self->_isHandlingDeviceLock)
  {
    if (!v6) {
      goto LABEL_16;
    }
    deviceLockHandlingCompletionHandlers = self->_deviceLockHandlingCompletionHandlers;
    id v16 = v6;
    if (!deviceLockHandlingCompletionHandlers)
    {
      id v9 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      char v10 = self->_deviceLockHandlingCompletionHandlers;
      self->_deviceLockHandlingCompletionHandlers = v9;

      uint64_t v7 = v16;
      deviceLockHandlingCompletionHandlers = self->_deviceLockHandlingCompletionHandlers;
    }
    id v11 = (void *)MEMORY[0x1D948C7A0](v7);
    [(NSMutableArray *)deviceLockHandlingCompletionHandlers addObject:v11];

    goto LABEL_15;
  }
  id v16 = v6;
  if (![(SBInCallPresentationSession *)self _sceneSupportsHandlingDeviceLock])
  {
    uint64_t v7 = v16;
    if (!v16) {
      goto LABEL_16;
    }
    (*((void (**)(id, void))v16 + 2))(v16, 0);
    goto LABEL_15;
  }
  self->_isHandlingDeviceLock = 1;
  uint64_t v7 = v16;
  if (v16)
  {
    long long v12 = self->_deviceLockHandlingCompletionHandlers;
    if (!v12)
    {
      id v13 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      long long v14 = self->_deviceLockHandlingCompletionHandlers;
      self->_deviceLockHandlingCompletionHandlers = v13;

      uint64_t v7 = v16;
      long long v12 = self->_deviceLockHandlingCompletionHandlers;
    }
    uint64_t v15 = (void *)MEMORY[0x1D948C7A0](v7);
    [(NSMutableArray *)v12 addObject:v15];

    uint64_t v7 = v16;
  }
  if (v4 != 24)
  {
    [(SBInCallPresentationSession *)self _notifySceneOfDeviceLockFromSource:v4 completion:v16];
LABEL_15:
    uint64_t v7 = v16;
  }
LABEL_16:
}

- (void)handleRingerButtonDown
{
  if (!self->_isScreenSharingPresentation)
  {
    id v4 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
    if (v4)
    {
      uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4FA7BB8]) initWithInfo:0 responder:0];
      uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
      [v4 sendActions:v3];
    }
  }
}

- (void)_notifySceneOfDeviceLockFromSource:(int)a3 completion:(id)a4
{
  BOOL v6 = a3 == 3;
  v46[7] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v8 = 2 * v6;
  if (a3 == 1) {
    uint64_t v8 = 1;
  }
  BOOL v30 = v7;
  uint64_t v31 = v8;
  id v9 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  char v10 = [v9 clientProcess];
  uint64_t v11 = [v10 pid];

  if (v11 == -1)
  {
    BOOL v21 = 0;
  }
  else
  {
    long long v12 = [MEMORY[0x1E4F96478] targetWithPid:v11];
    id v13 = [MEMORY[0x1E4F96338] grantWithUserInteractivity];
    v46[0] = v13;
    long long v14 = [MEMORY[0x1E4F96390] grantWithForegroundPriority];
    v46[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F96470] withReason:10002];
    v46[2] = v15;
    id v16 = [MEMORY[0x1E4F96350] grant];
    v46[3] = v16;
    id v17 = [MEMORY[0x1E4F963B8] grant];
    v46[4] = v17;
    uint64_t v18 = [MEMORY[0x1E4F96390] grantWithForegroundPriority];
    void v46[5] = v18;
    id v19 = [MEMORY[0x1E4F96460] grantWithResistance:40];
    v46[6] = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:7];

    BOOL v21 = (void *)[objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:@"SBInCallHandleDeviceLockAction" target:v12 attributes:v20];
  }
  [v21 acquireWithError:0];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__38;
  v42[4] = __Block_byref_object_dispose__38;
  uint64_t v43 = self;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__38;
  id v40 = __Block_byref_object_dispose__38;
  id v41 = 0;
  uint64_t v22 = SBLogInCallPresentation();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v45 = v23;
    _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Handing device lock to %{public}@", buf, 0xCu);
  }
  id v24 = objc_alloc(MEMORY[0x1E4FA7B48]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __77__SBInCallPresentationSession__notifySceneOfDeviceLockFromSource_completion___block_invoke;
  v32[3] = &unk_1E6AFF868;
  uint64_t v34 = v42;
  id v25 = v21;
  id v33 = v25;
  uint64_t v35 = &v36;
  uint64_t v26 = [v24 initWithSourceType:v31 timeout:v32 withResponseHandler:5.0];
  id v27 = (void *)v37[5];
  v37[5] = v26;

  id v28 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle scene];
  id v29 = [MEMORY[0x1E4F1CAD0] setWithObject:v37[5]];
  [v28 sendActions:v29];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v42, 8);
}

void __77__SBInCallPresentationSession__notifySceneOfDeviceLockFromSource_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    *(unsigned char *)(v4 + 88) = 0;
    id v5 = (void *)[*(id *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 72) copy];
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = 0;

    if (v3)
    {
      uint64_t v8 = [v3 error];
      if (v8) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = [v3 deviceLockHandlingResult] == 1;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
    char v10 = SBLogInCallPresentation();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [*(id *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 384) sceneIdentifier];
      *(_DWORD *)buf = 138543618;
      id v27 = v11;
      __int16 v28 = 1024;
      BOOL v29 = v9;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Response for device lock to %{public}@ %{BOOL}u", buf, 0x12u);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v21 + 1) + 8 * i));
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 32), "invalidate", (void)v21);
  }
  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;

  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = 0;
}

- (BOOL)isFullscreenCallInSwitcher
{
  if (self->_isScreenSharingPresentation) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v5 = [WeakRetained layoutStateProvider];
  uint64_t v6 = [v5 layoutState];
  BOOL v2 = [(SBInCallPresentationSession *)self _isShowingFullScreenForLayoutState:v6]&& !self->_isTransientOverlayPresentationActive&& [(SBInCallPresentationSession *)self _isValidForSceneUpdates];

  return v2;
}

- (BOOL)disablesSystemVolumeHUDForCategory:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v6 = [WeakRetained layoutStateProvider];
  id v7 = [v6 layoutState];

  uint64_t v8 = [(SBInCallPresentationSession *)self _clientSettingsIfExists];
  BOOL v9 = [v8 audioCategoriesDisablingVolumeHUD];

  if (v9) {
    BOOL v10 = [v9 count] == 0;
  }
  else {
    BOOL v10 = 0;
  }
  int64_t v11 = [(SBInCallPresentationSession *)self _currentPresentationModeForLayoutState:v7];
  char v12 = v11 != 0;
  if (v11 && !v10) {
    char v12 = [v9 containsObject:v4];
  }

  return v12;
}

- (BOOL)isShowingOnEmbeddedDisplay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v3 = [WeakRetained _fbsDisplayIdentity];
  char v4 = [v3 isMainDisplay];

  return v4;
}

- (void)_prepareForTransientOverlayPresentationTransactionWithAnimation:(BOOL)a3 analyticsSource:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = SBLogInCallPresentation();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v22 = "-[SBInCallPresentationSession _prepareForTransientOverlayPresentationTransactionWithAnimation:analyticsSource:completion:]";
    __int16 v23 = 2114;
    long long v24 = self;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke;
  v17[3] = &unk_1E6AF69D0;
  void v17[4] = self;
  id v11 = v8;
  id v18 = v11;
  BOOL v20 = a3;
  id v12 = v9;
  id v19 = v12;
  uint64_t v13 = (void (**)(void))MEMORY[0x1D948C7A0](v17);
  uint64_t v14 = v13;
  if (self->_isNonModalPresentationActive)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_6;
    v15[3] = &unk_1E6AF5A50;
    id v16 = v13;
    [(SBInCallPresentationSession *)self _performNonModalDismissalTransitionAnimated:0 analyticsSource:v11 completion:v15];
  }
  else
  {
    v13[2](v13);
  }
}

void __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setTransientOverlayPresentationActive:1];
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _createTransientOverlayViewController];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 120);
    *(void *)(v4 + 120) = v3;

    BOOL v2 = *(void **)(*(void *)(a1 + 32) + 120);
  }
  unint64_t v6 = [v2 preferredInterfaceOrientationForPresentation];
  id v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (!v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 368));
      unint64_t v6 = [WeakRetained inCallClientPresentationSessionInterfaceOrientationForTransientOverlayPresentation:*(void *)(a1 + 32)];
    }
    if (v6 <= 1) {
      unint64_t v6 = 1;
    }
    [*(id *)(*(void *)(a1 + 32) + 120) supportedInterfaceOrientations];
    if ((SBFInterfaceOrientationMaskContainsInterfaceOrientation() & 1) == 0) {
      unint64_t v6 = SBFFirstInterfaceOrientationInInterfaceOrientationMask();
    }
  }
  else
  {
    unint64_t v6 = 1;
  }
  BOOL v10 = [*(id *)(a1 + 32) _screen];
  id v11 = [v10 fixedCoordinateSpace];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  BOOL v20 = [SBInCallPresentationSceneUpdateContext alloc];
  uint64_t v21 = *(void *)(a1 + 40);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_2;
  v30[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
  void v30[4] = v6;
  long long v22 = -[SBInCallPresentationSceneUpdateContext initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:](v20, "initWithReferenceFrame:analyticsSource:transitionRequestBuilderBlock:", v21, v30, v13, v15, v17, v19);
  [(SBInCallPresentationSceneUpdateContext *)v22 setExecutionTarget:2];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_4;
  uint64_t v26 = &unk_1E6AFBA88;
  uint64_t v27 = *(void *)(a1 + 32);
  char v29 = *(unsigned char *)(a1 + 56);
  id v28 = *(id *)(a1 + 48);
  [(SBInCallPresentationSceneUpdateContext *)v22 setCompletionHandler:&v23];
  objc_msgSend(*(id *)(a1 + 32), "_performSceneUpdateTransactionWithContext:", v22, v23, v24, v25, v26, v27);
}

uint64_t __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_3;
  v3[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 modifyApplicationContext:v3];
}

uint64_t __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setInterfaceOrientation:*(void *)(a1 + 32)];
}

void __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [[SBWorkspaceTransientOverlay alloc] initWithViewController:*(void *)(*(void *)(a1 + 32) + 120)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v4 = [SBInCallTransientOverlayPresentationContext alloc];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_5;
    v10[3] = &unk_1E6AFF890;
    objc_copyWeak(&v12, &location);
    id v5 = v3;
    id v11 = v5;
    char v13 = *(unsigned char *)(a1 + 48);
    unint64_t v6 = [(SBInCallTransientOverlayPresentationContext *)v4 initWithRequestBuilder:v10];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t, SBInCallTransientOverlayPresentationContext *))(v7 + 16))(v7, 1, v6);
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
      v9();
    }
  }
}

void __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _configureTransitionRequest:v4 forPresentingTransientOverlay:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __122__SBInCallPresentationSession__prepareForTransientOverlayPresentationTransactionWithAnimation_analyticsSource_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_clientSettingsIfExists
{
  BOOL v2 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  uint64_t v3 = [v2 clientSettings];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (BOOL)_isInSwitcherModel
{
  mainSwitcherCoordinator = self->_mainSwitcherCoordinator;
  uint64_t v3 = [(SBApplicationSceneHandle *)self->_sceneHandle displayItemRepresentation];
  LOBYTE(mainSwitcherCoordinator) = [(SBMainSwitcherControllerCoordinator *)mainSwitcherCoordinator hasAppLayoutForDisplayItem:v3];

  return (char)mainSwitcherCoordinator;
}

- (BOOL)_isValidForSceneUpdates
{
  return !self->_isInvalidated && !self->_hasReceivedFinalizeSceneDestructionRequest;
}

- (id)_acquireAssertionForAnalyticsSource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    assertionAnalyticSources = self->_assertionAnalyticSources;
    if (!assertionAnalyticSources)
    {
      unint64_t v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      id v7 = self->_assertionAnalyticSources;
      self->_assertionAnalyticSources = v6;

      assertionAnalyticSources = self->_assertionAnalyticSources;
    }
    [(NSMutableArray *)assertionAnalyticSources addObject:v4];
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x1E4F4F838]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__SBInCallPresentationSession__acquireAssertionForAnalyticsSource___block_invoke;
    v11[3] = &unk_1E6AFA6D0;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    id v9 = (void *)[v8 initWithIdentifier:@"SBInCallPresentationSession" forReason:v12 invalidationBlock:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __67__SBInCallPresentationSession__acquireAssertionForAnalyticsSource___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v6 = WeakRetained;
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    uint64_t v4 = [v6[3] count];
    uint64_t v3 = v6;
    if (!v4)
    {
      id v5 = v6[3];
      v6[3] = 0;

      uint64_t v3 = v6;
    }
  }
}

- (BOOL)_allowsNonModalPresentation
{
  if (self->_isTransientOverlayPresentationActive)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    uint64_t v4 = [(SBLockScreenManager *)self->_lockScreenManager lockScreenEnvironment];
    id v5 = [v4 behaviorSuppressor];
    if ([v5 suppressesBanners]) {
      LOBYTE(v2) = 0;
    }
    else {
      BOOL v2 = ![(SBSetupManager *)self->_setupManager isInSetupMode];
    }
  }
  return v2;
}

- (BOOL)_allowsInitiallyDismissedPresentation
{
  BOOL v3 = [(SBInCallPresentationSession *)self _allowsNonModalPresentation];
  int v4 = [(SBInCallPresentationSession *)self _isProximityReaderPresented] || v3;
  if ([(SBLockScreenManager *)self->_lockScreenManager isUILocked] && !self->_jindoElement) {
    LOBYTE(v4) = 0;
  }
  return [(SBInCallPresentationSession *)self _isAmbientPresentationActive] | v4;
}

- (int64_t)_currentPresentationModeForLayoutState:(id)a3
{
  id v4 = a3;
  if (self->_isTransientOverlayPresentationActive)
  {
    if (self->_hasAdoptedFullscreenOverlayAPI) {
      int64_t v5 = 3;
    }
    else {
      int64_t v5 = 2;
    }
  }
  else if (self->_isNonModalPresentationActive)
  {
    int64_t v5 = 1;
  }
  else if ((![(SBLockScreenManager *)self->_lockScreenManager isUILocked] {
          || [(SBLockScreenManager *)self->_lockScreenManager isUIUnlocking])
  }
         && v4
         && [(SBInCallPresentationSession *)self _shouldConsiderScenePrimaryForLayoutState:v4])
  {
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_isShowingFullScreenForLayoutState:(id)a3
{
  return ([(SBInCallPresentationSession *)self _currentPresentationModeForLayoutState:a3] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_isDismissedForLayoutState:(id)a3
{
  id v4 = a3;
  if (*(_WORD *)&self->_isNonModalPresentationActive) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = [(SBInCallPresentationSession *)self _currentPresentationModeForLayoutState:v4] == 0;
  }

  return v6;
}

- (void)_destroySceneEntityIfExists
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];

  if (v3)
  {
    id v4 = SBLogInCallPresentation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = self;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Destroying scene entity: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    int64_t v5 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:self->_sceneHandle];
    SBWorkspaceDestroyApplicationEntity(v5);
  }
}

- (BOOL)_hasExistingSceneSettingsPresentationModeForLayoutState:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  int v6 = v5;
  if (v5)
  {
    id v7 = [v5 settings];
    uint64_t v8 = [v7 inCallPresentationMode];
    BOOL v9 = v8 == [(SBInCallPresentationSession *)self _currentPresentationModeForLayoutState:v4];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_addSystemGestureDeactivationReason:(id)a3
{
  id v4 = a3;
  activeSystemGestureDeactivationReasons = self->_activeSystemGestureDeactivationReasons;
  id v8 = v4;
  if (!activeSystemGestureDeactivationReasons)
  {
    int v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = self->_activeSystemGestureDeactivationReasons;
    self->_activeSystemGestureDeactivationReasons = v6;

    id v4 = v8;
    activeSystemGestureDeactivationReasons = self->_activeSystemGestureDeactivationReasons;
  }
  [(NSMutableSet *)activeSystemGestureDeactivationReasons addObject:v4];
  [(SBInCallPresentationSession *)self _updateSceneDeactivationAssertions];
}

- (void)_removeSystemGestureDeactivationReason:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_activeSystemGestureDeactivationReasons, "containsObject:"))
  {
    [(NSMutableSet *)self->_activeSystemGestureDeactivationReasons removeObject:v4];
    [(SBInCallPresentationSession *)self _updateSceneDeactivationAssertions];
  }
}

- (void)_addSystemAnimationDeactivationReason:(id)a3
{
  id v4 = a3;
  activeSystemAnimationDeactivationReasons = self->_activeSystemAnimationDeactivationReasons;
  id v8 = v4;
  if (!activeSystemAnimationDeactivationReasons)
  {
    int v6 = [MEMORY[0x1E4F1CA80] set];
    id v7 = self->_activeSystemAnimationDeactivationReasons;
    self->_activeSystemAnimationDeactivationReasons = v6;

    id v4 = v8;
    activeSystemAnimationDeactivationReasons = self->_activeSystemAnimationDeactivationReasons;
  }
  [(NSMutableSet *)activeSystemAnimationDeactivationReasons addObject:v4];
  [(SBInCallPresentationSession *)self _updateSceneDeactivationAssertions];
}

- (void)_removeSystemAnimationDeactivationReason:(id)a3
{
  id v4 = a3;
  if (-[NSMutableSet containsObject:](self->_activeSystemAnimationDeactivationReasons, "containsObject:"))
  {
    [(NSMutableSet *)self->_activeSystemAnimationDeactivationReasons removeObject:v4];
    [(SBInCallPresentationSession *)self _updateSceneDeactivationAssertions];
  }
}

- (void)_configureTransitionRequest:(id)a3 forPresentingTransientOverlay:(id)a4 animated:(BOOL)a5
{
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = (objc_class *)objc_opt_class();
  BOOL v10 = NSStringFromClass(v9);
  [v8 setEventLabelWithFormat:@"PresentInCallTransientOverlay = %@", v10];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__SBInCallPresentationSession__configureTransitionRequest_forPresentingTransientOverlay_animated___block_invoke;
  v12[3] = &unk_1E6AF5C58;
  id v13 = v7;
  BOOL v14 = a5;
  id v11 = v7;
  [v8 modifyTransientOverlayContext:v12];
  [v8 modifyApplicationContext:&__block_literal_global_201];
}

void __98__SBInCallPresentationSession__configureTransitionRequest_forPresentingTransientOverlay_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setShouldDismissSiriUponPresentation:0];
  [v3 setTransitionType:0];
  [v3 setTransientOverlay:*(void *)(a1 + 32)];
  [v3 setAnimated:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __98__SBInCallPresentationSession__configureTransitionRequest_forPresentingTransientOverlay_animated___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setWaitsForSceneUpdates:0];
}

- (id)_createTransientOverlayViewController
{
  id v3 = [[SBInCallTransientOverlayViewController alloc] initWithSceneHandle:self->_sceneHandle shouldPreferContinuityDisplay:self->_prefersContinuityDisplayForFullScreenPresentation];
  [(SBInCallTransientOverlayViewController *)v3 setDelegate:self];
  [(SBInCallTransientOverlayViewController *)v3 setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings];
  [(SBInCallTransientOverlayViewController *)v3 setShouldAlwaysPreventHomeGestureDismissal:self->_transientOverlayShouldAlwaysPreventHomeGestureDismissal];
  return v3;
}

- (void)_performSceneUpdateTransactionWithContext:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = SBLogInCallPresentation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [v4 referenceFrame];
    int v6 = BSNSStringFromCGRect();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Updating scene update with frame: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  id v7 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:self->_sceneHandle];
  entityToSceneUpdateContext = self->_entityToSceneUpdateContext;
  if (!entityToSceneUpdateContext)
  {
    BOOL v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    BOOL v10 = self->_entityToSceneUpdateContext;
    self->_entityToSceneUpdateContext = v9;

    entityToSceneUpdateContext = self->_entityToSceneUpdateContext;
  }
  [(NSMapTable *)entityToSceneUpdateContext setObject:v4 forKey:v7];
  uint64_t v38 = [v4 analyticsSource];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__38;
  v73 = __Block_byref_object_dispose__38;
  id v74 = 0;
  objc_initWeak(&location, self);
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke;
  v64[3] = &unk_1E6AFF8B8;
  p_long long buf = &buf;
  objc_copyWeak(&v68, &location);
  id v11 = v7;
  uint64_t v65 = v11;
  id v12 = v4;
  id v66 = v12;
  id v13 = (void *)MEMORY[0x1D948C7A0](v64);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_2_204;
  v59[3] = &unk_1E6AF5F80;
  id v14 = v12;
  id v60 = v14;
  double v61 = self;
  uint64_t v36 = v11;
  double v62 = v36;
  id v37 = v13;
  id v63 = v37;
  double v15 = (void (**)(void, void))MEMORY[0x1D948C7A0](v59);
  double v16 = [v14 validatorHandler];
  [v14 setValidatorHandler:0];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_5;
  v56[3] = &unk_1E6AFF908;
  objc_copyWeak(&v58, &location);
  id v17 = v16;
  v56[4] = self;
  id v57 = v17;
  double v18 = (unsigned int (**)(void, void))MEMORY[0x1D948C7A0](v56);
  uint64_t v19 = [v14 executionTarget];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v21 = [WeakRetained _fbsDisplayConfiguration];

  switch(v19)
  {
    case 0:
      workspace = self->_workspace;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_9;
      v46[3] = &unk_1E6AF7240;
      id v47 = v15;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_10;
      v42[3] = &unk_1E6AFF980;
      v42[4] = self;
      uint64_t v44 = v18;
      uint64_t v45 = &buf;
      id v43 = v38;
      -[SBMainWorkspace requestTransitionWithOptions:displayConfiguration:builder:validator:](workspace, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v21, v46, v42, v36);

      long long v22 = v47;
LABEL_15:

      break;
    case 1:
      char v32 = self->_localEventQueue;
      id v33 = (void *)MEMORY[0x1E4F4F748];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_7;
      v48[3] = &unk_1E6AFF958;
      long long v22 = v32;
      unint64_t v49 = v22;
      double v50 = self;
      id v51 = v21;
      BOOL v53 = v15;
      double v54 = v18;
      double v55 = &buf;
      id v52 = v38;
      uint64_t v34 = objc_msgSend(v33, "eventWithName:handler:", @"SceneUpdate", v48, v36);
      [(BSEventQueue *)v22 executeOrInsertEvent:v34 atPosition:1];

      goto LABEL_15;
    case 2:
      -[SBMainWorkspace createRequestWithOptions:displayConfiguration:](self->_workspace, "createRequestWithOptions:displayConfiguration:", 0, v21, v36);
      long long v22 = (BSEventQueue *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void, BSEventQueue *))v15)[2](v15, v22);
      if (((unsigned int (**)(void, BSEventQueue *))v18)[2](v18, v22))
      {
        uint64_t v23 = [(SBInCallPresentationSession *)self _acquireAssertionForAnalyticsSource:v38];
        uint64_t v24 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = v23;

        uint64_t v25 = [(BSEventQueue *)v22 transactionProvider];
        uint64_t v26 = ((void (**)(void, BSEventQueue *))v25)[2](v25, v22);

        id v27 = v26;
        id v28 = [(BSEventQueue *)v22 completionBlock];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_11;
        v39[3] = &unk_1E6AF5AA0;
        id v29 = v27;
        id v40 = v29;
        id v30 = v28;
        id v41 = v30;
        [v29 setCompletionBlock:v39];
        [v29 begin];
      }
      else
      {
        uint64_t v35 = [(BSEventQueue *)v22 completionBlock];
        id v29 = (id)v35;
        if (v35) {
          (*(void (**)(uint64_t, void))(v35 + 16))(v35, 0);
        }
      }

      goto LABEL_15;
  }

  objc_destroyWeak(&v58);
  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_2;
  v9[3] = &unk_1E6AFF8B8;
  uint64_t v12 = *(void *)(a1 + 48);
  objc_copyWeak(&v13, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v4 = (void (**)(void, void))MEMORY[0x1D948C7A0](v9);
  int64_t v5 = [*(id *)(a1 + 40) postSceneUpdateHandler];
  if (v5)
  {
    [*(id *)(a1 + 40) setPostSceneUpdateHandler:0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_203;
    v6[3] = &unk_1E6AFF8E0;
    id v7 = v4;
    char v8 = a2;
    ((void (**)(void, void, void *))v5)[2](v5, 0, v6);
  }
  else
  {
    v4[2](v4, a2);
  }

  objc_destroyWeak(&v13);
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogInCallPresentation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Finished scene update with success %{BOOL}u", (uint8_t *)v8, 8u);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  int v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[16] removeObjectForKey:*(void *)(a1 + 32)];
  }
  id v7 = [*(id *)(a1 + 40) completionHandler];
  if (v7)
  {
    [*(id *)(a1 + 40) setCompletionHandler:0];
    v7[2](v7, a2);
  }
}

uint64_t __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_203(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    a2 = a2;
  }
  else {
    a2 = 0;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_2_204(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) transitionRequestBuilderBlock];
  ((void (**)(void, id))v4)[2](v4, v3);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_3;
  v9[3] = &unk_1E6AF57C0;
  void v9[4] = *(void *)(a1 + 40);
  [v3 modifyApplicationContext:v9];
  objc_msgSend(*(id *)(a1 + 48), "setFlag:forActivationSetting:", objc_msgSend(*(id *)(a1 + 40), "_currentPresentationModeForLayoutState:", 0) == 1, 72);
  [v3 setSource:48];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_4;
  v6[3] = &unk_1E6AFF610;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  [v3 setTransactionProvider:v6];
  id v5 = (id)[v3 addCompletionHandler:*(void *)(a1 + 56)];
}

uint64_t __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

SBInCallSceneUpdateWorkspaceTransaction *__73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SBInCallSceneUpdateWorkspaceTransaction alloc] initWithApplicationSceneEntity:*(void *)(a1 + 32) transitionRequest:v3];
  id v5 = [*(id *)(a1 + 40) postSceneUpdateHandler];
  [*(id *)(a1 + 40) setPostSceneUpdateHandler:0];
  [(SBInCallSceneUpdateWorkspaceTransaction *)v4 setPostSceneUpdateHandler:v5];
  int v6 = [v3 completionBlock];

  [(SBInCallSceneUpdateWorkspaceTransaction *)v4 setCompletionBlock:v6];
  return v4;
}

uint64_t __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained _isValidForSceneUpdates]
    && ((uint64_t v5 = *(void *)(a1 + 40)) == 0 || (*(unsigned int (**)(uint64_t, id))(v5 + 16))(v5, v3)))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_6;
    v8[3] = &unk_1E6AF57C0;
    void v8[4] = *(void *)(a1 + 32);
    [v3 modifyApplicationContext:v8];
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_6(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (![v6 requestedUnlockedEnvironmentMode])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 392));
    id v4 = [WeakRetained layoutStateProvider];
    uint64_t v5 = [v4 layoutState];
    objc_msgSend(v6, "setRequestedUnlockedEnvironmentMode:", objc_msgSend(v5, "unlockedEnvironmentMode"));
  }
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_7(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) acquireLockForReason:@"Transaction"];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 144) createRequestWithOptions:0 displayConfiguration:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 72) + 16))())
  {
    uint64_t v4 = [*(id *)(a1 + 40) _acquireAssertionForAnalyticsSource:*(void *)(a1 + 56)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = [v3 transactionProvider];
    id v8 = ((void (**)(void, void *))v7)[2](v7, v3);

    uint64_t v9 = [v3 completionBlock];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    double v15 = __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_8;
    double v16 = &unk_1E6AFF930;
    id v17 = v8;
    id v20 = v9;
    id v18 = *(id *)(a1 + 32);
    id v19 = v2;
    id v10 = v9;
    id v11 = v8;
    [v11 setCompletionBlock:&v13];
    objc_msgSend(v11, "begin", v13, v14, v15, v16);
  }
  else
  {
    uint64_t v12 = [v3 completionBlock];
    id v11 = (id)v12;
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
    [*(id *)(a1 + 32) relinquishLock:v2];
  }
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_8(uint64_t a1, uint64_t a2)
{
  id v5 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  [*(id *)(a1 + 40) relinquishLock:*(void *)(a1 + 48)];
}

uint64_t __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_10(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) _isValidForSceneUpdates];
    if (result)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v3 = [*(id *)(a1 + 32) _acquireAssertionForAnalyticsSource:*(void *)(a1 + 40)];
        uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
        id v5 = *(void **)(v4 + 40);
        *(void *)(v4 + 40) = v3;
      }
      return 1;
    }
  }
  return result;
}

void __73__SBInCallPresentationSession__performSceneUpdateTransactionWithContext___block_invoke_11(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = v4;
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    id v4 = v6;
  }
}

- (CGRect)_presentedBannerBoundsInWindowScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 screen];
  [v5 scale];
  uint64_t v38 = v6;
  [v5 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(SBBannerManager *)self->_bannerManager layoutManagerInWindowScene:v4];

  objc_msgSend(v15, "useableContainerFrameInContainerBounds:onScreen:", v5, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [(SBInCallPresentationSession *)self preferredBannerHeight];
  double v25 = 106.0;
  if (v24 > 0.00000011920929) {
    double v25 = v24;
  }
  objc_msgSend(v15, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v21, v25, v17, v19, v21, v23, *(void *)&v8, *(void *)&v10, *(void *)&v12, *(void *)&v14, v38);
  BSRectWithSize();
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  double v34 = v27;
  double v35 = v29;
  double v36 = v31;
  double v37 = v33;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (BOOL)_sceneSupportsHandlingDeviceLock
{
  BOOL v2 = [(SBInCallPresentationSession *)self _clientSettingsIfExists];
  char v3 = [v2 supportsDeviceLockActions];

  return v3;
}

- (BOOL)_isCallConnectedForScene
{
  BOOL v2 = [(SBInCallPresentationSession *)self _clientSettingsIfExists];
  char v3 = [v2 isCallConnected];

  return v3;
}

- (void)_setNonModalPresentationActive:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isNonModalPresentationActive != a3)
  {
    self->_isNonModalPresentationActive = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    uint64_t v6 = [WeakRetained layoutStateProvider];
    double v7 = [v6 layoutState];

    [(SBInCallPresentationSession *)self _updateAppStatusBarSettingsAssertionForLayoutState:v7];
    [(SBInCallPresentationSession *)self _updateKeyboardFocusPreventionAssertionWithLayoutState:v7];
  }
  if (!a3)
  {
    double v8 = [(NSMutableDictionary *)self->_bannerDidDisappearHandlerByUUID allValues];
    bannerDidDisappearHandlerByUUID = self->_bannerDidDisappearHandlerByUUID;
    self->_bannerDidDisappearHandlerByUUID = 0;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v14));
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void)_setTransientOverlayPresentationActive:(BOOL)a3
{
  if (self->_isTransientOverlayPresentationActive != a3)
  {
    self->_isTransientOverlayPresentationActive = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    uint64_t v5 = [WeakRetained layoutStateProvider];
    id v6 = [v5 layoutState];

    [(SBInCallPresentationSession *)self _updateAppStatusBarSettingsAssertionForLayoutState:v6];
    [(SBInCallPresentationSession *)self _updateKeyboardFocusPreventionAssertionWithLayoutState:v6];
  }
}

- (BOOL)_shouldConsiderScenePrimaryForLayoutState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBInCallPresentationSession *)self sceneHandle];
  id v6 = [v5 sceneIdentifier];

  double v7 = [v4 elementWithIdentifier:v6];

  if (v7) {
    LOBYTE(v7) = [v4 unlockedEnvironmentMode] == 3;
  }

  return (char)v7;
}

- (BOOL)_shouldUseTransientOverlayForFullScreenPresentation
{
  if ([(SBLockScreenManager *)self->_lockScreenManager isUILocked]) {
    return 1;
  }
  setupManager = self->_setupManager;
  return [(SBSetupManager *)setupManager isInSetupMode];
}

- (BOOL)_isShowingInPIP
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  uint64_t v5 = [v4 settings];
  id v6 = SBSafeCast(v3, v5);

  if (v6) {
    char v7 = objc_msgSend(v6, "pg_hasVisiblePIPContent");
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)_updateAppStatusBarSettingsAssertionForLayoutState:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  id v6 = [v5 clientSettings];
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      double v9 = v8;
    }
    else {
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v10 preferredBackgroundActivitiesToSuppress];

  if ([(SBInCallPresentationSession *)self _isValidForSceneUpdates]
    && (-[SBInCallPresentationSession _isShowingFullScreenForLayoutState:](self, "_isShowingFullScreenForLayoutState:", v4)|| self->_isNonModalPresentationActive&& ((bannerPresentableViewController = self->_bannerPresentableViewController) == 0|| -[SBInCallBannerPresentableViewController isPresented](bannerPresentableViewController, "isPresented"))|| -[SBInCallPresentationSession _isShowingInPIP](self, "_isShowingInPIP"))&& [v11 count])
  {
    appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
    if (appStatusBarSettingsAssertion)
    {
      uint64_t v14 = [(SBWindowSceneStatusBarSettingsAssertion *)appStatusBarSettingsAssertion settings];
      long long v15 = [v14 backgroundActivitiesToSuppress];
      char v16 = BSEqualSets();

      if (v16) {
        goto LABEL_24;
      }
      appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
    }
    [(SBWindowSceneStatusBarSettingsAssertion *)appStatusBarSettingsAssertion invalidate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    long long v18 = [WeakRetained statusBarManager];

    double v19 = [v18 assertionManager];
    uint64_t v20 = objc_alloc_init(SBMutableStatusBarSettings);
    [(SBMutableStatusBarSettings *)v20 setBackgroundActivitiesToSuppress:v11];
    double v21 = (objc_class *)objc_opt_class();
    double v22 = NSStringFromClass(v21);
    double v23 = (SBWindowSceneStatusBarSettingsAssertion *)[v19 newSettingsAssertionWithSettings:v20 atLevel:7 reason:v22];
    double v24 = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = v23;

    double v25 = self->_appStatusBarSettingsAssertion;
    double v26 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)v25 acquireWithAnimationParameters:v26];

    double v27 = SBLogInCallPresentation();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      double v28 = self->_appStatusBarSettingsAssertion;
      int v47 = 138543618;
      id v48 = v28;
      __int16 v49 = 2114;
      double v50 = self;
      _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "Acquired app status bar settings assertion %{public}@  for %{public}@", (uint8_t *)&v47, 0x16u);
    }
  }
  else
  {
    if (!self->_appStatusBarSettingsAssertion) {
      goto LABEL_24;
    }
    double v29 = SBLogInCallPresentation();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      double v30 = self->_appStatusBarSettingsAssertion;
      int v47 = 138543618;
      id v48 = v30;
      __int16 v49 = 2114;
      double v50 = self;
      _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_DEFAULT, "Invalidated app status bar settings assertion %{public}@  for %{public}@", (uint8_t *)&v47, 0x16u);
    }

    double v31 = self->_appStatusBarSettingsAssertion;
    double v32 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)v31 invalidateWithAnimationParameters:v32];

    long long v18 = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = 0;
  }

LABEL_24:
  double v33 = [(id)SBApp windowSceneManager];
  double v34 = [v33 connectedWindowScenes];
  double v35 = objc_msgSend(v34, "bs_firstObjectPassingTest:", &__block_literal_global_218);

  continuityDisplayAppStatusBarSettingsAssertion = self->_continuityDisplayAppStatusBarSettingsAssertion;
  if (!v35)
  {
    [(SBWindowSceneStatusBarSettingsAssertion *)continuityDisplayAppStatusBarSettingsAssertion invalidate];
    id v40 = (SBMutableStatusBarSettings *)self->_continuityDisplayAppStatusBarSettingsAssertion;
    self->_continuityDisplayAppStatusBarSettingsAssertion = 0;
    goto LABEL_28;
  }
  double v37 = [(SBWindowSceneStatusBarSettingsAssertion *)continuityDisplayAppStatusBarSettingsAssertion settings];
  uint64_t v38 = [v37 backgroundActivitiesToSuppress];
  char v39 = BSEqualSets();

  if ((v39 & 1) == 0)
  {
    id v40 = objc_alloc_init(SBMutableStatusBarSettings);
    [(SBMutableStatusBarSettings *)v40 setBackgroundActivitiesToSuppress:v11];
    [(SBWindowSceneStatusBarSettingsAssertion *)self->_continuityDisplayAppStatusBarSettingsAssertion invalidate];
    id v41 = [v35 statusBarManager];
    uint64_t v42 = [v41 assertionManager];
    id v43 = (objc_class *)objc_opt_class();
    uint64_t v44 = NSStringFromClass(v43);
    uint64_t v45 = (SBWindowSceneStatusBarSettingsAssertion *)[v42 newSettingsAssertionWithSettings:v40 atLevel:7 reason:v44];
    id v46 = self->_continuityDisplayAppStatusBarSettingsAssertion;
    self->_continuityDisplayAppStatusBarSettingsAssertion = v45;

    [(SBWindowSceneStatusBarSettingsAssertion *)self->_continuityDisplayAppStatusBarSettingsAssertion acquire];
LABEL_28:
  }
}

uint64_t __82__SBInCallPresentationSession__updateAppStatusBarSettingsAssertionForLayoutState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isContinuityDisplayWindowScene];
}

- (void)_updateKeyboardFocusPreventionAssertionWithLayoutState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!*(_WORD *)&self->_isNonModalPresentationActive)
  {
    uint64_t v5 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIdentifier];
    id v6 = [v4 elementWithIdentifier:v5];

    if (!v6)
    {
      if (self->_preventKeyboardFocusAssertion) {
        goto LABEL_8;
      }
      double v9 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
      id v8 = [v9 identityToken];

      if (v8)
      {
        id v10 = SBLogInCallPresentation();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          long long v18 = self;
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Acquiring keyboard focus prevention assertion for session: %{public}@", buf, 0xCu);
        }

        keyboardFocusCoordinator = self->_keyboardFocusCoordinator;
        uint64_t v12 = NSString;
        uint64_t v13 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIdentifier];
        uint64_t v14 = [v12 stringWithFormat:@"SBInCallPresentationSession-%@", v13];
        long long v15 = [(SBKeyboardFocusControlling *)keyboardFocusCoordinator preventFocusForSceneWithIdentityToken:v8 reason:v14];
        preventKeyboardFocusAssertion = self->_preventKeyboardFocusAssertion;
        self->_preventKeyboardFocusAssertion = v15;
      }
      goto LABEL_7;
    }
  }
  if (self->_preventKeyboardFocusAssertion)
  {
    uint64_t v7 = SBLogInCallPresentation();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      long long v18 = self;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Invalidating keyboard focus prevention assertion for session: %{public}@", buf, 0xCu);
    }

    [(BSInvalidatable *)self->_preventKeyboardFocusAssertion invalidate];
    id v8 = self->_preventKeyboardFocusAssertion;
    self->_preventKeyboardFocusAssertion = 0;
LABEL_7:
  }
LABEL_8:
}

- (BOOL)_systemControlsShouldPresentAsEmbeddedForLayoutState:(id)a3
{
  id v4 = a3;
  if (self->_isScreenSharingPresentation
    || ![(SBInCallPresentationSession *)self _isValidForSceneUpdates])
  {
    BOOL v5 = 0;
  }
  else if ([(SBLockScreenManager *)self->_lockScreenManager isUILocked] {
         || [(SBInCallPresentationSession *)self _isAmbientPresentationActive]
  }
         || self->_isTransientOverlayPresentationActive)
  {
    BOOL v5 = 1;
  }
  else if (v4)
  {
    BOOL v5 = ([(SBInCallPresentationSession *)self _currentPresentationModeForLayoutState:v4] & 0xFFFFFFFFFFFFFFFELL) == 2;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    id v8 = [WeakRetained layoutStateProvider];
    double v9 = [v8 layoutState];
    BOOL v5 = [(SBInCallPresentationSession *)self _isShowingFullScreenForLayoutState:v9];
  }
  return v5;
}

- (void)_updateSystemControlsShouldPresentAsEmbedded
{
  uint64_t v3 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  if ([(SBInCallPresentationSession *)self _isValidForSceneUpdates])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __75__SBInCallPresentationSession__updateSystemControlsShouldPresentAsEmbedded__block_invoke;
    v4[3] = &unk_1E6AF8858;
    void v4[4] = self;
    [v3 updateSettingsWithBlock:v4];
  }
}

void __75__SBInCallPresentationSession__updateSystemControlsShouldPresentAsEmbedded__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setSystemControlsShouldPresentAsEmbedded:", objc_msgSend(v2, "_systemControlsShouldPresentAsEmbeddedForLayoutState:", 0));
}

- (void)_updateSceneHandleToObserveForSendingShowNoticeForSystemControlsAction:(id)a3
{
  id v17 = a3;
  id v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1 && !self->_isScreenSharingPresentation)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandleToObserveForShowSystemControlsAction);
    if ([v17 unlockedEnvironmentMode] == 3
      && ([v17 elements],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 count],
          v7,
          v8 == 1))
    {
      double v9 = [v17 elementWithRole:1];
      id v10 = [v9 entityGenerator];
      uint64_t v11 = v10[2]();

      uint64_t v12 = objc_opt_class();
      id v13 = v11;
      if (v12)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
      id v16 = v14;

      id v15 = [v16 sceneHandle];

      if ([v15 isEqual:self->_sceneHandle])
      {

        id v15 = 0;
      }
    }
    else
    {
      id v15 = 0;
    }
    if (WeakRetained != v15)
    {
      [WeakRetained removeObserver:self];
      objc_storeWeak((id *)&self->_sceneHandleToObserveForShowSystemControlsAction, v15);
      [v15 addObserver:self];
      [(SBInCallPresentationSession *)self _sendShowNoticeForSystemControlsActionIfNeeded];
    }
  }
}

- (void)_sendShowNoticeForSystemControlsActionIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneHandleToObserveForShowSystemControlsAction);
  id v10 = [WeakRetained sceneIfExists];

  id v4 = [v10 uiClientSettings];
  int observedSceneHandlePrefersHomeIndicatorAutoHidden = self->_observedSceneHandlePrefersHomeIndicatorAutoHidden;
  if (observedSceneHandlePrefersHomeIndicatorAutoHidden != [v4 homeIndicatorAutoHidden])
  {
    char v6 = [v4 homeIndicatorAutoHidden];
    self->_int observedSceneHandlePrefersHomeIndicatorAutoHidden = v6;
    if ((v6 & 1) == 0
      && ![(SBLockScreenManager *)self->_lockScreenManager isUILocked]
      && (unint64_t)([(SpringBoard *)self->_springBoard activeInterfaceOrientation]
                          - 3) <= 1)
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FA7BB0]) initWithInfo:0 responder:0];
      uint64_t v8 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
      double v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
      [v8 sendActions:v9];
    }
  }
}

- (BOOL)_shouldExcludeFromSwitcherWhenDismissed
{
  if (![(SBInCallPresentationSession *)self _isValidForSceneUpdates]) {
    return 1;
  }
  id v3 = [(SBInCallPresentationSession *)self _clientSettingsIfExists];
  if (([v3 prefersHiddenWhenDismissed] & 1) != 0
    || [(SBSetupManager *)self->_setupManager isInSetupMode])
  {
    BOOL v4 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    if ([WeakRetained isContinuityDisplayWindowScene]) {
      BOOL v4 = !self->_isScreenSharingPresentation;
    }
    else {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (void)_updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBMainSwitcherControllerCoordinator *)self->_mainSwitcherCoordinator isAnySwitcherVisible]&& [(SBInCallPresentationSession *)self _isDismissedForLayoutState:v4])
  {
    int v5 = [(SBInCallPresentationSession *)self _isInSwitcherModel];
    if ([(SBInCallPresentationSession *)self _shouldExcludeFromSwitcherWhenDismissed])
    {
      if ((v5 & 1) == 0) {
        goto LABEL_9;
      }
      int v6 = 0;
    }
    else
    {
      int v6 = [(SBInCallPresentationSession *)self _isValidForSceneUpdates];
      if (v5 == v6) {
        goto LABEL_9;
      }
    }
    if (!self->_isNonModalPresentationActive
      && !self->_isTransientOverlayPresentationActive
      && self->_hasHandledInitialPresentationRequest)
    {
      uint64_t v7 = SBLogInCallPresentation();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = @"removing from";
        if (v6) {
          uint64_t v8 = @"adding to";
        }
        *(_DWORD *)long long buf = 138543618;
        id v13 = self;
        __int16 v14 = 2114;
        id v15 = v8;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "_updateSwitcherVisibilityIfDismissed: %{public}@ %{public}@ switcher model", buf, 0x16u);
      }

      if (v6)
      {
        uint64_t v9 = *MEMORY[0x1E4FA7E18];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __110__SBInCallPresentationSession__updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState___block_invoke;
        v11[3] = &unk_1E6AFBD00;
        void v11[4] = self;
        [(SBInCallPresentationSession *)self _insertIntoSwitcherAsDismissedWithAnalyticsSource:v9 transitionValidator:v11 completion:&__block_literal_global_228_0];
      }
      else
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        void v10[2] = __110__SBInCallPresentationSession__updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState___block_invoke_2;
        v10[3] = &unk_1E6AFBD00;
        void v10[4] = self;
        [(SBInCallPresentationSession *)self _removeFromSwitcherForPrefersHiddenWhenDismissedWithValidator:v10];
      }
    }
  }
LABEL_9:
}

uint64_t __110__SBInCallPresentationSession__updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) _isInSwitcherModel] & 1) != 0
    || ([*(id *)(a1 + 32) _shouldExcludeFromSwitcherWhenDismissed] & 1) != 0)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 32) _isValidForSceneUpdates];
  }
  id v3 = SBLogInCallPresentation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "_updateSwitcherVisibilityIfDismissed validated: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  return v2;
}

uint64_t __110__SBInCallPresentationSession__updateVisibilityInSwitcherForPrefersHiddenWhenDismissedIfNeededForLayoutState___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isInSwitcherModel]
    && [*(id *)(a1 + 32) _shouldExcludeFromSwitcherWhenDismissed])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) isAnySwitcherVisible] ^ 1;
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = SBLogInCallPresentation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "_updateSwitcherVisibilityIfDismissed validated: %{BOOL}u", (uint8_t *)v5, 8u);
  }

  return v2;
}

- (id)_sceneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v3 = [WeakRetained sceneManager];

  return v3;
}

- (id)_screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v3 = [WeakRetained screen];

  return v3;
}

- (void)_updateSceneSettingsForAmbientPresentationSettingsUpdate
{
  id v3 = [(SBInCallPresentationSession *)self sceneHandle];
  id v4 = [v3 sceneIfExists];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __87__SBInCallPresentationSession__updateSceneSettingsForAmbientPresentationSettingsUpdate__block_invoke;
  v5[3] = &unk_1E6AF8858;
  v5[4] = self;
  [v4 updateSettingsWithBlock:v5];
}

uint64_t __87__SBInCallPresentationSession__updateSceneSettingsForAmbientPresentationSettingsUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateAmbientPresentationSettingsForInCallSettings:a2];
}

- (void)_updateAmbientPresentationSettingsForInCallSettings:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToExtension:objc_opt_class()])
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v4, "setAmbientPresented:", -[SBInCallPresentationSession _isAmbientPresentationActive](self, "_isAmbientPresentationActive"));
    }
    if (objc_opt_respondsToSelector()) {
      [v4 setAmbientDisplayStyle:self->_ambientDisplayStyle];
    }
  }
}

- (BOOL)_isAmbientPresentationActive
{
  if (self->_isAmbientPresented) {
    return 1;
  }
  id v3 = self;
  id v4 = [(SBInCallPresentationSession *)self delegate];
  LOBYTE(v3) = [v4 inCallClientPresentationSessionAmbientPresentationActive:v3];

  return (char)v3;
}

- (BOOL)_isProximityReaderPresented
{
  return [(SBFLockOutStatusProvider *)self->_lockoutStateProvider isProximityReaderBlocked];
}

- (SBInCallPresentationSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBInCallPresentationSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)preferredBannerHeight
{
  return self->_preferredBannerHeight;
}

- (void)setPreferredBannerHeight:(double)a3
{
  self->_preferredBannerHeight = a3;
}

- (BOOL)areNonModalPresentationsSuppressed
{
  return self->_nonModalPresentationsSuppressed;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (BOOL)shouldIgnoreHomeIndicatorAutoHiddenClientSettings
{
  return self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings;
}

- (UIEdgeInsets)preferredPIPDodgingInsets
{
  double top = self->_preferredPIPDodgingInsets.top;
  double left = self->_preferredPIPDodgingInsets.left;
  double bottom = self->_preferredPIPDodgingInsets.bottom;
  double right = self->_preferredPIPDodgingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hideSharePlayContentFromClonedDisplayAssertion, 0);
  objc_destroyWeak((id *)&self->_sceneHandleToObserveForShowSystemControlsAction);
  objc_storeStrong((id *)&self->_requestedPresentationConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_inCallSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_preventKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_preferredDismissalPrimaryElement, 0);
  objc_storeStrong((id *)&self->_continuityDisplayAppStatusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_appStatusBarSettingsAssertion, 0);
  objc_storeStrong((id *)&self->_allowHiddenAppAssertion, 0);
  objc_storeStrong((id *)&self->_systemGestureSceneDeactivationAssertion, 0);
  objc_storeStrong((id *)&self->_systemAnimationSceneDeactivationAssertion, 0);
  objc_storeStrong((id *)&self->_deactivationManager, 0);
  objc_storeStrong((id *)&self->_suppressHomeIndicatorWhileAttachedToWindowedAccessoryAssertion, 0);
  objc_storeStrong((id *)&self->_bannerDidDisappearHandlerByUUID, 0);
  objc_storeStrong((id *)&self->_lockoutStateProvider, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
  objc_storeStrong((id *)&self->_springBoard, 0);
  objc_storeStrong((id *)&self->_pipControllerCoordinator, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_mainSwitcherCoordinator, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_entityToUnfurlSourceContext, 0);
  objc_storeStrong((id *)&self->_entityToSceneUpdateContext, 0);
  objc_storeStrong((id *)&self->_transientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_keyboardFocusCoordinator, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_localEventQueue, 0);
  objc_storeStrong((id *)&self->_ignoreSuspendedUnderLockAssertion, 0);
  objc_storeStrong((id *)&self->_deviceLockHandlingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_jindoInvalidatable, 0);
  objc_storeStrong((id *)&self->_jindoElement, 0);
  objc_storeStrong((id *)&self->_bannerPresentableViewController, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_assertionAnalyticSources, 0);
  objc_storeStrong((id *)&self->_activeSystemAnimationDeactivationReasons, 0);
  objc_storeStrong((id *)&self->_activeSystemGestureDeactivationReasons, 0);
}

- (void)_handleTransitionToSceneHandle:(uint64_t)a3 sceneManager:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_performSwitcherPresentationTransitionAnimated:(uint64_t)a1 isUserInitiated:(NSObject *)a2 analyticsSource:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "ICSZOMBIE: Found a zombie ICS presentation %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_performPresentationWithRequestedPresentationMode:(uint64_t)a1 isUserInitiated:(NSObject *)a2 animated:analyticsSource:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Unexpected request for Banner presentation while system aperture element exists from %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_performPresentationWithRequestedPresentationMode:(uint64_t)a3 isUserInitiated:(uint64_t)a4 animated:(uint64_t)a5 analyticsSource:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_presentWithRequestedConfiguration:(uint64_t)a3 animated:(uint64_t)a4 analyticsSource:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end