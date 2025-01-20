@interface _SiriUINavigationControllerDelegateAdapter
- (SiriUINavigationTransitioning)transitionController;
- (UINavigationControllerDelegate)externalDelegate;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4;
- (int64_t)navigationControllerPreferredInterfaceOrientationForPresentation:(id)a3;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setExternalDelegate:(id)a3;
- (void)setTransitionController:(id)a3;
@end

@implementation _SiriUINavigationControllerDelegateAdapter

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = a4;
  v9 = [(_SiriUINavigationControllerDelegateAdapter *)self externalDelegate];
  if (objc_opt_respondsToSelector()) {
    [v9 navigationController:v12 willShowViewController:v8 animated:v5];
  }
  v10 = [(_SiriUINavigationControllerDelegateAdapter *)self transitionController];
  if (objc_opt_respondsToSelector())
  {
    v11 = [v12 transitionCoordinator];
    [v10 coordinateAdditionalTransitionsWithTransitionCoordinator:v11];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  v9 = [(_SiriUINavigationControllerDelegateAdapter *)self externalDelegate];
  if (objc_opt_respondsToSelector()) {
    [v9 navigationController:v10 didShowViewController:v8 animated:v5];
  }
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_SiriUINavigationControllerDelegateAdapter *)self externalDelegate];
  if (objc_opt_respondsToSelector()) {
    unint64_t v6 = [v5 navigationControllerSupportedInterfaceOrientations:v4];
  }
  else {
    unint64_t v6 = 30;
  }

  return v6;
}

- (int64_t)navigationControllerPreferredInterfaceOrientationForPresentation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_SiriUINavigationControllerDelegateAdapter *)self externalDelegate];
  if (objc_opt_respondsToSelector()) {
    int64_t v6 = [v5 navigationControllerPreferredInterfaceOrientationForPresentation:v4];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [(_SiriUINavigationControllerDelegateAdapter *)self transitionController];
  if (objc_opt_respondsToSelector()) {
    [v13 setOperation:a4];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v13 animationController], (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15 = [(_SiriUINavigationControllerDelegateAdapter *)self externalDelegate];
    if (objc_opt_respondsToSelector())
    {
      v14 = [v15 navigationController:v10 animationControllerForOperation:a4 fromViewController:v11 toViewController:v12];
    }
    else
    {
      v14 = 0;
    }
  }
  return v14;
}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_SiriUINavigationControllerDelegateAdapter *)self transitionController];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v8 interactionControllerForAnimationController:v7],
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v10 = [(_SiriUINavigationControllerDelegateAdapter *)self externalDelegate];
    if (objc_opt_respondsToSelector())
    {
      v9 = [v10 navigationController:v6 interactionControllerForAnimationController:v7];
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

- (UINavigationControllerDelegate)externalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalDelegate);
  return (UINavigationControllerDelegate *)WeakRetained;
}

- (void)setExternalDelegate:(id)a3
{
}

- (SiriUINavigationTransitioning)transitionController
{
  return self->_transitionController;
}

- (void)setTransitionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_destroyWeak((id *)&self->_externalDelegate);
}

@end