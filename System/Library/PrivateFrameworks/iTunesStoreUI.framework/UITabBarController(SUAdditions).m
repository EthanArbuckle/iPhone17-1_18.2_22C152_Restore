@interface UITabBarController(SUAdditions)
- (void)selectedNavigationController;
@end

@implementation UITabBarController(SUAdditions)

- (void)selectedNavigationController
{
  v2 = (void *)[a1 selectedViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    v2 = (void *)[v2 navigationController];
  }
  if (v2)
  {
    uint64_t v3 = [a1 moreNavigationController];
    if (v3)
    {
      uint64_t v4 = v3;
      v5 = (void *)[a1 allViewControllers];
      uint64_t v6 = [v5 indexOfObjectIdenticalTo:v2];
      if (v6 >= [v5 indexOfObjectIdenticalTo:v4]) {
        return (void *)v4;
      }
    }
  }
  return v2;
}

@end