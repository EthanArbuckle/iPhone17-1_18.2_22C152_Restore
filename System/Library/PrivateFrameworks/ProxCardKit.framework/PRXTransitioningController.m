@interface PRXTransitioningController
- (PRXPullDismissalProvider)pullDismissalProvider;
- (PRXTransitioningController)initWithPullDismissalProvider:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)interactionControllerForDismissal:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation PRXTransitioningController

- (PRXTransitioningController)initWithPullDismissalProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRXTransitioningController;
  v5 = [(PRXTransitioningController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pullDismissalProvider, v4);
    v7 = v6;
  }

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[PRXCardSlideUpPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pullDismissalProvider);
  id v4 = [WeakRetained pullDismissalInteractionDriver];
  v5 = [v4 animationController];

  return v5;
}

- (id)interactionControllerForDismissal:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pullDismissalProvider);
  id v4 = [WeakRetained pullDismissalInteractionDriver];
  v5 = [v4 interactionController];

  return v5;
}

- (PRXPullDismissalProvider)pullDismissalProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pullDismissalProvider);
  return (PRXPullDismissalProvider *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end