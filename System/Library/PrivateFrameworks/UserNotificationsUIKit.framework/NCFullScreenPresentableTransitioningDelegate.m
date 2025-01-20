@interface NCFullScreenPresentableTransitioningDelegate
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6;
@end

@implementation NCFullScreenPresentableTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  return [(NCFullScreenPresentableTransitioningDelegate *)self animationControllerForPresentedController:a3 presentingController:a4 sourceController:a5 userInfo:0];
}

- (id)animationControllerForDismissedController:(id)a3
{
  return [(NCFullScreenPresentableTransitioningDelegate *)self animationControllerForDismissedController:a3 userInfo:0];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5 userInfo:(id)a6
{
  id v6 = a3;
  if (objc_opt_respondsToSelector()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)animationControllerForDismissedController:(id)a3 userInfo:(id)a4
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

@end