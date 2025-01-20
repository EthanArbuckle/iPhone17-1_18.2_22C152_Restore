@interface SBUIBannerClientContainerViewController
- (BOOL)gestureRecognizer:(id)a3 shouldBeginWithTouches:(id)a4 event:(id)a5;
- (BOOL)isAccessibilityIgnoringSmartInvertColors;
- (BOOL)ownsHomeGesture;
- (SBUIBannerClientContainerViewController)initWithScene:(id)a3 presentable:(id)a4 context:(id)a5;
- (id)_buttonEventsActionForButtonEvent:(int64_t)a3;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (id)_transitionCoordinator;
- (id)acquireAssertionForButtonEvent:(int64_t)a3 reason:(id)a4;
- (id)acquireGestureRecognizerDefaultPriorityAssertionForReason:(id)a3;
- (id)acquireTransitionDismissalPreventionAssertionForReason:(id)a3;
- (void)_handleCancelSystemBannerDragGestureRecognizer:(id)a3;
- (void)_removeButtonEventsActionForButtonEvent:(int64_t)a3;
- (void)_setButtonEventAction:(id)a3 forButtonEvent:(int64_t)a4;
- (void)setWantsHomeGesture:(BOOL)a3;
- (void)systemApertureElementContextPresentationDidBecomePossible:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBUIBannerClientContainerViewController

- (id)_transitionCoordinator
{
  v3 = [self systemApertureElementContextPrivate];
  v4 = [v3 transitionContext];
  v5 = [v4 transitionCoordinator];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBUIBannerClientContainerViewController;
    id v7 = [(SBUIBannerClientContainerViewController *)&v10 _transitionCoordinator];
  }
  v8 = v7;

  return v8;
}

- (void)viewWillLayoutSubviews
{
  v3 = [self systemApertureElementContextPrivate];
  char v4 = [v3 isPresentationPossible];

  if ((v4 & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBUIBannerClientContainerViewController;
    [(BNBannerClientContainerViewController *)&v5 viewWillLayoutSubviews];
  }
}

- (SBUIBannerClientContainerViewController)initWithScene:(id)a3 presentable:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBUIBannerClientContainerViewController;
  objc_super v10 = [(BNBannerClientContainerViewController *)&v17 initWithScene:v8 presentable:v9 context:a5];
  if (v10)
  {
    if (objc_opt_respondsToSelector()) {
      [v9 setBannerHomeGestureContext:v10];
    }
    if (objc_opt_respondsToSelector()) {
      [v9 setBannerDismissalPreventionContext:v10];
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = objc_opt_class();
      id v12 = v8;
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

      v15 = [v14 systemApertureElementContextPrivate];

      if ([v15 isPresentationPossible]) {
        [(SBUIBannerClientContainerViewController *)v10 systemApertureElementContextPresentationDidBecomePossible:v15];
      }
      else {
        [v15 addObserver:v10];
      }
    }
  }

  return v10;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)SBUIBannerClientContainerViewController;
  [(BNBannerClientContainerViewController *)&v12 viewDidLoad];
  v3 = [(BNBannerClientContainerViewController *)self presentable];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [[SBUIPresentableCancelSystemDragGestureRecognizer alloc] initWithTarget:self action:sel__handleCancelSystemBannerDragGestureRecognizer_];
    [(SBUIPresentableCancelSystemDragGestureRecognizer *)v5 setDelegate:self];
    v6 = [(SBUIBannerClientContainerViewController *)self view];
    [v6 addGestureRecognizer:v5];

    id v7 = [(BNBannerClientContainerViewController *)self scene];
    id v8 = [v7 _FBSScene];
    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    objc_super v10 = [[SBUIPresentableSupportsCancellingSystemDragAction alloc] initWithInfo:0 responder:0];
    uint64_t v11 = [v9 setWithObject:v10];
    [v8 sendActions:v11];
  }
}

- (BOOL)isAccessibilityIgnoringSmartInvertColors
{
  v2 = [(BNBannerClientContainerViewController *)self presentable];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)setWantsHomeGesture:(BOOL)a3
{
  if (self->_ownsHomeGesture != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = [SBUIPresentableWantsHomeGestureAction alloc];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__SBUIBannerClientContainerViewController_setWantsHomeGesture___block_invoke;
    v10[3] = &unk_1E5CCCDA8;
    v10[4] = self;
    BOOL v11 = v3;
    v6 = [(SBUIPresentableWantsHomeGestureAction *)v5 initWithWantsHomeGesture:v3 handler:v10];
    id v7 = [(BNBannerClientContainerViewController *)self scene];
    id v8 = [v7 _FBSScene];
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, 0);
    [v8 sendActions:v9];
  }
}

void __63__SBUIBannerClientContainerViewController_setWantsHomeGesture___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1056) = *(unsigned char *)(a1 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__SBUIBannerClientContainerViewController_setWantsHomeGesture___block_invoke_2;
    block[3] = &unk_1E5CCC580;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __63__SBUIBannerClientContainerViewController_setWantsHomeGesture___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentable];
  if (objc_opt_respondsToSelector()) {
    [v2 homeGestureOwnershipDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1056)];
  }
}

- (id)acquireTransitionDismissalPreventionAssertionForReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBUIBannerClientContainerViewController.m", 144, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  WeakRetained = (_SBUIPresentableDismissalPreventionAssertion *)objc_loadWeakRetained((id *)&self->_transitionDismissalPreventionAssertion);
  id v7 = [(BNBannerClientContainerViewController *)self scene];
  if (WeakRetained)
  {
    id v8 = SBLogBanners();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBUIBannerClientContainerViewController acquireTransitionDismissalPreventionAssertionForReason:]((uint64_t)WeakRetained, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __98__SBUIBannerClientContainerViewController_acquireTransitionDismissalPreventionAssertionForReason___block_invoke;
    v22[3] = &unk_1E5CCD1F0;
    v15 = v5;
    v23 = v15;
    [v7 _updateUIClientSettingsWithBlock:v22];
    objc_initWeak(&location, self);
    v16 = [_SBUIPresentableDismissalPreventionAssertion alloc];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __98__SBUIBannerClientContainerViewController_acquireTransitionDismissalPreventionAssertionForReason___block_invoke_2;
    v19[3] = &unk_1E5CCD718;
    objc_copyWeak(&v20, &location);
    WeakRetained = [(_SBUIPresentableDismissalPreventionAssertion *)v16 initWithDismissalSource:1 reason:v15 invalidationHandler:v19];
    objc_storeWeak((id *)&self->_transitionDismissalPreventionAssertion, WeakRetained);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    id v8 = v23;
  }

  return WeakRetained;
}

void __98__SBUIBannerClientContainerViewController_acquireTransitionDismissalPreventionAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 setTransitionDismissalPreventionReason:*(void *)(a1 + 32)];
}

void __98__SBUIBannerClientContainerViewController_acquireTransitionDismissalPreventionAssertionForReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained scene];
  [v1 _updateUIClientSettingsWithBlock:&__block_literal_global_17];
}

void __98__SBUIBannerClientContainerViewController_acquireTransitionDismissalPreventionAssertionForReason___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v6;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  [v5 setTransitionDismissalPreventionReason:0];
}

- (id)acquireGestureRecognizerDefaultPriorityAssertionForReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBUIBannerClientContainerViewController.m", 169, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id WeakRetained = (_SBUIPresentableGestureRecognizerPriorityAssertion *)objc_loadWeakRetained((id *)&self->_gestureRecognizerPriorityAssertion);
  id v7 = [(BNBannerClientContainerViewController *)self scene];
  if (WeakRetained)
  {
    id v8 = SBLogBanners();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SBUIBannerClientContainerViewController acquireGestureRecognizerDefaultPriorityAssertionForReason:]((uint64_t)WeakRetained, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __101__SBUIBannerClientContainerViewController_acquireGestureRecognizerDefaultPriorityAssertionForReason___block_invoke;
    v22[3] = &unk_1E5CCD1F0;
    v15 = v5;
    v23 = v15;
    [v7 _updateUIClientSettingsWithBlock:v22];
    objc_initWeak(&location, self);
    v16 = [_SBUIPresentableGestureRecognizerPriorityAssertion alloc];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __101__SBUIBannerClientContainerViewController_acquireGestureRecognizerDefaultPriorityAssertionForReason___block_invoke_2;
    v19[3] = &unk_1E5CCD740;
    objc_copyWeak(&v20, &location);
    id WeakRetained = [(_SBUIPresentableGestureRecognizerPriorityAssertion *)v16 initWithReason:v15 invalidationHandler:v19];
    objc_storeWeak((id *)&self->_gestureRecognizerPriorityAssertion, WeakRetained);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    id v8 = v23;
  }

  return WeakRetained;
}

void __101__SBUIBannerClientContainerViewController_acquireGestureRecognizerDefaultPriorityAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 setWantsDefaultGesturePriorityReason:*(void *)(a1 + 32)];
}

void __101__SBUIBannerClientContainerViewController_acquireGestureRecognizerDefaultPriorityAssertionForReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained scene];
  [v1 _updateUIClientSettingsWithBlock:&__block_literal_global_62];
}

void __101__SBUIBannerClientContainerViewController_acquireGestureRecognizerDefaultPriorityAssertionForReason___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v6 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v6;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  [v5 setWantsDefaultGesturePriorityReason:0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeginWithTouches:(id)a4 event:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(BNBannerClientContainerViewController *)self presentable];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(BNBannerClientContainerViewController *)self presentable];
    char v12 = [v11 shouldCancelSystemDragGestureWithTouches:v7 event:v8];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)_handleCancelSystemBannerDragGestureRecognizer:(id)a3
{
  if ([a3 state] == 3)
  {
    id v8 = [(BNBannerClientContainerViewController *)self scene];
    uint64_t v4 = [v8 _FBSScene];
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [[SBUIPresentableCancelSystemDragAction alloc] initWithInfo:0 responder:0];
    id v7 = [v5 setWithObject:v6];
    [v4 sendActions:v7];
  }
}

- (id)acquireAssertionForButtonEvent:(int64_t)a3 reason:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (a3 == 1)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBUIBannerClientContainerViewController.m", 210, @"Invalid button evemt: %ld'", a3);

    if (v8) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"SBUIBannerClientContainerViewController.m", 211, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_3:
  uint64_t v35 = 0;
  v36[0] = &v35;
  v36[1] = 0x3032000000;
  v36[2] = __Block_byref_object_copy__0;
  v36[3] = __Block_byref_object_dispose__0;
  id v37 = [(SBUIBannerClientContainerViewController *)self _buttonEventsActionForButtonEvent:a3];
  if (([*(id *)(v36[0] + 40) isValid] & 1) == 0)
  {
    uint64_t v9 = *(void **)(v36[0] + 40);
    *(void *)(v36[0] + 40) = 0;
  }
  if (*(void *)(v36[0] + 40))
  {
    char v10 = SBLogBanners();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBUIBannerClientContainerViewController acquireAssertionForButtonEvent:reason:]((uint64_t)v36, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    objc_super v17 = [SBUIPresentableButtonEventsAction alloc];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __81__SBUIBannerClientContainerViewController_acquireAssertionForButtonEvent_reason___block_invoke;
    v31 = &unk_1E5CCD790;
    objc_copyWeak(&v33, &location);
    v32 = &v35;
    uint64_t v18 = [(SBUIPresentableButtonEventsAction *)v17 initWithButtonEvent:a3 reason:v8 handler:&v28];
    v19 = *(void **)(v36[0] + 40);
    *(void *)(v36[0] + 40) = v18;

    id v20 = [(BNBannerClientContainerViewController *)self scene];
    v21 = [v20 _FBSScene];
    id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v23 = objc_msgSend(v22, "initWithObjects:", *(void *)(v36[0] + 40), 0, v28, v29, v30, v31);
    [v21 sendActions:v23];

    [(SBUIBannerClientContainerViewController *)self _setButtonEventAction:*(void *)(v36[0] + 40) forButtonEvent:a3];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  id v24 = *(id *)(v36[0] + 40);
  _Block_object_dispose(&v35, 8);

  return v24;
}

void __81__SBUIBannerClientContainerViewController_acquireAssertionForButtonEvent_reason___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v4 = WeakRetained;
    if (WeakRetained)
    {
      id v5 = [WeakRetained presentable];
      if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) presentableButtonEvent] == 1)
      {
        uint64_t v8 = MEMORY[0x1E4F143A8];
        uint64_t v9 = 3221225472;
        char v10 = __81__SBUIBannerClientContainerViewController_acquireAssertionForButtonEvent_reason___block_invoke_2;
        uint64_t v11 = &unk_1E5CCD768;
        id v6 = v5;
        uint64_t v7 = *(void *)(a1 + 32);
        id v12 = v6;
        uint64_t v13 = v7;
        dispatch_async(MEMORY[0x1E4F14428], &v8);
        objc_msgSend(v4, "_removeButtonEventsActionForButtonEvent:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "presentableButtonEvent", v8, v9, v10, v11));
      }
    }
  }
}

uint64_t __81__SBUIBannerClientContainerViewController_acquireAssertionForButtonEvent_reason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleHomeButtonPress:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SBUIBannerClientContainerViewController;
  uint64_t v11 = [(BNBannerClientContainerViewController *)&v30 _respondToActions:v10 forFBSScene:a4 inUIScene:a5 fromTransitionContext:a6];
  id v12 = (void *)[v11 mutableCopy];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v19 = objc_opt_class();
        id v20 = v18;
        if (v19)
        {
          if (objc_opt_isKindOfClass()) {
            v21 = v20;
          }
          else {
            v21 = 0;
          }
        }
        else
        {
          v21 = 0;
        }
        id v22 = v21;

        if (v22)
        {
          objc_msgSend(v12, "removeObject:", v22, (void)v26);
          v23 = [(BNBannerClientContainerViewController *)self presentable];
          if (objc_opt_respondsToSelector()) {
            uint64_t v24 = [v23 homeAffordanceDidCrossThreshold];
          }
          else {
            uint64_t v24 = 1;
          }
          [v22 setSuccessful:v24];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v15);
  }

  return v12;
}

- (void)systemApertureElementContextPresentationDidBecomePossible:(id)a3
{
  id v13 = a3;
  id v5 = [(BNBannerClientContainerViewController *)self presentable];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(BNBannerClientContainerViewController *)self presentable];
    [v13 setSystemApertureElementViewControllerProvider:v7];
    uint64_t v8 = [v7 systemApertureElementViewController];
    uint64_t v9 = [(BNBannerClientContainerViewController *)self presentable];
    id v10 = UIViewControllerFromPresentable();
    char v11 = [v8 isEqual:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SBUIBannerClientContainerViewController.m" lineNumber:267 description:@"BannerKit clients must provide a systemApertureElementViewController that is equal to the presentable's view controller."];
    }
  }
  [v13 removeObserver:self];
}

- (id)_buttonEventsActionForButtonEvent:(int64_t)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  buttonEventsToActions = v4->_buttonEventsToActions;
  char v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = [(NSMapTable *)buttonEventsToActions objectForKey:v6];

  objc_sync_exit(v4);
  return v7;
}

- (void)_setButtonEventAction:(id)a3 forButtonEvent:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v12 = v6;
    uint64_t v7 = self;
    objc_sync_enter(v7);
    buttonEventsToActions = v7->_buttonEventsToActions;
    if (!buttonEventsToActions)
    {
      uint64_t v9 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      id v10 = v7->_buttonEventsToActions;
      v7->_buttonEventsToActions = (NSMapTable *)v9;

      buttonEventsToActions = v7->_buttonEventsToActions;
    }
    char v11 = [NSNumber numberWithInteger:a4];
    [(NSMapTable *)buttonEventsToActions setObject:v12 forKey:v11];

    objc_sync_exit(v7);
    id v6 = v12;
  }
}

- (void)_removeButtonEventsActionForButtonEvent:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  buttonEventsToActions = obj->_buttonEventsToActions;
  id v5 = [NSNumber numberWithInteger:a3];
  [(NSMapTable *)buttonEventsToActions removeObjectForKey:v5];

  if (![(NSMapTable *)obj->_buttonEventsToActions count])
  {
    id v6 = obj->_buttonEventsToActions;
    obj->_buttonEventsToActions = 0;
  }
  objc_sync_exit(obj);
}

- (BOOL)ownsHomeGesture
{
  return self->_ownsHomeGesture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonEventsToActions, 0);
  objc_destroyWeak((id *)&self->_gestureRecognizerPriorityAssertion);
  objc_destroyWeak((id *)&self->_transitionDismissalPreventionAssertion);
}

- (void)acquireTransitionDismissalPreventionAssertionForReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)acquireGestureRecognizerDefaultPriorityAssertionForReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)acquireAssertionForButtonEvent:(uint64_t)a3 reason:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end