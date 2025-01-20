@interface SBSwitcherController
- (BOOL)_areLayoutStateElements:(id)a3 matchedWithAssociatedParticipants:(id)a4;
- (BOOL)_isUnderUILock;
- (BOOL)_shouldAcceleratedHomeButtonPressBegin;
- (BOOL)activateHomeScreenWithSource:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)activateMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4;
- (BOOL)dismissMainAndFloatingSwitchersWithSource:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)dismissMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hasAppLayoutForTransientOverlayViewController:(id)a3;
- (BOOL)hasTransientOverlayAppLayouts;
- (BOOL)idleTouchAwarenessClientEnabled;
- (BOOL)isAcquiredTransientOverlayViewController:(id)a3;
- (BOOL)isAdditiveModelEnabled;
- (BOOL)isAnyProtectedHiddenApplicationVisible;
- (BOOL)isAnySwitcherVisible;
- (BOOL)isAutoLayoutEnabled;
- (BOOL)isChamoisMultitaskingEnabled;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isFloatingSwitcherVisible;
- (BOOL)isIdleTouchAwarenessClientEnabled;
- (BOOL)isInAnyPeekState;
- (BOOL)isInAppStatusBarHidden;
- (BOOL)isInAppStatusBarRequestedHiddenForSwitcherContentController:(id)a3;
- (BOOL)isMainSwitcherVisible;
- (BOOL)isMedusaMultitaskingEnabled;
- (BOOL)isOnExtendedDisplay;
- (BOOL)layoutContainsRole:(int64_t)a3;
- (BOOL)shouldMorphFromPIPForTransitionContext:(id)a3;
- (BOOL)shouldMorphToPIPForTransitionContext:(id)a3;
- (BOOL)toggleMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4;
- (CGRect)frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4;
- (CGRect)frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4;
- (CGRect)frameForItemWithRole:(int64_t)a3 inMainAppLayout:(id)a4 interfaceOrientation:(int64_t)a5;
- (CGRect)referenceFrameForInterfaceOrientation:(int64_t)a3 centerConfiguration:(int64_t)a4;
- (CGRect)referenceFrameForInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4;
- (CGRect)referenceFrameForInterfaceOrientation:(int64_t)a3 layoutRole:(int64_t)a4 appLayout:(id)a5;
- (CGRect)sceneEntityFrameForWorkspaceEntity:(id)a3 inLayoutState:(id)a4;
- (CGRect)statusBarAvoidanceFrameForLayoutRole:(int64_t)a3;
- (CGRect)statusBarAvoidanceFrameForLayoutRole:(int64_t)a3 layoutState:(id)a4;
- (FBSDisplayIdentity)displayIdentity;
- (NSString)activateSwitcherEventName;
- (NSString)dismissSwitcherEventName;
- (NSString)toggleSwitcherEventName;
- (SBAppLayout)activeAppLayoutWhenActivatingMainSwitcher;
- (SBFluidSwitcherGestureManager)gestureManager;
- (SBLayoutState)layoutState;
- (SBMainSwitcherWindow)switcherWindow;
- (SBSwitcherContentViewControlling)contentViewController;
- (SBSwitcherController)initWithWindowScene:(id)a3 debugName:(id)a4;
- (SBSwitcherControllerCoordinating)switcherCoordinator;
- (SBSwitcherViewController)switcherViewController;
- (SBWindowScene)windowScene;
- (UIEdgeInsets)statusBarEdgeInsets;
- (char)_activityModeForScene:(id)a3;
- (char)_jetsamModeForScene:(id)a3;
- (double)contentContainerAspectRatio;
- (double)minimumHomeScreenScale;
- (double)scaleForDownscaledSnapshotGenerationForSceneHandle:(id)a3;
- (id)_ancillaryTransitionRequestForTransitionRequest:(id)a3;
- (id)_appLayoutForScene:(id)a3;
- (id)_currentFloatingAppLayout;
- (id)_currentLayoutState;
- (id)_currentMainAppLayout;
- (id)_debugEventNameWithEventName:(id)a3;
- (id)_deviceApplicationSceneHandleForDisplayItem:(id)a3;
- (id)_elementsOrientationsForParticipantsByElementIdentifier:(id)a3;
- (id)_liveOverlayForTraitsDelegate:(id)a3;
- (id)_makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4;
- (id)_makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:(id)a3 dismissFloatingSwitcher:(BOOL)a4 withSource:(int64_t)a5 animated:(BOOL)a6;
- (id)_makeWorkspaceTransitionValidatorForTogglingMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4;
- (id)_orientationStateDescription;
- (id)_orientationsForLayoutStateElements:(id)a3 withAssociatedParticipants:(id)a4;
- (id)_sceneEntitiesToForeground;
- (id)_sceneHandleForLayoutElement:(id)a3;
- (id)_traitsParticipantForLayoutElementIdentifier:(id)a3;
- (id)activeAndVisibleSceneIdentifiersForApplication:(id)a3;
- (id)activeTransientOverlayPresentedAppLayout;
- (id)animationControllerForTransitionRequest:(id)a3;
- (id)appLayoutForWorkspaceTransientOverlay:(id)a3;
- (id)coordinateSpaceForInterfaceOrientation:(int64_t)a3;
- (id)coordinateSpaceForLayoutElement:(id)a3 layoutState:(id)a4;
- (id)coordinateSpaceForLayoutState:(id)a3;
- (id)createWorkspaceTransientOverlayForAppLayout:(id)a3;
- (id)currentElementsParticipants;
- (id)entityWithRole:(int64_t)a3;
- (id)homeGestureBottomEdgeRecognizer;
- (id)layoutElementSizingPoliciesForLayoutState:(id)a3;
- (id)layoutStateApplicationSceneHandles;
- (id)layoutStatePrimaryElement;
- (id)layoutStateSideElement;
- (id)layoutStateStudyLogData;
- (id)leadingStatusBarStyleRequest;
- (id)participantAssociatedSceneIdentityTokens:(id)a3;
- (id)participantAssociatedWindows:(id)a3;
- (id)requestInAppStatusBarHiddenAssertionForReason:(id)a3 animated:(BOOL)a4;
- (id)sceneHandleForLayoutElement:(id)a3;
- (id)sceneHandleForTraitsParticipant:(id)a3;
- (id)stateCaptureTitlePreamble;
- (id)statusBarActionsByPartIdentifier;
- (id)statusBarOverlayData;
- (id)trailingStatusBarStyleRequest;
- (id)traitsParticipantForSceneHandle:(id)a3;
- (id)traitsPipelineManager;
- (int64_t)_interfaceOrientationForLayoutElementIdentifier:(id)a3;
- (int64_t)floatingConfiguration;
- (int64_t)interfaceOrientation;
- (int64_t)interfaceOrientationForLayoutElement:(id)a3;
- (int64_t)interfaceOrientationForSceneHandle:(id)a3;
- (int64_t)overrideInterfaceOrientationMechanicsForSwitcherViewController:(id)a3;
- (int64_t)unlockedEnvironmentMode;
- (unint64_t)switcherSupportedInterfaceOrientations;
- (unint64_t)windowManagementStyle;
- (void)_addInAppStatusBarHiddenAssertion:(id)a3 animated:(BOOL)a4;
- (void)_attemptContentViewInterfaceOrientationUpdateForPanGesture:(int64_t)a3;
- (void)_dismissMedusaBanner;
- (void)_enqueueOrientationTransitionWithActuationContext:(id)a3 suggestedAnimator:(id)a4 completionTask:(id)a5 validator:(id)a6 label:(id)a7;
- (void)_handleMultitaskingEnablementChange;
- (void)_invalidate;
- (void)_invalidateLayoutElementsTraitsParticipants;
- (void)_invalidateMedusaEducationBannerTimer;
- (void)_noteLayoutStateEvaluationBegan;
- (void)_noteLayoutStateEvaluationEndedWithParticipantsByElementIdentifiers:(id)a3 delegatesByParticipant:(id)a4 primaryDelegate:(id)a5;
- (void)_noteSwitcherDropAnimationCompletedWithContext:(id)a3;
- (void)_performSwitcherDropWithContext:(id)a3;
- (void)_prepareForSceneLayoutTransitionWithTransitionContext:(id)a3;
- (void)_presentContinuousExposeStripRevealGrabberTongueImmediately;
- (void)_presentMedusaBanner:(int64_t)a3 fireInterval:(double)a4 dismissInterval:(double)a5;
- (void)_presentMedusaEducationBanner;
- (void)_reevaluateOrientationIfNecessary;
- (void)_removeInAppStatusBarHiddenAssertion:(id)a3 animated:(BOOL)a4;
- (void)_setUpSwitcherWindowIfNeeded;
- (void)_setupSwitcherTraitsParticipantAndPolicySpecifiers;
- (void)_tickleContinuousExposeStripRevealGrabberTongueIfVisible;
- (void)_updateAppTransitionContext:(id)a3 withOrientationActuationContext:(id)a4;
- (void)_updateAppTransitionContext:(id)a3 withOrientationContext:(id)a4 accountForSceneState:(BOOL)a5 primaryDelegate:(id)a6;
- (void)_updateContentViewControllerIfNeeded;
- (void)_updateContentViewInterfaceOrientation:(int64_t)a3;
- (void)_updateDisplayLayoutElementForLayoutState:(id)a3;
- (void)_windowSceneCanvasSizeDidChange:(id)a3;
- (void)actuateOrientationForTraitsDelegate:(id)a3 withContext:(id)a4 reasons:(int64_t)a5;
- (void)addAcquiredTransientOverlayViewController:(id)a3 forAppLayout:(id)a4;
- (void)addAppLayoutForDisplayItem:(id)a3 completion:(id)a4;
- (void)addAppLayoutForTransientOverlayViewController:(id)a3;
- (void)addCenterRoleAppLayoutForDisplayItem:(id)a3 completion:(id)a4;
- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5;
- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3;
- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6;
- (void)configureRequest:(id)a3 forSwitcherTransitionRequest:(id)a4 withEventLabel:(id)a5;
- (void)dealloc;
- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4;
- (void)didEndCoordinationWithCoordinator:(id)a3;
- (void)enumerateTransientOverlayViewControllersUsingBlock:(id)a3;
- (void)fluidSwitcherGestureManager:(id)a3 clickReceivedForHomeGrabberView:(id)a4;
- (void)fluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4;
- (void)fluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4;
- (void)fluidSwitcherGestureManager:(id)a3 didUpdateGesture:(id)a4;
- (void)fluidSwitcherGestureManager:(id)a3 tapReceivedForGrabberTongueAtEdge:(unint64_t)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4;
- (void)performKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4;
- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3;
- (void)removeAcquiredTransientOverlayViewController:(id)a3;
- (void)removeAppLayoutTransientOverlayViewController:(id)a3;
- (void)setActiveAppLayoutWhenActivatingMainSwitcher:(id)a3;
- (void)setChamoisMultitaskingEnabled:(BOOL)a3;
- (void)setContentViewController:(id)a3;
- (void)setDisplayLayoutElementActive:(BOOL)a3;
- (void)setGestureManager:(id)a3;
- (void)setIdleTouchAwarenessClientEnabled:(BOOL)a3;
- (void)setMedusaMultitaskingEnabled:(BOOL)a3;
- (void)setSwitcherViewController:(id)a3;
- (void)setSwitcherWindow:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)switcherOrientation:(int64_t *)a3 elementsOrientations:(id *)a4 forTransitionRequest:(id)a5 previousLayoutState:(id)a6 layoutState:(id)a7;
- (void)updateDisplayLayoutElementWithBuilder:(id)a3;
- (void)updateOrientationForTraitsDelegate:(id)a3 withUpdateReasons:(int64_t)a4 suggestedAnimator:(id)a5 actuationContext:(id)a6;
- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4;
- (void)updateWindowVisibilityForSwitcherContentController:(id)a3;
- (void)viewDidLoadForSwitcherViewController:(id)a3;
- (void)viewWillAppearForSwitcherViewController:(id)a3 animated:(BOOL)a4;
- (void)willBeginCoordinationWithCoordinator:(id)a3;
- (void)willEndCoordinationWithCoordinator:(id)a3;
@end

@implementation SBSwitcherController

- (SBSwitcherContentViewControlling)contentViewController
{
  return self->_contentViewController;
}

- (id)_deviceApplicationSceneHandleForDisplayItem:(id)a3
{
  id v4 = a3;
  v5 = [(SBSwitcherController *)self windowScene];
  v6 = [v5 sceneManager];

  v7 = +[SBApplicationController sharedInstance];
  v8 = [v7 applicationForDisplayItem:v4];

  if (!v8)
  {
    v10 = 0;
    goto LABEL_6;
  }
  v9 = [v4 uniqueIdentifier];
  v10 = [v6 sceneIdentityForApplication:v8 uniqueIdentifier:v9];

  if (!v10)
  {
LABEL_6:
    id v12 = 0;
    goto LABEL_9;
  }
  v11 = [v6 existingSceneHandleForSceneIdentity:v10];
  if ([v11 isDeviceApplicationSceneHandle]) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

LABEL_9:
  id v13 = v12;

  return v13;
}

- (id)_currentLayoutState
{
  v3 = [(SBFluidSwitcherGestureManager *)self->_gestureManager activeGestureTransaction];
  id v4 = [v3 animationController];
  v5 = [v4 workspaceTransitionRequest];

  v6 = [v5 displayConfiguration];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v8 = [WeakRetained _fbsDisplayConfiguration];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    v10 = [v5 applicationContext];
    v11 = [v10 layoutState];
  }
  else
  {
    v11 = [(SBSwitcherController *)self layoutState];
  }

  return v11;
}

- (SBLayoutState)layoutState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v3 = [WeakRetained layoutStateProvider];
  id v4 = [v3 layoutState];

  return (SBLayoutState *)v4;
}

- (unint64_t)windowManagementStyle
{
  if ([(SBSwitcherController *)self isChamoisMultitaskingEnabled]) {
    return 2;
  }
  id v4 = +[SBWorkspace mainWorkspace];
  if ([v4 isMedusaCapable])
  {
    BOOL v5 = [(SBSwitcherController *)self isMedusaMultitaskingEnabled];

    if (v5) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)isChamoisMultitaskingEnabled
{
  int v3 = SBFIsChamoisWindowingUIAvailable();
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    char v5 = [WeakRetained isExternalDisplayWindowScene];

    LOBYTE(v3) = (v5 & 1) != 0 || self->_chamoisMultitaskingEnabled;
  }
  return v3;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (FBSDisplayIdentity)displayIdentity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int v3 = [WeakRetained _fbsDisplayIdentity];

  return (FBSDisplayIdentity *)v3;
}

- (int64_t)unlockedEnvironmentMode
{
  v2 = [(SBSwitcherController *)self layoutState];
  int64_t v3 = [v2 unlockedEnvironmentMode];

  return v3;
}

- (BOOL)layoutContainsRole:(int64_t)a3
{
  id v4 = [(SBSwitcherController *)self layoutState];
  LOBYTE(a3) = [v4 layoutContainsRole:a3];

  return a3;
}

- (SBFluidSwitcherGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (id)layoutStatePrimaryElement
{
  v2 = [(SBSwitcherController *)self layoutState];
  int64_t v3 = [v2 elementWithRole:1];

  return v3;
}

- (id)layoutStateApplicationSceneHandles
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(SBSwitcherController *)self layoutState];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v5 = objc_msgSend(v4, "elements", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v10 layoutRole] == 3)
        {
          unint64_t v11 = [v4 floatingConfiguration];
          if (v11 <= 4 && ((1 << v11) & 0x19) != 0) {
            continue;
          }
        }
        id v12 = [v10 workspaceEntity];
        id v13 = [v12 applicationSceneEntity];
        v14 = [v13 sceneHandle];

        if (v14) {
          [v3 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  if ([v3 count]) {
    v15 = v3;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (BOOL)isInAppStatusBarRequestedHiddenForSwitcherContentController:(id)a3
{
  return [(NSHashTable *)self->_inAppStatusBarHiddenAssertions count] != 0;
}

- (id)_currentFloatingAppLayout
{
  v2 = [(SBSwitcherController *)self _currentLayoutState];
  int64_t v3 = [v2 floatingAppLayout];

  return v3;
}

- (id)_currentMainAppLayout
{
  v2 = [(SBSwitcherController *)self _currentLayoutState];
  int64_t v3 = [v2 appLayout];

  return v3;
}

- (SBSwitcherControllerCoordinating)switcherCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherCoordinator);
  if (!WeakRetained)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBSwitcherController.m" lineNumber:284 description:@"You should be coordinated by a switcher coordinator."];
  }
  return (SBSwitcherControllerCoordinating *)WeakRetained;
}

- (void)updatePreferencesForParticipant:(id)a3 updater:(id)a4
{
  uint64_t v6 = (TRAParticipant *)a3;
  id v7 = a4;
  if (self->_traitsParticipant == v6)
  {
    [(TRAParticipant *)v6 currentZOrderLevel];
    if ((BSFloatEqualToFloat() & 1) == 0) {
      [v7 updateZOrderLevelPreferencesWithBlock:&__block_literal_global_151];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke_2;
    v10[3] = &unk_1E6AFC568;
    v10[4] = self;
    [v7 updateOrientationPreferencesWithBlock:v10];
  }
  else if (self->_publisherTraitsParticipant == v6)
  {
    [(TRAParticipant *)v6 currentZOrderLevel];
    if ((BSFloatEqualToFloat() & 1) == 0) {
      [v7 updateZOrderLevelPreferencesWithBlock:&__block_literal_global_137];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke_4;
    v8[3] = &unk_1E6B01360;
    v8[4] = self;
    int v9 = v6;
    [v7 updateOrientationPreferencesWithBlock:v8];
  }
}

- (id)coordinateSpaceForLayoutState:(id)a3
{
  uint64_t v4 = [a3 interfaceOrientation];
  return [(SBSwitcherController *)self coordinateSpaceForInterfaceOrientation:v4];
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id v7 = [(SBSwitcherController *)self switcherCoordinator];
  [v7 layoutStateTransitionCoordinator:v21 transitionDidBeginWithTransitionContext:v6];

  uint64_t v8 = [v6 applicationTransitionContext];
  int v9 = [v8 request];
  v10 = [v6 toLayoutState];
  unint64_t v11 = [v6 fromLayoutState];
  id v12 = [v11 appLayout];
  uint64_t v13 = [v10 unlockedEnvironmentMode];
  uint64_t v14 = [v11 unlockedEnvironmentMode];
  if (v13 == 2)
  {
    uint64_t v15 = v14;
    if (([v8 animationDisabled] & 1) == 0)
    {
      if (v15 != 2) {
        objc_storeStrong((id *)&self->_activeAppLayoutWhenActivatingMainSwitcher, v12);
      }
      id v16 = [v9 transientOverlayContext];
      v17 = v16;
      if (v16 && [v16 transitionType] == 1)
      {
        long long v18 = [v17 transientOverlay];
        long long v19 = [(SBSwitcherController *)self appLayoutForWorkspaceTransientOverlay:v18];

        if (v19) {
          objc_storeStrong((id *)&self->_activeAppLayoutWhenActivatingMainSwitcher, v19);
        }
      }
    }
  }
  [(SBSwitcherController *)self _reevaluateOrientationIfNecessary];
  self->_isPublishedOrientationLocked = self->_shouldLockPublishedOrientation;
  long long v20 = [v6 toLayoutState];
  self->_canDetermineActiveOrientation = [v20 unlockedEnvironmentMode] != 1;

  [(TRAParticipant *)self->_publisherTraitsParticipant setNeedsUpdatePreferencesWithReason:@"Layout state change did begin"];
  [(SBSwitcherContentViewControlling *)self->_contentViewController layoutStateTransitionCoordinator:v21 transitionDidBeginWithTransitionContext:v6];
}

- (void)_reevaluateOrientationIfNecessary
{
  if (self->_needsOrientationReevaluation)
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __57__SBSwitcherController__reevaluateOrientationIfNecessary__block_invoke;
    v3[3] = &unk_1E6B01470;
    objc_copyWeak(&v4, &location);
    [(SBSwitcherController *)self _enqueueOrientationTransitionWithActuationContext:0 suggestedAnimator:0 completionTask:0 validator:v3 label:@"SBSwitcherControllerEventLabelFollowupRotation"];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)_updateContentViewInterfaceOrientation:(int64_t)a3
{
  -[SBSwitcherViewController setContentOrientation:](self->_switcherViewController, "setContentOrientation:");
  contentViewController = self->_contentViewController;
  [(SBSwitcherContentViewControlling *)contentViewController setContentOrientation:a3];
}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (displayLayoutElementAssertion) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    if (!WeakRetained)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"SBSwitcherController.m", 2152, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    id v12 = [WeakRetained displayLayoutPublisher];
    if (!v12)
    {
      unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSwitcherController.m", 2152, @"No publisher for window scene: %@; self: %@",
        WeakRetained,
        self);
    }
    id v7 = [v12 addElement:self->_displayLayoutElement];
    uint64_t v8 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v7;

    int v9 = (BSInvalidatable *)v12;
  }
  else
  {
    if (!displayLayoutElementAssertion) {
      return;
    }
    [(BSInvalidatable *)displayLayoutElementAssertion invalidate];
    int v9 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;
  }
}

- (void)_updateDisplayLayoutElementForLayoutState:(id)a3
{
  if ([a3 unlockedEnvironmentMode] == 2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __66__SBSwitcherController__updateDisplayLayoutElementForLayoutState___block_invoke;
    v4[3] = &unk_1E6B01568;
    v4[4] = self;
    [(SBSwitcherController *)self updateDisplayLayoutElementWithBuilder:v4];
    [(SBSwitcherController *)self setDisplayLayoutElementActive:1];
  }
  else
  {
    [(SBSwitcherController *)self setDisplayLayoutElementActive:0];
  }
}

- (CGRect)sceneEntityFrameForWorkspaceEntity:(id)a3 inLayoutState:(id)a4
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBSwitcherController *)self switcherViewController];
  int v9 = [v8 view];
  [v9 bounds];

  uint64_t v58 = [v7 floatingConfiguration];
  v10 = [v6 applicationSceneEntity];
  unint64_t v11 = [v10 sceneHandle];
  int64_t v12 = [(SBSwitcherController *)self interfaceOrientationForSceneHandle:v11];

  if ([(SBSwitcherController *)self windowManagementStyle] == 2) {
    uint64_t v59 = [v7 interfaceOrientation];
  }
  else {
    uint64_t v59 = v12;
  }
  uint64_t v13 = [v6 layoutRole];
  uint64_t v14 = [v7 appLayout];
  uint64_t v15 = (SBAppLayout *)v14;
  if (v13) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = 1;
  }
  if (!v14)
  {
    v17 = [v6 displayItemRepresentation];
    long long v18 = [SBAppLayout alloc];
    long long v19 = [NSNumber numberWithInteger:1];
    v67 = v19;
    v68[0] = v17;
    long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
    uint64_t v15 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v18, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v20, 1, 1, [v7 displayOrdinal]);
  }
  id v21 = [(SBSwitcherController *)self switcherCoordinator];
  v22 = [v21 currentCoordinatedLayoutStateTransitionContext];

  uint64_t v23 = [v6 displayItemRepresentation];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (v22 && [v22 isDisplayItemTransitioning:v23])
  {
    v24 = [v22 fromSwitcherController];
    int v25 = [(SBSwitcherController *)self isEqual:v24];

    if (v25) {
      [v22 toFrameInFromSwitcherForDisplayItem:v23];
    }
    v26 = [v22 toSwitcherController];
    int v27 = [(SBSwitcherController *)self isEqual:v26];

    if (v27) {
      [v22 toFrameInToSwitcherForDisplayItem:v23];
    }
    v28 = WeakRetained;
    v29 = [WeakRetained _fbsDisplayConfiguration];
    [v29 bounds];

    _UIWindowConvertRectFromOrientationToOrientation();
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
  }
  else
  {
    uint64_t v38 = [v7 peekConfiguration];
    if (SBPeekConfigurationIsValid(v38))
    {
      v57 = v8;
      v39 = [(SBAppLayout *)v15 itemForLayoutRole:2];

      if (!v39)
      {
        uint64_t v40 = [v7 spaceConfiguration];
        uint64_t v41 = 2;
        uint64_t v42 = 4;
        if (v40 != 2) {
          uint64_t v42 = v40;
        }
        if (v40 != 4) {
          uint64_t v41 = v42;
        }
        if (v38 != 3) {
          uint64_t v41 = v40;
        }
        uint64_t v56 = v41;
        v43 = +[SBDisplayItem displayItemWithType:0 bundleIdentifier:@"com.apple.springboard.PeekPlacholderItem" uniqueIdentifier:@"com.apple.springboard.PeekPlacholderItem.1"];
        v44 = objc_alloc_init(SBDisplayItemLayoutAttributes);
        v45 = [(SBAppLayout *)v15 appLayoutByInsertingItem:v43 withLayoutAttributes:v44 inLayoutRole:2];

        uint64_t v15 = [v45 appLayoutByModifyingConfiguration:SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(v56)];
      }
      uint64_t v8 = v57;
    }
    if (v16 == 3)
    {
      [(SBSwitcherController *)self referenceFrameForInterfaceOrientation:v59 floatingConfiguration:v58];
    }
    else if (v16 == 4)
    {
      -[SBSwitcherController referenceFrameForInterfaceOrientation:centerConfiguration:](self, "referenceFrameForInterfaceOrientation:centerConfiguration:", v59, [v7 centerConfiguration]);
    }
    else
    {
      [(SBSwitcherController *)self referenceFrameForInterfaceOrientation:v59 layoutRole:v16 appLayout:v15];
    }
    double v31 = v46;
    double v33 = v47;
    double v35 = v48;
    double v37 = v49;
    v28 = WeakRetained;
  }
  if (v35 == *MEMORY[0x1E4F1DB30] && v37 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v50 = SBLogAppSwitcher();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v55 = [v28 _fbsDisplayIdentity];
      *(_DWORD *)buf = 138543874;
      id v62 = v6;
      __int16 v63 = 2114;
      v64 = v15;
      __int16 v65 = 2114;
      v66 = v55;
      _os_log_error_impl(&dword_1D85BA000, v50, OS_LOG_TYPE_ERROR, "produced {0,0} with entity %{public}@, appLayout %{public}@ windowScene displayIdentity %{public}@", buf, 0x20u);
    }
  }

  double v51 = v31;
  double v52 = v33;
  double v53 = v35;
  double v54 = v37;
  result.size.height = v54;
  result.size.width = v53;
  result.origin.y = v52;
  result.origin.x = v51;
  return result;
}

- (void)updateWindowVisibilityForSwitcherContentController:(id)a3
{
  id v9 = a3;
  id v4 = [(SBSwitcherController *)self contentViewController];

  char v5 = v9;
  if (v4 == v9)
  {
    uint64_t v6 = [v9 isWindowVisible];
    id v7 = [(SBSwitcherController *)self switcherWindow];
    uint64_t v8 = [(SBSwitcherController *)self switcherViewController];
    if (v6 == [v7 isHidden])
    {
      if (((v6 ^ 1 | [(SBSwitcherController *)self _isUnderUILock]) & 1) == 0) {
        [v7 makeKeyAndVisible];
      }
      [v7 setHidden:v6 ^ 1];
      objc_msgSend(v8, "bs_endAppearanceTransition:", v6);
      [(TRAParticipant *)self->_traitsParticipant setNeedsUpdatePreferencesWithReason:@"Window visibility change"];
      [(TRAParticipant *)self->_publisherTraitsParticipant setNeedsUpdatePreferencesWithReason:@"Window visibility change"];
    }

    char v5 = v9;
  }
}

- (SBSwitcherViewController)switcherViewController
{
  return self->_switcherViewController;
}

- (SBMainSwitcherWindow)switcherWindow
{
  return self->_switcherWindow;
}

- (CGRect)referenceFrameForInterfaceOrientation:(int64_t)a3 layoutRole:(int64_t)a4 appLayout:(id)a5
{
  if (a3)
  {
    p_windowScene = &self->_windowScene;
    id v9 = a5;
    id WeakRetained = objc_loadWeakRetained((id *)p_windowScene);
    unint64_t v11 = [WeakRetained _fbsDisplayConfiguration];
    [v11 bounds];

    [(SBSwitcherController *)self frameForItemWithRole:a4 inMainAppLayout:v9 interfaceOrientation:a3];
    _UIWindowConvertRectFromOrientationToOrientation();
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB28];
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)frameForItemWithRole:(int64_t)a3 inMainAppLayout:(id)a4 interfaceOrientation:(int64_t)a5
{
  displayItemFrameCalculator = self->_displayItemFrameCalculator;
  p_windowScene = &self->_windowScene;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_windowScene);
  [(SBDisplayItemLayoutAttributesCalculator *)displayItemFrameCalculator frameForLayoutRole:a3 inAppLayout:v9 containerOrientation:a5 windowScene:WeakRetained];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (int64_t)interfaceOrientationForSceneHandle:(id)a3
{
  id v4 = [a3 sceneIdentifier];
  int64_t v5 = [(SBSwitcherController *)self _interfaceOrientationForLayoutElementIdentifier:v4];

  return v5;
}

- (id)traitsParticipantForSceneHandle:(id)a3
{
  id v4 = [a3 sceneIdentifier];
  int64_t v5 = [(SBSwitcherController *)self _traitsParticipantForLayoutElementIdentifier:v4];

  return v5;
}

- (int64_t)_interfaceOrientationForLayoutElementIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBSwitcherController *)self _traitsParticipantForLayoutElementIdentifier:v4];
  int64_t v6 = objc_msgSend(v5, "sbf_currentOrientation");
  if (!v6)
  {
    id v7 = [(SBSwitcherController *)self layoutState];
    int64_t v6 = [v7 interfaceOrientationForElementIdentifier:v4];
  }
  return v6;
}

- (id)_traitsParticipantForLayoutElementIdentifier:(id)a3
{
  return [(NSDictionary *)self->_traitsParticipantsByElementIdentifier objectForKey:a3];
}

- (void)switcherOrientation:(int64_t *)a3 elementsOrientations:(id *)a4 forTransitionRequest:(id)a5 previousLayoutState:(id)a6 layoutState:(id)a7
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v13)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_74:
    v69 = [MEMORY[0x1E4F28B00] currentHandler];
    [v69 handleFailureInMethod:a2, self, @"SBSwitcherController.m", 537, @"Invalid parameter not satisfying: %@", @"outSwitcherOrientation" object file lineNumber description];

    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_75;
  }
  v68 = [MEMORY[0x1E4F28B00] currentHandler];
  [v68 handleFailureInMethod:a2, self, @"SBSwitcherController.m", 536, @"Invalid parameter not satisfying: %@", @"transitionRequest" object file lineNumber description];

  if (!a3) {
    goto LABEL_74;
  }
LABEL_3:
  if (a4) {
    goto LABEL_4;
  }
LABEL_75:
  v70 = [MEMORY[0x1E4F28B00] currentHandler];
  [v70 handleFailureInMethod:a2, self, @"SBSwitcherController.m", 538, @"Invalid parameter not satisfying: %@", @"outElementsOrientations" object file lineNumber description];

LABEL_4:
  double v16 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    double v17 = SBMainWorkspaceTransitionSourceDescription([v13 source]);
    *(_DWORD *)buf = 138543362;
    v85 = v17;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] transition source: %{public}@", buf, 0xCu);
  }
  uint64_t v18 = [v13 source];
  BOOL v19 = [(SBSwitcherController *)self _isUnderUILock];
  double v20 = [v13 eventLabel];
  int v76 = [v20 containsString:@"SBSwitcherControllerEventLabelFollowupRotation"];

  double v21 = [[SBSwitcherLayoutTransitionNotes alloc] initWithFromPreviousState:v14 currentLayoutState:v15 transitionRequest:v13];
  double v22 = v21;
  *a3 = 0;
  if (v18 == 14
    || [(SBSwitcherLayoutTransitionNotes *)v21 fromNoAppToApp]
    || [(SBSwitcherLayoutTransitionNotes *)v22 changingApps]
    || !v19 && (self->_traitsParticipant || [v15 unlockedEnvironmentMode] != 1))
  {
    uint64_t v72 = v18;
    [(SBSwitcherController *)self _noteLayoutStateEvaluationBegan];
    if (!self->_traitsParticipant) {
      [(SBSwitcherController *)self _setupSwitcherTraitsParticipantAndPolicySpecifiers];
    }
    double v23 = [v15 elementWithRole:1];
    v24 = [v23 workspaceEntity];

    v77 = v24;
    int v25 = [v24 applicationSceneEntity];
    v26 = [v25 sceneHandle];
    int v27 = [v26 application];
    int v80 = [v27 classicAppPhoneAppRunningOnPad];

    BOOL v28 = [(SBSwitcherLayoutTransitionNotes *)v22 fromHomeScreenToApp];
    if ([(SBSwitcherLayoutTransitionNotes *)v22 inHomeScreen]) {
      BOOL canDetermineActiveOrientation = self->_canDetermineActiveOrientation;
    }
    else {
      BOOL canDetermineActiveOrientation = 1;
    }
    self->_BOOL canDetermineActiveOrientation = canDetermineActiveOrientation;
    self->_shouldLockPublishedOrientation = v28;
    self->_panGestureRecognizerRequestedOrientation = 0;
    unint64_t v30 = [(SBSwitcherController *)self windowManagementStyle];
    BOOL v31 = [(SBSwitcherLayoutTransitionNotes *)v22 isSystemGesture];
    v75 = v13;
    v78 = a3;
    v79 = a4;
    if (v30 == 2)
    {
      if (v31
        || [(SBSwitcherLayoutTransitionNotes *)v22 fromSwitcher]
        && [(SBSwitcherLayoutTransitionNotes *)v22 inApp])
      {
        char v32 = 1;
        uint64_t v33 = 5;
      }
      else
      {
        char v32 = 0;
        if ([(SBSwitcherLayoutTransitionNotes *)v22 inAnySwitcher]) {
          uint64_t v33 = 5;
        }
        else {
          uint64_t v33 = 4;
        }
      }
      uint64_t v71 = 3;
      uint64_t v34 = 3;
      goto LABEL_43;
    }
    if (!v31 && ![(SBSwitcherLayoutTransitionNotes *)v22 isPIPRestore])
    {
      if ([(SBSwitcherLayoutTransitionNotes *)v22 fromHomeScreenToApp]
        || [(SBSwitcherLayoutTransitionNotes *)v22 stableInAppOrMovingBetweenSingleApp])
      {
        if (v80) {
          uint64_t v33 = 4;
        }
        else {
          uint64_t v33 = 3;
        }
        if (v77) {
          goto LABEL_30;
        }
      }
      else if (![(SBSwitcherLayoutTransitionNotes *)v22 fromAppToHomeScreen])
      {
        if ([(SBSwitcherLayoutTransitionNotes *)v22 stableInHomeScreen])
        {
          uint64_t v33 = 2;
LABEL_30:
          char v32 = 0;
          if ([(SBSwitcherLayoutTransitionNotes *)v22 movingToSingleApp]) {
            uint64_t v34 = 6;
          }
          else {
            uint64_t v34 = 4;
          }
          goto LABEL_40;
        }
        char v32 = ![(SBSwitcherLayoutTransitionNotes *)v22 inAnySwitcher];
LABEL_39:
        [(SBSwitcherLayoutTransitionNotes *)v22 movingToSingleApp];
        uint64_t v34 = 3;
        uint64_t v33 = 5;
LABEL_40:
        uint64_t v35 = 3;
        if (!v80) {
          uint64_t v35 = v34;
        }
        uint64_t v71 = v35;
LABEL_43:
        self->_needsOrientationReevaluation = v32;
        double v36 = [v15 elements];
        id v74 = v14;
        double v37 = [v14 elements];
        if ([v36 isEqual:v37])
        {
          uint64_t v38 = [v15 elements];
          BOOL v39 = [(SBSwitcherController *)self _areLayoutStateElements:v38 matchedWithAssociatedParticipants:self->_traitsParticipantsByElementIdentifier];

          if (v39)
          {
            id v40 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_traitsParticipantsByElementIdentifier];
            id v41 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_traitsDelegateByParticipant];
            uint64_t v42 = self->_primaryElementTraitsParticipantDelegate;
            goto LABEL_48;
          }
        }
        else
        {
        }
        traitsAssistant = self->_traitsAssistant;
        v44 = [v15 elements];
        id v82 = 0;
        id v83 = 0;
        id v81 = 0;
        [(SBSwitcherTraitsAssistant *)traitsAssistant createTraitsParticipantsForLayoutElements:v44 outParticipantsByElementIdentifier:&v83 outDelegatesByParticipant:&v82 outPrimaryDelegate:&v81];
        id v40 = v83;
        id v41 = v82;
        uint64_t v42 = (SBTraitsSceneParticipantDelegate *)v81;

LABEL_48:
        v73 = v15;
        arbiterActuationContext = self->_arbiterActuationContext;
        self->_arbiterActuationContext = 0;

        double v46 = SBLogTraitsArbiter();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          double v47 = SBStringFromSwitcherOrientationPolicy(v33);
          double v48 = SBStringFromSwitcherLiveOverlayOrientationPolicy(v34);
          *(_DWORD *)buf = 138543618;
          v85 = v47;
          __int16 v86 = 2114;
          v87 = v48;
          _os_log_impl(&dword_1D85BA000, v46, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] switcherPolicy[%{public}@ primaryOverlaysPolicy[%{public}@]", buf, 0x16u);
        }
        [(SBSwitcherTraitsAssistant *)self->_traitsAssistant updateAllParticipants:v41 withPrimaryDelegate:v42 nonPrimaryPolicy:v71 primaryPolicy:v34 ownPolicy:v33];
        int v49 = v76;
        if (v72 != 14) {
          int v49 = 1;
        }
        if (v49 == 1 && self->_arbiterActuationContext)
        {
          id v13 = v75;
          v50 = [v75 applicationContext];
          double v51 = self->_arbiterActuationContext;
          BOOL v52 = (v80 & 1) == 0 && [(SBSwitcherController *)self windowManagementStyle] != 2;
          [(SBSwitcherController *)self _updateAppTransitionContext:v50 withOrientationContext:v51 accountForSceneState:v52 primaryDelegate:v42];
        }
        else
        {
          id v13 = v75;
          if (!v80) {
            goto LABEL_64;
          }
          double v53 = [v75 applicationContext];
          char v54 = [v53 isInLiveResize];

          if (v54) {
            goto LABEL_64;
          }
          v55 = [(SBTraitsSceneParticipantDelegate *)self->_primaryElementTraitsParticipantDelegate scene];

          if (!v55) {
            goto LABEL_64;
          }
          int64_t v56 = [(SBSwitcherController *)self interfaceOrientation];
          int64_t v57 = [(TRAParticipant *)self->_traitsParticipant sbf_currentOrientation];
          if (v56 == v57) {
            goto LABEL_64;
          }
          int64_t v58 = v57;
          v50 = [v75 applicationContext];
          uint64_t v59 = +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:v56 toInterfaceOrientation:v58];
          [v50 setAnimationSettings:v59];
        }
LABEL_64:
        int64_t *v78 = [(TRAParticipant *)self->_traitsParticipant sbf_currentOrientation];
        id v15 = v73;
        v60 = [v73 elements];
        id *v79 = [(SBSwitcherController *)self _orientationsForLayoutStateElements:v60 withAssociatedParticipants:v40];

        v61 = SBLogTraitsArbiter();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          id v62 = [v13 applicationContext];
          __int16 v63 = [v62 animationSettings];
          [v63 duration];
          *(_DWORD *)buf = 134217984;
          v85 = v64;
          _os_log_impl(&dword_1D85BA000, v61, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] animation duration set to %.2f", buf, 0xCu);
        }
        __int16 v65 = SBLogTraitsArbiter();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          v66 = BSInterfaceOrientationDescription();
          id v67 = *v79;
          *(_DWORD *)buf = 138543618;
          v85 = v66;
          __int16 v86 = 2114;
          v87 = v67;
          _os_log_impl(&dword_1D85BA000, v65, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] outSwitcherOrientation: %{public}@, outElementsOrientations: %{public}@", buf, 0x16u);
        }
        [(SBSwitcherController *)self _noteLayoutStateEvaluationEndedWithParticipantsByElementIdentifiers:v40 delegatesByParticipant:v41 primaryDelegate:v42];

        id v14 = v74;
        goto LABEL_69;
      }
    }
    char v32 = 1;
    goto LABEL_39;
  }
LABEL_69:
}

- (BOOL)_isUnderUILock
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int64_t v3 = [WeakRetained uiLockStateProvider];
  char v4 = [v3 isUILocked];

  return v4;
}

- (id)_orientationsForLayoutStateElements:(id)a3 withAssociatedParticipants:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(SBSwitcherController *)self _elementsOrientationsForParticipantsByElementIdentifier:v8];
  BOOL v10 = [(SBSwitcherController *)self _areLayoutStateElements:v7 matchedWithAssociatedParticipants:v8];

  if (!v10)
  {
    uint64_t v11 = [v9 count];
    if (v11 != [v7 count])
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"SBSwitcherController.m", 1011, @"layout state elements and their interface orientations mapping are out of sync. [%@][%@]", v7, v9 object file lineNumber description];
    }
  }

  return v9;
}

- (BOOL)_areLayoutStateElements:(id)a3 matchedWithAssociatedParticipants:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  if (v7 == [v5 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "uniqueIdentifier", (void)v17);
          id v14 = [v6 objectForKey:v13];

          if (!v14)
          {
            BOOL v15 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v15 = 1;
LABEL_13:
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_noteLayoutStateEvaluationEndedWithParticipantsByElementIdentifiers:(id)a3 delegatesByParticipant:(id)a4 primaryDelegate:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = (NSDictionary *)a3;
  uint64_t v9 = (NSDictionary *)a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (self->_layoutStateEvaluationCounter == 1)
  {
    id v26 = v10;
    double v12 = [(NSDictionary *)v8 allValues];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = [(NSDictionary *)self->_traitsParticipantsByElementIdentifier allValues];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (([v12 containsObject:v18] & 1) == 0) {
            [v18 invalidate];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v15);
    }

    traitsParticipantsByElementIdentifier = self->_traitsParticipantsByElementIdentifier;
    self->_traitsParticipantsByElementIdentifier = v8;
    long long v20 = v8;

    traitsDelegateByParticipant = self->_traitsDelegateByParticipant;
    self->_traitsDelegateByParticipant = v9;
    id v8 = v9;

    objc_storeStrong((id *)&self->_primaryElementTraitsParticipantDelegate, a5);
    uint64_t v9 = v20;
    uint64_t v11 = v26;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v12 = [(NSDictionary *)v8 allValues];
    uint64_t v22 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * j) invalidate];
        }
        uint64_t v23 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v23);
    }
  }

  self->_evaluatingLayoutStateOrientation = 0;
  --self->_layoutStateEvaluationCounter;
}

- (id)_elementsOrientationsForParticipantsByElementIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    char v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v14);
          double v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "currentOrientation"));
          [v4 setObject:v12 forKey:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)_noteLayoutStateEvaluationBegan
{
  self->_evaluatingLayoutStateOrientation = 1;
}

void __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke_4(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 supportedOrientations];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 193))
  {
    if (v3) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v5 = 30;
    goto LABEL_11;
  }
  if (*(unsigned char *)(v4 + 177)) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v5 = [v9 supportedOrientations];
  if (v5 == 30)
  {
    [*(id *)(a1 + 40) currentOrientation];
    uint64_t v5 = SBFBSInterfaceOrientationMaskForBSInterfaceOrientation();
  }
LABEL_11:
  [v9 setSupportedOrientations:v5];
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 194)) {
    uint64_t v8 = [*(id *)(v7 + 256) _isVisible];
  }
  else {
    uint64_t v8 = 0;
  }
  [v9 setCanDetermineActiveOrientation:v8];
}

void __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setSupportedOrientations:", objc_msgSend(v2, "switcherSupportedInterfaceOrientations"));
}

- (unint64_t)switcherSupportedInterfaceOrientations
{
  int64_t panGestureRecognizerRequestedOrientation = self->_panGestureRecognizerRequestedOrientation;
  if (panGestureRecognizerRequestedOrientation) {
    return 1 << panGestureRecognizerRequestedOrientation;
  }
  else {
    return 30;
  }
}

- (BOOL)isMainSwitcherVisible
{
  v2 = [(SBSwitcherController *)self layoutState];
  BOOL v3 = [v2 unlockedEnvironmentMode] == 2;

  return v3;
}

- (id)_debugEventNameWithEventName:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@-%@", a3, self->_debugName];
}

- (NSString)toggleSwitcherEventName
{
  return (NSString *)[(SBSwitcherController *)self _debugEventNameWithEventName:@"ToggleSwitcherNoninteractive"];
}

- (NSString)activateSwitcherEventName
{
  return (NSString *)[(SBSwitcherController *)self _debugEventNameWithEventName:@"ActivateSwitcherNoninteractive"];
}

- (id)layoutStateSideElement
{
  v2 = [(SBSwitcherController *)self layoutState];
  BOOL v3 = [v2 elementWithRole:2];

  return v3;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionWillEndWithTransitionContext:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  uint64_t v7 = [(SBSwitcherController *)self switcherCoordinator];
  [v7 layoutStateTransitionCoordinator:v8 transitionWillEndWithTransitionContext:v6];

  [(SBSwitcherContentViewControlling *)self->_contentViewController layoutStateTransitionCoordinator:v8 transitionWillEndWithTransitionContext:v6];
}

- (id)_ancillaryTransitionRequestForTransitionRequest:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v7 = [v5 displayIdentity];
  id v8 = [WeakRetained _fbsDisplayIdentity];
  char v9 = [v7 isEqual:v8];

  if (v9) {
    goto LABEL_5;
  }
  uint64_t v10 = [v5 applicationContext];
  uint64_t v11 = [v10 layoutState];
  double v12 = [v11 elements];

  id v13 = [(SBSwitcherController *)self layoutState];
  long long v14 = [v13 elements];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke;
  v24[3] = &unk_1E6AF8260;
  id v15 = v12;
  id v25 = v15;
  long long v16 = objc_msgSend(v14, "bs_filter:", v24);
  uint64_t v17 = [v16 count];
  if (v17)
  {
    long long v18 = [SBMainWorkspaceTransitionRequest alloc];
    uint64_t v19 = [WeakRetained _fbsDisplayConfiguration];
    BOOL v3 = [(SBMainWorkspaceTransitionRequest *)v18 initWithDisplayConfiguration:v19];

    -[SBMainWorkspaceTransitionRequest setSource:](v3, "setSource:", [v5 source]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_3;
    v21[3] = &unk_1E6AF5638;
    id v22 = v13;
    id v23 = v16;
    [(SBWorkspaceTransitionRequest *)v3 modifyApplicationContext:v21];
  }
  if (!v17) {
LABEL_5:
  }
    BOOL v3 = 0;

  return v3;
}

- (int64_t)overrideInterfaceOrientationMechanicsForSwitcherViewController:(id)a3
{
  BOOL v3 = [(SBSwitcherController *)self contentViewController];
  uint64_t v4 = [v3 dataSource];
  int64_t v5 = [v4 switcherInterfaceOrientationForSwitcherContentController:v3];

  return v5;
}

- (int64_t)interfaceOrientation
{
  return [(SBSwitcherContentViewControlling *)self->_contentViewController contentOrientation];
}

- (id)coordinateSpaceForLayoutElement:(id)a3 layoutState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBSwitcherController *)self switcherWindow];
  char v9 = [v7 appLayout];
  uint64_t v10 = [v7 interfaceOrientationForLayoutElement:v6];
  if ([(SBSwitcherController *)self windowManagementStyle] == 2) {
    uint64_t v10 = [v7 interfaceOrientation];
  }
  -[SBSwitcherController referenceFrameForInterfaceOrientation:layoutRole:appLayout:](self, "referenceFrameForInterfaceOrientation:layoutRole:appLayout:", v10, [v6 layoutRole], v9);
  uint64_t v11 = +[SBSceneLayoutCoordinateSpace coordinateSpaceForFrame:withinCoordinateSpace:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForFrame:withinCoordinateSpace:", v8);
  double v12 = +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:", v10, v11, [v8 interfaceOrientation]);

  return v12;
}

- (id)coordinateSpaceForInterfaceOrientation:(int64_t)a3
{
  uint64_t v4 = [(SBSwitcherController *)self switcherWindow];
  int64_t v5 = +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:", a3, v4, [v4 interfaceOrientation]);

  return v5;
}

- (BOOL)isOnExtendedDisplay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  char v3 = [WeakRetained isExtendedDisplayWindowScene];

  return v3;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(SBSwitcherController *)self switcherCoordinator];
  [v7 layoutStateTransitionCoordinator:v18 transitionDidEndWithTransitionContext:v6];

  if (self->_isPublishedOrientationLocked)
  {
    self->_isPublishedOrientationLocked = 0;
    [(TRAParticipant *)self->_publisherTraitsParticipant setNeedsUpdatePreferencesWithReason:@"publisher unlock"];
  }
  [(SBSwitcherContentViewControlling *)self->_contentViewController layoutStateTransitionCoordinator:v18 transitionDidEndWithTransitionContext:v6];
  BOOL v8 = [(SBSwitcherController *)self isAnySwitcherVisible];
  suppressHidingProtectedAppsAssertion = self->_suppressHidingProtectedAppsAssertion;
  if (v8)
  {
    if (suppressHidingProtectedAppsAssertion) {
      goto LABEL_8;
    }
    uint64_t v10 = +[SBApplicationController sharedInstanceIfExists];
    uint64_t v11 = [v10 _appProtectionCoordinator];
    double v12 = NSString;
    id v13 = (objc_class *)objc_opt_class();
    long long v14 = NSStringFromClass(v13);
    id v15 = [v12 stringWithFormat:@"%@ - %p", v14, self];
    long long v16 = [v11 acquireSuppressHidingAppsAssertionForReason:v15];
    uint64_t v17 = self->_suppressHidingProtectedAppsAssertion;
    self->_suppressHidingProtectedAppsAssertion = v16;
  }
  else
  {
    [(BSInvalidatable *)suppressHidingProtectedAppsAssertion invalidate];
    uint64_t v10 = self->_suppressHidingProtectedAppsAssertion;
    self->_suppressHidingProtectedAppsAssertion = 0;
  }

LABEL_8:
}

- (BOOL)isFloatingSwitcherVisible
{
  v2 = [(SBSwitcherController *)self layoutState];
  char v3 = [v2 isFloatingSwitcherVisible];

  return v3;
}

- (BOOL)isAnySwitcherVisible
{
  if ([(SBSwitcherController *)self isMainSwitcherVisible]) {
    return 1;
  }
  return [(SBSwitcherController *)self isFloatingSwitcherVisible];
}

- (void)viewWillAppearForSwitcherViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBSwitcherController *)self switcherCoordinator];
  [v6 switcherControllerViewWillAppear:self animated:v4];
}

- (id)sceneHandleForLayoutElement:(id)a3
{
  if (self->_isInvalidated)
  {
    char v3 = 0;
  }
  else
  {
    char v3 = [(SBSwitcherController *)self _sceneHandleForLayoutElement:a3];
  }
  return v3;
}

- (id)_sceneHandleForLayoutElement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [v3 workspaceEntity];

  id v6 = SBSafeCast(v4, v5);

  uint64_t v7 = objc_opt_class();
  BOOL v8 = [v6 sceneHandle];
  char v9 = SBSafeCast(v7, v8);

  return v9;
}

- (CGRect)statusBarAvoidanceFrameForLayoutRole:(int64_t)a3 layoutState:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (a3 == 3) {
    [v6 floatingAppLayout];
  }
  else {
  BOOL v8 = [v6 appLayout];
  }
  if ([v7 unlockedEnvironmentMode] == 3 && objc_msgSend(v7, "layoutContainsRole:", a3))
  {
    uint64_t v9 = [v7 interfaceOrientationForLayoutRole:a3];
    if ([(SBSwitcherController *)self windowManagementStyle] == 2) {
      uint64_t v9 = [v7 interfaceOrientation];
    }
    [(SBSwitcherController *)self frameForItemWithRole:a3 inMainAppLayout:v8 interfaceOrientation:v9];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    +[SBNubView hitTestWidth];
    double v19 = v18;
    +[SBNubView height];
    double v21 = v20;
    v28.origin.x = v11;
    v28.origin.y = v13;
    v28.size.width = v15;
    v28.size.height = v17;
    double v22 = CGRectGetMidX(v28) + v19 * -0.5;
    double v23 = 0.0;
  }
  else
  {
    double v22 = *MEMORY[0x1E4F1DB28];
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v24 = v22;
  double v25 = v23;
  double v26 = v19;
  double v27 = v21;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (id)layoutElementSizingPoliciesForLayoutState:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 elements];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v24 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v5];
    uint64_t v22 = [v3 interfaceOrientation];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = [v3 elements];
    uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          double v10 = [v3 layoutAttributesForElement:v9];
          CGFloat v11 = +[SBDisplayItem displayItemForLayoutElement:v9];
          uint64_t v12 = [v10 sizingPolicy];
          uint64_t v13 = [v3 interfaceOrientationForLayoutElement:v9];
          displayItemFrameCalculator = self->_displayItemFrameCalculator;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
          uint64_t v16 = [(SBDisplayItemLayoutAttributesCalculator *)displayItemFrameCalculator sizingPolicyForDisplayItem:v11 contentOrientation:v13 containerOrientation:v22 proposedSizingPolicy:v12 windowScene:WeakRetained];

          CGFloat v17 = [NSNumber numberWithInteger:v16];
          double v18 = [v9 uniqueIdentifier];
          [v24 setValue:v17 forKey:v18];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (double)minimumHomeScreenScale
{
  [(SBSwitcherContentViewControlling *)self->_contentViewController minimumHomeScreenScale];
  return result;
}

- (SBSwitcherController)initWithWindowScene:(id)a3 debugName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)SBSwitcherController;
  BOOL v8 = [(SBSwitcherController *)&v43 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_windowScene, v6);
    objc_storeStrong((id *)&v9->_debugName, a4);
    double v10 = +[SBDefaults localDefaults];
    uint64_t v11 = [v10 appSwitcherDefaults];
    defaults = v9->_defaults;
    v9->_defaults = (SBAppSwitcherDefaults *)v11;

    uint64_t v13 = +[SBAppSwitcherDomain rootSettings];
    settings = v9->_settings;
    v9->_settings = (SBAppSwitcherSettings *)v13;

    [(PTSettings *)v9->_settings addKeyObserver:v9];
    v9->_medusaMultitaskingEnabled = [(SBAppSwitcherDefaults *)v9->_defaults medusaMultitaskingEnabled];
    v9->_chamoisMultitaskingEnabled = [(SBAppSwitcherDefaults *)v9->_defaults chamoisWindowingEnabled];
    CGFloat v15 = [[SBSwitcherViewController alloc] initWithNibName:0 bundle:0];
    switcherViewController = v9->_switcherViewController;
    v9->_switcherViewController = v15;

    [(SBSwitcherViewController *)v9->_switcherViewController setDelegate:v9];
    CGFloat v17 = objc_alloc_init(SBDisplayItemLayoutAttributesCalculator);
    displayItemFrameCalculator = v9->_displayItemFrameCalculator;
    v9->_displayItemFrameCalculator = v17;

    if ([v6 isMainDisplayWindowScene]
      && ([v6 isExternalDisplayWindowScene] & 1) == 0)
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F4E708]);
      [v19 setIdentifier:@"com.apple.SpringBoard.SBSwitcherController"];
      [v19 setEventMask:4095];
      [v19 setAttentionLostTimeout:2.0];
      double v20 = objc_alloc_init(SBAttentionAwarenessClient);
      idleTouchAwarenessClient = v9->_idleTouchAwarenessClient;
      v9->_idleTouchAwarenessClient = v20;

      [(SBAttentionAwarenessClient *)v9->_idleTouchAwarenessClient setConfiguration:v19];
      [(SBAttentionAwarenessClient *)v9->_idleTouchAwarenessClient setDelegate:v9];
    }
    uint64_t v22 = [v6 layoutStateTransitionCoordinator];
    [v22 setSceneEntityFrameProvider:v9];
    [v22 addObserver:v9];
    id v23 = objc_alloc(MEMORY[0x1E4FA6A68]);
    uint64_t v24 = [v23 initWithIdentifier:*MEMORY[0x1E4FA6F30]];
    displayLayoutElement = v9->_displayLayoutElement;
    v9->_displayLayoutElement = (SBSDisplayLayoutElement *)v24;

    [(SBSDisplayLayoutElement *)v9->_displayLayoutElement setLayoutRole:1];
    [(SBSDisplayLayoutElement *)v9->_displayLayoutElement setLevel:1];
    long long v26 = [v6 modalUIFluidDismissGestureManager];
    long long v27 = NSString;
    long long v28 = (objc_class *)objc_opt_class();
    long long v29 = NSStringFromClass(v28);
    uint64_t v30 = [v27 stringWithFormat:@"%@-%@", v29, v9->_debugName];
    uint64_t v31 = [v26 addObserver:v9 forReason:v30];
    modalUIFluidDismissalObserverInvalidatable = v9->_modalUIFluidDismissalObserverInvalidatable;
    v9->_modalUIFluidDismissalObserverInvalidatable = (BSInvalidatable *)v31;

    long long v33 = NSString;
    long long v34 = [(SBSwitcherController *)v9 stateCaptureTitlePreamble];
    uint64_t v35 = [v33 stringWithFormat:@"%@ - SBSwitcherController", v34];

    objc_initWeak(&location, v9);
    id v36 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v41, &location);
    uint64_t v37 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureInvalidatable = v9->_stateCaptureInvalidatable;
    v9->_stateCaptureInvalidatable = (BSInvalidatable *)v37;

    BOOL v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 addObserver:v9 selector:sel__updateContentViewControllerIfNeeded name:*MEMORY[0x1E4F43478] object:0];
    [v39 addObserver:v9 selector:sel__windowSceneCanvasSizeDidChange_ name:@"SBWindowSceneSessionRoleExternalDisplay" object:v6];
    [v39 addObserver:v9 selector:sel__workspaceMedusaCapabilityChanged_ name:@"SBWorkspaceMedusaCapabilityChangedNotification" object:0];

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  return v9;
}

id __54__SBSwitcherController_initWithWindowScene_debugName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _orientationStateDescription];

  return v2;
}

- (id)_orientationStateDescription
{
  v19[6] = *MEMORY[0x1E4F143B8];
  traitsParticipant = self->_traitsParticipant;
  if (traitsParticipant)
  {
    v18[0] = @"Switcher participant orientation";
    [(TRAParticipant *)traitsParticipant currentOrientation];
    uint64_t v4 = SBFStringForBSInterfaceOrientation();
    v19[0] = v4;
    v18[1] = @"Switcher orientation";
    [(SBSwitcherController *)self interfaceOrientation];
    uint64_t v5 = SBFStringForBSInterfaceOrientation();
    id v6 = (void *)v5;
    if (self->_traitsParticipantsByElementIdentifier) {
      traitsParticipantsByElementIdentifier = self->_traitsParticipantsByElementIdentifier;
    }
    else {
      traitsParticipantsByElementIdentifier = (NSDictionary *)@"None";
    }
    v19[1] = v5;
    v19[2] = traitsParticipantsByElementIdentifier;
    v18[2] = @"Layout elements participants";
    v18[3] = @"Participants orientations";
    uint64_t v8 = -[SBSwitcherController _elementsOrientationsForParticipantsByElementIdentifier:](self, "_elementsOrientationsForParticipantsByElementIdentifier:");
    uint64_t v9 = (void *)v8;
    if (v8) {
      double v10 = (__CFString *)v8;
    }
    else {
      double v10 = @"None";
    }
    v19[3] = v10;
    v18[4] = @"[Layout state] interface orientation";
    uint64_t v11 = [(SBSwitcherController *)self layoutState];
    [v11 interfaceOrientation];
    uint64_t v12 = SBFStringForBSInterfaceOrientation();
    uint64_t v13 = (void *)v12;
    v18[5] = @"Needs Orientation Reevaluation";
    if (self->_needsOrientationReevaluation) {
      double v14 = @"Yes";
    }
    else {
      double v14 = @"No";
    }
    v19[4] = v12;
    v19[5] = v14;
    CGFloat v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
    uint64_t v16 = [v15 description];
  }
  else
  {
    uint64_t v16 = @"waiting to be shown at least once";
  }
  return v16;
}

- (void)dealloc
{
  [(SBSwitcherController *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSwitcherController;
  [(SBSwitcherController *)&v3 dealloc];
}

- (void)_invalidate
{
  self->_isInvalidated = 1;
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PTSettings *)self->_settings removeKeyObserver:self];
  [(BSInvalidatable *)self->_modalUIFluidDismissalObserverInvalidatable invalidate];
  [(TRAParticipant *)self->_publisherTraitsParticipant invalidate];
  publisherTraitsParticipant = self->_publisherTraitsParticipant;
  self->_publisherTraitsParticipant = 0;

  [(TRAParticipant *)self->_traitsParticipant invalidate];
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

  [(SBSwitcherController *)self _invalidateLayoutElementsTraitsParticipants];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v8 = [WeakRetained layoutStateTransitionCoordinator];

  [v8 setSceneEntityFrameProvider:0];
  [v8 removeObserver:self];
  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  [(SBSwitcherController *)self _invalidateMedusaEducationBannerTimer];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:0];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setDelegate:0];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient invalidate];
  [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
  [(BSInvalidatable *)self->_suppressHidingProtectedAppsAssertion invalidate];
  suppressHidingProtectedAppsAssertion = self->_suppressHidingProtectedAppsAssertion;
  self->_suppressHidingProtectedAppsAssertion = 0;
}

- (void)willBeginCoordinationWithCoordinator:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_storeWeak((id *)&self->_switcherCoordinator, v4);
  objc_initWeak(&location, self);
  uint64_t v5 = [NSString stringWithUTF8String:"medusaMultitaskingEnabled"];
  v15[0] = v5;
  id v6 = [NSString stringWithUTF8String:"chamoisWindowingEnabled"];
  v15[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  defaults = self->_defaults;
  id v9 = MEMORY[0x1E4F14428];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__SBSwitcherController_willBeginCoordinationWithCoordinator___block_invoke;
  v12[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v13, &location);
  double v10 = [(SBAppSwitcherDefaults *)defaults observeDefaults:v7 onQueue:MEMORY[0x1E4F14428] withBlock:v12];
  multitaskingEnablementObserver = self->_multitaskingEnablementObserver;
  self->_multitaskingEnablementObserver = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __61__SBSwitcherController_willBeginCoordinationWithCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMultitaskingEnablementChange];
}

- (void)willEndCoordinationWithCoordinator:(id)a3
{
  [(BSDefaultObserver *)self->_multitaskingEnablementObserver invalidate];
  multitaskingEnablementObserver = self->_multitaskingEnablementObserver;
  self->_multitaskingEnablementObserver = 0;

  id v9 = [(SBSwitcherController *)self contentViewController];
  [v9 invalidate];
  [v9 willMoveToParentViewController:0];
  uint64_t v5 = [v9 view];
  [v5 removeFromSuperview];

  id v6 = [(SBSwitcherController *)self switcherViewController];
  [v6 removeChildViewController:v9];
  [v9 didMoveToParentViewController:0];
  id v7 = [v6 view];
  id v8 = [v7 window];
  [v8 setHidden:1];
  [v6 willMoveToParentViewController:0];
  [v7 removeFromSuperview];
  [v8 setRootViewController:0];
  [v6 didMoveToParentViewController:0];
}

- (void)didEndCoordinationWithCoordinator:(id)a3
{
  self->_needsOrientationReevaluation = 0;
  [(SBSwitcherController *)self _invalidate];
}

- (BOOL)isAutoLayoutEnabled
{
  return _os_feature_enabled_impl() ^ 1;
}

- (BOOL)isAdditiveModelEnabled
{
  return _os_feature_enabled_impl();
}

- (void)setChamoisMultitaskingEnabled:(BOOL)a3
{
  if (self->_chamoisMultitaskingEnabled != a3)
  {
    BOOL v3 = a3;
    id v7 = [(SBSwitcherController *)self switcherCoordinator];
    [v7 switcherControllerWillUpdateWindowManagementStyle:self];
    self->_chamoisMultitaskingEnabled = v3;
    uint64_t v5 = +[SBDefaults localDefaults];
    id v6 = [v5 appSwitcherDefaults];
    [v6 setChamoisWindowingEnabled:v3];

    [v7 switcherControllerDidUpdateWindowManagementStyle:self];
    [(SBFluidSwitcherGestureManager *)self->_gestureManager updateForWindowManagementStyle:[(SBSwitcherController *)self windowManagementStyle]];
  }
}

- (void)setMedusaMultitaskingEnabled:(BOOL)a3
{
  if (self->_medusaMultitaskingEnabled != a3)
  {
    BOOL v3 = a3;
    id v7 = [(SBSwitcherController *)self switcherCoordinator];
    [v7 switcherControllerWillUpdateWindowManagementStyle:self];
    self->_medusaMultitaskingEnabled = v3;
    uint64_t v5 = +[SBDefaults localDefaults];
    id v6 = [v5 appSwitcherDefaults];
    [v6 setMedusaMultitaskingEnabled:v3];

    [v7 switcherControllerDidUpdateWindowManagementStyle:self];
    [(SBFluidSwitcherGestureManager *)self->_gestureManager updateForWindowManagementStyle:[(SBSwitcherController *)self windowManagementStyle]];
  }
}

- (void)_handleMultitaskingEnablementChange
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBAppSwitcherDefaults *)self->_defaults chamoisWindowingEnabled];
  uint64_t v4 = [(SBAppSwitcherDefaults *)self->_defaults medusaMultitaskingEnabled];
  [(SBSwitcherController *)self setChamoisMultitaskingEnabled:v3];
  [(SBSwitcherController *)self setMedusaMultitaskingEnabled:v4];
  uint64_t v5 = [(SBSwitcherController *)self windowManagementStyle];
  [(SBSwitcherContentViewControlling *)self->_contentViewController noteWindowManagementStyleDidChange];
  id v6 = [(SBSwitcherController *)self layoutState];
  uint64_t v7 = [v6 unlockedEnvironmentMode];

  if (v7 == 3)
  {
    objc_initWeak(&location, self);
    id v8 = +[SBWorkspace mainWorkspace];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    double v10 = [WeakRetained _fbsDisplayConfiguration];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke;
    v21[3] = &__block_descriptor_40_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
    void v21[4] = v5;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_2;
    v19[3] = &unk_1E6B01338;
    objc_copyWeak(v20, &location);
    v20[1] = v5;
    [v8 requestTransitionWithOptions:0 displayConfiguration:v10 builder:v21 validator:v19];

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  uint64_t v23 = *MEMORY[0x1E4FA7620];
  v24[0] = &unk_1F334A0D0;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  uint64_t v12 = (void *)MEMORY[0x1E4FA5E78];
  id v13 = v11;
  double v14 = [v12 sharedInstance];
  [v14 emitEvent:60 withPayload:v13];

  CGFloat v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 postNotificationName:@"SBSwitcherControllerWindowManagementStyleDidChangeNotification" object:self];

  uint64_t v16 = dispatch_get_global_queue(-32768, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_104;
  v17[3] = &__block_descriptor_33_e5_v8__0l;
  char v18 = v3;
  dispatch_async(v16, v17);
}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:64];
  uint64_t v4 = NSString;
  NSStringFromSwitcherWindowManagementStyle(*(void *)(a1 + 32));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 stringWithFormat:@"WindowManagementStyleChangedTo%@", v6];
  [v3 setEventLabel:v5];
}

uint64_t __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained && (uint64_t v6 = [WeakRetained windowManagementStyle], v6 == *(void *)(a1 + 40)))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_3;
    v9[3] = &unk_1E6AFF430;
    v9[4] = v5;
    v9[5] = v6;
    [v3 modifyApplicationContext:v9];
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  switch(v5)
  {
    case 0:
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_3_100;
      v10[3] = &unk_1E6AF8788;
      id v11 = v3;
      SBLayoutRoleEnumerateValidRoles(v10);
      id v9 = v11;
LABEL_11:

      break;
    case 1:
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_2_98;
      v12[3] = &unk_1E6AF8788;
      id v13 = v3;
      SBLayoutRoleEnumerateValidRoles(v12);
      id v9 = v13;
      goto LABEL_11;
    case 2:
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v25 = 0;
      long long v26 = &v25;
      uint64_t v27 = 0x3032000000;
      long long v28 = __Block_byref_object_copy__49;
      long long v29 = __Block_byref_object_dispose__49;
      id v30 = 0;
      uint64_t v19 = 0;
      double v20 = &v19;
      uint64_t v21 = 0x3032000000;
      uint64_t v22 = __Block_byref_object_copy__49;
      uint64_t v23 = __Block_byref_object_dispose__49;
      id v24 = 0;
      uint64_t v7 = [*(id *)(a1 + 32) layoutState];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_96;
      v14[3] = &unk_1E6B01310;
      id v8 = v7;
      id v15 = v8;
      id v9 = v6;
      id v16 = v9;
      CGFloat v17 = &v25;
      char v18 = &v19;
      SBLayoutRoleEnumerateValidRoles(v14);
      [v4 setEntities:v9 withPolicy:0 centerEntity:0 floatingEntity:0];
      if (v26[5]) {
        objc_msgSend(v4, "_setRequestedFrontmostEntity:");
      }
      if (v20[5]) {
        objc_msgSend(v4, "_setRequestedFrontmostEntity:");
      }

      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v25, 8);

      goto LABEL_11;
  }
}

uint64_t __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_96(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) elementWithRole:a2];
  obuint64_t j = [v4 workspaceEntity];

  if (obj) {
    objc_msgSend(*(id *)(a1 + 40), "addObject:");
  }
  if (a2 == 4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  }
  if (a2 == 3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), obj);
  }
  return MEMORY[0x1F4181820]();
}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_2_98(uint64_t a1, uint64_t a2)
{
  if (a2 >= 5)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = +[SBWorkspaceEntity entity];
    [v3 setEntity:v4 forLayoutRole:a2];
  }
}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_3_100(uint64_t a1, uint64_t a2)
{
  if (a2 >= 2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = +[SBWorkspaceEntity entity];
    [v3 setEntity:v4 forLayoutRole:a2];
  }
}

void __59__SBSwitcherController__handleMultitaskingEnablementChange__block_invoke_104(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F50158]);
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  id v4 = (void *)[v2 initWithStarting:v3];

  uint64_t v5 = BiomeLibrary();
  id v6 = [v5 SpringBoard];
  uint64_t v7 = [v6 WindowManagement];
  id v8 = [v7 StageManagerMode];

  id v9 = [v8 source];
  [v9 sendEvent:v4];
  double v10 = SBLogBiome();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(unsigned __int8 *)(a1 + 32);
    v12[0] = 67109120;
    v12[1] = v11;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Donate stage manager enabled: %{BOOL}u", (uint8_t *)v12, 8u);
  }
}

- (NSString)dismissSwitcherEventName
{
  return (NSString *)[(SBSwitcherController *)self _debugEventNameWithEventName:@"DismissSwitcherNoninteractive"];
}

- (void)_setupSwitcherTraitsParticipantAndPolicySpecifiers
{
  if (!self->_traitsParticipant
    || ([MEMORY[0x1E4F28B00] currentHandler],
        int v11 = objc_claimAutoreleasedReturnValue(),
        [v11 handleFailureInMethod:a2, self, @"SBSwitcherController.m", 711, @"Invalid parameter not satisfying: %@", @"_traitsParticipant == nil" object file lineNumber description], v11, !self->_traitsParticipant))
  {
    if (!self->_isInvalidated)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      id v12 = [WeakRetained traitsArbiter];

      id v4 = [v12 acquireParticipantWithRole:@"SBTraitsParticipantRoleSwitcherRaw" delegate:self];
      traitsParticipant = self->_traitsParticipant;
      self->_traitsParticipant = v4;

      [(TRAParticipant *)self->_traitsParticipant setNeedsUpdatePreferencesWithReason:@"setup"];
      id v6 = [v12 acquireParticipantWithRole:@"SBTraitsParticipantRoleSwitcherPublisher" delegate:self];
      publisherTraitsParticipant = self->_publisherTraitsParticipant;
      self->_publisherTraitsParticipant = v6;

      id v8 = [[SBSwitcherTraitsAssistant alloc] initWithTraitsArbiter:v12 switcherParticipant:self->_traitsParticipant delegate:self];
      traitsAssistant = self->_traitsAssistant;
      self->_traitsAssistant = v8;
    }
  }
}

- (void)_invalidateLayoutElementsTraitsParticipants
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = [(NSDictionary *)self->_traitsParticipantsByElementIdentifier allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(NSDictionary *)self->_traitsDelegateByParticipant allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v12++) invalidate];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }

  [(SBTraitsSceneParticipantDelegate *)self->_primaryElementTraitsParticipantDelegate invalidate];
  primaryElementTraitsParticipantDelegate = self->_primaryElementTraitsParticipantDelegate;
  self->_primaryElementTraitsParticipantDelegate = 0;

  traitsParticipantsByElementIdentifier = self->_traitsParticipantsByElementIdentifier;
  self->_traitsParticipantsByElementIdentifier = 0;

  traitsDelegateByParticipant = self->_traitsDelegateByParticipant;
  self->_traitsDelegateByParticipant = 0;
}

- (id)stateCaptureTitlePreamble
{
  id v2 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v4 = [WeakRetained _sbDisplayConfiguration];
  uint64_t v5 = [v4 deviceName];
  uint64_t v6 = [v2 stringWithFormat:@"SpringBoard - SwitcherController - %@", v5];

  return v6;
}

- (id)traitsPipelineManager
{
  if (self->_isInvalidated)
  {
    id v2 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    id v2 = [WeakRetained traitsPipelineManager];
  }
  return v2;
}

- (double)contentContainerAspectRatio
{
  id v2 = [(SBSwitcherController *)self contentViewController];
  [v2 contentAspectRatio];
  double v4 = v3;

  return v4;
}

- (id)currentElementsParticipants
{
  return [(NSDictionary *)self->_traitsDelegateByParticipant allKeys];
}

- (id)sceneHandleForTraitsParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(NSDictionary *)self->_traitsDelegateByParticipant objectForKey:v4];

  uint64_t v7 = [v6 sceneHandle];
  id v8 = SBSafeCast(v5, v7);

  return v8;
}

- (void)actuateOrientationForTraitsDelegate:(id)a3 withContext:(id)a4 reasons:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v11 = [(SBSwitcherController *)self _liveOverlayForTraitsDelegate:v9];
  uint64_t v10 = [v11 prepareOverlayForContentRotation];
  [(SBSwitcherController *)self updateOrientationForTraitsDelegate:v9 withUpdateReasons:a5 suggestedAnimator:v10 actuationContext:v8];
}

uint64_t __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPreferredZOrderLevel:*MEMORY[0x1E4F43F20] + 5.0];
}

uint64_t __64__SBSwitcherController_updatePreferencesForParticipant_updater___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setPreferredZOrderLevel:*MEMORY[0x1E4F43F20] + 5.0 + 0.01];
}

- (void)didChangeSettingsForParticipant:(id)a3 context:(id)a4
{
  uint64_t v6 = (TRAParticipant *)a3;
  id v7 = a4;
  if (self->_publisherTraitsParticipant != v6)
  {
    id v8 = [(TRAParticipant *)v6 sbf_currentOrientation];
    if (v8 != (void *)[(SBSwitcherController *)self interfaceOrientation])
    {
      id v9 = [v7 orientationActuationContext];
      arbiterActuationContext = self->_arbiterActuationContext;
      self->_arbiterActuationContext = v9;

      objc_initWeak(&location, self);
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      double v14 = __64__SBSwitcherController_didChangeSettingsForParticipant_context___block_invoke;
      id v15 = &unk_1E6B01388;
      objc_copyWeak(v17, &location);
      long long v16 = v6;
      v17[1] = v8;
      id v11 = (void *)MEMORY[0x1D948C7A0](&v12);
      [(SBSwitcherController *)self _enqueueOrientationTransitionWithActuationContext:self->_arbiterActuationContext, 0, 0, v11, @"SBSwitcherControllerEventLabelSwitcherParticipantUpdate", v12, v13, v14, v15 suggestedAnimator completionTask validator label];

      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __64__SBSwitcherController_didChangeSettingsForParticipant_context___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_10;
  }
  id v3 = *(id *)(a1 + 32);
  if (v3 == WeakRetained[14])
  {
    if ([WeakRetained[32] isHidden])
    {
LABEL_10:
      uint64_t v9 = 0;
      goto LABEL_16;
    }
    id v3 = *(id *)(a1 + 32);
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 != objc_msgSend(v3, "sbf_currentOrientation")) {
    goto LABEL_10;
  }
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v10 = v8;

  if (*(id *)(a1 + 32) == WeakRetained[14])
  {
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v9 = v11 != [WeakRetained interfaceOrientation];
  }
  else
  {
    uint64_t v9 = [v10 needsActuationForUpdateReasons:2];
  }

LABEL_16:
  return v9;
}

- (void)updateOrientationForTraitsDelegate:(id)a3 withUpdateReasons:(int64_t)a4 suggestedAnimator:(id)a5 actuationContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4 != 4)
  {
    objc_initWeak(&location, self);
    uint64_t v13 = [v10 participant];
    double v14 = (void *)[v13 currentOrientation];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __112__SBSwitcherController_updateOrientationForTraitsDelegate_withUpdateReasons_suggestedAnimator_actuationContext___block_invoke;
    v16[3] = &unk_1E6B013B0;
    objc_copyWeak(v18, &location);
    v18[1] = v14;
    id v17 = v10;
    v18[2] = (id)a4;
    id v15 = (void *)MEMORY[0x1D948C7A0](v16);
    [(SBSwitcherController *)self _enqueueOrientationTransitionWithActuationContext:v12 suggestedAnimator:v11 completionTask:0 validator:v15 label:@"SBSwitcherControllerEventLabelLiveOverlayParticipantUpdate"];

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
}

uint64_t __112__SBSwitcherController_updateOrientationForTraitsDelegate_withUpdateReasons_suggestedAnimator_actuationContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained
    && !*((unsigned char *)WeakRetained + 177)
    && (uint64_t v4 = *(void *)(a1 + 48),
        [*(id *)(a1 + 32) participant],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 currentOrientation],
        v5,
        v4 == v6))
  {
    uint64_t v7 = [*(id *)(a1 + 32) needsActuationForUpdateReasons:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_enqueueOrientationTransitionWithActuationContext:(id)a3 suggestedAnimator:(id)a4 completionTask:(id)a5 validator:(id)a6 label:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v16 = SBLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v15;
    _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] Enqueued event %@.", buf, 0xCu);
  }

  id v17 = [(SBSwitcherController *)self windowScene];
  long long v18 = [v17 _sbDisplayConfiguration];

  long long v19 = +[SBWorkspace mainWorkspace];
  long long v20 = [v19 createRequestWithOptions:0 displayConfiguration:v18];

  [v20 setSource:14];
  long long v21 = [NSString stringWithFormat:@"%@-%ld", v15, _enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label__eventLabelGeneration];
  [v20 setEventLabel:v21];

  ++_enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label__eventLabelGeneration;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke;
  v34[3] = &unk_1E6B013D8;
  id v22 = v12;
  id v35 = v22;
  [v20 setTransactionProvider:v34];
  if (v13)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke_2;
    v32[3] = &unk_1E6AF5A50;
    id v33 = v13;
    id v23 = (id)[v20 addCompletionHandler:v32];
  }
  objc_initWeak((id *)buf, self);
  id v24 = +[SBWorkspace mainWorkspace];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke_3;
  v28[3] = &unk_1E6AFF908;
  objc_copyWeak(&v31, (id *)buf);
  id v25 = v14;
  id v30 = v25;
  id v26 = v27;
  id v29 = v26;
  [v24 executeTransitionRequest:v20 withValidator:v28];

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

SBRotateScenesWorkspaceTransaction *__123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(SBAppToAppWorkspaceTransaction *)[SBRotateScenesWorkspaceTransaction alloc] initWithTransitionRequest:v3];

  [(SBWorkspaceTransaction *)v4 setSuggestedAnimationController:*(void *)(a1 + 32)];
  return v4;
}

uint64_t __123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __123__SBSwitcherController__enqueueOrientationTransitionWithActuationContext_suggestedAnimator_completionTask_validator_label___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (!WeakRetained
    || WeakRetained[177]
    || ([WeakRetained _isUnderUILock] & 1) != 0
    || (uint64_t v6 = *(void *)(a1 + 40)) != 0 && !(*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v3))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [v3 applicationContext];
    [v5 _updateAppTransitionContext:v7 withOrientationActuationContext:*(void *)(a1 + 32)];

    uint64_t v8 = 1;
  }

  return v8;
}

- (void)appendDescriptionForParticipant:(id)a3 withBuilder:(id)a4 multilinePrefix:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  id v20[2] = __84__SBSwitcherController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke;
  v20[3] = &unk_1E6AF4E00;
  v20[4] = self;
  id v11 = v8;
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  [v12 appendBodySectionWithName:@"Associated Windows" multilinePrefix:v10 block:v20];
  id v13 = [(SBSwitcherController *)self participantAssociatedSceneIdentityTokens:v11];
  id v14 = v13;
  if (v13)
  {
    id v15 = objc_msgSend(v13, "bs_map:", &__block_literal_global_160_0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    id v17[2] = __84__SBSwitcherController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_3;
    v17[3] = &unk_1E6AF5290;
    id v18 = v12;
    id v19 = v15;
    id v16 = v15;
    [v18 appendBodySectionWithName:@"Associated Scenes" multilinePrefix:v10 block:v17];
  }
}

void __84__SBSwitcherController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) participantAssociatedWindows:*(void *)(a1 + 40)];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v17 + 1) + 8 * v3);
        uint64_t v5 = *(void **)(a1 + 48);
        uint64_t v6 = NSString;
        uint64_t v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        id v9 = [v4 _debugName];
        if ([v4 isHidden]) {
          id v10 = @"NO";
        }
        else {
          id v10 = @"YES";
        }
        [v4 interfaceOrientation];
        id v11 = BSInterfaceOrientationDescription();
        id v12 = [v4 rootViewController];
        objc_msgSend(v6, "stringWithFormat:", @"<%@: %p; %@>; Visible:%@; Orientation:%@; Root VC: %@",
          v8,
          v4,
          v9,
          v10,
          v11,
        id v13 = v12);
        [v5 appendString:v13 withName:0];

        ++v3;
      }
      while (v2 != v3);
      uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v2);
  }
}

uint64_t __84__SBSwitcherController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stringRepresentation];
}

uint64_t __84__SBSwitcherController_appendDescriptionForParticipant_withBuilder_multilinePrefix___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendArraySection:*(void *)(a1 + 40) withName:@"Associated Scene Tokens" skipIfEmpty:0];
}

- (id)participantAssociatedWindows:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBSwitcherController *)self switcherWindow];
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)participantAssociatedSceneIdentityTokens:(id)a3
{
  uint64_t v3 = [(SBSwitcherController *)self contentViewController];
  uint64_t v4 = [v3 liveScenesIdentityTokens];

  return v4;
}

- (void)_updateAppTransitionContext:(id)a3 withOrientationActuationContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SBSwitcherController *)self _updateAppTransitionContext:v7 withOrientationContext:v6 accountForSceneState:[(SBSwitcherController *)self windowManagementStyle] != 2 primaryDelegate:self->_primaryElementTraitsParticipantDelegate];
}

- (void)_updateAppTransitionContext:(id)a3 withOrientationContext:(id)a4 accountForSceneState:(BOOL)a5 primaryDelegate:(id)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int64_t v13 = [(SBSwitcherController *)self interfaceOrientation];
  int64_t v14 = [(TRAParticipant *)self->_traitsParticipant sbf_currentOrientation];
  uint64_t v15 = [v12 sceneCurrentOrientation];

  BOOL v16 = v15 == v14 && v7;
  uint64_t v17 = [v11 preventTouchCancellation];
  int v18 = [v10 animationDisabled];
  int v19 = [(SBMainSwitcherWindow *)self->_switcherWindow isHidden];
  BOOL v20 = [(SBSwitcherController *)self _isUnderUILock];
  BOOL v21 = v20;
  if ((v18 & 1) != 0 || (v19 & 1) != 0 || v20 || v16)
  {
    int64_t v28 = v13;
    uint64_t v22 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.0];
    id v23 = SBLogTraitsArbiter();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      int v30 = v18;
      __int16 v31 = 1024;
      int v32 = v19;
      __int16 v33 = 1024;
      BOOL v34 = v21;
      __int16 v35 = 1024;
      BOOL v36 = v16;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "[SwitcherOrientation] animation duration set to zero. animationDisabled{%{BOOL}u}, isWindowHidden{%{BOOL}u}, isWindowHidden{%{BOOL}u}, isSceneInFinalStateAlready{%{BOOL}u}", buf, 0x1Au);
    }

    int64_t v13 = v28;
  }
  else
  {
    uint64_t v22 = +[SBAnimationUtilities animationSettingsForRotationFromOrientation:v13 toOrientation:v14 withContext:v11];
  }
  [v10 setInterfaceOrientation:v14];
  [v10 setAnimationSettings:v22];
  [v10 setPrefersTouchCancellationDisabled:v17];
  id v24 = [v11 drawingFence];
  [v10 setAnimationFence:v24];

  id v25 = [v11 drawingFence];
  if (v25) {
    BOOL v26 = 0;
  }
  else {
    BOOL v26 = v13 == v14;
  }
  uint64_t v27 = !v26;
  [v10 setFencesAnimations:v27];
}

- (int64_t)interfaceOrientationForLayoutElement:(id)a3
{
  uint64_t v4 = [a3 uniqueIdentifier];
  int64_t v5 = [(SBSwitcherController *)self _interfaceOrientationForLayoutElementIdentifier:v4];

  return v5;
}

- (id)_liveOverlayForTraitsDelegate:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 scene];
  id v6 = [v4 sceneHandle];

  if (v5)
  {
    BOOL v7 = [(SBSwitcherController *)self contentViewController];
    id v8 = [v5 identityToken];
    id v9 = [v7 liveOverlayForSceneIdentityToken:v8];

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    BOOL v7 = [(SBSwitcherController *)self contentViewController];
    id v9 = [v7 liveOverlayForSceneHandle:v6];
    goto LABEL_5;
  }
  id v9 = 0;
LABEL_6:

  return v9;
}

- (void)_attemptContentViewInterfaceOrientationUpdateForPanGesture:(int64_t)a3
{
  [(SBSwitcherController *)self switcherSupportedInterfaceOrientations];
  if (!SBFInterfaceOrientationMaskContainsInterfaceOrientation()) {
    return;
  }
  self->_int64_t panGestureRecognizerRequestedOrientation = a3;
  int v6 = __sb__runningInSpringBoard();
  char v7 = v6;
  if (v6)
  {
    if (SBFEffectiveDeviceClass() == 2) {
      goto LABEL_16;
    }
LABEL_8:
    contentViewController = self->_contentViewController;
    uint64_t v9 = objc_opt_class();
    id v10 = contentViewController;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v12 = v11;

    uint64_t v13 = [(SBSwitcherContentViewControlling *)v12 homeAffordanceOrientationIfMismatchedFromCurrentLayoutState];
    if ((v7 & 1) == 0) {

    }
    if (v13) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v3 userInterfaceIdiom] != 1) {
    goto LABEL_8;
  }

LABEL_16:
  [(TRAParticipant *)self->_traitsParticipant setNeedsUpdatePreferencesWithReason:@"pan gesture recognizer" animate:0];
LABEL_17:
  [(SBSwitcherController *)self _updateContentViewInterfaceOrientation:a3];
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  char v7 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  LOBYTE(a3) = [v7 canPerformKeyboardShortcutAction:a3 forBundleIdentifier:v6 windowScene:WeakRetained];

  return a3;
}

- (void)performKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v8 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v8 performKeyboardShortcutAction:a3 forBundleIdentifier:v6 windowScene:WeakRetained];
}

- (BOOL)shouldMorphFromPIPForTransitionContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBSwitcherController *)self contentViewController];
  id v6 = [v5 dataSource];
  char v7 = [(SBSwitcherController *)self contentViewController];
  char v8 = [v6 switcherContentController:v7 shouldMorphFromPIPForTransitionContext:v4];

  return v8;
}

- (BOOL)shouldMorphToPIPForTransitionContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SBSwitcherController *)self contentViewController];
  id v6 = [v5 dataSource];
  char v7 = [(SBSwitcherController *)self contentViewController];
  char v8 = [v6 switcherContentController:v7 shouldMorphToPIPForTransitionContext:v4];

  return v8;
}

- (id)requestInAppStatusBarHiddenAssertionForReason:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_initWeak(&location, self);
  char v7 = [SBInAppStatusBarHiddenAssertion alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__SBSwitcherController_requestInAppStatusBarHiddenAssertionForReason_animated___block_invoke;
  v10[3] = &unk_1E6B01420;
  objc_copyWeak(&v11, &location);
  BOOL v12 = v4;
  char v8 = [(SBInAppStatusBarHiddenAssertion *)v7 initWithIdentifier:@"SBSwitcherController.HideStatusBar" forReason:v6 invalidationBlock:v10];
  [(SBSwitcherController *)self _addInAppStatusBarHiddenAssertion:v8 animated:v4];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v8;
}

void __79__SBSwitcherController_requestInAppStatusBarHiddenAssertionForReason_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _removeInAppStatusBarHiddenAssertion:v4 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isInAppStatusBarHidden
{
  contentViewController = self->_contentViewController;
  uint64_t v3 = [(SBSwitcherController *)self _currentMainAppLayout];
  LOBYTE(contentViewController) = [(SBSwitcherContentViewControlling *)contentViewController isStatusBarHiddenForAppLayout:v3];

  return (char)contentViewController;
}

- (CGRect)statusBarAvoidanceFrameForLayoutRole:(int64_t)a3
{
  int64_t v5 = [(SBSwitcherController *)self _currentLayoutState];
  [(SBSwitcherController *)self statusBarAvoidanceFrameForLayoutRole:a3 layoutState:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (UIEdgeInsets)statusBarEdgeInsets
{
  if ([(SBSwitcherController *)self windowManagementStyle] == 1)
  {
    double v6 = [(SBSwitcherController *)self _currentLayoutState];
    double v7 = [(SBSwitcherController *)self _currentMainAppLayout];
    if ([(SBSwitcherController *)self unlockedEnvironmentMode] == 3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      double v9 = [WeakRetained _fbsDisplayConfiguration];

      uint64_t v10 = [v6 interfaceOrientation];
      double v11 = [(SBSwitcherController *)self leadingStatusBarStyleRequest];
      double v12 = +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:v10 withReferenceCoordinateSpace:self->_switcherWindow inOrientation:[(SBMainSwitcherWindow *)self->_switcherWindow interfaceOrientation]];
      [v12 bounds];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;

      uint64_t v45 = 0;
      double v46 = (CGRect *)&v45;
      uint64_t v47 = 0x4010000000;
      double v48 = &unk_1D90ED3C6;
      BOOL v21 = (CGRect *)MEMORY[0x1E4F1DB28];
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      long long v49 = *MEMORY[0x1E4F1DB28];
      long long v50 = v22;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __43__SBSwitcherController_statusBarEdgeInsets__block_invoke;
      v33[3] = &unk_1E6B01448;
      id v23 = v6;
      id v34 = v23;
      id v24 = v7;
      id v35 = v24;
      BOOL v36 = self;
      id v25 = v9;
      id v37 = v25;
      uint64_t v40 = v10;
      id v26 = v11;
      CGFloat v41 = v14;
      CGFloat v42 = v16;
      CGFloat v43 = v18;
      CGFloat v44 = v20;
      id v38 = v26;
      BOOL v39 = &v45;
      SBLayoutRoleEnumerateAppLayoutRoles(v33);
      BOOL v27 = CGRectEqualToRect(v46[1], *v21);
      if (!v27)
      {
        CGFloat MinY = CGRectGetMinY(v46[1]);
        CGFloat MinX = CGRectGetMinX(v46[1]);
        v51.origin.x = v14;
        v51.origin.y = v16;
        v51.size.width = v18;
        v51.size.height = v20;
        double Width = CGRectGetWidth(v51);
        double v4 = Width - CGRectGetMaxX(v46[1]);
      }

      _Block_object_dispose(&v45, 8);
      if (!v27)
      {

        double v29 = 0.0;
        goto LABEL_8;
      }
    }
  }
  CGFloat MinY = *MEMORY[0x1E4F437F8];
  CGFloat MinX = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v29 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 24);
LABEL_8:
  double v30 = MinY;
  double v31 = MinX;
  double v32 = v4;
  result.right = v32;
  result.bottom = v29;
  result.left = v31;
  result.top = v30;
  return result;
}

void __43__SBSwitcherController_statusBarEdgeInsets__block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = [*(id *)(a1 + 32) elementWithRole:a2];

  if (v4)
  {
    id v10 = [*(id *)(a1 + 40) itemForLayoutRole:a2];
    int64_t v5 = [*(id *)(a1 + 48) _deviceApplicationSceneHandleForDisplayItem:v10];
    +[SBUIController statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:](SBUIController, "statusBarFrameForDeviceApplicationSceneHandle:displayConfiguration:interfaceOrientation:statusBarStyleRequest:withinBounds:inReferenceSpace:", v5, *(void *)(a1 + 56), *(void *)(a1 + 80), *(void *)(a1 + 64), 0, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
    v12.origin.x = v6;
    v12.origin.y = v7;
    v12.size.width = v8;
    v12.size.height = v9;
    *(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8)+ 32), v12);
  }
}

- (id)leadingStatusBarStyleRequest
{
  if ([(SBSwitcherController *)self unlockedEnvironmentMode] == 3)
  {
    uint64_t v3 = [(SBSwitcherContentViewControlling *)self->_contentViewController leadingStatusBarStyleRequest];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)trailingStatusBarStyleRequest
{
  if ([(SBSwitcherController *)self unlockedEnvironmentMode] == 3)
  {
    uint64_t v3 = [(SBSwitcherContentViewControlling *)self->_contentViewController trailingStatusBarStyleRequest];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)statusBarOverlayData
{
  if ([(SBSwitcherController *)self unlockedEnvironmentMode] == 3)
  {
    uint64_t v3 = [(SBSwitcherController *)self _currentMainAppLayout];
    double v4 = [v3 itemForLayoutRole:1];

    int64_t v5 = [(SBSwitcherController *)self _deviceApplicationSceneHandleForDisplayItem:v4];
    CGFloat v6 = [v5 breadcrumbProvider];
    if ([v6 hasBreadcrumb])
    {
      CGFloat v7 = [v5 overlayStatusBarData];
    }
    else
    {
      CGFloat v7 = 0;
    }
  }
  else
  {
    CGFloat v7 = 0;
  }
  return v7;
}

- (id)statusBarActionsByPartIdentifier
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if ([(SBSwitcherController *)self unlockedEnvironmentMode] == 3)
  {
    uint64_t v3 = [(SBSwitcherController *)self _currentMainAppLayout];
    double v4 = [v3 itemForLayoutRole:1];

    int64_t v5 = [(SBSwitcherController *)self _deviceApplicationSceneHandleForDisplayItem:v4];
    CGFloat v6 = [v5 breadcrumbProvider];
    if ([v6 hasBreadcrumb])
    {
      uint64_t v7 = *MEMORY[0x1E4F44198];
      id v17 = v6;
      uint64_t v18 = v7;
      CGFloat v8 = (void *)MEMORY[0x1E4F43310];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      double v15 = __56__SBSwitcherController_statusBarActionsByPartIdentifier__block_invoke;
      CGFloat v16 = &unk_1E6AFE270;
      id v9 = v6;
      id v10 = [v8 actionWithBlock:&v13];
      v19[0] = v10;
      double v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1, v13, v14, v15, v16);
    }
    else
    {
      double v11 = 0;
    }
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

uint64_t __56__SBSwitcherController_statusBarActionsByPartIdentifier__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateBreadcrumbIfPossible];
}

- (void)_addInAppStatusBarHiddenAssertion:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  inAppStatusBarHiddenAssertions = self->_inAppStatusBarHiddenAssertions;
  id v10 = v6;
  if (!inAppStatusBarHiddenAssertions)
  {
    CGFloat v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v9 = self->_inAppStatusBarHiddenAssertions;
    self->_inAppStatusBarHiddenAssertions = v8;

    id v6 = v10;
    inAppStatusBarHiddenAssertions = self->_inAppStatusBarHiddenAssertions;
  }
  [(NSHashTable *)inAppStatusBarHiddenAssertions addObject:v6];
  if ([(NSHashTable *)self->_inAppStatusBarHiddenAssertions count] == 1) {
    [(SBSwitcherContentViewControlling *)self->_contentViewController respondToInAppStatusBarRequestedHiddenUpdateAnimated:v4];
  }
}

- (void)_removeInAppStatusBarHiddenAssertion:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(NSHashTable *)self->_inAppStatusBarHiddenAssertions removeObject:a3];
  if (![(NSHashTable *)self->_inAppStatusBarHiddenAssertions count])
  {
    inAppStatusBarHiddenAssertions = self->_inAppStatusBarHiddenAssertions;
    self->_inAppStatusBarHiddenAssertions = 0;

    contentViewController = self->_contentViewController;
    [(SBSwitcherContentViewControlling *)contentViewController respondToInAppStatusBarRequestedHiddenUpdateAnimated:v4];
  }
}

- (CGRect)frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4
{
  displayItemFrameCalculator = self->_displayItemFrameCalculator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [(SBDisplayItemLayoutAttributesCalculator *)displayItemFrameCalculator frameForFloatingAppLayoutInInterfaceOrientation:a3 floatingConfiguration:a4 windowScene:WeakRetained];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  displayItemFrameCalculator = self->_displayItemFrameCalculator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [(SBDisplayItemLayoutAttributesCalculator *)displayItemFrameCalculator frameForCenterItemWithConfiguration:a3 interfaceOrientation:a4 windowScene:WeakRetained];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)referenceFrameForInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    double v8 = [WeakRetained _fbsDisplayConfiguration];
    [v8 bounds];

    [(SBSwitcherController *)self frameForFloatingAppLayoutInInterfaceOrientation:a3 floatingConfiguration:a4];
    _UIWindowConvertRectFromOrientationToOrientation();
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)referenceFrameForInterfaceOrientation:(int64_t)a3 centerConfiguration:(int64_t)a4
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    double v8 = [WeakRetained _fbsDisplayConfiguration];
    [v8 bounds];

    [(SBSwitcherController *)self frameForCenterItemWithConfiguration:a4 interfaceOrientation:a3];
    _UIWindowConvertRectFromOrientationToOrientation();
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

BOOL __57__SBSwitcherController__reevaluateOrientationIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v2 = WeakRetained[178] != 0;
    WeakRetained[178] = 0;
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (BOOL)isInAnyPeekState
{
  BOOL v2 = [(SBSwitcherController *)self _currentLayoutState];
  BOOL IsValid = SBPeekConfigurationIsValid([v2 peekConfiguration]);

  return IsValid;
}

- (BOOL)isAnyProtectedHiddenApplicationVisible
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(SBSwitcherController *)self _currentMainAppLayout];
  int64_t v5 = [v4 allItems];
  [v3 addObjectsFromArray:v5];

  id v6 = [(SBSwitcherController *)self _currentFloatingAppLayout];
  uint64_t v7 = [v6 allItems];
  [v3 addObjectsFromArray:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        double v12 = (void *)MEMORY[0x1E4F4B7E0];
        double v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "bundleIdentifier", (void)v17);
        double v14 = [v12 applicationWithBundleIdentifier:v13];
        char v15 = [v14 isHidden];

        if (v15)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)layoutStateStudyLogData
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [(SBSwitcherController *)self layoutState];
  BOOL v4 = v3;
  if (v3)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = [v3 elements];
    uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v28 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v28) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v9 = [v8 layoutRole];
          uint64_t v10 = [v4 floatingConfiguration];
          if (v9 == 3)
          {
            uint64_t v11 = v10;
            if (SBFloatingConfigurationIsStashed(v10) || !SBFloatingConfigurationIsValid(v11)) {
              continue;
            }
          }
          double v12 = [v8 workspaceEntity];
          double v13 = [v12 applicationSceneEntity];
          [v13 sceneHandle];
          v15 = double v14 = v4;
          double v16 = [v15 application];
          uint64_t v17 = [v16 bundleIdentifier];
          long long v18 = (void *)v17;
          if (v17) {
            long long v19 = (__CFString *)v17;
          }
          else {
            long long v19 = @"Unknown";
          }
          long long v20 = SBLayoutRoleDescription(v9);
          [v27 setObject:v19 forKeyedSubscript:v20];

          BOOL v4 = v14;
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v6);
    }

    BOOL v21 = SBStringForSpaceConfiguration([v4 spaceConfiguration]);
    [v27 setObject:v21 forKeyedSubscript:@"SpaceConfiguration"];

    uint64_t v22 = SBStringForFloatingConfiguration([v4 floatingConfiguration]);
    [v27 setObject:v22 forKeyedSubscript:@"FloatingConfiguration"];

    id v23 = SBStringForCenterConfiguration([v4 centerConfiguration]);
    [v27 setObject:v23 forKeyedSubscript:@"CenterConfiguration"];

    id v24 = SBStringForPeekConfiguration([v4 peekConfiguration]);
    [v27 setObject:v24 forKeyedSubscript:@"PeekConfiguration"];
  }
  return v27;
}

- (id)entityWithRole:(int64_t)a3
{
  BOOL v4 = [(SBSwitcherController *)self layoutState];
  uint64_t v5 = [v4 elementWithRole:a3];
  uint64_t v6 = [v5 workspaceEntity];

  return v6;
}

- (int64_t)floatingConfiguration
{
  BOOL v2 = [(SBSwitcherController *)self layoutState];
  int64_t v3 = [v2 floatingConfiguration];

  return v3;
}

- (id)activeAndVisibleSceneIdentifiersForApplication:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = [(SBSwitcherController *)self layoutState];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__SBSwitcherController_activeAndVisibleSceneIdentifiersForApplication___block_invoke;
  v13[3] = &unk_1E6B00330;
  id v14 = v6;
  id v15 = v4;
  id v7 = v5;
  id v16 = v7;
  id v8 = v4;
  id v9 = v6;
  SBLayoutRoleEnumerateValidRoles(v13);
  uint64_t v10 = v16;
  id v11 = v7;

  return v11;
}

void __71__SBSwitcherController_activeAndVisibleSceneIdentifiersForApplication___block_invoke(uint64_t a1, uint64_t a2)
{
  id v12 = [*(id *)(a1 + 32) elementWithRole:a2];
  int64_t v3 = [v12 workspaceEntity];
  id v4 = [v3 applicationSceneEntity];

  id v5 = [v4 application];
  uint64_t v6 = [v5 bundleIdentifier];
  id v7 = [*(id *)(a1 + 40) bundleIdentifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = *(void **)(a1 + 48);
    uint64_t v10 = [v4 sceneHandle];
    id v11 = [v10 sceneIdentifier];
    [v9 addObject:v11];
  }
}

- (id)activeTransientOverlayPresentedAppLayout
{
  int64_t v3 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v5 = [v3 activeTransientOverlayPresentedAppLayoutForWindowScene:WeakRetained];

  return v5;
}

- (id)appLayoutForWorkspaceTransientOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v7 = [v5 appLayoutForWorkspaceTransientOverlay:v4 windowScene:WeakRetained];

  return v7;
}

- (id)createWorkspaceTransientOverlayForAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v7 = [v5 createWorkspaceTransientOverlayForAppLayout:v4 windowScene:WeakRetained];

  return v7;
}

- (void)addAppLayoutForTransientOverlayViewController:(id)a3
{
  id v4 = a3;
  id v6 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v6 addAppLayoutForTransientOverlayViewController:v4 windowScene:WeakRetained];
}

- (BOOL)hasAppLayoutForTransientOverlayViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  char v7 = [v5 hasAppLayoutForTransientOverlayViewController:v4 windowScene:WeakRetained];

  return v7;
}

- (void)removeAppLayoutTransientOverlayViewController:(id)a3
{
  id v4 = a3;
  id v6 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v6 removeAppLayoutTransientOverlayViewController:v4 windowScene:WeakRetained];
}

- (BOOL)hasTransientOverlayAppLayouts
{
  int64_t v3 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  char v5 = [v3 hasTransientOverlayAppLayoutsForWindowScene:WeakRetained];

  return v5;
}

- (void)addAcquiredTransientOverlayViewController:(id)a3 forAppLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v9 addAcquiredTransientOverlayViewController:v7 forAppLayout:v6 windowScene:WeakRetained];
}

- (BOOL)isAcquiredTransientOverlayViewController:(id)a3
{
  id v4 = a3;
  char v5 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  char v7 = [v5 isAcquiredTransientOverlayViewController:v4 windowScene:WeakRetained];

  return v7;
}

- (void)removeAcquiredTransientOverlayViewController:(id)a3
{
  id v4 = a3;
  id v6 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v6 removeAcquiredTransientOverlayViewController:v4 windowScene:WeakRetained];
}

- (void)enumerateTransientOverlayViewControllersUsingBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v6 enumerateTransientOverlayViewControllersUsingBlock:v4 windowScene:WeakRetained];
}

- (BOOL)activateHomeScreenWithSource:(int64_t)a3 animated:(BOOL)a4
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SBSwitcherController_activateHomeScreenWithSource_animated___block_invoke;
  v11[3] = &__block_descriptor_41_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
  v11[4] = a3;
  BOOL v12 = a4;
  char v5 = (void *)MEMORY[0x1D948C7A0](v11, a2);
  id v6 = +[SBWorkspace mainWorkspace];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int v8 = [WeakRetained _fbsDisplayConfiguration];
  char v9 = [v6 requestTransitionWithOptions:0 displayConfiguration:v8 builder:v5];

  return v9;
}

void __62__SBSwitcherController_activateHomeScreenWithSource_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSource:v3];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__SBSwitcherController_activateHomeScreenWithSource_animated___block_invoke_2;
  v5[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  char v6 = *(unsigned char *)(a1 + 40);
  [v4 modifyApplicationContext:v5];
}

void __62__SBSwitcherController_activateHomeScreenWithSource_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v2 = +[SBWorkspaceEntity entity];
  [v3 setActivatingEntity:v2];

  [v3 setAnimationDisabled:BSSettingFlagIfYes() != 0];
}

- (BOOL)activateMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__SBSwitcherController_activateMainSwitcherWithSource_animated___block_invoke;
  v14[3] = &unk_1E6AFF458;
  void v14[4] = self;
  v14[5] = a3;
  char v7 = (void *)MEMORY[0x1D948C7A0](v14, a2);
  int v8 = [(SBSwitcherController *)self _makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource:a3 animated:v4];
  char v9 = +[SBWorkspace mainWorkspace];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v11 = [WeakRetained _fbsDisplayConfiguration];
  char v12 = [v9 requestTransitionWithOptions:0 displayConfiguration:v11 builder:v7 validator:v8];

  return v12;
}

void __64__SBSwitcherController_activateMainSwitcherWithSource_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 modifyApplicationContext:&__block_literal_global_221];
  [v3 setSource:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) activateSwitcherEventName];
  [v3 setEventLabel:v4];
}

void __64__SBSwitcherController_activateMainSwitcherWithSource_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setRequestedUnlockedEnvironmentMode:2];
  [v2 setWaitsForSceneUpdates:0];
}

- (BOOL)dismissMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (([(id)SBApp isRunningTest:@"AppSliderDismiss"] & 1) != 0
    || ([(id)SBApp isRunningTest:@"AppSliderDismissRotated"] & 1) != 0
    || ([(id)SBApp isRunningTest:@"AppSliderDismissOverApp"] & 1) != 0
    || ([(id)SBApp isRunningTest:@"AppSliderDismissOverAppRotated"] & 1) != 0
    || ([(id)SBApp isRunningTest:@"AppSliderDismissOverAppInScreenTime"] & 1) != 0
    || [(id)SBApp isRunningTest:@"AppSliderDismissOverAppInScreenTimeRotated"])
  {
    char v7 = +[SBApplicationTestingManager sharedInstance];
    int v8 = [v7 currentTestName];

    [(id)*MEMORY[0x1E4F43630] startedSubTest:@"delay" forTest:v8];
  }
  char v9 = [(SBSwitcherController *)self _makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:self->_activeAppLayoutWhenActivatingMainSwitcher dismissFloatingSwitcher:0 withSource:a3 animated:v4];
  uint64_t v10 = +[SBWorkspace mainWorkspace];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  char v12 = [WeakRetained _fbsDisplayConfiguration];
  char v13 = [v10 requestTransitionWithOptions:0 displayConfiguration:v12 builder:0 validator:v9];

  return v13;
}

- (BOOL)toggleMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__SBSwitcherController_toggleMainSwitcherWithSource_animated___block_invoke;
  v14[3] = &unk_1E6AFF458;
  void v14[4] = self;
  v14[5] = a3;
  char v7 = (void *)MEMORY[0x1D948C7A0](v14, a2);
  int v8 = [(SBSwitcherController *)self _makeWorkspaceTransitionValidatorForTogglingMainSwitcherWithSource:a3 animated:v4];
  char v9 = +[SBWorkspace mainWorkspace];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v11 = [WeakRetained _fbsDisplayConfiguration];
  char v12 = [v9 requestTransitionWithOptions:0 displayConfiguration:v11 builder:v7 validator:v8];

  return v12;
}

void __62__SBSwitcherController_toggleMainSwitcherWithSource_animated___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([*(id *)(a1 + 32) isMainSwitcherVisible] & 1) == 0)
  {
    [v4 modifyApplicationContext:&__block_literal_global_227];
    [v4 setSource:*(void *)(a1 + 40)];
    id v3 = [*(id *)(a1 + 32) toggleSwitcherEventName];
    [v4 setEventLabel:v3];
  }
}

void __62__SBSwitcherController_toggleMainSwitcherWithSource_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setRequestedUnlockedEnvironmentMode:2];
  [v2 setWaitsForSceneUpdates:0];
}

- (BOOL)dismissMainAndFloatingSwitchersWithSource:(int64_t)a3 animated:(BOOL)a4
{
  char v5 = [(SBSwitcherController *)self _makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:self->_activeAppLayoutWhenActivatingMainSwitcher dismissFloatingSwitcher:1 withSource:a3 animated:a4];
  char v6 = +[SBWorkspace mainWorkspace];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int v8 = [WeakRetained _fbsDisplayConfiguration];
  char v9 = [v6 requestTransitionWithOptions:0 displayConfiguration:v8 builder:0 validator:v5];

  return v9;
}

- (void)configureRequest:(id)a3 forSwitcherTransitionRequest:(id)a4 withEventLabel:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SBSwitcherController *)self switcherCoordinator];
  [v11 _configureRequest:v10 forSwitcherTransitionRequest:v9 withEventLabel:v8];
}

- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SBSwitcherController *)self contentViewController];
  [v10 performTransitionWithContext:v9 animated:v5 completion:v8];
}

- (id)animationControllerForTransitionRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBSwitcherController *)self switcherCoordinator];
  char v6 = [v5 animationControllerForTransitionRequest:v4];

  return v6;
}

- (void)addAppLayoutForDisplayItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v9 addAppLayoutForDisplayItem:v7 windowScene:WeakRetained completion:v6];
}

- (void)addCenterRoleAppLayoutForDisplayItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SBSwitcherController *)self switcherCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  [v9 addCenterRoleAppLayoutForDisplayItem:v7 windowScene:WeakRetained completion:v6];
}

- (id)homeGestureBottomEdgeRecognizer
{
  return [(SBFluidSwitcherGestureManager *)self->_gestureManager homeGestureBottomEdgeRecognizer];
}

- (double)scaleForDownscaledSnapshotGenerationForSceneHandle:(id)a3
{
  id v4 = a3;
  [(SBSwitcherController *)self _setUpSwitcherWindowIfNeeded];
  BOOL v5 = [(SBSwitcherController *)self contentViewController];
  [v5 snapshotScaleForSceneHandle:v4];
  double v7 = v6;

  return v7;
}

- (void)_performSwitcherDropWithContext:(id)a3
{
  id v4 = a3;
  contentViewController = self->_contentViewController;
  uint64_t v6 = objc_opt_class();
  double v7 = contentViewController;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__SBSwitcherController__performSwitcherDropWithContext___block_invoke;
  v11[3] = &unk_1E6AF5290;
  id v12 = v4;
  char v13 = self;
  id v10 = v4;
  [(SBSwitcherContentViewControlling *)v9 _performSwitcherDropWithContext:v10 mutationBlock:v11];
}

void __56__SBSwitcherController__performSwitcherDropWithContext___block_invoke(uint64_t a1)
{
  if (SBSwitcherDropRegionWarrantsModelUpdate([*(id *)(a1 + 32) currentDropRegion]))
  {
    id v2 = [*(id *)(a1 + 40) switcherCoordinator];
    [v2 _modifyModelWithDropContext:*(void *)(a1 + 32)];
  }
}

- (void)_noteSwitcherDropAnimationCompletedWithContext:(id)a3
{
  contentViewController = self->_contentViewController;
  id v8 = a3;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = contentViewController;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  double v7 = v6;

  [(SBSwitcherContentViewControlling *)v7 _noteSwitcherDropAnimationCompletedWithContext:v8];
}

- (BOOL)isIdleTouchAwarenessClientEnabled
{
  return [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient isEnabled];
}

- (void)setIdleTouchAwarenessClientEnabled:(BOOL)a3
{
}

- (void)_presentMedusaEducationBanner
{
  id v8 = [(SBSwitcherController *)self _currentLayoutState];
  BOOL IsValid = SBPeekConfigurationIsValid([v8 peekConfiguration]);
  uint64_t v4 = [v8 appLayout];
  BOOL v5 = v4;
  if (IsValid)
  {
    uint64_t v6 = [v4 itemForLayoutRole:1];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 1;
  }
  [(SBSwitcherController *)self _presentMedusaBanner:v7 fireInterval:0.7 dismissInterval:0.0];
}

- (void)_presentMedusaBanner:(int64_t)a3 fireInterval:(double)a4 dismissInterval:(double)a5
{
  id v9 = [(SBSwitcherController *)self _currentLayoutState];
  objc_initWeak(&location, self);
  id v10 = -[SBMedusaBannerViewController initWithType:orientation:peekConfiguration:]([SBMedusaBannerViewController alloc], "initWithType:orientation:peekConfiguration:", a3, [v9 interfaceOrientation], objc_msgSend(v9, "peekConfiguration"));
  medusaBannerViewController = self->_medusaBannerViewController;
  self->_medusaBannerViewController = v10;

  if (a5 > 0.0 && !self->_medusaBannerDismissTimer)
  {
    id v12 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBMainSwitcherCoordinator.medusaBannerDismissTimer"];
    medusaBannerDismissTimer = self->_medusaBannerDismissTimer;
    self->_medusaBannerDismissTimer = v12;
  }
  medusaBannerPresentTimer = self->_medusaBannerPresentTimer;
  if (!medusaBannerPresentTimer)
  {
    id v15 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBMainSwitcherCoordinator.medusaBannerPresentTimer"];
    id v16 = self->_medusaBannerPresentTimer;
    self->_medusaBannerPresentTimer = v15;

    medusaBannerPresentTimer = self->_medusaBannerPresentTimer;
  }
  [(BSAbsoluteMachTimer *)medusaBannerPresentTimer cancel];
  uint64_t v17 = self->_medusaBannerPresentTimer;
  uint64_t v18 = MEMORY[0x1E4F14428];
  id v19 = MEMORY[0x1E4F14428];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  id v20[2] = __74__SBSwitcherController__presentMedusaBanner_fireInterval_dismissInterval___block_invoke;
  v20[3] = &unk_1E6B014D8;
  objc_copyWeak(v21, &location);
  v21[1] = *(id *)&a5;
  [(BSAbsoluteMachTimer *)v17 scheduleWithFireInterval:v18 leewayInterval:v20 queue:a4 handler:0.05];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __74__SBSwitcherController__presentMedusaBanner_fireInterval_dismissInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[11] invalidate];
    id v6 = v5[11];
    v5[11] = 0;

    BOOL v7 = [(id)SBApp bannerManager];
    [v7 postPresentable:v5[10] withOptions:1 userInfo:0 error:0];

    [v5[12] cancel];
    id v8 = v5[12];
    double v9 = *(double *)(a1 + 40);
    uint64_t v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _DWORD v12[2] = __74__SBSwitcherController__presentMedusaBanner_fireInterval_dismissInterval___block_invoke_2;
    v12[3] = &unk_1E6AF5838;
    objc_copyWeak(&v13, (id *)(a1 + 32));
    [v8 scheduleWithFireInterval:v10 leewayInterval:v12 queue:v9 handler:0.05];

    objc_destroyWeak(&v13);
  }
}

void __74__SBSwitcherController__presentMedusaBanner_fireInterval_dismissInterval___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissMedusaBanner];
}

- (void)_dismissMedusaBanner
{
  [(BSAbsoluteMachTimer *)self->_medusaBannerPresentTimer invalidate];
  medusaBannerPresentTimer = self->_medusaBannerPresentTimer;
  self->_medusaBannerPresentTimer = 0;

  [(BSAbsoluteMachTimer *)self->_medusaBannerDismissTimer invalidate];
  medusaBannerDismissTimer = self->_medusaBannerDismissTimer;
  self->_medusaBannerDismissTimer = 0;

  id v7 = [(id)SBApp bannerManager];
  BOOL v5 = [MEMORY[0x1E4F4F5E8] uniqueIdentificationForPresentable:self->_medusaBannerViewController];
  id v6 = (id)[v7 revokePresentablesWithIdentification:v5 reason:@"Dismiss Medusa Education Banner" options:0 userInfo:0 error:0];
}

- (void)_invalidateMedusaEducationBannerTimer
{
  [(BSAbsoluteMachTimer *)self->_medusaBannerPresentTimer invalidate];
  medusaBannerPresentTimer = self->_medusaBannerPresentTimer;
  self->_medusaBannerPresentTimer = 0;

  [(BSAbsoluteMachTimer *)self->_medusaBannerDismissTimer invalidate];
  medusaBannerDismissTimer = self->_medusaBannerDismissTimer;
  self->_medusaBannerDismissTimer = 0;

  idleTouchAwarenessClient = self->_idleTouchAwarenessClient;
  [(SBAttentionAwarenessClient *)idleTouchAwarenessClient setEnabled:0];
}

- (void)_prepareForSceneLayoutTransitionWithTransitionContext:(id)a3
{
}

- (id)_sceneEntitiesToForeground
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(SBSwitcherContentViewControlling *)self->_contentViewController foregroundAppLayouts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        _DWORD v12[2] = __50__SBSwitcherController__sceneEntitiesToForeground__block_invoke;
        v12[3] = &unk_1E6AF4F20;
        void v12[4] = self;
        id v13 = v3;
        [v9 enumerate:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

void __50__SBSwitcherController__sceneEntitiesToForeground__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [v4 switcherCoordinator];
  id v7 = [v6 _entityForDisplayItem:v5 switcherController:*(void *)(a1 + 32)];

  if ([v7 isApplicationSceneEntity]) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (char)_jetsamModeForScene:(id)a3
{
  uint64_t v4 = [(SBSwitcherController *)self _appLayoutForScene:a3];
  if (v4) {
    char v5 = [(SBSwitcherContentViewControlling *)self->_contentViewController jetsamModeForAppLayout:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (char)_activityModeForScene:(id)a3
{
  uint64_t v4 = [(SBSwitcherController *)self _appLayoutForScene:a3];
  if (v4) {
    char v5 = [(SBSwitcherContentViewControlling *)self->_contentViewController activityModeForAppLayout:v4];
  }
  else {
    char v5 = -3;
  }

  return v5;
}

- (id)_appLayoutForScene:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__49;
  id v26 = __Block_byref_object_dispose__49;
  id v27 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v5 = [(SBSwitcherController *)self switcherCoordinator];
  uint64_t v6 = [v5 appLayoutsForSwitcherController:self];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __43__SBSwitcherController__appLayoutForScene___block_invoke;
      v14[3] = &unk_1E6B01500;
      id v11 = v4;
      long long v16 = v10;
      long long v17 = &v22;
      id v15 = v11;
      [v10 enumerate:v14];
      LOBYTE(v10) = v23[5] == 0;

      if ((v10 & 1) == 0) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __43__SBSwitcherController__appLayoutForScene___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = [a3 uniqueIdentifier];
  uint64_t v6 = [*(id *)(a1 + 32) identifier];
  if ([v6 isEqualToString:v7])
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  }
}

uint64_t __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_2;
  v8[3] = &unk_1E6AF8260;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "bs_containsObjectPassingTest:", v8);

  return v6;
}

uint64_t __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 representsSameLayoutElementAsDescriptor:*(void *)(a1 + 32)];
}

void __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_4;
  v11[3] = &unk_1E6B00330;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v5 = v4;
  id v14 = v5;
  SBLayoutRoleEnumerateValidRoles(v11);
  uint64_t v6 = objc_msgSend(v5, "bs_firstObjectPassingTest:", &__block_literal_global_245);
  id v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", &__block_literal_global_247);
  uint64_t v8 = objc_msgSend(v5, "bs_map:", &__block_literal_global_250);
  id v9 = [v6 workspaceEntity];
  uint64_t v10 = [v7 workspaceEntity];
  [v3 setEntities:v8 withPolicy:0 centerEntity:v9 floatingEntity:v10];
  if (SBPeekConfigurationIsValid([*(id *)(a1 + 32) peekConfiguration])) {
    [v3 setRequestedPeekConfiguration:1];
  }
}

void __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_4(id *a1, uint64_t a2)
{
  id v3 = [a1[4] elementWithRole:a2];
  if (v3)
  {
    id v5 = v3;
    char v4 = [a1[5] containsObject:v3];
    id v3 = v5;
    if ((v4 & 1) == 0)
    {
      [a1[6] addObject:v5];
      id v3 = v5;
    }
  }
}

BOOL __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 layoutRole] == 4;
}

BOOL __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 layoutRole] == 3;
}

uint64_t __72__SBSwitcherController__ancillaryTransitionRequestForTransitionRequest___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 workspaceEntity];
}

void __66__SBSwitcherController__updateDisplayLayoutElementForLayoutState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 264);
  id v3 = a2;
  id v4 = [v2 view];
  [v4 bounds];
  objc_msgSend(v3, "setReferenceFrame:");
}

- (void)_presentContinuousExposeStripRevealGrabberTongueImmediately
{
}

- (void)_tickleContinuousExposeStripRevealGrabberTongueIfVisible
{
}

- (BOOL)_shouldAcceleratedHomeButtonPressBegin
{
  id v2 = [(SBSwitcherController *)self contentViewController];
  char v3 = [v2 shouldAcceleratedHomeButtonPressBegin];

  return v3;
}

- (void)prepareForCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  contentViewController = self->_contentViewController;
  id v8 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = contentViewController;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  [(SBSwitcherContentViewControlling *)v7 prepareForCoordinatedLayoutStateTransitionWithContext:v8];
}

- (void)cleanUpAfterCoordinatedLayoutStateTransitionWithContext:(id)a3
{
  contentViewController = self->_contentViewController;
  id v8 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = contentViewController;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  [(SBSwitcherContentViewControlling *)v7 cleanUpAfterCoordinatedLayoutStateTransitionWithContext:v8];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if ([a4 isEqual:@"switcherStyle"])
  {
    [(SBSwitcherController *)self dismissMainAndFloatingSwitchersWithSource:3 animated:1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SBSwitcherController_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  id v5 = [(SBSwitcherController *)self contentViewController];
  objc_msgSend(v5, "setShowModifierTimeline:", -[SBAppSwitcherSettings showMainModifierTimeline](self->_settings, "showMainModifierTimeline"));
}

uint64_t __52__SBSwitcherController_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContentViewControllerIfNeeded];
}

- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6
{
  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0, a5, a6, a4);
  [(SBSwitcherController *)self _presentMedusaEducationBanner];
}

- (BOOL)handleHomeButtonPress
{
  char v3 = [(SBSwitcherController *)self contentViewController];
  if ([v3 handleHomeButtonPress])
  {
    BOOL v4 = 1;
  }
  else
  {
    if (![(SBSwitcherController *)self isAnySwitcherVisible])
    {
      id v5 = [MEMORY[0x1E4F624E0] sharedInstance];
      uint64_t v6 = [(SBSwitcherController *)self activateSwitcherEventName];
      int v7 = [v5 hasEventWithName:v6];

      if (!v7) {
        goto LABEL_7;
      }
    }
    if ([(SBSwitcherController *)self isAnySwitcherVisible]
      && ([(SBSwitcherController *)self activeTransientOverlayPresentedAppLayout], id v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
    {
      BOOL v4 = 1;
      [(SBSwitcherController *)self dismissMainAndFloatingSwitchersWithSource:20 animated:1];
    }
    else
    {
LABEL_7:
      BOOL v4 = 0;
    }
    if ([(SBSwitcherController *)self isInAnyPeekState])
    {
      BOOL v4 = 1;
      [(SBSwitcherController *)self activateHomeScreenWithSource:20 animated:1];
    }
  }

  return v4;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  uint64_t v3 = a3;
  BOOL v4 = [(SBSwitcherController *)self contentViewController];
  LOBYTE(v3) = [v4 handleHeadsetButtonPress:v3];

  return v3;
}

- (BOOL)handleHomeButtonDoublePress
{
  id v2 = [(SBSwitcherController *)self contentViewController];
  char v3 = [v2 handleHomeButtonDoublePress];

  return v3;
}

- (BOOL)handleHomeButtonLongPress
{
  id v2 = [(SBSwitcherController *)self contentViewController];
  char v3 = [v2 handleHomeButtonLongPress];

  return v3;
}

- (BOOL)handleLockButtonPress
{
  id v2 = [(SBSwitcherController *)self contentViewController];
  char v3 = [v2 handleLockButtonPress];

  return v3;
}

- (BOOL)handleVoiceCommandButtonPress
{
  id v2 = [(SBSwitcherController *)self contentViewController];
  char v3 = [v2 handleVoiceCommandButtonPress];

  return v3;
}

- (BOOL)handleVolumeDownButtonPress
{
  id v2 = [(SBSwitcherController *)self contentViewController];
  char v3 = [v2 handleVolumeDownButtonPress];

  return v3;
}

- (BOOL)handleVolumeUpButtonPress
{
  id v2 = [(SBSwitcherController *)self contentViewController];
  char v3 = [v2 handleVolumeUpButtonPress];

  return v3;
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  if (self->_displayLayoutElementAssertion)
  {
    id v5 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    if (!WeakRetained)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBSwitcherController.m", 2135, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    id v16 = [WeakRetained displayLayoutPublisher];
    if (!v16)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBSwitcherController.m", 2135, @"No publisher for window scene: %@; self: %@",
        WeakRetained,
        self);
    }
    int v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = [v16 transitionAssertionWithReason:v8];

    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v5[2](v5, self->_displayLayoutElement);
    id v11 = [v16 addElement:self->_displayLayoutElement];
    id v12 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v11;

    [v9 invalidate];
  }
  else
  {
    id v13 = (void (*)(void))*((void *)a3 + 2);
    id v16 = a3;
    v13();
  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (void)fluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSwitcherController *)self contentViewController];
  [v8 handleFluidSwitcherGestureManager:v7 didBeginGesture:v6];
}

- (void)fluidSwitcherGestureManager:(id)a3 didUpdateGesture:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSwitcherController *)self contentViewController];
  [v8 handleFluidSwitcherGestureManager:v7 didUpdateGesture:v6];
}

- (void)fluidSwitcherGestureManager:(id)a3 didEndGesture:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSwitcherController *)self contentViewController];
  [v8 handleFluidSwitcherGestureManager:v7 didEndGesture:v6];
}

- (void)fluidSwitcherGestureManager:(id)a3 clickReceivedForHomeGrabberView:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [(SBSwitcherController *)self gestureManager];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = [(SBSwitcherController *)self contentViewController];
    [v9 clickReceivedForHomeGrabberView:v10];
  }
}

- (void)fluidSwitcherGestureManager:(id)a3 tapReceivedForGrabberTongueAtEdge:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SBSwitcherController *)self gestureManager];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = [(SBSwitcherController *)self contentViewController];
    [v9 tapReceivedForGrabberTongueAtEdge:a4];
  }
}

- (void)viewDidLoadForSwitcherViewController:(id)a3
{
  BOOL v4 = [(SBSwitcherController *)self switcherCoordinator];
  [v4 switcherControllerViewDidLoad:self];

  [(SBSwitcherController *)self _updateContentViewControllerIfNeeded];
  id v5 = [(SBSwitcherController *)self _currentLayoutState];
  -[SBSwitcherController _updateContentViewInterfaceOrientation:](self, "_updateContentViewInterfaceOrientation:", [v5 interfaceOrientation]);
}

- (void)_windowSceneCanvasSizeDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  id v5 = [WeakRetained _fbsDisplayConfiguration];
  id v6 = +[SBWorkspace mainWorkspace];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SBSwitcherController__windowSceneCanvasSizeDidChange___block_invoke_2;
  v8[3] = &unk_1E6AFBD00;
  void v8[4] = self;
  [v6 requestTransitionWithOptions:0 displayConfiguration:v5 builder:&__block_literal_global_274_0 validator:v8];

  id v7 = [MEMORY[0x1E4FA5E78] sharedInstance];
  [v7 emitEvent:61];
}

void __56__SBSwitcherController__windowSceneCanvasSizeDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setSource:66];
  [v2 setEventLabel:@"DisplayCanvasSizeChange"];
}

BOOL __56__SBSwitcherController__windowSceneCanvasSizeDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) windowManagementStyle];
  if (v4 == 2)
  {
    id v5 = [*(id *)(a1 + 32) layoutState];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__SBSwitcherController__windowSceneCanvasSizeDidChange___block_invoke_3;
    v8[3] = &unk_1E6AF57C0;
    id v9 = v5;
    id v6 = v5;
    [v3 modifyApplicationContext:v8];
  }
  return v4 == 2;
}

void __56__SBSwitcherController__windowSceneCanvasSizeDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setRequestedUnlockedEnvironmentMode:", objc_msgSend(v2, "unlockedEnvironmentMode"));
}

- (id)_makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102__SBSwitcherController__makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource_animated___block_invoke;
  v6[3] = &unk_1E6B01590;
  v6[4] = self;
  BOOL v7 = a4;
  uint64_t v4 = objc_msgSend(v6, "copy", a3);
  return v4;
}

uint64_t __102__SBSwitcherController__makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v30 = a2;
  id v3 = [*(id *)(a1 + 32) windowScene];
  uint64_t v4 = [v3 homeScreenController];
  id v5 = [v4 iconManager];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    int v8 = +[SBIconController sharedInstance];
    id v7 = [v8 iconManager];
  }
  int v28 = [*(id *)(a1 + 32) isMainSwitcherVisible];
  uint64_t v29 = v7;
  int v27 = [v7 isScrolling];
  id v9 = +[SBCommandTabController sharedInstance];
  int v10 = [v9 isVisible];

  unsigned __int8 v31 = 0;
  id v11 = +[SBUIController sharedInstance];
  int v12 = [v11 hasVisibleAlertItemOrSheet:&v31];

  id v13 = +[SBAlertItemsController sharedInstance];
  BOOL v14 = +[SBAssistantController isVisible];
  char v15 = [v13 hasVisibleAlert];
  char v16 = [v13 hasVisibleSuperModalAlert];
  long long v17 = [v3 uiLockStateProvider];
  char v18 = [v17 isUILocked];

  int v19 = 1;
  if (v14
    || (v16 & 1) != 0
    || (v15 & 1) != 0
    || (v18 & 1) != 0
    || (!v31 ? (int v19 = v12) : (int v19 = 0), ((v27 | v28 | v10) & 1) != 0 || v19))
  {
    SBLogAppSwitcher();
    long long v20 = (SBMutableSwitcherTransitionRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v20->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110400;
      int v33 = v27;
      __int16 v34 = 1024;
      int v35 = v28;
      __int16 v36 = 1024;
      int v37 = v10;
      __int16 v38 = 1024;
      int v39 = v19;
      __int16 v40 = 1024;
      int v41 = v12;
      __int16 v42 = 1024;
      int v43 = v31;
      _os_log_impl(&dword_1D85BA000, &v20->super.super, OS_LOG_TYPE_DEFAULT, "Activate switcher validator returning NO. isIconControllerBusy: %{BOOL}u, isMainSwitcherVisible: %{BOOL}u, isCommandTabVisible: %{BOOL}u, isAlertVisibleOrLocked: %{BOOL}u, hasVisibleAlertItemOrSheet: %{BOOL}u, canDismissVisibleAlert: %{BOOL}u", buf, 0x26u);
    }
    uint64_t v25 = 0;
    uint64_t v24 = v30;
  }
  else
  {
    long long v20 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    [(SBSwitcherTransitionRequest *)v20 setUnlockedEnvironmentMode:2];
    [(SBSwitcherTransitionRequest *)v20 setAnimationDisabled:BSSettingFlagIfYes()];
    long long v21 = *(void **)(a1 + 32);
    uint64_t v22 = [v21 activateSwitcherEventName];
    id v23 = v21;
    uint64_t v24 = v30;
    [v23 configureRequest:v30 forSwitcherTransitionRequest:v20 withEventLabel:v22];

    uint64_t v25 = 1;
  }

  return v25;
}

- (id)_makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:(id)a3 dismissFloatingSwitcher:(BOOL)a4 withSource:(int64_t)a5 animated:(BOOL)a6
{
  id v9 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __138__SBSwitcherController__makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout_dismissFloatingSwitcher_withSource_animated___block_invoke;
  v13[3] = &unk_1E6B015B8;
  BOOL v15 = a4;
  void v13[4] = self;
  id v14 = v9;
  BOOL v16 = a6;
  id v10 = v9;
  id v11 = (void *)[v13 copy];

  return v11;
}

uint64_t __138__SBSwitcherController__makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout_dismissFloatingSwitcher_withSource_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    int v5 = [v4 isAnySwitcherVisible];
  }
  else {
    int v5 = [v4 isMainSwitcherVisible];
  }
  int v6 = v5;
  id v7 = +[SBAlertItemsController sharedInstance];
  BOOL v8 = +[SBAssistantController isVisible];
  int v9 = [v7 hasVisibleAlert];
  int v10 = [v7 hasVisibleSuperModalAlert];
  int v11 = v6 ^ 1 | v8 | v9 | v10;
  if (v11)
  {
    int v12 = v10;
    id v13 = SBLogAppSwitcher();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 67109888;
      v18[1] = v6;
      __int16 v19 = 1024;
      BOOL v20 = v8;
      __int16 v21 = 1024;
      int v22 = v9;
      __int16 v23 = 1024;
      int v24 = v12;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Dismiss switcher validator returning NO. isSomeAppSwitcherVisible: %{BOOL}u, isAssistantVisible: %{BOOL}u, hasVisibleAlert: %{BOOL}u, hasVisibleSuperModalAlert: %{BOOL}u", (uint8_t *)v18, 0x1Au);
    }
  }
  else
  {
    id v14 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    [(SBSwitcherTransitionRequest *)v14 setAppLayout:*(void *)(a1 + 40)];
    if (*(unsigned char *)(a1 + 48)) {
      [(SBSwitcherTransitionRequest *)v14 setFloatingSwitcherVisible:0];
    }
    [(SBSwitcherTransitionRequest *)v14 setAnimationDisabled:BSSettingFlagIfYes()];
    BOOL v15 = *(void **)(a1 + 32);
    BOOL v16 = [v15 dismissSwitcherEventName];
    [v15 configureRequest:v3 forSwitcherTransitionRequest:v14 withEventLabel:v16];
  }
  return v11 ^ 1u;
}

- (id)_makeWorkspaceTransitionValidatorForTogglingMainSwitcherWithSource:(int64_t)a3 animated:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__SBSwitcherController__makeWorkspaceTransitionValidatorForTogglingMainSwitcherWithSource_animated___block_invoke;
  v6[3] = &unk_1E6B015E0;
  v6[4] = self;
  void v6[5] = a3;
  BOOL v7 = a4;
  uint64_t v4 = (void *)[v6 copy];
  return v4;
}

uint64_t __100__SBSwitcherController__makeWorkspaceTransitionValidatorForTogglingMainSwitcherWithSource_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 isMainSwitcherVisible];
  int v6 = *(void **)(a1 + 32);
  if (v5) {
    [v6 _makeWorkspaceTransitionValidatorForDismissingMainSwitcherToAppLayout:v6[8] dismissFloatingSwitcher:0 withSource:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  }
  else {
  BOOL v7 = [v6 _makeWorkspaceTransitionValidatorForActivatingMainSwitcherWithSource:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  }
  uint64_t v8 = ((uint64_t (**)(void, id))v7)[2](v7, v4);

  return v8;
}

- (void)_setUpSwitcherWindowIfNeeded
{
  if (!self->_switcherWindow)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    id v3 = [[SBMainSwitcherWindow alloc] initWithWindowScene:WeakRetained];
    switcherWindow = self->_switcherWindow;
    self->_switcherWindow = v3;
    int v5 = v3;

    [(SBMainSwitcherWindow *)v5 _setRoleHint:@"SBTraitsParticipantRoleSwitcherRaw"];
    [(SBMainSwitcherWindow *)v5 setRootViewController:self->_switcherViewController];
    [(SBMainSwitcherWindow *)v5 setWindowLevel:*MEMORY[0x1E4F43F20] + 5.0];
    int v6 = NSString;
    BOOL v7 = [WeakRetained _fbsDisplayIdentity];
    uint64_t v8 = [v7 description];
    int v9 = [v6 stringWithFormat:@"SBSwitcherWindow:%@", v8];
    [(SBMainSwitcherWindow *)v5 setAccessibilityIdentifier:v9];

    [(SBFWindow *)v5 setHidden:1];
    [(SBMainSwitcherWindow *)v5 setClipsToBounds:0];
    id v10 = (id)[(SBSwitcherViewController *)self->_switcherViewController view];
    [(SBSwitcherViewController *)self->_switcherViewController bs_endAppearanceTransition:0];
  }
}

- (void)_updateContentViewControllerIfNeeded
{
  int64_t v4 = [(SBAppSwitcherSettings *)self->_settings switcherStyle];
  id v25 = [(SBSwitcherController *)self contentViewController];
  uint64_t v5 = objc_opt_class();
  if (v4 == 1 || v4 == 2 || v4 == 3)
  {
    id v6 = self;
  }
  else
  {
    int v19 = __sb__runningInSpringBoard();
    char v20 = v19;
    if (v19)
    {
      SBFEffectiveDeviceClass();
    }
    else
    {
      id v2 = [MEMORY[0x1E4F42948] currentDevice];
      [v2 userInterfaceIdiom];
    }
    self;
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if ((v20 & 1) == 0) {
  }
    }
  BOOL v7 = v25;
  if ((id)v5 != v6 || v25 == 0)
  {
    int v9 = [(SBSwitcherController *)self switcherCoordinator];
    id v10 = [(SBSwitcherController *)self switcherViewController];
    if (v25)
    {
      [(SBSwitcherController *)self setContentViewController:0];
      [v25 willMoveToParentViewController:0];
      int v11 = [v25 view];
      [v11 removeFromSuperview];

      [v10 removeChildViewController:v25];
    }
    if ([v6 isSubclassOfClass:objc_opt_class()])
    {
      int v12 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v13 = [v12 userInterfaceIdiom];

      id v14 = off_1E6AF15F0;
      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
        id v14 = off_1E6AEE5C0;
      }
      id v15 = objc_alloc_init(*v14);
      BOOL v16 = [[SBFullScreenSwitcherLiveContentOverlayCoordinator alloc] initWithSwitcherController:self];
      long long v17 = [NSString stringWithFormat:@"Main (%@)", self->_debugName];
      id v26 = (id)[objc_alloc((Class)v6) initWithRootModifier:v15 liveContentOverlayCoordinator:v16 dataSource:v9 delegate:v9 debugName:v17];

      id v18 = v26;
    }
    else
    {
      id v18 = objc_alloc_init((Class)v6);
    }
    id v27 = v18;
    [v18 setDataSource:v9];
    [v27 setDelegate:v9];
    [(SBSwitcherController *)self setContentViewController:v27];
    [v10 addChildViewController:v27];
    __int16 v21 = [v27 view];
    [v10 addContentView:v21];

    [v27 didMoveToParentViewController:v10];
    objc_msgSend(v27, "setShowModifierTimeline:", -[SBAppSwitcherSettings showMainModifierTimeline](self->_settings, "showMainModifierTimeline"));
    uint64_t v22 = [(SBSwitcherController *)self gestureManager];
    if (v22)
    {
      __int16 v23 = (void *)v22;
      [(SBSwitcherController *)self setGestureManager:0];
      [v23 invalidate];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v24 = [[SBFluidSwitcherGestureManager alloc] initWithSwitcherController:self delegate:v9];
      [(SBSwitcherController *)self setGestureManager:v24];
    }
    BOOL v7 = v27;
  }
}

- (BOOL)isMedusaMultitaskingEnabled
{
  return self->_medusaMultitaskingEnabled;
}

- (void)setSwitcherWindow:(id)a3
{
}

- (void)setSwitcherViewController:(id)a3
{
}

- (void)setContentViewController:(id)a3
{
}

- (void)setGestureManager:(id)a3
{
}

- (SBAppLayout)activeAppLayoutWhenActivatingMainSwitcher
{
  return self->_activeAppLayoutWhenActivatingMainSwitcher;
}

- (void)setActiveAppLayoutWhenActivatingMainSwitcher:(id)a3
{
}

- (BOOL)idleTouchAwarenessClientEnabled
{
  return self->_idleTouchAwarenessClientEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureManager, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_switcherViewController, 0);
  objc_storeStrong((id *)&self->_switcherWindow, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_inAppStatusBarHiddenAssertions, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_modalUIFluidDismissalObserverInvalidatable, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_traitsAssistant, 0);
  objc_storeStrong((id *)&self->_traitsDelegateByParticipant, 0);
  objc_storeStrong((id *)&self->_traitsParticipantsByElementIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryElementTraitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_arbiterActuationContext, 0);
  objc_storeStrong((id *)&self->_publisherTraitsParticipant, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
  objc_storeStrong((id *)&self->_medusaBannerDismissTimer, 0);
  objc_storeStrong((id *)&self->_medusaBannerPresentTimer, 0);
  objc_storeStrong((id *)&self->_medusaBannerViewController, 0);
  objc_storeStrong((id *)&self->_displayItemFrameCalculator, 0);
  objc_storeStrong((id *)&self->_activeAppLayoutWhenActivatingMainSwitcher, 0);
  objc_storeStrong((id *)&self->_suppressHidingProtectedAppsAssertion, 0);
  objc_storeStrong((id *)&self->_multitaskingEnablementObserver, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_destroyWeak((id *)&self->_switcherCoordinator);
}

@end