@interface _UIPreviewInteractionPresentationAssistant
- (BOOL)isAppearing;
- (UITargetedPreview)sourcePreview;
- (UIView)stashedSuperView;
- (UIViewController)stashedParentViewController;
- (UIViewPropertyAnimator)presentationAnimator;
- (_UIPortalView)presentationSourcePortalView;
- (_UIPreviewInteractionHighlighter)highlighter;
- (_UIPreviewInteractionPresentationAssistant)initWithViewControllerPresentation:(id)a3;
- (_UIPreviewInteractionViewControllerPresentation)presentation;
- (double)transitionDuration:(id)a3;
- (id)_sourcePreviewPortal;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)dismissalCompletion;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_applyStashedParentViewControllerIfNecessary;
- (void)_createpresentationAnimatorIfNecessary:(id)a3;
- (void)_postInteractionCleanup;
- (void)_stashParentViewControllerIfNecessary;
- (void)animateTransition:(id)a3;
- (void)dismissViewController;
- (void)presentFromViewController:(id)a3 sourcePreview:(id)a4 dismissalCompletion:(id)a5;
- (void)setDismissalCompletion:(id)a3;
- (void)setHighlighter:(id)a3;
- (void)setIsAppearing:(BOOL)a3;
- (void)setPresentation:(id)a3;
- (void)setPresentationSourcePortalView:(id)a3;
- (void)setSourcePreview:(id)a3;
- (void)setStashedParentViewController:(id)a3;
- (void)setStashedSuperView:(id)a3;
@end

@implementation _UIPreviewInteractionPresentationAssistant

- (_UIPreviewInteractionPresentationAssistant)initWithViewControllerPresentation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPreviewInteractionPresentationAssistant;
  v5 = [(_UIPreviewInteractionPresentationAssistant *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIPreviewInteractionPresentationAssistant *)v5 setPresentation:v4];
  }

  return v6;
}

- (void)presentFromViewController:(id)a3 sourcePreview:(id)a4 dismissalCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
  id v12 = [v11 viewController];

  [(_UIPreviewInteractionPresentationAssistant *)self _stashParentViewControllerIfNecessary];
  [v12 _setOverrideUseCustomPresentation:1];
  [v12 _setOverrideTransitioningDelegate:self];
  [(_UIPreviewInteractionPresentationAssistant *)self setSourcePreview:v9];

  [(_UIPreviewInteractionPresentationAssistant *)self setDismissalCompletion:v8];
  [v10 presentViewController:v12 animated:1 completion:0];
}

- (void)dismissViewController
{
  v3 = [(UIViewControllerContextTransitioning *)self->_currentContext containerView];
  [v3 setUserInteractionEnabled:0];

  id v4 = [(_UIPreviewInteractionPresentationAssistant *)self presentationAnimator];
  if (([v4 isReversed] & 1) == 0 && objc_msgSend(v4, "_animationState") != 5)
  {
    if ([(_UIPreviewInteractionPresentationAssistant *)self isAppearing]
      && [v4 isRunning])
    {
      [v4 pauseAnimation];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __67___UIPreviewInteractionPresentationAssistant_dismissViewController__block_invoke;
      v12[3] = &unk_1E52D9F70;
      v12[4] = self;
      +[UIView performWithoutAnimation:v12];
      v5 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
      v6 = [v5 appearanceTransition];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
        id v9 = [v8 appearanceTransition];
        [v9 transitionWillReverse];
      }
      [v4 setReversed:1];
      id v10 = [v4 timingParameters];
      [v4 continueAnimationWithTimingParameters:v10 durationFactor:1.0];
    }
    else
    {
      id v10 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
      v11 = [v10 viewController];
      [v11 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)_stashParentViewControllerIfNecessary
{
  v3 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
  id v8 = [v3 viewController];

  id v4 = [v8 parentViewController];

  if (v4)
  {
    v5 = [v8 parentViewController];
    [(_UIPreviewInteractionPresentationAssistant *)self setStashedParentViewController:v5];

    v6 = [v8 view];
    char v7 = [v6 superview];
    [(_UIPreviewInteractionPresentationAssistant *)self setStashedSuperView:v7];

    [v8 willMoveToParentViewController:0];
    [v8 removeFromParentViewController];
  }
}

- (void)_applyStashedParentViewControllerIfNecessary
{
  v3 = [(_UIPreviewInteractionPresentationAssistant *)self stashedParentViewController];

  if (v3)
  {
    id v4 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
    v5 = [v4 viewController];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke;
    aBlock[3] = &unk_1E52D9F98;
    aBlock[4] = self;
    id v6 = v5;
    id v12 = v6;
    char v7 = (void (**)(void))_Block_copy(aBlock);
    id v8 = [v6 transitionCoordinator];
    if (v8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_3;
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
  v2 = [(_UIPreviewInteractionPresentationAssistant *)self sourcePreview];
  v3 = [_UIPortalView alloc];
  id v4 = [v2 view];
  [v4 bounds];
  v5 = -[_UIPortalView initWithFrame:](v3, "initWithFrame:");

  [(_UIPortalView *)v5 setHidesSourceView:_AXSReduceMotionEnabled() == 0];
  [(_UIPortalView *)v5 setMatchesAlpha:1];
  id v6 = [v2 view];
  [(_UIPortalView *)v5 setSourceView:v6];

  char v7 = [v2 target];
  id v8 = v7;
  if (v7)
  {
    [v7 transform];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
  }
  v10[0] = v11;
  v10[1] = v12;
  v10[2] = v13;
  [(UIView *)v5 setTransform:v10];

  [(UIView *)v5 setUserInteractionEnabled:0];
  return v5;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
  long long v12 = [v11 presentationController];

  if (!v12) {
    long long v12 = [[UIPreviewPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v9];
  }
  [(UIPresentationController *)v12 _setShouldContinueTouchesOnTargetViewController:1];
  [(UIPresentationController *)v12 _setContainerIgnoresDirectTouchEvents:0];
  [(UIPreviewPresentationController *)v12 setAppliesVisualEffectsToPresentingView:0];
  long long v13 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
  v14 = [v13 customViewForTouchContinuation];
  [(UIPresentationController *)v12 _setCustomViewForTouchContinuation:v14];

  v15 = [(_UIPreviewInteractionPresentationAssistant *)self _sourcePreviewPortal];
  [(_UIPreviewInteractionPresentationAssistant *)self setPresentationSourcePortalView:v15];

  objc_initWeak(&location, v12);
  objc_initWeak(&from, self);
  v16 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
  v17 = [v16 customContainerView];

  if (v17)
  {
    v18 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
    uint64_t v19 = [v18 customContainerView];
  }
  else
  {
    v20 = [(_UIPreviewInteractionPresentationAssistant *)self highlighter];
    v21 = [v20 customContainerView];

    if (!v21) {
      goto LABEL_9;
    }
    v18 = [(_UIPreviewInteractionPresentationAssistant *)self highlighter];
    uint64_t v19 = [v18 customContainerView];
  }
  v22 = (void *)v19;

  if (v22)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
    v31[3] = &unk_1E52DE548;
    id v23 = v22;
    id v32 = v23;
    [(UIPresentationController *)v12 set_containerSuperviewForCurrentTransition:v31];

    goto LABEL_10;
  }
LABEL_9:
  id v23 = 0;
LABEL_10:
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2;
  v28[3] = &unk_1E5301D88;
  objc_copyWeak(&v29, &from);
  objc_copyWeak(&v30, &location);
  [(UIPresentationController *)v12 set_customFromViewForCurrentTransition:v28];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_3;
  v25[3] = &unk_1E5301D88;
  objc_copyWeak(&v26, &from);
  objc_copyWeak(&v27, &location);
  [(UIPresentationController *)v12 set_customToViewForCurrentTransition:v25];
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return self;
}

- (id)animationControllerForDismissedController:(id)a3
{
  return self;
}

- (double)transitionDuration:(id)a3
{
  BOOL v3 = [(_UIPreviewInteractionPresentationAssistant *)self isAppearing];
  double result = 0.35;
  if (v3) {
    return 0.4;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v5 = a3;
  [(_UIPreviewInteractionPresentationAssistant *)self _createpresentationAnimatorIfNecessary:v5];
  id v23 = [(_UIPreviewInteractionPresentationAssistant *)self presentationAnimator];
  objc_storeStrong((id *)&self->_currentContext, a3);
  BOOL v6 = [(_UIPreviewInteractionPresentationAssistant *)self isAppearing];
  char v7 = [v5 containerView];
  [v7 setUserInteractionEnabled:v6];
  id v8 = [v5 viewForKey:@"UITransitionContextFromView"];
  id v9 = [v5 viewForKey:@"UITransitionContextToView"];
  id v10 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
  long long v11 = v10;
  if (v6) {
    [v10 appearanceTransition];
  }
  else {
  long long v12 = [v10 disappearanceTransition];
  }

  if (objc_opt_respondsToSelector())
  {
    long long v13 = [(_UIPreviewInteractionPresentationAssistant *)self sourcePreview];
    [v12 setSourcePreview:v13];
  }
  if (objc_opt_respondsToSelector())
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke;
    v39[3] = &unk_1E53004B0;
    v39[4] = self;
    BOOL v44 = v6;
    id v40 = v7;
    id v41 = v8;
    id v42 = v9;
    id v43 = v12;
    +[UIView performWithoutAnimation:v39];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_2;
  aBlock[3] = &unk_1E53004B0;
  id v14 = v12;
  id v33 = v14;
  id v15 = v8;
  id v34 = v15;
  id v16 = v9;
  id v35 = v16;
  id v17 = v7;
  id v36 = v17;
  v37 = self;
  BOOL v38 = v6;
  v18 = _Block_copy(aBlock);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_3;
  v29[3] = &unk_1E52EA7D8;
  v29[4] = self;
  id v19 = v14;
  id v30 = v19;
  BOOL v31 = v6;
  v20 = _Block_copy(v29);
  if (v6)
  {
    objc_initWeak(&location, self);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_16;
    v26[3] = &unk_1E52DC888;
    objc_copyWeak(&v27, &location);
    v21 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
    [v21 setPrivatePresentationCompletionBlock:v26];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector())
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_2_20;
    v24[3] = &unk_1E52D9FE8;
    id v25 = v20;
    [v19 performWithCustomAnimator:v18 completion:v24];

    v22 = v23;
  }
  else
  {
    v22 = v23;
    [v23 addAnimations:v18];
    [v23 addCompletion:v20];
    [v23 startAnimation];
  }
}

- (void)_postInteractionCleanup
{
  id v9 = [(_UIPreviewInteractionPresentationAssistant *)self highlighter];
  if (v9)
  {
    BOOL v3 = [v9 customBackgroundEffectView];
    [v3 removeFromSuperview];

    [(_UIPreviewInteractionPresentationAssistant *)self setHighlighter:0];
  }
  id v4 = [(_UIPreviewInteractionPresentationAssistant *)self presentationSourcePortalView];
  [v4 removeFromSuperview];

  [(_UIPreviewInteractionPresentationAssistant *)self setPresentationSourcePortalView:0];
  [(_UIPreviewInteractionPresentationAssistant *)self setSourcePreview:0];
  id v5 = [(_UIPreviewInteractionPresentationAssistant *)self presentation];
  BOOL v6 = [v5 viewController];

  [v6 _setOverrideUseCustomPresentation:0];
  [v6 _setOverrideTransitioningDelegate:0];
  char v7 = [(_UIPreviewInteractionPresentationAssistant *)self dismissalCompletion];
  id v8 = (void (**)(void))[v7 copy];

  [(_UIPreviewInteractionPresentationAssistant *)self setDismissalCompletion:0];
  if (v8) {
    v8[2](v8);
  }
  [(_UIPreviewInteractionPresentationAssistant *)self _applyStashedParentViewControllerIfNecessary];
}

- (void)_createpresentationAnimatorIfNecessary:(id)a3
{
  if (!self->_presentationAnimator)
  {
    [(_UIPreviewInteractionPresentationAssistant *)self transitionDuration:a3];
    double v5 = v4;
    if ([(_UIPreviewInteractionPresentationAssistant *)self isAppearing]) {
      double v6 = 0.85;
    }
    else {
      double v6 = 1.0;
    }
    char v7 = [[UIViewPropertyAnimator alloc] initWithDuration:0 dampingRatio:v5 animations:v6];
    presentationAnimator = self->_presentationAnimator;
    self->_presentationAnimator = v7;

    id v9 = self->_presentationAnimator;
    [(UIViewPropertyAnimator *)v9 _setShouldLayoutSubviews:0];
  }
}

- (UIViewPropertyAnimator)presentationAnimator
{
  return self->_presentationAnimator;
}

- (_UIPreviewInteractionHighlighter)highlighter
{
  return self->_highlighter;
}

- (void)setHighlighter:(id)a3
{
}

- (_UIPreviewInteractionViewControllerPresentation)presentation
{
  return self->_presentation;
}

- (void)setPresentation:(id)a3
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

- (id)dismissalCompletion
{
  return self->_dismissalCompletion;
}

- (void)setDismissalCompletion:(id)a3
{
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (void)setIsAppearing:(BOOL)a3
{
  self->_isAppearing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalCompletion, 0);
  objc_storeStrong((id *)&self->_stashedSuperView, 0);
  objc_storeStrong((id *)&self->_stashedParentViewController, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
  objc_storeStrong((id *)&self->_presentationSourcePortalView, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_highlighter, 0);
  objc_storeStrong((id *)&self->_presentationAnimator, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
}

@end