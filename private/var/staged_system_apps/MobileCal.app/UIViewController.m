@interface UIViewController
- (BOOL)prefersForcedModalShowViewController;
- (BOOL)prefersToBePresentedFromApplicationRootViewController;
- (BOOL)prefersToBePresentedFromUINavigationController;
- (UINavigationController)viewControllerToShowFrom;
- (UIViewController)modalPresentationDelegate;
- (int64_t)presentationStyleOverrideForChildViewControllers;
- (void)setModalPresentationDelegate:(id)a3;
@end

@implementation UIViewController

- (UINavigationController)viewControllerToShowFrom
{
  v2 = [(UIViewController *)self targetViewControllerForAction:"showViewController:sender:animated:completion:" sender:0];
  objc_opt_class();
  id v3 = 0;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }

  return (UINavigationController *)v3;
}

- (void)setModalPresentationDelegate:(id)a3
{
  id v6 = a3;
  v4 = objc_getAssociatedObject(self, &unk_1002165F0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v4 isEqual:v6] & 1) == 0)
  {
    id v5 = v6;

    objc_setAssociatedObject(self, &unk_1002165F0, v5, 0);
    v4 = v5;
  }
}

- (UIViewController)modalPresentationDelegate
{
  v2 = objc_getAssociatedObject(self, &unk_1002165F0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (UIViewController *)v3;
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  id v3 = [(UIViewController *)self ekui_futureTraitCollection];
  if (![v3 horizontalSizeClass])
  {

    return 6;
  }
  v4 = [(UIViewController *)self ekui_futureTraitCollection];
  id v5 = [v4 horizontalSizeClass];

  if (v5 == (id)1) {
    return 6;
  }
  id v6 = [(UIViewController *)self ekui_futureTraitCollection];
  id v7 = [v6 horizontalSizeClass];

  if (v7 != (id)2) {
    return -1;
  }
  v8 = [(UIViewController *)self ekui_futureTraitCollection];
  id v9 = [v8 verticalSizeClass];

  if (v9 == (id)1) {
    return 1;
  }
  else {
    return 7;
  }
}

- (BOOL)prefersForcedModalShowViewController
{
  return 0;
}

- (BOOL)prefersToBePresentedFromApplicationRootViewController
{
  return 0;
}

- (BOOL)prefersToBePresentedFromUINavigationController
{
  return 0;
}

@end