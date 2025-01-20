@interface UIViewController(NavigationAdditions)
- (uint64_t)customAnimatorForNavigationControllerOperation:()NavigationAdditions fromViewController:;
- (uint64_t)customAnimatorForNavigationControllerOperation:()NavigationAdditions toViewController:;
@end

@implementation UIViewController(NavigationAdditions)

- (uint64_t)customAnimatorForNavigationControllerOperation:()NavigationAdditions toViewController:
{
  return 0;
}

- (uint64_t)customAnimatorForNavigationControllerOperation:()NavigationAdditions fromViewController:
{
  return 0;
}

@end