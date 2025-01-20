@interface SBSpotlightTransitionInteractor
- (SBSpotlightTransitionInteractor)init;
- (SBSpotlightTransitionInteractor)initWithAnimator:(id)a3;
- (double)completionSpeed;
- (int64_t)completionCurve;
- (void)setCompletionCurve:(int64_t)a3;
- (void)setCompletionSpeed:(double)a3;
- (void)startInteractiveTransition:(id)a3;
- (void)updateTransition:(double)a3;
@end

@implementation SBSpotlightTransitionInteractor

- (SBSpotlightTransitionInteractor)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSpotlightTransitionAnimator.m" lineNumber:374 description:@"use initWithAnimator:..."];

  return 0;
}

- (SBSpotlightTransitionInteractor)initWithAnimator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSpotlightTransitionInteractor;
  v5 = [(SBSpotlightTransitionInteractor *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_animator, v4);
    [(SBSpotlightTransitionInteractor *)v6 setCompletionSpeed:1.0];
    [(SBSpotlightTransitionInteractor *)v6 setCompletionCurve:0];
  }

  return v6;
}

- (void)updateTransition:(double)a3
{
}

- (void)startInteractiveTransition:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animator);
  [WeakRetained animateTransition:self->_transitionContext];
}

- (double)completionSpeed
{
  return self->_completionSpeed;
}

- (void)setCompletionSpeed:(double)a3
{
  self->_completionSpeed = a3;
}

- (int64_t)completionCurve
{
  return self->_completionCurve;
}

- (void)setCompletionCurve:(int64_t)a3
{
  self->_completionCurve = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animator);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end