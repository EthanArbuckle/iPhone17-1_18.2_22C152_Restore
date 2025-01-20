@interface PKCancelingAnimatedTransitioningHandler
- (BOOL)wantsInteractiveStart;
- (double)transitionDuration:(id)a3;
- (id)cancelationHandler;
- (void)_updateWithTransitionContext:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)setCancelationHandler:(id)a3;
- (void)startInteractiveTransition:(id)a3;
@end

@implementation PKCancelingAnimatedTransitioningHandler

- (void)_updateWithTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
  id v5 = a3;
  id obj = [v5 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v6 = [v5 viewForKey:*MEMORY[0x1E4FB30C0]];
  objc_storeWeak((id *)&self->_presentingVC, obj);
  objc_storeWeak((id *)&self->_presentingView, v6);
  v7 = [v5 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v8 = [v5 viewForKey:*MEMORY[0x1E4FB30D0]];

  objc_storeWeak((id *)&self->_presentedVC, v7);
  objc_storeWeak((id *)&self->_presentedView, v8);
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animationEnded:(BOOL)a3
{
  if (!self->_completed)
  {
    cancelationHandler = (void (**)(id, id))self->_cancelationHandler;
    if (cancelationHandler)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingVC);
      cancelationHandler[2](cancelationHandler, WeakRetained);

      id v6 = self->_cancelationHandler;
      self->_cancelationHandler = 0;
    }
    self->_completed = 1;
    objc_storeWeak((id *)&self->_presentingView, 0);
    objc_storeWeak((id *)&self->_presentingVC, 0);
    objc_storeWeak((id *)&self->_presentedVC, 0);
    objc_storeWeak((id *)&self->_presentedView, 0);
    transitionContext = self->_transitionContext;
    self->_transitionContext = 0;
  }
}

- (void)startInteractiveTransition:(id)a3
{
  [(PKCancelingAnimatedTransitioningHandler *)self _updateWithTransitionContext:a3];
  [(UIViewControllerContextTransitioning *)self->_transitionContext pauseInteractiveTransition];
  [(UIViewControllerContextTransitioning *)self->_transitionContext cancelInteractiveTransition];
  transitionContext = self->_transitionContext;

  [(UIViewControllerContextTransitioning *)transitionContext completeTransition:0];
}

- (BOOL)wantsInteractiveStart
{
  return 0;
}

- (id)cancelationHandler
{
  return self->_cancelationHandler;
}

- (void)setCancelationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelationHandler, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_destroyWeak((id *)&self->_presentedView);
  objc_destroyWeak((id *)&self->_presentedVC);
  objc_destroyWeak((id *)&self->_presentingView);

  objc_destroyWeak((id *)&self->_presentingVC);
}

@end