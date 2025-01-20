@interface UIViewController(SettingsPop)
- (void)popViewControllerAnimated:()SettingsPop;
@end

@implementation UIViewController(SettingsPop)

- (void)popViewControllerAnimated:()SettingsPop
{
  v5 = [a1 navigationController];
  v6 = [v5 viewControllers];
  v7 = [a1 parentViewController];
  int v8 = [v6 containsObject:v7];

  id v12 = [a1 navigationController];
  if (v8)
  {
    v9 = [a1 parentViewController];
    id v10 = (id)[v12 popToViewController:v9 animated:a3];
  }
  else
  {
    id v11 = (id)[v12 popToViewController:a1 animated:a3];
  }
}

@end