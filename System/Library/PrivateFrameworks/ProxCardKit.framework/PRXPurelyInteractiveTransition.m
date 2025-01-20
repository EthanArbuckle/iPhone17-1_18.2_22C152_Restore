@interface PRXPurelyInteractiveTransition
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
@end

@implementation PRXPurelyInteractiveTransition

- (void)finishInteractiveTransition
{
  v4.receiver = self;
  v4.super_class = (Class)PRXPurelyInteractiveTransition;
  [(UIPercentDrivenInteractiveTransition *)&v4 finishInteractiveTransition];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  [WeakRetained completeTransition:1];
}

- (void)cancelInteractiveTransition
{
  v4.receiver = self;
  v4.super_class = (Class)PRXPurelyInteractiveTransition;
  [(UIPercentDrivenInteractiveTransition *)&v4 cancelInteractiveTransition];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  [WeakRetained completeTransition:0];
}

- (void)animateTransition:(id)a3
{
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void).cxx_destruct
{
}

@end