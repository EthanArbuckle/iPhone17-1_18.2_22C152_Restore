@interface UIViewController(SUUIStackedBar)
- (double)SUUIStackedBarSplit;
- (uint64_t)SUUIStackedBar;
- (void)setSUUIStackedBarSplit:()SUUIStackedBar;
@end

@implementation UIViewController(SUUIStackedBar)

- (uint64_t)SUUIStackedBar
{
  return 0;
}

- (double)SUUIStackedBarSplit
{
  v1 = objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.stackedBarSplit");
  [v1 floatValue];
  double v3 = v2;

  return v3;
}

- (void)setSUUIStackedBarSplit:()SUUIStackedBar
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "com.apple.iTunesStoreUI.stackedBarSplit", v2, (void *)1);
}

@end