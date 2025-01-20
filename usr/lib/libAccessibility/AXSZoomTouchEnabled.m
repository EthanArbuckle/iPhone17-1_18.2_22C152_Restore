@interface AXSZoomTouchEnabled
@end

@implementation AXSZoomTouchEnabled

uint64_t ___AXSZoomTouchEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.zoom", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSZoomTouchEnabledPreference, @"com.apple.accessibility.cache.zoom");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSZoomTouchEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheZoomTouchEnabled = result;
  }
  return result;
}

@end