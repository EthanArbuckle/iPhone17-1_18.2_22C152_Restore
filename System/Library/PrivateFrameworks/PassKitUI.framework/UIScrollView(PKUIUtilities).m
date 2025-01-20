@interface UIScrollView(PKUIUtilities)
- (double)pkui_naturalRestingBounds;
- (void)pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:()PKUIUtilities;
@end

@implementation UIScrollView(PKUIUtilities)

- (void)pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:()PKUIUtilities
{
  if (a3)
  {
    id v7 = a3;
    [a1 adjustedContentInset];
    double v5 = v4;
    [a1 contentOffset];
    objc_msgSend(v7, "_setManualScrollEdgeAppearanceProgress:", fmin(fmax((v5 + v6) * 0.125, 0.0), 1.0));
  }
}

- (double)pkui_naturalRestingBounds
{
  [a1 adjustedContentInset];
  double v3 = -v2;
  [a1 bounds];
  return v3;
}

@end