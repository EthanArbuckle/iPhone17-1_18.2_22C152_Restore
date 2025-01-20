@interface UINavigationController
- (void)mt_hideNavigationBarOnFirstScreen;
- (void)mt_popToRootViewController;
- (void)mt_popToRootViewControllerAnimated:(BOOL)a3;
- (void)mt_popToRootViewControllerAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation UINavigationController

- (void)mt_popToRootViewController
{
  id v2 = [(UINavigationController *)self popToRootViewControllerAnimated:0];
}

- (void)mt_popToRootViewControllerAnimated:(BOOL)a3
{
  id v3 = [(UINavigationController *)self popToRootViewControllerAnimated:a3];
}

- (void)mt_popToRootViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    +[CATransaction begin];
    +[CATransaction setCompletionBlock:v5];

    id v6 = [(UINavigationController *)self popToRootViewControllerAnimated:1];
    +[CATransaction commit];
  }
  else
  {
    v8 = (void (**)(void))a4;
    id v7 = [(UINavigationController *)self popToRootViewControllerAnimated:0];
    v8[2]();
  }
}

- (void)mt_hideNavigationBarOnFirstScreen
{
  id v3 = [(UINavigationController *)self viewControllers];
  BOOL v4 = (unint64_t)[v3 count] < 2;

  [(UINavigationController *)self setNavigationBarHidden:v4];
}

@end