@interface PUModalTransition
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)interactionControllerForDismissal:(id)a3;
- (id)interactionControllerForPresentation:(id)a3;
- (id)presentingViewController;
- (int64_t)_operation;
- (void)_setOperation:(int64_t)a3;
- (void)animateTransition:(id)a3;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
- (void)imageModulationIntensityDidChange;
@end

@implementation PUModalTransition

- (void)_setOperation:(int64_t)a3
{
  self->__operation = a3;
}

- (int64_t)_operation
{
  return self->__operation;
}

- (id)interactionControllerForDismissal:(id)a3
{
  [(PUModalTransition *)self _setOperation:1];
  return [(PUViewControllerTransition *)self interactiveTransition];
}

- (id)interactionControllerForPresentation:(id)a3
{
  [(PUModalTransition *)self _setOperation:0];
  return [(PUViewControllerTransition *)self interactiveTransition];
}

- (id)animationControllerForDismissedController:(id)a3
{
  return self;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return self;
}

- (void)animateTransition:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUModalTransition;
  [(PUViewControllerTransition *)&v4 animateTransition:a3];
  if ([(PUModalTransition *)self _operation])
  {
    if ([(PUModalTransition *)self _operation] == 1) {
      [(PUModalTransition *)self animateDismissTransition];
    }
  }
  else
  {
    [(PUModalTransition *)self animatePresentTransition];
  }
}

- (void)cancelInteractiveTransition
{
  if ([(PUViewControllerTransition *)self isInteractive])
  {
    if ([(PUModalTransition *)self _operation])
    {
      if ([(PUModalTransition *)self _operation] == 1) {
        [(PUModalTransition *)self completeInteractiveDismissTransitionFinished:0];
      }
    }
    else
    {
      [(PUModalTransition *)self completeInteractivePresentTransitionFinished:0];
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)PUModalTransition;
  [(PUViewControllerTransition *)&v3 cancelInteractiveTransition];
}

- (void)finishInteractiveTransition
{
  if ([(PUViewControllerTransition *)self isInteractive])
  {
    if ([(PUModalTransition *)self _operation])
    {
      if ([(PUModalTransition *)self _operation] == 1) {
        [(PUModalTransition *)self completeInteractiveDismissTransitionFinished:1];
      }
    }
    else
    {
      [(PUModalTransition *)self completeInteractivePresentTransitionFinished:1];
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)PUModalTransition;
  [(PUViewControllerTransition *)&v3 finishInteractiveTransition];
}

- (id)presentingViewController
{
  int64_t v3 = [(PUModalTransition *)self _operation];
  if (v3 == 1)
  {
    objc_super v4 = [(PUViewControllerTransition *)self toViewController];
  }
  else if (v3)
  {
    objc_super v4 = 0;
  }
  else
  {
    objc_super v4 = [(PUViewControllerTransition *)self fromViewController];
  }
  return v4;
}

- (void)imageModulationIntensityDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUModalTransition;
  [(PUViewControllerTransition *)&v4 imageModulationIntensityDidChange];
  int64_t v3 = [(PUModalTransition *)self presentingViewController];
  objc_msgSend(v3, "px_setNeedsImageModulationIntensityUpdate");
}

@end