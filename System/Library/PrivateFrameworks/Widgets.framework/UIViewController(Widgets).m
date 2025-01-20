@interface UIViewController(Widgets)
- (BOOL)wg_isAppearanceTransitioning;
- (BOOL)wg_isAppearingOrAppeared;
- (BOOL)wg_isDisappearingOrDisappeared;
- (uint64_t)wg_beginAppearanceTransitionIfNecessary:()Widgets animated:;
- (uint64_t)wg_endAppearanceTransitionIfNecessary;
@end

@implementation UIViewController(Widgets)

- (BOOL)wg_isAppearingOrAppeared
{
  return [a1 _appearState] - 1 < 2;
}

- (BOOL)wg_isDisappearingOrDisappeared
{
  int v1 = [a1 _appearState];
  return !v1 || v1 == 3;
}

- (BOOL)wg_isAppearanceTransitioning
{
  return ([a1 _appearState] & 0xFFFFFFFD) == 1;
}

- (uint64_t)wg_beginAppearanceTransitionIfNecessary:()Widgets animated:
{
  uint64_t result = [a1 isViewLoaded];
  if (result)
  {
    if (a3)
    {
      if ((objc_msgSend(a1, "wg_isDisappearingOrDisappeared") & 1) == 0) {
        return 0;
      }
    }
    else
    {
      uint64_t result = objc_msgSend(a1, "wg_isAppearingOrAppeared");
      if (!result) {
        return result;
      }
    }
    [a1 beginAppearanceTransition:a3 animated:a4];
    return 1;
  }
  return result;
}

- (uint64_t)wg_endAppearanceTransitionIfNecessary
{
  uint64_t result = [a1 isViewLoaded];
  if (result)
  {
    if (([a1 _appearState] & 0xFFFFFFFD) == 1)
    {
      [a1 endAppearanceTransition];
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end