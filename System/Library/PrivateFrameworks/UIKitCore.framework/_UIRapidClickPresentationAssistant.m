@interface _UIRapidClickPresentationAssistant
- (NSTimer)animationWatchdogTimer;
- (UITargetedPreview)sourcePreview;
- (_UIClickPresentation)presentation;
- (_UIRapidClickPresentationAssistant)initWithClickPresentation:(id)a3;
- (double)transitionDuration:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)keyboardAssertionInvalidationHandler;
- (id)keyboardSuppressionAssertion;
- (id)lifecycleCompletion;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_animateDismissalWithReason:(unint64_t)a3 actions:(id)a4 completion:(id)a5;
- (void)_animateUsingFluidSpringWithType:(unint64_t)a3 animations:(id)a4 completion:(id)a5;
- (void)_firstResponderDidChange:(id)a3;
- (void)_nonAnimatedDismissalWithReason:(unint64_t)a3 actions:(id)a4 completion:(id)a5;
- (void)_performPresentationAnimationsFromViewController:(id)a3;
- (void)animateTransition:(id)a3;
- (void)dealloc;
- (void)dismissWithReason:(unint64_t)a3 alongsideActions:(id)a4 completion:(id)a5;
- (void)presentFromSourcePreview:(id)a3 lifecycleCompletion:(id)a4;
- (void)setAnimationWatchdogTimer:(id)a3;
- (void)setKeyboardAssertionInvalidationHandler:(id)a3;
- (void)setKeyboardSuppressionAssertion:(id)a3;
- (void)setLifecycleCompletion:(id)a3;
- (void)setPresentation:(id)a3;
- (void)setSourcePreview:(id)a3;
@end

@implementation _UIRapidClickPresentationAssistant

- (_UIRapidClickPresentationAssistant)initWithClickPresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIRapidClickPresentationAssistant;
  v5 = [(_UIRapidClickPresentationAssistant *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(_UIRapidClickPresentationAssistant *)v5 setPresentation:v4];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__firstResponderDidChange_ name:@"UIWindowFirstResponderDidChangeNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:@"UIWindowFirstResponderDidChangeNotification"];

  v4.receiver = self;
  v4.super_class = (Class)_UIRapidClickPresentationAssistant;
  [(_UIRapidClickPresentationAssistant *)&v4 dealloc];
}

- (void)_firstResponderDidChange:(id)a3
{
  objc_super v4 = [a3 object];
  id v8 = [v4 firstResponder];

  if (v8)
  {
    v5 = [(_UIRapidClickPresentationAssistant *)self keyboardAssertionInvalidationHandler];
    if (v5)
    {
      v6 = [(_UIRapidClickPresentationAssistant *)self presentation];
      char v7 = ((uint64_t (**)(void, id, void *))v5)[2](v5, v8, v6);

      if ((v7 & 1) == 0) {
        [(_UIRapidClickPresentationAssistant *)self setKeyboardSuppressionAssertion:0];
      }
    }
  }
}

- (void)presentFromSourcePreview:(id)a3 lifecycleCompletion:(id)a4
{
  v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = [(_UIRapidClickPresentationAssistant *)self presentation];
  objc_super v9 = [v8 viewController];
  [v9 _setOverrideUseCustomPresentation:1];
  [v9 _setOverrideTransitioningDelegate:self];
  [(_UIRapidClickPresentationAssistant *)self setSourcePreview:v7];

  [(_UIRapidClickPresentationAssistant *)self setLifecycleCompletion:v6];
  char v10 = [v9 _isDelayingPresentation];
  v11 = [v8 presentationController];
  v12 = [v11 presentingViewController];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __83___UIRapidClickPresentationAssistant_presentFromSourcePreview_lifecycleCompletion___block_invoke;
  v20 = &unk_1E52DC3F8;
  id v13 = v12;
  id v21 = v13;
  id v14 = v9;
  char v24 = v10;
  id v22 = v14;
  v23 = self;
  +[UIViewController _performWithoutDeferringTransitions:&v17];
  if ((v10 & 1) == 0)
  {
    v15 = objc_msgSend(v14, "presentationController", v17, v18, v19, v20, v21);
    int v16 = [v15 dismissed];

    if (v16)
    {
      [v14 _setOverrideUseCustomPresentation:0];
      [v14 _setOverrideTransitioningDelegate:0];
      [(_UIRapidClickPresentationAssistant *)self setLifecycleCompletion:0];
      v6[2](v6, 0);
    }
    else
    {
      [(_UIRapidClickPresentationAssistant *)self _performPresentationAnimationsFromViewController:v13];
    }
  }
}

- (void)_performPresentationAnimationsFromViewController:(id)a3
{
  objc_super v4 = [(_UIRapidClickPresentationAssistant *)self presentation];
  if ([v4 suppressInputViewDuringPresentation])
  {
    v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    v6 = [v5 vendKeyboardSuppressionAssertionForReason:@"com.apple.UIKit._UIRapidClickPresentationAssistant" type:1];
    [(_UIRapidClickPresentationAssistant *)self setKeyboardSuppressionAssertion:v6];
  }
  id v7 = [v4 appearanceTransition];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(_UIRapidClickPresentationAssistant *)self sourcePreview];
    [v7 setSourcePreview:v8];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke;
  v19[3] = &unk_1E52D9F70;
  id v9 = v4;
  id v20 = v9;
  +[UIView performWithoutAnimation:v19];
  char v10 = [v9 customViewForTouchContinuation];
  v11 = [v10 _window];

  if (v11)
  {
    v12 = [(id)UIApp _gestureEnvironment];
    -[UIGestureEnvironment _performTouchContinuationWithOverrideHitTestedView:]((uint64_t)v12, v10);
  }
  id v16 = v7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke_2;
  v17[3] = &unk_1E52D9F70;
  id v18 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke_3;
  v15[3] = &unk_1E52DA9D0;
  id v13 = v7;
  id v14 = v9;
  [(_UIRapidClickPresentationAssistant *)self _animateUsingFluidSpringWithType:0 animations:v17 completion:v15];
}

- (void)dismissWithReason:(unint64_t)a3 alongsideActions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  char v10 = [(_UIRapidClickPresentationAssistant *)self presentation];
  v11 = [v10 presentationController];
  char v12 = [v11 dismissing];

  if ((v12 & 1) == 0)
  {
    self->_isInteractionInitiatedDismiss = 1;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __84___UIRapidClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke;
    uint64_t v17 = &unk_1E52DA160;
    id v18 = self;
    id v19 = v8;
    id v13 = _Block_copy(&v14);
    if (+[UIView areAnimationsEnabled]) {
      [(_UIRapidClickPresentationAssistant *)self _animateDismissalWithReason:a3 actions:v13 completion:v9];
    }
    else {
      [(_UIRapidClickPresentationAssistant *)self _nonAnimatedDismissalWithReason:a3 actions:v13 completion:v9];
    }
  }
}

- (void)_animateDismissalWithReason:(unint64_t)a3 actions:(id)a4 completion:(id)a5
{
  v27 = (void (**)(void))a4;
  id v8 = a5;
  id v9 = [(_UIRapidClickPresentationAssistant *)self presentation];
  char v10 = [v9 uiController];
  v28 = [v9 viewController];
  v11 = [v9 presentationController];
  uint64_t v25 = [v11 containerView];

  char v12 = [v9 disappearanceTransition];
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(_UIRapidClickPresentationAssistant *)self sourcePreview];
    [v12 setSourcePreview:v13];
  }
  uint64_t v14 = 2;
  if (a3 <= 0xB)
  {
    if (((1 << a3) & 0xBBA) != 0)
    {
      uint64_t v14 = 1;
    }
    else if (a3 == 2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v12 setDismissalStyle:1];
      }
      uint64_t v14 = 2;
    }
  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__10;
  v41[4] = __Block_byref_object_dispose__10;
  id v42 = 0;
  uint64_t v15 = objc_msgSend(v10, "platterContainerView", v25);
  id v16 = [(_UIRapidClickPresentationAssistant *)self presentation];
  uint64_t v17 = [v16 viewController];
  id v18 = [v17 presentingViewController];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_23;
  v39[3] = &unk_1E52D9F70;
  id v19 = v9;
  id v40 = v19;
  +[UIView performWithoutAnimation:v39];
  if (v27) {
    v27[2]();
  }
  [v28 _setOverrideUseCustomPresentation:0];
  [v28 _setOverrideTransitioningDelegate:0];
  objc_initWeak(&location, self);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_2;
  v36[3] = &unk_1E52D9F70;
  id v20 = v19;
  id v37 = v20;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_3;
  v29[3] = &unk_1E52DC420;
  objc_copyWeak(&v35, &location);
  v34 = v41;
  id v21 = v18;
  id v30 = v21;
  id v22 = v15;
  id v31 = v22;
  id v23 = v12;
  id v32 = v23;
  id v24 = v8;
  id v33 = v24;
  [(_UIRapidClickPresentationAssistant *)self _animateUsingFluidSpringWithType:v14 animations:v36 completion:v29];
  [(_UIRapidClickPresentationAssistant *)self setKeyboardSuppressionAssertion:0];

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  _Block_object_dispose(v41, 8);
}

- (void)_nonAnimatedDismissalWithReason:(unint64_t)a3 actions:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(void))a4;
  id v8 = (void (**)(void))a5;
  id v9 = [(_UIRapidClickPresentationAssistant *)self presentation];
  char v10 = [v9 viewController];
  v11 = [v9 uiController];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89___UIRapidClickPresentationAssistant__nonAnimatedDismissalWithReason_actions_completion___block_invoke;
  v18[3] = &unk_1E52D9F70;
  id v12 = v9;
  id v19 = v12;
  +[UIView performWithoutAnimation:v18];
  id v13 = [v11 platterContainerView];
  [v13 removeFromSuperview];

  uint64_t v14 = [v11 flocker];
  [v14 unflockToDrag:0 animated:0];

  [v10 _setOverrideUseCustomPresentation:0];
  [v10 _setOverrideTransitioningDelegate:0];
  if (v7) {
    v7[2](v7);
  }
  uint64_t v15 = [v12 disappearanceTransition];
  id v16 = [v15 alongsideAnimator];
  [v16 performAllAnimations];

  uint64_t v17 = [v15 alongsideAnimator];
  [v17 performAllCompletions];

  [(_UIRapidClickPresentationAssistant *)self setKeyboardSuppressionAssertion:0];
  if (v8) {
    v8[2](v8);
  }
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(_UIRapidClickPresentationAssistant *)self presentation];
  char v10 = [v9 presentationController];

  if (!v10) {
    char v10 = [[UIPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v8];
  }
  [(UIPresentationController *)v10 _setContainerIgnoresDirectTouchEvents:0];

  return v10;
}

- (id)animationControllerForDismissedController:(id)a3
{
  if (self->_isInteractionInitiatedDismiss) {
    self = 0;
  }
  return self;
}

- (double)transitionDuration:(id)a3
{
  int v3 = [a3 isAnimated];
  double result = 0.0;
  if (v3) {
    return 0.25;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __56___UIRapidClickPresentationAssistant_animateTransition___block_invoke;
  char v10 = &unk_1E52D9F98;
  v11 = self;
  id v5 = v4;
  id v12 = v5;
  v6 = (void (**)(void))_Block_copy(&v7);
  if (objc_msgSend(v5, "isAnimated", v7, v8, v9, v10, v11)) {
    v6[2](v6);
  }
  else {
    +[UIView performWithoutAnimation:v6];
  }
}

- (void)_animateUsingFluidSpringWithType:(unint64_t)a3 animations:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = 0.4;
  if (_AXSReduceMotionEnabled())
  {
    uint64_t v11 = 0;
    double v12 = 0.0;
    double v13 = 1.0;
  }
  else
  {
    if (a3 == 2)
    {
      uint64_t v11 = 0;
      double v14 = 0.996;
      double v12 = 0.15;
      double v13 = 0.85;
      goto LABEL_4;
    }
    double v12 = 0.0;
    if (a3 == 1)
    {
      uint64_t v11 = 0;
      double v10 = 0.35;
      double v13 = 0.85;
    }
    else if (a3)
    {
      uint64_t v11 = 0;
      double v13 = 0.0;
      double v10 = 0.0;
    }
    else
    {
      uint64_t v11 = 1;
      double v10 = 0.32;
      double v13 = 0.8;
    }
  }
  double v14 = 0.0;
LABEL_4:
  ++self->_animationCount;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93___UIRapidClickPresentationAssistant__animateUsingFluidSpringWithType_animations_completion___block_invoke;
  v20[3] = &unk_1E52DA040;
  id v21 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93___UIRapidClickPresentationAssistant__animateUsingFluidSpringWithType_animations_completion___block_invoke_2;
  v17[3] = &unk_1E52DC448;
  id v18 = v9;
  unint64_t v19 = a3;
  void v17[4] = self;
  id v15 = v9;
  id v16 = v8;
  +[UIView _animateUsingSpringWithDampingRatio:v11 response:v20 tracking:v17 dampingRatioSmoothing:v13 responseSmoothing:v10 targetSmoothing:0.0 projectionDeceleration:0.0 animations:v12 completion:v14];
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

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
}

- (id)keyboardSuppressionAssertion
{
  return self->_keyboardSuppressionAssertion;
}

- (void)setKeyboardSuppressionAssertion:(id)a3
{
}

- (NSTimer)animationWatchdogTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationWatchdogTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setAnimationWatchdogTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationWatchdogTimer);
  objc_storeStrong(&self->_keyboardSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
  objc_storeStrong(&self->keyboardAssertionInvalidationHandler, 0);
  objc_storeStrong(&self->lifecycleCompletion, 0);
  objc_storeStrong((id *)&self->presentation, 0);
}

@end