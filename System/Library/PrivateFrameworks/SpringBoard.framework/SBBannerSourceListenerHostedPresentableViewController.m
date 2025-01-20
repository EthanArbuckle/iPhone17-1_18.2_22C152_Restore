@interface SBBannerSourceListenerHostedPresentableViewController
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)shouldDisableTouchCancellationForTouch:(id)a3 event:(id)a4;
- (BOOL)shouldDismissForReason:(id)a3 outReason:(id *)a4;
- (SBPresentableSystemDragCancellationHandler)systemDragCancellationHandler;
- (SBUIPresentableHomeGestureContext)homeGestureContext;
- (UIEdgeInsets)bannerContentOutsets;
- (id)transitioningDelegate;
- (void)_invalidateAllButtonEventActions;
- (void)_updateAppStatusBarSettingsAssertion;
- (void)dealloc;
- (void)homeGestureOwnershipDidChange:(BOOL)a3;
- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)setHomeGestureContext:(id)a3;
- (void)setSystemDragCancellationHandler:(id)a3;
@end

@implementation SBBannerSourceListenerHostedPresentableViewController

- (id)transitioningDelegate
{
  v7.receiver = self;
  v7.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  v3 = [(SBBannerSourceListenerHostedPresentableViewController *)&v7 transitioningDelegate];
  if (!v3)
  {
    v4 = objc_alloc_init(SBBannerCustomTransitioningDelegate);
    customTransitioningDelegate = self->_customTransitioningDelegate;
    self->_customTransitioningDelegate = v4;

    [(SBBannerSourceListenerHostedPresentableViewController *)self setTransitioningDelegate:self->_customTransitioningDelegate];
    v3 = self->_customTransitioningDelegate;
  }
  return v3;
}

- (void)dealloc
{
  [(SBBannerGestureRecognizerPriorityAssertion *)self->_gestureRecognizerPriorityAssertion invalidate];
  gestureRecognizerPriorityAssertion = self->_gestureRecognizerPriorityAssertion;
  self->_gestureRecognizerPriorityAssertion = 0;

  [(SBBannerSourceListenerHostedPresentableViewController *)self _invalidateAllButtonEventActions];
  v4.receiver = self;
  v4.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v4 dealloc];
}

- (BOOL)isDraggingDismissalEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  if ([WeakRetained ownsHomeGesture])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
    BOOL v4 = [(BNBannerSourceListenerHostedPresentableViewController *)&v6 isDraggingDismissalEnabled];
  }

  return v4;
}

- (BOOL)isDraggingInteractionEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  if ([WeakRetained ownsHomeGesture])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
    BOOL v4 = [(BNBannerSourceListenerHostedPresentableViewController *)&v6 isDraggingInteractionEnabled];
  }

  return v4;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v14 presentableWillAppearAsBanner:v4];
  if ([(SBBannerSourceListenerHostedPresentableViewController *)self isViewLoaded])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
    if (objc_opt_respondsToSelector())
    {
      objc_super v6 = [WeakRetained platterBarSwipeAffordanceViewForParticipant:self];
      barSwipeAffordanceView = self->_barSwipeAffordanceView;
      self->_barSwipeAffordanceView = v6;

      [(SBBarSwipeAffordanceView *)self->_barSwipeAffordanceView addObserver:self];
      v8 = [(SBBannerSourceListenerHostedPresentableViewController *)self view];
      [v8 addSubview:self->_barSwipeAffordanceView];
      v9 = self->_barSwipeAffordanceView;
      [v8 bounds];
      -[SBBarSwipeAffordanceView setFrame:](v9, "setFrame:");
      [(SBBarSwipeAffordanceView *)self->_barSwipeAffordanceView setAutoresizingMask:18];
      v10 = self->_barSwipeAffordanceView;
      v11 = [(BNBannerSourceListenerPresentableViewController *)self contentView];
      [(SBBarSwipeAffordanceView *)v10 addSubview:v11];

      v12 = self;
      objc_sync_enter(v12);
      v13 = [(NSMutableArray *)v12->_wantsHomeAffordanceActionsAwaitingResponse lastObject];
      objc_msgSend(WeakRetained, "setWantsHomeGesture:", objc_msgSend(v13, "wantsHomeGesture"));

      objc_sync_exit(v12);
    }
    [(SBBannerSourceListenerHostedPresentableViewController *)self _updateAppStatusBarSettingsAssertion];
  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v4 presentableDidAppearAsBanner:a3];
  [(SBBannerSourceListenerHostedPresentableViewController *)self _updateAppStatusBarSettingsAssertion];
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v9 presentableWillDisappearAsBanner:a3 withReason:a4];
  if ([(SBBannerSourceListenerHostedPresentableViewController *)self isViewLoaded])
  {
    v5 = [(SBBannerSourceListenerHostedPresentableViewController *)self view];
    objc_super v6 = [(BNBannerSourceListenerPresentableViewController *)self contentView];
    [v5 addSubview:v6];

    [(SBBarSwipeAffordanceView *)self->_barSwipeAffordanceView removeFromSuperview];
    barSwipeAffordanceView = self->_barSwipeAffordanceView;
    self->_barSwipeAffordanceView = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
    [WeakRetained setWantsHomeGesture:0];

    [(SBBannerSourceListenerHostedPresentableViewController *)self _invalidateAllButtonEventActions];
  }
  [(SBBannerSourceListenerHostedPresentableViewController *)self _updateAppStatusBarSettingsAssertion];
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v5 presentableDidDisappearAsBanner:a3 withReason:a4];
  [(SBBannerSourceListenerHostedPresentableViewController *)self _updateAppStatusBarSettingsAssertion];
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  v40 = v6;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v47 scene:v6 didReceiveActions:v7];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v8)
  {
    uint64_t v42 = *(void *)v44;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v43 + 1) + 8 * v9);
        uint64_t v11 = objc_opt_class();
        id v12 = v10;
        if (v11)
        {
          if (objc_opt_isKindOfClass()) {
            v13 = v12;
          }
          else {
            v13 = 0;
          }
        }
        else
        {
          v13 = 0;
        }
        id v14 = v13;

        if (v14)
        {
          uint64_t v15 = [v14 wantsHomeGesture];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
          if (v15 == [WeakRetained ownsHomeGesture])
          {
            [v14 setSuccessful:1];
          }
          else
          {
            v17 = self;
            objc_sync_enter(v17);
            wantsHomeAffordanceActionsAwaitingResponse = v17->_wantsHomeAffordanceActionsAwaitingResponse;
            if (!wantsHomeAffordanceActionsAwaitingResponse)
            {
              v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v20 = v17->_wantsHomeAffordanceActionsAwaitingResponse;
              v17->_wantsHomeAffordanceActionsAwaitingResponse = v19;

              wantsHomeAffordanceActionsAwaitingResponse = v17->_wantsHomeAffordanceActionsAwaitingResponse;
            }
            [(NSMutableArray *)wantsHomeAffordanceActionsAwaitingResponse addObject:v14];
            objc_sync_exit(v17);

            [WeakRetained setWantsHomeGesture:v15];
          }
        }
        uint64_t v21 = objc_opt_class();
        id v22 = v12;
        if (v21)
        {
          if (objc_opt_isKindOfClass()) {
            v23 = v22;
          }
          else {
            v23 = 0;
          }
        }
        else
        {
          v23 = 0;
        }
        id v24 = v23;

        if (v24)
        {
          buttonEventsToActions = self->_buttonEventsToActions;
          v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "presentableButtonEvent"));
          v27 = [(NSMutableDictionary *)buttonEventsToActions objectForKey:v26];

          [v27 invalidate];
          v28 = self->_buttonEventsToActions;
          if (!v28)
          {
            v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            v30 = self->_buttonEventsToActions;
            self->_buttonEventsToActions = v29;

            v28 = self->_buttonEventsToActions;
          }
          v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "presentableButtonEvent"));
          [(NSMutableDictionary *)v28 setObject:v24 forKey:v31];
        }
        uint64_t v32 = objc_opt_class();
        id v33 = v22;
        if (v32)
        {
          if (objc_opt_isKindOfClass()) {
            id v34 = v33;
          }
          else {
            id v34 = 0;
          }
        }
        else
        {
          id v34 = 0;
        }

        if (v34) {
          self->_supportsCancellingSystemDragGesture = 1;
        }
        uint64_t v35 = objc_opt_class();
        id v36 = v33;
        if (v35)
        {
          if (objc_opt_isKindOfClass()) {
            v37 = v36;
          }
          else {
            v37 = 0;
          }
        }
        else
        {
          v37 = 0;
        }
        id v38 = v37;

        if (v38)
        {
          v39 = [(SBBannerSourceListenerHostedPresentableViewController *)self systemDragCancellationHandler];
          [v39 cancelSystemDragForPresentable:self];
        }
        ++v9;
      }
      while (v8 != v9);
      uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v8);
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SBBannerSourceListenerHostedPresentableViewController;
  [(BNBannerSourceListenerHostedPresentableViewController *)&v26 scene:v10 didUpdateClientSettingsWithDiff:a4 oldClientSettings:a5 transitionContext:a6];
  uint64_t v11 = [v10 clientSettings];
  uint64_t v12 = objc_opt_class();
  id v13 = v11;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  id v15 = v14;

  if (!v15) {
    goto LABEL_14;
  }
  v16 = [v15 wantsDefaultGesturePriorityReason];
  gestureRecognizerPriorityAssertion = self->_gestureRecognizerPriorityAssertion;
  if (v16)
  {
    if (!gestureRecognizerPriorityAssertion)
    {
      v18 = [(id)SBApp bannerManager];
      v19 = [v18 acquireGestureRecognizerPriorityAssertionForPresentable:self priority:1 reason:v16];
      v20 = self->_gestureRecognizerPriorityAssertion;
      self->_gestureRecognizerPriorityAssertion = v19;

LABEL_12:
    }
  }
  else if (gestureRecognizerPriorityAssertion)
  {
    [(SBBannerGestureRecognizerPriorityAssertion *)gestureRecognizerPriorityAssertion invalidate];
    v18 = self->_gestureRecognizerPriorityAssertion;
    self->_gestureRecognizerPriorityAssertion = 0;
    goto LABEL_12;
  }

LABEL_14:
  uint64_t v21 = [v10 clientSettings];
  uint64_t v22 = objc_opt_class();
  id v23 = v21;
  if (v22)
  {
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }
  id v25 = v24;

  if (v25) {
    [(SBBannerSourceListenerHostedPresentableViewController *)self _updateAppStatusBarSettingsAssertion];
  }
}

- (BOOL)shouldDismissForReason:(id)a3 outReason:(id *)a4
{
  id v6 = a3;
  id v7 = [(BNBannerSourceListenerHostedPresentableViewController *)self scene];
  uint64_t v8 = [v7 clientSettings];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  id v13 = [v12 transitionDismissalPreventionReason];

  if (v13
    && (([v6 isEqualToString:@"dismissOverlays"] & 1) != 0
     || [v6 isEqualToString:@"mainScreenAnimationController"]))
  {
    if (a4)
    {
      id v14 = [(BNBannerSourceListenerHostedPresentableViewController *)self scene];
      id v15 = [v14 clientProcess];
      v16 = [v15 bundleIdentifier];
      *a4 = [v16 stringByAppendingFormat:@".%@", v13];

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (void)homeGestureOwnershipDidChange:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  int v5 = [WeakRetained ownsHomeGesture];

  id v6 = self;
  objc_sync_enter(v6);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6->_wantsHomeAffordanceActionsAwaitingResponse;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "setSuccessful:", v5 ^ objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "wantsHomeGesture", (void)v11) ^ 1);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)v6->_wantsHomeAffordanceActionsAwaitingResponse removeAllObjects];
  objc_sync_exit(v6);
}

- (BOOL)shouldDisableTouchCancellationForTouch:(id)a3 event:(id)a4
{
  if (!self->_supportsCancellingSystemDragGesture) {
    return 0;
  }
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 view];
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  long long v13 = [v7 view];
  long long v14 = [v13 window];
  id v15 = [v14 windowScene];
  uint64_t v16 = [v15 coordinateSpace];
  v17 = [v7 view];
  objc_msgSend(v16, "convertPoint:fromCoordinateSpace:", v17, v10, v12);
  double v19 = v18;
  double v21 = v20;

  uint64_t v22 = [(SBBannerSourceListenerHostedPresentableViewController *)self view];
  id v23 = [v22 window];
  id v24 = [v23 windowScene];
  id v25 = [v24 coordinateSpace];
  objc_super v26 = [v7 view];

  v27 = [v26 window];
  v28 = [v27 windowScene];
  v29 = [v28 coordinateSpace];
  objc_msgSend(v25, "convertPoint:fromCoordinateSpace:", v29, v19, v21);
  double v31 = v30;
  double v33 = v32;

  id v34 = [(SBBannerSourceListenerHostedPresentableViewController *)self view];
  uint64_t v35 = [v34 window];
  id v36 = [v35 windowScene];
  v37 = [v36 coordinateSpace];
  id v38 = [(SBBannerSourceListenerHostedPresentableViewController *)self view];
  objc_msgSend(v37, "convertPoint:toCoordinateSpace:", v38, v31, v33);
  double v40 = v39;
  double v42 = v41;

  long long v43 = [(SBBannerSourceListenerHostedPresentableViewController *)self view];
  LOBYTE(v34) = objc_msgSend(v43, "pointInside:withEvent:", v6, v40, v42);

  return (char)v34;
}

- (void)homeGesturePerformedForBarSwipeAffordanceView:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4FA7CF8]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__SBBannerSourceListenerHostedPresentableViewController_homeGesturePerformedForBarSwipeAffordanceView___block_invoke;
  v8[3] = &unk_1E6AF5350;
  v8[4] = self;
  int v5 = (void *)[v4 initWithHandler:v8];
  id v6 = [(BNBannerSourceListenerHostedPresentableViewController *)self scene];
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v5, 0);
  [v6 sendActions:v7];
}

void __103__SBBannerSourceListenerHostedPresentableViewController_homeGesturePerformedForBarSwipeAffordanceView___block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __103__SBBannerSourceListenerHostedPresentableViewController_homeGesturePerformedForBarSwipeAffordanceView___block_invoke_2;
  v2[3] = &unk_1E6AF5D38;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __103__SBBannerSourceListenerHostedPresentableViewController_homeGesturePerformedForBarSwipeAffordanceView___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1224));
    [WeakRetained setWantsHomeGesture:0];
  }
}

- (BOOL)handleHomeButtonPress
{
  char v3 = [(NSMutableDictionary *)self->_buttonEventsToActions objectForKey:&unk_1F334A070];
  int v4 = [v3 isValid];
  if (v4)
  {
    [v3 handleButtonEvent];
    [(NSMutableDictionary *)self->_buttonEventsToActions removeObjectForKey:&unk_1F334A070];
  }

  return v4;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPress
{
  return 0;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return 0;
}

- (UIEdgeInsets)bannerContentOutsets
{
  v2 = [(BNBannerSourceListenerHostedPresentableViewController *)self scene];
  char v3 = [v2 clientSettings];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  [v7 bannerContentOutsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)_invalidateAllButtonEventActions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  buttonEventsToActions = self->_buttonEventsToActions;
  if (buttonEventsToActions)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(NSMutableDictionary *)buttonEventsToActions allValues];
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
          double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 isValid]) {
            [v9 invalidate];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [(NSMutableDictionary *)self->_buttonEventsToActions removeAllObjects];
    double v10 = self->_buttonEventsToActions;
    self->_buttonEventsToActions = 0;
  }
}

- (void)_updateAppStatusBarSettingsAssertion
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return;
  }
  id v15 = [(BNBannerSourceListenerHostedPresentableViewController *)self preferredBackgroundActivitiesToSuppress];
  if ([v15 count]
    && [(SBBannerSourceListenerHostedPresentableViewController *)self bs_isAppearingOrAppeared])
  {
    char v3 = [(UIViewController *)self _sbWindowScene];
    uint64_t v4 = [v3 statusBarManager];
    uint64_t v5 = [v4 assertionManager];

    uint64_t v6 = objc_alloc_init(SBMutableStatusBarSettings);
    [(SBMutableStatusBarSettings *)v6 setBackgroundActivitiesToSuppress:v15];
    uint64_t v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    double v9 = (SBWindowSceneStatusBarSettingsAssertion *)[v5 newSettingsAssertionWithSettings:v6 atLevel:7 reason:v8];
    appStatusBarSettingsAssertion = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = v9;

    long long v11 = self->_appStatusBarSettingsAssertion;
    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)v11 acquireWithAnimationParameters:v12];

LABEL_8:
    goto LABEL_9;
  }
  long long v13 = self->_appStatusBarSettingsAssertion;
  if (v13)
  {
    long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F42E48]) initWithDefaultParameters];
    [(SBWindowSceneStatusBarSettingsAssertion *)v13 invalidateWithAnimationParameters:v14];

    uint64_t v5 = self->_appStatusBarSettingsAssertion;
    self->_appStatusBarSettingsAssertion = 0;
    goto LABEL_8;
  }
LABEL_9:
}

- (SBPresentableSystemDragCancellationHandler)systemDragCancellationHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemDragCancellationHandler);
  return (SBPresentableSystemDragCancellationHandler *)WeakRetained;
}

- (void)setSystemDragCancellationHandler:(id)a3
{
}

- (SBUIPresentableHomeGestureContext)homeGestureContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureContext);
  return (SBUIPresentableHomeGestureContext *)WeakRetained;
}

- (void)setHomeGestureContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeGestureContext);
  objc_destroyWeak((id *)&self->_systemDragCancellationHandler);
  objc_storeStrong((id *)&self->_customTransitioningDelegate, 0);
  objc_storeStrong((id *)&self->_barSwipeAffordanceView, 0);
  objc_storeStrong((id *)&self->_buttonEventsToActions, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerPriorityAssertion, 0);
  objc_storeStrong((id *)&self->_wantsHomeAffordanceActionsAwaitingResponse, 0);
  objc_storeStrong((id *)&self->_appStatusBarSettingsAssertion, 0);
}

@end