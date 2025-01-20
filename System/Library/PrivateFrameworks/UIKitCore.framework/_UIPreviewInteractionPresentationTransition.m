@interface _UIPreviewInteractionPresentationTransition
- (BOOL)_shouldReduceMotion;
- (BOOL)wantsInteractiveStart;
- (_UIPreviewInteractionPresentationTransition)init;
- (double)interactiveTransitionFraction;
- (double)transitionDuration:(id)a3;
- (id)_newPushDecayAnimator;
- (id)_newReducedMotionTimingCurveProviderForPreviewTransition;
- (id)_newTimingCurveProviderForPreviewTransition;
- (id)_preparedPresentationAnimator;
- (id)_previewPresentationControllerForTransitionContext:(id)a3;
- (id)_previewPresentationControllerForViewController:(id)a3;
- (void)_applyPushDecayEffectTransformToView:(id)a3;
- (void)_performCancelTransition;
- (void)_performFinishTransition;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)cancelTransition;
- (void)finishTransition;
- (void)startInteractiveTransition:(id)a3;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation _UIPreviewInteractionPresentationTransition

- (_UIPreviewInteractionPresentationTransition)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewInteractionPresentationTransition;
  v2 = [(_UIPreviewInteractionPresentationTransition *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_didScheduleFinishTransition = 0;
    v2->_interactiveTransitionFraction = 0.1;
    v4 = v2;
  }

  return v3;
}

- (double)interactiveTransitionFraction
{
  return self->_interactiveTransitionFraction;
}

- (void)updateInteractiveTransition:(double)a3
{
  if (!self->_didScheduleFinishTransition
    && !self->_didScheduleCancelTransition
    && [(UIViewControllerContextTransitioning *)self->_transitionContext isInteractive])
  {
    id v5 = [(_UIPreviewInteractionPresentationTransition *)self _preparedPresentationAnimator];
    if (([v5 isRunning] & 1) == 0)
    {
      [v5 setFractionComplete:self->_interactiveTransitionFraction * a3];
      [(UIViewControllerContextTransitioning *)self->_transitionContext updateInteractiveTransition:a3];
    }
  }
}

- (void)finishTransition
{
  if (!self->_didScheduleFinishTransition)
  {
    if (self->_transitionContext) {
      [(_UIPreviewInteractionPresentationTransition *)self _performFinishTransition];
    }
    else {
      *(_WORD *)&self->_didScheduleFinishTransition = 1;
    }
  }
}

- (void)cancelTransition
{
  if (!self->_didScheduleCancelTransition)
  {
    if (self->_transitionContext) {
      [(_UIPreviewInteractionPresentationTransition *)self _performCancelTransition];
    }
    else {
      *(_WORD *)&self->_didScheduleFinishTransition = 256;
    }
  }
}

- (double)transitionDuration:(id)a3
{
  v3 = [(_UIPreviewInteractionPresentationTransition *)self _preparedPresentationAnimator];
  [v3 duration];
  double v5 = v4;

  return v5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIPreviewInteractionPresentationTransition *)self _preparedPresentationAnimator];
  [v5 addAnimations:&__block_literal_global_429];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65___UIPreviewInteractionPresentationTransition_animateTransition___block_invoke_2;
  v7[3] = &unk_1E52DC698;
  id v8 = v4;
  id v6 = v4;
  [v5 addCompletion:v7];
  if (self->_shouldPerformAsDismissTransition) {
    [v5 startAnimation];
  }
  else {
    [v5 pauseAnimation];
  }
}

- (void)animationEnded:(BOOL)a3
{
  presentationAnimator = self->_presentationAnimator;
  self->_presentationAnimator = 0;
}

- (void)startInteractiveTransition:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  [(_UIPreviewInteractionPresentationTransition *)self animateTransition:v5];
  if (*(_WORD *)&self->_didScheduleFinishTransition)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74___UIPreviewInteractionPresentationTransition_startInteractiveTransition___block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (BOOL)wantsInteractiveStart
{
  return !self->_didScheduleFinishTransition;
}

- (void)_performFinishTransition
{
  id v5 = [(_UIPreviewInteractionPresentationTransition *)self _preparedPresentationAnimator];
  if ([(_UIPreviewInteractionPresentationTransition *)self _shouldReduceMotion])
  {
    id v3 = [(_UIPreviewInteractionPresentationTransition *)self _newReducedMotionTimingCurveProviderForPreviewTransition];
    [v5 continueAnimationWithTimingParameters:v3 durationFactor:1.0 - self->_interactiveTransitionFraction];
  }
  else
  {
    id v3 = [(_UIPreviewInteractionPresentationTransition *)self _newTimingCurveProviderForPreviewTransition];
    [v5 continueAnimationWithTimingParameters:v3 durationFactor:1.0 - self->_interactiveTransitionFraction];
    id v4 = [(_UIPreviewInteractionPresentationTransition *)self _newPushDecayAnimator];
    [v4 startAnimation];
  }
  [(UIViewControllerContextTransitioning *)self->_transitionContext finishInteractiveTransition];
}

- (void)_performCancelTransition
{
  id v3 = [(_UIPreviewInteractionPresentationTransition *)self _preparedPresentationAnimator];
  [v3 setReversed:1];
  [v3 startAnimation];
  [(UIViewControllerContextTransitioning *)self->_transitionContext cancelInteractiveTransition];
}

- (id)_previewPresentationControllerForTransitionContext:(id)a3
{
  id v4 = [a3 viewControllerForKey:@"UITransitionContextToViewController"];
  id v5 = [(_UIPreviewInteractionPresentationTransition *)self _previewPresentationControllerForViewController:v4];

  return v5;
}

- (id)_previewPresentationControllerForViewController:(id)a3
{
  id v3 = [a3 _existingPresentationControllerImmediate:1 effective:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_preparedPresentationAnimator
{
  p_presentationAnimator = &self->_presentationAnimator;
  presentationAnimator = self->_presentationAnimator;
  if (presentationAnimator)
  {
    id v4 = presentationAnimator;
  }
  else
  {
    id v5 = [[UICubicTimingParameters alloc] initWithAnimationCurve:3];
    id v4 = [[UIViewPropertyAnimator alloc] initWithDuration:v5 timingParameters:0.28];
    objc_storeStrong((id *)p_presentationAnimator, v4);
  }
  return v4;
}

- (id)_newTimingCurveProviderForPreviewTransition
{
  v2 = [UISpringTimingParameters alloc];
  return -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:](v2, "initWithMass:stiffness:damping:initialVelocity:", 0.84, 420.0, 1800.0, 0.0, 0.0);
}

- (id)_newReducedMotionTimingCurveProviderForPreviewTransition
{
  v2 = [UICubicTimingParameters alloc];
  return [(UICubicTimingParameters *)v2 initWithAnimationCurve:0];
}

- (id)_newPushDecayAnimator
{
  id v3 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 18.0, 820.0, 400.0, 0.0, 0.0);
  id v4 = [[UIViewPropertyAnimator alloc] initWithDuration:v3 timingParameters:0.0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68___UIPreviewInteractionPresentationTransition__newPushDecayAnimator__block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  [(UIViewPropertyAnimator *)v4 addAnimations:v6];
  [(UIViewPropertyAnimator *)v4 setUserInteractionEnabled:0];

  return v4;
}

- (void)_applyPushDecayEffectTransformToView:(id)a3
{
  if (a3)
  {
    memset(&v8, 0, sizeof(v8));
    id v3 = a3;
    [v3 transform];
    CGAffineTransform v6 = v8;
    CGAffineTransformScale(&v7, &v6, 1.26, 1.26);
    CGAffineTransform v5 = v7;
    [v3 setTransform:&v5];
    CGAffineTransform v4 = v8;
    [v3 setTransform:&v4];
  }
}

- (BOOL)_shouldReduceMotion
{
  return _AXSReduceMotionEnabled() != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationAnimator, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end