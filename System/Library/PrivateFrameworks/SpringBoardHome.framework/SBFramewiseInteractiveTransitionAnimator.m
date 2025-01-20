@interface SBFramewiseInteractiveTransitionAnimator
- (BOOL)isPresenting;
- (BOOL)supportsRestarting;
- (SBFramewiseInteractiveTransitionAnimatorDelegate)delegate;
- (double)percentComplete;
- (double)percentVisible;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5;
- (void)setDelegate:(id)a3;
- (void)setPresenting:(BOOL)a3;
- (void)updateTransition:(id)a3 withPercentComplete:(double)a4;
@end

@implementation SBFramewiseInteractiveTransitionAnimator

- (void)updateTransition:(id)a3 withPercentComplete:(double)a4
{
  self->_percentComplete = a4;
  p_delegate = &self->_delegate;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained transitionContext:v6 updateTransitionProgress:a4];
}

- (void)finishInteractiveTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v5 = a3;
  objc_msgSend(v5, "completeTransition:", objc_msgSend(v5, "transitionWasCancelled") ^ 1);
}

- (void)cancelTransition:(id)a3 withCompletionSpeed:(double)a4 completionCurve:(int64_t)a5
{
  id v5 = a3;
  objc_msgSend(v5, "completeTransition:", objc_msgSend(v5, "transitionWasCancelled") ^ 1);
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  if ([v4 isAnimated])
  {
    id v5 = (void *)MEMORY[0x1E4FB1EB0];
    [(SBFramewiseInteractiveTransitionAnimator *)self transitionDuration:v4];
    double v7 = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__SBFramewiseInteractiveTransitionAnimator_animateTransition___block_invoke;
    v10[3] = &unk_1E6AACA90;
    v10[4] = self;
    id v11 = v4;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__SBFramewiseInteractiveTransitionAnimator_animateTransition___block_invoke_2;
    v8[3] = &unk_1E6AACAB8;
    id v9 = v11;
    [v5 animateWithDuration:v10 animations:v8 completion:v7];
  }
  else
  {
    objc_msgSend(v4, "completeTransition:", objc_msgSend(v4, "transitionWasCancelled") ^ 1);
  }
}

uint64_t __62__SBFramewiseInteractiveTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTransition:*(void *)(a1 + 40) withPercentComplete:1.0];
}

uint64_t __62__SBFramewiseInteractiveTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isTransitioning];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v3 transitionWasCancelled] ^ 1;
    return [v3 completeTransition:v4];
  }
  return result;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (BOOL)supportsRestarting
{
  return 1;
}

- (double)percentVisible
{
  BOOL presenting = self->_presenting;
  [(SBFramewiseInteractiveTransitionAnimator *)self percentComplete];
  if (!presenting) {
    return 1.0 - result;
  }
  return result;
}

- (SBFramewiseInteractiveTransitionAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFramewiseInteractiveTransitionAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_BOOL presenting = a3;
}

- (void).cxx_destruct
{
}

@end