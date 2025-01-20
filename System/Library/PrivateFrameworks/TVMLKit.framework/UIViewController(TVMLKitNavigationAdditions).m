@interface UIViewController(TVMLKitNavigationAdditions)
- (uint64_t)customAnimatorForNavigationControllerOperation:()TVMLKitNavigationAdditions fromViewController:;
- (uint64_t)customAnimatorForNavigationControllerOperation:()TVMLKitNavigationAdditions toViewController:;
@end

@implementation UIViewController(TVMLKitNavigationAdditions)

- (uint64_t)customAnimatorForNavigationControllerOperation:()TVMLKitNavigationAdditions toViewController:
{
  return 0;
}

- (uint64_t)customAnimatorForNavigationControllerOperation:()TVMLKitNavigationAdditions fromViewController:
{
  return 0;
}

@end