@interface UIViewController(SKUIStackedBar)
- (double)SKUIStackedBarSplit;
- (uint64_t)SKUIStackedBar;
- (void)setSKUIStackedBarSplit:()SKUIStackedBar;
@end

@implementation UIViewController(SKUIStackedBar)

- (uint64_t)SKUIStackedBar
{
  return 0;
}

- (double)SKUIStackedBarSplit
{
  v1 = objc_getAssociatedObject(a1, "com.apple.StoreKitUI.stackedBarSplit");
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (void)setSKUIStackedBarSplit:()SKUIStackedBar
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "com.apple.StoreKitUI.stackedBarSplit", v2, (void *)1);
}

@end