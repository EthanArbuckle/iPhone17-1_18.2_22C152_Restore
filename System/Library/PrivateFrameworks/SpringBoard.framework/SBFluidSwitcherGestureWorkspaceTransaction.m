@interface SBFluidSwitcherGestureWorkspaceTransaction
- (BOOL)_sceneUpdateTransactionIsForLiveResize:(id)a3;
- (BOOL)canInterruptForTransitionRequest:(id)a3;
- (BOOL)hasCompletedAtLeastOneGesture;
- (BOOL)isLiveResize;
- (BOOL)shouldCancelGestureUponInterruption;
- (BOOL)shouldSuppressMedusaKeyboardDuringGesture;
- (BOOL)transaction:(id)a3 shouldKeepSceneForeground:(id)a4 withReason:(id *)a5;
- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4;
- (NSMapTable)activeLayoutStatesBySwitcherController;
- (NSMapTable)originalLayoutStatesBySwitcherController;
- (NSMutableSet)ancillaryLayoutTransactions;
- (NSMutableSet)layoutTransitionCompletions;
- (NSTimer)activateScenesTimer;
- (NSUUID)gestureID;
- (SBAppLayout)selectedAppLayout;
- (SBAutoPIPWorkspaceTransaction)autoPIPWorkspaceTransaction;
- (SBFluidSwitcherGestureWorkspaceTransaction)initWithTransitionRequest:(id)a3 switcherController:(id)a4 delegate:(id)a5;
- (SBFluidSwitcherGestureWorkspaceTransactionDelegate)delegate;
- (SBFluidSwitcherViewController)switcherViewController;
- (SBMainWorkspaceTransaction)finalRootTransaction;
- (SBSceneLayoutWorkspaceTransaction)layoutTransaction;
- (SBSwitcherController)switcherController;
- (SBTransientOverlayViewController)switcherTransitioningTransientOverlayViewController;
- (SBUISwitcherAnimationController)animationController;
- (UIApplicationSceneDeactivationAssertion)backgroundingScenesDeactivationAssertion;
- (id)_copiedTransitionRequestFromTransitionRequest:(id)a3;
- (id)_createWorkspaceTransientOverlayForAppLayout:(id)a3;
- (id)_currentGestureEventForGesture:(id)a3;
- (id)_switcherControllerForWorkspaceTransitionRequest:(id)a3;
- (id)_transitionRequestForApplicationTransitionContext:(id)a3 eventLabel:(id)a4;
- (id)_windowSceneForWorkspaceTransitionRequest:(id)a3;
- (id)_workspaceTransitionRequestForSwitcherTransitionRequest:(id)a3 fromGestureManager:(id)a4 withEventLabel:(id)a5;
- (id)createSceneEntityForHandle:(id)a3;
- (id)layoutStateForApplicationTransitionContext:(id)a3;
- (id)previousLayoutStateForApplicationTransitionContext:(id)a3;
- (int64_t)_gestureType;
- (void)_acquireBackgroundingScenesDeactivationAssertionForTransitionRequest:(id)a3;
- (void)_addChildWorkspaceTransaction:(id)a3;
- (void)_addWaitForSceneLayoutTransitionTransaction:(id)a3 forLeafAnimationControllers:(id)a4;
- (void)_begin;
- (void)_beginWithGesture:(id)a3;
- (void)_childTransactionDidComplete:(id)a3;
- (void)_didComplete;
- (void)_didInterruptWithReason:(id)a3;
- (void)_failRunningLayoutStateTransition;
- (void)_finishWithCompletionType:(int64_t)a3;
- (void)_finishWithGesture:(id)a3;
- (void)_runSceneLayoutTransactionForTransitionRequest:(id)a3 updateScenes:(BOOL)a4;
- (void)_startSceneUpdateTransaction:(id)a3 forSceneIdentifier:(id)a4;
- (void)_switcherGestureDidUpdate:(id)a3;
- (void)_updateDigitizerSurfaceDimensions;
- (void)_updateMainDisplayIfNecessaryForWorkspaceTransitionRequests:(id)a3;
- (void)_updatePPTsForAnimationEndedWithFinalLayoutState:(id)a3;
- (void)_updatePPTsForGestureEnded;
- (void)_updatePPTsForGestureTransactionBegan;
- (void)_updateWithGesture:(id)a3;
- (void)_willBeginWithGesture:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
- (void)dealloc;
- (void)didEndAllAnimations;
- (void)handleTransitionRequestForGestureComplete:(id)a3 fromGestureManager:(id)a4;
- (void)handleTransitionRequestForGestureUpdate:(id)a3 fromGestureManager:(id)a4;
- (void)interceptTransitionRequest:(id)a3;
- (void)setActivateScenesTimer:(id)a3;
- (void)setActiveLayoutStatesBySwitcherController:(id)a3;
- (void)setAncillaryLayoutTransactions:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setAutoPIPWorkspaceTransaction:(id)a3;
- (void)setBackgroundingScenesDeactivationAssertion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFinalRootTransaction:(id)a3;
- (void)setLayoutTransaction:(id)a3;
- (void)setLayoutTransitionCompletions:(id)a3;
- (void)setOriginalLayoutStatesBySwitcherController:(id)a3;
- (void)setSelectedAppLayout:(id)a3;
- (void)setShouldCancelGestureUponInterruption:(BOOL)a3;
- (void)setSwitcherTransitioningTransientOverlayViewController:(id)a3;
- (void)setSwitcherViewController:(id)a3;
- (void)systemGestureStateChanged:(id)a3;
- (void)transaction:(id)a3 didEndLayoutTransitionWithContinuation:(id)a4;
- (void)transaction:(id)a3 performTransitionWithCompletion:(id)a4;
- (void)transactionDidComplete:(id)a3;
@end

@implementation SBFluidSwitcherGestureWorkspaceTransaction

- (SBFluidSwitcherGestureWorkspaceTransaction)initWithTransitionRequest:(id)a3 switcherController:(id)a4 delegate:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v47.receiver = self;
  v47.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  v10 = [(SBSystemGestureWorkspaceTransaction *)&v47 initWithTransitionRequest:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_switcherController, v8);
    v12 = [v8 contentViewController];
    objc_storeWeak((id *)&v11->_switcherViewController, v12);

    id v42 = v9;
    objc_storeWeak((id *)&v11->_delegate, v9);
    v13 = +[SBSceneManagerCoordinator sharedInstance];
    v14 = [v13 sceneDeactivationManager];
    uint64_t v15 = [v14 newAssertionWithReason:0];
    backgroundingScenesDeactivationAssertion = v11->_backgroundingScenesDeactivationAssertion;
    v11->_backgroundingScenesDeactivationAssertion = (UIApplicationSceneDeactivationAssertion *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    originalLayoutStatesBySwitcherController = v11->_originalLayoutStatesBySwitcherController;
    v11->_originalLayoutStatesBySwitcherController = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    activeLayoutStatesBySwitcherController = v11->_activeLayoutStatesBySwitcherController;
    v11->_activeLayoutStatesBySwitcherController = (NSMapTable *)v19;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v21 = [(id)SBApp windowSceneManager];
    v22 = [v21 connectedWindowScenes];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v44;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v43 + 1) + 8 * v26) switcherController];
          v28 = [v27 layoutState];
          [(NSMapTable *)v11->_originalLayoutStatesBySwitcherController setObject:v28 forKey:v27];
          [(NSMapTable *)v11->_activeLayoutStatesBySwitcherController setObject:v28 forKey:v27];

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v24);
    }

    v29 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    ancillaryLayoutTransactions = v11->_ancillaryLayoutTransactions;
    v11->_ancillaryLayoutTransactions = v29;

    v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    layoutTransitionCompletions = v11->_layoutTransitionCompletions;
    v11->_layoutTransitionCompletions = v31;

    v33 = +[SBAppSwitcherDomain rootSettings];
    v34 = [v33 animationSettings];

    v35 = [v34 arcSwipeSettings];
    [v35 settlingDuration];
    *(double *)&SBFluidSwitcherMaximumActivationDelayForArcSwipes = v36 * 0.9;

    v11->_shouldCancelGestureUponInterruption = 1;
    uint64_t v37 = objc_opt_new();
    sceneIdentifiersWithSceneUpdateTransactionsInProgress = v11->_sceneIdentifiersWithSceneUpdateTransactionsInProgress;
    v11->_sceneIdentifiersWithSceneUpdateTransactionsInProgress = (NSMutableSet *)v37;

    uint64_t v39 = objc_opt_new();
    pendingSceneUpdateTransactionsBySceneIdentifier = v11->_pendingSceneUpdateTransactionsBySceneIdentifier;
    v11->_pendingSceneUpdateTransactionsBySceneIdentifier = (NSMutableDictionary *)v39;

    id v9 = v42;
  }

  return v11;
}

- (void)dealloc
{
  [(UIApplicationSceneDeactivationAssertion *)self->_backgroundingScenesDeactivationAssertion relinquish];
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v3 dealloc];
}

- (id)_currentGestureEventForGesture:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _gestureType];
  v7 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedAppLayout];
  uint64_t v8 = [v5 state];

  uint64_t v9 = SBGestureModifierPhaseForGestureState(v8);
  v10 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
  v11 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  v12 = [v11 view];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    uint64_t v14 = [v13 recognizedTouchType];
    uint64_t v15 = [(SBGestureSwitcherModifierEvent *)[SBScrunchGestureSwitcherModifierEvent alloc] initWithGestureID:self->_gestureID selectedAppLayout:v7 gestureType:v6 phase:v9];
    [v13 velocityInView:v12];
    -[SBGestureSwitcherModifierEvent setVelocityInContainerView:](v15, "setVelocityInContainerView:");
    [v13 initialCentroid];
    double v17 = v16;
    double v19 = v18;
    [v13 centroid];
    double v21 = v20;
    double v23 = v22;
    [v13 absoluteScale];
    -[SBScrunchGestureSwitcherModifierEvent setAbsoluteScale:](v15, "setAbsoluteScale:");
    [v13 locationInView:v12];
    -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v15, "setLocationInContainerView:");
    [v13 translationInView:v12];
    double v25 = v24;
    double v27 = v26;
    [v13 translationWithoutConsideringScaleInView:v12];
    double v29 = v28;
    double v31 = v30;
    if (v14 == 1)
    {
      double v50 = v28;
      double v51 = v25;
      double v52 = v17;
      v32 = +[SBHomeGestureDomain rootSettings];
      [v32 travelDistanceForTranslatingScreenHeight];
      double v34 = v33;
      double digitizerSurfaceHeightForLastGestureEvent = self->_digitizerSurfaceHeightForLastGestureEvent;
      if (BSFloatIsZero()) {
        double digitizerSurfaceHeightForLastGestureEvent = 110.0;
      }
      double v36 = digitizerSurfaceHeightForLastGestureEvent / v34;
      [v32 minimumDistanceThresholdToScaleMultiplier];
      double v38 = v37;
      [v12 bounds];
      double v40 = digitizerSurfaceHeightForLastGestureEvent * (v19 / v39);
      if (v40 < v38 && BSFloatGreaterThanFloat()) {
        double v36 = v36 / (v40 / v38);
      }
      double v29 = v50;
      double v27 = v27 * v36;
      double v31 = v31 * v36;
      double v17 = v52;
      double v21 = v52 + v21 - v52;
      double v23 = v19 + (v23 - v19) * v36;

      double v25 = v51;
    }
    -[SBScrunchGestureSwitcherModifierEvent setInitialCentroid:](v15, "setInitialCentroid:", v17, v19);
    -[SBScrunchGestureSwitcherModifierEvent setCentroid:](v15, "setCentroid:", v21, v23);
    -[SBGestureSwitcherModifierEvent setTranslationInContainerView:](v15, "setTranslationInContainerView:", v25, v27);
    -[SBScrunchGestureSwitcherModifierEvent setTranslationWithoutScale:](v15, "setTranslationWithoutScale:", v29, v31);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v41 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = [(SBGestureSwitcherModifierEvent *)[SBItemResizeGestureSwitcherModifierEvent alloc] initWithGestureID:self->_gestureID selectedAppLayout:v7 gestureType:v6 phase:v9];
        [(SBScrunchGestureSwitcherModifierEvent *)v15 setSelectedLayoutRole:[(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedLayoutRole]];
        [(SBScrunchGestureSwitcherModifierEvent *)v15 setSelectedEdge:[(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedEdge]];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = [(SBGestureSwitcherModifierEvent *)[SBWindowDragSwitcherModifierEvent alloc] initWithGestureID:self->_gestureID selectedAppLayout:v7 gestureType:v6 phase:v9];
          [(SBScrunchGestureSwitcherModifierEvent *)v15 setDraggingFromContinuousExposeStrips:[(SBFluidSwitcherGestureWorkspaceTransaction *)self isDraggingFromContinuousExposeStrips]];
          [(SBFluidSwitcherGestureWorkspaceTransaction *)self locationInSelectedDisplayItem];
          -[SBScrunchGestureSwitcherModifierEvent setLocationInSelectedDisplayItem:](v15, "setLocationInSelectedDisplayItem:");
          [(SBFluidSwitcherGestureWorkspaceTransaction *)self sizeOfSelectedDisplayItem];
          -[SBScrunchGestureSwitcherModifierEvent setSizeOfSelectedDisplayItem:](v15, "setSizeOfSelectedDisplayItem:");
        }
        else
        {
          uint64_t v15 = [[SBGestureSwitcherModifierEvent alloc] initWithGestureID:self->_gestureID selectedAppLayout:v7 gestureType:v6 phase:v9];
        }
      }
      [v41 velocityInView:v12];
      -[SBGestureSwitcherModifierEvent setVelocityInContainerView:](v15, "setVelocityInContainerView:");
      [v41 translationInView:v12];
      -[SBGestureSwitcherModifierEvent setTranslationInContainerView:](v15, "setTranslationInContainerView:");
      [v41 _hysteresis];
      -[SBGestureSwitcherModifierEvent setHysteresis:](v15, "setHysteresis:");
      [v41 locationInView:v12];
      double v46 = v45;
      double v48 = v47;

      -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v15, "setLocationInContainerView:", v46, v48);
      uint64_t v14 = 0;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v42 = v10;
        uint64_t v15 = [(SBGestureSwitcherModifierEvent *)[SBIndirectPanGestureSwitcherModifierEvent alloc] initWithGestureID:self->_gestureID selectedAppLayout:v7 gestureType:v6 phase:v9];
        -[SBGestureSwitcherModifierEvent setMouseEvent:](v15, "setMouseEvent:", [v42 currentInputType] == 1);
        [v42 velocityInView:v12];
        -[SBGestureSwitcherModifierEvent setVelocityInContainerView:](v15, "setVelocityInContainerView:");
        [v42 translationInView:v12];
        -[SBGestureSwitcherModifierEvent setTranslationInContainerView:](v15, "setTranslationInContainerView:");
        [(SBGestureSwitcherModifierEvent *)v15 setHysteresis:10.0];
        [v42 locationInView:v12];
        -[SBGestureSwitcherModifierEvent setLocationInContainerView:](v15, "setLocationInContainerView:");
        uint64_t v43 = [v42 endReason];

        [(SBScrunchGestureSwitcherModifierEvent *)v15 setIndirectPanEndReason:v43];
        uint64_t v14 = 1;
      }
      else
      {
        long long v44 = [MEMORY[0x1E4F28B00] currentHandler];
        [v44 handleFailureInMethod:a2, self, @"SBFluidSwitcherGestureWorkspaceTransaction.m", 295, @"Unknown gesture recognizer: %@", v10 object file lineNumber description];

        uint64_t v14 = 0;
        uint64_t v15 = 0;
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    [(SBGestureSwitcherModifierEvent *)v15 setTouchHistoryProvider:v10];
  }
  [(SBGestureSwitcherModifierEvent *)v15 setTouchType:v14];
  [(SBGestureSwitcherModifierEvent *)v15 setPointerTouch:self->_isPointerTouch];
  [(SBGestureSwitcherModifierEvent *)v15 setHidEventSenderID:self->_hidEventSenderID];
  [v10 lastTouchTimestamp];
  -[SBGestureSwitcherModifierEvent setLastTouchTimestamp:](v15, "setLastTouchTimestamp:");
  -[SBGestureSwitcherModifierEvent setCanceled:](v15, "setCanceled:", [v10 state] == 4);

  return v15;
}

- (BOOL)shouldSuppressMedusaKeyboardDuringGesture
{
  return 0;
}

- (void)_willInterruptWithReason:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v5 _willInterruptWithReason:a3];
  [(NSMutableSet *)self->_layoutTransitionCompletions removeAllObjects];
  [(NSTimer *)self->_activateScenesTimer invalidate];
  activateScenesTimer = self->_activateScenesTimer;
  self->_activateScenesTimer = 0;

  [(SBFluidSwitcherGestureWorkspaceTransaction *)self _failRunningLayoutStateTransition];
  [(NSMutableDictionary *)self->_pendingSceneUpdateTransactionsBySceneIdentifier removeAllObjects];
}

- (void)_didInterruptWithReason:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v6 _didInterruptWithReason:a3];
  [(SBSystemGestureWorkspaceTransaction *)self finishWithCompletionType:1];
  if (self->_shouldCancelGestureUponInterruption)
  {
    v4 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
    [v4 setEnabled:0];

    objc_super v5 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
    [v5 setEnabled:1];
  }
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self finalRootTransaction];

  if (v5)
  {
    objc_super v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self finalRootTransaction];
    char v7 = [v6 canInterruptForTransitionRequest:v4];
  }
  else
  {
    char v7 = +[SBToAppsWorkspaceTransaction canInterruptTransaction:0 forTransitionRequest:v4];
  }

  return v7;
}

- (void)interceptTransitionRequest:(id)a3
{
  id v4 = a3;
  [v4 finalize];
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self _runSceneLayoutTransactionForTransitionRequest:v4 updateScenes:1];
  id v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherController];
  objc_super v5 = [v4 applicationContext];

  [v6 performTransitionWithContext:v5 animated:1 completion:0];
}

- (void)_begin
{
  v1 = SBStringForFluidSwitcherGestureType([a1 _gestureType]);
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "Began fluid switcher gesture transaction of type: %@.", v4, v5, v6, v7, 2u);
}

void __52__SBFluidSwitcherGestureWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isAcquiredTransientOverlayViewController:v5] & 1) == 0
    && [*(id *)(a1 + 40) isPresentingViewController:v5])
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v6 setObject:v5 forKey:v10];
  }
}

void __52__SBFluidSwitcherGestureWorkspaceTransaction__begin__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "objectForKey:", v7, (void)v9);
        [*(id *)(a1 + 32) addAcquiredTransientOverlayViewController:v8 forAppLayout:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)_childTransactionDidComplete:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  id v4 = a3;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v11 _childTransactionDidComplete:v4];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = SBSafeCast(v5, v4);

  if (v6)
  {
    uint64_t v7 = objc_msgSend(v6, "applicationSceneEntity", v11.receiver, v11.super_class);
    uint64_t v8 = [v7 sceneHandle];
    long long v9 = [v8 sceneIdentifier];

    [(NSMutableSet *)self->_sceneIdentifiersWithSceneUpdateTransactionsInProgress removeObject:v9];
    long long v10 = [(NSMutableDictionary *)self->_pendingSceneUpdateTransactionsBySceneIdentifier objectForKey:v9];
    if (v10)
    {
      [(NSMutableDictionary *)self->_pendingSceneUpdateTransactionsBySceneIdentifier removeObjectForKey:v9];
      if (([(SBFluidSwitcherGestureWorkspaceTransaction *)self isInterrupted] & 1) == 0) {
        [(SBFluidSwitcherGestureWorkspaceTransaction *)self _startSceneUpdateTransaction:v10 forSceneIdentifier:v9];
      }
    }
  }
}

- (void)_didComplete
{
  v1 = SBStringForFluidSwitcherGestureType([a1 _gestureType]);
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "Completed fluid switcher gesture transaction of type: %@.", v4, v5, v6, v7, 2u);
}

- (void)systemGestureStateChanged:(id)a3
{
  id v4 = a3;
  if ([(SBFluidSwitcherGestureWorkspaceTransaction *)self isRunning])
  {
    [(SBFluidSwitcherGestureWorkspaceTransaction *)self _switcherGestureDidUpdate:v4];
  }
  else
  {
    uint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(SBFluidSwitcherGestureWorkspaceTransaction *)self systemGestureStateChanged:v5];
    }
  }
}

- (void)_finishWithCompletionType:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherGestureWorkspaceTransaction;
  [(SBSystemGestureWorkspaceTransaction *)&v4 _finishWithCompletionType:a3];
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self removeMilestone:@"trackingGesture"];
}

- (void)didEndAllAnimations
{
  id v3 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self _switcherGestureDidUpdate:v3];
}

- (void)_switcherGestureDidUpdate:(id)a3
{
  id v8 = a3;
  if (self->_calledBeginWithGesture
    || ([(SBFluidSwitcherGestureWorkspaceTransaction *)self isInterrupted] & 1) == 0)
  {
    animationController = self->_animationController;
    if (!animationController
      || [(SBUISwitcherAnimationController *)animationController isInterruptible])
    {
      uint64_t v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
      uint64_t v6 = [v5 pipViewMorphAnimator];
      uint64_t v7 = v6;
      if (v6)
      {
        [v6 addObserver:self];
      }
      else
      {
        if (!self->_calledBeginWithGesture)
        {
          self->_calledBeginWithGesture = 1;
          [(SBFluidSwitcherGestureWorkspaceTransaction *)self _willBeginWithGesture:v8];
          [(SBFluidSwitcherGestureWorkspaceTransaction *)self _beginWithGesture:v8];
        }
        if ([v8 state] != 1)
        {
          if ([v8 state] == 2)
          {
            [(SBFluidSwitcherGestureWorkspaceTransaction *)self _updateWithGesture:v8];
          }
          else
          {
            [(SBFluidSwitcherGestureWorkspaceTransaction *)self _finishWithGesture:v8];
            self->_calledBeginWithGesture = 0;
          }
        }
      }
    }
  }
}

- (void)_willBeginWithGesture:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F29128], "UUID", a3);
  objc_super v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  gestureID = self->_gestureID;
  self->_gestureID = v4;

  id v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  objc_msgSend(v6, "willBeginGestureWithType:identifier:", -[SBFluidSwitcherGestureWorkspaceTransaction _gestureType](self, "_gestureType"), self->_gestureID);
}

- (void)_beginWithGesture:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (objc_class *)objc_opt_class();
    long long v9 = NSStringFromClass(v8);
    long long v10 = SBSystemGestureRecognizerStateDescription([v4 state]);
    *(_DWORD *)buf = 138544386;
    id v41 = v7;
    __int16 v42 = 2050;
    uint64_t v43 = self;
    __int16 v44 = 2114;
    double v45 = v9;
    __int16 v46 = 2050;
    id v47 = v4;
    __int16 v48 = 2114;
    uint64_t v49 = v10;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Begin with gesture recognizer: <%{public}@:%{public}p> (%{public}@)", buf, 0x34u);
  }
  objc_super v11 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
  long long v12 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _transitionRequestForApplicationTransitionContext:v11 eventLabel:@"InterruptingGesture"];
  [v12 setSource:11];
  finalRootTransaction = self->_finalRootTransaction;
  if (finalRootTransaction)
  {
    [(SBWorkspaceTransaction *)finalRootTransaction interruptForTransitionRequest:v12];
    uint64_t v14 = self->_finalRootTransaction;
    self->_finalRootTransaction = 0;
  }
  [(SBUISwitcherAnimationController *)self->_animationController interruptWithReason:@"InterruptingGesture"];
  animationController = self->_animationController;
  self->_animationController = 0;

  [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPWorkspaceTransaction setCompletionBlock:0];
  if ([(SBAutoPIPWorkspaceTransaction *)self->_autoPIPWorkspaceTransaction isRunning]) {
    [(SBAutoPIPWorkspaceTransaction *)self->_autoPIPWorkspaceTransaction interruptWithReason:@"InterruptingGesture"];
  }
  autoPIPWorkspaceTransaction = self->_autoPIPWorkspaceTransaction;
  self->_autoPIPWorkspaceTransaction = 0;

  [(SBWorkspaceTransaction *)self->_layoutTransaction interruptForTransitionRequest:v12];
  layoutTransaction = self->_layoutTransaction;
  self->_layoutTransaction = 0;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v18 = self->_ancillaryLayoutTransactions;
  uint64_t v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v36;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * v21++) interruptForTransitionRequest:v12];
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableSet *)v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v19);
  }

  [(NSMutableSet *)self->_ancillaryLayoutTransactions removeAllObjects];
  [(NSMutableSet *)self->_layoutTransitionCompletions removeAllObjects];
  [(NSTimer *)self->_activateScenesTimer invalidate];
  activateScenesTimer = self->_activateScenesTimer;
  self->_activateScenesTimer = 0;

  [(SBFluidSwitcherGestureWorkspaceTransaction *)self _updateDigitizerSurfaceDimensions];
  double v23 = [v4 _activeEventOfType:0];
  double v24 = [v4 _activeTouchesForEvent:v23];
  double v25 = [v24 anyObject];
  self->_isPointerTouch = [v25 _isPointerTouch];

  unint64_t SenderID = [v23 _hidEvent];
  if (SenderID) {
    unint64_t SenderID = IOHIDEventGetSenderID();
  }
  self->_hidEventunint64_t SenderID = SenderID;
  objc_initWeak((id *)buf, self);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __64__SBFluidSwitcherGestureWorkspaceTransaction__beginWithGesture___block_invoke;
  v33[3] = &unk_1E6AFBC38;
  objc_copyWeak(&v34, (id *)buf);
  double v27 = (void *)MEMORY[0x1D948C7A0](v33);
  double v28 = [[SBFluidSwitcherGesture alloc] initWithType:[(SBFluidSwitcherGestureWorkspaceTransaction *)self _gestureType] eventProvider:v27];
  [(SBFluidSwitcherGesture *)v28 _setState:1];
  double v29 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedAppLayout];
  [(SBFluidSwitcherGesture *)v28 _setSelectedAppLayout:v29];

  double v30 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
  [(SBFluidSwitcherGesture *)v28 _setGestureRecognizerForStudyLog:v30];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained fluidSwitcherGestureTransaction:self didBeginGesture:v28];

  v32 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self backgroundingScenesDeactivationAssertion];
  [v32 relinquish];

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
}

id __64__SBFluidSwitcherGestureWorkspaceTransaction__beginWithGesture___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained _currentGestureEventForGesture:v3];

  return v5;
}

- (void)_updateWithGesture:(id)a3
{
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self _updateDigitizerSurfaceDimensions];
  id v7 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  id v4 = [v7 layoutContext];
  uint64_t v5 = [v4 activeGesture];

  [v5 _setState:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained fluidSwitcherGestureTransaction:self didUpdateGesture:v5];
}

- (void)_finishWithGesture:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = (objc_class *)objc_opt_class();
    long long v9 = NSStringFromClass(v8);
    long long v10 = SBSystemGestureRecognizerStateDescription([v4 state]);
    int v15 = 138544386;
    double v16 = v7;
    __int16 v17 = 2050;
    double v18 = self;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    __int16 v21 = 2050;
    id v22 = v4;
    __int16 v23 = 2114;
    double v24 = v10;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Finish with gesture recognizer: <%{public}@:%{public}p> (%{public}@)", (uint8_t *)&v15, 0x34u);
  }
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self _updatePPTsForGestureEnded];
  self->_hasCompletedAtLeastOneGesture = 1;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self _updateDigitizerSurfaceDimensions];
  objc_super v11 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  long long v12 = [v11 layoutContext];
  id v13 = [v12 activeGesture];

  [v13 _setState:3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained fluidSwitcherGestureTransaction:self didEndGesture:v13];
}

- (void)setSelectedAppLayout:(id)a3
{
  id v8 = (SBAppLayout *)a3;
  if (self->_selectedAppLayout != v8)
  {
    objc_storeStrong((id *)&self->_selectedAppLayout, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
    id v6 = [WeakRetained layoutContext];
    id v7 = [v6 activeGesture];
    [v7 _setSelectedAppLayout:v8];
  }
}

- (BOOL)isLiveResize
{
  return 0;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 request];
  id v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _windowSceneForWorkspaceTransitionRequest:v5];

  id v7 = [v6 layoutStateTransitionCoordinator];
  id v8 = [v7 layoutStateForApplicationTransitionContext:v4];

  return v8;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id v4 = [a3 request];
  uint64_t v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _switcherControllerForWorkspaceTransitionRequest:v4];

  id v6 = [(NSMapTable *)self->_activeLayoutStatesBySwitcherController objectForKey:v5];

  return v6;
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 request];
  [v7 applicationTransitionContext:v6 frameForApplicationSceneEntity:v5];
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

- (void)transactionDidComplete:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = (SBSceneLayoutWorkspaceTransaction *)a3;
  id v5 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    double v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138544130;
    id v62 = v7;
    __int16 v63 = 2050;
    v64 = self;
    __int16 v65 = 2114;
    v66 = v9;
    __int16 v67 = 2050;
    v68 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Transaction did complete: <%{public}@:%{public}p>", buf, 0x2Au);
  }
  double v10 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self animationController];
  BOOL v11 = v10 == v4;

  if (v11)
  {
    __int16 v48 = [(SBUIWorkspaceAnimationController *)self->_animationController workspaceTransitionRequest];
    double v12 = [v48 completionBlock];

    if (v12)
    {
      double v13 = [v48 completionBlock];
      v13[2](v13, 1);
    }
    animationController = self->_animationController;
    self->_animationController = 0;

    autoPIPWorkspaceTransaction = self->_autoPIPWorkspaceTransaction;
    self->_autoPIPWorkspaceTransaction = 0;

    if (([(SBSceneLayoutWorkspaceTransaction *)v4 isInterrupted] & 1) == 0)
    {
      double v16 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _copiedTransitionRequestFromTransitionRequest:v48];
      double v17 = [v16 applicationContext];
      [v17 setAnimationDisabled:1];

      double v18 = [v16 transientOverlayContext];
      [v18 setAnimated:0];

      [v16 finalize];
      double v19 = [v16 applicationContext];
      uint64_t v46 = [v19 layoutState];

      [(SBFluidSwitcherGestureWorkspaceTransaction *)self _updatePPTsForAnimationEndedWithFinalLayoutState:v46];
      [(SBFluidSwitcherGestureWorkspaceTransaction *)self setSelectedAppLayout:0];
      [(NSTimer *)self->_activateScenesTimer invalidate];
      activateScenesTimer = self->_activateScenesTimer;
      self->_activateScenesTimer = 0;

      if ([(NSMutableSet *)self->_layoutTransitionCompletions count])
      {
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        __int16 v21 = self->_layoutTransitionCompletions;
        uint64_t v22 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v57 objects:v72 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v58;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v58 != v23) {
                objc_enumerationMutation(v21);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v57 + 1) + 8 * v24++) + 16))();
            }
            while (v22 != v24);
            uint64_t v22 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v57 objects:v72 count:16];
          }
          while (v22);
        }

        [(NSMutableSet *)self->_layoutTransitionCompletions removeAllObjects];
      }
      else
      {
        [(SBFluidSwitcherGestureWorkspaceTransaction *)self _failRunningLayoutStateTransition];
      }
      layoutTransaction = self->_layoutTransaction;
      if (layoutTransaction)
      {
        [(SBWorkspaceTransaction *)layoutTransaction interruptForTransitionRequest:v16];
        double v28 = self->_layoutTransaction;
        self->_layoutTransaction = 0;
      }
      if ([(NSMutableSet *)self->_ancillaryLayoutTransactions count])
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        double v29 = self->_ancillaryLayoutTransactions;
        uint64_t v30 = [(NSMutableSet *)v29 countByEnumeratingWithState:&v53 objects:v71 count:16];
        if (v30)
        {
          uint64_t v31 = *(void *)v54;
          do
          {
            uint64_t v32 = 0;
            do
            {
              if (*(void *)v54 != v31) {
                objc_enumerationMutation(v29);
              }
              [*(id *)(*((void *)&v53 + 1) + 8 * v32++) interruptForTransitionRequest:v16];
            }
            while (v30 != v32);
            uint64_t v30 = [(NSMutableSet *)v29 countByEnumeratingWithState:&v53 objects:v71 count:16];
          }
          while (v30);
        }

        [(NSMutableSet *)self->_ancillaryLayoutTransactions removeAllObjects];
      }
      if ([v47 unlockedEnvironmentMode] == 1) {
        objc_msgSend((id)SBApp, "updateNativeOrientationWithOrientation:updateMirroredDisplays:animated:logMessage:", objc_msgSend((id)SBApp, "interfaceOrientationForCurrentDeviceOrientation:", 0), 1, 1, @"SBFluidSwitcherGestureWorkspaceTransaction completed transition to home screen");
      }
      double v33 = [(SBWorkspaceTransaction *)self transitionRequest];
      id v34 = [v33 workspace];
      long long v35 = [v34 transactionForTransitionRequest:v16];

      objc_storeStrong((id *)&self->_finalRootTransaction, v35);
      uint64_t v36 = objc_opt_class();
      long long v37 = SBSafeCast(v36, v35);
      long long v38 = v37;
      if (v37) {
        [v37 _setShouldSerialDismissOverlays:0];
      }
      objc_initWeak(&location, self);
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __69__SBFluidSwitcherGestureWorkspaceTransaction_transactionDidComplete___block_invoke;
      v49[3] = &unk_1E6AFBC60;
      objc_copyWeak(&v51, &location);
      v49[4] = self;
      id v39 = v16;
      id v50 = v39;
      [(SBSceneLayoutWorkspaceTransaction *)v35 setCompletionBlock:v49];
      double v40 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _switcherControllerForWorkspaceTransitionRequest:v39];
      [(NSMapTable *)self->_activeLayoutStatesBySwitcherController setObject:v47 forKey:v40];
      id v41 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        __int16 v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        id v43 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v44 = (objc_class *)objc_opt_class();
        double v45 = NSStringFromClass(v44);
        *(_DWORD *)buf = 138544386;
        id v62 = v43;
        __int16 v63 = 2050;
        v64 = self;
        __int16 v65 = 2114;
        v66 = v45;
        __int16 v67 = 2050;
        v68 = v35;
        __int16 v69 = 2114;
        v70 = v47;
        _os_log_impl(&dword_1D85BA000, v41, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Running final root transaction: <%{public}@:%{public}p> to transition to layout state: %{public}@", buf, 0x34u);
      }
      [(SBFluidSwitcherGestureWorkspaceTransaction *)self _addChildWorkspaceTransaction:v35];

      objc_destroyWeak(&v51);
      objc_destroyWeak(&location);
    }
  }
  else if (self->_layoutTransaction == v4)
  {
    uint64_t v25 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self backgroundingScenesDeactivationAssertion];
    [v25 relinquish];

    double v26 = self->_layoutTransaction;
    self->_layoutTransaction = 0;
  }
  else if ([(NSMutableSet *)self->_ancillaryLayoutTransactions containsObject:v4])
  {
    [(NSMutableSet *)self->_ancillaryLayoutTransactions removeObject:v4];
  }
}

void __69__SBFluidSwitcherGestureWorkspaceTransaction_transactionDidComplete___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = SBLogSystemGestureAppSwitcher();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      id v6 = [WeakRetained finalRootTransaction];
      id v7 = (objc_class *)objc_opt_class();
      double v8 = NSStringFromClass(v7);
      double v9 = [WeakRetained finalRootTransaction];
      int v15 = 138544130;
      double v16 = v5;
      __int16 v17 = 2050;
      double v18 = WeakRetained;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      __int16 v21 = 2050;
      uint64_t v22 = v9;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Transaction did complete: <%{public}@:%{public}p>", (uint8_t *)&v15, 0x2Au);
    }
    double v10 = [WeakRetained gestureRecognizer];
    uint64_t v11 = [v10 state];

    if ((unint64_t)(v11 - 3) > 0xFFFFFFFFFFFFFFFDLL
      || ([WeakRetained animationController],
          double v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v12))
    {
      double v13 = [*(id *)(a1 + 32) _switcherControllerForWorkspaceTransitionRequest:*(void *)(a1 + 40)];
      double v14 = [v13 layoutState];
      [WeakRetained[44] setObject:v14 forKey:v13];
    }
    else
    {
      [WeakRetained finishWithCompletionType:1];
    }
    [WeakRetained setFinalRootTransaction:0];
  }
}

- (id)createSceneEntityForHandle:(id)a3
{
  id v3 = a3;
  id v4 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationSceneHandle:v3];

  return v4;
}

- (void)transaction:(id)a3 performTransitionWithCompletion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = (SBSceneLayoutWorkspaceTransaction *)a3;
  id v7 = (void (**)(void))a4;
  double v8 = v7;
  if (self->_animationController)
  {
    layoutTransitionCompletions = self->_layoutTransitionCompletions;
    double v10 = (void *)[v7 copy];
    uint64_t v11 = (void *)MEMORY[0x1D948C7A0]();
    [(NSMutableSet *)layoutTransitionCompletions addObject:v11];
  }
  else if (v7)
  {
    v7[2](v7);
  }
  if (self->_layoutTransaction == v6 && [(NSMutableSet *)self->_ancillaryLayoutTransactions count])
  {
    double v29 = v8;
    uint64_t v12 = [(SBWorkspaceTransaction *)v6 displayIdentity];
    double v13 = [(id)SBApp windowSceneManager];
    double v28 = (void *)v12;
    double v14 = [v13 windowSceneForDisplayIdentity:v12];

    double v27 = [v14 switcherController];
    char v15 = [v27 isChamoisWindowingUIEnabled];
    double v16 = [v14 sceneManager];
    __int16 v17 = [(SBWorkspaceTransaction *)v6 transitionRequest];
    double v18 = [v17 applicationContext];
    __int16 v19 = [v18 layoutState];
    uint64_t v20 = [v19 elements];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v20;
    uint64_t v21 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          double v26 = +[SBSceneManagerCoordinator sharedInstance];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __90__SBFluidSwitcherGestureWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke;
          v31[3] = &unk_1E6AFBC88;
          id v32 = v16;
          uint64_t v33 = v25;
          char v34 = v15;
          [v26 enumerateSceneManagersWithBlock:v31];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v22);
    }

    double v8 = v29;
  }
}

void __90__SBFluidSwitcherGestureWorkspaceTransaction_transaction_performTransitionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(id *)(a1 + 32) != v3)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = objc_msgSend(v3, "allScenes", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v11 = [v10 identifier];
          uint64_t v12 = [*(id *)(a1 + 40) uniqueIdentifier];
          int v13 = [v11 isEqualToString:v12];

          if (v13)
          {
            double v14 = [v10 identity];
            [v4 transferOwnershipOfSceneWithIdentity:v14 toSceneManager:*(void *)(a1 + 32)];

            char v15 = [*(id *)(a1 + 32) existingSceneHandleForScene:v10];
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

            [v19 setWantsEnhancedWindowingEnabled:*(unsigned __int8 *)(a1 + 48)];
            goto LABEL_17;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
}

- (void)transaction:(id)a3 didEndLayoutTransitionWithContinuation:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
}

- (BOOL)transaction:(id)a3 shouldKeepSceneForeground:(id)a4 withReason:(id *)a5
{
  int64_t v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _gestureType];
  if (a5 && v6 == 8) {
    *a5 = @"window drag";
  }
  return v6 == 8;
}

- (void)handleTransitionRequestForGestureUpdate:(id)a3 fromGestureManager:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  __int16 v63 = self;
  id v56 = a4;
  long long v58 = -[SBFluidSwitcherGestureWorkspaceTransaction _workspaceTransitionRequestForSwitcherTransitionRequest:fromGestureManager:withEventLabel:](self, "_workspaceTransitionRequestForSwitcherTransitionRequest:fromGestureManager:withEventLabel:", v6);
  uint64_t v7 = [v56 switcherController];
  long long v60 = [v58 applicationContext];
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  uint64_t v8 = [v7 switcherCoordinator];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __105__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureUpdate_fromGestureManager___block_invoke;
  v69[3] = &unk_1E6AFBCB0;
  id v54 = v6;
  id v70 = v54;
  v71 = v63;
  uint64_t v73 = &v74;
  id v55 = v7;
  id v72 = v55;
  [v8 enumerateSwitcherControllersWithBlock:v69];

  [v58 setCrossingDisplays:*((unsigned __int8 *)v75 + 24)];
  int v9 = [v55 isChamoisWindowingUIEnabled];
  int v10 = [v60 isInLiveResize];
  if (*((unsigned char *)v75 + 24)) {
    int v11 = 1;
  }
  else {
    int v11 = v9;
  }
  int v12 = v10 ^ 1;
  if (v11 != 1 || !v12)
  {
    [v58 finalize];
    int v57 = v12;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    int v13 = [v60 entities];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v65 objects:v78 count:16];
    if (!v14) {
      goto LABEL_34;
    }
    uint64_t v61 = *(void *)v66;
    id obj = v13;
    while (1)
    {
      uint64_t v62 = v14;
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v66 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        if ([v16 isApplicationSceneEntity])
        {
          id v17 = v16;
          double v18 = [[SBApplicationSceneUpdateTransaction alloc] initWithApplicationSceneEntity:v17 transitionRequest:v58];
          id v19 = [v17 sceneHandle];
          long long v20 = [v19 sceneIfExists];
          long long v21 = [v20 identifier];
          long long v22 = v21;
          if (v21)
          {
            id v64 = v21;
          }
          else
          {
            id v64 = [v19 sceneIdentifier];
          }

          BOOL v23 = [(SBFluidSwitcherGestureWorkspaceTransaction *)v63 _sceneUpdateTransactionIsForLiveResize:v18];
          uint64_t v24 = [v20 settings];
          [v24 frame];
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          CGFloat v32 = v31;

          if ([v17 supportsPresentationAtAnySize])
          {
            [v60 frameForApplicationSceneEntity:v17];
            CGFloat v34 = v33;
            CGFloat v36 = v35;
            CGFloat v38 = v37;
            CGFloat v40 = v39;
          }
          else
          {
            id v41 = [(SBApplicationSceneUpdateTransaction *)v18 sceneSettings];
            [v41 frame];
            CGFloat v34 = v42;
            CGFloat v36 = v43;
            CGFloat v38 = v44;
            CGFloat v40 = v45;
          }
          uint64_t v46 = [v20 settings];
          uint64_t v47 = [v46 interfaceOrientation];

          __int16 v48 = [v60 layoutState];
          uint64_t v49 = [v17 uniqueIdentifier];
          uint64_t v50 = [v48 interfaceOrientationForElementIdentifier:v49];

          if (!v20) {
            goto LABEL_30;
          }
          if ((v57 | v23)) {
            goto LABEL_38;
          }
          v80.origin.x = v26;
          v80.origin.y = v28;
          v80.size.width = v30;
          v80.size.height = v32;
          v81.origin.x = v34;
          v81.origin.y = v36;
          v81.size.width = v38;
          v81.size.height = v40;
          BOOL v51 = CGRectEqualToRect(v80, v81);
          if (v47 != v50 || !v51)
          {
LABEL_38:
            if (v23
              && [(NSMutableSet *)v63->_sceneIdentifiersWithSceneUpdateTransactionsInProgress containsObject:v64])
            {
              long long v53 = [(NSMutableDictionary *)v63->_pendingSceneUpdateTransactionsBySceneIdentifier objectForKey:v64];
              if (v53) {
                [(NSMutableDictionary *)v63->_pendingSceneUpdateTransactionsBySceneIdentifier removeObjectForKey:v64];
              }
              [(NSMutableDictionary *)v63->_pendingSceneUpdateTransactionsBySceneIdentifier setObject:v18 forKey:v64];

              goto LABEL_31;
            }
LABEL_30:
            [(SBFluidSwitcherGestureWorkspaceTransaction *)v63 _startSceneUpdateTransaction:v18 forSceneIdentifier:v64];
          }
LABEL_31:

          continue;
        }
      }
      int v13 = obj;
      uint64_t v14 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
      if (!v14)
      {
LABEL_34:

        goto LABEL_35;
      }
    }
  }
  [v58 modifyApplicationContext:&__block_literal_global_71];
  [v58 finalize];
  [(SBFluidSwitcherGestureWorkspaceTransaction *)v63 _runSceneLayoutTransactionForTransitionRequest:v58 updateScenes:1];
LABEL_35:

  _Block_object_dispose(&v74, 8);
}

void __105__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureUpdate_fromGestureManager___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a2;
  id v12 = [v5 appLayout];
  uint64_t v7 = [*(id *)(a1[5] + 352) objectForKey:v6];
  uint64_t v8 = [v7 appLayout];
  int v9 = [v7 floatingAppLayout];
  char v10 = [v6 isEqual:a1[6]];

  if (v10)
  {
    char v11 = 0;
  }
  else if ([v8 containsAnyItemFromAppLayout:v12])
  {
    char v11 = 1;
  }
  else
  {
    char v11 = [v9 containsAnyItemFromAppLayout:v12];
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v11;
  *a3 = *(unsigned char *)(*(void *)(a1[7] + 8) + 24);
}

void __105__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureUpdate_fromGestureManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 applicationSceneEntities];
  objc_msgSend(v2, "bs_each:", &__block_literal_global_82);
}

uint64_t __105__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureUpdate_fromGestureManager___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setFlag:1 forActivationSetting:9];
}

- (BOOL)_sceneUpdateTransactionIsForLiveResize:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 applicationSceneEntity];

  id v6 = [v5 sceneHandle];
  uint64_t v7 = [v6 sceneIfExists];
  uint64_t v8 = [v7 settings];
  int v9 = SBSafeCast(v4, v8);

  LOBYTE(v6) = [v9 inLiveResize];
  return (char)v6;
}

- (void)_startSceneUpdateTransaction:(id)a3 forSceneIdentifier:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 applicationSceneEntity];
  int v9 = [v8 sceneHandle];
  char v10 = [v9 sceneIfExists];

  if (!v10) {
    goto LABEL_5;
  }
  char v11 = [v10 settings];
  [v11 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  long long v20 = [v6 sceneSettings];
  [v20 frame];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  double v29 = [v10 settings];
  uint64_t v30 = [v29 interfaceOrientation];

  double v31 = [v6 sceneSettings];
  uint64_t v32 = [v31 interfaceOrientation];

  if (![(SBFluidSwitcherGestureWorkspaceTransaction *)self _sceneUpdateTransactionIsForLiveResize:v6])goto LABEL_5; {
  v60.origin.x = v13;
  }
  v60.origin.y = v15;
  v60.size.width = v17;
  v60.size.height = v19;
  v61.origin.x = v22;
  v61.origin.y = v24;
  v61.size.width = v26;
  v61.size.height = v28;
  if (!CGRectEqualToRect(v60, v61) || v30 != v32)
  {
LABEL_5:
    BOOL v51 = v10;
    [(NSMutableSet *)self->_sceneIdentifiersWithSceneUpdateTransactionsInProgress addObject:v7];
    double v52 = v6;
    [(SBFluidSwitcherGestureWorkspaceTransaction *)self addChildTransaction:v6 withSchedulingPolicy:0];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
    double v33 = [WeakRetained liveContentOverlays];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v55 != v36) {
            objc_enumerationMutation(v33);
          }
          CGFloat v38 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          if (![v38 type])
          {
            double v39 = [v38 itemForLayoutRole:1];
            CGFloat v40 = [v39 uniqueIdentifier];
            int v41 = [v40 isEqual:v7];

            if (v41)
            {
              double v42 = [WeakRetained liveContentOverlays];
              double v43 = [v42 objectForKey:v38];

              if (objc_opt_respondsToSelector())
              {
                double v44 = [v52 sceneSettings];
                [v44 frame];
                double v46 = v45;
                double v48 = v47;

                uint64_t v49 = [v52 sceneSettings];
                uint64_t v50 = [v49 interfaceOrientation];

                objc_msgSend(v43, "setContentReferenceSize:interfaceOrientation:", v50, v46, v48);
              }

              goto LABEL_18;
            }
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v54 objects:v58 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    char v10 = v51;
    id v6 = v52;
  }
}

- (void)handleTransitionRequestForGestureComplete:(id)a3 fromGestureManager:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v69 = a4;
  id v70 = [v6 appLayout];
  unint64_t v7 = [v6 unlockedEnvironmentMode];
  uint64_t v8 = [v6 floatingConfiguration];
  [v6 floatingSwitcherVisible];
  [(NSMutableDictionary *)self->_pendingSceneUpdateTransactionsBySceneIdentifier removeAllObjects];
  LODWORD(a4) = [(SBFluidSwitcherGestureWorkspaceTransaction *)self isInterrupted];
  int v9 = SBLogSystemGestureAppSwitcher();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (a4)
  {
    if (v10)
    {
      char v11 = (objc_class *)objc_opt_class();
      double v12 = NSStringFromClass(v11);
      CGFloat v13 = SBStringForUnlockedEnvironmentMode(v7);
      double v14 = SBStringForFloatingConfiguration(v8);
      CGFloat v15 = BSSettingFlagDescription();
      *(_DWORD *)buf = 138544642;
      v78 = v12;
      __int16 v79 = 2050;
      CGRect v80 = self;
      __int16 v81 = 2114;
      v82 = v70;
      __int16 v83 = 2114;
      v84 = v13;
      __int16 v85 = 2114;
      v86 = v14;
      __int16 v87 = 2114;
      v88 = v15;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> skipping adding final child transaction, because current transaction interrupted: appLayout: %{public}@, unlockedEnvironmentMode: %{public}@, floatingConfiguration: %{public}@, floatingSwitcherVisible: %{public}@", buf, 0x3Eu);
    }
    goto LABEL_52;
  }
  if (v10)
  {
    double v16 = (objc_class *)objc_opt_class();
    CGFloat v17 = NSStringFromClass(v16);
    double v18 = SBStringForUnlockedEnvironmentMode(v7);
    CGFloat v19 = SBStringForFloatingConfiguration(v8);
    long long v20 = BSSettingFlagDescription();
    *(_DWORD *)buf = 138544642;
    v78 = v17;
    __int16 v79 = 2050;
    CGRect v80 = self;
    __int16 v81 = 2114;
    v82 = v70;
    __int16 v83 = 2114;
    v84 = v18;
    __int16 v85 = 2114;
    v86 = v19;
    __int16 v87 = 2114;
    v88 = v20;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "<%{public}@:%{public}p> Adding child transaction to activate appLayout: %{public}@, unlockedEnvironmentMode: %{public}@, floatingConfiguration: %{public}@, floatingSwitcherVisible: %{public}@", buf, 0x3Eu);
  }
  int v9 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _workspaceTransitionRequestForSwitcherTransitionRequest:v6 fromGestureManager:v69 withEventLabel:@"FinalFluidSwitcherGestureAction"];
  [v9 finalize];
  long long v68 = [v69 switcherController];
  long long v66 = [v68 switcherCoordinator];
  [(SBUISwitcherAnimationController *)self->_animationController interruptWithReason:@"GestureCompleting"];
  animationController = self->_animationController;
  self->_animationController = 0;

  uint64_t v22 = objc_opt_class();
  double v23 = [v66 animationControllerForTransitionRequest:v9];
  SBSafeCast(v22, v23);
  CGFloat v24 = (SBUISwitcherAnimationController *)objc_claimAutoreleasedReturnValue();
  double v25 = self->_animationController;
  self->_animationController = v24;

  CGFloat v26 = self->_animationController;
  if (!v26)
  {
    uint64_t v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherGestureWorkspaceTransaction.m" lineNumber:978 description:@"Got a nil animationController back from SBSwitcherController!"];

    CGFloat v26 = self->_animationController;
  }
  [(SBUIAnimationController *)v26 addObserver:self];
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self addChildTransaction:self->_animationController];
  double v27 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self _updateMainDisplayIfNecessaryForWorkspaceTransitionRequests:v27];

  if (v7 == 2)
  {
    int IsYes = 1;
    goto LABEL_12;
  }
  int IsYes = BSSettingFlagIsYes();
  if (v7 != 1)
  {
LABEL_12:
    uint64_t v30 = [v70 allItems];
    BOOL v29 = [v30 count] == 0;

    if ((IsYes | v29 | SBFloatingConfigurationIsStashed(v8)))
    {
      LOBYTE(v63) = 0;
    }
    else
    {
      double v31 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedAppLayout];
      BOOL v63 = ([v70 isOrContainsAppLayout:v31] & 1) == 0
         && [(SBFluidSwitcherGestureWorkspaceTransaction *)self _gestureType] != 8;

      BOOL v29 = v63;
    }
    goto LABEL_18;
  }
  SBFloatingConfigurationIsStashed(v8);
  LOBYTE(v63) = 0;
  BOOL v29 = 1;
LABEL_18:
  uint64_t v32 = [v9 applicationContext];
  long long v65 = [v32 layoutState];

  double v33 = [v9 applicationContext];
  long long v67 = [v33 previousLayoutState];

  if (SBPeekConfigurationIsValid([v67 peekConfiguration])
    && !SBPeekConfigurationIsValid([v65 peekConfiguration]))
  {
    [v68 _dismissMedusaBanner];
  }
  uint64_t v34 = self->_animationController;
  if (v34) {
    BOOL v35 = v29;
  }
  else {
    BOOL v35 = 0;
  }
  if (!v35) {
    goto LABEL_37;
  }
  uint64_t v36 = [v68 contentViewController];
  uint64_t v37 = objc_opt_class();
  id v38 = v36;
  if (v37)
  {
    if (objc_opt_isKindOfClass()) {
      double v39 = v38;
    }
    else {
      double v39 = 0;
    }
  }
  else
  {
    double v39 = 0;
  }
  id v40 = v39;

  int v41 = [v9 applicationContext];
  char v42 = [v40 shouldMorphToPIPForTransitionContext:v41];

  if (v42)
  {
    double v43 = [[SBAutoPIPWorkspaceTransaction alloc] initWithTransitionRequest:v9];
    autoPIPWorkspaceTransaction = self->_autoPIPWorkspaceTransaction;
    self->_autoPIPWorkspaceTransaction = v43;

    double v45 = [v9 transientOverlayContext];
    double v46 = [v45 transientOverlay];
    double v47 = [v46 viewController];
    double v48 = v47;
    if (v47)
    {
      uint64_t v49 = self->_autoPIPWorkspaceTransaction;
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke;
      v75[3] = &unk_1E6AF5350;
      id v76 = v47;
      [(SBAutoPIPWorkspaceTransaction *)v49 setCompletionBlock:v75];
    }
    [(SBFluidSwitcherGestureWorkspaceTransaction *)self addChildTransaction:self->_autoPIPWorkspaceTransaction];
  }
  if (self->_autoPIPWorkspaceTransaction
    || +[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:v9 reason:1])
  {
    [(SBUISwitcherAnimationController *)self->_animationController _setInterruptible:0];
    uint64_t v50 = 0;
  }
  else
  {
LABEL_37:
    uint64_t v50 = 1;
  }
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self _acquireBackgroundingScenesDeactivationAssertionForTransitionRequest:v9];
  BOOL v51 = [(NSMapTable *)self->_originalLayoutStatesBySwitcherController objectForKey:v68];
  double v52 = [(NSMapTable *)self->_activeLayoutStatesBySwitcherController objectForKey:v68];
  if ([v52 unlockedEnvironmentMode] != 3) {
    goto LABEL_42;
  }
  uint64_t v53 = [v70 type];
  char v54 = !v63;
  if (v53) {
    char v54 = 1;
  }
  if (!((v34 == 0) | v54 & 1))
  {
    [(SBFluidSwitcherGestureWorkspaceTransaction *)self _runSceneLayoutTransactionForTransitionRequest:v9 updateScenes:0];
    ++self->_numberOfAppLayoutsTraveledWithArcSwipe;
    long long v55 = [v51 appLayout];
    int v56 = [v70 isEqual:v55];

    if (v56) {
      self->_int64_t numberOfAppLayoutsTraveledWithArcSwipe = 0;
    }
    objc_initWeak((id *)buf, self);
    int64_t numberOfAppLayoutsTraveledWithArcSwipe = self->_numberOfAppLayoutsTraveledWithArcSwipe;
    if (numberOfAppLayoutsTraveledWithArcSwipe <= 1) {
      int64_t numberOfAppLayoutsTraveledWithArcSwipe = 1;
    }
    if ((double)(numberOfAppLayoutsTraveledWithArcSwipe - 1) * 0.5 + 0.1 <= *(double *)&SBFluidSwitcherMaximumActivationDelayForArcSwipes) {
      double v58 = (double)(numberOfAppLayoutsTraveledWithArcSwipe - 1) * 0.5 + 0.1;
    }
    else {
      double v58 = *(double *)&SBFluidSwitcherMaximumActivationDelayForArcSwipes;
    }
    uint64_t v59 = (void *)MEMORY[0x1E4F1CB00];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke_2;
    v71[3] = &unk_1E6AFBCD8;
    objc_copyWeak(&v73, (id *)buf);
    id v72 = v9;
    char v74 = v50;
    CGRect v60 = [v59 scheduledTimerWithTimeInterval:0 repeats:v71 block:v58];
    activateScenesTimer = self->_activateScenesTimer;
    self->_activateScenesTimer = v60;

    objc_destroyWeak(&v73);
    objc_destroyWeak((id *)buf);
  }
  else
  {
LABEL_42:
    [(SBFluidSwitcherGestureWorkspaceTransaction *)self _runSceneLayoutTransactionForTransitionRequest:v9 updateScenes:v50];
  }

LABEL_52:
}

uint64_t __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) handlePictureInPictureDidBegin];
  }
  return result;
}

void __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke_3;
    v3[3] = &unk_1E6AF8788;
    id v4 = *(id *)(a1 + 32);
    SBLayoutRoleEnumerateValidRoles(v3);
    [WeakRetained _runSceneLayoutTransactionForTransitionRequest:*(void *)(a1 + 32) updateScenes:*(unsigned __int8 *)(a1 + 48)];
  }
}

void __107__SBFluidSwitcherGestureWorkspaceTransaction_handleTransitionRequestForGestureComplete_fromGestureManager___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) applicationContext];
  id v8 = [v4 entityForLayoutRole:a2];

  id v5 = v8;
  if (!v8)
  {
    id v6 = [*(id *)(a1 + 32) applicationContext];
    unint64_t v7 = +[SBWorkspaceEntity entity];
    [v6 setEntity:v7 forLayoutRole:a2];

    id v5 = 0;
  }
}

- (void)_updateMainDisplayIfNecessaryForWorkspaceTransitionRequests:(id)a3
{
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __106__SBFluidSwitcherGestureWorkspaceTransaction__updateMainDisplayIfNecessaryForWorkspaceTransitionRequests___block_invoke;
  v26[3] = &unk_1E6AFBD00;
  v26[4] = self;
  id v4 = objc_msgSend(a3, "bs_firstObjectPassingTest:", v26);
  if (v4)
  {
    id v5 = [(SBWorkspaceTransaction *)self windowScene];
    id v6 = [v5 homeScreenController];
    unint64_t v7 = [v4 applicationContext];
    id v8 = [v7 layoutState];

    int v9 = [v8 appLayout];
    uint64_t v10 = [v8 unlockedEnvironmentMode];
    uint64_t v11 = [v8 floatingConfiguration];
    [v8 isFloatingSwitcherVisible];
    if (v10 == 2)
    {
      int v12 = 1;
    }
    else
    {
      int IsYes = BSSettingFlagIsYes();
      if (v10 == 1)
      {
        SBFloatingConfigurationIsStashed(v11);
        LOBYTE(v11) = 1;
        goto LABEL_18;
      }
      int v12 = IsYes;
    }
    double v14 = [v9 allItems];
    uint64_t v15 = [v14 count];

    BOOL IsStashed = SBFloatingConfigurationIsStashed(v11);
    if (v15) {
      LODWORD(v11) = v12;
    }
    else {
      LODWORD(v11) = 1;
    }
    if ((v11 & 1) == 0 && !IsStashed)
    {
      id v17 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedAppLayout];
      if ([v9 isOrContainsAppLayout:v17])
      {
LABEL_33:

        goto LABEL_34;
      }
      int64_t v18 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _gestureType];

      if (v18 == 8) {
        goto LABEL_34;
      }
      goto LABEL_17;
    }
    if (v15)
    {
      if (!v11)
      {
LABEL_34:

        goto LABEL_35;
      }
LABEL_17:
      int v19 = 0;
LABEL_23:
      double v23 = [v6 iconManager];
      CGFloat v24 = v23;
      if (v23)
      {
        id v17 = v23;
      }
      else
      {
        double v25 = +[SBIconController sharedInstance];
        id v17 = [v25 iconManager];
      }
      if ([v17 isFolderPageManagementUIVisible])
      {
        [v17 dismissFolderPageManagementUI];
      }
      else if ([v17 isShowingModalInteraction])
      {
        if (v19) {
          [v17 popModalInteraction];
        }
        else {
          [v17 dismissModalInteractions];
        }
      }
      else
      {
        [v17 setEditing:0];
      }
      goto LABEL_33;
    }
LABEL_18:
    uint64_t v20 = [v8 interfaceOrientation];
    [(id)SBApp noteInterfaceOrientationChanged:v20 logMessage:@"SBFluidSwitcherGestureWorkspaceTransaction running animation to home screen"];
    if (v6)
    {
      id v21 = v6;
    }
    else
    {
      id v21 = +[SBUIController sharedInstance];
    }
    uint64_t v22 = v21;
    [v21 beginRequiringContentForReason:@"SBUIHomeScreenActiveContentRequirementReason"];

    if ((v11 & 1) == 0) {
      goto LABEL_34;
    }
    int v19 = 1;
    goto LABEL_23;
  }
LABEL_35:
}

uint64_t __106__SBFluidSwitcherGestureWorkspaceTransaction__updateMainDisplayIfNecessaryForWorkspaceTransitionRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) _windowSceneForWorkspaceTransitionRequest:a2];
  if ([v2 isMainDisplayWindowScene]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isContinuityDisplayWindowScene];
  }

  return v3;
}

- (void)_acquireBackgroundingScenesDeactivationAssertionForTransitionRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _switcherControllerForWorkspaceTransitionRequest:v4];
  id v6 = [(NSMapTable *)self->_activeLayoutStatesBySwitcherController objectForKey:v5];
  unint64_t v7 = [v6 elements];
  id v8 = (void *)[v7 mutableCopy];

  int v9 = [v4 applicationContext];

  uint64_t v10 = [v9 layoutState];
  uint64_t v11 = [v10 elements];
  [v8 minusSet:v11];

  if ([v8 count])
  {
    int v12 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self backgroundingScenesDeactivationAssertion];
    [v12 relinquish];

    CGFloat v13 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self backgroundingScenesDeactivationAssertion];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __115__SBFluidSwitcherGestureWorkspaceTransaction__acquireBackgroundingScenesDeactivationAssertionForTransitionRequest___block_invoke;
    v14[3] = &unk_1E6AF9A10;
    id v15 = v8;
    [v13 acquireWithPredicate:v14 transitionContext:0];
  }
}

uint64_t __115__SBFluidSwitcherGestureWorkspaceTransaction__acquireBackgroundingScenesDeactivationAssertionForTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "workspaceEntity", (void)v15);
        int v9 = [v8 applicationSceneEntity];
        uint64_t v10 = [v9 sceneHandle];
        uint64_t v11 = [(id)v10 sceneIfExists];

        int v12 = [v11 identifier];
        CGFloat v13 = [v3 identifier];
        LOBYTE(v10) = [v12 isEqual:v13];

        if (v10)
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_runSceneLayoutTransactionForTransitionRequest:(id)a3 updateScenes:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  layoutTransaction = self->_layoutTransaction;
  if (layoutTransaction)
  {
    [(SBWorkspaceTransaction *)layoutTransaction interruptForTransitionRequest:v7];
    int v9 = self->_layoutTransaction;
    self->_layoutTransaction = 0;
  }
  if ([(NSMutableSet *)self->_ancillaryLayoutTransactions count])
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v10 = self->_ancillaryLayoutTransactions;
    uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v63 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v62 + 1) + 8 * i) interruptForTransitionRequest:v7];
        }
        uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v12);
    }

    [(NSMutableSet *)self->_ancillaryLayoutTransactions removeAllObjects];
  }
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self _failRunningLayoutStateTransition];
  BOOL v15 = !v4;
  long long v16 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherController];
  long long v17 = [v16 switcherCoordinator];

  [v17 setLiveContentOverlayUpdatesSuspended:v15];
  if (!v15)
  {
    double v45 = v17;
    long long v18 = [[SBSceneLayoutWorkspaceTransaction alloc] initWithTransitionRequest:v7 delegate:self];
    int v19 = self->_layoutTransaction;
    self->_layoutTransaction = v18;

    [(SBSceneLayoutWorkspaceTransaction *)self->_layoutTransaction addObserver:self];
    [(SBSceneLayoutWorkspaceTransaction *)self->_layoutTransaction setOptions:6];
    uint64_t v20 = +[SBMainWorkspaceTransitionRequest ancillaryTransitionRequestsForTransitionRequest:v7];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v59 != v23) {
            objc_enumerationMutation(v20);
          }
          double v25 = [[SBSceneLayoutWorkspaceTransaction alloc] initWithTransitionRequest:*(void *)(*((void *)&v58 + 1) + 8 * j) delegate:self];
          [(SBSceneLayoutWorkspaceTransaction *)v25 addObserver:self];
          [(SBSceneLayoutWorkspaceTransaction *)v25 setOptions:6];
          [(NSMutableSet *)self->_ancillaryLayoutTransactions addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v22);
    }
    [(SBFluidSwitcherGestureWorkspaceTransaction *)self addChildTransaction:self->_layoutTransaction];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v55 = 0u;
    long long v54 = 0u;
    CGFloat v26 = self->_ancillaryLayoutTransactions;
    uint64_t v27 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v55;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v55 != v29) {
            objc_enumerationMutation(v26);
          }
          [(SBFluidSwitcherGestureWorkspaceTransaction *)self addChildTransaction:*(void *)(*((void *)&v54 + 1) + 8 * k)];
        }
        uint64_t v28 = [(NSMutableSet *)v26 countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v28);
    }

    double v43 = (void *)[(NSMapTable *)self->_activeLayoutStatesBySwitcherController copy];
    double v31 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    double v44 = v20;
    uint64_t v32 = [v31 setByAddingObjectsFromSet:v20];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v33 = v32;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v50 objects:v66 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v51;
      do
      {
        for (uint64_t m = 0; m != v35; ++m)
        {
          if (*(void *)v51 != v36) {
            objc_enumerationMutation(v33);
          }
          id v38 = *(void **)(*((void *)&v50 + 1) + 8 * m);
          double v39 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _switcherControllerForWorkspaceTransitionRequest:v38];
          id v40 = [v38 applicationContext];
          int v41 = [v40 layoutState];

          [(NSMapTable *)self->_activeLayoutStatesBySwitcherController setObject:v41 forKey:v39];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v50 objects:v66 count:16];
      }
      while (v35);
    }

    long long v17 = v45;
    if ((unint64_t)[v33 count] >= 2)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __106__SBFluidSwitcherGestureWorkspaceTransaction__runSceneLayoutTransactionForTransitionRequest_updateScenes___block_invoke;
      v46[3] = &unk_1E6AFBD50;
      id v47 = v45;
      id v48 = v43;
      uint64_t v49 = self;
      [v47 enumerateSwitcherControllersWithBlock:v46];
    }
    char v42 = v44;
    goto LABEL_39;
  }
  objc_storeStrong((id *)&self->super.super.super._transitionRequest, a3);
  if (!self->_hasActiveLayoutStateTransitionCoordinatorTransition)
  {
    self->_hasActiveLayoutStateTransitionCoordinatorTransition = 1;
    char v42 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
    [v42 beginTransitionForWorkspaceTransaction:self];
LABEL_39:
  }
}

void __106__SBFluidSwitcherGestureWorkspaceTransaction__runSceneLayoutTransactionForTransitionRequest_updateScenes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__SBFluidSwitcherGestureWorkspaceTransaction__runSceneLayoutTransactionForTransitionRequest_updateScenes___block_invoke_2;
  v8[3] = &unk_1E6AFBD28;
  id v9 = v3;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v3;
  [v4 enumerateSwitcherControllersWithBlock:v8];
}

void __106__SBFluidSwitcherGestureWorkspaceTransaction__runSceneLayoutTransactionForTransitionRequest_updateScenes___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(id *)(a1 + 32) != v3)
  {
    BOOL v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:");
    id v5 = [*(id *)(*(void *)(a1 + 48) + 352) objectForKey:v3];
    uint64_t v21 = v4;
    uint64_t v6 = [v4 appLayout];
    uint64_t v20 = v5;
    id v7 = [v5 appLayout];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = [v6 allItems];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if ([v7 containsItem:v14]) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      uint64_t v15 = *(void *)(a1 + 32);
      long long v16 = [v3 layoutState];
      long long v17 = objc_msgSend(v6, "appLayoutByModifyingPreferredDisplayOrdinal:", objc_msgSend(v16, "displayOrdinal"));
      long long v18 = +[SBApplicationController sharedInstance];
      int v19 = +[SBSwitcherCoordinatedLayoutStateTransitionContext coordinatedLayoutStateTransitionContextForMovingDisplayItems:v8 fromSwitcherController:v15 fromAppLayout:v6 toAppLayout:v17 toSwitcherController:v3 withApplicationController:v18];

      [*(id *)(a1 + 56) prepareForCoordinatedLayoutStateTransitionWithContext:v19];
      [*(id *)(a1 + 56) cleanUpAfterCoordinatedLayoutStateTransitionWithContext:v19];
    }
  }
}

- (void)_failRunningLayoutStateTransition
{
  id v6 = [(SBWorkspaceTransaction *)self layoutStateTransitionCoordinator];
  if (self->_hasActiveLayoutStateTransitionCoordinatorTransition && [v6 isTransitioning])
  {
    self->_hasActiveLayoutStateTransitionCoordinatorTransition = 0;
    [v6 willEndTransition];
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.springboard.fluidSwitcherGestureTransaction" code:0 userInfo:0];
    [v6 endTransitionWithError:v3];
  }
  BOOL v4 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherController];
  id v5 = [v4 switcherCoordinator];
  [v5 setLiveContentOverlayUpdatesSuspended:0];
}

- (void)_addChildWorkspaceTransaction:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2, self, @"SBFluidSwitcherGestureWorkspaceTransaction.m", 1231, @"transaction of unexpected type, %@", v5 object file lineNumber description];
      }
    }
  }
  id v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self finalRootTransaction];
  if (v6)
  {
    id v7 = [v5 transitionRequest];
    [v6 interruptForTransitionRequest:v7];
  }
  id v8 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBFluidSwitcherGestureWorkspaceTransaction _addChildWorkspaceTransaction:]((uint64_t)v5, v8);
  }

  [(SBFluidSwitcherGestureWorkspaceTransaction *)self setFinalRootTransaction:v5];
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self addChildTransaction:v5];
}

- (id)_workspaceTransitionRequestForSwitcherTransitionRequest:(id)a3 fromGestureManager:(id)a4 withEventLabel:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 appLayout];
  uint64_t v12 = [v10 switcherController];

  uint64_t v34 = [v12 windowScene];
  uint64_t v13 = [v34 _fbsDisplayIdentity];
  uint64_t v14 = [v13 currentConfiguration];

  uint64_t v15 = [(SBWorkspaceTransaction *)self transitionRequest];
  long long v16 = [v15 workspace];

  id v33 = (void *)v14;
  long long v17 = [v16 createRequestWithOptions:0 displayConfiguration:v14];
  [v12 configureRequest:v17 forSwitcherTransitionRequest:v8 withEventLabel:v9];

  long long v18 = [(SBWorkspaceTransaction *)self transitionRequest];
  objc_msgSend(v17, "setSource:", objc_msgSend(v18, "source"));

  uint64_t v36 = [(NSMapTable *)self->_originalLayoutStatesBySwitcherController objectForKey:v12];
  uint64_t v19 = [v8 unlockedEnvironmentMode];
  uint64_t v35 = v11;
  if (v19 == 1)
  {
    int v20 = 1;
  }
  else
  {
    uint64_t v21 = +[SBAppLayout homeScreenAppLayout];
    int v20 = [v11 isEqual:v21];
  }
  long long v22 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedAppLayout];
  long long v23 = [(SBWorkspaceTransaction *)self transitionRequest];
  long long v24 = [v23 transientOverlayContext];

  if (v19 == 2 || v20)
  {
    if (v24)
    {
      long long v25 = [v24 transientOverlay];

      if (v25)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __136__SBFluidSwitcherGestureWorkspaceTransaction__workspaceTransitionRequestForSwitcherTransitionRequest_fromGestureManager_withEventLabel___block_invoke;
        v39[3] = &unk_1E6AF8040;
        id v40 = v24;
        [v17 modifyTransientOverlayContext:v39];
        id v26 = v40;
LABEL_14:

        goto LABEL_15;
      }
    }
    if ([v22 type] == 2 && ((v20 & 1) != 0 || objc_msgSend(v36, "unlockedEnvironmentMode") != 2))
    {
      uint64_t v27 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _createWorkspaceTransientOverlayForAppLayout:v22];
      id v26 = v27;
      if (v27)
      {
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __136__SBFluidSwitcherGestureWorkspaceTransaction__workspaceTransitionRequestForSwitcherTransitionRequest_fromGestureManager_withEventLabel___block_invoke_2;
        v37[3] = &unk_1E6AF8040;
        id v26 = v27;
        id v38 = v26;
        [v17 modifyTransientOverlayContext:v37];
      }
      goto LABEL_14;
    }
  }
LABEL_15:
  uint64_t v28 = [v17 applicationContext];
  objc_msgSend(v28, "setInLiveResize:", -[SBFluidSwitcherGestureWorkspaceTransaction isLiveResize](self, "isLiveResize"));
  objc_msgSend(v28, "setPreventSwitcherRecencyModelUpdates:", objc_msgSend(v8, "preventSwitcherRecencyModelUpdates"));
  uint64_t v29 = [v17 applicationContext];
  uint64_t v30 = [v29 applicationSceneEntities];
  objc_msgSend(v30, "bs_each:", &__block_literal_global_122);

  double v31 = [v17 applicationContext];
  [v31 setDelegate:self];

  return v17;
}

void __136__SBFluidSwitcherGestureWorkspaceTransaction__workspaceTransitionRequestForSwitcherTransitionRequest_fromGestureManager_withEventLabel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = a2;
  id v3 = [v2 transientOverlay];
  BOOL v4 = (void *)[v3 copy];
  [v5 setTransientOverlay:v4];

  [v5 setTransitionType:1];
}

void __136__SBFluidSwitcherGestureWorkspaceTransaction__workspaceTransitionRequestForSwitcherTransitionRequest_fromGestureManager_withEventLabel___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setTransientOverlay:v2];
  [v3 setTransitionType:1];
}

uint64_t __136__SBFluidSwitcherGestureWorkspaceTransaction__workspaceTransitionRequestForSwitcherTransitionRequest_fromGestureManager_withEventLabel___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setFlag:1 forActivationSetting:9];
}

- (id)_copiedTransitionRequestFromTransitionRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copyMainWorkspaceTransitionRequest];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke;
  v8[3] = &unk_1E6AF5638;
  id v9 = v4;
  id v10 = self;
  id v6 = v4;
  [v5 modifyApplicationContext:v8];

  return v5;
}

void __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke_2;
  v18[3] = &unk_1E6AF8788;
  id v4 = v3;
  id v19 = v4;
  SBLayoutRoleEnumerateValidRoles(v18);
  if ([v4 waitsForSceneUpdates])
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke_3;
    v11[3] = &unk_1E6AFBD78;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = &v14;
    SBLayoutRoleEnumerateValidRoles(v11);
    BOOL v5 = *((unsigned char *)v15 + 24) == 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v5 = 0;
  }
  [v4 setWaitsForSceneUpdates:v5];
  [v4 setDelegate:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 32) applicationContext];
  objc_msgSend(v4, "setRequestedFloatingConfiguration:", objc_msgSend(v6, "requestedFloatingConfiguration"));

  id v7 = [*(id *)(a1 + 32) applicationContext];
  objc_msgSend(v4, "setRequestedSpaceConfiguration:", objc_msgSend(v7, "requestedSpaceConfiguration"));

  id v8 = [*(id *)(a1 + 32) applicationContext];
  id v9 = [v8 requestedEntityIdentifierToLayoutAttributes];
  [v4 setRequestedEntityIdentifierToLayoutAttributes:v9];

  id v10 = [*(id *)(a1 + 32) applicationContext];
  objc_msgSend(v4, "setFencesAnimations:", objc_msgSend(v10, "fencesAnimations"));
}

void __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) entityForLayoutRole:a2];
  [v2 setFlag:1 forActivationSetting:9];
}

void __92__SBFluidSwitcherGestureWorkspaceTransaction__copiedTransitionRequestFromTransitionRequest___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) applicationContext];
  BOOL v5 = [v4 entityForLayoutRole:a2];
  id v10 = [v5 applicationSceneEntity];

  id v6 = v10;
  if (v10)
  {
    id v7 = [v10 application];
    id v8 = [v7 processState];
    char v9 = [v8 isRunning];

    id v6 = v10;
    if ((v9 & 1) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

- (id)_createWorkspaceTransientOverlayForAppLayout:(id)a3
{
  p_switcherViewController = &self->_switcherViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_switcherViewController);
  id v6 = [WeakRetained _createWorkspaceTransientOverlayForAppLayout:v4];

  return v6;
}

- (id)_transitionRequestForApplicationTransitionContext:(id)a3 eventLabel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBWorkspaceTransaction *)self windowScene];
  char v9 = [v8 _fbsDisplayIdentity];
  id v10 = [v9 currentConfiguration];

  uint64_t v11 = [(SBWorkspaceTransaction *)self transitionRequest];
  id v12 = [v11 workspace];

  uint64_t v13 = [v12 createRequestWithOptions:0 displayConfiguration:v10];
  uint64_t v14 = [(SBWorkspaceTransaction *)self transitionRequest];
  objc_msgSend(v13, "setSource:", objc_msgSend(v14, "source"));

  [v13 setApplicationContext:v7];
  if (v6) {
    [v13 setEventLabel:v6];
  }

  return v13;
}

- (void)_addWaitForSceneLayoutTransitionTransaction:(id)a3 forLeafAnimationControllers:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __118__SBFluidSwitcherGestureWorkspaceTransaction__addWaitForSceneLayoutTransitionTransaction_forLeafAnimationControllers___block_invoke;
  v8[3] = &unk_1E6AFBDA0;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a4 _enumerateCoordinatingAnimationsWithBlock:v8];
}

uint64_t __118__SBFluidSwitcherGestureWorkspaceTransaction__addWaitForSceneLayoutTransitionTransaction_forLeafAnimationControllers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addWaitForSceneLayoutTransitionTransaction:*(void *)(a1 + 40) forLeafAnimationControllers:a2];
}

- (void)_updateDigitizerSurfaceDimensions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBSystemGestureWorkspaceTransaction *)self gestureRecognizer];
  id v4 = [v3 _activeEventOfType:0];

  if ([v4 _hidEvent])
  {
    if (IOHIDEventGetType() != 11)
    {
      IOHIDEventGetChildren();
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (!v6)
      {
LABEL_11:

LABEL_14:
        goto LABEL_15;
      }
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        if (IOHIDEventGetType() == 17) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v7) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }

      if (!v10) {
        goto LABEL_15;
      }
    }
    BKSHIDEventGetDigitizerAttributes();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 digitizerSurfaceHeight];
    self->_double digitizerSurfaceHeightForLastGestureEvent = v11;
    goto LABEL_14;
  }
LABEL_15:
}

- (id)_windowSceneForWorkspaceTransitionRequest:(id)a3
{
  id v3 = (void *)SBApp;
  id v4 = a3;
  id v5 = [v3 windowSceneManager];
  uint64_t v6 = [v4 displayIdentity];

  uint64_t v7 = [v5 windowSceneForDisplayIdentity:v6];

  return v7;
}

- (id)_switcherControllerForWorkspaceTransitionRequest:(id)a3
{
  id v3 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _windowSceneForWorkspaceTransitionRequest:a3];
  id v4 = [v3 switcherController];

  return v4;
}

- (void)_updatePPTsForGestureTransactionBegan
{
  if (__PPTIsRunningSwitcherGestureTest())
  {
    id v3 = +[SBApplicationTestingManager sharedInstance];
    id v4 = [v3 currentTestName];

    id v5 = (void **)MEMORY[0x1E4F43630];
    [(id)*MEMORY[0x1E4F43630] startedSubTest:@"delay" forTest:v4];
    uint64_t v6 = *v5;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__SBFluidSwitcherGestureWorkspaceTransaction__updatePPTsForGestureTransactionBegan__block_invoke;
    v8[3] = &unk_1E6AF5290;
    id v9 = v4;
    uint64_t v10 = self;
    id v7 = v4;
    [v6 installCACommitCompletionBlock:v8];
  }
}

void __83__SBFluidSwitcherGestureWorkspaceTransaction__updatePPTsForGestureTransactionBegan__block_invoke(uint64_t a1)
{
  id v2 = (id *)MEMORY[0x1E4F43630];
  [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"delay" forTest:*(void *)(a1 + 32)];
  [*v2 startedSubTest:@"overall" forTest:*(void *)(a1 + 32)];
  [*v2 startedSubTest:@"gesture" forTest:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(a1 + 40) + 234) = 1;
  id v5 = [*(id *)(a1 + 40) switcherViewController];
  id v3 = [v5 layoutContext];
  id v4 = [v3 activeGesture];

  if (!v4 || [v4 state] == 3) {
    [*(id *)(a1 + 40) _updatePPTsForGestureEnded];
  }
}

- (void)_updatePPTsForGestureEnded
{
  if (__PPTIsRunningSwitcherGestureTest() && self->_hasCompletedFirstCACommitSinceTransactionBeganForPPT)
  {
    id v3 = +[SBApplicationTestingManager sharedInstance];
    id v5 = [v3 currentTestName];

    id v4 = (id *)MEMORY[0x1E4F43630];
    [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"gesture" forTest:v5];
    [*v4 startedSubTest:@"animation" forTest:v5];
  }
}

- (void)_updatePPTsForAnimationEndedWithFinalLayoutState:(id)a3
{
  id v14 = a3;
  int v3 = __PPTIsRunningSwitcherGestureTest();
  id v4 = v14;
  if (v3)
  {
    id v5 = +[SBApplicationTestingManager sharedInstance];
    uint64_t v6 = [v5 currentTestName];

    if (!__PPTIsRunningSwitcherGestureToAutoPIPTest())
    {
      id v7 = (id *)MEMORY[0x1E4F43630];
      [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"animation" forTest:v6];
      [*v7 finishedSubTest:@"overall" forTest:v6];
    }
    unint64_t v8 = __PPTExpectedFinalUnlockedEnvironmentModeForCurrentTest();
    if (v8 == [v14 unlockedEnvironmentMode])
    {
      if (!__PPTIsRunningSwitcherGestureToAutoPIPTest()) {
        [(id)*MEMORY[0x1E4F43630] finishedTest:v6];
      }
    }
    else
    {
      id v9 = (void *)*MEMORY[0x1E4F43630];
      uint64_t v10 = NSString;
      double v11 = SBStringForUnlockedEnvironmentMode(v8);
      long long v12 = SBStringForUnlockedEnvironmentMode([v14 unlockedEnvironmentMode]);
      long long v13 = [v10 stringWithFormat:@"%@ - expected end state is %@, but ended up in %@ instead", v6, v11, v12];
      [v9 failedTest:v6 withFailure:v13];
    }
    id v4 = v14;
  }
}

- (SBSwitcherController)switcherController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  return (SBSwitcherController *)WeakRetained;
}

- (SBFluidSwitcherViewController)switcherViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherViewController);
  return (SBFluidSwitcherViewController *)WeakRetained;
}

- (void)setSwitcherViewController:(id)a3
{
}

- (SBUISwitcherAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (BOOL)shouldCancelGestureUponInterruption
{
  return self->_shouldCancelGestureUponInterruption;
}

- (void)setShouldCancelGestureUponInterruption:(BOOL)a3
{
  self->_shouldCancelGestureUponInterruption = a3;
}

- (SBSceneLayoutWorkspaceTransaction)layoutTransaction
{
  return self->_layoutTransaction;
}

- (void)setLayoutTransaction:(id)a3
{
}

- (SBFluidSwitcherGestureWorkspaceTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherGestureWorkspaceTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIApplicationSceneDeactivationAssertion)backgroundingScenesDeactivationAssertion
{
  return self->_backgroundingScenesDeactivationAssertion;
}

- (void)setBackgroundingScenesDeactivationAssertion:(id)a3
{
}

- (NSMapTable)originalLayoutStatesBySwitcherController
{
  return self->_originalLayoutStatesBySwitcherController;
}

- (void)setOriginalLayoutStatesBySwitcherController:(id)a3
{
}

- (NSMapTable)activeLayoutStatesBySwitcherController
{
  return self->_activeLayoutStatesBySwitcherController;
}

- (void)setActiveLayoutStatesBySwitcherController:(id)a3
{
}

- (SBMainWorkspaceTransaction)finalRootTransaction
{
  return self->_finalRootTransaction;
}

- (void)setFinalRootTransaction:(id)a3
{
}

- (NSMutableSet)ancillaryLayoutTransactions
{
  return self->_ancillaryLayoutTransactions;
}

- (void)setAncillaryLayoutTransactions:(id)a3
{
}

- (NSMutableSet)layoutTransitionCompletions
{
  return self->_layoutTransitionCompletions;
}

- (void)setLayoutTransitionCompletions:(id)a3
{
}

- (SBAutoPIPWorkspaceTransaction)autoPIPWorkspaceTransaction
{
  return self->_autoPIPWorkspaceTransaction;
}

- (void)setAutoPIPWorkspaceTransaction:(id)a3
{
}

- (NSTimer)activateScenesTimer
{
  return self->_activateScenesTimer;
}

- (void)setActivateScenesTimer:(id)a3
{
}

- (SBTransientOverlayViewController)switcherTransitioningTransientOverlayViewController
{
  return self->_switcherTransitioningTransientOverlayViewController;
}

- (void)setSwitcherTransitioningTransientOverlayViewController:(id)a3
{
}

- (BOOL)hasCompletedAtLeastOneGesture
{
  return self->_hasCompletedAtLeastOneGesture;
}

- (NSUUID)gestureID
{
  return self->_gestureID;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_gestureID, 0);
  objc_storeStrong((id *)&self->_switcherTransitioningTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_activateScenesTimer, 0);
  objc_storeStrong((id *)&self->_autoPIPWorkspaceTransaction, 0);
  objc_storeStrong((id *)&self->_layoutTransitionCompletions, 0);
  objc_storeStrong((id *)&self->_ancillaryLayoutTransactions, 0);
  objc_storeStrong((id *)&self->_finalRootTransaction, 0);
  objc_storeStrong((id *)&self->_activeLayoutStatesBySwitcherController, 0);
  objc_storeStrong((id *)&self->_originalLayoutStatesBySwitcherController, 0);
  objc_storeStrong((id *)&self->_backgroundingScenesDeactivationAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutTransaction, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_destroyWeak((id *)&self->_switcherViewController);
  objc_destroyWeak((id *)&self->_switcherController);
  objc_storeStrong((id *)&self->_pendingSceneUpdateTransactionsBySceneIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifiersWithSceneUpdateTransactionsInProgress, 0);
}

- (int64_t)_gestureType
{
  return 0;
}

- (void)systemGestureStateChanged:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  id v5 = a1;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v6 = [a1 hasStarted];
  int v7 = [v5 isComplete];
  LODWORD(v5) = [v5 isFinishedWorking];
  unint64_t v8 = SBSystemGestureRecognizerStateDescription([a2 state]);
  v9[0] = 67109890;
  v9[1] = v6;
  __int16 v10 = 1024;
  int v11 = v7;
  __int16 v12 = 1024;
  int v13 = (int)v5;
  __int16 v14 = 2114;
  long long v15 = v8;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "SBFluidSwitcherGestureRecognizer state changed while we aren't running. The transaction is started:%{BOOL}u completed:%{BOOL}u finishedWorking:%{BOOL}u and the gesture state is %{public}@", (uint8_t *)v9, 0x1Eu);
}

- (void)_addChildWorkspaceTransaction:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Adding child transaction: %@", (uint8_t *)&v2, 0xCu);
}

@end