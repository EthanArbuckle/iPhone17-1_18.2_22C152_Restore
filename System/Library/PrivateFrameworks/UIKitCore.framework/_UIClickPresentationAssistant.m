@interface _UIClickPresentationAssistant
- (UITargetedPreview)sourcePreview;
- (UIView)stashedSuperView;
- (UIViewController)stashedParentViewController;
- (UIViewPropertyAnimator)presentationAnimator;
- (_UIClickPresentation)presentation;
- (_UIClickPresentationAssistant)initWithClickPresentation:(id)a3;
- (_UIPortalView)presentationSourcePortalView;
- (double)transitionDuration:(id)a3;
- (id)_sourcePreviewPortal;
- (id)keyboardAssertionInvalidationHandler;
- (id)lifecycleCompletion;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)transitionCompletion;
- (void)_animateDismissalIsInterruption:(BOOL)a3;
- (void)_animatePresentation;
- (void)_applyStashedParentViewControllerIfNecessary;
- (void)_createPropertyAnimatorIfNecessaryForTransition:(id)a3 isAppearing:(BOOL)a4;
- (void)_didTransitionToDismissingFromState:(unint64_t)a3;
- (void)_didTransitionToPossibleEndingTransition:(BOOL)a3;
- (void)_didTransitionToPresented;
- (void)_postInteractionCleanup;
- (void)_stashParentViewControllerIfNecessary;
- (void)animateTransition:(id)a3;
- (void)dismissWithReason:(unint64_t)a3 alongsideActions:(id)a4 completion:(id)a5;
- (void)presentFromSourcePreview:(id)a3 lifecycleCompletion:(id)a4;
- (void)setKeyboardAssertionInvalidationHandler:(id)a3;
- (void)setLifecycleCompletion:(id)a3;
- (void)setPresentation:(id)a3;
- (void)setPresentationSourcePortalView:(id)a3;
- (void)setSourcePreview:(id)a3;
- (void)setStashedParentViewController:(id)a3;
- (void)setStashedSuperView:(id)a3;
- (void)setTransitionCompletion:(id)a3;
@end

@implementation _UIClickPresentationAssistant

- (_UIClickPresentationAssistant)initWithClickPresentation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIClickPresentationAssistant;
  v5 = [(_UIClickPresentationAssistant *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(_UIClickPresentationAssistant *)v5 setPresentation:v4];
    v6->_currentState = 1;
  }

  return v6;
}

- (void)presentFromSourcePreview:(id)a3 lifecycleCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(_UIClickPresentationAssistant *)self presentation];
  id v14 = [v8 viewController];

  v9 = [(_UIClickPresentationAssistant *)self presentation];
  v10 = [v9 presentationController];
  v11 = [v10 presentingViewController];

  v12 = [(_UIClickPresentationAssistant *)self presentation];
  LODWORD(v10) = [v12 _presentsSelf];

  if (v10)
  {
    uint64_t v13 = [v14 parentViewController];

    v11 = (void *)v13;
  }
  [(_UIClickPresentationAssistant *)self _stashParentViewControllerIfNecessary];
  [v14 _setOverrideUseCustomPresentation:1];
  [v14 _setOverrideTransitioningDelegate:self];
  [(_UIClickPresentationAssistant *)self setSourcePreview:v7];

  [(_UIClickPresentationAssistant *)self setLifecycleCompletion:v6];
  [v11 presentViewController:v14 animated:1 completion:0];
}

- (void)dismissWithReason:(unint64_t)a3 alongsideActions:(id)a4 completion:(id)a5
{
  id v6 = a5;
  if (self->_currentState == 2)
  {
    handleEvent(stateMachineSpec_4, 2, 2, (uint64_t)self, (uint64_t *)&self->_currentState);
  }
  else
  {
    id v7 = [(_UIClickPresentationAssistant *)self presentation];
    objc_super v8 = [v7 viewController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79___UIClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke;
    v9[3] = &unk_1E52DA040;
    id v10 = v6;
    [v8 dismissViewControllerAnimated:1 completion:v9];
  }
}

- (void)_didTransitionToPresented
{
  v3 = [(_UIClickPresentationAssistant *)self presentation];
  id v5 = [v3 appearanceTransition];

  id v4 = [(_UIClickPresentationAssistant *)self transitionCompletion];
  ((void (**)(void, id, uint64_t))v4)[2](v4, v5, 1);

  [(_UIClickPresentationAssistant *)self setTransitionCompletion:0];
}

- (void)_didTransitionToDismissingFromState:(unint64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v3 = 0;
    goto LABEL_4;
  }
  if (a3 == 2)
  {
    uint64_t v3 = 1;
LABEL_4:
    [(_UIClickPresentationAssistant *)self _animateDismissalIsInterruption:v3];
    return;
  }
  os_variant_has_internal_diagnostics();
}

- (void)_didTransitionToPossibleEndingTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIClickPresentationAssistant *)self presentation];
  id v6 = v5;
  if (v3) {
    [v5 appearanceTransition];
  }
  else {
  id v8 = [v5 disappearanceTransition];
  }

  id v7 = [(_UIClickPresentationAssistant *)self transitionCompletion];
  ((void (**)(void, id, BOOL))v7)[2](v7, v8, !v3);

  [(_UIClickPresentationAssistant *)self setTransitionCompletion:0];
  [(_UIClickPresentationAssistant *)self _postInteractionCleanup];
}

- (void)_animatePresentation
{
  BOOL v3 = [(_UIClickPresentationAssistant *)self presentation];
  id v4 = [v3 appearanceTransition];

  if (objc_opt_respondsToSelector())
  {
    id v5 = [(_UIClickPresentationAssistant *)self sourcePreview];
    [v4 setSourcePreview:v5];
  }
  id v6 = [(UIViewControllerContextTransitioning *)self->_currentContext containerView];
  id v7 = [(UIViewControllerContextTransitioning *)self->_currentContext viewForKey:@"UITransitionContextFromView"];
  id v8 = [(UIViewControllerContextTransitioning *)self->_currentContext viewForKey:@"UITransitionContextToView"];
  if (objc_opt_respondsToSelector())
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __53___UIClickPresentationAssistant__animatePresentation__block_invoke;
    v36[3] = &unk_1E52DF078;
    v36[4] = self;
    id v37 = v7;
    id v38 = v6;
    id v39 = v4;
    id v40 = v8;
    +[UIView performWithoutAnimation:v36];
  }
  v9 = [(_UIClickPresentationAssistant *)self presentation];
  id v10 = [v9 customViewForTouchContinuation];

  v11 = [v10 window];

  if (v11)
  {
    v12 = [(id)UIApp _gestureEnvironment];
    -[UIGestureEnvironment _performTouchContinuationWithOverrideHitTestedView:]((uint64_t)v12, v10);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53___UIClickPresentationAssistant__animatePresentation__block_invoke_2;
  aBlock[3] = &unk_1E52DF078;
  aBlock[4] = self;
  id v32 = v4;
  id v33 = v7;
  id v34 = v8;
  id v35 = v6;
  id v13 = v6;
  id v14 = v8;
  id v15 = v7;
  id v16 = v4;
  v17 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __53___UIClickPresentationAssistant__animatePresentation__block_invoke_3;
  v30[3] = &unk_1E52D9F70;
  v30[4] = self;
  v18 = _Block_copy(v30);
  [(_UIClickPresentationAssistant *)self _createPropertyAnimatorIfNecessaryForTransition:v16 isAppearing:1];
  v19 = [(_UIClickPresentationAssistant *)self presentationAnimator];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __53___UIClickPresentationAssistant__animatePresentation__block_invoke_4;
  v28[3] = &unk_1E52DA040;
  id v29 = v17;
  id v20 = v17;
  [v19 addAnimations:v28];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __53___UIClickPresentationAssistant__animatePresentation__block_invoke_5;
  v25 = &unk_1E52EA988;
  v26 = self;
  id v27 = v18;
  id v21 = v18;
  [v19 addCompletion:&v22];
  objc_msgSend(v19, "startAnimation", v22, v23, v24, v25, v26);
}

- (void)_animateDismissalIsInterruption:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIClickPresentationAssistant *)self presentation];
  id v6 = [v5 disappearanceTransition];

  if (objc_opt_respondsToSelector())
  {
    id v7 = [(_UIClickPresentationAssistant *)self sourcePreview];
    [v6 setSourcePreview:v7];
  }
  id v8 = [(UIViewControllerContextTransitioning *)self->_currentContext containerView];
  [v8 setUserInteractionEnabled:0];
  v9 = [(UIViewControllerContextTransitioning *)self->_currentContext viewForKey:@"UITransitionContextFromView"];
  id v10 = [(UIViewControllerContextTransitioning *)self->_currentContext viewForKey:@"UITransitionContextToView"];
  v11 = v10;
  if (v3)
  {
    v12 = [(_UIClickPresentationAssistant *)self presentation];
    id v13 = [v12 appearanceTransition];

    if (objc_opt_respondsToSelector()) {
      [v13 transitionWillReverse];
    }
  }
  else
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke;
    v39[3] = &unk_1E52DF078;
    v39[4] = self;
    id v40 = v10;
    id v41 = v8;
    id v42 = v6;
    id v43 = v9;
    +[UIView performWithoutAnimation:v39];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_2;
  aBlock[3] = &unk_1E52DF078;
  aBlock[4] = self;
  id v14 = v6;
  id v35 = v14;
  id v15 = v9;
  id v36 = v15;
  id v16 = v11;
  id v37 = v16;
  id v17 = v8;
  id v38 = v17;
  v18 = _Block_copy(aBlock);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_3;
  v32[3] = &unk_1E52D9FC0;
  v32[4] = self;
  BOOL v33 = v3;
  v19 = _Block_copy(v32);
  if ([(UIViewControllerContextTransitioning *)self->_currentContext isAnimated])
  {
    [(_UIClickPresentationAssistant *)self _createPropertyAnimatorIfNecessaryForTransition:v14 isAppearing:0];
    id v20 = [(_UIClickPresentationAssistant *)self presentationAnimator];
    id v21 = v20;
    if (v3)
    {
      [v20 pauseAnimation];
      [v21 _setCompletions:0];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_4;
      v30[3] = &unk_1E52E5E20;
      uint64_t v22 = &v31;
      id v31 = v19;
      [v21 addCompletion:v30];
      [v21 setReversed:1];
      [v21 continueAnimation];
    }
    else
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_5;
      v28[3] = &unk_1E52DA040;
      uint64_t v22 = &v29;
      id v29 = v18;
      [v21 addAnimations:v28];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_6;
      v26[3] = &unk_1E52E5E20;
      id v27 = v19;
      [v21 addCompletion:v26];
      [v21 startAnimation];
    }
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __65___UIClickPresentationAssistant__animateDismissalIsInterruption___block_invoke_7;
    v23[3] = &unk_1E52DE9A0;
    id v24 = v18;
    id v25 = v19;
    +[UIView performWithoutAnimation:v23];

    id v21 = v24;
  }
}

- (void)_postInteractionCleanup
{
  [(_UIClickPresentationAssistant *)self setSourcePreview:0];
  BOOL v3 = [(_UIClickPresentationAssistant *)self presentation];
  id v5 = [v3 viewController];

  [v5 _setOverrideUseCustomPresentation:0];
  [v5 _setOverrideTransitioningDelegate:0];
  id v4 = [(_UIClickPresentationAssistant *)self lifecycleCompletion];
  [(_UIClickPresentationAssistant *)self setLifecycleCompletion:0];
  if (v4) {
    v4[2](v4, 1);
  }
  [(_UIClickPresentationAssistant *)self _applyStashedParentViewControllerIfNecessary];
}

- (void)_stashParentViewControllerIfNecessary
{
  BOOL v3 = [(_UIClickPresentationAssistant *)self presentation];
  id v8 = [v3 viewController];

  id v4 = [v8 parentViewController];

  if (v4)
  {
    id v5 = [v8 parentViewController];
    [(_UIClickPresentationAssistant *)self setStashedParentViewController:v5];

    id v6 = [v8 view];
    id v7 = [v6 superview];
    [(_UIClickPresentationAssistant *)self setStashedSuperView:v7];

    [v8 willMoveToParentViewController:0];
    [v8 removeFromParentViewController];
  }
}

- (void)_applyStashedParentViewControllerIfNecessary
{
  BOOL v3 = [(_UIClickPresentationAssistant *)self stashedParentViewController];

  if (v3)
  {
    id v4 = [(_UIClickPresentationAssistant *)self presentation];
    id v5 = [v4 viewController];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke;
    aBlock[3] = &unk_1E52D9F98;
    aBlock[4] = self;
    id v6 = v5;
    id v12 = v6;
    id v7 = (void (**)(void))_Block_copy(aBlock);
    id v8 = [v6 transitionCoordinator];
    if (v8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __77___UIClickPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_3;
      v9[3] = &unk_1E52DA110;
      id v10 = v7;
      [v8 animateAlongsideTransition:0 completion:v9];
    }
    else
    {
      v7[2](v7);
    }
  }
}

- (id)_sourcePreviewPortal
{
  BOOL v3 = [(_UIClickPresentationAssistant *)self sourcePreview];
  id v4 = [_UIPortalView alloc];
  id v5 = [v3 view];
  [v5 bounds];
  id v6 = -[_UIPortalView initWithFrame:](v4, "initWithFrame:");

  if (_AXSReduceMotionEnabled())
  {
    [(_UIPortalView *)v6 setHidesSourceView:0];
  }
  else
  {
    id v7 = [(_UIClickPresentationAssistant *)self presentation];
    -[_UIPortalView setHidesSourceView:](v6, "setHidesSourceView:", [v7 _presentsSelf] ^ 1);
  }
  [(_UIPortalView *)v6 setAllowsBackdropGroups:1];
  [(_UIPortalView *)v6 setMatchesAlpha:1];
  id v8 = [v3 view];
  [(_UIPortalView *)v6 setSourceView:v8];

  v9 = [v3 target];
  id v10 = v9;
  if (v9)
  {
    [v9 transform];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
  }
  v12[0] = v13;
  v12[1] = v14;
  v12[2] = v15;
  [(UIView *)v6 setTransform:v12];

  [(UIView *)v6 setUserInteractionEnabled:0];
  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(_UIClickPresentationAssistant *)self presentation];
  id v12 = [v11 presentationController];

  if (!v12) {
    id v12 = [[UIPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v9];
  }
  [(UIPresentationController *)v12 _setContainerIgnoresDirectTouchEvents:0];
  long long v13 = [(_UIClickPresentationAssistant *)self _sourcePreviewPortal];
  [(_UIClickPresentationAssistant *)self setPresentationSourcePortalView:v13];

  objc_initWeak(&location, v12);
  objc_initWeak(&from, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
  v21[3] = &unk_1E52EBFF0;
  objc_copyWeak(&v22, &from);
  [(UIPresentationController *)v12 set_containerSuperviewForCurrentTransition:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2;
  v18[3] = &unk_1E5301D88;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  [(UIPresentationController *)v12 set_customFromViewForCurrentTransition:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __128___UIClickPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_3;
  v15[3] = &unk_1E5301D88;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  [(UIPresentationController *)v12 set_customToViewForCurrentTransition:v15];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

- (double)transitionDuration:(id)a3
{
  id v4 = [(_UIClickPresentationAssistant *)self presentationAnimator];

  if (!v4) {
    return 0.4;
  }
  id v5 = [(_UIClickPresentationAssistant *)self presentationAnimator];
  [v5 duration];
  double v7 = v6;

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentContext, a3);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51___UIClickPresentationAssistant_animateTransition___block_invoke;
  v9[3] = &unk_1E5301DB0;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v10 = v6;
  [(_UIClickPresentationAssistant *)self setTransitionCompletion:v9];
  unint64_t currentState = self->_currentState;
  if (currentState == 3)
  {
    uint64_t v8 = 2;
    goto LABEL_5;
  }
  if (currentState == 1)
  {
    uint64_t v8 = 0;
LABEL_5:
    handleEvent(stateMachineSpec_4, currentState, v8, (uint64_t)self, (uint64_t *)&self->_currentState);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_createPropertyAnimatorIfNecessaryForTransition:(id)a3 isAppearing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self->_presentationAnimator)
  {
    id v14 = v6;
    if (objc_opt_respondsToSelector())
    {
      double v7 = [v14 customAnimator];
      presentationAnimator = self->_presentationAnimator;
      self->_presentationAnimator = v7;
    }
    id v9 = self->_presentationAnimator;
    if (!v9)
    {
      if (v4) {
        double v10 = 0.4;
      }
      else {
        double v10 = 0.35;
      }
      if (v4) {
        double v11 = 0.85;
      }
      else {
        double v11 = 1.0;
      }
      id v12 = [[UIViewPropertyAnimator alloc] initWithDuration:0 dampingRatio:v10 animations:v11];
      long long v13 = self->_presentationAnimator;
      self->_presentationAnimator = v12;

      id v9 = self->_presentationAnimator;
    }
    [(UIViewPropertyAnimator *)v9 _setShouldLayoutSubviews:0];
    id v6 = v14;
  }
}

- (UIViewPropertyAnimator)presentationAnimator
{
  return self->_presentationAnimator;
}

- (_UIClickPresentation)presentation
{
  return self->presentation;
}

- (void)setPresentation:(id)a3
{
}

- (id)lifecycleCompletion
{
  return self->lifecycleCompletion;
}

- (void)setLifecycleCompletion:(id)a3
{
}

- (id)keyboardAssertionInvalidationHandler
{
  return self->keyboardAssertionInvalidationHandler;
}

- (void)setKeyboardAssertionInvalidationHandler:(id)a3
{
}

- (_UIPortalView)presentationSourcePortalView
{
  return self->_presentationSourcePortalView;
}

- (void)setPresentationSourcePortalView:(id)a3
{
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
}

- (UIViewController)stashedParentViewController
{
  return self->_stashedParentViewController;
}

- (void)setStashedParentViewController:(id)a3
{
}

- (UIView)stashedSuperView
{
  return self->_stashedSuperView;
}

- (void)setStashedSuperView:(id)a3
{
}

- (id)transitionCompletion
{
  return self->_transitionCompletion;
}

- (void)setTransitionCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionCompletion, 0);
  objc_storeStrong((id *)&self->_stashedSuperView, 0);
  objc_storeStrong((id *)&self->_stashedParentViewController, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
  objc_storeStrong((id *)&self->_presentationSourcePortalView, 0);
  objc_storeStrong(&self->keyboardAssertionInvalidationHandler, 0);
  objc_storeStrong(&self->lifecycleCompletion, 0);
  objc_storeStrong((id *)&self->presentation, 0);
  objc_storeStrong((id *)&self->_presentationAnimator, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
}

@end