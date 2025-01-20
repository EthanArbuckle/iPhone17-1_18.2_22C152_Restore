@interface UIWindow(SBWindow)
- (uint64_t)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets;
@end

@implementation UIWindow(SBWindow)

- (uint64_t)sb_preventStatusBarEffectivelyHiddenForContentOverlayInsets
{
  return 0;
}

@end