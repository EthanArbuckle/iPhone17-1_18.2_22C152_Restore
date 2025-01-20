@interface _UINavigationInteractiveTransition
- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIScreenEdgePanGestureRecognizer)screenEdgePanGestureRecognizer;
- (_UINavigationInteractiveTransition)initWithViewController:(id)a3 animator:(id)a4;
- (id)gestureRecognizerView;
- (void)_configureNavigationGesture;
- (void)_setShouldReverseLayoutDirection:(BOOL)a3;
- (void)setNotInteractiveTransition;
- (void)startInteractiveTransition;
@end

@implementation _UINavigationInteractiveTransition

- (_UINavigationInteractiveTransition)initWithViewController:(id)a3 animator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationInteractiveTransition;
  id v5 = a4;
  id v6 = a3;
  v7 = [(UIPercentDrivenInteractiveTransition *)&v10 init];
  v7->super.__useAugmentedShouldPopDecisionProcedure = _UINavigationControllerUseAugmentedPopGesture();
  v7->super.__interactionState = 0;
  objc_storeWeak((id *)&v7->super.__parent, v6);
  v7->super.__completesTransitionOnEnd = 1;
  -[_UINavigationInteractiveTransitionBase setAnimationController:](v7, "setAnimationController:", v5, v10.receiver, v10.super_class);

  [(_UINavigationInteractiveTransition *)v7 _configureNavigationGesture];
  [(UIPercentDrivenInteractiveTransition *)v7 _setUsesPacedFractionComplete:1];
  v8 = [v6 traitCollection];

  LODWORD(v6) = +[UIView _fluidParallaxTransitionsEnabledWithTraitCollection:]((uint64_t)UIView, v8);
  if (v6) {
    [(UIPercentDrivenInteractiveTransition *)v7 _setClampsPercentComplete:0];
  }
  return v7;
}

- (void)_configureNavigationGesture
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  id v11 = [WeakRetained view];

  v4 = (_UIParallaxTransitionPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->super._gestureRecognizer);
  id v5 = v4;
  edgePanRecognizer = self->_edgePanRecognizer;
  if (edgePanRecognizer)
  {
    if (v4 != edgePanRecognizer)
    {
      objc_msgSend(v11, "removeGestureRecognizer:");
      v4 = self->_edgePanRecognizer;
    }
    [(UIPanGestureRecognizer *)v4 setDelegate:0];
    v7 = self->_edgePanRecognizer;
    self->_edgePanRecognizer = 0;
  }
  if (v5)
  {
    [v11 removeGestureRecognizer:v5];
    [(UIPanGestureRecognizer *)v5 setDelegate:0];
    objc_storeWeak((id *)&self->super._gestureRecognizer, 0);
  }
  v8 = [[_UIParallaxTransitionPanGestureRecognizer alloc] initWithTarget:self action:sel_handleNavigationTransition_];
  v9 = self->_edgePanRecognizer;
  self->_edgePanRecognizer = v8;

  if ([(_UINavigationInteractiveTransitionBase *)self _shouldReverseLayoutDirection]) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = 2;
  }
  [(UIScreenEdgePanGestureRecognizer *)self->_edgePanRecognizer setEdges:v10];
  [(UIPanGestureRecognizer *)self->_edgePanRecognizer setDelegate:self];
  if (qword_1EB25E760 != -1) {
    dispatch_once(&qword_1EB25E760, &__block_literal_global_567);
  }
  if (_MergedGlobals_23_3) {
    [(UIGestureRecognizer *)self->_edgePanRecognizer setDelaysTouchesBegan:0];
  }
  [v11 addGestureRecognizer:self->_edgePanRecognizer];
  objc_storeWeak((id *)&self->super._gestureRecognizer, self->_edgePanRecognizer);
}

- (void)_setShouldReverseLayoutDirection:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationInteractiveTransition;
  [(_UINavigationInteractiveTransitionBase *)&v6 _setShouldReverseLayoutDirection:sel__setShouldReverseLayoutDirection_];
  if (v3) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 2;
  }
  [(UIScreenEdgePanGestureRecognizer *)self->_edgePanRecognizer setEdges:v5];
}

- (UIScreenEdgePanGestureRecognizer)screenEdgePanGestureRecognizer
{
  return (UIScreenEdgePanGestureRecognizer *)self->_edgePanRecognizer;
}

- (void).cxx_destruct
{
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  objc_super v6 = (_UIParallaxTransitionPanGestureRecognizer *)a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  if (self->_edgePanRecognizer == v6
    || (v9 = (_UIParallaxTransitionPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->super._gestureRecognizer),
        v9,
        v9 == v6))
  {
    if (dyld_program_sdk_at_least())
    {
      v12 = -[UIGestureRecognizer _failureDependents]((id *)&v6->super.super.super.super.isa);
      if ([v12 count])
      {
        BOOL v13 = 1;
      }
      else
      {
        v14 = -[_UILabelConfiguration _internal]((id *)&v6->super.super.super.super.isa);
        BOOL v13 = [v14 count] != 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
    if (([WeakRetained _shouldUseBuiltinInteractionController] & 1) == 0 && !v13) {
      goto LABEL_13;
    }
    v16 = [WeakRetained traitCollection];
    if (+[UIView _interruptibleParallaxTransitionsEnabledWithTraitCollection:]((uint64_t)UIView, v16))
    {
      BOOL v17 = [(_UINavigationInteractiveTransitionBase *)self _shouldPauseRunningTransition];

      if (v17)
      {
        v18 = +[_UIViewControllerTransitionContext _associatedTransitionContextsForInteractionController:self];
        uint64_t v19 = [v18 count];

        if (v19)
        {
          LOBYTE(v11) = 1;
          goto LABEL_14;
        }
      }
    }
    else
    {
    }
    int v11 = [WeakRetained _isCurrentTransitionPreemptable];
    if ([WeakRetained _isTransitioning])
    {
      if (!v11) {
        goto LABEL_14;
      }
    }
    else if ((([WeakRetained needsDeferredTransition] ^ 1 | v11) & 1) == 0)
    {
      goto LABEL_13;
    }
    v20 = [WeakRetained _transitionCoordinator];

    if (v20) {
      int v21 = v11;
    }
    else {
      int v21 = 1;
    }
    if (v21 == 1)
    {
      v22 = +[UIPeripheralHost sharedInstance];
      char v23 = [v22 _isTransitioning];

      if ((v23 & 1) == 0)
      {
        char v10 = [WeakRetained _shouldInteractivePopGestureBeEnabled];
        goto LABEL_4;
      }
    }
LABEL_13:
    LOBYTE(v11) = 0;
    goto LABEL_14;
  }
  char v10 = [(UIGestureRecognizer *)v6 _shouldReceiveEvent:v7];
LABEL_4:
  LOBYTE(v11) = v10;
LABEL_14:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  objc_super v6 = (_UIParallaxTransitionPanGestureRecognizer *)a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  if (self->_edgePanRecognizer == v6
    || (v9 = (_UIParallaxTransitionPanGestureRecognizer *)objc_loadWeakRetained((id *)&self->super._gestureRecognizer),
        v9,
        v9 == v6))
  {
    int v11 = [WeakRetained navigationBar];
    v12 = [WeakRetained _existingToolbar];
    if (qword_1EB25E760 != -1) {
      dispatch_once(&qword_1EB25E760, &__block_literal_global_567);
    }
    if (_MergedGlobals_23_3) {
      goto LABEL_14;
    }
    if (([v11 isHidden] & 1) == 0)
    {
      uint64_t v13 = [v11 window];
      if (v13)
      {
        v14 = (void *)v13;
        [v11 bounds];
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        [v7 locationInView:v11];
        v40.x = v23;
        v40.y = v24;
        v42.origin.x = v16;
        v42.origin.y = v18;
        v42.size.width = v20;
        v42.size.height = v22;
        BOOL v25 = CGRectContainsPoint(v42, v40);

        if (v25) {
          goto LABEL_13;
        }
      }
    }
    if ([v12 isHidden]) {
      goto LABEL_14;
    }
    uint64_t v26 = [v12 window];
    if (!v26) {
      goto LABEL_14;
    }
    v27 = (void *)v26;
    [v12 bounds];
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    [v7 locationInView:v12];
    v41.x = v36;
    v41.y = v37;
    v43.origin.x = v29;
    v43.origin.y = v31;
    v43.size.width = v33;
    v43.size.height = v35;
    BOOL v38 = CGRectContainsPoint(v43, v41);

    if (v38) {
LABEL_13:
    }
      BOOL v10 = 0;
    else {
LABEL_14:
    }
      BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  objc_super v6 = [WeakRetained traitCollection];
  if (+[UIView _interruptibleParallaxTransitionsEnabledWithTraitCollection:]((uint64_t)UIView, v6))
  {
  }
  else
  {
    int64_t v7 = [(_UINavigationInteractiveTransitionBase *)self _interactionState];

    if (v7)
    {
LABEL_5:
      LOBYTE(v11) = 0;
      goto LABEL_6;
    }
  }
  v8 = [v4 view];
  [v4 translationInView:v8];
  double v10 = v9;

  if (self->super.__transitionWasStopped) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v13 = [v4 edges];
    if (([v4 edges] & 8) != 0) {
      LOBYTE(v11) = v10 <= 0.0;
    }
    else {
      BOOL v11 = (v10 >= 0.0) & (v13 >> 1);
    }
  }
  else
  {
    LOBYTE(v11) = v10 >= 0.0;
  }
LABEL_6:

  return v11;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  objc_super v6 = (_UIParallaxTransitionPanGestureRecognizer *)a3;
  int64_t v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  double v9 = [WeakRetained _screen];
  uint64_t v10 = [v9 _userInterfaceIdiom];

  if (v10 == 3) {
    goto LABEL_2;
  }
  if (self->_edgePanRecognizer != v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)_UINavigationInteractiveTransition;
    unsigned __int8 v11 = [(_UINavigationInteractiveTransitionBase *)&v16 _gestureRecognizer:v6 shouldBeRequiredToFailByGestureRecognizer:v7];
    goto LABEL_5;
  }
  if (([v7 _isGestureType:16] & 1) != 0
    || ([v7 _shouldDelayUntilForceLevelRequirementIsMet] & 1) != 0
    || [(UIScreenEdgePanGestureRecognizer *)self->_edgePanRecognizer _rootFeatureState] == 2)
  {
LABEL_2:
    unsigned __int8 v11 = 0;
  }
  else
  {
    unsigned int v13 = [(_UINavigationInteractiveTransitionBase *)self _parent];
    v14 = [v13 _splitViewControllerEnforcingClass:1];

    if ([v14 _shouldUseFluidSidebarGestures]
      && ([v14 _fluidOpenSidebarPresentationGestureRecognizer],
          double v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v15 == v7)
      || +[_UIPassthroughScrollInteraction _isPassthroughGestureRecognizer:v7])
    {
      unsigned __int8 v11 = 0;
    }
    else if (v7)
    {
      unsigned __int8 v11 = (v7[1] & 0x800000000000000) == 0;
    }
    else
    {
      unsigned __int8 v11 = 1;
    }
  }
LABEL_5:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return self->_edgePanRecognizer == a3
      && +[_UIPassthroughScrollInteraction _isPassthroughGestureRecognizer:a4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (id)gestureRecognizerView
{
  v2 = [(_UINavigationInteractiveTransitionBase *)self _parent];
  BOOL v3 = [v2 view];

  return v3;
}

- (void)startInteractiveTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  [WeakRetained setInteractiveTransition:1];
  uint64_t v2 = [WeakRetained _shouldIgnoreDelegateTransitionController];
  [WeakRetained _setShouldIgnoreDelegateTransitionController:1];
  id v3 = (id)[WeakRetained popViewControllerAnimated:1];
  [WeakRetained _setShouldIgnoreDelegateTransitionController:v2];
}

- (void)setNotInteractiveTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.__parent);
  [WeakRetained setInteractiveTransition:0];
}

@end