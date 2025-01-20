@interface UIViewController(SiriUI)
- (BOOL)siriui_isVisible;
- (uint64_t)siriui_shouldRotateToLandscape;
@end

@implementation UIViewController(SiriUI)

- (uint64_t)siriui_shouldRotateToLandscape
{
  return 0;
}

- (BOOL)siriui_isVisible
{
  if (![a1 isViewLoaded]) {
    return 0;
  }
  v2 = [a1 view];
  v3 = [v2 window];
  BOOL v4 = v3 != 0;

  return v4;
}

@end