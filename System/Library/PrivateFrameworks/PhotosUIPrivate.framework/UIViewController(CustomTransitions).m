@interface UIViewController(CustomTransitions)
- (id)pu_currentInteractiveModalTransition;
- (id)pu_currentInteractiveNavigationTransition;
- (id)pu_modalTransition;
- (id)pu_navigationTransition;
- (void)pu_dismissViewControllerAnimated:()CustomTransitions interactive:completion:;
- (void)pu_presentViewController:()CustomTransitions transition:animated:interactive:completion:;
- (void)pu_removeNavigationTransition;
- (void)pu_restoreNavigationTransition;
- (void)pu_setModalTransition:()CustomTransitions;
- (void)pu_setNavigationTransition:()CustomTransitions;
@end

@implementation UIViewController(CustomTransitions)

- (void)pu_dismissViewControllerAnimated:()CustomTransitions interactive:completion:
{
  id v8 = a5;
  v9 = [a1 presentedViewController];
  v10 = objc_msgSend(v9, "pu_modalTransition");
  v11 = v10;
  if (a3) {
    [v10 setStartedInteractively:a4];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__UIViewController_CustomTransitions__pu_dismissViewControllerAnimated_interactive_completion___block_invoke;
  v15[3] = &unk_1E5F2EBC8;
  id v16 = v11;
  id v17 = v9;
  id v18 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v11;
  [a1 dismissViewControllerAnimated:a3 completion:v15];
}

- (void)pu_presentViewController:()CustomTransitions transition:animated:interactive:completion:
{
  id v13 = a7;
  id v14 = a4;
  id v17 = a3;
  v15 = [v17 transitioningDelegate];

  if (v15)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"UIViewController+CustomTransitions.m" lineNumber:72 description:@"expected no transitioningDelegate"];
  }
  [v17 setTransitioningDelegate:v14];
  objc_msgSend(v17, "pu_setModalTransition:", v14);
  [v14 setStartedInteractively:a6];

  [a1 presentViewController:v17 animated:a5 completion:v13];
}

- (id)pu_currentInteractiveNavigationTransition
{
  v1 = objc_msgSend(a1, "pu_navigationTransition");
  if (([v1 isInteractive] & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (id)pu_currentInteractiveModalTransition
{
  v1 = objc_msgSend(a1, "pu_modalTransition");
  if (([v1 isInteractive] & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (void)pu_restoreNavigationTransition
{
  objc_getAssociatedObject(a1, "com.apple.photosui.previousNavigationTransition");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pu_setNavigationTransition:", v2);
}

- (void)pu_removeNavigationTransition
{
  objc_msgSend(a1, "pu_navigationTransition");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "com.apple.photosui.previousNavigationTransition", v2, (void *)1);
  objc_msgSend(a1, "pu_setNavigationTransition:", 0);
}

- (void)pu_setNavigationTransition:()CustomTransitions
{
}

- (id)pu_navigationTransition
{
  return objc_getAssociatedObject(a1, "com.apple.photosui.navigationTransition");
}

- (void)pu_setModalTransition:()CustomTransitions
{
}

- (id)pu_modalTransition
{
  return objc_getAssociatedObject(a1, "com.apple.photosui.modalTransition");
}

@end