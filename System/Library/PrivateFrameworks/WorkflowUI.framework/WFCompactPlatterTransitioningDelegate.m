@interface WFCompactPlatterTransitioningDelegate
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation WFCompactPlatterTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (([v8 conformsToProtocol:&unk_26E200A18] & 1) == 0)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"WFCompactPlatterTransitioningDelegate.m" lineNumber:28 description:@"Tried to present a view controller that doesn't conform to WFCompactPlatterPresentation"];
  }
  id v10 = v8;
  v11 = [[WFCompactPlatterPresentationController alloc] initWithPresentedViewController:v10 presentingViewController:v9];

  return v11;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3 = [[WFCompactPlatterPresentationAnimator alloc] initForPresenting:0];
  return v3;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5 = [[WFCompactPlatterPresentationAnimator alloc] initForPresenting:1];
  return v5;
}

@end