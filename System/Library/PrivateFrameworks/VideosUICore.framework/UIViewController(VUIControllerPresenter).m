@interface UIViewController(VUIControllerPresenter)
- (void)presentViewController:()VUIControllerPresenter modalPresentationStyle:animated:completion:;
@end

@implementation UIViewController(VUIControllerPresenter)

- (void)presentViewController:()VUIControllerPresenter modalPresentationStyle:animated:completion:
{
  id v10 = a6;
  id v11 = a3;
  [v11 setModalPresentationStyle:a4];
  [a1 presentViewController:v11 animated:a5 completion:v10];
}

@end