@interface SBPIPController
- (BOOL)_acquirePIPStashAssertionIfNecessaryForTransitionContext:(id)a3 onWindowScene:(id)a4;
- (BOOL)_allWindowScenesLocked;
- (BOOL)_connectedWindowScenesIncludesExternalDisplay;
- (BOOL)_hasStashAssertionForWindowScene:(id)a3;
- (BOOL)_isContentViewAlignedLeftWithPosition:(unint64_t)a3 orientation:(int64_t)a4;
- (BOOL)_isContentViewAlignedTopWithPosition:(unint64_t)a3 orientation:(int64_t)a4;
- (BOOL)_isPointInsidePictureInPictureContent:(CGPoint)a3 onWindowScene:(id)a4;
- (BOOL)_shouldHideWindowScene:(id)a3;
- (BOOL)_shouldStashForTransitionContext:(id)a3 onWindowScene:(id)a4;
- (BOOL)hasCameraInterruptionForBundleIdentifier:(id)a3;
- (BOOL)hasIdleTimerBehaviors;
- (BOOL)isHandlingContextWindowSceneUpdate;
- (BOOL)isPictureInPictureWindowVisibleOnWindowScene:(id)a3;
- (BOOL)isPresentingPictureInPictureRequiringMedusaKeyboard;
- (BOOL)isStoppingOrCancellingPictureInPictureForApplicationWithBundleIdentifier:(id)a3 scenePersistenceIdentifier:(id)a4;
- (BOOL)shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4;
- (CGRect)homeScreenInitialPIPFrameForWindowScene:(id)a3 withContentViewSize:(CGSize)a4 position:(unint64_t)a5 padding:(double)a6 fromOrientation:(int64_t)a7 toOrientation:(int64_t)a8 shouldUpdate:(BOOL)a9 gestureInitiated:(BOOL)a10;
- (NSArray)hostedAppSceneHandles;
- (SBPIPController)initWithIdleTimerCoordinator:(id)a3 windowLevel:(double)a4 interactionSettings:(id)a5 adapter:(id)a6;
- (SBWindowSceneManager)windowSceneManager;
- (UIEdgeInsets)_edgeInsetsForSource:(int64_t)a3 onWindowScene:(id)a4 exists:(BOOL *)a5;
- (UIEdgeInsets)_pictureInPictureWindowMarginsOnWindowScene:(id)a3;
- (UIEdgeInsets)_updatePictureInPictureOverlayInsetsOnWindowScene:(id)a3 withCurrentLayoutState:(BOOL)a4 toHomeScreen:(BOOL)a5 toInterfaceOrientation:(int64_t)a6 shouldUpdate:(BOOL)a7;
- (double)windowLevelForWindowScene:(id)a3;
- (id)_acquireInterruptionAssertionForReason:(int64_t)a3 identifier:(id)a4 cameraSensorBundleIdentifier:(id)a5;
- (id)_acquireStashAssertionForWindowScene:(id)a3 withReason:(int64_t)a4 identifier:(id)a5 customAllowedEnvironmentModes:(id)a6;
- (id)_allContainerViewControllers;
- (id)_contextForContainerViewController:(id)a3;
- (id)_contextForContainerViewController:(id)a3 creatingWithWindowSceneIfNeeded:(id)a4;
- (id)_createNewWindowForContainerViewController:(id)a3 onWindowScene:(id)a4;
- (id)_leadingWindowForWindowScene:(id)a3;
- (id)_overrideInsetsOnWindowScene:(id)a3 forReason:(id)a4 identifier:(id)a5;
- (id)_windowScenesDisplayingPIPContent;
- (id)acquireStashAssertionForWindowScene:(id)a3 withReason:(int64_t)a4 identifier:(id)a5;
- (id)anyContentViewPresentedOnWindowScene:(id)a3;
- (id)connectedWindowScenes;
- (id)containerViewControllerForContentViewController:(id)a3;
- (id)containerViewControllersOnWindowScene:(id)a3;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)createAndRegisterPictureInPictureMorphAnimatorControllerWithTargetProcessIdentifier:(int)a3 uuid:(id)a4 scenePersistenceIdentifier:(id)a5 appLayout:(id)a6 layoutRole:(int64_t)a7 appLayoutBoundingBox:(CGRect)a8 gestureInitiated:(BOOL)a9 direction:(int64_t)a10;
- (id)dataSourceForMorphAnimatorController:(id)a3;
- (id)pictureInPictureMorphAnimatorControllerForProcessIdentifier:(int)a3 scenePersistenceIdentifier:(id)a4;
- (int64_t)contentType;
- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3;
- (void)_addPictureInPictureMorphAnimatorController:(id)a3;
- (void)_cancelInterruptionDebouncingTimer;
- (void)_edgeInsetsDidChangeOnWindowScene:(id)a3;
- (void)_enumerateContextsForWindowScene:(id)a3 usingBlock:(id)a4;
- (void)_invalidateInterruptionAssertion:(id)a3;
- (void)_lockStateDidChange:(id)a3;
- (void)_managePictureInPictureWindowVisibilityForWindowScene:(id)a3 animated:(BOOL)a4;
- (void)_minimumStashedPaddingDidChangeOnWindowScene:(id)a3;
- (void)_moveContext:(id)a3 toWindowScene:(id)a4;
- (void)_performWithoutAnimation:(id)a3;
- (void)_refreshLockStateProviderInterruptionAssertions;
- (void)_registerForLockStateNotificationsForWindowScene:(id)a3;
- (void)_relinquishPIPStashAssertionIfNecessaryForTransitionContext:(id)a3;
- (void)_removePictureInPictureMorphAnimatorController:(id)a3;
- (void)_restorePictureInPictureForTestForApplicationWithBundleIdentifier:(id)a3;
- (void)_setAdapter:(id)a3;
- (void)_setAlpha:(double)a3 forWindowsOnWindowScene:(id)a4;
- (void)_setContainersStashed:(BOOL)a3 forWindowScene:(id)a4;
- (void)_setHidden:(BOOL)a3 forWindowsOnWindowScene:(id)a4;
- (void)_setWindowsLevel:(double)a3 forWindowsOnWindowScene:(id)a4;
- (void)_startPictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a3;
- (void)_suspendPIPForInterruptionAssertion:(id)a3;
- (void)_unregisterForLockStateNotificationsForWindowScene:(id)a3;
- (void)_updateContainerViewControllersContentPaddingOnWindowScene:(id)a3;
- (void)_updateHyperregionComposers;
- (void)_updateZStackIfNeededForDisappearingContainerViewController:(id)a3;
- (void)_visualizeKeyboardFrameIfNeeded;
- (void)_windowSceneDidConnect:(id)a3;
- (void)_windowSceneDidDisconnect:(id)a3;
- (void)activityDidChangeForSensorActivityDataProvider:(id)a3;
- (void)addContainerViewController:(id)a3 dataSource:(id)a4;
- (void)alertItemsController:(id)a3 didActivateAlertItem:(id)a4;
- (void)alertItemsController:(id)a3 didDeactivateAlertItem:(id)a4 forReason:(int)a5;
- (void)assistantDidDisappear:(id)a3 windowScene:(id)a4;
- (void)assistantWillAppear:(id)a3 windowScene:(id)a4;
- (void)bringTetheredContentToFrontOnWindowScene:(id)a3;
- (void)cancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4;
- (void)containerViewController:(id)a3 didFinishStartAnimationWithInitialInterfaceOrientation:(int64_t)a4;
- (void)containerViewController:(id)a3 userDidUpdateStashState:(BOOL)a4;
- (void)containerViewControllerDidBeginInteraction:(id)a3;
- (void)containerViewControllerDidEndInteraction:(id)a3 targetWindowScene:(id)a4;
- (void)containerViewControllerUserMayUpdateStashState:(id)a3;
- (void)dealloc;
- (void)displayLayoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)endPIPInterruptionForAssertion:(id)a3;
- (void)handleDestructionRequestForSceneHandles:(id)a3;
- (void)hideContainersExcludingContainerForContentViewControllerAndTetheredOnes:(id)a3 animated:(BOOL)a4;
- (void)invalidateIdleTimerBehaviors;
- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)lockStateProvider:(id)a3 didUpdateIsUILocked:(BOOL)a4;
- (void)movePIPContentToWindowScene:(id)a3;
- (void)prepareContainerViewControllerForHidingContentViewController:(id)a3;
- (void)removeContainerViewController:(id)a3;
- (void)restoreContentViewController:(id)a3 appSceneEntity:(id)a4 morphAnimatorConfigurationBlock:(id)a5 completion:(id)a6;
- (void)setEnhancedWindowingModeEnabled:(BOOL)a3 windowScene:(id)a4;
- (void)setPictureInPictureWindowsHidden:(BOOL)a3 forReason:(id)a4;
- (void)setWindowSceneManager:(id)a3;
- (void)showAllContentOnWindowScene:(id)a3 animated:(BOOL)a4;
- (void)startPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)updatePictureInPictureWindowLevelForWindowScene:(id)a3;
- (void)updateZStackParticipantPreferencesIfNeeded:(id)a3 windowScene:(id)a4;
@end

@implementation SBPIPController

- (UIEdgeInsets)_updatePictureInPictureOverlayInsetsOnWindowScene:(id)a3 withCurrentLayoutState:(BOOL)a4 toHomeScreen:(BOOL)a5 toInterfaceOrientation:(int64_t)a6 shouldUpdate:(BOOL)a7
{
  BOOL v91 = a7;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = [(NSMapTable *)self->_windowSceneToWindowMarginsMap objectForKey:v10];
  [v11 UIEdgeInsetsValue];
  double v89 = v12;
  double v90 = v13;
  uint64_t v86 = v14;
  double v88 = v15;

  double v17 = *MEMORY[0x1E4F437F8];
  double v16 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  v20 = +[SBIconController sharedInstance];
  char v105 = 0;
  [(SBPIPController *)self _edgeInsetsForSource:1 onWindowScene:v10 exists:&v105];
  double v92 = v19;
  double v22 = v18;
  double v23 = v16;
  double v24 = v17;
  if (v105)
  {
    double v25 = v21;
    v26 = [v20 homeScreenViewController];
    uint64_t v27 = [v26 orientation];
    double v23 = 0.0;
    if ((unint64_t)(v27 - 3) >= 2) {
      double v22 = v25;
    }
    else {
      double v22 = 0.0;
    }
    if ((unint64_t)(v27 - 3) >= 2) {
      double v28 = 0.0;
    }
    else {
      double v28 = v25;
    }
    double v92 = v28;

    double v24 = 0.0;
  }
  v29 = objc_msgSend(v10, "switcherController", v86);
  uint64_t v30 = [v29 unlockedEnvironmentMode];
  if ([v20 isTodayOverlaySpotlightVisible])
  {
    int v31 = 1;
  }
  else
  {
    v32 = [v20 searchPresenter];
    int v31 = [v32 isPresenting];
  }
  v33 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v34 = [v33 userInterfaceIdiom];

  if ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    int v35 = 0;
    if (!v8)
    {
LABEL_14:
      if ([v10 isMainDisplayWindowScene])
      {
        v36 = [v20 iconManager];
        if (([v36 hasOpenFolderInLocation:*MEMORY[0x1E4FA66D0]] & 1) == 0)
        {
          v37 = [v10 floatingDockController];
          [v37 floatingDockHeight];
          if (v22 < v38) {
            double v22 = v38;
          }
        }
      }
      goto LABEL_33;
    }
  }
  else
  {
    int v39 = v31 ^ 1;
    if (self->_unlockedEnvironmentModeWhenKeyboardFocusChanged == v30) {
      int v39 = 0;
    }
    int v35 = v39 | v7;
    if (!v8) {
      goto LABEL_14;
    }
  }
  if ([v29 layoutContainsRole:1])
  {
    char v104 = 0;
    [(SBPIPController *)self _edgeInsetsForSource:2 onWindowScene:v10 exists:&v104];
    if (v104) {
      double v22 = v40;
    }
    else {
      double v22 = v18;
    }
    char v103 = 0;
    [(SBPIPController *)self _edgeInsetsForSource:3 onWindowScene:v10 exists:&v103];
    double v42 = v41;
    unsigned __int8 v43 = [v29 layoutContainsRole:2];
    if (v103) {
      unsigned __int8 v44 = v43;
    }
    else {
      unsigned __int8 v44 = 0;
    }
    if ((v44 & (v22 < v42)) != 0) {
      double v22 = v42;
    }
    double v92 = v19;
    double v23 = v16;
    double v24 = v17;
  }
LABEL_33:
  char v104 = 0;
  [(SBPIPController *)self _edgeInsetsForSource:4 onWindowScene:v10 exists:&v104];
  if (v22 >= v45) {
    double v46 = v22;
  }
  else {
    double v46 = v45;
  }
  if (v104) {
    double v47 = v46;
  }
  else {
    double v47 = v22;
  }
  char v103 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 5, v10, &v103, v46);
  if (v103) {
    int v49 = v35;
  }
  else {
    int v49 = 1;
  }
  if (v47 >= v48) {
    double v50 = v47;
  }
  else {
    double v50 = v48;
  }
  if (!v49) {
    double v47 = v50;
  }
  char v102 = 0;
  [(SBPIPController *)self _edgeInsetsForSource:6 onWindowScene:v10 exists:&v102];
  if (v24 >= v51) {
    double v51 = v24;
  }
  if (v102) {
    double v24 = v51;
  }
  char v101 = 0;
  [(SBPIPController *)self _edgeInsetsForSource:7 onWindowScene:v10 exists:&v101];
  if (v47 >= v52) {
    double v53 = v47;
  }
  else {
    double v53 = v52;
  }
  if (v101) {
    double v54 = v53;
  }
  else {
    double v54 = v47;
  }
  char v100 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 8, v10, &v100, v53);
  if (v100)
  {
    double v57 = v55;
    double v58 = v56;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    v59 = [(SBPIPController *)self containerViewControllersOnWindowScene:v10];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v96 objects:v106 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v97;
      double v63 = 1.79769313e308;
      double v64 = v92;
      do
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v97 != v62) {
            objc_enumerationMutation(v59);
          }
          v66 = [*(id *)(*((void *)&v96 + 1) + 8 * i) maximumAvailableVerticalPadding];
          v67 = v66;
          if (v66) {
            [v66 doubleValue];
          }
          else {
            double v68 = 1.79769313e308;
          }
          double v69 = v68 - v57;
          if (v69 < v63) {
            double v63 = v69;
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v96 objects:v106 count:16];
      }
      while (v61);
    }
    else
    {
      double v63 = 1.79769313e308;
      double v64 = v92;
    }

    if (v58 >= v63) {
      double v70 = v63;
    }
    else {
      double v70 = v58;
    }
    if (v24 < v57) {
      double v24 = v57;
    }
    if (v54 < v70) {
      double v54 = v70;
    }
  }
  else
  {
    double v64 = v92;
  }
  char v95 = 0;
  [(SBPIPController *)self _edgeInsetsForSource:9 onWindowScene:v10 exists:&v95];
  if (v54 >= v71) {
    double v72 = v54;
  }
  else {
    double v72 = v71;
  }
  if (v95) {
    double v73 = v72;
  }
  else {
    double v73 = v54;
  }
  char v94 = 0;
  -[SBPIPController _edgeInsetsForSource:onWindowScene:exists:](self, "_edgeInsetsForSource:onWindowScene:exists:", 10, v10, &v94, v72);
  if (v94)
  {
    SBFEdgeInsetsRotateToInterfaceOrientation();
    UIEdgeInsetsMax();
    double v24 = v74;
    double v23 = v75;
    double v73 = v76;
    double v64 = v77;
  }
  if (v91)
  {
    double v78 = v90;
    if (v90 != v23 || (double v78 = v89, v89 != v24) || (double v78 = v88, v88 != v64) || (double v78 = v87, v87 != v73))
    {
      windowSceneToWindowMarginsMap = self->_windowSceneToWindowMarginsMap;
      *(double *)v93 = v24;
      *(double *)&v93[1] = v23;
      *(double *)&v93[2] = v73;
      *(double *)&v93[3] = v64;
      v80 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", v93, "{UIEdgeInsets=dddd}", v78);
      [(NSMapTable *)windowSceneToWindowMarginsMap setObject:v80 forKey:v10];

      v81 = [(SBPIPController *)self _leadingWindowForWindowScene:v10];

      if (v81) {
        [(SBPIPController *)self _updateContainerViewControllersContentPaddingOnWindowScene:v10];
      }
    }
  }

  double v82 = v24;
  double v83 = v23;
  double v84 = v73;
  double v85 = v64;
  result.right = v85;
  result.bottom = v84;
  result.left = v83;
  result.top = v82;
  return result;
}

- (UIEdgeInsets)_edgeInsetsForSource:(int64_t)a3 onWindowScene:(id)a4 exists:(BOOL *)a5
{
  BOOL v7 = [a4 pictureInPictureManager];
  BOOL v8 = [v7 _sourceToEdgeInsets];
  v9 = [NSNumber numberWithInteger:a3];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (a5) {
    *a5 = v10 != 0;
  }
  [v10 UIEdgeInsetsValue];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)_edgeInsetsDidChangeOnWindowScene:(id)a3
{
  id v4 = a3;
  if (SBWorkspaceIsSystemBootComplete())
  {
    if (([(SBPIPControllerAdapter *)self->_adapter isStartingStoppingOrCancellingPictureInPictureForPIPController:self] & 1) == 0)
    {
      -[SBPIPController _updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:](self, "_updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:", v4, 1, 0, [(id)SBApp activeInterfaceOrientation], 1);
      [(SBPIPController *)self _visualizeKeyboardFrameIfNeeded];
    }
    int v5 = 0;
  }
  else
  {
    int v5 = 1;
  }
  v6 = SBLogPIP();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPController _edgeInsetsDidChangeOnWindowScene:](v5, v6);
  }
}

- (BOOL)shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4
{
  return [(SBPIPControllerAdapter *)self->_adapter shouldStartPictureInPictureForPIPController:self applicationWithProcessIdentifierEnteringBackground:*(void *)&a3 scenePersistenceIdentifier:a4];
}

void __75__SBPIPController_displayLayoutMonitor_didUpdateDisplayLayout_withContext___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 264));
    v3 = [*(id *)(a1 + 48) displayConfiguration];
    id v4 = [v3 identity];
    int v5 = [WeakRetained windowSceneForDisplayIdentity:v4];

    uint64_t v6 = [*(id *)(a1 + 40) _overrideInsetsOnWindowScene:v5 forReason:@"FullScreenModalLayoutElement" identifier:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [*(id *)(*(void *)(a1 + 40) + 136) invalidate];
  uint64_t v7 = *(void *)(a1 + 40);
  BOOL v8 = *(void **)(v7 + 136);
  *(void *)(v7 + 136) = v6;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6 = a4;
  int v5 = [v6 toLayoutState];
  if ([v5 unlockedEnvironmentMode] == 3) {
    [(SBPIPController *)self _relinquishPIPStashAssertionIfNecessaryForTransitionContext:v6];
  }
}

- (void)_visualizeKeyboardFrameIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneManager);
  id v33 = [WeakRetained embeddedDisplayWindowScene];

  if (-[SBPIPController isPictureInPictureWindowVisibleOnWindowScene:](self, "isPictureInPictureWindowVisibleOnWindowScene:", v33)&& (+[SBDefaults localDefaults](SBDefaults, "localDefaults"), id v4 = objc_claimAutoreleasedReturnValue(), [v4 pipDefaults], v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "visualizeKeyboardFrame"), v5, v4, v6))
  {
    [MEMORY[0x1E4F42C68] visiblePeripheralFrame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(SBPIPController *)self _leadingWindowForWindowScene:v33];
    double v16 = [v15 screen];
    double v17 = [v16 coordinateSpace];

    double v18 = [v15 coordinateSpace];
    objc_msgSend(v17, "convertRect:toCoordinateSpace:", v18, v8, v10, v12, v14);
    double v23 = v19;
    double v24 = v20;
    double v25 = v21;
    double v26 = v22;
    keyboardInsetsVisualizerView = self->_keyboardInsetsVisualizerView;
    if (v15 && !keyboardInsetsVisualizerView)
    {
      double v28 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v19, v20, v21, v22);
      v29 = self->_keyboardInsetsVisualizerView;
      self->_keyboardInsetsVisualizerView = v28;

      [(UIView *)self->_keyboardInsetsVisualizerView setUserInteractionEnabled:0];
      uint64_t v30 = [(UIView *)self->_keyboardInsetsVisualizerView layer];
      id v31 = [MEMORY[0x1E4F428B8] systemYellowColor];
      objc_msgSend(v30, "setBorderColor:", objc_msgSend(v31, "CGColor"));

      v32 = [(UIView *)self->_keyboardInsetsVisualizerView layer];
      [v32 setBorderWidth:5.0];

      [v15 addSubview:self->_keyboardInsetsVisualizerView];
      keyboardInsetsVisualizerView = self->_keyboardInsetsVisualizerView;
    }
    -[UIView setFrame:](keyboardInsetsVisualizerView, "setFrame:", v23, v24, v25, v26);
    [v15 bringSubviewToFront:self->_keyboardInsetsVisualizerView];
  }
  else
  {
    [(UIView *)self->_keyboardInsetsVisualizerView removeFromSuperview];
    double v15 = self->_keyboardInsetsVisualizerView;
    self->_keyboardInsetsVisualizerView = 0;
  }
}

- (BOOL)isPictureInPictureWindowVisibleOnWindowScene:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(SBPIPController *)self _shouldHideWindowScene:v4])
  {
    if (v4)
    {
      int v6 = [(SBPIPController *)self _leadingWindowForWindowScene:v4];
      BOOL v5 = v6 != 0;

      goto LABEL_15;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v7 = [(SBPIPController *)self _windowScenesDisplayingPIPContent];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = [(SBPIPController *)self _leadingWindowForWindowScene:*(void *)(*((void *)&v14 + 1) + 8 * i)];

          if (v12)
          {

            BOOL v5 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  BOOL v5 = 0;
LABEL_15:

  return v5;
}

- (BOOL)_shouldHideWindowScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableSet *)self->_pictureInPictureWindowHiddenReasons count];
  if (v5 != 1) {
    goto LABEL_5;
  }
  int v6 = [(NSMutableSet *)self->_pictureInPictureWindowHiddenReasons anyObject];
  if (![v6 isEqualToString:@"SBLockScreenPictureInPictureHiddenReason"])
  {

LABEL_5:
    char v8 = v5 != 0;
    goto LABEL_6;
  }
  double v7 = [v4 uiLockStateProvider];
  char v8 = [v7 isUILocked];

LABEL_6:
  return v8;
}

- (id)_leadingWindowForWindowScene:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = __Block_byref_object_copy__118;
  double v12 = __Block_byref_object_dispose__118;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SBPIPController__leadingWindowForWindowScene___block_invoke;
  v7[3] = &unk_1E6B0D0B0;
  v7[4] = &v8;
  [(SBPIPController *)self _enumerateContextsForWindowScene:v4 usingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_enumerateContextsForWindowScene:(id)a3 usingBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(id, void *, unsigned char *))a4;
  char v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_containerViewControllerToContextMap objectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
      id v14 = [v13 windowScene];

      if (v14 == v6)
      {
        v7[2](v7, v13, &v19);
        if (v19) {
          break;
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  double v7 = [v10 toLayoutState];
  uint64_t v8 = [v7 unlockedEnvironmentMode];
  uint64_t v9 = [v6 windowScene];

  if (![(SBPIPController *)self _acquirePIPStashAssertionIfNecessaryForTransitionContext:v10 onWindowScene:v9]&& v8 != 3)
  {
    [(SBPIPController *)self _relinquishPIPStashAssertionIfNecessaryForTransitionContext:v10];
  }
}

- (BOOL)_acquirePIPStashAssertionIfNecessaryForTransitionContext:(id)a3 onWindowScene:(id)a4
{
  id v40 = a4;
  id v6 = a3;
  double v7 = [v6 toLayoutState];
  uint64_t v8 = [v6 fromLayoutState];
  uint64_t v39 = [v7 unlockedEnvironmentMode];
  uint64_t v38 = [v8 unlockedEnvironmentMode];
  uint64_t v37 = [v7 unlockedEnvironmentMode];
  uint64_t v36 = [v8 unlockedEnvironmentMode];
  uint64_t v9 = [v7 unlockedEnvironmentMode];
  int v10 = [v7 isFloatingSwitcherVisible];
  uint64_t v11 = [v8 unlockedEnvironmentMode];
  int v12 = [v8 isFloatingSwitcherVisible];
  if (v11 == 2) {
    int v13 = 1;
  }
  else {
    int v13 = v12;
  }
  int v35 = v13;
  if (v9 == 2) {
    int v14 = 1;
  }
  else {
    int v14 = v10;
  }
  int v33 = v14;
  int v34 = [v7 isMeaningfullyDifferentFromLayoutState:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionStashAssertion);
  BOOL v16 = [(SBPIPInteractionSettings *)self->_interactionSettings shouldUnstashOnTransitionFromHomescreen];
  BOOL v17 = [(SBPIPInteractionSettings *)self->_interactionSettings shouldUnstashOnTransitionFromSwitcher];
  int v18 = [WeakRetained behaviorOverrideReason] != 7 || v16;
  uint64_t v19 = [WeakRetained behaviorOverrideReason];
  uint64_t v20 = [WeakRetained behaviorOverrideReason];
  int v21 = v19 != 4 || v17;
  int v22 = v18 & v21;
  if (v20 == 8) {
    int v23 = 0;
  }
  else {
    int v23 = v22;
  }
  BOOL v24 = [(SBPIPController *)self _shouldStashForTransitionContext:v6 onWindowScene:v40];

  if (!v24) {
    goto LABEL_32;
  }
  unint64_t v32 = __PAIR64__(v23, v17);
  if (v38 == 1) {
    char v25 = 1;
  }
  else {
    char v25 = v35;
  }
  if ((v25 & 1) == 0
    && v39 == 1
    && [(SBPIPInteractionSettings *)self->_interactionSettings shouldStashOnTransitionToHomescreen]&& ((v23 | !v16) & 1) != 0)
  {
    uint64_t v26 = 7;
LABEL_30:
    uint64_t v27 = v40;
LABEL_37:
    [WeakRetained invalidate];
    v29 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3348870];
    uint64_t v30 = [(SBPIPController *)self _acquireStashAssertionForWindowScene:v27 withReason:v26 identifier:@"SBPIPSceneController" customAllowedEnvironmentModes:v29];
    objc_storeWeak((id *)&self->_transitionStashAssertion, v30);

    BOOL v28 = 1;
    goto LABEL_38;
  }
  if (v36 == 3
    && v37 == 3
    && ((v34 ^ 1) & 1) == 0
    && [(SBPIPInteractionSettings *)self->_interactionSettings shouldStashOnAppToAppTransitions])
  {
    uint64_t v26 = 8;
    goto LABEL_30;
  }
  if ((v35 | v33 ^ 1))
  {
LABEL_32:
    BOOL v28 = 0;
LABEL_33:
    uint64_t v27 = v40;
    goto LABEL_38;
  }
  BOOL v28 = 0;
  if (![(SBPIPInteractionSettings *)self->_interactionSettings shouldStashOnTransitionToSwitcher])goto LABEL_33; {
  uint64_t v27 = v40;
  }
  if (v32 != 1)
  {
    uint64_t v26 = 4;
    goto LABEL_37;
  }
LABEL_38:

  return v28;
}

- (BOOL)_shouldStashForTransitionContext:(id)a3 onWindowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__SBPIPController__shouldStashForTransitionContext_onWindowScene___block_invoke;
  v10[3] = &unk_1E6B0CF50;
  id v8 = v6;
  id v11 = v8;
  int v12 = &v13;
  [(SBPIPController *)self _enumerateContextsForWindowScene:v7 usingBlock:v10];
  LOBYTE(self) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

- (id)_windowScenesDisplayingPIPContent
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMapTable *)self->_containerViewControllerToContextMap objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) windowScene];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSArray)hostedAppSceneHandles
{
  v2 = [(SBPIPController *)self _allContainerViewControllers];
  v3 = objc_msgSend(v2, "bs_compactMap:", &__block_literal_global_217_0);

  return (NSArray *)v3;
}

- (id)_allContainerViewControllers
{
  v2 = [(NSMapTable *)self->_containerViewControllerToContextMap keyEnumerator];
  v3 = [v2 allObjects];

  return v3;
}

- (BOOL)hasIdleTimerBehaviors
{
  return self->_hasIdleTimerBehaviors;
}

- (BOOL)_isPointInsidePictureInPictureContent:(CGPoint)a3 onWindowScene:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(SBPIPController *)self _leadingWindowForWindowScene:v7];
  if (v8)
  {
    uint64_t v9 = [v7 coordinateSpace];
    objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v8, x, y);
    double v11 = v10;
    double v13 = v12;

    long long v14 = objc_msgSend(v8, "hitTest:withEvent:", 0, v11, v13);
    BOOL v15 = v14 != 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)isPresentingPictureInPictureRequiringMedusaKeyboard
{
  v2 = [(SBPIPController *)self _allContainerViewControllers];
  char v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_220_0);

  return v3;
}

- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4
{
  uint64_t v5 = (void *)SBApp;
  id v6 = a4;
  id v7 = [v5 windowSceneManager];
  id v8 = [v6 identifier];

  id v13 = [v7 windowSceneForSceneIdentifier:v8];

  uint64_t v9 = v13;
  if (v13)
  {
    double v10 = [v13 switcherController];
    if (!v10)
    {
      double v11 = SBLogCommon();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

      if (v12) {
        NSLog(&cfstr_ExpectedASwitc.isa);
      }
    }
    self->_unlockedEnvironmentModeWhenKeyboardFocusChanged = [v10 unlockedEnvironmentMode];

    uint64_t v9 = v13;
  }
}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = SBLogCommon();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6)
    {
      id v7 = _SBFLoggingMethodProem();
      NSLog(&cfstr_NeedsToBeInvok.isa, v7);
    }
  }
  BOOL v8 = [(SBPIPController *)self isPictureInPictureWindowVisibleOnWindowScene:0];
  uint64_t v9 = @"[SensorActivity][PIPWindowHidden]";
  if (v8) {
    uint64_t v9 = @"[SensorActivity]";
  }
  unsigned __int8 v43 = v9;
  uint64_t v10 = [v4 activeCameraAndMicrophoneActivityAttributions];
  if ([(NSMutableDictionary *)self->_cameraInterruptionAssertions count])
  {
    double v11 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v12 = [(NSMutableDictionary *)self->_cameraInterruptionAssertions allKeys];
    id v13 = [v11 setWithArray:v12];
  }
  else
  {
    id v13 = 0;
  }
  double v41 = v4;
  long long v14 = [v4 activeCameraAndMicrophoneActivityAttributions];
  BOOL v15 = (void *)[v14 mutableCopy];

  [v15 minusSet:v13];
  uint64_t v39 = v13;
  uint64_t v38 = (void *)[v13 mutableCopy];
  [v38 minusSet:v10];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (![v20 sensor])
        {
          int v21 = [v20 activeEntityBundleIdentifier];
          int v22 = [(NSMutableDictionary *)self->_cameraInterruptionAssertions objectForKeyedSubscript:v20];

          int v23 = SBLogPIP();
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v24)
            {
              *(_DWORD *)buf = 138543874;
              double v54 = v43;
              __int16 v55 = 2114;
              double v56 = v20;
              __int16 v57 = 2114;
              double v58 = v21;
              _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ NOT interrupting PIP for camera activity: attribution[%{public}@] bundleIdentifier[%{public}@], as we were already tracking a sensorAttribution for that app", buf, 0x20u);
            }
          }
          else
          {
            if (v24)
            {
              *(_DWORD *)buf = 138543874;
              double v54 = v43;
              __int16 v55 = 2114;
              double v56 = v20;
              __int16 v57 = 2114;
              double v58 = v21;
              _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Interrupting PIP for camera activity: attribution[%{public}@] bundleIdentifier[%{public}@]", buf, 0x20u);
            }

            if (!self->_cameraInterruptionAssertions)
            {
              char v25 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
              cameraInterruptionAssertions = self->_cameraInterruptionAssertions;
              self->_cameraInterruptionAssertions = v25;
            }
            uint64_t v27 = [NSString stringWithFormat:@"SBPIPController-%@", v21];
            int v23 = [(SBPIPController *)self _acquireInterruptionAssertionForReason:1 identifier:v27 cameraSensorBundleIdentifier:v21];

            if (v23)
            {
              [(NSMutableDictionary *)self->_cameraInterruptionAssertions setObject:v23 forKeyedSubscript:v20];
              [(SBPIPController *)self _suspendPIPForInterruptionAssertion:v23];
            }
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v17);
  }
  id v40 = (void *)v10;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v28 = v38;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v28);
        }
        int v33 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        int v34 = [(NSMutableDictionary *)self->_cameraInterruptionAssertions objectForKeyedSubscript:v33];
        int v35 = SBLogPIP();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = [v33 activeEntityBundleIdentifier];
          *(_DWORD *)buf = 138543874;
          double v54 = v43;
          __int16 v55 = 2114;
          double v56 = v33;
          __int16 v57 = 2114;
          double v58 = v36;
          _os_log_impl(&dword_1D85BA000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing PIP interruption assertion for camera activity: attribution[%{public}@] bundleIdentifier[%{public}@]", buf, 0x20u);
        }
        [(NSMutableDictionary *)self->_cameraInterruptionAssertions setObject:0 forKeyedSubscript:v33];
        [v34 invalidate];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v30);
  }

  if (![(NSMutableDictionary *)self->_cameraInterruptionAssertions count])
  {
    uint64_t v37 = self->_cameraInterruptionAssertions;
    self->_cameraInterruptionAssertions = 0;
  }
}

- (void)_suspendPIPForInterruptionAssertion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogPIP();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Assertions] Interrupting for assertion: %{public}@", buf, 0xCu);
  }

  if ((*((unsigned char *)self + 248) & 4) != 0) {
    int v6 = [(SBPIPControllerAdapter *)self->_adapter pipController:self willBeginPIPInterruptionForAssertion:v4] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }
  if (!self->_stashForInterruptionAssertion && (v6 & 1) == 0)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F334B570, &unk_1F334B588, 0);
    BOOL v8 = [(SBPIPController *)self _windowScenesDisplayingPIPContent];
    uint64_t v9 = [v8 allObjects];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __55__SBPIPController__suspendPIPForInterruptionAssertion___block_invoke;
    v19[3] = &unk_1E6B0CFE8;
    v19[4] = self;
    uint64_t v20 = @"SBPIPController";
    id v10 = v7;
    id v21 = v10;
    double v11 = objc_msgSend(v9, "bs_compactMap:", v19);

    objc_initWeak((id *)buf, self);
    BOOL v12 = [SBPIPStashAssertion alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __55__SBPIPController__suspendPIPForInterruptionAssertion___block_invoke_2;
    v16[3] = &unk_1E6B01F68;
    id v13 = v11;
    id v17 = v13;
    objc_copyWeak(&v18, (id *)buf);
    long long v14 = [(SBPIPBehaviorOverrideAssertion *)v12 initWithReason:3 identifier:@"SBPIPController" invalidationBlock:v16];
    stashForInterruptionAssertion = self->_stashForInterruptionAssertion;
    self->_stashForInterruptionAssertion = v14;

    [(SBPIPEnvironmentDependentOverrideAssertion *)self->_stashForInterruptionAssertion setInvalidatesEarly:1];
    objc_destroyWeak(&v18);

    objc_destroyWeak((id *)buf);
  }
  [(SBPIPController *)self invalidateIdleTimerBehaviors];
  [(SBPIPController *)self _cancelInterruptionDebouncingTimer];
}

- (void)invalidateIdleTimerBehaviors
{
  char v3 = [(SBPIPController *)self _allContainerViewControllers];
  int v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", &__block_literal_global_277_1);

  if (self->_hasIdleTimerBehaviors != v4)
  {
    self->_hasIdleTimerBehaviors = v4;
    idleTimerCoordinatorHelper = self->_idleTimerCoordinatorHelper;
    if (v4) {
      +[SBIdleTimerBehavior disabledBehavior];
    }
    else {
    id v7 = +[SBIdleTimerBehavior autoLockBehavior];
    }
    id v6 = -[SBIdleTimerCoordinatorHelper proposeIdleTimerBehavior:fromProvider:reason:](idleTimerCoordinatorHelper, "proposeIdleTimerBehavior:fromProvider:reason:");
  }
}

- (void)_cancelInterruptionDebouncingTimer
{
  interruptionEndDebouncingTimer = self->_interruptionEndDebouncingTimer;
  if (interruptionEndDebouncingTimer)
  {
    int v4 = [(SBPIPInterruptionDebouncingTimer *)interruptionEndDebouncingTimer debouncedAssertion];
    [(SBPIPController *)self endPIPInterruptionForAssertion:v4];

    [(BSAbsoluteMachTimer *)self->_interruptionEndDebouncingTimer invalidate];
    uint64_t v5 = self->_interruptionEndDebouncingTimer;
    self->_interruptionEndDebouncingTimer = 0;

    id v6 = SBLogPIP();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[Assertions] PIP interruption debounce timer was canceled. Stop interrupting PIP for previously expired assertion.", v7, 2u);
    }
  }
}

- (id)_acquireInterruptionAssertionForReason:(int64_t)a3 identifier:(id)a4 cameraSensorBundleIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!self->_interruptionAssertions)
  {
    id v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    interruptionAssertions = self->_interruptionAssertions;
    self->_interruptionAssertions = v10;
  }
  objc_initWeak(&location, self);
  BOOL v12 = [SBPIPInterruptionAssertion alloc];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __98__SBPIPController__acquireInterruptionAssertionForReason_identifier_cameraSensorBundleIdentifier___block_invoke;
  id v18 = &unk_1E6B0D010;
  objc_copyWeak(&v19, &location);
  id v13 = [(SBPIPBehaviorOverrideAssertion *)v12 initWithReason:a3 identifier:v8 cameraSensorAttributionBundleIdentifier:v9 invalidationBlock:&v15];
  if (v13) {
    -[NSHashTable addObject:](self->_interruptionAssertions, "addObject:", v13, v15, v16, v17, v18);
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v13;
}

void __88__SBPIPController_initWithIdleTimerCoordinator_windowLevel_interactionSettings_adapter___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained displayLayoutMonitor:v11 didUpdateDisplayLayout:v7 withContext:v8];
  }
}

- (void)displayLayoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = SBLogPIP();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    id v43 = v7;
    __int16 v44 = 2114;
    id v45 = v8;
    __int16 v46 = 2114;
    id v47 = v9;
    _os_log_debug_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEBUG, "[DisplayMonitor][Layout] layoutMonitor:%{public}@ didUpdateDisplayLayout:%{public}@ withContext:%{public}@", buf, 0x20u);
  }
  uint64_t v30 = v7;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v27 = v8;
  id v11 = [v8 elements];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
  uint64_t v29 = v9;
  if (!v12)
  {
    unint64_t v32 = 0;
    goto LABEL_25;
  }
  uint64_t v13 = v12;
  unint64_t v32 = 0;
  unint64_t v14 = 0;
  uint64_t v15 = *(void *)v38;
  uint64_t v16 = *MEMORY[0x1E4F625B0];
  uint64_t v31 = *MEMORY[0x1E4FA6F70];
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v38 != v15) {
        objc_enumerationMutation(v11);
      }
      id v18 = *(void **)(*((void *)&v37 + 1) + 8 * v17);
      if ([v18 isSpringBoardElement])
      {
        unint64_t v19 = [v18 level];
        uint64_t v20 = [v18 identifier];
        uint64_t v21 = [v18 layoutRole];
        if (v19 >= v14)
        {
          uint64_t v22 = v21;
          if ([v18 layoutRole] == 3)
          {
            if (([v20 isEqualToString:v16] & 1) != 0
              || ([v20 isEqualToString:v31] & 1) != 0)
            {
              goto LABEL_10;
            }
            uint64_t v23 = [v18 identifier];
          }
          else
          {
            if (v19 <= v14 || (unint64_t)(v22 - 1) > 7 || ((0xC3u >> (v22 - 1)) & 1) == 0) {
              goto LABEL_10;
            }
            uint64_t v23 = 0;
          }

          unint64_t v32 = (void *)v23;
          unint64_t v14 = v19;
        }
LABEL_10:
      }
      ++v17;
    }
    while (v13 != v17);
    uint64_t v24 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
    uint64_t v13 = v24;
  }
  while (v24);
LABEL_25:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SBPIPController_displayLayoutMonitor_didUpdateDisplayLayout_withContext___block_invoke;
  block[3] = &unk_1E6AF4E00;
  id v34 = v32;
  int v35 = self;
  id v36 = v27;
  id v25 = v27;
  id v26 = v32;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_relinquishPIPStashAssertionIfNecessaryForTransitionContext:(id)a3
{
  id v4 = a3;
  id v17 = [v4 toLayoutState];
  uint64_t v5 = [v4 fromLayoutState];

  uint64_t v6 = [v17 unlockedEnvironmentMode];
  uint64_t v7 = [v5 unlockedEnvironmentMode];
  uint64_t v8 = [v17 unlockedEnvironmentMode];
  char v9 = [v17 isFloatingSwitcherVisible];
  uint64_t v10 = [v5 unlockedEnvironmentMode];
  int v11 = [v5 isFloatingSwitcherVisible];
  if (v10 == 2) {
    int v12 = 1;
  }
  else {
    int v12 = v11;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionStashAssertion);
  unint64_t v14 = WeakRetained;
  BOOL v15 = 0;
  if (v12 == 1 && v8 != 2 && (v9 & 1) == 0) {
    BOOL v15 = [WeakRetained behaviorOverrideReason] == 4
  }
       && [(SBPIPInteractionSettings *)self->_interactionSettings shouldUnstashOnTransitionFromSwitcher];
  BOOL v16 = 0;
  if (v7 == 1 && v6 != 1) {
    BOOL v16 = [v14 behaviorOverrideReason] == 7
  }
       && [(SBPIPInteractionSettings *)self->_interactionSettings shouldUnstashOnTransitionFromHomescreen];
  if (v15 || v16)
  {
    [v14 invalidate];
    objc_storeWeak((id *)&self->_transitionStashAssertion, 0);
  }
}

- (SBPIPController)initWithIdleTimerCoordinator:(id)a3 windowLevel:(double)a4 interactionSettings:(id)a5 adapter:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v48.receiver = self;
  v48.super_class = (Class)SBPIPController;
  uint64_t v13 = [(SBPIPController *)&v48 init];
  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    containerViewControllerToContextMap = v13->_containerViewControllerToContextMap;
    v13->_containerViewControllerToContextMap = (NSMapTable *)v14;

    objc_storeStrong((id *)&v13->_interactionSettings, a5);
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    pictureInPictureMorphAnimatorControllers = v13->_pictureInPictureMorphAnimatorControllers;
    v13->_pictureInPictureMorphAnimatorControllers = (NSMutableSet *)v16;

    id v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pictureInPictureWindowHiddenReasons = v13->_pictureInPictureWindowHiddenReasons;
    v13->_pictureInPictureWindowHiddenReasons = v18;

    v13->_windowLevel = a4;
    uint64_t v20 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    windowSceneToWindowMarginsMap = v13->_windowSceneToWindowMarginsMap;
    v13->_windowSceneToWindowMarginsMap = (NSMapTable *)v20;

    [(SBPIPController *)v13 _setAdapter:v12];
    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v13 selector:sel__lockStateDidChange_ name:@"SBAggregateLockStateDidChangeNotification" object:0];

    uint64_t v23 = +[SBAlertItemsController sharedInstance];
    [v23 addObserver:v13];

    uint64_t v24 = +[SBAssistantController sharedInstance];
    [v24 addObserver:v13];

    id v25 = [(id)SBApp sensorActivityDataProvider];
    [v25 addObserver:v13];

    objc_storeWeak((id *)&v13->_idleTimerCoordinator, v10);
    id v26 = [[SBIdleTimerCoordinatorHelper alloc] initWithSourceProvider:v13];
    idleTimerCoordinatorHelper = v13->_idleTimerCoordinatorHelper;
    v13->_idleTimerCoordinatorHelper = v26;

    [(SBIdleTimerCoordinatorHelper *)v13->_idleTimerCoordinatorHelper setTargetCoordinator:v10];
    v13->_defaultToStashed = 0;
    id v28 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v29 = [v28 userInterfaceIdiom];

    if ((v29 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      uint64_t v30 = +[SBWorkspace mainWorkspace];
      uint64_t v31 = [v30 keyboardFocusController];
      uint64_t v32 = [v31 addKeyboardFocusObserver:v13];
      keyboardFocusObserver = v13->_keyboardFocusObserver;
      v13->_keyboardFocusObserver = (BSInvalidatable *)v32;
    }
    id v34 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
    objc_initWeak(&location, v13);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __88__SBPIPController_initWithIdleTimerCoordinator_windowLevel_interactionSettings_adapter___block_invoke;
    v45[3] = &unk_1E6AF9A38;
    objc_copyWeak(&v46, &location);
    [v34 setTransitionHandler:v45];
    uint64_t v35 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v34];
    displayLayoutMonitor = v13->_displayLayoutMonitor;
    v13->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v35;

    long long v37 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    long long v38 = [v37 _layoutStateTransitionCoordinator];
    [v38 addObserver:v13];

    id v39 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v44, &location);
    id v43 = v13;
    uint64_t v40 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureInvalidatable = v43->_stateCaptureInvalidatable;
    v43->_stateCaptureInvalidatable = (BSInvalidatable *)v40;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }
  return v13;
}

__CFString *__88__SBPIPController_initWithIdleTimerCoordinator_windowLevel_interactionSettings_adapter___block_invoke_2(uint64_t a1)
{
  v23[9] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v22[0] = @"window scenes";
    unint64_t v19 = [*(id *)(a1 + 32) _windowScenesDisplayingPIPContent];
    char v3 = [v19 allObjects];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__SBPIPController_initWithIdleTimerCoordinator_windowLevel_interactionSettings_adapter___block_invoke_3;
    v20[3] = &unk_1E6B0CED8;
    id v4 = WeakRetained;
    id v21 = v4;
    uint64_t v5 = objc_msgSend(v3, "bs_map:", v20);
    v23[0] = v5;
    v22[1] = @"windowLevel";
    uint64_t v6 = [NSNumber numberWithDouble:*((double *)v4 + 4)];
    v23[1] = v6;
    v22[2] = @"window hidden reasons";
    if ([*((id *)v4 + 10) count]) {
      uint64_t v7 = (__CFString *)*((void *)v4 + 10);
    }
    else {
      uint64_t v7 = @"none";
    }
    v23[2] = v7;
    v22[3] = @"fullscreen modal inset override assertion";
    uint64_t v9 = *((void *)v4 + 17);
    if (v9)
    {
      id v10 = [*((id *)v4 + 17) debugDescription];
    }
    else
    {
      id v10 = @"none";
    }
    id v11 = @"yes";
    if (!*((unsigned char *)v4 + 40)) {
      id v11 = @"no";
    }
    v23[3] = v10;
    v23[4] = v11;
    v22[4] = @"has idle timer behaviors";
    v22[5] = @"morphAnimatorControllers";
    if ([*((id *)v4 + 24) count]) {
      id v12 = (__CFString *)*((void *)v4 + 24);
    }
    else {
      id v12 = @"none";
    }
    v23[5] = v12;
    v22[6] = @"interruption assertions";
    uint64_t v13 = [*((id *)v4 + 14) count];
    if (v13)
    {
      uint64_t v14 = [*((id *)v4 + 14) allObjects];
    }
    else
    {
      uint64_t v14 = @"none";
    }
    BOOL v15 = (__CFString *)*((void *)v4 + 20);
    if (!v15) {
      BOOL v15 = @"none";
    }
    v23[6] = v14;
    v23[7] = v15;
    v22[7] = @"interruption debouncing timer";
    v22[8] = @"active pip default stash state ";
    uint64_t v16 = @"stashed";
    if (!*((unsigned char *)v4 + 168)) {
      uint64_t v16 = @"normal";
    }
    v23[8] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:9];
    uint64_t v8 = [v17 description];

    if (v13) {
    if (v9)
    }
  }
  else
  {
    uint64_t v8 = &stru_1F3084718;
  }

  return v8;
}

id __88__SBPIPController_initWithIdleTimerCoordinator_windowLevel_interactionSettings_adapter___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v24 = [v3 pictureInPictureManager];
  id v4 = [v24 _sourceToEdgeInsets];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [v4 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v12 = [v4 objectForKey:v11];
        uint64_t v13 = SBStringFromPictureInPictureInsetsSource([v11 integerValue]);
        [(__CFString *)v5 setObject:v12 forKey:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [v24 _windowLevelOverrideAssertionsForContentType:0];
  BOOL v15 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKey:v3];
  uint64_t v16 = [*(id *)(a1 + 32) _leadingWindowForWindowScene:v3];
  v29[0] = @"window level overrides";
  id v17 = @"none";
  if ([(__CFString *)v14 count]) {
    id v18 = v14;
  }
  else {
    id v18 = @"none";
  }
  v30[0] = v18;
  v29[1] = @"insets for source";
  if ([(__CFString *)v5 count]) {
    unint64_t v19 = v5;
  }
  else {
    unint64_t v19 = @"none";
  }
  v30[1] = v19;
  v29[2] = @"stash assertions";
  if ([(__CFString *)v15 count]) {
    uint64_t v20 = v15;
  }
  else {
    uint64_t v20 = @"none";
  }
  v30[2] = v20;
  v29[3] = @"window level";
  if (v16)
  {
    id v21 = NSNumber;
    [v16 windowLevel];
    objc_msgSend(v21, "numberWithDouble:");
    id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v30[3] = v17;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];
  if (v16) {

  }
  return v22;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(FBSDisplayLayoutMonitor *)self->_displayLayoutMonitor invalidate];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (void *)[(NSMapTable *)self->_containerViewControllerToContextMap copy];
  id v4 = [v3 keyEnumerator];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBPIPController *)self removeContainerViewController:*(void *)(*((void *)&v13 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v9 = +[SBAlertItemsController sharedInstance];
  [v9 removeObserver:self];

  id v10 = +[SBAssistantController sharedInstance];
  [v10 removeObserver:self];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 removeObserver:self];

  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  [(BSInvalidatable *)self->_keyboardFocusObserver invalidate];
  [(BSAbsoluteMachTimer *)self->_interruptionEndDebouncingTimer invalidate];
  v12.receiver = self;
  v12.super_class = (Class)SBPIPController;
  [(SBPIPController *)&v12 dealloc];
}

- (int64_t)contentType
{
  return [(SBPIPControllerAdapter *)self->_adapter contentTypeForPIPController:self];
}

- (void)_setAdapter:(id)a3
{
  uint64_t v5 = (SBPIPControllerAdapter *)a3;
  if (self->_adapter != v5)
  {
    id v17 = v5;
    *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xFD | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 64;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xBF | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 4;
    }
    else {
      char v8 = 0;
    }
    *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xFB | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 8;
    }
    else {
      char v9 = 0;
    }
    *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xF7 | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 16;
    }
    else {
      char v10 = 0;
    }
    *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xEF | v10;
    if (objc_opt_respondsToSelector()) {
      char v11 = 32;
    }
    else {
      char v11 = 0;
    }
    *((unsigned char *)self + 248) = *((unsigned char *)self + 248) & 0xDF | v11;
    if (objc_opt_respondsToSelector()) {
      char v12 = 0x80;
    }
    else {
      char v12 = 0;
    }
    *((unsigned char *)self + 248) = v12 & 0x80 | *((unsigned char *)self + 248) & 0x7F;
    *((unsigned char *)self + 249) = *((unsigned char *)self + 249) & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    *((unsigned char *)self + 249) = *((unsigned char *)self + 249) & 0xFD | v13;
    if (objc_opt_respondsToSelector()) {
      char v14 = 4;
    }
    else {
      char v14 = 0;
    }
    *((unsigned char *)self + 249) = *((unsigned char *)self + 249) & 0xFB | v14;
    if (objc_opt_respondsToSelector()) {
      char v15 = 8;
    }
    else {
      char v15 = 0;
    }
    *((unsigned char *)self + 249) = *((unsigned char *)self + 249) & 0xF7 | v15;
    if (objc_opt_respondsToSelector()) {
      char v16 = 16;
    }
    else {
      char v16 = 0;
    }
    *((unsigned char *)self + 249) = *((unsigned char *)self + 249) & 0xEF | v16;
    objc_storeStrong((id *)&self->_adapter, a3);
    [(SBPIPControllerAdapter *)self->_adapter setPIPController:self];
    uint64_t v5 = v17;
  }
}

- (id)_contextForContainerViewController:(id)a3
{
  return [(SBPIPController *)self _contextForContainerViewController:a3 creatingWithWindowSceneIfNeeded:0];
}

- (id)_contextForContainerViewController:(id)a3 creatingWithWindowSceneIfNeeded:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  char v9 = [(NSMapTable *)self->_containerViewControllerToContextMap objectForKey:v7];
  if (!v9)
  {
    if (v8)
    {
      char v9 = [[SBPIPContentContext alloc] initWithWindowScene:v8 containerViewController:v7];
      [(NSMapTable *)self->_containerViewControllerToContextMap setObject:v9 forKey:v7];
    }
    else
    {
      char v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"SBPIPController.m" lineNumber:334 description:@"Attempting to look up an unknown content context"];

      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_connectedWindowScenesIncludesExternalDisplay
{
  v2 = [(NSHashTable *)self->_connectedWindowScenes allObjects];
  char v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_383);

  return v3;
}

uint64_t __64__SBPIPController__connectedWindowScenesIncludesExternalDisplay__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainDisplayWindowScene] ^ 1;
}

- (void)_registerForLockStateNotificationsForWindowScene:(id)a3
{
  uint64_t v4 = [a3 uiLockStateProvider];
  lockStateProviders = self->_lockStateProviders;
  id v8 = (id)v4;
  if (!lockStateProviders)
  {
    char v6 = (NSHashTable *)objc_opt_new();
    id v7 = self->_lockStateProviders;
    self->_lockStateProviders = v6;

    uint64_t v4 = (uint64_t)v8;
    lockStateProviders = self->_lockStateProviders;
  }
  if (![(NSHashTable *)lockStateProviders containsObject:v4])
  {
    [(NSHashTable *)self->_lockStateProviders addObject:v8];
    [v8 addLockStateObserver:self];
  }
}

- (void)_unregisterForLockStateNotificationsForWindowScene:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 uiLockStateProvider];
  if ([(NSHashTable *)self->_lockStateProviders containsObject:v5])
  {
    if ([(NSHashTable *)self->_connectedWindowScenes containsObject:v4])
    {
      char v6 = SBLogPIP();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[Assertions] Unregistering from the window scene lock state provider notifications but the window scene is still connected.", buf, 2u);
      }
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_connectedWindowScenes;
    uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          char v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "uiLockStateProvider", (void)v13);

          if (v12 == v5)
          {

            goto LABEL_16;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    [v5 removeLockStateObserver:self];
    [(NSHashTable *)self->_lockStateProviders removeObject:v5];
  }
LABEL_16:
}

- (void)_windowSceneDidConnect:(id)a3
{
  id v8 = a3;
  if (!-[NSHashTable containsObject:](self->_connectedWindowScenes, "containsObject:"))
  {
    connectedWindowScenes = self->_connectedWindowScenes;
    if (!connectedWindowScenes)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      char v6 = self->_connectedWindowScenes;
      self->_connectedWindowScenes = v5;

      connectedWindowScenes = self->_connectedWindowScenes;
    }
    [(NSHashTable *)connectedWindowScenes addObject:v8];
    [(SBPIPController *)self _updateHyperregionComposers];
    if ([(SBPIPController *)self _connectedWindowScenesIncludesExternalDisplay])
    {
      id v7 = [(id)SBApp externalDisplayService];
      [v7 addObserver:self];
    }
    [(SBPIPController *)self _registerForLockStateNotificationsForWindowScene:v8];
    [(SBPIPController *)self _refreshLockStateProviderInterruptionAssertions];
  }
}

- (void)_windowSceneDidDisconnect:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NSHashTable *)self->_connectedWindowScenes containsObject:v4];
  if (v5)
  {
    [(NSHashTable *)self->_connectedWindowScenes removeObject:v4];
    if (![(NSHashTable *)self->_connectedWindowScenes count])
    {
      connectedWindowScenes = self->_connectedWindowScenes;
      self->_connectedWindowScenes = 0;
    }
    [(SBPIPController *)self _unregisterForLockStateNotificationsForWindowScene:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneManager);
  id v8 = [WeakRetained activeDisplayWindowScene];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [(NSMapTable *)self->_containerViewControllerToContextMap objectEnumerator];
  uint64_t v10 = [v9 allObjects];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v16 = [v15 windowScene];

        if (v16 == v4) {
          [(SBPIPController *)self _moveContext:v15 toWindowScene:v8];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [(NSMapTable *)self->_windowSceneToWindowMarginsMap removeObjectForKey:v4];
  [(NSMapTable *)self->_windowSceneToStashAssertionsMap removeObjectForKey:v4];
  [(NSMapTable *)self->_windowSceneToInsetAssertionMap removeObjectForKey:v4];
  if (v5) {
    [(SBPIPController *)self _updateHyperregionComposers];
  }
  if (![(SBPIPController *)self _connectedWindowScenesIncludesExternalDisplay])
  {
    id v17 = [(id)SBApp externalDisplayService];
    [v17 removeObserver:self];
  }
}

- (void)_moveContext:(id)a3 toWindowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__SBPIPController__moveContext_toWindowScene___block_invoke;
  v10[3] = &unk_1E6AF4E00;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(SBPIPController *)self _performWithoutAnimation:v10];
}

void __46__SBPIPController__moveContext_toWindowScene___block_invoke(id *a1)
{
  v2 = [a1[4] containerViewController];
  char v3 = [v2 interactionController];
  [v3 prepareForTransitionToWindowScene:a1[5]];

  [a1[6] _updateHyperregionComposers];
  id v4 = [a1[4] windowScene];
  id v10 = [v4 pictureInPictureManager];

  BOOL v5 = [a1[5] pictureInPictureManager];
  [v5 setNeedsUpdateZStackParticipantPreferencesWithReason:@"PIP context moved to new scene"];
  [a1[4] setWindowScene:a1[5]];
  id v6 = [a1[4] window];
  id v7 = v6;
  if (v6)
  {
    ++*((void *)a1[6] + 32);
    [v6 setWindowScene:a1[5]];
    [a1[6] _edgeInsetsDidChangeOnWindowScene:a1[5]];
    [a1[6] updatePictureInPictureWindowLevelForWindowScene:a1[5]];
    [a1[6] _minimumStashedPaddingDidChangeOnWindowScene:a1[5]];
    [a1[6] _managePictureInPictureWindowVisibilityForWindowScene:a1[5] animated:0];
    --*((void *)a1[6] + 32);
    [v5 setNeedsUpdateZStackParticipantPreferencesWithReason:@"PIP context moved to new scene"];
  }
  if ((BSEqualObjects() & 1) == 0) {
    [v10 setNeedsUpdateZStackParticipantPreferencesWithReason:@"PIP context moved to new scene"];
  }
  [a1[6] _updateHyperregionComposers];
  [v7 setNeedsLayout];
  [v7 layoutIfNeeded];
  id v8 = [a1[4] containerViewController];
  id v9 = [v8 interactionController];
  [v9 finishTransitionToWindowScene:a1[5]];

  [a1[6] _refreshLockStateProviderInterruptionAssertions];
}

- (void)_performWithoutAnimation:(id)a3
{
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F42FF0] _isInRetargetableAnimationBlock];
  BOOL v5 = (void *)MEMORY[0x1E4F42FF0];
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__SBPIPController__performWithoutAnimation___block_invoke;
    v6[3] = &unk_1E6AF5300;
    id v7 = v3;
    [v5 _performWithoutRetargetingAnimations:v6];
  }
  else
  {
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v3];
  }
}

uint64_t __44__SBPIPController__performWithoutAnimation___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F42FF0] performWithoutAnimation:*(void *)(a1 + 32)];
}

- (void)_updateHyperregionComposers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(NSMapTable *)self->_containerViewControllerToContextMap objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 containerViewController];
        id v10 = [v9 interactionController];

        if (v10)
        {
          id v11 = [v8 containerViewController];
          id v12 = [(NSHashTable *)self->_connectedWindowScenes allObjects];
          [v11 setConnectedWindowScenes:v12];

          [v10 reloadHyperregionComposerData];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (id)_overrideInsetsOnWindowScene:(id)a3 forReason:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  windowSceneToInsetAssertionMap = self->_windowSceneToInsetAssertionMap;
  if (!windowSceneToInsetAssertionMap)
  {
    id v12 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    long long v13 = self->_windowSceneToInsetAssertionMap;
    self->_windowSceneToInsetAssertionMap = v12;

    windowSceneToInsetAssertionMap = self->_windowSceneToInsetAssertionMap;
  }
  long long v14 = [(NSMapTable *)windowSceneToInsetAssertionMap objectForKey:v8];
  if (!v14)
  {
    objc_initWeak(&location, self);
    long long v15 = (void *)MEMORY[0x1E4F4F6E8];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__SBPIPController__overrideInsetsOnWindowScene_forReason_identifier___block_invoke;
    v19[3] = &unk_1E6B0CF28;
    objc_copyWeak(&v21, &location);
    id v16 = v8;
    id v20 = v16;
    long long v14 = [v15 assertionWithIdentifier:@"SBPIPControllerInsetOverrideAssertion" stateDidChangeHandler:v19];
    [(NSMapTable *)self->_windowSceneToInsetAssertionMap setObject:v14 forKey:v16];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  id v17 = [v14 acquireForReason:v9 withContext:v10];
  [(SBPIPController *)self _updateContainerViewControllersContentPaddingOnWindowScene:v8];

  return v17;
}

void __69__SBPIPController__overrideInsetsOnWindowScene_forReason_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateContainerViewControllersContentPaddingOnWindowScene:*(void *)(a1 + 32)];
}

void __66__SBPIPController__shouldStashForTransitionContext_onWindowScene___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 containerViewController];
  int v6 = [v5 handleStashingForTransitionContext:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (BOOL)_hasStashAssertionForWindowScene:(id)a3
{
  id v3 = [(NSMapTable *)self->_windowSceneToStashAssertionsMap objectForKey:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)containerViewController:(id)a3 userDidUpdateStashState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    id v8 = [(SBPIPController *)self _contextForContainerViewController:v6];
    id v9 = [v8 windowScene];

    if (![(SBPIPController *)self _hasStashAssertionForWindowScene:v9])
    {
      id v10 = SBLogPIP();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "[Assertions] No assertions found upon user stashing, starting resources usage reduction timer.", v23, 2u);
      }

      self->_defaultToStashed = 1;
      self->_isReducingResourcesUsage = 1;
      id v11 = [v7 overrideResourcesUsageReductionTimeout];

      if (v11)
      {
        id v12 = [v7 overrideResourcesUsageReductionTimeout];
        [v12 doubleValue];
        double v14 = v13;
      }
      else
      {
        double v14 = 30.0;
      }
      [v7 startResourcesUsageReductionAfterTimeout:v14];
    }
  }
  else
  {
    self->_defaultToStashed = 0;
    self->_isReducingResourcesUsage = 0;
    [v6 stopResourcesUsageReduction];
    p_transitionStashAssertion = &self->_transitionStashAssertion;
    id WeakRetained = objc_loadWeakRetained((id *)p_transitionStashAssertion);
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained invalidate];
      objc_storeWeak((id *)p_transitionStashAssertion, 0);
    }
  }

  id v17 = +[SBApplicationTestingManager sharedInstance];
  uint64_t v18 = [v17 currentTestName];

  if (v18
    && (([v18 containsString:@"PIP"] & 1) != 0
     || [v18 containsString:@"PiP"]))
  {
    long long v19 = @"SBApplicationTestingPIPIsNoLongerStashed";
    if (v4) {
      long long v19 = @"SBApplicationTestingPIPIsStashed";
    }
    id v20 = (void *)MEMORY[0x1E4F28EB8];
    id v21 = v19;
    uint64_t v22 = [v20 defaultCenter];
    [v22 postNotificationName:v21 object:0];
  }
}

- (void)containerViewControllerUserMayUpdateStashState:(id)a3
{
  if (self->_isReducingResourcesUsage) {
    [a3 stopResourcesUsageReduction];
  }
}

- (void)containerViewController:(id)a3 didFinishStartAnimationWithInitialInterfaceOrientation:(int64_t)a4
{
  id v9 = [(SBPIPController *)self _contextForContainerViewController:a3];
  id v6 = [v9 window];
  uint64_t v7 = [v6 interfaceOrientation];

  if (v7 != a4)
  {
    id v8 = [v9 windowScene];
    -[SBPIPController _updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:](self, "_updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:", v8, 1, 0, [(id)SBApp activeInterfaceOrientation], 1);
  }
}

- (void)addContainerViewController:(id)a3 dataSource:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 contentViewController];
  uint64_t v10 = [(SBPIPController *)self containerViewControllerForContentViewController:v9];

  if (v10)
  {
    long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"SBPIPController.m", 786, @"call to addContainerViewController: for a containerViewController whose contentViewController is already contained by some other controller. Passed containerViewController: %@ Preexisting containerViewController: %@", v7, v10 object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneManager);
  id v12 = [v7 scenePersistenceIdentifier];
  id v13 = [WeakRetained windowSceneForPersistentIdentifier:v12];

  uint64_t v14 = [WeakRetained embeddedDisplayWindowScene];
  uint64_t v15 = [WeakRetained activeDisplayWindowScene];
  if (!v13)
  {
    if ([(SBPIPController *)self contentType] == 1) {
      id v16 = (void *)v14;
    }
    else {
      id v16 = (void *)v15;
    }
    id v13 = v16;
  }
  id v17 = [v13 pictureInPictureManager];
  [v17 _updateFloatingDockInsetsWithoutNotifyingControllers];

  if (![(NSHashTable *)self->_connectedWindowScenes containsObject:v13]) {
    [(SBPIPController *)self _windowSceneDidConnect:v13];
  }
  if (![(NSHashTable *)self->_connectedWindowScenes containsObject:v14]) {
    [(SBPIPController *)self _windowSceneDidConnect:v14];
  }
  if ([(SBPIPController *)self contentType] != 1
    && ![(NSHashTable *)self->_connectedWindowScenes containsObject:v15])
  {
    [(SBPIPController *)self _windowSceneDidConnect:v15];
  }
  uint64_t v40 = (void *)v15;
  id v18 = [(SBPIPController *)self _createNewWindowForContainerViewController:v7 onWindowScene:v13];
  long long v19 = [(SBPIPController *)self _contextForContainerViewController:v7];
  id v20 = [v19 windowScene];

  if (v20 != v13)
  {
    long long v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2 object:self file:@"SBPIPController.m" lineNumber:814 description:@"Following -_createNewWindowForContainerViewController: we expect a non-nil context matching the provided window scene"];
  }
  [v7 addObserver:self];
  id v21 = [(NSHashTable *)self->_connectedWindowScenes allObjects];
  [v7 setConnectedWindowScenes:v21];

  [(SBPIPController *)self _pictureInPictureWindowMarginsOnWindowScene:v13];
  objc_msgSend(v7, "setContentViewPadding:");
  objc_msgSend(v7, "setInteractionControllerEnabled:stashed:dataSource:", 0, -[SBPIPController _hasStashAssertionForWindowScene:](self, "_hasStashAssertionForWindowScene:", v13), v8);
  [v7 setInteractionObserver:self];
  [(SBPIPController *)self _minimumStashedPaddingDidChangeOnWindowScene:v13];
  [v7 setInteractionsEnabled:1];
  [(SBPIPController *)self _updateHyperregionComposers];
  if (*((unsigned char *)self + 248)) {
    [(SBPIPControllerAdapter *)self->_adapter pipController:self didAddContainerViewController:v7];
  }
  double v41 = (void *)v14;
  uint64_t v22 = [v7 processIdentifier];
  uint64_t v23 = [v7 scenePersistenceIdentifier];
  uint64_t v24 = [(SBPIPController *)self pictureInPictureMorphAnimatorControllerForProcessIdentifier:v22 scenePersistenceIdentifier:v23];

  if (v24) {
    [v24 setPictureInPictureContainerViewController:v7];
  }
  long long v25 = (void *)v10;
  if ((*((unsigned char *)self + 249) & 8) != 0
    && [(SBPIPControllerAdapter *)self->_adapter preventStashAssertionsForPIPController:self])
  {
    id v39 = v8;
    long long v26 = [(NSMapTable *)self->_windowSceneToStashAssertionsMap objectForKey:v13];
    long long v27 = (void *)[v26 copy];

    self->_defaultToStashed = 0;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v43;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v43 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * v32++) invalidate];
        }
        while (v30 != v32);
        uint64_t v30 = [v28 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v30);
    }

    id v8 = v39;
  }
  [(SBPIPController *)self invalidateIdleTimerBehaviors];
  int v33 = [v7 viewIfLoaded];
  id v34 = [v33 window];
  uint64_t v35 = [v34 _sbWindowScene];
  id v36 = [v35 pictureInPictureManager];

  [v36 setNeedsUpdateZStackParticipantPreferencesWithReason:@"added container view controller"];
}

- (id)containerViewControllersOnWindowScene:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__SBPIPController_containerViewControllersOnWindowScene___block_invoke;
    v9[3] = &unk_1E6B0CF78;
    id v10 = v5;
    id v6 = v5;
    [(SBPIPController *)self _enumerateContextsForWindowScene:v4 usingBlock:v9];
    id v7 = (void *)[v6 copy];
  }
  else
  {
    id v7 = [(SBPIPController *)self _allContainerViewControllers];
  }

  return v7;
}

void __57__SBPIPController_containerViewControllersOnWindowScene___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 containerViewController];
  [v2 addObject:v3];
}

uint64_t __40__SBPIPController_hostedAppSceneHandles__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hostedAppSceneHandle];
}

uint64_t __70__SBPIPController_isPresentingPictureInPictureRequiringMedusaKeyboard__block_invoke(uint64_t a1, void *a2)
{
  return [a2 requiresMedusaKeyboard];
}

- (id)containerViewControllerForContentViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSMapTable *)self->_containerViewControllerToContextMap keyEnumerator];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 contentViewController];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeContainerViewController:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogPIP();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v7 = SBLogCommon();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v8)
    {
      id v9 = _SBFLoggingMethodProem();
      NSLog(&cfstr_NeedsToBeInvok.isa, v9);
    }
  }
  [(SBPIPController *)self _updateZStackIfNeededForDisappearingContainerViewController:v4];
  id v10 = [(NSMapTable *)self->_containerViewControllerToContextMap objectForKey:v4];
  if (v10)
  {
    if ((*((unsigned char *)self + 248) & 2) != 0) {
      [(SBPIPControllerAdapter *)self->_adapter pipController:self willRemoveContainerViewController:v4];
    }
    [v4 removeObserver:self];
    [v4 setInteractionsEnabled:0];
    [v4 invalidate];
    id v11 = [v10 window];
    [v11 setHidden:1];
    [(NSMapTable *)self->_containerViewControllerToContextMap removeObjectForKey:v4];
    [(SBPIPController *)self invalidateIdleTimerBehaviors];
    long long v12 = [v10 windowScene];
    long long v13 = [(SBPIPController *)self _leadingWindowForWindowScene:v12];
    long long v14 = v13;
    if (v13 && ([v13 isHidden] & 1) == 0) {
      -[SBPIPController _updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:](self, "_updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:", v12, 1, 0, [(id)SBApp activeInterfaceOrientation], 1);
    }
  }
}

- (void)_updateZStackIfNeededForDisappearingContainerViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 viewIfLoaded];
  id v6 = [v5 window];
  uint64_t v7 = [v6 _sbWindowScene];
  BOOL v8 = [v7 pictureInPictureManager];

  if ([v4 shouldSuppressAssociatedElementsInSystemAperture])
  {
    id v9 = [v4 bundleIdentifier];
  }
  else
  {
    id v9 = 0;
  }
  objc_storeStrong((id *)&self->_bundleIDForAppRecentlyStoppingPIP, v9);
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SBPIPController__updateZStackIfNeededForDisappearingContainerViewController___block_invoke;
  block[3] = &unk_1E6AF4E00;
  id v14 = v9;
  long long v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
}

uint64_t __79__SBPIPController__updateZStackIfNeededForDisappearingContainerViewController___block_invoke(uint64_t a1)
{
  uint64_t result = BSEqualStrings();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 184);
    *(void *)(v3 + 184) = 0;

    uint64_t v5 = *(void **)(a1 + 48);
    return [v5 setNeedsUpdateZStackParticipantPreferencesWithReason:@"removed container view controller"];
  }
  return result;
}

- (void)prepareContainerViewControllerForHidingContentViewController:(id)a3
{
  id v14 = [(SBPIPController *)self containerViewControllerForContentViewController:a3];
  id v4 = [v14 bundleIdentifier];
  uint64_t v5 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  id v6 = [v5 currentLayoutState];

  if ((unint64_t)([v6 floatingConfiguration] - 1) <= 1)
  {
    uint64_t v7 = [v6 elementWithRole:3];
    BOOL v8 = [v7 workspaceEntity];
    id v9 = [v8 applicationSceneEntity];
    dispatch_time_t v10 = [v9 application];
    id v11 = [v10 bundleIdentifier];

    if (([v4 isEqualToString:v11] & 1) == 0)
    {
      id v12 = [(SBPIPController *)self _contextForContainerViewController:v14];
      long long v13 = [v12 windowScene];

      [(SBPIPController *)self _setWindowsLevel:v13 forWindowsOnWindowScene:self->_windowLevel];
    }
  }
}

- (void)restoreContentViewController:(id)a3 appSceneEntity:(id)a4 morphAnimatorConfigurationBlock:(id)a5 completion:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = (void (**)(void, void *))a5;
  id v13 = a6;
  id v14 = [(SBPIPController *)self containerViewControllerForContentViewController:a3];
  long long v15 = v14;
  if (v14)
  {
    SEL v37 = a2;
    long long v38 = v12;
    uint64_t v16 = [v14 processIdentifier];
    [v11 setFlag:1 forActivationSetting:57];
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBPIPController contentType](self, "contentType"));
    [v11 setObject:v17 forActivationSetting:58];

    id v18 = +[SBMainWorkspace sharedInstance];
    long long v19 = [v11 sceneHandle];
    id v20 = [v19 displayIdentity];
    id v21 = [v20 currentConfiguration];
    uint64_t v22 = [v18 createRequestWithOptions:0 displayConfiguration:v21];

    uint64_t v23 = [MEMORY[0x1E4F4F7F8] processHandle];
    [v22 setOriginatingProcess:v23];

    [v22 setSource:45];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke;
    v43[3] = &unk_1E6AF57C0;
    id v24 = v11;
    id v44 = v24;
    [v22 modifyApplicationContext:v43];
    long long v25 = [v24 sceneHandle];
    long long v26 = [v25 persistenceIdentifier];
    long long v27 = [(SBPIPController *)self pictureInPictureMorphAnimatorControllerForProcessIdentifier:v16 scenePersistenceIdentifier:v26];

    if (v27)
    {
      id v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:v37, self, @"SBPIPController.m", 978, @"An SBPIPMorphAnimatorController for pid %ui is already running, can't create new one.", v16 object file lineNumber description];
    }
    id v28 = [v22 uniqueID];
    uint64_t v29 = [v24 sceneHandle];
    uint64_t v30 = [v29 persistenceIdentifier];

    uint64_t v31 = -[SBPIPController createAndRegisterPictureInPictureMorphAnimatorControllerWithTargetProcessIdentifier:uuid:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:gestureInitiated:direction:](self, "createAndRegisterPictureInPictureMorphAnimatorControllerWithTargetProcessIdentifier:uuid:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:gestureInitiated:direction:", v16, v28, v30, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 1);

    [v31 setPictureInPictureContainerViewController:v15];
    [v15 setInteractionsEnabled:0];
    [v15 acquireInterfaceOrientationLock];
    id v12 = v38;
    v38[2](v38, v31);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke_2;
    v39[3] = &unk_1E6AFA2A0;
    id v40 = v15;
    id v32 = v31;
    id v41 = v32;
    id v42 = v13;
    id v33 = (id)[v22 addCompletionHandler:v39];
    id v34 = SBLogPIP();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v46 = v32;
      _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "morphAnimatorController will executeTransitionRequest %p", buf, 0xCu);
    }

    uint64_t v35 = +[SBMainWorkspace sharedInstance];
    [v35 executeTransitionRequest:v22];
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

uint64_t __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActivatingEntity:*(void *)(a1 + 32)];
}

uint64_t __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) relinquishInterfaceOrientationLock];
  v2 = SBLogPIP();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    int v4 = [v3 hasCompletedSourceAnimations];
    int v5 = [*(id *)(a1 + 40) hasCompletedTargetAnimations];
    int v9 = 138543874;
    dispatch_time_t v10 = v3;
    __int16 v11 = 1024;
    int v12 = v4;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "morphAnimatorController %{public}@ hasCompletedSourceAnimations: %{BOOL}u hasCompletedTargetAnimations: %{BOOL}u", (uint8_t *)&v9, 0x18u);
  }

  id v6 = (id *)(a1 + 40);
  if (![*(id *)(a1 + 40) hasCompletedSourceAnimations]
    || ([*v6 hasCompletedTargetAnimations] & 1) == 0)
  {
    uint64_t v7 = SBLogPIP();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke_2_cold_1((uint64_t *)(a1 + 40), v7);
    }

    [*v6 cancel];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_refreshLockStateProviderInterruptionAssertions
{
  BOOL v3 = [(SBPIPController *)self _allWindowScenesLocked];
  p_lockedInterruptionAssertion = &self->_lockedInterruptionAssertion;
  lockedInterruptionAssertion = self->_lockedInterruptionAssertion;
  if (v3)
  {
    if (lockedInterruptionAssertion) {
      return;
    }
    uint64_t v7 = SBStringForPIPBehaviorOverrideReason(2uLL);
    obuint64_t j = [(SBPIPController *)self _acquireInterruptionAssertionForReason:2 identifier:v7 cameraSensorBundleIdentifier:0];

    id v6 = obj;
    if (obj)
    {
      objc_storeStrong((id *)&self->_lockedInterruptionAssertion, obj);
      [(SBPIPController *)self _suspendPIPForInterruptionAssertion:obj];
      id v6 = obj;
    }
  }
  else
  {
    [(BSSimpleAssertion *)lockedInterruptionAssertion invalidate];
    id v6 = *p_lockedInterruptionAssertion;
    *p_lockedInterruptionAssertion = 0;
  }
}

- (void)lockStateProvider:(id)a3 didUpdateIsUILocked:(BOOL)a4
{
  if (a4) {
    [(SBPIPController *)self _didLockStateProviderLock:a3];
  }
  else {
    [(SBPIPController *)self _didLockStateProviderUnlock:a3];
  }
}

- (void)setPictureInPictureWindowsHidden:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [(NSMutableSet *)self->_pictureInPictureWindowHiddenReasons containsObject:v6];
  if (v4)
  {
    if (v7) {
      goto LABEL_15;
    }
    [(NSMutableSet *)self->_pictureInPictureWindowHiddenReasons addObject:v6];
    if ([(NSMutableSet *)self->_pictureInPictureWindowHiddenReasons count] != 1) {
      goto LABEL_15;
    }
  }
  else
  {
    if (!v7) {
      goto LABEL_15;
    }
    [(NSMutableSet *)self->_pictureInPictureWindowHiddenReasons removeObject:v6];
    if ([(NSMutableSet *)self->_pictureInPictureWindowHiddenReasons count]) {
      goto LABEL_15;
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v8 = [(SBPIPController *)self _windowScenesDisplayingPIPContent];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBPIPController *)self _managePictureInPictureWindowVisibilityForWindowScene:*(void *)(*((void *)&v13 + 1) + 8 * v12++) animated:1];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

LABEL_15:
}

- (id)acquireStashAssertionForWindowScene:(id)a3 withReason:(int64_t)a4 identifier:(id)a5
{
  return [(SBPIPController *)self _acquireStashAssertionForWindowScene:a3 withReason:a4 identifier:a5 customAllowedEnvironmentModes:0];
}

- (id)_acquireStashAssertionForWindowScene:(id)a3 withReason:(int64_t)a4 identifier:(id)a5 customAllowedEnvironmentModes:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ((*((unsigned char *)self + 249) & 8) != 0
    && ([(SBPIPControllerAdapter *)self->_adapter preventStashAssertionsForPIPController:self] & 1) != 0)
  {
    long long v13 = 0;
  }
  else
  {
    windowSceneToStashAssertionsMap = self->_windowSceneToStashAssertionsMap;
    if (!windowSceneToStashAssertionsMap)
    {
      long long v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      long long v16 = self->_windowSceneToStashAssertionsMap;
      self->_windowSceneToStashAssertionsMap = v15;

      windowSceneToStashAssertionsMap = self->_windowSceneToStashAssertionsMap;
    }
    uint64_t v17 = [(NSMapTable *)windowSceneToStashAssertionsMap objectForKey:v10];
    if (!v17)
    {
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      [(NSMapTable *)self->_windowSceneToStashAssertionsMap setObject:v17 forKey:v10];
    }
    objc_initWeak(&location, self);
    uint64_t v18 = [SBPIPStashAssertion alloc];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __108__SBPIPController__acquireStashAssertionForWindowScene_withReason_identifier_customAllowedEnvironmentModes___block_invoke;
    v24[3] = &unk_1E6B04EE0;
    objc_copyWeak(&v27, &location);
    v24[4] = self;
    id v19 = v17;
    id v25 = v19;
    id v20 = v10;
    id v26 = v20;
    id v21 = [(SBPIPEnvironmentDependentOverrideAssertion *)v18 initWithReason:a4 identifier:v11 windowScene:v20 invalidationBlock:v24];
    long long v13 = v21;
    if (v21)
    {
      if (v12) {
        [(SBPIPEnvironmentDependentOverrideAssertion *)v21 setAllowedEnvironmentModes:v12];
      }
      [v19 addObject:v13];
      [(SBPIPController *)self _setContainersStashed:1 forWindowScene:v20];
      uint64_t v22 = SBLogPIP();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v13;
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "[Assertions] Stash assertion was acquired: %{public}@. Stashing.", buf, 0xCu);
      }
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v13;
}

void __108__SBPIPController__acquireStashAssertionForWindowScene_withReason_identifier_customAllowedEnvironmentModes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a2;
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    int v5 = *(void **)(a1 + 32);
    if ((__CFString *)v5[18] == v3) {
      [v5 _cancelInterruptionDebouncingTimer];
    }
    [*(id *)(a1 + 40) removeObject:v3];
    id v6 = SBLogPIP();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[Assertions] Stash assertion was invalidated: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    if (([WeakRetained _hasStashAssertionForWindowScene:*(void *)(a1 + 48)] & 1) == 0)
    {
      int v7 = SBLogPIP();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Assertions] No more stash assertions in place.", (uint8_t *)&v10, 2u);
      }

      [WeakRetained _setContainersStashed:WeakRetained[168] forWindowScene:*(void *)(a1 + 48)];
      BOOL v8 = SBLogPIP();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        if (WeakRetained[168]) {
          uint64_t v9 = @"stashed";
        }
        else {
          uint64_t v9 = @"normal";
        }
        int v10 = 138543362;
        id v11 = v9;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[Assertions] Setting stash to: %{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)_invalidateInterruptionAssertion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogPIP();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Assertions] Interruption assertion was invalidated: %{public}@", buf, 0xCu);
  }

  NSUInteger v6 = [(NSHashTable *)self->_interruptionAssertions count];
  int v7 = SBLogPIP();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Assertions] Stop interrupting PIP for expired assertion.", buf, 2u);
    }

    [(SBPIPController *)self endPIPInterruptionForAssertion:v4];
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Assertions] No more interruption assertions in place.", buf, 2u);
    }

    if (self->_stashForInterruptionAssertion)
    {
      uint64_t v9 = SBLogPIP();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[Assertions] Start PIP interruption debounce timer.", buf, 2u);
      }

      int v10 = self->_stashForInterruptionAssertion;
      id v11 = [(BSAbsoluteMachTimer *)[SBPIPInterruptionDebouncingTimer alloc] initWithIdentifier:@"SBPIPController.interruptionEndDebouncingTimer"];
      interruptionEndDebouncingTimer = self->_interruptionEndDebouncingTimer;
      self->_interruptionEndDebouncingTimer = v11;

      long long v13 = self->_interruptionEndDebouncingTimer;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__SBPIPController__invalidateInterruptionAssertion___block_invoke;
      v17[3] = &unk_1E6B0CFC0;
      v17[4] = self;
      id v14 = v4;
      id v18 = v14;
      id v19 = v10;
      long long v15 = v10;
      [(BSAbsoluteMachTimer *)v13 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v17 queue:2.0 handler:0.0];
      [(SBPIPInterruptionDebouncingTimer *)self->_interruptionEndDebouncingTimer setDebouncedAssertion:v14];
    }
    else
    {
      [(SBPIPController *)self endPIPInterruptionForAssertion:v4];
      long long v16 = SBLogPIP();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "[Assertions] If necessary, stop interrupting PIP immediately, since we don't have an interruption stash assertion.", buf, 2u);
      }
    }
  }
}

void __52__SBPIPController__invalidateInterruptionAssertion___block_invoke(uint64_t a1)
{
  v2 = SBLogPIP();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "[Assertions] PIP interruption debounce timer expired. Stop interrupting PIP for previously expired assertion.", buf, 2u);
  }

  [*(id *)(a1 + 32) endPIPInterruptionForAssertion:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 112) count];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v3 && *(void *)(a1 + 48) == *(void *)(v4 + 144))
  {
    int v5 = SBLogPIP();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Assertions] Invalidate any stash-for-interruption assertion since no assertion is in place after interruption debouncing.", v10, 2u);
    }

    [*(id *)(a1 + 48) invalidate];
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(void **)(v6 + 144);
    *(void *)(v6 + 144) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
  }
  [*(id *)(v4 + 160) invalidate];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 160);
  *(void *)(v8 + 160) = 0;
}

uint64_t __55__SBPIPController__suspendPIPForInterruptionAssertion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _acquireStashAssertionForWindowScene:a2 withReason:3 identifier:*(void *)(a1 + 40) customAllowedEnvironmentModes:*(void *)(a1 + 48)];
}

void __55__SBPIPController__suspendPIPForInterruptionAssertion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "invalidate", (void)v11);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v10 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 18) == v3)
  {
    *((void *)WeakRetained + 18) = 0;
  }
}

void __98__SBPIPController__acquireInterruptionAssertionForReason_identifier_cameraSensorBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[14] removeObject:v5];
    [v4 _invalidateInterruptionAssertion:v5];
  }
}

- (BOOL)isStoppingOrCancellingPictureInPictureForApplicationWithBundleIdentifier:(id)a3 scenePersistenceIdentifier:(id)a4
{
  return [(SBPIPControllerAdapter *)self->_adapter isStoppingOrCancellingPictureForPIPController:self applicationWithBundleIdentifier:a3 scenePersistenceIdentifier:a4];
}

- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3
{
  return [(SBPIPControllerAdapter *)self->_adapter tetheringModeForScenePersistenceIdentifier:a3];
}

- (void)startPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a6;
  if ([(SBPIPController *)self shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:v8 scenePersistenceIdentifier:v10])
  {
    long long v12 = +[SBApplicationController sharedInstanceIfExists];
    long long v13 = [v12 applicationWithPid:v8];
    long long v14 = [v13 bundleIdentifier];

    objc_storeStrong((id *)&self->_bundleIDForAppAnimatingPIPStartInBackground, v14);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneManager);
    uint64_t v16 = [WeakRetained windowSceneForPersistentIdentifier:v10];
    uint64_t v17 = [v16 pictureInPictureManager];

    [v17 setNeedsUpdateZStackParticipantPreferencesWithReason:@"background PIP starting"];
    [v17 _updateFloatingDockInsetsWithoutNotifyingControllers];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __148__SBPIPController_startPictureInPictureForApplicationWithProcessIdentifierEnteringBackground_scenePersistenceIdentifier_animated_completionHandler___block_invoke;
    id v25 = &unk_1E6B0D038;
    id v26 = self;
    id v29 = v11;
    id v18 = v14;
    id v27 = v18;
    id v19 = v17;
    id v28 = v19;
    uint64_t v20 = MEMORY[0x1D948C7A0](&v22);
    id v21 = (void *)v20;
    if ((*((unsigned char *)self + 248) & 0x10) != 0) {
      -[SBPIPControllerAdapter pipController:didStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:animated:completionHandler:](self->_adapter, "pipController:didStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:scenePersistenceIdentifier:animated:completionHandler:", self, v8, v10, v7, v20, v22, v23, v24, v25, v26, v27);
    }
    else {
      (*(void (**)(uint64_t, uint64_t, void))(v20 + 16))(v20, 1, 0);
    }
  }
}

uint64_t __148__SBPIPController_startPictureInPictureForApplicationWithProcessIdentifierEnteringBackground_scenePersistenceIdentifier_animated_completionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a1[4];
  id v5 = a3;
  [v4 invalidateIdleTimerBehaviors];
  (*(void (**)(void))(a1[7] + 16))();

  if (BSEqualStrings())
  {
    uint64_t v6 = a1[4];
    BOOL v7 = *(void **)(v6 + 176);
    *(void *)(v6 + 176) = 0;
  }
  uint64_t v8 = (void *)a1[6];
  return [v8 setNeedsUpdateZStackParticipantPreferencesWithReason:@"background PIP started"];
}

- (void)cancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4
{
  if ((*((unsigned char *)self + 248) & 0x20) != 0) {
    [(SBPIPControllerAdapter *)self->_adapter pipController:self didCancelPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:*(void *)&a3 scenePersistenceIdentifier:a4];
  }
}

- (void)endPIPInterruptionForAssertion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogPIP();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "end interruption for %{public}@", (uint8_t *)&v6, 0xCu);
  }

  if ((*((unsigned char *)self + 248) & 8) != 0) {
    [(SBPIPControllerAdapter *)self->_adapter pipController:self willEndPIPInterruptionForAssertion:v4];
  }
  [(SBPIPController *)self invalidateIdleTimerBehaviors];
}

- (void)updatePictureInPictureWindowLevelForWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pictureInPictureManager];
  id v11 = [v5 _windowLevelOverrideAssertionsForContentType:0];

  if ([v11 count])
  {
    int v6 = [v11 lastObject];
    double windowLevel = (double)(unint64_t)[v6 windowLevel];
  }
  else
  {
    double windowLevel = self->_windowLevel;
  }
  [(SBPIPController *)self _setWindowsLevel:v4 forWindowsOnWindowScene:windowLevel];
  uint64_t v8 = [(SBPIPController *)self _leadingWindowForWindowScene:v4];

  [v8 windowLevel];
  double v10 = v9;

  if (v10 != windowLevel && (*((unsigned char *)self + 249) & 2) != 0) {
    [(SBPIPControllerAdapter *)self->_adapter windowLevelDidChangeForPIPController:self];
  }
}

- (void)handleDestructionRequestForSceneHandles:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMapTable *)self->_containerViewControllerToContextMap keyEnumerator];
  int v6 = [v5 allObjects];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v12 = [v11 hostedAppSceneHandle];
        if ([v4 containsObject:v12]) {
          [v11 handleDestructionRequestForSceneHandle:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)updateZStackParticipantPreferencesIfNeeded:(id)a3 windowScene:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v6 = a4;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__118;
  id v32 = __Block_byref_object_dispose__118;
  id v33 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__SBPIPController_updateZStackParticipantPreferencesIfNeeded_windowScene___block_invoke;
  v27[3] = &unk_1E6B0D060;
  v27[4] = &v28;
  uint64_t v7 = (void (**)(void))MEMORY[0x1D948C7A0](v27);
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      double v10 = v9;
    }
    else {
      double v10 = 0;
    }
  }
  else
  {
    double v10 = 0;
  }
  id v11 = v10;

  long long v12 = [(SBPIPController *)self containerViewControllersOnWindowScene:v11];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v17 shouldSuppressAssociatedElementsInSystemAperture])
        {
          uint64_t v18 = [v17 bundleIdentifier];
          if (v18)
          {
            id v19 = v7[2](v7);
            [v19 addObject:v18];
          }
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v34 count:16];
    }
    while (v14);
  }

  if (self->_bundleIDForAppRecentlyStoppingPIP)
  {
    uint64_t v20 = v7[2](v7);
    [v20 addObject:self->_bundleIDForAppRecentlyStoppingPIP];
  }
  if (self->_bundleIDForAppAnimatingPIPStartInBackground)
  {
    id v21 = v7[2](v7);
    [v21 addObject:self->_bundleIDForAppAnimatingPIPStartInBackground];
  }
  [(id)v29[5] removeObject:@"com.apple.InCallService"];
  [v22 setAssociatedBundleIdentifiersToSuppressInSystemAperture:v29[5]];

  _Block_object_dispose(&v28, 8);
}

id __74__SBPIPController_updateZStackParticipantPreferencesIfNeeded_windowScene___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  return v2;
}

- (void)setEnhancedWindowingModeEnabled:(BOOL)a3 windowScene:(id)a4
{
  if ((*((unsigned char *)self + 249) & 0x10) != 0) {
    [(SBPIPControllerAdapter *)self->_adapter pipController:self didUpdateEnhancedWindowingModeEnabled:a3 windowScene:a4];
  }
}

- (double)windowLevelForWindowScene:(id)a3
{
  uint64_t v3 = [(SBPIPController *)self _leadingWindowForWindowScene:a3];
  [v3 windowLevel];
  double v5 = v4;

  return v5;
}

- (BOOL)hasCameraInterruptionForBundleIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMutableDictionary *)self->_cameraInterruptionAssertions allKeys];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SBPIPController_hasCameraInterruptionForBundleIdentifier___block_invoke;
  v9[3] = &unk_1E6B0D088;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __60__SBPIPController_hasCameraInterruptionForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)hideContainersExcludingContainerForContentViewControllerAndTetheredOnes:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [(SBPIPController *)self containerViewControllerForContentViewController:v6];
  uint64_t v8 = [(SBPIPController *)self _contextForContainerViewController:v7];
  id v9 = [v8 windowScene];

  if (v9)
  {
    id v10 = [v7 tetheringContainerViewController];
    id v11 = (void *)MEMORY[0x1E4F42FF0];
    if (v4) {
      double v12 = 0.1;
    }
    else {
      double v12 = 0.0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __100__SBPIPController_hideContainersExcludingContainerForContentViewControllerAndTetheredOnes_animated___block_invoke;
    v14[3] = &unk_1E6AF59B8;
    v14[4] = self;
    id v15 = v9;
    id v16 = v6;
    id v17 = v10;
    id v13 = v10;
    [v11 animateWithDuration:v14 animations:v12];
  }
}

void __100__SBPIPController_hideContainersExcludingContainerForContentViewControllerAndTetheredOnes_animated___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "containerViewControllersOnWindowScene:", *(void *)(a1 + 40), 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = [v7 contentViewController];
        id v9 = *(void **)(a1 + 48);

        if (v8 != v9)
        {
          id v10 = [v7 tetheringContainerViewController];
          if (!v10)
          {
            if (v7 == *(void **)(a1 + 56)) {
              continue;
            }
            id v10 = [v7 view];
            [v10 setAlpha:0.0];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)bringTetheredContentToFrontOnWindowScene:(id)a3
{
  id v4 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SBPIPController_bringTetheredContentToFrontOnWindowScene___block_invoke;
  v6[3] = &unk_1E6B0D0B0;
  void v6[4] = v7;
  [(SBPIPController *)self _enumerateContextsForWindowScene:v4 usingBlock:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SBPIPController_bringTetheredContentToFrontOnWindowScene___block_invoke_2;
  v5[3] = &unk_1E6B0D0B0;
  v5[4] = v7;
  [(SBPIPController *)self _enumerateContextsForWindowScene:v4 usingBlock:v5];
  _Block_object_dispose(v7, 8);
}

void __60__SBPIPController_bringTetheredContentToFrontOnWindowScene___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 window];
  [v4 windowLevel];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = fmax(v3, *(double *)(*(void *)(*(void *)(a1 + 32) + 8)+ 24));
}

void __60__SBPIPController_bringTetheredContentToFrontOnWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = [v5 containerViewController];
  if ([v3 isActivelyTethered])
  {
    id v4 = [v5 window];
    [v4 setWindowLevel:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 0.01];
  }
}

- (void)showAllContentOnWindowScene:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = (void *)MEMORY[0x1E4F42FF0];
  v10[1] = 3221225472;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[2] = __56__SBPIPController_showAllContentOnWindowScene_animated___block_invoke;
  v10[3] = &unk_1E6AF5290;
  if (v4) {
    double v8 = 0.33;
  }
  else {
    double v8 = 0.0;
  }
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 animateWithDuration:0 delay:v10 options:0 animations:v8 completion:0.0];
}

uint64_t __56__SBPIPController_showAllContentOnWindowScene_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAlpha:*(void *)(a1 + 40) forWindowsOnWindowScene:1.0];
}

- (id)connectedWindowScenes
{
  return [(NSHashTable *)self->_connectedWindowScenes allObjects];
}

- (BOOL)_allWindowScenesLocked
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_connectedWindowScenes;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "uiLockStateProvider", (void)v11);
        int v8 = [v7 isUILocked];

        if (!v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)movePIPContentToWindowScene:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBPIPController *)self connectedWindowScenes];
  if ([v5 containsObject:v4])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(NSMapTable *)self->_containerViewControllerToContextMap objectEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v12 = [v11 windowScene];
          if (v12 != v4) {
            [(SBPIPController *)self _moveContext:v11 toWindowScene:v4];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_startPictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a3
{
  if (*((char *)self + 248) < 0) {
    [(SBPIPControllerAdapter *)self->_adapter pipController:self willStartPictureInPictureTestActionForApplicationWithBundleIdentifier:a3];
  }
}

- (void)_restorePictureInPictureForTestForApplicationWithBundleIdentifier:(id)a3
{
  if (*((unsigned char *)self + 249)) {
    [(SBPIPControllerAdapter *)self->_adapter pipController:self willRestorePictureInPictureForTestForApplicationWithBundleIdentifier:a3];
  }
}

- (void)alertItemsController:(id)a3 didActivateAlertItem:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(SBPIPController *)self _windowScenesDisplayingPIPContent];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SBPIPController *)self updatePictureInPictureWindowLevelForWindowScene:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)alertItemsController:(id)a3 didDeactivateAlertItem:(id)a4 forReason:(int)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(SBPIPController *)self _windowScenesDisplayingPIPContent];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SBPIPController *)self updatePictureInPictureWindowLevelForWindowScene:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v9 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v9;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  [(SBPIPController *)self updatePictureInPictureWindowLevelForWindowScene:v8];
}

- (void)assistantDidDisappear:(id)a3 windowScene:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v9 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v9;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  [(SBPIPController *)self updatePictureInPictureWindowLevelForWindowScene:v8];
}

- (id)_createNewWindowForContainerViewController:(id)a3 onWindowScene:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogPIP();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v10 = SBLogCommon();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      long long v12 = _SBFLoggingMethodProem();
      NSLog(&cfstr_NeedsToBeInvok.isa, v12);
    }
  }
  long long v13 = [(SBPIPController *)self _contextForContainerViewController:v6 creatingWithWindowSceneIfNeeded:v7];
  long long v14 = [v13 window];
  if (!v14)
  {
    id v15 = [v13 windowScene];
    if (v15 != v7) {
      [(SBPIPController *)self _moveContext:v13 toWindowScene:v7];
    }
    long long v14 = [[SBPictureInPictureWindow alloc] initWithWindowScene:v15];
    [(SBPictureInPictureWindow *)v14 _setRoleHint:@"SBTraitsParticipantRolePictureInPicture"];
    [(SBPictureInPictureWindow *)v14 setRootViewController:v6];
    [(SBPictureInPictureWindow *)v14 setOpaque:0];
    [v13 setWindow:v14];
    [(SBPIPController *)self _edgeInsetsDidChangeOnWindowScene:v15];
    [(SBPIPController *)self updatePictureInPictureWindowLevelForWindowScene:v15];
    [(SBPIPController *)self _managePictureInPictureWindowVisibilityForWindowScene:v15 animated:0];
    [(SBPictureInPictureWindow *)v14 setHidden:0];
  }
  return v13;
}

- (void)_managePictureInPictureWindowVisibilityForWindowScene:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(NSMutableSet *)self->_pictureInPictureMorphAnimatorControllers count])
  {
    id v7 = [(SBPIPController *)self _leadingWindowForWindowScene:v6];
    int v8 = [v7 isHidden];

    BOOL v9 = [(SBPIPController *)self _shouldHideWindowScene:v6];
    BOOL v10 = !v9;
    if (!v9)
    {
      [(SBPIPController *)self _setHidden:0 forWindowsOnWindowScene:v6];
      if (v8)
      {
        if ((*((unsigned char *)self + 249) & 4) != 0) {
          [(SBPIPControllerAdapter *)self->_adapter windowVisibilityDidChangeForPIPController:self];
        }
      }
    }
    BOOL v11 = (void *)MEMORY[0x1E4F42FF0];
    if (v4) {
      double v12 = 0.2;
    }
    else {
      double v12 = 0.0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__SBPIPController__managePictureInPictureWindowVisibilityForWindowScene_animated___block_invoke;
    v16[3] = &unk_1E6AF5770;
    BOOL v18 = v10;
    void v16[4] = self;
    id v17 = v6;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__SBPIPController__managePictureInPictureWindowVisibilityForWindowScene_animated___block_invoke_2;
    v13[3] = &unk_1E6AFD0F0;
    v13[4] = self;
    id v14 = v17;
    char v15 = v8;
    [v11 animateWithDuration:v16 animations:v13 completion:v12];
  }
}

uint64_t __82__SBPIPController__managePictureInPictureWindowVisibilityForWindowScene_animated___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) _setAlpha:*(void *)(a1 + 40) forWindowsOnWindowScene:v1];
}

uint64_t __82__SBPIPController__managePictureInPictureWindowVisibilityForWindowScene_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldHideWindowScene:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) _setHidden:1 forWindowsOnWindowScene:*(void *)(a1 + 40)];
    if (!*(unsigned char *)(a1 + 48))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if ((*(unsigned char *)(v3 + 249) & 4) != 0)
      {
        BOOL v4 = *(void **)(v3 + 240);
        return objc_msgSend(v4, "windowVisibilityDidChangeForPIPController:");
      }
    }
  }
  return result;
}

- (void)_setAlpha:(double)a3 forWindowsOnWindowScene:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SBPIPController__setAlpha_forWindowsOnWindowScene___block_invoke;
  v4[3] = &__block_descriptor_40_e33_v24__0__SBPIPContentContext_8_B16l;
  *(double *)&v4[4] = a3;
  [(SBPIPController *)self _enumerateContextsForWindowScene:a4 usingBlock:v4];
}

void __53__SBPIPController__setAlpha_forWindowsOnWindowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 window];
  [v3 setAlpha:*(double *)(a1 + 32)];
}

- (void)_setHidden:(BOOL)a3 forWindowsOnWindowScene:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SBPIPController__setHidden_forWindowsOnWindowScene___block_invoke;
  v4[3] = &__block_descriptor_33_e33_v24__0__SBPIPContentContext_8_B16l;
  BOOL v5 = a3;
  [(SBPIPController *)self _enumerateContextsForWindowScene:a4 usingBlock:v4];
}

void __54__SBPIPController__setHidden_forWindowsOnWindowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 window];
  [v3 setHidden:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_setWindowsLevel:(double)a3 forWindowsOnWindowScene:(id)a4
{
  id v6 = a4;
  id v7 = [(NSMapTable *)self->_containerViewControllerToContextMap objectEnumerator];
  int v8 = [v7 allObjects];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__SBPIPController__setWindowsLevel_forWindowsOnWindowScene___block_invoke;
  v19[3] = &unk_1E6B0D118;
  id v9 = v6;
  id v20 = v9;
  BOOL v10 = objc_msgSend(v8, "bs_filter:", v19);
  BOOL v11 = [v10 sortedArrayUsingSelector:sel_contentZOrderPriority];

  uint64_t v12 = [v11 count];
  if (v12)
  {
    uint64_t v13 = v12;
    for (unint64_t i = 0; i != v13; ++i)
    {
      char v15 = [v11 objectAtIndex:i];
      uint64_t v16 = [v15 window];
      [v16 setWindowLevel:a3 + (double)i * 0.01];

      id v17 = [v15 containerViewController];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __60__SBPIPController__setWindowsLevel_forWindowsOnWindowScene___block_invoke_2;
      v18[3] = &__block_descriptor_40_e33_v16__0__SBSDisplayLayoutElement_8l;
      *(double *)&v18[4] = a3;
      [v17 updateDisplayLayoutElementWithBuilder:v18];
    }
  }
}

BOOL __60__SBPIPController__setWindowsLevel_forWindowsOnWindowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 windowScene];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

uint64_t __60__SBPIPController__setWindowsLevel_forWindowsOnWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setLevel:(uint64_t)*(double *)(a1 + 32)];
}

void __48__SBPIPController__leadingWindowForWindowScene___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  BOOL v5 = [v10 containerViewController];
  char v6 = [v5 isActivelyTethered];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [v10 window];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a3 = 1;
  }
}

- (void)_setContainersStashed:(BOOL)a3 forWindowScene:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SBPIPController__setContainersStashed_forWindowScene___block_invoke;
  v4[3] = &__block_descriptor_33_e33_v24__0__SBPIPContentContext_8_B16l;
  BOOL v5 = a3;
  [(SBPIPController *)self _enumerateContextsForWindowScene:a4 usingBlock:v4];
}

void __56__SBPIPController__setContainersStashed_forWindowScene___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 containerViewController];
  [v3 setStashed:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_lockStateDidChange:(id)a3
{
  id v8 = [a3 userInfo];
  BOOL v4 = [v8 objectForKey:@"SBAggregateLockStateKey"];
  if ([v4 intValue])
  {
  }
  else
  {
    BOOL v5 = +[SBWorkspace mainWorkspace];
    char v6 = [v5 transientOverlayPresentationManager];
    char v7 = [v6 hasActivePresentation];

    if ((v7 & 1) == 0)
    {
      [(SBPIPController *)self setPictureInPictureWindowsHidden:0 forReason:@"SBLockScreenPictureInPictureHiddenReason"];
    }
  }
}

- (id)createAndRegisterPictureInPictureMorphAnimatorControllerWithTargetProcessIdentifier:(int)a3 uuid:(id)a4 scenePersistenceIdentifier:(id)a5 appLayout:(id)a6 layoutRole:(int64_t)a7 appLayoutBoundingBox:(CGRect)a8 gestureInitiated:(BOOL)a9 direction:(int64_t)a10
{
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  uint64_t v18 = *(void *)&a3;
  p_windowSceneManager = &self->_windowSceneManager;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_windowSceneManager);
  long long v25 = [WeakRetained windowSceneForPersistentIdentifier:v22];

  LOBYTE(v28) = a9;
  long long v26 = -[SBPIPMorphAnimatorController initWithTargetProcessIdentifier:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:windowScene:direction:gestureInitiated:delegate:uuid:]([SBPIPMorphAnimatorController alloc], "initWithTargetProcessIdentifier:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:windowScene:direction:gestureInitiated:delegate:uuid:", v18, v22, v21, a7, v25, a10, x, y, width, height, v28, self, v23);

  [(SBPIPController *)self _addPictureInPictureMorphAnimatorController:v26];
  return v26;
}

- (void)_addPictureInPictureMorphAnimatorController:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    BOOL v5 = [v4 viewMorphAnimator];
    id v6 = [v5 windowScene];

    [(SBPIPController *)self _setHidden:0 forWindowsOnWindowScene:v6];
    [(NSMutableSet *)self->_pictureInPictureMorphAnimatorControllers addObject:v4];
  }
}

- (id)pictureInPictureMorphAnimatorControllerForProcessIdentifier:(int)a3 scenePersistenceIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__118;
  uint64_t v19 = __Block_byref_object_dispose__118;
  id v20 = 0;
  char v7 = [(NSMutableSet *)self->_pictureInPictureMorphAnimatorControllers allObjects];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__SBPIPController_pictureInPictureMorphAnimatorControllerForProcessIdentifier_scenePersistenceIdentifier___block_invoke;
  v11[3] = &unk_1E6B0D160;
  int v14 = a3;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v15;
  [v7 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __106__SBPIPController_pictureInPictureMorphAnimatorControllerForProcessIdentifier_scenePersistenceIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 targetProcessIdentifier] == *(_DWORD *)(a1 + 48))
  {
    char v7 = [v9 scenePersistenceIdentifier];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

    if (v8)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)_removePictureInPictureMorphAnimatorController:(id)a3
{
  if (a3)
  {
    pictureInPictureMorphAnimatorControllers = self->_pictureInPictureMorphAnimatorControllers;
    id v5 = a3;
    [(NSMutableSet *)pictureInPictureMorphAnimatorControllers removeObject:v5];
    id v6 = [v5 viewMorphAnimator];

    id v7 = [v6 windowScene];

    [(SBPIPController *)self _managePictureInPictureWindowVisibilityForWindowScene:v7 animated:1];
  }
}

- (void)_updateContainerViewControllersContentPaddingOnWindowScene:(id)a3
{
  id v4 = a3;
  if (([(SBPIPControllerAdapter *)self->_adapter isStartingStoppingOrCancellingPictureInPictureForPIPController:self] & 1) == 0)
  {
    [(SBPIPController *)self _pictureInPictureWindowMarginsOnWindowScene:v4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__SBPIPController__updateContainerViewControllersContentPaddingOnWindowScene___block_invoke;
    v9[3] = &__block_descriptor_64_e33_v24__0__SBPIPContentContext_8_B16l;
    void v9[4] = v5;
    v9[5] = v6;
    v9[6] = v7;
    v9[7] = v8;
    [(SBPIPController *)self _enumerateContextsForWindowScene:v4 usingBlock:v9];
  }
}

void __78__SBPIPController__updateContainerViewControllersContentPaddingOnWindowScene___block_invoke(double *a1, void *a2)
{
  id v3 = [a2 containerViewController];
  objc_msgSend(v3, "setContentViewPadding:", a1[4], a1[5], a1[6], a1[7]);
}

- (UIEdgeInsets)_pictureInPictureWindowMarginsOnWindowScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_windowSceneToInsetAssertionMap objectForKey:v4];
  uint64_t v6 = [v5 context];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [(SBPIPController *)self _edgeInsetsForSource:5 onWindowScene:v4 exists:0];
    [(SBPIPController *)self _edgeInsetsForSource:10 onWindowScene:v4 exists:0];
    UIEdgeInsetsMax();
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    uint64_t v16 = [(NSMapTable *)self->_windowSceneToWindowMarginsMap objectForKey:v4];
    [v16 UIEdgeInsetsValue];
    double v9 = v17;
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
  }
  double v21 = v9;
  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (BOOL)_isContentViewAlignedLeftWithPosition:(unint64_t)a3 orientation:(int64_t)a4
{
  if (a3) {
    BOOL v4 = a3 == 3;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = v4;
  BOOL v6 = a3 < 2;
  if (a4 != 1) {
    BOOL v6 = 0;
  }
  if (a4 != 3) {
    BOOL v5 = v6;
  }
  if (a4 == 4) {
    return a3 - 1 < 2;
  }
  else {
    return v5;
  }
}

- (BOOL)_isContentViewAlignedTopWithPosition:(unint64_t)a3 orientation:(int64_t)a4
{
  BOOL v4 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
  if (a3) {
    BOOL v5 = a3 == 3;
  }
  else {
    BOOL v5 = 1;
  }
  char v6 = v5;
  if (a4 != 1) {
    char v6 = 0;
  }
  if (a4 != 3) {
    BOOL v4 = v6;
  }
  if (a4 == 4) {
    return a3 < 2;
  }
  else {
    return v4;
  }
}

- (CGRect)homeScreenInitialPIPFrameForWindowScene:(id)a3 withContentViewSize:(CGSize)a4 position:(unint64_t)a5 padding:(double)a6 fromOrientation:(int64_t)a7 toOrientation:(int64_t)a8 shouldUpdate:(BOOL)a9 gestureInitiated:(BOOL)a10
{
  BOOL v10 = a10;
  BOOL v11 = a9;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  double v18 = [v17 pictureInPictureManager];
  [v18 _updateFloatingDockInsetsWithoutNotifyingControllers];

  double v19 = +[SBIconController sharedInstance];
  double v20 = [v19 homeScreenViewController];

  -[SBPIPController _updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:](self, "_updatePictureInPictureOverlayInsetsOnWindowScene:withCurrentLayoutState:toHomeScreen:toInterfaceOrientation:shouldUpdate:", v17, 0, 1, [v20 interfaceOrientation], v11);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  id v29 = [v17 statusBarManager];
  [v29 statusBarFrame];
  double Height = CGRectGetHeight(v97);

  double v31 = v26 + a6;
  double v80 = v28 + a6;
  double v81 = v24 + a6;
  double v32 = fmax(v22 + a6, Height);
  if (BSFloatEqualToFloat()) {
    int64_t v33 = 1;
  }
  else {
    int64_t v33 = a7;
  }
  BOOL v34 = [(SBPIPController *)self _isContentViewAlignedLeftWithPosition:a5 orientation:v33];
  BOOL v35 = [(SBPIPController *)self _isContentViewAlignedTopWithPosition:a5 orientation:v33];
  id v36 = [v17 screen];
  [v36 bounds];
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  double v42 = v41;
  double v44 = v43;

  v98.origin.double x = v38;
  v98.origin.double y = v40;
  v98.size.double width = v42;
  v98.size.double height = v44;
  double Width = CGRectGetWidth(v98);
  v99.origin.double x = v38;
  v99.origin.double y = v40;
  v99.size.double width = v42;
  v99.size.double height = v44;
  double v46 = CGRectGetHeight(v99);
  uint64_t v47 = SBLogPIP();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    v100.top = v32;
    v100.right = v80;
    v100.left = v81;
    v100.bottom = v31;
    double v78 = NSStringFromUIEdgeInsets(v100);
    double v77 = SBFStringForBSInterfaceOrientation();
    double v76 = SBFStringForBSInterfaceOrientation();
    double v70 = SBFStringForBSInterfaceOrientation();
    v101.origin.double x = v38;
    v101.origin.double y = v40;
    v101.size.double width = v42;
    v101.size.double height = v44;
    NSStringFromCGRect(v101);
    *(_DWORD *)buf = 138544898;
    double v83 = v78;
    __int16 v84 = 2114;
    double v85 = v77;
    __int16 v86 = 2114;
    double v87 = v76;
    __int16 v88 = 2114;
    double v89 = v70;
    __int16 v90 = 1024;
    BOOL v91 = v34;
    __int16 v92 = 1024;
    BOOL v93 = v35;
    v95 = __int16 v94 = 2114;
    double v71 = (void *)v95;
    _os_log_debug_impl(&dword_1D85BA000, v47, OS_LOG_TYPE_DEBUG, "-homeScreenInitialPIPFrameForWindowScene inputs: windowInsets[%{public}@] fromOrientation[%{public}@] toOrientation[%{public}@] orientation[%{public}@] isContentViewAlignedLeft[%{BOOL}u] isContentViewAlignedTop[%{BOOL}u] homeScreenbounds[%{public}@]", buf, 0x40u);
  }
  if (a8 == a7)
  {
    double v49 = a4.width;
    double v48 = a4.height;
LABEL_8:
    if (v34) {
      double v50 = v81;
    }
    else {
      double v50 = Width - v49 - v80;
    }
    if (v35) {
      double v51 = v32;
    }
    else {
      double v51 = v46 - v48 - v31;
    }
    goto LABEL_45;
  }
  double v49 = a4.width;
  double v48 = a4.height;
  double v52 = a4.width * 0.5;
  double v53 = a4.height * 0.5;
  if (v10)
  {
    if (a7 == 3)
    {
      double v55 = v53 + v32;
      if (!v34) {
        double v55 = v42 - v31 - v53;
      }
      double v57 = v52 + v80;
      if (!v35) {
        double v57 = v44 - v81 - v52;
      }
    }
    else
    {
      double v54 = v42 - v80 - a4.width;
      if (v34) {
        double v54 = v81;
      }
      double v55 = v52 + v54;
      double v56 = v44 - v31 - a4.height;
      if (v35) {
        double v56 = v32;
      }
      double v57 = v53 + v56;
      double v58 = v53 + v31;
      if (!v34) {
        double v58 = v42 - v32 - v53;
      }
      double v59 = v52 + v81;
      if (!v35) {
        double v59 = v44 - v80 - v52;
      }
      if (a7 == 4)
      {
        double v55 = v58;
        double v57 = v59;
      }
    }
    double v50 = v55 - v52;
    double v51 = v57 - v53;
  }
  else if (a7 == 3)
  {
    double v64 = v52 - v53;
    double v65 = Width - v52 - v53;
    double v66 = v32 - v64;
    double v67 = v46 - a4.height - v64 - v31;
    if (v34) {
      double v50 = v66;
    }
    else {
      double v50 = v67;
    }
    double v68 = v65 - v81;
    double v69 = v80 + v65 - (Width - a4.width);
    if (v35) {
      double v51 = v69;
    }
    else {
      double v51 = v68;
    }
  }
  else
  {
    if (a7 != 4) {
      goto LABEL_8;
    }
    double v60 = v46 - v52 - v53;
    double v61 = v53 - v52;
    double v62 = v31 + v60 - (v46 - a4.height);
    double v63 = v60 - v32;
    if (v34) {
      double v50 = v62;
    }
    else {
      double v50 = v63;
    }
    if (v35) {
      double v51 = v81 - v61;
    }
    else {
      double v51 = Width - a4.width - v61 - v80;
    }
  }
LABEL_45:

  double v72 = v50;
  double v73 = v51;
  double v74 = v49;
  double v75 = v48;
  result.size.double height = v75;
  result.size.double width = v74;
  result.origin.double y = v73;
  result.origin.double x = v72;
  return result;
}

- (id)anyContentViewPresentedOnWindowScene:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3032000000;
  BOOL v11 = __Block_byref_object_copy__118;
  double v12 = __Block_byref_object_dispose__118;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SBPIPController_anyContentViewPresentedOnWindowScene___block_invoke;
  v7[3] = &unk_1E6B0D0B0;
  void v7[4] = &v8;
  [(SBPIPController *)self _enumerateContextsForWindowScene:v4 usingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __56__SBPIPController_anyContentViewPresentedOnWindowScene___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 containerViewController];
  uint64_t v6 = [v5 viewIfLoaded];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a3 = 1;
}

- (void)_minimumStashedPaddingDidChangeOnWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pictureInPictureManager];
  [v5 _minimumStashedPadding];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__SBPIPController__minimumStashedPaddingDidChangeOnWindowScene___block_invoke;
  v14[3] = &__block_descriptor_64_e33_v24__0__SBPIPContentContext_8_B16l;
  v14[4] = v7;
  void v14[5] = v9;
  v14[6] = v11;
  v14[7] = v13;
  [(SBPIPController *)self _enumerateContextsForWindowScene:v4 usingBlock:v14];
}

void __64__SBPIPController__minimumStashedPaddingDidChangeOnWindowScene___block_invoke(double *a1, void *a2)
{
  id v3 = [a2 containerViewController];
  objc_msgSend(v3, "setStashedPadding:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)containerViewControllerDidBeginInteraction:(id)a3
{
  id v4 = a3;
  if (![(SBPIPController *)self contentType])
  {
    id v5 = [v4 view];
    [v5 setClipsToBounds:0];
    uint64_t v6 = [v5 _sbWindowScene];
    uint64_t v7 = [v6 _fbsDisplayIdentity];
    char v8 = [v7 isContinuityDisplay];

    uint64_t v9 = [(id)SBApp displayPortalManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__SBPIPController_containerViewControllerDidBeginInteraction___block_invoke;
    v10[3] = &__block_descriptor_33_e23_B16__0__SBWindowScene_8l;
    char v11 = v8;
    [v9 createPortalsForSourceView:v5 usingTraitsRole:@"SBTraitsParticipantRolePictureInPicture" onWindowScenesPassingTest:v10];
  }
}

BOOL __62__SBPIPController_containerViewControllerDidBeginInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _fbsDisplayIdentity];
  int v4 = [v3 isContinuityDisplay];

  return *(unsigned __int8 *)(a1 + 32) == v4;
}

- (void)containerViewControllerDidEndInteraction:(id)a3 targetWindowScene:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (![(SBPIPController *)self contentType])
  {
    uint64_t v7 = [v11 view];
    [v7 setClipsToBounds:1];
    char v8 = [(id)SBApp displayPortalManager];
    [v8 destroyPortalsForSourceView:v7];

    uint64_t v9 = [(NSMapTable *)self->_containerViewControllerToContextMap objectForKey:v11];
    id v10 = [v9 windowScene];
    if (v10 != v6) {
      [(SBPIPController *)self _moveContext:v9 toWindowScene:v6];
    }
  }
}

- (id)dataSourceForMorphAnimatorController:(id)a3
{
  if ((*((unsigned char *)self + 248) & 0x40) != 0)
  {
    id v3 = [(SBPIPControllerAdapter *)self->_adapter pipController:self morphAnimatorDataSourceForMorphAnimatorController:a3];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

uint64_t __47__SBPIPController_invalidateIdleTimerBehaviors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prefersIdleTimerDisabled];
}

- (BOOL)isHandlingContextWindowSceneUpdate
{
  return self->_inFlightWindowSceneUpdates != 0;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  if (self->_hasIdleTimerBehaviors) {
    +[SBIdleTimerBehavior disabledBehavior];
  }
  else {
  id v3 = +[SBIdleTimerBehavior autoLockBehavior];
  }
  return v3;
}

- (SBWindowSceneManager)windowSceneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneManager);
  return (SBWindowSceneManager *)WeakRetained;
}

- (void)setWindowSceneManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowSceneManager);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_keyboardFocusObserver, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_keyboardInsetsVisualizerView, 0);
  objc_storeStrong((id *)&self->_pictureInPictureMorphAnimatorControllers, 0);
  objc_storeStrong((id *)&self->_bundleIDForAppRecentlyStoppingPIP, 0);
  objc_storeStrong((id *)&self->_bundleIDForAppAnimatingPIPStartInBackground, 0);
  objc_storeStrong((id *)&self->_interruptionEndDebouncingTimer, 0);
  objc_destroyWeak((id *)&self->_transitionStashAssertion);
  objc_storeStrong((id *)&self->_stashForInterruptionAssertion, 0);
  objc_storeStrong((id *)&self->_fullscreenModalElementInsetOverrideAssertion, 0);
  objc_storeStrong((id *)&self->_lockedInterruptionAssertion, 0);
  objc_storeStrong((id *)&self->_cameraInterruptionAssertions, 0);
  objc_storeStrong((id *)&self->_interruptionAssertions, 0);
  objc_storeStrong((id *)&self->_windowSceneToStashAssertionsMap, 0);
  objc_storeStrong((id *)&self->_windowSceneToInsetAssertionMap, 0);
  objc_storeStrong((id *)&self->_windowSceneToWindowMarginsMap, 0);
  objc_storeStrong((id *)&self->_pictureInPictureWindowHiddenReasons, 0);
  objc_storeStrong((id *)&self->_lockStateProviders, 0);
  objc_storeStrong((id *)&self->_connectedWindowScenes, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong((id *)&self->_containerViewControllerToContextMap, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
}

void __106__SBPIPController_restoreContentViewController_appSceneEntity_morphAnimatorConfigurationBlock_completion___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Canceling %{public}@ because it failed to complete animation", (uint8_t *)&v3, 0xCu);
}

- (void)_edgeInsetsDidChangeOnWindowScene:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "-[SBPIPController _edgeInsetsDidChangeOnWindowScene:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "insets: %s ignoring update: %{BOOL}u", (uint8_t *)&v2, 0x12u);
}

@end