@interface UINavigationController(MobileSafariFrameworkExtras)
- (uint64_t)safari_prefersHalfHeightSheetPresentationWithLoweredBar;
@end

@implementation UINavigationController(MobileSafariFrameworkExtras)

- (uint64_t)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  v1 = [a1 viewControllers];
  v2 = [v1 firstObject];
  uint64_t v3 = objc_msgSend(v2, "safari_prefersHalfHeightSheetPresentationWithLoweredBar");

  return v3;
}

@end