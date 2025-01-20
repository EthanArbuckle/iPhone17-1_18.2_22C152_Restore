@interface UIViewController(PUNavigationController)
- (uint64_t)pu_preferredBarStyle;
- (uint64_t)pu_shouldOptOutFromChromelessBars;
@end

@implementation UIViewController(PUNavigationController)

- (uint64_t)pu_shouldOptOutFromChromelessBars
{
  return 0;
}

- (uint64_t)pu_preferredBarStyle
{
  return 0;
}

@end