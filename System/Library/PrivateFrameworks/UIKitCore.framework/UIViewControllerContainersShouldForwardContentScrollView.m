@interface UIViewControllerContainersShouldForwardContentScrollView
@end

@implementation UIViewControllerContainersShouldForwardContentScrollView

void ___UIViewControllerContainersShouldForwardContentScrollView_block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v0 objectForKey:@"UIViewControllerContainersShouldForwardContentScrollView"];

  v1 = v3;
  if (v3
    || (_UIKitPreferencesOnce(),
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 objectForKey:@"UIViewControllerContainersShouldForwardContentScrollView"],
        id v4 = (id)objc_claimAutoreleasedReturnValue(),
        v2,
        (v1 = v4) != 0))
  {
    id v5 = v1;
    _UIViewControllerContainersShouldForwardContentScrollView_shouldForward = [v1 BOOLValue];
  }
}

@end