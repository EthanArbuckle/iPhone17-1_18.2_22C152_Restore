@interface _UIPreviewInteractionDismissTransition
- (_UIPreviewInteractionDismissTransition)init;
- (double)transitionDuration:(id)a3;
- (id)_preparedDismissAnimator;
- (void)animateTransition:(id)a3;
@end

@implementation _UIPreviewInteractionDismissTransition

- (_UIPreviewInteractionDismissTransition)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewInteractionDismissTransition;
  v2 = [(_UIPreviewInteractionDismissTransition *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (double)transitionDuration:(id)a3
{
  v3 = [(_UIPreviewInteractionDismissTransition *)self _preparedDismissAnimator];
  [v3 duration];
  double v5 = v4;

  return v5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIPreviewInteractionDismissTransition *)self _preparedDismissAnimator];
  [v5 addAnimations:&__block_literal_global_428];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60___UIPreviewInteractionDismissTransition_animateTransition___block_invoke_2;
  v7[3] = &unk_1E52DC698;
  id v8 = v4;
  id v6 = v4;
  [v5 addCompletion:v7];
  [v5 startAnimation];
}

- (id)_preparedDismissAnimator
{
  p_dismissAnimator = &self->_dismissAnimator;
  dismissAnimator = self->_dismissAnimator;
  if (dismissAnimator)
  {
    id v4 = dismissAnimator;
  }
  else
  {
    double v5 = [[UICubicTimingParameters alloc] initWithAnimationCurve:0];
    id v4 = [[UIViewPropertyAnimator alloc] initWithDuration:v5 timingParameters:0.2];
    objc_storeStrong((id *)p_dismissAnimator, v4);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAnimator, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end