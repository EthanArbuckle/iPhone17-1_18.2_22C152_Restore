@interface UINavigationController(CustomTransitions)
- (id)pu_currentInteractiveTransition;
- (id)pu_currentNavigationTransition;
- (uint64_t)pu_navigationTransitionWillEnd:()CustomTransitions;
- (uint64_t)pu_popViewControllerAnimated:()CustomTransitions interactive:;
- (void)_pu_setCurrentNavigationTransition:()CustomTransitions;
- (void)pu_navigationTransitionWillStart:()CustomTransitions;
- (void)pu_popToViewController:()CustomTransitions animated:interactive:;
- (void)pu_pushViewController:()CustomTransitions withTransition:animated:isInteractive:;
@end

@implementation UINavigationController(CustomTransitions)

- (id)pu_currentNavigationTransition
{
  return objc_getAssociatedObject(a1, "com.apple.photosui.currentNavigationTransition");
}

- (uint64_t)pu_navigationTransitionWillEnd:()CustomTransitions
{
  id v5 = a3;
  objc_msgSend(a1, "pu_currentNavigationTransition");
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"UINavigationController+CustomTransitions.m" lineNumber:86 description:@"unexpected current navigation transition"];
  }
  return objc_msgSend(a1, "_pu_setCurrentNavigationTransition:", 0);
}

- (void)pu_navigationTransitionWillStart:()CustomTransitions
{
  id v7 = a3;
  id v5 = objc_msgSend(a1, "pu_currentNavigationTransition");

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"UINavigationController+CustomTransitions.m" lineNumber:81 description:@"current navigation transition already exists"];
  }
  objc_msgSend(a1, "_pu_setCurrentNavigationTransition:", v7);
}

- (void)_pu_setCurrentNavigationTransition:()CustomTransitions
{
}

- (id)pu_currentInteractiveTransition
{
  v1 = [a1 topViewController];
  v2 = objc_msgSend(v1, "pu_currentInteractiveNavigationTransition");

  return v2;
}

- (void)pu_popToViewController:()CustomTransitions animated:interactive:
{
  id v13 = a3;
  v8 = [a1 topViewController];
  v9 = objc_msgSend(v8, "pu_navigationTransition");
  v10 = v9;
  if (a4) {
    [v9 setStartedInteractively:a5];
  }
  [v10 transitionWillStartOperation:2 animated:a4 interactive:a5];
  if (v13) {
    id v11 = (id)[a1 popToViewController:v13 animated:a4];
  }
  else {
    id v12 = (id)[a1 popViewControllerAnimated:a4];
  }
  [v10 transitionDidStartOperation:2 animated:a4 interactive:a5];
}

- (uint64_t)pu_popViewControllerAnimated:()CustomTransitions interactive:
{
  return objc_msgSend(a1, "pu_popToViewController:animated:interactive:", 0, a3, a4);
}

- (void)pu_pushViewController:()CustomTransitions withTransition:animated:isInteractive:
{
  id v15 = a3;
  id v10 = a4;
  objc_msgSend(v15, "pu_setNavigationTransition:", v10);
  [v10 setStartedInteractively:a6];
  uint64_t v11 = [a1 _useStandardStatusBarHeight];
  id v12 = [a1 topViewController];
  int v13 = [v12 prefersStatusBarHidden];
  int v14 = [v15 prefersStatusBarHidden];

  if (v13 == v14)
  {
    [v10 transitionWillStartOperation:1 animated:a5 interactive:a6];
    [a1 pushViewController:v15 animated:a5];
    [v10 transitionDidStartOperation:1 animated:a5 interactive:a6];
  }
  else
  {
    [a1 _setUseStandardStatusBarHeight:1];
    [v10 transitionWillStartOperation:1 animated:a5 interactive:a6];
    [a1 pushViewController:v15 animated:a5];
    [v10 transitionDidStartOperation:1 animated:a5 interactive:a6];
    [a1 _setUseStandardStatusBarHeight:v11];
  }
}

@end