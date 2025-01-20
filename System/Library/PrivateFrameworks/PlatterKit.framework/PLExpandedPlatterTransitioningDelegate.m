@interface PLExpandedPlatterTransitioningDelegate
- (UIPresentationController)_presentationController;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_setPresentationController:(id)a3;
- (void)viewControllerAnimator:(id)a3 willBeginDismissalAnimationWithTransitionContext:(id)a4;
- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4;
@end

@implementation PLExpandedPlatterTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = a5;
  v7 = objc_msgSend(v6, "pl_containingClickPresentationInteractionPresentingViewController");
  v8 = v7;
  if (v7) {
    [v7 viewForPreview];
  }
  else {
  v9 = [v6 view];
  }
  id v10 = [[PLViewControllerAnimator alloc] initForPresentation:1 withSourceView:v9];
  if (objc_opt_respondsToSelector())
  {
    v11 = [v8 clickPresentationInteractionManager];
  }
  else
  {
    v11 = 0;
  }
  if ([v11 hasCommittedToPresentation]) {
    uint64_t v12 = [v11 didInteractionInitiateWithHint];
  }
  else {
    uint64_t v12 = 0;
  }
  [v10 setIncludePresentingViewInAnimation:v12];
  if (-[UIPresentationController conformsToProtocol:](self->_presentationController, "conformsToProtocol:", &unk_1F33694A0))[v10 addObserver:self->_presentationController]; {
  [v10 addObserver:self];
  }

  return v10;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v4 presenter], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    v7 = [v5 viewForPreview];
  }
  else
  {
    v8 = [v4 presentingViewController];
    v7 = [v8 view];

    id v6 = 0;
  }
  v9 = off_1E6B5F468;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v4 viewControllerTransitionTypeForTransitionDelegate:self] == 1)
  {
    v9 = &off_1E6B5F470;
  }
  id v10 = (void *)[objc_alloc(*v9) initForPresentation:0 withSourceView:v7];
  if (objc_opt_respondsToSelector())
  {
    v11 = [v6 clickPresentationInteractionManager];
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v10, "setIncludePresentingViewInAnimation:", objc_msgSend(v11, "didInteractionInitiateWithHint"));
  if (-[UIPresentationController conformsToProtocol:](self->_presentationController, "conformsToProtocol:", &unk_1F33694A0))[v10 addObserver:self->_presentationController]; {
  [v10 addObserver:self];
  }

  return v10;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  presentationController = self->_presentationController;
  if (!presentationController)
  {
    id v10 = a5;
    id v11 = a4;
    uint64_t v12 = objc_msgSend(v10, "pl_containingClickPresentationInteractionPresentingViewController");
    v13 = [v12 viewForPreview];
    if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v8 setPresenter:v12];
    }
    v14 = [[PLExpandedPlatterPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v11 sourceViewController:v10 sourceView:v13];

    v15 = self->_presentationController;
    self->_presentationController = &v14->super;

    presentationController = self->_presentationController;
  }
  v16 = presentationController;

  return v16;
}

- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v7 viewControllerForKey:*MEMORY[0x1E4F43EC0]];
  v9 = [v8 transitionCoordinator];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __117__PLExpandedPlatterTransitioningDelegate_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke;
  v10[3] = &unk_1E6B5FAF0;
  objc_copyWeak(&v11, &location);
  [v9 animateAlongsideTransition:0 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __117__PLExpandedPlatterTransitioningDelegate_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = [v3 isCancelled];

  if (v2) {
    [WeakRetained _setPresentationController:0];
  }
}

- (void)viewControllerAnimator:(id)a3 willBeginDismissalAnimationWithTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v7 viewControllerForKey:*MEMORY[0x1E4F43EB0]];
  v9 = [v8 transitionCoordinator];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __114__PLExpandedPlatterTransitioningDelegate_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext___block_invoke;
  v10[3] = &unk_1E6B5FAF0;
  objc_copyWeak(&v11, &location);
  [v9 animateAlongsideTransition:0 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __114__PLExpandedPlatterTransitioningDelegate_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LOBYTE(v2) = [v3 isCancelled];

  if ((v2 & 1) == 0) {
    [WeakRetained _setPresentationController:0];
  }
}

- (UIPresentationController)_presentationController
{
  return self->_presentationController;
}

- (void)_setPresentationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end