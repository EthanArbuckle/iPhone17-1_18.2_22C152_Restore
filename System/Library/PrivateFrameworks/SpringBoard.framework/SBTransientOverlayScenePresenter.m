@interface SBTransientOverlayScenePresenter
- (BOOL)_isPresentationStatusBarHiddenForVisibility:(int)a3 currentExternalStatusBarSettings:(id)a4;
- (BOOL)activePresentationPreventsDragAndDrop;
- (BOOL)canActivePresentationBecomeLocalFirstResponder;
- (BOOL)canHandleButtonEvents;
- (BOOL)defaultShouldAutorotateForTransientOverlayViewController:(id)a3;
- (BOOL)handleDoubleHeightStatusBarTap;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hasActivePresentation;
- (BOOL)hasActivePresentationFromBundleIdentifier:(id)a3;
- (BOOL)hasActivePresentationFromProcess:(id)a3;
- (BOOL)hasActiveSpotlightPresentation;
- (BOOL)hasIdleTimerBehaviors;
- (BOOL)hasPresentationAboveWindowLevel:(double)a3;
- (BOOL)hasVisibleStatusBar;
- (BOOL)isKeyboardVisibleForSpringBoardForTransientOverlayViewController:(id)a3;
- (BOOL)isPresentingViewController:(id)a3;
- (BOOL)isTopmostPresentationFromSceneWithIdentityTokenString:(id)a3;
- (BOOL)isTopmostPresentedViewController:(id)a3;
- (BOOL)ownsHomeGesture;
- (BOOL)prefersStatusBarActivityItemVisible;
- (BOOL)shouldDisableControlCenter;
- (BOOL)shouldDisableCoverSheetGesture;
- (BOOL)shouldDisableSiri;
- (BOOL)shouldUseSceneBasedKeyboardFocusForActivePresentation;
- (BOOL)transientOverlayViewControllerIsForegroundActive:(id)a3;
- (NSArray)presentedViewControllers;
- (NSNumber)preferredWhitePointAdaptivityStyleValue;
- (SBBannerManager)bannerManager;
- (SBCoverSheetPresentationManager)coverSheetPresentationManager;
- (SBIdleTimerCoordinating)idleTimerCoordinator;
- (SBInCallPresentationManager)inCallPresentationManager;
- (SBTransientOverlayScenePresenter)initWithWindowScene:(id)a3 alertItemsController:(id)a4 lockStateAggregator:(id)a5 zStackResolver:(id)a6 reachabilityManager:(id)a7;
- (SBTransientOverlayScenePresenterDelegate)delegate;
- (SBTransientOverlayViewController)topmostPresentedViewController;
- (SBTransientOverlayViewController)viewControllerForGestureDismissal;
- (SBWindowScene)windowScene;
- (UIStatusBarStyleRequest)currentStatusBarStyleRequest;
- (double)_backgroundWindowLevelForEntity:(id)a3;
- (double)_windowLevelForEntity:(id)a3;
- (double)topmostWindowLevel;
- (id)_buttonEventHandlingViewController;
- (id)_currentExternalStatusBarSettings;
- (id)_newKeyboardFocusAssertionForEntity:(id)a3;
- (id)_newSceneDeactivationAssertionWithReason:(int64_t)a3;
- (id)_topmostPresentedEntity;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5;
- (id)keyboardFocusTargetForTopmostPresentingScene;
- (id)newContentStatusBarHiddenAssertionWithReason:(id)a3;
- (int)_preferredStatusBarVisibilityForEntity:(id)a3;
- (int64_t)defaultPreferredInterfaceOrientationForPresentationForTransientOverlayViewController:(id)a3;
- (int64_t)preferredGestureDismissalStyle;
- (int64_t)presentedViewControllerCount;
- (int64_t)topmostViewControllerInterfaceOrientation;
- (unint64_t)defaultSupportedInterfaceOrientationsForTransientOverlayViewController:(id)a3;
- (void)_applyProximityDetectionModeForEntity:(id)a3;
- (void)_applyWallpaperAnimationSuspensionAssertionForEntity:(id)a3;
- (void)_dismissEntity:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_getContentScale:(double *)a3 translation:(CGPoint *)a4 fromRect:(CGRect)a5 entity:(id)a6;
- (void)_handleCoverSheetWillPresent:(id)a3;
- (void)_invalidateAssertionsForEntity:(id)a3;
- (void)_preserveInputViewsForEntityIfNeeded:(id)a3;
- (void)_restoreInputViewsForEntityIfNeeded:(id)a3;
- (void)_updateBackgroundWindowForEntity:(id)a3;
- (void)_updateContentStatusBarPresentation;
- (void)_updateCurrentEntityHomeGrabberAnimated:(BOOL)a3;
- (void)_updateDeactivationAssertions;
- (void)_updateFeaturePolicies;
- (void)_updatePreferredWhitePointAdaptivityStyle;
- (void)_updateStatusBarWithCurrentExternalStatusBarSettings:(id)a3 animated:(BOOL)a4;
- (void)_updateWindowHitTestingForEntity:(id)a3;
- (void)_updateZStackStateWithAnimationBehavior:(int64_t)a3 reason:(id)a4;
- (void)_windowedAccessoryDidAttachOrDetach:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)homeGrabberViewDidReceiveClick:(id)a3;
- (void)homeGrabberViewDidUpdateHidden:(id)a3;
- (void)performDismissalRequest:(id)a3 outerCompletionHandler:(id)a4;
- (void)performPresentationRequest:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setBannerManager:(id)a3;
- (void)setCoverSheetPresentationManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFluidDismissalState:(id)a3 forViewController:(id)a4;
- (void)setIdleTimerCoordinator:(id)a3;
- (void)setInCallPresentationManager:(id)a3;
- (void)transientOverlayViewController:(id)a3 requestZStackParticipantPreferencesUpdateWithReason:(id)a4;
- (void)transientOverlayViewControllerDidEndRotation:(id)a3;
- (void)transientOverlayViewControllerDidUpdateHIDEventDeferringDisabled:(id)a3;
- (void)transientOverlayViewControllerDidUpdatePresentationPrefersStatusBarHidden:(id)a3;
- (void)transientOverlayViewControllerNeedsContentOpaqueUpdate:(id)a3;
- (void)transientOverlayViewControllerNeedsGestureDismissalStyleUpdate:(id)a3;
- (void)transientOverlayViewControllerNeedsProximityDetectionUpdate:(id)a3;
- (void)transientOverlayViewControllerNeedsStatusBarAppearanceUpdate:(id)a3;
- (void)transientOverlayViewControllerNeedsWhitePointAdaptivityStyleUpdate:(id)a3;
- (void)transientOverlayViewControllerNeedsWindowHitTestingUpdate:(id)a3;
- (void)transientOverlayViewControllerWillBeginRotation:(id)a3 toInterfaceOrientation:(int64_t)a4;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBTransientOverlayScenePresenter

- (BOOL)hasActivePresentation
{
  v2 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_topmostPresentedEntity
{
  BOOL v3 = [(NSMutableArray *)self->_entities lastObject];
  v4 = v3;
  if (v3 && ([v3 isDismissing] & 1) != 0)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__122;
    v13 = __Block_byref_object_dispose__122;
    id v14 = 0;
    entities = self->_entities;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__SBTransientOverlayScenePresenter__topmostPresentedEntity__block_invoke;
    v8[3] = &unk_1E6B0DA98;
    v8[4] = &v9;
    [(NSMutableArray *)entities enumerateObjectsWithOptions:2 usingBlock:v8];
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (BOOL)hasIdleTimerBehaviors
{
  v2 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSNumber)preferredWhitePointAdaptivityStyleValue
{
  return self->_preferredWhitePointAdaptivityStyleValue;
}

- (void)zStackParticipantDidChange:(id)a3
{
  id v5 = a3;
  [(SBTransientOverlayScenePresenter *)self _updateCurrentEntityHomeGrabberAnimated:self->_homeAffordanceUpdatesShouldBeAnimated];
  if ([v5 activationState] == 1)
  {
    v4 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
    [(SBTransientOverlayScenePresenter *)self _preserveInputViewsForEntityIfNeeded:v4];
  }
  else
  {
    if ([v5 activationState]) {
      goto LABEL_6;
    }
    v4 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
    [(SBTransientOverlayScenePresenter *)self _restoreInputViewsForEntityIfNeeded:v4];
  }

LABEL_6:
}

- (void)_updateCurrentEntityHomeGrabberAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v18 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  id v5 = [v18 viewController];
  if ([(SBLockStateAggregator *)self->_lockStateAggregator hasAnyLockState]) {
    uint64_t v6 = [v5 preferredLockedGestureDismissalStyle];
  }
  else {
    uint64_t v6 = [v5 preferredUnlockedGestureDismissalStyle];
  }
  uint64_t v7 = v6;
  v17 = v5;
  if ([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture]) {
    int v8 = [(SBFZStackParticipant *)self->_zStackParticipant homeAffordanceDrawingSuppressed] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = self->_entities;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
        if ((objc_msgSend(v14, "isDismissing", v17) & 1) == 0)
        {
          if ((v8 & (v14 == v18)) != 0) {
            LOBYTE(v8) = v7 != 0;
          }
          v15 = [v14 viewController];
          [v15 setPresentationPrefersHomeGrabberHidden:(v8 & 1) == 0 animated:v3];

          v16 = [v14 viewController];
          [v16 setHomeGrabberPointerClickDelegate:self];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)_restoreInputViewsForEntityIfNeeded:(id)a3
{
  id v4 = a3;
  if ([v4 hasPreservedInputViews])
  {
    [v4 setHasPreservedInputViews:0];
    BOOL v3 = [v4 viewController];
    [v3 restoreInputViewsAnimated:1];
  }
}

- (SBTransientOverlayViewController)viewControllerForGestureDismissal
{
  v2 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  BOOL v3 = [v2 viewController];

  return (SBTransientOverlayViewController *)v3;
}

- (SBTransientOverlayScenePresenter)initWithWindowScene:(id)a3 alertItemsController:(id)a4 lockStateAggregator:(id)a5 zStackResolver:(id)a6 reachabilityManager:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SBTransientOverlayScenePresenter;
  v17 = [(SBTransientOverlayScenePresenter *)&v27 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_windowScene, v12);
    objc_storeStrong((id *)&v18->_alertItemsController, a4);
    uint64_t v19 = [v15 acquireParticipantWithIdentifier:15 delegate:v18];
    zStackParticipant = v18->_zStackParticipant;
    v18->_zStackParticipant = (SBFZStackParticipant *)v19;

    long long v21 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBPhysicalButtonZStackPolicyAssistant alloc] initWithParticipant:v18->_zStackParticipant];
    zStackPhysicalButtonPolicyAssistant = v18->_zStackPhysicalButtonPolicyAssistant;
    v18->_zStackPhysicalButtonPolicyAssistant = v21;

    objc_storeStrong((id *)&v18->_lockStateAggregator, a5);
    objc_storeStrong((id *)&v18->_reachabilityManager, a7);
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v18 selector:sel__windowedAccessoryDidAttachOrDetach_ name:@"SBUIWindowedAccessoryDidAttachOrDetachNotification" object:0];

    uint64_t v24 = [[SBIdleTimerCoordinatorHelper alloc] initWithSourceProvider:v18];
    idleTimerCoordinatorHelper = v18->_idleTimerCoordinatorHelper;
    v18->_idleTimerCoordinatorHelper = v24;
  }
  return v18;
}

- (void)dealloc
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = WeakRetained;
  if (self->_coverSheetExternalBehaviorProvider) {
    objc_msgSend(WeakRetained, "transientOverlayScenePresenter:unregisterCoverSheetExternalBehaviorProvider:", self);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = self->_entities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = [v10 viewController];
        [v11 setTransientOverlayDelegate:0];
        [v11 setIdleTimerCoordinator:0];
        [(SBTransientOverlayScenePresenter *)self _invalidateAssertionsForEntity:v10];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = [(NSMapTable *)self->_entityToSceneDeactivationAssertion objectEnumerator];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * j) relinquish];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  [(SBFZStackParticipant *)self->_zStackParticipant invalidate];
  [(BSInvalidatable *)self->_bannerSuppressionAssertion invalidate];
  [(BSInvalidatable *)self->_inCallNonModalSuppressionAssertion invalidate];
  [(BSInvalidatable *)self->_deviceOrientationUpdateDeferralAssertion invalidate];
  [(SBWindowSceneStatusBarSettingsAssertion *)self->_globalStatusBarAssertion invalidate];
  [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper removeProvider:self];
  if (self->_isPendingAlertItems) {
    [(SBAlertItemsController *)self->_alertItemsController setForceAlertsToPend:0 forReason:@"_SBTransientOverlayScenePresenterAlertItemsPendReason"];
  }
  if (self->_isReachabilityTemporarilyDisabled) {
    [(SBReachabilityManager *)self->_reachabilityManager setReachabilityTemporarilyDisabled:0 forReason:@"_SBTransientOverlayScenePresenterReachabilityDisabledReason"];
  }
  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 removeObserver:self name:@"SBUIWindowedAccessoryDidAttachOrDetachNotification" object:0];

  [(SBTransientOverlayScenePresenter *)self setCoverSheetPresentationManager:0];
  v18.receiver = self;
  v18.super_class = (Class)SBTransientOverlayScenePresenter;
  [(SBTransientOverlayScenePresenter *)&v18 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        uint64_t v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      [(NSHashTable *)observers addObject:v9];
      id v4 = v9;
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (v5) {
    [(NSHashTable *)self->_observers removeObject:v5];
  }
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)setCoverSheetPresentationManager:(id)a3
{
  id v5 = (SBCoverSheetPresentationManager *)a3;
  coverSheetPresentationManager = self->_coverSheetPresentationManager;
  id v9 = v5;
  if (coverSheetPresentationManager != v5)
  {
    if (coverSheetPresentationManager)
    {
      uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 removeObserver:self name:@"SBCoverSheetWillPresentNotification" object:self->_coverSheetPresentationManager];
    }
    objc_storeStrong((id *)&self->_coverSheetPresentationManager, a3);
    if (self->_coverSheetPresentationManager)
    {
      uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:self selector:sel__handleCoverSheetWillPresent_ name:@"SBCoverSheetWillPresentNotification" object:self->_coverSheetPresentationManager];
    }
  }
}

- (BOOL)canHandleButtonEvents
{
  v2 = [(SBTransientOverlayScenePresenter *)self _buttonEventHandlingViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper targetCoordinator];
}

- (BOOL)ownsHomeGesture
{
  return [(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture];
}

- (int64_t)preferredGestureDismissalStyle
{
  BOOL v3 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  id v4 = [v3 viewController];

  if ([(SBLockStateAggregator *)self->_lockStateAggregator hasAnyLockState]) {
    uint64_t v5 = [v4 preferredLockedGestureDismissalStyle];
  }
  else {
    uint64_t v5 = [v4 preferredUnlockedGestureDismissalStyle];
  }
  int64_t v6 = v5;

  return v6;
}

- (void)setBannerManager:(id)a3
{
  uint64_t v5 = (SBBannerManager *)a3;
  if (self->_bannerManager != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_bannerManager, a3);
    [(SBTransientOverlayScenePresenter *)self _updateFeaturePolicies];
    uint64_t v5 = v6;
  }
}

- (void)setInCallPresentationManager:(id)a3
{
  uint64_t v5 = (SBInCallPresentationManager *)a3;
  if (self->_inCallPresentationManager != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_inCallPresentationManager, a3);
    [(SBTransientOverlayScenePresenter *)self _updateFeaturePolicies];
    uint64_t v5 = v6;
  }
}

- (void)setIdleTimerCoordinator:(id)a3
{
}

- (BOOL)shouldDisableControlCenter
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_entities;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        int64_t v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "viewController", (void)v9);
        char v7 = [v6 shouldDisableControlCenter];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)shouldDisableCoverSheetGesture
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_entities;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        int64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isDismissing", (void)v10) & 1) == 0)
        {
          char v7 = [v6 viewController];
          int v8 = [v7 dismissesForCoverSheetPresentation];

          if (!v8)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)shouldDisableSiri
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_entities;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        int64_t v6 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "viewController", (void)v9);
        char v7 = [v6 shouldDisableSiri];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (SBTransientOverlayViewController)topmostPresentedViewController
{
  v2 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  uint64_t v3 = [v2 viewController];

  return (SBTransientOverlayViewController *)v3;
}

- (double)topmostWindowLevel
{
  v2 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  uint64_t v3 = [v2 window];
  [v3 windowLevel];
  double v5 = v4;

  return v5;
}

- (UIStatusBarStyleRequest)currentStatusBarStyleRequest
{
  v2 = [(SBTransientOverlayScenePresenter *)self _statusBarEntity];
  uint64_t v3 = [v2 viewController];
  double v4 = [v3 currentStatusBarStyleRequest];

  return (UIStatusBarStyleRequest *)v4;
}

- (BOOL)handleDoubleHeightStatusBarTap
{
  v2 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  uint64_t v3 = [v2 viewController];

  if (v3) {
    char v4 = [v3 handleDoubleHeightStatusBarTap];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)hasPresentationAboveWindowLevel:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = self->_entities;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        char v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "window", (void)v10);
        [v7 windowLevel];
        char v8 = BSFloatGreaterThanOrEqualToFloat();

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)canActivePresentationBecomeLocalFirstResponder
{
  v2 = [(SBTransientOverlayScenePresenter *)self topmostPresentedViewController];
  char v3 = [v2 canBecomeLocalFirstResponder];

  return v3;
}

- (BOOL)activePresentationPreventsDragAndDrop
{
  BOOL v3 = [(SBTransientOverlayScenePresenter *)self hasActivePresentation];
  if (v3)
  {
    uint64_t v4 = [(SBTransientOverlayScenePresenter *)self topmostPresentedViewController];
    char v5 = [v4 shouldPreventDragAndDrop];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (NSArray)presentedViewControllers
{
  return (NSArray *)[(NSMutableArray *)self->_entities bs_compactMap:&__block_literal_global_391];
}

id __60__SBTransientOverlayScenePresenter_presentedViewControllers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDismissing])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [v2 viewController];
  }

  return v3;
}

- (int64_t)presentedViewControllerCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_entities;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isDismissing", (void)v9) ^ 1;
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseSceneBasedKeyboardFocusForActivePresentation
{
  id v2 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  uint64_t v3 = [v2 viewController];
  char v4 = [v3 shouldUseSceneBasedKeyboardFocus];

  return v4;
}

- (BOOL)hasVisibleStatusBar
{
  id v2 = [(SBTransientOverlayScenePresenter *)self _statusBarEntity];
  uint64_t v3 = [v2 viewController];
  char v4 = [v3 hasVisibleStatusBar];

  return v4;
}

- (BOOL)isPresentingViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v5 = self->_entities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isDismissing", (void)v12) & 1) == 0)
        {
          id v10 = [v9 viewController];

          if (v10 == v4)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)isTopmostPresentedViewController:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  int64_t v5 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  id v6 = [v5 viewController];
  BOOL v7 = v6 == v4;

  return v7;
}

- (BOOL)hasActivePresentationFromProcess:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v5 = [(SBTransientOverlayScenePresenter *)self presentedViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isPresentedByProcess:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasActivePresentationFromBundleIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v5 = [(SBTransientOverlayScenePresenter *)self presentedViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isPresentedByBundleIdentifier:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)keyboardFocusTargetForTopmostPresentingScene
{
  id v2 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  uint64_t v3 = [v2 viewController];
  id v4 = [v3 keyboardFocusTarget];

  return v4;
}

- (BOOL)isTopmostPresentationFromSceneWithIdentityTokenString:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  uint64_t v6 = [v5 viewController];
  char v7 = [v6 isPresentedFromSceneWithIdentityTokenString:v4];

  return v7;
}

- (BOOL)hasActiveSpotlightPresentation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(SBTransientOverlayScenePresenter *)self presentedViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)prefersStatusBarActivityItemVisible
{
  id v2 = [(SBTransientOverlayScenePresenter *)self _statusBarEntity];
  uint64_t v3 = [v2 viewController];
  char v4 = [v3 prefersStatusBarActivityItemVisible];

  return v4;
}

- (id)newContentStatusBarHiddenAssertionWithReason:(id)a3
{
  id v4 = a3;
  if (!self->_contentStatusBarHiddenAssertions)
  {
    int64_t v5 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    contentStatusBarHiddenAssertions = self->_contentStatusBarHiddenAssertions;
    self->_contentStatusBarHiddenAssertions = v5;
  }
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F4F838]);
  long long v8 = [MEMORY[0x1E4F29128] UUID];
  long long v9 = [v8 UUIDString];
  uint64_t v10 = MEMORY[0x1E4F14428];
  id v11 = MEMORY[0x1E4F14428];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __81__SBTransientOverlayScenePresenter_newContentStatusBarHiddenAssertionWithReason___block_invoke;
  uint64_t v17 = &unk_1E6AF4FB8;
  objc_copyWeak(&v18, &location);
  uint64_t v12 = (void *)[v7 initWithIdentifier:v9 forReason:v4 queue:v10 invalidationBlock:&v14];

  -[NSMutableArray addObject:](self->_contentStatusBarHiddenAssertions, "addObject:", v12, v14, v15, v16, v17);
  [(SBTransientOverlayScenePresenter *)self _updateContentStatusBarPresentation];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

void __81__SBTransientOverlayScenePresenter_newContentStatusBarHiddenAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[6] removeObject:v5];
    [v4 _updateContentStatusBarPresentation];
  }
}

- (void)performDismissalRequest:(id)a3 outerCompletionHandler:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v37 = v6;
  uint64_t v8 = [v6 requestType];
  if ((unint64_t)(v8 - 2) < 2)
  {
    id v36 = v7;
    id v18 = self;
    long long v19 = (void *)[(NSMutableArray *)self->_entities copy];
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    uint64_t v52 = 0;
    v35 = v19;
    uint64_t v52 = [v19 count];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __83__SBTransientOverlayScenePresenter_performDismissalRequest_outerCompletionHandler___block_invoke;
    v45[3] = &unk_1E6B0D9A8;
    v48 = &v49;
    id v47 = v7;
    id v20 = v6;
    id v46 = v20;
    uint64_t v21 = MEMORY[0x1D948C7A0](v45);
    long long v22 = (void *)v21;
    if (v50[3] < 1)
    {
      (*(void (**)(uint64_t))(v21 + 16))(v21);
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v23 = [v35 reverseObjectEnumerator];
      uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v57 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            uint64_t v28 = [v20 isAnimated];
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __83__SBTransientOverlayScenePresenter_performDismissalRequest_outerCompletionHandler___block_invoke_2;
            v38[3] = &unk_1E6AFD800;
            v40 = &v49;
            id v39 = v22;
            [(SBTransientOverlayScenePresenter *)v18 _dismissEntity:v27 animated:v28 completion:v38];
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v57 count:16];
        }
        while (v24);
      }
    }
    _Block_object_dispose(&v49, 8);

    id v7 = v36;
  }
  else if (v8)
  {
    if (v8 == 1)
    {
      id v9 = v7;
      uint64_t v10 = [v6 viewController];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v11 = self->_entities;
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v54;
LABEL_6:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v54 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v53 + 1) + 8 * v14);
          id v16 = [v15 viewController];
          BOOL v17 = v16 == v10;

          if (v17) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v53 objects:v58 count:16];
            if (v12) {
              goto LABEL_6;
            }
            goto LABEL_12;
          }
        }
        id v31 = v15;

        if (!v31) {
          goto LABEL_29;
        }
        uint64_t v32 = [v37 isAnimated];
        v33 = [v37 completionHandler];
        [(SBTransientOverlayScenePresenter *)self _dismissEntity:v31 animated:v32 completion:v33];
      }
      else
      {
LABEL_12:

LABEL_29:
        uint64_t v34 = [v37 completionHandler];
        id v31 = (id)v34;
        if (v34) {
          (*(void (**)(uint64_t))(v34 + 16))(v34);
        }
      }

      id v7 = v9;
    }
  }
  else
  {
    uint64_t v29 = [v6 completionHandler];
    v30 = (void *)v29;
    if (v29) {
      (*(void (**)(uint64_t))(v29 + 16))(v29);
    }
  }
}

void __83__SBTransientOverlayScenePresenter_performDismissalRequest_outerCompletionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return;
  }
  if (!*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) completionHandler];
    id v4 = (void (**)(void))MEMORY[0x1D948C7A0]();

    v1 = v4;
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v1 = (void (**)(void))MEMORY[0x1D948C7A0](*(void *)(a1 + 40));
  if (v1)
  {
LABEL_4:
    uint64_t v3 = v1;
    v1[2]();
    v1 = v3;
  }
LABEL_5:
}

uint64_t __83__SBTransientOverlayScenePresenter_performDismissalRequest_outerCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performPresentationRequest:(id)a3
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v113 = a3;
  BOOL isInitiatingEntityPresentation = self->_isInitiatingEntityPresentation;
  self->_BOOL isInitiatingEntityPresentation = 1;
  v103 = [(SBTransientOverlayScenePresenter *)self _currentExternalStatusBarSettings];
  v114 = (void *)[v113 mutableCopy];
  id v4 = [v114 viewController];
  unsigned int v116 = [v113 isAnimated];
  id v5 = SBLogTransientOverlay();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v159) = v116;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing presentation for %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
  }

  [v4 setTransientOverlayDelegate:self];
  objc_msgSend(v4, "bs_beginAppearanceTransition:animated:", 1, v116);
  if (![(NSMutableArray *)self->_entities count])
  {
    id v6 = [MEMORY[0x1E4F43058] _applicationKeyWindow];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ([WeakRetained transientOverlayScenePresenter:self shouldResignFirstResponderForKeyWindow:v6])
    {
      int v8 = [v6 canResignFirstResponder];

      if (v8)
      {
        objc_storeStrong((id *)&self->_initialPresentationKeyWindow, v6);
        [(UIWindow *)self->_initialPresentationKeyWindow resignFirstResponder];
      }
    }
    else
    {
    }
  }
  v112 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  v104 = [v114 originatingProcess];
  if (!v112) {
    goto LABEL_26;
  }
  id v9 = [v112 viewController];
  if (([v9 allowsStackingOverlayContentAbove] & 1) == 0)
  {
    if (v104)
    {
      uint64_t v10 = [v112 viewController];
      char v11 = [v10 isPresentedByProcess:v104];

      if (v11) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    uint64_t v12 = (void *)[(NSMutableArray *)self->_entities copy];
    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    id v9 = v12;
    uint64_t v13 = [v9 countByEnumeratingWithState:&v152 objects:v161 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v153;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v153 != v14) {
            objc_enumerationMutation(v9);
          }
          id v16 = *(void **)(*((void *)&v152 + 1) + 8 * i);
          if (([v16 isDismissing] & 1) == 0) {
            [(SBTransientOverlayScenePresenter *)self _dismissEntity:v16 animated:1 completion:0];
          }
        }
        uint64_t v13 = [v9 countByEnumeratingWithState:&v152 objects:v161 count:16];
      }
      while (v13);
    }
  }
LABEL_26:
  uint64_t v17 = [v4 preferredInterfaceOrientationForPresentation];
  char v18 = [v4 supportedInterfaceOrientations];
  id v115 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v17)
  {
    long long v19 = SBLogTransientOverlay();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = BSInterfaceOrientationDescription();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ has a preferred interface orientation: %{public}@", buf, 0x16u);
    }
    uint64_t v21 = v17;
  }
  else
  {
    uint64_t v22 = [v115 defaultPreferredInterfaceOrientationForPresentationForTransientOverlayScenePresenter:self];
    if ((unint64_t)(v22 - 1) >= 4) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v22;
    }
  }
  uint64_t v23 = v18 & 0x1E;
  if ((v18 & 0x1E) == 0)
  {
    uint64_t v24 = v21;
    uint64_t v23 = [v115 defaultSupportedInterfaceOrientationsForTransientOverlayScenePresenter:self];
    uint64_t v21 = v24;
  }
  if ((v23 & (1 << v21)) == 0)
  {
    if ((v23 & 2) != 0)
    {
      uint64_t v21 = 1;
    }
    else if ((v23 & 0x10) != 0)
    {
      uint64_t v21 = 4;
    }
    else if ((v23 & 8) != 0)
    {
      uint64_t v21 = 3;
    }
    else
    {
      uint64_t v21 = 2;
    }
  }
  uint64_t v101 = v21;
  objc_msgSend(v4, "setContainerOrientation:");
  [(SBTransientOverlayScenePresenter *)self setFluidDismissalState:0 forViewController:v4];
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  uint64_t v25 = self->_entities;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v148 objects:v160 count:16];
  if (!v26)
  {
LABEL_53:

LABEL_58:
    id v36 = [SBTransientOverlayWindow alloc];
    v37 = [(SBTransientOverlayScenePresenter *)self windowScene];
    v38 = [NSString stringWithFormat:@"SBTransientOverlayScenePresenter-%@", v4];
    v108 = [(SBWindow *)v36 initWithWindowScene:v37 rootViewController:v4 role:@"SBTraitsParticipantRoleTransientOverlay" debugName:v38];

    id v39 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBTransientOverlayWindow *)v108 setBackgroundColor:v39];

    if (!self->_entities)
    {
      v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      entities = self->_entities;
      self->_entities = v40;
    }
    long long v42 = [_SBTransientOverlayPresentedEntity alloc];
    double v43 = *MEMORY[0x1E4F43CF8] + 5.0;
    v35 = [(_SBTransientOverlayPresentedEntity *)v42 initWithViewController:v4 window:v108 baseWindowLevel:v43];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v159 = 0;
    long long v44 = self->_entities;
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke;
    v147[3] = &unk_1E6B0D9D0;
    *(double *)&v147[5] = v43;
    v147[4] = buf;
    [(NSMutableArray *)v44 enumerateObjectsWithOptions:2 usingBlock:v147];
    [(NSMutableArray *)self->_entities insertObject:v35 atIndex:*(void *)(*(void *)&buf[8] + 24)];
    if (*(void *)(*(void *)&buf[8] + 24))
    {
      unint64_t v45 = 0;
      do
      {
        id v46 = [(NSMutableArray *)self->_entities objectAtIndex:v45];
        [(SBTransientOverlayScenePresenter *)self _preserveInputViewsForEntityIfNeeded:v46];

        ++v45;
      }
      while (v45 < *(void *)(*(void *)&buf[8] + 24));
    }
    v110 = [v115 siriPresentationObservationTokenForTransientOverlayScenePresenter:self];
    if (v110 && SBPresentationObservationTokenStatePresentedOrPresenting([v110 state]))
    {
      id v47 = [v115 transientOverlayScenePresenter:self acquireSiriWindowLevelAssertionWithReason:@"TransientOverlayPresented" windowLevel:v43 + -1.0];
      if (v47)
      {
        [(_SBTransientOverlayPresentedEntity *)v35 setSiriPresentationObservationToken:v110];
        [(_SBTransientOverlayPresentedEntity *)v35 setSiriWindowLevelAssertion:v47];
        objc_initWeak(&location, self);
        objc_initWeak(&from, v35);
        v142[0] = MEMORY[0x1E4F143A8];
        v142[1] = 3221225472;
        v142[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_2;
        v142[3] = &unk_1E6B0D9F8;
        objc_copyWeak(&v143, &from);
        objc_copyWeak(&v144, &location);
        [v110 setDidDismissHandler:v142];
        objc_destroyWeak(&v144);
        objc_destroyWeak(&v143);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
    v48 = [v115 controlCenterPresentationObservationTokenForTransientOverlayScenePresenter:self];
    uint64_t v49 = v48;
    if (v48 && SBPresentationObservationTokenStatePresentedOrPresenting([v48 state]))
    {
      v50 = [v115 transientOverlayScenePresenter:self acquireControlCenterWindowLevelAssertionWithReason:@"TransientOverlayPresented" windowLevel:v43 + -0.9];
      if (v50)
      {
        [(_SBTransientOverlayPresentedEntity *)v35 setControlCenterPresentationObservationToken:v49];
        [(_SBTransientOverlayPresentedEntity *)v35 setControlCenterWindowLevelAssertion:v50];
        objc_initWeak(&location, self);
        objc_initWeak(&from, v35);
        v139[0] = MEMORY[0x1E4F143A8];
        v139[1] = 3221225472;
        v139[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_3;
        v139[3] = &unk_1E6B0D9F8;
        objc_copyWeak(&v140, &from);
        objc_copyWeak(&v141, &location);
        [v49 setDidDismissHandler:v139];
        objc_destroyWeak(&v141);
        objc_destroyWeak(&v140);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
    uint64_t v51 = [v115 bannerLongLookPresentationObservationTokenForTransientOverlayScenePresenter:self];
    uint64_t v52 = v51;
    if (v51 && SBPresentationObservationTokenStatePresentedOrPresenting([v51 state]))
    {
      long long v53 = [v115 transientOverlayScenePresenter:self acquireBannerLongLookWindowLevelAssertionWithReason:@"TransientOverlayPresented" windowLevel:v43 + -0.8];
      if (v53)
      {
        [(_SBTransientOverlayPresentedEntity *)v35 setBannerLongLookPresentationObservationToken:v52];
        [(_SBTransientOverlayPresentedEntity *)v35 setBannerLongLookWindowLevelAssertion:v53];
        objc_initWeak(&location, self);
        objc_initWeak(&from, v35);
        v136[0] = MEMORY[0x1E4F143A8];
        v136[1] = 3221225472;
        v136[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_4;
        v136[3] = &unk_1E6B0D9F8;
        objc_copyWeak(&v137, &from);
        objc_copyWeak(&v138, &location);
        [v52 setDidDismissHandler:v136];
        objc_destroyWeak(&v138);
        objc_destroyWeak(&v137);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
    id v54 = [(SBTransientOverlayScenePresenter *)self _newKeyboardFocusAssertionForEntity:v35];
    [(_SBTransientOverlayPresentedEntity *)v35 setKeyFocusStealingAssertion:v54];
    long long v55 = [NSString stringWithFormat:@"<TransientOverlayEntity-%@>", v4];
    long long v56 = [v115 transientOverlayScenePresenter:self acquireDisableAutoUnlockAssertionWithReason:v55];
    [(_SBTransientOverlayPresentedEntity *)v35 setDisableAutoUnlockAssertion:v56];

    v57 = +[SBUIController sharedInstanceIfExists];
    uint64_t v58 = [v57 isConnectedToWindowedAccessory];

    uint64_t v59 = +[SBUIController sharedInstanceIfExists];
    [v59 visibleScreenCoordinatesForWindowedAccessory];
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;
    double v67 = v66;

    objc_msgSend(v4, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v58, v61, v63, v65, v67);
    _Block_object_dispose(buf, 8);

    v105 = 0;
    int v34 = 1;
    goto LABEL_79;
  }
  uint64_t v27 = *(void *)v149;
LABEL_45:
  uint64_t v28 = 0;
  while (1)
  {
    if (*(void *)v149 != v27) {
      objc_enumerationMutation(v25);
    }
    uint64_t v29 = *(void **)(*((void *)&v148 + 1) + 8 * v28);
    v30 = [v29 viewController];
    if (v30 == v4) {
      break;
    }

LABEL_51:
    if (v26 == ++v28)
    {
      uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v148 objects:v160 count:16];
      if (v26) {
        goto LABEL_45;
      }
      goto LABEL_53;
    }
  }
  char v31 = [v29 isDismissing];

  if ((v31 & 1) == 0) {
    goto LABEL_51;
  }
  id v32 = v29;

  v105 = (_SBTransientOverlayPresentedEntity *)v32;
  if (!v105) {
    goto LABEL_58;
  }
  v33 = SBLogTransientOverlay();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Using existing entity for presenting %{public}@", buf, 0x16u);
  }

  [(_SBTransientOverlayPresentedEntity *)v105 setDismissing:0];
  int v34 = 0;
  v35 = v105;
LABEL_79:
  self->_BOOL isInitiatingEntityPresentation = isInitiatingEntityPresentation;
  [(SBTransientOverlayScenePresenter *)self _updateBackgroundWindowForEntity:v35];
  [(SBTransientOverlayScenePresenter *)self _updateWindowHitTestingForEntity:v35];
  v68 = [(_SBTransientOverlayPresentedEntity *)v35 window];
  [(SBTransientOverlayScenePresenter *)self _windowLevelForEntity:v35];
  uint64_t v70 = v69;
  objc_msgSend(v68, "setLevel:");
  [v68 setAccessibilityIdentifier:@"SBTransientOverlayWindow"];
  if (v34)
  {
    v71 = SBLogTransientOverlay();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v159 = v70;
      _os_log_impl(&dword_1D85BA000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@: Created window for %{public}@ at level: %f", buf, 0x20u);
    }
  }
  [v4 setIdleTimerCoordinator:self];
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_73;
  v134[3] = &unk_1E6B01568;
  id v111 = v68;
  id v135 = v111;
  [v4 updateDisplayLayoutElementWithBuilder:v134];
  [(SBTransientOverlayScenePresenter *)self _applyProximityDetectionModeForEntity:v35];
  [(SBTransientOverlayScenePresenter *)self _applyWallpaperAnimationSuspensionAssertionForEntity:v35];
  [(SBTransientOverlayScenePresenter *)self _updateCurrentEntityHomeGrabberAnimated:v116];
  [(SBTransientOverlayScenePresenter *)self _updateZStackStateWithAnimationBehavior:v116 reason:@"perform presentation request"];
  [(SBTransientOverlayScenePresenter *)self _updateFeaturePolicies];
  [(SBTransientOverlayScenePresenter *)self _updateDeactivationAssertions];
  id v109 = objc_loadWeakRetained((id *)&self->_windowScene);
  v72 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  v107 = [v72 viewController];

  uint64_t v73 = [v107 sceneForClientSettings];
  if (v73) {
    goto LABEL_85;
  }
  v74 = [MEMORY[0x1E4F62490] sharedInstance];
  v75 = [v109 _FBSScene];
  v76 = [v75 identityToken];
  uint64_t v77 = [v74 sceneFromIdentityToken:v76];

  uint64_t v73 = v77;
  if (v77)
  {
LABEL_85:
    zStackPhysicalButtonPolicyAssistant = self->_zStackPhysicalButtonPolicyAssistant;
    v102 = (void *)v73;
    uint64_t v157 = v73;
    v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v157 count:1];
    [(SBZStackForegroundSceneOrderedPolicyAssistant *)zStackPhysicalButtonPolicyAssistant setForegroundScenes:v79];
  }
  else
  {
    v102 = 0;
  }
  id v80 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper proposeProvider:v4 byCoordinator:self reason:@"SBTransientOverlayScenePresenterRequestedIdleTimer"];
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleTransientOverlay") & 1) == 0)
  {
    [v111 _legacySetRotatableViewOrientation:v101 duration:0.0];
    v81 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
    v82 = [v81 window];
    int64_t v83 = [v82 _windowInterfaceOrientation];

    if (self->_topmostViewControllerInterfaceOrientation != v83)
    {
      [v115 transientOverlayScenePresenter:self willChangeTopmostViewControllerInterfaceOrientationToOrientation:v83];
      self->_topmostViewControllerInterfaceOrientation = v83;
    }
  }
  [v115 transientOverlayScenePresenter:self willPresentViewController:v4];
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  v84 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v85 = [v84 countByEnumeratingWithState:&v130 objects:v156 count:16];
  if (v85)
  {
    uint64_t v86 = *(void *)v131;
    do
    {
      for (uint64_t j = 0; j != v85; ++j)
      {
        if (*(void *)v131 != v86) {
          objc_enumerationMutation(v84);
        }
        v88 = *(void **)(*((void *)&v130 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          [v88 transientOverlayScenePresenter:self willPresentViewController:v4];
        }
      }
      uint64_t v85 = [v84 countByEnumeratingWithState:&v130 objects:v156 count:16];
    }
    while (v85);
  }

  v89 = [v109 screen];
  int v90 = [v89 _isCarScreen];

  if (v90) {
    [v111 setHidden:0];
  }
  else {
    [v111 makeKeyAndVisible];
  }
  [(_SBTransientOverlayPresentedEntity *)v35 setHasFinishedWindowInitialization:1];
  v91 = (void *)[v4 newTransientOverlayPresentationTransitionCoordinator];
  v92 = objc_alloc_init(SBTransientOverlayDefaultTransitionContextProvider);
  [(SBTransientOverlayDefaultTransitionContextProvider *)v92 setAnimated:v116];
  [v115 transientOverlayScenePresenterRequestsAppIconForceTouchDismissal:self animated:v116];
  if ([v114 shouldDismissSiri]) {
    [v115 transientOverlayScenePresenterRequestsSiriDismissal:self animated:v116];
  }
  v93 = [v114 completionHandler];
  objc_initWeak((id *)buf, v92);
  v127[0] = MEMORY[0x1E4F143A8];
  v127[1] = 3221225472;
  v127[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_2_86;
  v127[3] = &unk_1E6AF5770;
  v127[4] = self;
  id v94 = v103;
  id v128 = v94;
  char v129 = v116;
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_3_87;
  v117[3] = &unk_1E6B0DA20;
  v95 = v35;
  v118 = v95;
  v119 = self;
  id v96 = v4;
  id v120 = v96;
  id v97 = v91;
  id v121 = v97;
  objc_copyWeak(&v125, (id *)buf);
  id v98 = v115;
  id v122 = v98;
  id v99 = v113;
  id v123 = v99;
  char v126 = v116;
  id v100 = v93;
  id v124 = v100;
  [(SBTransientOverlayDefaultTransitionContextProvider *)v92 transitionAlongsideUsingBlock:v127 completion:v117];
  [v97 startTransitionWithContextProvider:v92];

  objc_destroyWeak(&v125);
  objc_destroyWeak((id *)buf);
}

uint64_t __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 baseWindowLevel];
  uint64_t result = BSFloatLessThanOrEqualToFloat();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3 + 1;
    *a4 = 1;
  }
  return result;
}

void __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v3 = [WeakRetained siriWindowLevelAssertion];
    [v3 invalidate];

    [v8 setSiriWindowLevelAssertion:0];
    id v4 = [v8 siriPresentationObservationToken];
    [v4 invalidate];

    [v8 setSiriPresentationObservationToken:0];
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 _topmostPresentedEntity];

      if (v7 == v8)
      {
        [v6 _updateCurrentEntityHomeGrabberAnimated:1];
        [v6 _updateZStackStateWithAnimationBehavior:1 reason:@"Siri presentation did dismiss"];
      }
    }

    id WeakRetained = v8;
  }
}

void __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v3 = [WeakRetained controlCenterWindowLevelAssertion];
    [v3 invalidate];

    [v8 setControlCenterWindowLevelAssertion:0];
    id v4 = [v8 controlCenterPresentationObservationToken];
    [v4 invalidate];

    [v8 setControlCenterPresentationObservationToken:0];
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 _topmostPresentedEntity];

      if (v7 == v8)
      {
        [v6 _updateCurrentEntityHomeGrabberAnimated:1];
        [v6 _updateZStackStateWithAnimationBehavior:1 reason:@"control center presentation did dismiss"];
      }
    }

    id WeakRetained = v8;
  }
}

void __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v3 = [WeakRetained bannerLongLookWindowLevelAssertion];
    [v3 invalidate];

    [v8 setBannerLongLookWindowLevelAssertion:0];
    id v4 = [v8 bannerLongLookPresentationObservationToken];
    [v4 invalidate];

    [v8 setBannerLongLookPresentationObservationToken:0];
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 _topmostPresentedEntity];

      if (v7 == v8)
      {
        [v6 _updateCurrentEntityHomeGrabberAnimated:1];
        [v6 _updateZStackStateWithAnimationBehavior:1 reason:@"banner long look presentation did dismiss"];
      }
    }

    id WeakRetained = v8;
  }
}

void __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_73(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 level];
  [v4 setLevel:(uint64_t)v3];
  [v4 setFillsDisplayBounds:1];
  [v4 setLayoutRole:3];
}

uint64_t __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_2_86(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateStatusBarWithCurrentExternalStatusBarSettings:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);
  return [v2 _updatePreferredWhitePointAdaptivityStyle];
}

uint64_t __63__SBTransientOverlayScenePresenter_performPresentationRequest___block_invoke_3_87(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (!*(void *)(a1 + 32) || (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "containsObject:") & 1) == 0)
  {
    id v2 = SBLogTransientOverlay();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v19 = 138543618;
    uint64_t v20 = v6;
    __int16 v21 = 2114;
    uint64_t v22 = v7;
    id v5 = "%{public}@: Ignoring presentation completion for %{public}@ since the entity is no longer valid";
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) isDismissing])
  {
    id v2 = SBLogTransientOverlay();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v19 = 138543618;
    uint64_t v20 = v3;
    __int16 v21 = 2114;
    uint64_t v22 = v4;
    id v5 = "%{public}@: Ignoring presentation completion for %{public}@ since it is now dismissing";
LABEL_8:
    id v8 = v2;
    uint32_t v9 = 22;
LABEL_9:
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v19, v9);
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 48), "bs_endAppearanceTransition");
  uint64_t v14 = *(void **)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  [v14 finalizeTransitionWithContextProvider:WeakRetained];

  if ([*(id *)(a1 + 48) isContentOpaque])
  {
    [*(id *)(a1 + 64) transientOverlayScenePresenterRequestsControlCenterDismissal:*(void *)(a1 + 40) animated:0];
    if ([*(id *)(a1 + 72) shouldDismissSiri]) {
      [*(id *)(a1 + 64) transientOverlayScenePresenterRequestsSiriDismissal:*(void *)(a1 + 40) animated:0];
    }
  }
  id v2 = SBLogTransientOverlay();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    int v18 = *(unsigned __int8 *)(a1 + 96);
    int v19 = 138543874;
    uint64_t v20 = v16;
    __int16 v21 = 2114;
    uint64_t v22 = v17;
    __int16 v23 = 1024;
    int v24 = v18;
    id v5 = "%{public}@: Finished performing presentation for %{public}@ animated: %{BOOL}u";
    id v8 = v2;
    uint32_t v9 = 28;
    goto LABEL_9;
  }
LABEL_10:

  uint64_t result = *(void *)(a1 + 80);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, v10, v11, v12);
  }
  return result;
}

- (void)setFluidDismissalState:(id)a3 forViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v55 = 0;
  long long v56 = &v55;
  uint64_t v57 = 0x3032000000;
  uint64_t v58 = __Block_byref_object_copy__122;
  uint64_t v59 = __Block_byref_object_dispose__122;
  id v60 = 0;
  entities = self->_entities;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __77__SBTransientOverlayScenePresenter_setFluidDismissalState_forViewController___block_invoke;
  v52[3] = &unk_1E6B0DA48;
  id v10 = v8;
  id v53 = v10;
  id v54 = &v55;
  [(NSMutableArray *)entities enumerateObjectsWithOptions:2 usingBlock:v52];
  uint64_t v11 = (void *)v56[5];
  if (!v11) {
    goto LABEL_20;
  }
  uint64_t v12 = [v11 fluidDismissalState];
  [(id)v56[5] setFluidDismissalState:v7];
  uint64_t v13 = [v10 view];
  [v13 bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  uint64_t v22 = [v7 dismissalType];
  double v43 = 0.0;
  if ((unint64_t)(v22 - 5) < 2)
  {
    [v7 contentRect];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    v61.origin.x = v15;
    v61.origin.y = v17;
    v61.size.width = v19;
    v61.size.height = v21;
    double MaxY = CGRectGetMaxY(v61);
    v62.origin.x = v24;
    v62.origin.y = v26;
    v62.size.width = v28;
    v62.size.height = v30;
    double v32 = CGRectGetMaxY(v62);
    [v7 contentWeighting];
    double v34 = v33;
    uint64_t v35 = 0;
    double v36 = MaxY - v32;
LABEL_9:
    uint64_t v39 = 1;
    goto LABEL_10;
  }
  if (v22 != 3 && v22 != 4)
  {
    double v34 = 1.0;
    uint64_t v35 = 1;
    double v36 = 0.0;
    goto LABEL_9;
  }
  [v7 contentWeighting];
  double v34 = v37;
  [v7 backgroundWeighting];
  double v43 = v38;
  uint64_t v39 = 0;
  uint64_t v35 = 1;
  double v36 = 0.0;
LABEL_10:
  CGFloat v50 = 1.0;
  CGFloat sx = 1.0;
  long long v48 = *MEMORY[0x1E4F1DAD8];
  long long v49 = v48;
  [v7 contentRect];
  -[SBTransientOverlayScenePresenter _getContentScale:translation:fromRect:entity:](self, "_getContentScale:translation:fromRect:entity:", &sx, &v49, v56[5]);
  [v7 homeGrabberContentRect];
  -[SBTransientOverlayScenePresenter _getContentScale:translation:fromRect:entity:](self, "_getContentScale:translation:fromRect:entity:", &v50, &v48, v56[5]);
  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeScale(&v47, sx, sx);
  CGAffineTransform v45 = v47;
  CGAffineTransformTranslate(&v46, &v45, *(CGFloat *)&v49, *((CGFloat *)&v49 + 1));
  CGAffineTransform v47 = v46;
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeScale(&v46, v50, v50);
  CGAffineTransform v44 = v46;
  CGAffineTransformTranslate(&v45, &v44, *(CGFloat *)&v48, *((CGFloat *)&v48 + 1));
  CGAffineTransform v46 = v45;
  [v10 setPresentationDimmingViewHidden:v39];
  [v10 setPresentationDimmingAlpha:v43];
  CGAffineTransform v45 = v47;
  [v10 setPresentationContentTransform:&v45];
  CGAffineTransform v45 = v46;
  [v10 setPresentationHomeGrabberTransform:&v45];
  v40 = (void *)[v12 transitionPhase];
  if (v40 == (void *)[v7 transitionPhase])
  {
    uint64_t v4 = [(SBTransientOverlayScenePresenter *)self _preferredStatusBarVisibilityForEntity:v56[5]];
    v40 = [(SBTransientOverlayScenePresenter *)self _currentExternalStatusBarSettings];
    objc_msgSend(v10, "setPresentationPrefersStatusBarHidden:initialStatusBarSettings:", -[SBTransientOverlayScenePresenter _isPresentationStatusBarHiddenForVisibility:currentExternalStatusBarSettings:](self, "_isPresentationStatusBarHiddenForVisibility:currentExternalStatusBarSettings:", v4, v40), 0);
  }
  else
  {
    [(SBTransientOverlayScenePresenter *)self _updateStatusBarWithCurrentExternalStatusBarSettings:0 animated:1];
  }
  [v10 setPresentationHomeGrabberAlpha:v34];
  [v10 setPresentationHomeGrabberAdditionalEdgeSpacing:v36];
  if (v35 && (long long v41 = (void *)v56[5]) != 0)
  {
    objc_msgSend(v41, "window", 0.0);
    self = (SBTransientOverlayScenePresenter *)objc_claimAutoreleasedReturnValue();
    v40 = [(SBTransientOverlayScenePresenter *)self windowScene];
    uint64_t v4 = [v40 screen];
    uint64_t v35 = [(id)v4 traitCollection];
    [(id)v35 displayCornerRadius];
    int v42 = 1;
  }
  else
  {
    int v42 = 0;
  }
  objc_msgSend(v10, "setPresentationContentCornerRadius:");
  if (v42)
  {
  }
LABEL_20:

  _Block_object_dispose(&v55, 8);
}

void __77__SBTransientOverlayScenePresenter_setFluidDismissalState_forViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 viewController];
  id v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SBTransientOverlayScenePresenter *)self _buttonEventHandlingViewController];
  if (v4)
  {
    id v5 = SBLogTransientOverlay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Transient overlay handled headset button press: %@", (uint8_t *)&v8, 0xCu);
    }

    char v6 = [v4 handleHeadsetButtonPress:v3];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)handleHomeButtonPress
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [(SBTransientOverlayScenePresenter *)self _buttonEventHandlingViewController];
  if (v2)
  {
    BOOL v3 = SBLogTransientOverlay();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v2;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled home button press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    char v4 = [v2 handleHomeButtonPress];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)handleHomeButtonDoublePress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBTransientOverlayScenePresenter *)self _buttonEventHandlingViewController];
  if (v3)
  {
    char v4 = SBLogTransientOverlay();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Transient overlay handled home button double press: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    if ([v3 handleHomeButtonDoublePress])
    {
      BOOL v5 = 1;
    }
    else
    {
      if ([(SBLockStateAggregator *)self->_lockStateAggregator hasAnyLockState]) {
        uint64_t v6 = [v3 preferredLockedGestureDismissalStyle];
      }
      else {
        uint64_t v6 = [v3 preferredUnlockedGestureDismissalStyle];
      }
      BOOL v5 = v6 != 3;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)handleHomeButtonLongPress
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [(SBTransientOverlayScenePresenter *)self _buttonEventHandlingViewController];
  if (v2)
  {
    BOOL v3 = SBLogTransientOverlay();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v2;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled home button long press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    char v4 = [v2 handleHomeButtonLongPress];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)handleLockButtonPress
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [(SBTransientOverlayScenePresenter *)self _buttonEventHandlingViewController];
  if (v2)
  {
    BOOL v3 = SBLogTransientOverlay();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v2;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled lock button press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    char v4 = [v2 handleLockButtonPress];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)handleVoiceCommandButtonPress
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [(SBTransientOverlayScenePresenter *)self _buttonEventHandlingViewController];
  if (v2)
  {
    BOOL v3 = SBLogTransientOverlay();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v2;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled voice command button press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    char v4 = [v2 handleVoiceCommandButtonPress];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)handleVolumeUpButtonPress
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [(SBTransientOverlayScenePresenter *)self _buttonEventHandlingViewController];
  if (v2)
  {
    BOOL v3 = SBLogTransientOverlay();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v2;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled volume up button press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    char v4 = [v2 handleVolumeUpButtonPress];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)handleVolumeDownButtonPress
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [(SBTransientOverlayScenePresenter *)self _buttonEventHandlingViewController];
  if (v2)
  {
    BOOL v3 = SBLogTransientOverlay();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v2;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Transient overlay handled volume down button press: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    char v4 = [v2 handleVolumeDownButtonPress];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v31 = a4;
  BOOL v5 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  int v6 = [v5 viewController];
  if ([(SBLockStateAggregator *)self->_lockStateAggregator hasAnyLockState]) {
    uint64_t v7 = [v6 preferredLockedGestureDismissalStyle];
  }
  else {
    uint64_t v7 = [v6 preferredUnlockedGestureDismissalStyle];
  }
  if (v5) {
    BOOL v8 = v7 == 3;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = !v8;
  uint64_t v10 = v9;
  if ([v6 preventsSystemApertureSuppressionFromBelow])
  {
    if (SBUIIsSystemApertureEnabled()) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9;
    }
  }
  [v31 setActivationPolicyForParticipantsBelow:v10];
  if (v9)
  {
    objc_msgSend(v31, "setHomeAffordanceDrawingSuppression:", objc_msgSend(v6, "homeAffordanceSuppression"));
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v12 = [v5 bannerLongLookWindowLevelAssertion];

    if (v12) {
      [v11 addIndex:22];
    }
    uint64_t v13 = [v5 controlCenterWindowLevelAssertion];

    if (v13) {
      [v11 addIndex:19];
    }
    double v14 = [v5 siriWindowLevelAssertion];

    if (v14) {
      [v11 addIndex:17];
    }
    [v31 setAssertIsAboveParticipantIdentifiers:v11];
  }
  CGFloat v15 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  double v16 = [v15 viewController];

  CGFloat v17 = [v16 grabberView];
  double v18 = v17;
  if (v9) {
    [v17 addObserver:self];
  }
  else {
    [v17 removeObserver:self];
  }

  if (v10)
  {
    if ([(SBTransientOverlayScenePresenter *)self hasVisibleStatusBar])
    {
      BOOL v19 = 0;
    }
    else
    {
      double v20 = [(SBTransientOverlayScenePresenter *)self topmostPresentedViewController];
      if ([v20 presentationPrefersStatusBarHidden])
      {
        CGFloat v21 = [(SBTransientOverlayScenePresenter *)self _statusBarEntity];
        uint64_t v22 = [v21 fluidDismissalState];
        BOOL v19 = v22 == 0;
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    uint64_t v10 = ![(SBTransientOverlayScenePresenter *)self preferredGestureDismissalStyle]
       || (unint64_t)v19;
    if (v9)
    {
      double v23 = [v16 grabberView];
      int v24 = [v23 isHidden];

      uint64_t v10 = v24 | v10;
    }
  }
  [v31 setSuppressSystemApertureForSystemChromeSuppression:v10];
  double v25 = [v16 associatedBundleIdentifiersToSuppressInSystemAperture];
  [v31 setAssociatedBundleIdentifiersToSuppressInSystemAperture:v25];

  CGFloat v26 = [v16 associatedSceneIdentifiersToSuppressInSystemAperture];
  [v31 setAssociatedSceneIdentifiersToSuppressInSystemAperture:v26];

  double v27 = [v16 audioCategoriesDisablingVolumeHUD];
  [v31 setAudioCategoriesDisablingVolumeHUD:v27];

  CGFloat v28 = -[SBPhysicalButtonZStackPolicyAssistant physicalButtonSceneTargets]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant);
  [v31 setPhysicalButtonSceneTargets:v28];

  double v29 = -[SBPhysicalButtonZStackPolicyAssistant captureButtonFullFidelityEventRequestingScenes]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant);
  [v31 setCaptureButtonFullFidelityEventRequestingScenes:v29];

  CGFloat v30 = -[SBPhysicalButtonZStackPolicyAssistant foregroundCaptureSceneTargets]((uint64_t)self->_zStackPhysicalButtonPolicyAssistant);
  [v31 setForegroundCaptureSceneTargets:v30];
}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  if ([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture])
  {
    [(SBTransientOverlayScenePresenter *)self handleHomeButtonPress];
  }
}

- (void)homeGrabberViewDidUpdateHidden:(id)a3
{
  id v7 = a3;
  char v4 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  BOOL v5 = [v4 viewController];
  id v6 = [v5 grabberView];

  if (v6 == v7) {
    [(SBTransientOverlayScenePresenter *)self _updateZStackStateWithAnimationBehavior:2 reason:@"homeGrabberViewDidUpdateHidden"];
  }
  else {
    [v7 removeObserver:self];
  }
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  uint64_t v12 = v11;
  if (v11
    && ([v11 viewController], id v13 = (id)objc_claimAutoreleasedReturnValue(), v13, v13 == v8))
  {
    uint64_t v14 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper proposeIdleTimerBehavior:v9 fromProvider:v8 reason:v10];
  }
  else
  {
    uint64_t v14 = [(SBIdleTimerCoordinatorHelper *)self->_idleTimerCoordinatorHelper updateProvider:v8 behavior:v9 reason:v10];
  }
  CGFloat v15 = (void *)v14;

  return v15;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  char v4 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 viewController];
    id v7 = [v6 coordinatorRequestedIdleTimerBehavior:self];
  }
  else
  {
    id v7 = +[SBIdleTimerBehavior defaultBehavior];
  }

  return v7;
}

- (int64_t)defaultPreferredInterfaceOrientationForPresentationForTransientOverlayViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v5 = [WeakRetained defaultPreferredInterfaceOrientationForPresentationForTransientOverlayScenePresenter:self];

  return v5;
}

- (unint64_t)defaultSupportedInterfaceOrientationsForTransientOverlayViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t v5 = [WeakRetained defaultSupportedInterfaceOrientationsForTransientOverlayScenePresenter:self];

  return v5;
}

- (BOOL)defaultShouldAutorotateForTransientOverlayViewController:(id)a3
{
  BOOL v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained defaultShouldAutorotateForTransientOverlayScenePresenter:v3];

  return (char)v3;
}

- (BOOL)isKeyboardVisibleForSpringBoardForTransientOverlayViewController:(id)a3
{
  BOOL v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained isKeyboardVisibleForSpringBoardForTransientOverlayScenePresenter:v3];

  return (char)v3;
}

- (void)transientOverlayViewControllerNeedsContentOpaqueUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = self->_entities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "viewController", (void)v13);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v12 = v10;

    if (!v12) {
      goto LABEL_13;
    }
    [(SBTransientOverlayScenePresenter *)self _applyWallpaperAnimationSuspensionAssertionForEntity:v12];
    [(SBTransientOverlayScenePresenter *)self _updateBackgroundWindowForEntity:v12];
    unint64_t v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)transientOverlayViewControllerNeedsGestureDismissalStyleUpdate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    unint64_t v5 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
    id v6 = [v5 viewController];

    id v4 = v7;
    if (v6 == v7)
    {
      [(SBTransientOverlayScenePresenter *)self _updateCurrentEntityHomeGrabberAnimated:1];
      [(SBTransientOverlayScenePresenter *)self _updateZStackStateWithAnimationBehavior:1 reason:@"transient overlay dismiss style updated"];
      id v4 = v7;
    }
  }
}

- (void)transientOverlayViewControllerNeedsProximityDetectionUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = self->_entities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "viewController", (void)v13);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v12 = v10;

    if (!v12) {
      goto LABEL_13;
    }
    [(SBTransientOverlayScenePresenter *)self _applyProximityDetectionModeForEntity:v12];
    unint64_t v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)transientOverlayViewControllerNeedsStatusBarAppearanceUpdate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBTransientOverlayScenePresenter *)self _statusBarEntity];
  id v6 = [v5 viewController];

  if (v6 == v4)
  {
    id v7 = [(SBTransientOverlayScenePresenter *)self _currentExternalStatusBarSettings];
    -[SBTransientOverlayScenePresenter _updateStatusBarWithCurrentExternalStatusBarSettings:animated:](self, "_updateStatusBarWithCurrentExternalStatusBarSettings:animated:", v7, [MEMORY[0x1E4F42FF0] _isInAnimationBlockWithAnimationsEnabled]);
  }
}

- (void)transientOverlayViewControllerNeedsWhitePointAdaptivityStyleUpdate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  id v6 = [v5 viewController];

  if (v6 == v4)
  {
    [(SBTransientOverlayScenePresenter *)self _updatePreferredWhitePointAdaptivityStyle];
  }
}

- (void)transientOverlayViewControllerWillBeginRotation:(id)a3 toInterfaceOrientation:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 setContainerOrientation:a4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = self->_entities;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "viewController", (void)v18);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v6)
        {
          id v14 = v12;

          if (v14)
          {
            [v14 setRotating:1];
            [(SBTransientOverlayScenePresenter *)self _updateBackgroundWindowForEntity:v14];
            if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleTransientOverlay") & 1) == 0)
            {
              id v15 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];

              if (v15 == v14)
              {
                id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                [WeakRetained transientOverlayScenePresenter:self willChangeTopmostViewControllerInterfaceOrientationToOrientation:a4];

                self->_topmostViewControllerInterfaceOrientation = a4;
              }
            }
          }
          goto LABEL_14;
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = 0;
LABEL_14:
  CGFloat v17 = [(SBTransientOverlayScenePresenter *)self _currentExternalStatusBarSettings];
  [(SBTransientOverlayScenePresenter *)self _updateStatusBarWithCurrentExternalStatusBarSettings:v17 animated:0];
}

- (void)transientOverlayViewControllerDidEndRotation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = self->_entities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "viewController", (void)v13);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v12 = v10;

    if (!v12) {
      goto LABEL_13;
    }
    [(NSMutableArray *)v12 setRotating:0];
    [(SBTransientOverlayScenePresenter *)self _updateBackgroundWindowForEntity:v12];
    unint64_t v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)transientOverlayViewControllerNeedsWindowHitTestingUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = self->_entities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "viewController", (void)v13);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    uint64_t v12 = v10;

    if (!v12) {
      goto LABEL_13;
    }
    [(SBTransientOverlayScenePresenter *)self _updateWindowHitTestingForEntity:v12];
    unint64_t v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)transientOverlayViewControllerDidUpdatePresentationPrefersStatusBarHidden:(id)a3
{
  id v4 = a3;
  id v5 = [(SBTransientOverlayScenePresenter *)self topmostPresentedViewController];

  if (v5 == v4)
  {
    [(SBTransientOverlayScenePresenter *)self _updateZStackStateWithAnimationBehavior:2 reason:@"presentationPrefersStatusBarHiddenDidChange"];
  }
}

- (BOOL)transientOverlayViewControllerIsForegroundActive:(id)a3
{
  id v4 = a3;
  if ([(SBFZStackParticipant *)self->_zStackParticipant activationState])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [(SBTransientOverlayScenePresenter *)self topmostPresentedViewController];
    BOOL v5 = v6 == v4;
  }
  return v5;
}

- (void)transientOverlayViewController:(id)a3 requestZStackParticipantPreferencesUpdateWithReason:(id)a4
{
}

- (void)transientOverlayViewControllerDidUpdateHIDEventDeferringDisabled:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v5 = self->_entities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
      objc_msgSend(v10, "viewController", (void)v24);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v12 = v10;

    if (!v12) {
      goto LABEL_15;
    }
    if ([v4 hidEventDeferringDisabled])
    {
      long long v13 = [v12 keyFocusStealingAssertion];
      [v13 invalidate];

      [v12 setKeyFocusStealingAssertion:0];
      long long v14 = [v12 keyFocusPreventionAssertion];

      if (v14)
      {
        long long v15 = SBLogTransientOverlay();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          double v29 = self;
          __int16 v30 = 2114;
          id v31 = v4;
          long long v16 = "%{public}@: Not taking key focus prevention assertion for %{public}@ because it already has one.";
LABEL_20:
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
          goto LABEL_21;
        }
        goto LABEL_21;
      }
      id v19 = [v4 hostedSceneIdentityTokens];
      if ([v19 count] == 1)
      {
        long long v20 = +[SBWorkspace mainWorkspace];
        long long v21 = [v20 keyboardFocusController];
        uint64_t v22 = [v19 firstObject];
        uint64_t v23 = [v21 preventFocusForSceneWithIdentityToken:v22 reason:@"scene-backed remote transient overlay preventing focus"];

        [v12 setKeyFocusPreventionAssertion:v23];
      }
    }
    else
    {
      CGFloat v17 = [v12 keyFocusPreventionAssertion];
      [v17 invalidate];

      [v12 setKeyFocusPreventionAssertion:0];
      uint64_t v18 = [v12 keyFocusStealingAssertion];

      if (v18)
      {
        long long v15 = SBLogTransientOverlay();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          double v29 = self;
          __int16 v30 = 2114;
          id v31 = v4;
          long long v16 = "%{public}@: Not taking new keyboard focus lock assertion in response to hidEventDeferringDisabled update"
                " for %{public}@ because it already has one.";
          goto LABEL_20;
        }
LABEL_21:

        goto LABEL_26;
      }
      id v19 = [(SBTransientOverlayScenePresenter *)self _newKeyboardFocusAssertionForEntity:v12];
      [v12 setKeyFocusStealingAssertion:v19];
    }
  }
  else
  {
LABEL_9:

LABEL_15:
    uint64_t v12 = SBLogTransientOverlay();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      double v29 = self;
      __int16 v30 = 2114;
      id v31 = v4;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring hidEventDeferringDisabled update for %{public}@ because the entity is no longer valid.", buf, 0x16u);
    }
  }
LABEL_26:
}

- (void)_handleCoverSheetWillPresent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[(NSMutableArray *)self->_entities copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isDismissing", (void)v13) & 1) == 0)
        {
          id v11 = [v10 viewController];
          int v12 = [v11 dismissesForCoverSheetPresentation];

          if (v12) {
            [(SBTransientOverlayScenePresenter *)self _dismissEntity:v10 animated:1 completion:0];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_applyProximityDetectionModeForEntity:(id)a3
{
  id v10 = a3;
  if (([v10 isDismissing] & 1) != 0
    || ([v10 viewController],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 prefersProximityDetectionEnabled],
        v4,
        !v5))
  {
    [v10 setProximityEnabledAssertion:0];
  }
  else
  {
    uint64_t v6 = [v10 proximityEnabledAssertion];

    if (!v6)
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"<TransientOverlayEntity-%p>", v10);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v9 = [WeakRetained transientOverlayScenePresenter:self acquireProximitySensorEnabledAssertionWithReason:v7];
      [v10 setProximityEnabledAssertion:v9];
    }
  }
}

- (void)_applyWallpaperAnimationSuspensionAssertionForEntity:(id)a3
{
  id v13 = a3;
  id v4 = [v13 viewController];
  int v5 = [v4 isContentOpaque];

  uint64_t v6 = [v13 wallpaperAnimationSuspensionAssertion];
  uint64_t v7 = v6;
  if (v5)
  {

    if (!v7)
    {
      uint64_t v8 = NSString;
      uint64_t v9 = [v13 viewController];
      id v10 = [v8 stringWithFormat:@"<TransientOverlayEntity-%@>", v9];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v12 = [WeakRetained transientOverlayScenePresenter:self acquireWallpaperAnimationSuspensionAssertionWithReason:v10];
      [v13 setWallpaperAnimationSuspensionAssertion:v12];
    }
  }
  else
  {
    [v6 invalidate];

    [v13 setWallpaperAnimationSuspensionAssertion:0];
  }
}

- (id)_buttonEventHandlingViewController
{
  id v2 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  BOOL v3 = [v2 viewController];

  return v3;
}

- (void)_dismissEntity:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    CGFloat v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SBTransientOverlayScenePresenter.m", 1346, @"Invalid parameter not satisfying: %@", @"entity != nil" object file lineNumber description];
  }
  id v11 = [v9 viewController];
  int v12 = SBLogTransientOverlay();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    int v42 = self;
    __int16 v43 = 2114;
    CGAffineTransform v44 = v11;
    __int16 v45 = 1024;
    BOOL v46 = v6;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing dismissal for %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
  }

  BOOL v13 = [(SBTransientOverlayScenePresenter *)self isTopmostPresentedViewController:v11];
  [v9 setDismissing:1];
  if (![(SBFZStackParticipant *)self->_zStackParticipant activationState])
  {
    long long v14 = [v9 window];
    long long v15 = [v14 traitsParticipant];
    [v15 invalidate];

    long long v16 = [v9 window];
    [v16 _setTraitsParticipant:0];
  }
  [(SBZStackForegroundSceneOrderedPolicyAssistant *)self->_zStackPhysicalButtonPolicyAssistant setForegroundScenes:MEMORY[0x1E4F1CBF0]];
  objc_msgSend(v11, "bs_beginAppearanceTransition:animated:", 0, v6);
  [(SBTransientOverlayScenePresenter *)self _updateCurrentEntityHomeGrabberAnimated:v6];
  [(SBTransientOverlayScenePresenter *)self _updateZStackStateWithAnimationBehavior:v6 reason:@"dismissing"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v18 = (void *)[v11 newTransientOverlayDismissalTransitionCoordinator];
  id v19 = objc_alloc_init(SBTransientOverlayDefaultTransitionContextProvider);
  [(SBTransientOverlayDefaultTransitionContextProvider *)v19 setAnimated:v6];
  [(SBTransientOverlayScenePresenter *)self _applyProximityDetectionModeForEntity:v9];
  long long v20 = [v9 keyFocusStealingAssertion];
  [v20 invalidate];

  [v9 setKeyFocusStealingAssertion:0];
  long long v21 = [v9 keyFocusPreventionAssertion];
  [v21 invalidate];

  [v9 setKeyFocusPreventionAssertion:0];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __71__SBTransientOverlayScenePresenter__dismissEntity_animated_completion___block_invoke;
  v39[3] = &unk_1E6AF5D38;
  v39[4] = self;
  BOOL v40 = v6;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71__SBTransientOverlayScenePresenter__dismissEntity_animated_completion___block_invoke_2;
  v29[3] = &unk_1E6B0DA70;
  id v30 = v9;
  id v31 = self;
  id v32 = v11;
  id v33 = v18;
  double v34 = v19;
  id v35 = WeakRetained;
  BOOL v37 = v6;
  BOOL v38 = v13;
  id v36 = v10;
  id v22 = v10;
  id v23 = WeakRetained;
  long long v24 = v19;
  id v25 = v18;
  id v26 = v11;
  id v27 = v9;
  [(SBTransientOverlayDefaultTransitionContextProvider *)v24 transitionAlongsideUsingBlock:v39 completion:v29];
  [v25 startTransitionWithContextProvider:v24];
}

uint64_t __71__SBTransientOverlayScenePresenter__dismissEntity_animated_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 _currentExternalStatusBarSettings];
  [v2 _updateStatusBarWithCurrentExternalStatusBarSettings:v3 animated:*(unsigned __int8 *)(a1 + 40)];

  id v4 = *(void **)(a1 + 32);
  return [v4 _updatePreferredWhitePointAdaptivityStyle];
}

uint64_t __71__SBTransientOverlayScenePresenter__dismissEntity_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32) || (objc_msgSend(*(id *)(*(void *)(a1 + 40) + 72), "containsObject:") & 1) == 0)
  {
    id v2 = SBLogTransientOverlay();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v18;
    id v19 = "%{public}@: Ignoring dismissal completion for %{public}@ since the entity is no longer valid";
    goto LABEL_14;
  }
  if (([*(id *)(a1 + 32) isDismissing] & 1) == 0)
  {
    id v2 = SBLogTransientOverlay();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v21;
    id v19 = "%{public}@: Ignoring dismissal completion for %{public}@ since it is now re-presenting";
LABEL_14:
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
    goto LABEL_37;
  }
  id v2 = [*(id *)(a1 + 32) window];
  [v2 resignAsKeyWindow];
  BOOL v46 = [*(id *)(a1 + 40) _topmostPresentedEntity];
  objc_msgSend(*(id *)(a1 + 40), "_restoreInputViewsForEntityIfNeeded:");
  [v2 setHidden:1];
  [v2 setRootViewController:0];
  if ([*(id *)(a1 + 48) isViewLoaded])
  {
    BOOL v3 = [*(id *)(a1 + 48) view];
    [v3 removeFromSuperview];
  }
  id v4 = [*(id *)(a1 + 32) backgroundWindow];
  [v4 setHidden:1];
  __int16 v45 = v4;
  [v4 setRootViewController:0];
  [*(id *)(a1 + 40) _invalidateAssertionsForEntity:*(void *)(a1 + 32)];
  [*(id *)(a1 + 56) finalizeTransitionWithContextProvider:*(void *)(a1 + 64)];
  int v5 = [*(id *)(a1 + 48) transientOverlayDelegate];
  BOOL v6 = *(void **)(a1 + 40);

  if (v5 == v6) {
    [*(id *)(a1 + 48) setTransientOverlayDelegate:0];
  }
  uint64_t v7 = [*(id *)(a1 + 48) idleTimerCoordinator];
  uint64_t v8 = *(void **)(a1 + 40);

  if (v7 == v8) {
    [*(id *)(a1 + 48) setIdleTimerCoordinator:0];
  }
  [*(id *)(a1 + 48) setPresentationPrefersStatusBarHidden:0 initialStatusBarSettings:0];
  [*(id *)(a1 + 48) setPresentationPrefersHomeGrabberHidden:0 animated:0];
  [*(id *)(a1 + 48) setPresentationHomeGrabberAlpha:1.0];
  [*(id *)(a1 + 48) setPresentationHomeGrabberAdditionalEdgeSpacing:0.0];
  id v9 = *(void **)(a1 + 48);
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)buf = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&buf[16] = v10;
  long long v53 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v9 setPresentationHomeGrabberTransform:buf];
  [*(id *)(a1 + 48) setPresentationContentCornerRadius:0.0];
  [*(id *)(*(void *)(a1 + 40) + 104) removeProvider:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 40) + 72) removeObject:*(void *)(a1 + 32)];
  uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 72) count];
  uint64_t v12 = *(void *)(a1 + 40);
  if (v11)
  {
    BOOL v13 = *(void **)(v12 + 104);
    long long v14 = [(id)v12 _topmostPresentedEntity];
    long long v15 = [v14 viewController];
    id v16 = (id)[v13 proposeProvider:v15 byCoordinator:*(void *)(a1 + 40) reason:@"SBTransientOverlayPresentationManagerRequestedIdleTimer"];
  }
  else
  {
    if (!*(unsigned char *)(v12 + 128))
    {
      id v22 = [*(id *)(v12 + 104) targetCoordinator];
      uint64_t v23 = *(void *)(a1 + 40);
      long long v24 = +[SBIdleTimerBehavior disabledBehavior];
      id v25 = (id)[v22 idleTimerProvider:v23 didProposeBehavior:v24 forReason:@"SBTransientOverlayPresentationManagerNoneActive"];

      uint64_t v26 = *(void *)(a1 + 40);
      if (*(void *)(v26 + 112))
      {
        int v27 = objc_msgSend(*(id *)(a1 + 72), "transientOverlayScenePresenter:shouldRestoreFirstResponderForKeyWindow:");
        uint64_t v26 = *(void *)(a1 + 40);
        if (v27)
        {
          [*(id *)(v26 + 112) becomeFirstResponder];
          uint64_t v26 = *(void *)(a1 + 40);
        }
      }
      CGFloat v28 = *(void **)(v26 + 112);
      *(void *)(v26 + 112) = 0;

      uint64_t v12 = *(void *)(a1 + 40);
    }
    long long v14 = *(void **)(v12 + 72);
    *(void *)(v12 + 72) = 0;
  }

  [*(id *)(a1 + 40) _updateFeaturePolicies];
  [*(id *)(a1 + 40) _updateDeactivationAssertions];
  double v29 = *(void **)(a1 + 40);
  id v30 = [v29 _currentExternalStatusBarSettings];
  [v29 _updateStatusBarWithCurrentExternalStatusBarSettings:v30 animated:*(unsigned __int8 *)(a1 + 88)];

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleTransientOverlay") & 1) == 0)
  {
    id v31 = [*(id *)(a1 + 40) _topmostPresentedEntity];
    id v32 = [v31 window];
    uint64_t v33 = [v32 _windowInterfaceOrientation];

    [*(id *)(a1 + 72) transientOverlayScenePresenter:*(void *)(a1 + 40) willChangeTopmostViewControllerInterfaceOrientationToOrientation:v33];
    *(void *)(*(void *)(a1 + 40) + 192) = v33;
  }
  objc_msgSend(*(id *)(a1 + 48), "bs_endAppearanceTransition");
  [*(id *)(a1 + 72) transientOverlayScenePresenter:*(void *)(a1 + 40) didDismissViewController:*(void *)(a1 + 48) wasTopmostPresentation:*(unsigned __int8 *)(a1 + 89)];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  double v34 = (void *)[*(id *)(*(void *)(a1 + 40) + 168) copy];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v48 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v39 transientOverlayScenePresenter:*(void *)(a1 + 40) didDismissViewController:*(void *)(a1 + 48) wasTopmostPresentation:*(unsigned __int8 *)(a1 + 89)];
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v36);
  }

  BOOL v40 = SBLogTransientOverlay();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v41 = *(void *)(a1 + 40);
    uint64_t v42 = *(void *)(a1 + 48);
    int v43 = *(unsigned __int8 *)(a1 + 88);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v41;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v42;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v43;
    _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished performing dismissal for %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
  }

LABEL_37:
  uint64_t result = *(void *)(a1 + 80);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (double)_backgroundWindowLevelForEntity:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v5 = self->_entities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "baseWindowLevel", (void)v15);
        [v4 baseWindowLevel];
        v8 += SBFloatEqualsFloat();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
    double v11 = (double)v8;
  }
  else
  {
    double v11 = 0.0;
  }

  [v4 baseWindowLevel];
  double v13 = v12;

  return v13 + v11 * 2.1;
}

- (id)_currentExternalStatusBarSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained currentStatusBarSettingsForTransientOverlayScenePresenter:self];

  return v4;
}

- (void)_getContentScale:(double *)a3 translation:(CGPoint *)a4 fromRect:(CGRect)a5 entity:(id)a6
{
  CGFloat width = a5.size.width;
  id v9 = a6;
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v34 = v9;
  double v12 = [v9 fluidDismissalState];
  uint64_t v13 = [v12 dismissalType];
  double v14 = 1.0;
  if (v12 && (unint64_t)(v13 - 3) <= 1)
  {
    long long v15 = objc_msgSend(v34, "viewController", 1.0);
    long long v16 = [v15 view];
    [v16 bounds];
    CGFloat v18 = v17;
    double v19 = width;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    UIRectGetCenter();
    double v33 = v26;
    double v28 = v27;
    UIRectGetCenter();
    double v30 = v29;
    double v32 = v31;
    v36.origin.x = v18;
    v36.origin.y = v21;
    v36.size.CGFloat width = v23;
    v36.size.height = v25;
    double v11 = v33 - v30;
    double v10 = v28 - v32;
    double v14 = v19 / CGRectGetWidth(v36);
  }
  if (a3) {
    *a3 = v14;
  }
  if (a4)
  {
    a4->x = v11;
    a4->y = v10;
  }
}

- (void)_invalidateAssertionsForEntity:(id)a3
{
  id v11 = a3;
  BOOL v3 = [v11 bannerLongLookWindowLevelAssertion];
  [v3 invalidate];

  [v11 setBannerLongLookWindowLevelAssertion:0];
  id v4 = [v11 bannerLongLookPresentationObservationToken];
  [v4 invalidate];

  [v11 setBannerLongLookPresentationObservationToken:0];
  int v5 = [v11 controlCenterWindowLevelAssertion];
  [v5 invalidate];

  [v11 setControlCenterWindowLevelAssertion:0];
  uint64_t v6 = [v11 controlCenterPresentationObservationToken];
  [v6 invalidate];

  [v11 setControlCenterPresentationObservationToken:0];
  uint64_t v7 = [v11 siriWindowLevelAssertion];
  [v7 invalidate];

  [v11 setSiriWindowLevelAssertion:0];
  uint64_t v8 = [v11 siriPresentationObservationToken];
  [v8 invalidate];

  [v11 setSiriPresentationObservationToken:0];
  id v9 = [v11 disableAutoUnlockAssertion];
  [v9 invalidate];

  [v11 setDisableAutoUnlockAssertion:0];
  double v10 = [v11 wallpaperAnimationSuspensionAssertion];
  [v10 invalidate];

  [v11 setWallpaperAnimationSuspensionAssertion:0];
}

- (BOOL)_isPresentationStatusBarHiddenForVisibility:(int)a3 currentExternalStatusBarSettings:(id)a4
{
  int v4 = a3;
  if (!a3)
  {
    int v5 = [a4 alpha];
    [v5 doubleValue];
    if (BSFloatGreaterThanFloat()) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }
  return v4 == 1;
}

- (id)_newSceneDeactivationAssertionWithReason:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = [WeakRetained transientOverlayScenePresenter:self newSceneDeactivationAssertionWithReason:a3];

  return v6;
}

- (int)_preferredStatusBarVisibilityForEntity:(id)a3
{
  id v4 = a3;
  int v5 = [v4 viewController];
  int v6 = [v5 _preferredStatusBarVisibility];

  if ([(NSMutableArray *)self->_contentStatusBarHiddenAssertions count]) {
    BOOL v7 = v6 == 2;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    goto LABEL_8;
  }
  if (v6 == 2)
  {
    id v8 = [(SBTransientOverlayScenePresenter *)self _statusBarEntity];

    if (v8 != v4)
    {
LABEL_8:
      int v6 = 1;
      goto LABEL_9;
    }
    double v10 = [v4 fluidDismissalState];
    id v11 = v10;
    if (v10 && [v10 dismissalType] == 4)
    {
      uint64_t v14 = 0x3FF0000000000000;
      double v12 = [v4 fluidDismissalState];
      [v12 contentRect];
      -[SBTransientOverlayScenePresenter _getContentScale:translation:fromRect:entity:](self, "_getContentScale:translation:fromRect:entity:", &v14, 0, v4);

      if (BSFloatLessThanFloat()) {
        int v13 = 1;
      }
      else {
        int v13 = 2;
      }
      if ([v11 transitionPhase] == 1) {
        int v6 = 0;
      }
      else {
        int v6 = v13;
      }
    }
    else
    {
      int v6 = 2;
    }
  }
LABEL_9:

  return v6;
}

- (double)_windowLevelForEntity:(id)a3
{
  [(SBTransientOverlayScenePresenter *)self _backgroundWindowLevelForEntity:a3];
  return v3 + 0.1;
}

void __59__SBTransientOverlayScenePresenter__topmostPresentedEntity__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (([v7 isDismissing] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_updateBackgroundWindowForEntity:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1E4F42FF0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SBTransientOverlayScenePresenter__updateBackgroundWindowForEntity___block_invoke;
  v7[3] = &unk_1E6AF5290;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performWithoutAnimation:v7];
}

void __69__SBTransientOverlayScenePresenter__updateBackgroundWindowForEntity___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) viewController];
  if ([v2 isContentOpaque])
  {
    int v3 = [*(id *)(a1 + 32) isRotating];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) backgroundWindow];
      if (!v4)
      {
        id v5 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
        id v6 = [MEMORY[0x1E4F428B8] blackColor];
        id v7 = [v5 view];
        [v7 setBackgroundColor:v6];

        id v8 = [SBTransientOverlayBackgroundWindow alloc];
        id v9 = [*(id *)(a1 + 32) window];
        double v10 = [v9 windowScene];
        id v11 = [NSString stringWithFormat:@"SBTransientOverlayPresentationManagerBackground-%@", v5];
        id v4 = [(SBWindow *)v8 initWithWindowScene:v10 rootViewController:v5 role:@"SBTraitsParticipantRoleTransientOverlayBackground" debugName:v11];

        [(SBTransientOverlayBackgroundWindow *)v4 setBackgroundColor:v6];
        [*(id *)(a1 + 32) setBackgroundWindow:v4];
      }
      double v12 = SBLogTransientOverlay();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        uint64_t v14 = [*(id *)(a1 + 32) viewController];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v13;
        __int16 v20 = 2114;
        CGFloat v21 = v14;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Showing background window for view controller: %{public}@", buf, 0x16u);
      }
      [*(id *)(a1 + 40) _backgroundWindowLevelForEntity:*(void *)(a1 + 32)];
      -[SBTransientOverlayBackgroundWindow setLevel:](v4, "setLevel:");
      [(SBWindow *)v4 setHidden:0];
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v4 = [*(id *)(a1 + 32) backgroundWindow];
  if (v4)
  {
    long long v15 = SBLogTransientOverlay();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      double v17 = [*(id *)(a1 + 32) viewController];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v16;
      __int16 v20 = 2114;
      CGFloat v21 = v17;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Hiding background window for view controller: %{public}@", buf, 0x16u);
    }
    [(SBWindow *)v4 setHidden:1];
    [(SBTransientOverlayBackgroundWindow *)v4 setRootViewController:0];
    [*(id *)(a1 + 32) setBackgroundWindow:0];
  }
LABEL_13:
}

- (void)_updateWindowHitTestingForEntity:(id)a3
{
  id v3 = a3;
  id v5 = [v3 viewController];
  id v4 = [v3 window];

  objc_msgSend(v4, "bs_setHitTestingDisabled:", objc_msgSend(v5, "prefersWindowHitTestingDisabled"));
}

- (void)_updateZStackStateWithAnimationBehavior:(int64_t)a3 reason:(id)a4
{
  if (a3 == 2)
  {
    zStackParticipant = self->_zStackParticipant;
    [(SBFZStackParticipant *)zStackParticipant setNeedsUpdatePreferencesWithReason:a4];
  }
  else
  {
    BOOL homeAffordanceUpdatesShouldBeAnimated = self->_homeAffordanceUpdatesShouldBeAnimated;
    self->_BOOL homeAffordanceUpdatesShouldBeAnimated = a3 != 0;
    [(SBFZStackParticipant *)self->_zStackParticipant setNeedsUpdatePreferencesWithReason:a4];
    self->_BOOL homeAffordanceUpdatesShouldBeAnimated = homeAffordanceUpdatesShouldBeAnimated;
  }
}

- (void)_updateStatusBarWithCurrentExternalStatusBarSettings:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(SBTransientOverlayScenePresenter *)self _statusBarEntity];
  id v8 = SBLogTransientOverlay();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 viewController];
    *(_DWORD *)buf = 138543618;
    uint64_t v57 = self;
    __int16 v58 = 2114;
    uint64_t v59 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Status bar owning view controller set to: %{public}@", buf, 0x16u);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  double v10 = self->_entities;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v14 hasFinishedWindowInitialization]
          && [(SBTransientOverlayScenePresenter *)self _preferredStatusBarVisibilityForEntity:v14])
        {
          LODWORD(v11) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  if (v4) {
    long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
  }
  else {
    long long v15 = 0;
  }
  globalStatusBarAssertion = self->_globalStatusBarAssertion;
  if (v11)
  {
    BOOL v17 = globalStatusBarAssertion == 0;
    if (!globalStatusBarAssertion)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      uint64_t v19 = [WeakRetained statusBarManager];
      __int16 v20 = [v19 assertionManager];

      CGFloat v21 = (SBWindowSceneStatusBarSettingsAssertion *)[v20 newSettingsAssertionWithStatusBarHidden:1 atLevel:7 reason:@"Transient Overlay"];
      uint64_t v22 = self->_globalStatusBarAssertion;
      self->_globalStatusBarAssertion = v21;

      [(SBWindowSceneStatusBarSettingsAssertion *)self->_globalStatusBarAssertion acquireWithAnimationParameters:v15];
    }
    if (self->_appStatusBarAssertion)
    {
      CGFloat v23 = 0;
      double v24 = 0;
      goto LABEL_25;
    }
    double v26 = objc_loadWeakRetained((id *)&self->_delegate);
    double v27 = [v26 transientOverlayScenePresenter:self acquireHideAppStatusBarAssertionWithReason:@"Transient Overlay" animated:v4];
    appStatusBarAssertion = self->_appStatusBarAssertion;
    self->_appStatusBarAssertion = v27;

    CGFloat v23 = 0;
    double v24 = 0;
  }
  else
  {
    CGFloat v23 = globalStatusBarAssertion;
    CGFloat v25 = self->_globalStatusBarAssertion;
    self->_globalStatusBarAssertion = 0;

    double v24 = self->_appStatusBarAssertion;
    BOOL v17 = 0;
    double v26 = self->_appStatusBarAssertion;
    self->_appStatusBarAssertion = 0;
  }

LABEL_25:
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke;
  v48[3] = &unk_1E6B0DAC0;
  v48[4] = self;
  id v29 = v6;
  id v49 = v29;
  BOOL v50 = v17;
  double v30 = (void *)MEMORY[0x1D948C7A0](v48);
  double v31 = v30;
  if (v4)
  {
    id v32 = (id)[objc_alloc(MEMORY[0x1E4F42E38]) initWithDefaultParameters];
    double v33 = (void *)MEMORY[0x1E4F42E38];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_2;
    v46[3] = &unk_1E6AF6828;
    v46[4] = self;
    id v47 = v31;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_3;
    v42[3] = &unk_1E6AFD0F0;
    int v43 = v23;
    CGAffineTransform v44 = v24;
    BOOL v45 = v4;
    id v34 = v31;
    [v33 animateWithParameters:v32 animations:v46 completion:v42];
  }
  else
  {
    uint64_t v35 = (void *)MEMORY[0x1E4F42FF0];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_4;
    v38[3] = &unk_1E6B0DAE8;
    void v38[4] = self;
    id v41 = v30;
    uint64_t v39 = v23;
    BOOL v40 = v24;
    id v32 = v31;
    [v35 performWithoutAnimation:v38];
  }
  CGRect v36 = [(SBTransientOverlayScenePresenter *)self windowScene];
  uint64_t v37 = [v36 recordingIndicatorManager];
  [v37 updateRecordingIndicatorForStatusBarChanges];
}

void __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  int v3 = [v9 hasFinishedWindowInitialization];
  BOOL v4 = v9;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_isPresentationStatusBarHiddenForVisibility:currentExternalStatusBarSettings:", objc_msgSend(*(id *)(a1 + 32), "_preferredStatusBarVisibilityForEntity:", v9), *(void *)(a1 + 40));
    id v6 = [v9 viewController];
    id v7 = v6;
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v8 = *(void *)(a1 + 40);
    }
    else {
      uint64_t v8 = 0;
    }
    [v6 setPresentationPrefersStatusBarHidden:v5 initialStatusBarSettings:v8];

    BOOL v4 = v9;
  }
}

void __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateWithAnimationParameters:0];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  return [v2 invalidateWithAnimation:v3];
}

uint64_t __98__SBTransientOverlayScenePresenter__updateStatusBarWithCurrentExternalStatusBarSettings_animated___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidateWithAnimationParameters:", 0, (void)v8);
  return [*(id *)(a1 + 48) invalidate];
}

- (void)_updateContentStatusBarPresentation
{
  id v3 = [(SBTransientOverlayScenePresenter *)self _currentExternalStatusBarSettings];
  [(SBTransientOverlayScenePresenter *)self _updateStatusBarWithCurrentExternalStatusBarSettings:v3 animated:0];
}

- (void)_updateDeactivationAssertions
{
  id v2 = self;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = self->_entities;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v58 count:16];
  BOOL v40 = v2;
  if (v3)
  {
    uint64_t v5 = v3;
    id v39 = 0;
    uint64_t v6 = *(void *)v46;
    id location = (id *)&v2->_windowScene;
    *(void *)&long long v4 = 138544130;
    long long v35 = v4;
    do
    {
      uint64_t v7 = 0;
      uint64_t v37 = v5;
      do
      {
        if (*(void *)v46 != v6) {
          objc_enumerationMutation(obj);
        }
        long long v8 = *(void **)(*((void *)&v45 + 1) + 8 * v7);
        long long v9 = -[NSMapTable objectForKey:](v2->_entityToSceneDeactivationAssertion, "objectForKey:", v8, v35);
        long long v10 = [v8 viewController];
        long long v11 = [v10 preferredSceneDeactivationReasonValue];

        if (v11)
        {
          uint64_t v12 = [v11 integerValue];
          if (!v9 || [v9 reason] != v12)
          {
            id v13 = [(SBTransientOverlayScenePresenter *)v2 _newSceneDeactivationAssertionWithReason:v12];
            uint64_t v14 = SBLogTransientOverlay();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              long long v15 = [v8 viewController];
              uint64_t v16 = UIApplicationSceneDeactivationReasonDescription();
              *(_DWORD *)buf = v35;
              long long v51 = v2;
              __int16 v52 = 2114;
              id v53 = v13;
              __int16 v54 = 2114;
              uint64_t v55 = v15;
              __int16 v56 = 2114;
              uint64_t v57 = v16;
              _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Created new background assertion %{public}@ for %{public}@ with reason: %{public}@", buf, 0x2Au);
            }
            if (v13)
            {
              BOOL v17 = [v8 viewController];
              CGFloat v18 = [v17 sceneDeactivationPredicate];
              id WeakRetained = objc_loadWeakRetained(location);
              __int16 v20 = [WeakRetained _fbsDisplayIdentity];
              objc_msgSend(v13, "sb_acquireWithPredicate:transitionContext:displayIdentity:", v18, 0, v20);

              CGFloat v21 = v39;
              if (!v39)
              {
                CGFloat v21 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
              }
              id v39 = v21;
              [v21 setObject:v13 forKey:v8];
              id v2 = v40;
            }
            uint64_t v5 = v37;
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v5);
  }
  else
  {
    id v39 = 0;
  }

  entityToSceneDeactivationAssertion = v2->_entityToSceneDeactivationAssertion;
  p_entityToSceneDeactivationAssertion = (id *)&v2->_entityToSceneDeactivationAssertion;
  double v24 = entityToSceneDeactivationAssertion;
  objc_storeStrong(p_entityToSceneDeactivationAssertion, v39);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  CGFloat v25 = v24;
  uint64_t v26 = [(NSMapTable *)v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v25);
        }
        double v30 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        double v31 = [(NSMapTable *)v25 objectForKey:v30];
        id v32 = [*p_entityToSceneDeactivationAssertion objectForKey:v30];
        if (v31 != v32)
        {
          [v31 relinquish];
          double v33 = SBLogTransientOverlay();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = [v30 viewController];
            *(_DWORD *)buf = 138543874;
            long long v51 = v40;
            __int16 v52 = 2114;
            id v53 = v31;
            __int16 v54 = 2114;
            uint64_t v55 = v34;
            _os_log_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Relinquished background assertion %{public}@ for %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v27 = [(NSMapTable *)v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v27);
  }
}

- (void)_updateFeaturePolicies
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to begin suppressing banners", (uint8_t *)&v2, 0xCu);
}

- (void)_updatePreferredWhitePointAdaptivityStyle
{
  uint64_t v3 = [(SBTransientOverlayScenePresenter *)self _topmostPresentedEntity];
  uint64_t v12 = v3;
  if (v3)
  {
    int v4 = [v3 hasFinishedWindowInitialization];
    uint64_t v5 = v12;
    if (!v4) {
      goto LABEL_9;
    }
    uint64_t v6 = NSNumber;
    uint64_t v7 = [v12 viewController];
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "preferredWhitePointAdaptivityStyle"));
    long long v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v8 = 0;
  }
  preferredWhitePointAdaptivityStyleValue = self->_preferredWhitePointAdaptivityStyleValue;
  if (preferredWhitePointAdaptivityStyleValue != v8
    && ([(NSNumber *)preferredWhitePointAdaptivityStyleValue isEqual:v8] & 1) == 0)
  {
    self->_preferredWhitePointAdaptivityStyleValue = v8;
    long long v10 = [(SBTransientOverlayScenePresenter *)self delegate];
    long long v11 = [MEMORY[0x1E4F42FF0] _currentAnimationSettings];
    [v10 transientOverlayScenePresenter:self preferredWhitePointAdaptivityStyleDidChangeWithAnimationSettings:v11];
  }
  uint64_t v5 = v12;
LABEL_9:
}

- (void)_windowedAccessoryDidAttachOrDetach:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v4 = +[SBUIController sharedInstanceIfExists];
  uint64_t v5 = [v4 isConnectedToWindowedAccessory];

  uint64_t v6 = +[SBUIController sharedInstanceIfExists];
  [v6 visibleScreenCoordinatesForWindowedAccessory];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v15 = self->_entities;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        __int16 v20 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v19), "viewController", (void)v21);
        objc_msgSend(v20, "didTransitionToAttachedToWindowedAccessory:windowedAccessoryCutoutFrameInScreen:", v5, v8, v10, v12, v14);

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }
}

- (void)_preserveInputViewsForEntityIfNeeded:(id)a3
{
  id v4 = a3;
  if (([v4 hasPreservedInputViews] & 1) == 0)
  {
    [v4 setHasPreservedInputViews:1];
    uint64_t v3 = [v4 viewController];
    [v3 preserveInputViewsAnimated:1];
  }
}

- (id)_newKeyboardFocusAssertionForEntity:(id)a3
{
  id v3 = a3;
  id v4 = +[SBWorkspace mainWorkspace];
  uint64_t v5 = [v4 keyboardFocusController];
  uint64_t v6 = [v3 window];

  double v7 = +[SBKeyboardFocusLockReason activeTransientOverlay];
  double v8 = [v5 focusLockSpringBoardWindow:v6 forReason:v7];

  return v8;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (int64_t)topmostViewControllerInterfaceOrientation
{
  return self->_topmostViewControllerInterfaceOrientation;
}

- (SBTransientOverlayScenePresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBTransientOverlayScenePresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBCoverSheetPresentationManager)coverSheetPresentationManager
{
  return self->_coverSheetPresentationManager;
}

- (SBBannerManager)bannerManager
{
  return self->_bannerManager;
}

- (SBInCallPresentationManager)inCallPresentationManager
{
  return self->_inCallPresentationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_appStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_globalStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_lockStateAggregator, 0);
  objc_storeStrong((id *)&self->_interactiveScreenshotGestureDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_initialPresentationKeyWindow, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_zStackPhysicalButtonPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_entityToSceneDeactivationAssertion, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_deviceOrientationUpdateDeferralAssertion, 0);
  objc_storeStrong((id *)&self->_coverSheetExternalBehaviorProvider, 0);
  objc_storeStrong((id *)&self->_contentStatusBarHiddenAssertions, 0);
  objc_storeStrong((id *)&self->_inCallNonModalSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_inCallPresentationManager, 0);
  objc_storeStrong((id *)&self->_bannerManager, 0);
  objc_storeStrong((id *)&self->_alertItemsController, 0);
}

@end