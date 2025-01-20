@interface _UIPreviewInteractionViewControllerHelper
- (_UIPreviewInteractionViewControllerHelper)initWithViewControllerPresentation:(id)a3;
- (_UIPreviewInteractionViewControllerPresentation)viewControllerPresentation;
- (double)transitionDuration:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)customPresentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)defaultPresentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_finalizeAfterViewControllerPresentation;
- (void)_performDismissalCompletionIfNeeded;
- (void)_performPresentViewControllerFromViewController:(id)a3;
- (void)animateTransition:(id)a3;
- (void)dismissViewController;
- (void)presentViewControllerFromViewController:(id)a3 highlighter:(id)a4 presentationCompletion:(id)a5 dismissalCompletion:(id)a6;
@end

@implementation _UIPreviewInteractionViewControllerHelper

- (_UIPreviewInteractionViewControllerHelper)initWithViewControllerPresentation:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UIPreviewInteractionViewControllerHelper.m", 60, @"Invalid parameter not satisfying: %@", @"viewControllerPresentation" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIPreviewInteractionViewControllerHelper;
  v7 = [(_UIPreviewInteractionViewControllerHelper *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewControllerPresentation, a3);
    v9 = [v6 presentationController];
    if (v9)
    {
      v8->_shouldUseDefaultPresentationController = 0;
    }
    else
    {
      v10 = [v6 appearanceTransition];
      if (v10)
      {
        v8->_shouldUseDefaultPresentationController = 0;
      }
      else
      {
        v11 = [v6 disappearanceTransition];
        v8->_shouldUseDefaultPresentationController = v11 == 0;
      }
    }

    v12 = v8;
  }

  return v8;
}

- (void)presentViewControllerFromViewController:(id)a3 highlighter:(id)a4 presentationCompletion:(id)a5 dismissalCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_storeStrong((id *)&self->_highlighter, a4);
  v14 = (void *)[v12 copy];
  id presentationCompletion = self->_presentationCompletion;
  self->_id presentationCompletion = v14;

  v16 = (void *)[v13 copy];
  id dismissalCompletion = self->_dismissalCompletion;
  self->_id dismissalCompletion = v16;

  if ([(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation shouldPresentAutomatically])
  {
    [(_UIPreviewInteractionViewControllerHelper *)self _performPresentViewControllerFromViewController:v10];
  }
  else
  {
    [(_UIPreviewInteractionHighlighter *)self->_highlighter _animateForDelayedViewControllerPresentation];
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __140___UIPreviewInteractionViewControllerHelper_presentViewControllerFromViewController_highlighter_presentationCompletion_dismissalCompletion___block_invoke;
    v18[3] = &unk_1E52D9960;
    objc_copyWeak(&v20, &location);
    id v19 = v10;
    [(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation setPrivatePresentationBlock:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)dismissViewController
{
  id v5 = [(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation viewController];
  v3 = [v5 presentingViewController];

  if (v3)
  {
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    if ([(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation shouldPresentAutomatically])
    {
      v4 = 0;
    }
    else
    {
      v4 = self->_highlighter;
    }
    [(_UIPreviewInteractionViewControllerHelper *)self _finalizeAfterViewControllerPresentation];
    [(_UIPreviewInteractionViewControllerHelper *)self _performDismissalCompletionIfNeeded];
    if (v4) {
      [(_UIPreviewInteractionHighlighter *)v4 _delayedViewControllerPresentationDidCancel];
    }
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  *((unsigned char *)self + 48) = 1;
  return self;
}

- (id)animationControllerForDismissedController:(id)a3
{
  *((unsigned char *)self + 48) = 0;
  return self;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_shouldUseDefaultPresentationController) {
    [(_UIPreviewInteractionViewControllerHelper *)self defaultPresentationControllerForPresentedViewController:v8 presentingViewController:v9 sourceViewController:v10];
  }
  else {
  id v11 = [(_UIPreviewInteractionViewControllerHelper *)self customPresentationControllerForPresentedViewController:v8 presentingViewController:v9 sourceViewController:v10];
  }
  [v11 setPreviewPresentationDelegate:self];
  [v11 setAppliesVisualEffectsToPresentingView:0];
  [v11 _setShouldContinueTouchesOnTargetViewController:1];
  id v12 = [(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation customViewForTouchContinuation];
  [v11 _setCustomViewForTouchContinuation:v12];

  [v11 _setContainerIgnoresDirectTouchEvents:0];
  id v13 = self->_highlighter;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __140___UIPreviewInteractionViewControllerHelper_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
  v21[3] = &unk_1E52DE548;
  v14 = v13;
  v22 = v14;
  objc_msgSend(v11, "set_containerSuperviewForCurrentTransition:", v21);
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __140___UIPreviewInteractionViewControllerHelper_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2;
  v17[3] = &unk_1E52D9960;
  objc_copyWeak(&v19, &location);
  objc_super v15 = v14;
  v18 = v15;
  [v11 setDismissalTransitionDidEndBlock:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentTransitionContext, a3);
  BOOL shouldActAsAppearanceAnimationController = self->_shouldActAsAppearanceAnimationController;
  v7 = [v5 containerView];
  id v8 = [v5 viewForKey:@"UITransitionContextFromView"];
  id v9 = [v5 viewForKey:@"UITransitionContextToView"];
  viewControllerPresentation = self->_viewControllerPresentation;
  if (shouldActAsAppearanceAnimationController) {
    [(_UIPreviewInteractionViewControllerPresentation *)viewControllerPresentation appearanceTransition];
  }
  else {
  id v11 = [(_UIPreviewInteractionViewControllerPresentation *)viewControllerPresentation disappearanceTransition];
  }
  if (!v11)
  {
    id v11 = objc_alloc_init(_UIPreviewInteractionCrossBlurViewControllerTransition);
    [(_UIPreviewInteractionCrossBlurViewControllerTransition *)v11 setDismissTransition:!shouldActAsAppearanceAnimationController];
  }
  if (objc_opt_respondsToSelector())
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke;
    v36[3] = &unk_1E52DD450;
    v37 = v11;
    id v38 = v8;
    id v39 = v9;
    id v40 = v7;
    +[UIView performWithoutAnimation:v36];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_2;
  aBlock[3] = &unk_1E53004B0;
  BOOL v35 = shouldActAsAppearanceAnimationController;
  aBlock[4] = self;
  id v12 = v11;
  v31 = v12;
  id v13 = v8;
  id v32 = v13;
  id v14 = v9;
  id v33 = v14;
  id v15 = v7;
  id v34 = v15;
  v16 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_3;
  v24[3] = &unk_1E53004D8;
  objc_copyWeak(&v27, &location);
  id v17 = v5;
  id v25 = v17;
  v18 = v12;
  v26 = v18;
  BOOL v28 = shouldActAsAppearanceAnimationController;
  id v19 = _Block_copy(v24);
  [(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation setPrivatePresentationCompletionBlock:v19];
  if (objc_opt_respondsToSelector())
  {
    [(_UIPreviewInteractionCrossBlurViewControllerTransition *)v18 performWithCustomAnimator:v16 completion:v19];
  }
  else if ([(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation shouldUseCATransitions])
  {
    [(_UIPreviewInteractionViewControllerHelper *)self transitionDuration:v17];
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v16, v19);
  }
  else
  {
    double v20 = dbl_186B9B560[!shouldActAsAppearanceAnimationController];
    if (shouldActAsAppearanceAnimationController) {
      double v21 = 44.0;
    }
    else {
      double v21 = 35.0;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_4;
    v22[3] = &unk_1E52E8F50;
    id v23 = v19;
    +[UIView _animateUsingSpringWithTension:0 friction:v16 interactive:v22 animations:v20 completion:v21];
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)_performPresentViewControllerFromViewController:(id)a3
{
  id v4 = a3;
  [(_UIPreviewInteractionHighlighter *)self->_highlighter _prepareForViewControllerPresentation:self->_viewControllerPresentation];
  id v5 = [v4 view];
  id v6 = [v5 window];

  v7 = [(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation presentationController];
  char v8 = [v7 _allowsAutorotation];

  if ((v8 & 1) == 0) {
    [v6 beginDisablingInterfaceAutorotation];
  }
  objc_storeStrong((id *)&self->_presentingWindow, v6);
  id v9 = [(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation viewController];
  id v10 = [v9 parentViewController];
  if (v10)
  {
    objc_storeWeak((id *)&self->_previousParentViewController, v10);
    id v11 = [v9 view];
    id v12 = [v11 superview];
    objc_storeWeak((id *)&self->_previousSuperview, v12);

    [v9 willMoveToParentViewController:0];
    [v9 removeFromParentViewController];
  }
  [v9 _setOverrideUseCustomPresentation:1];
  [v9 _setOverrideTransitioningDelegate:self];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93___UIPreviewInteractionViewControllerHelper__performPresentViewControllerFromViewController___block_invoke;
  v13[3] = &unk_1E52DC3A0;
  v13[4] = self;
  [v4 _presentViewController:v9 animated:1 completion:v13];
}

- (id)defaultPresentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[_UIPreviewPresentationController2 alloc] initWithPresentedViewController:v8 presentingViewController:v9 previewingContext:0];
  [(_UIPreviewPresentationController2 *)v11 setShouldScaleContentViewToAspectFitPlatter:0];
  [(_UIPreviewPresentationController2 *)v11 setShouldEnableUserInteractionOnPlatter:1];
  id v12 = [(_UIPreviewInteractionHighlighter *)self->_highlighter interactiveHighlightEffect];
  objc_initWeak(&location, v11);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __147___UIPreviewInteractionViewControllerHelper_defaultPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
  v19[3] = &unk_1E52E7CE0;
  objc_copyWeak(&v21, &location);
  id v13 = v12;
  id v20 = v13;
  [(UIPresentationController *)v11 set_customFromViewForCurrentTransition:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __147___UIPreviewInteractionViewControllerHelper_defaultPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2;
  v16[3] = &unk_1E52E7CE0;
  objc_copyWeak(&v18, &location);
  id v14 = v13;
  id v17 = v14;
  [(UIPresentationController *)v11 set_customToViewForCurrentTransition:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v11;
}

- (id)customPresentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation presentationController];
  if (!v11) {
    id v11 = [[UIPreviewPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v9];
  }
  id v12 = [(_UIPreviewInteractionHighlighter *)self->_highlighter interactiveHighlightEffect];
  objc_initWeak(location, v11);
  id v13 = [(UIPresentationController *)v11 presentedView];
  id v14 = [v12 view];
  BOOL v15 = v13 == v14;

  BOOL v16 = [(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation shouldFlipFromAndToViewsForDisappearanceTransition];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __146___UIPreviewInteractionViewControllerHelper_customPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
  v30[3] = &unk_1E5300500;
  BOOL v34 = v15;
  id v17 = v12;
  id v31 = v17;
  objc_copyWeak(&v33, location);
  BOOL v35 = v16;
  id v18 = v13;
  id v32 = v18;
  [(UIPresentationController *)v11 set_customFromViewForCurrentTransition:v30];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __146___UIPreviewInteractionViewControllerHelper_customPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2;
  v24[3] = &unk_1E5300500;
  BOOL v28 = v15;
  objc_copyWeak(&v27, location);
  BOOL v29 = v16;
  id v19 = v18;
  id v25 = v19;
  id v20 = v17;
  id v26 = v20;
  [(UIPresentationController *)v11 set_customToViewForCurrentTransition:v24];
  id v21 = v26;
  v22 = v11;

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v33);

  objc_destroyWeak(location);
  return v22;
}

- (void)_finalizeAfterViewControllerPresentation
{
  [(UIWindow *)self->_presentingWindow endDisablingInterfaceAutorotationAnimated:1];
  presentingWindow = self->_presentingWindow;
  self->_presentingWindow = 0;

  highlighter = self->_highlighter;
  self->_highlighter = 0;

  id v11 = [(_UIPreviewInteractionViewControllerPresentation *)self->_viewControllerPresentation viewController];
  [v11 _setOverrideUseCustomPresentation:0];
  [v11 _setOverrideTransitioningDelegate:0];
  p_previousParentViewController = &self->_previousParentViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousParentViewController);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_previousParentViewController);
    [v11 willMoveToParentViewController:v7];

    id v8 = objc_loadWeakRetained((id *)&self->_previousSuperview);
    id v9 = [v11 view];
    [v8 addSubview:v9];

    id v10 = objc_loadWeakRetained((id *)p_previousParentViewController);
    [v10 addChildViewController:v11];
  }
}

- (void)_performDismissalCompletionIfNeeded
{
  id dismissalCompletion = (void (**)(id, SEL))self->_dismissalCompletion;
  if (dismissalCompletion)
  {
    dismissalCompletion[2](dismissalCompletion, a2);
    id v4 = self->_dismissalCompletion;
    self->_id dismissalCompletion = 0;
  }
}

- (_UIPreviewInteractionViewControllerPresentation)viewControllerPresentation
{
  return self->_viewControllerPresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransitionContext, 0);
  objc_destroyWeak((id *)&self->_previousSuperview);
  objc_destroyWeak((id *)&self->_previousParentViewController);
  objc_storeStrong(&self->_dismissalCompletion, 0);
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_storeStrong((id *)&self->_presentingWindow, 0);
  objc_storeStrong((id *)&self->_viewControllerPresentation, 0);
  objc_storeStrong((id *)&self->_highlighter, 0);
}

@end