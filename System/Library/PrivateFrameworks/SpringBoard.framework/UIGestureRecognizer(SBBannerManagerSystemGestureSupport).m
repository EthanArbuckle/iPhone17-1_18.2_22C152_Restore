@interface UIGestureRecognizer(SBBannerManagerSystemGestureSupport)
- (uint64_t)sb_isInstalledAsSystemGesture;
- (void)sb_setInstalledAsSystemGesture:()SBBannerManagerSystemGestureSupport;
@end

@implementation UIGestureRecognizer(SBBannerManagerSystemGestureSupport)

- (uint64_t)sb_isInstalledAsSystemGesture
{
  v1 = objc_getAssociatedObject(a1, "com.apple.SpringBoardFramework.bannerManager.systemGestureStatus");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)sb_setInstalledAsSystemGesture:()SBBannerManagerSystemGestureSupport
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "com.apple.SpringBoardFramework.bannerManager.systemGestureStatus", v2, (void *)3);
}

@end