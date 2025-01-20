@interface PRXPullDismissalInteractionDriver
- (PRXPullDismissalInteractionDriver)initWithPresentedViewController:(id)a3 scrollView:(id)a4;
- (PRXPullDismissalScrollView)scrollView;
- (UIViewController)presentedViewController;
- (UIViewControllerAnimatedTransitioning)animationController;
- (UIViewControllerInteractiveTransitioning)interactionController;
- (void)_finishPullToDismiss;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
@end

@implementation PRXPullDismissalInteractionDriver

- (PRXPullDismissalInteractionDriver)initWithPresentedViewController:(id)a3 scrollView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PRXPullDismissalInteractionDriver;
  v8 = [(PRXPullDismissalInteractionDriver *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentedViewController, v6);
    id v10 = objc_storeWeak((id *)&v9->_scrollView, v7);
    [v7 setDelegate:v9];

    v11 = v9;
  }

  return v9;
}

- (UIViewControllerAnimatedTransitioning)animationController
{
  return (UIViewControllerAnimatedTransitioning *)self->_interactiveTransition;
}

- (UIViewControllerInteractiveTransitioning)interactionController
{
  return (UIViewControllerInteractiveTransitioning *)self->_interactiveTransition;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (!self->_interactiveTransition)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    int v5 = [WeakRetained allowsPullToDismiss];

    if (v5)
    {
      id v6 = objc_alloc_init(PRXPurelyInteractiveTransition);
      interactiveTransition = self->_interactiveTransition;
      self->_interactiveTransition = v6;

      id v9 = objc_loadWeakRetained((id *)&self->_presentedViewController);
      v8 = [v9 presentingViewController];
      [v8 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  interactiveTransition = self->_interactiveTransition;
  if (interactiveTransition)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    [WeakRetained dismissalPercent];
    -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](interactiveTransition, "updateInteractiveTransition:");
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(PRXPullDismissalInteractionDriver *)self _finishPullToDismiss];
  }
}

- (void)_finishPullToDismiss
{
  if (self->_interactiveTransition)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    [WeakRetained dismissalPercent];
    double v5 = v4;

    interactiveTransition = self->_interactiveTransition;
    if (v5 >= 1.0) {
      [(PRXPurelyInteractiveTransition *)interactiveTransition finishInteractiveTransition];
    }
    else {
      [(PRXPurelyInteractiveTransition *)interactiveTransition cancelInteractiveTransition];
    }
    id v7 = self->_interactiveTransition;
    self->_interactiveTransition = 0;
  }
}

- (PRXPullDismissalScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (PRXPullDismissalScrollView *)WeakRetained;
}

- (UIViewController)presentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_interactiveTransition, 0);
}

@end