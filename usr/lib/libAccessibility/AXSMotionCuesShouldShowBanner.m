@interface AXSMotionCuesShouldShowBanner
@end

@implementation AXSMotionCuesShouldShowBanner

uint64_t ___AXSMotionCuesShouldShowBanner_block_invoke()
{
  if (_kAXSCacheMotionCuesShouldShowBannerDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)_kAXSCacheMotionCuesShouldShowBannerDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    ObservePreferenceLocal(@"AXSMotionCuesShouldShowBanner", _kAXSCacheMotionCuesShouldShowBannerDidChangeNotification);
  }
  char v2 = 1;
  uint64_t result = _getBooleanPreference(@"AXSMotionCuesShouldShowBanner", &v2);
  if (v2) {
    _kAXSCacheMotionCuesShouldShowBanner = result;
  }
  return result;
}

@end