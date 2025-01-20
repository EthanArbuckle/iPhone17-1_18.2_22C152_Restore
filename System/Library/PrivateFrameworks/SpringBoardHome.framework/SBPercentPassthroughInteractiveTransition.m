@interface SBPercentPassthroughInteractiveTransition
- (BOOL)supportsRestarting;
- (SBPercentPassthroughInteractiveTransition)init;
- (double)completionSpeed;
- (int64_t)completionCurve;
- (void)cancelTransition;
- (void)finishInteractiveTransition;
- (void)setCompletionCurve:(int64_t)a3;
- (void)setCompletionSpeed:(double)a3;
- (void)startInteractiveTransition:(id)a3;
- (void)updateTransition:(double)a3;
@end

@implementation SBPercentPassthroughInteractiveTransition

- (SBPercentPassthroughInteractiveTransition)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBPercentPassthroughInteractiveTransition;
  v2 = [(SBPercentPassthroughInteractiveTransition *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SBPercentPassthroughInteractiveTransition *)v2 setCompletionSpeed:1.0];
    [(SBPercentPassthroughInteractiveTransition *)v3 setCompletionCurve:0];
  }
  return v3;
}

- (void)updateTransition:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  [WeakRetained updateInteractiveTransition:a3];
}

- (void)finishInteractiveTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  [WeakRetained finishInteractiveTransition];
}

- (void)cancelTransition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  [WeakRetained cancelTransition];
}

- (void)startInteractiveTransition:(id)a3
{
}

- (BOOL)supportsRestarting
{
  return 1;
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
}

@end