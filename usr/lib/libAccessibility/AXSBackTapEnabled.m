@interface AXSBackTapEnabled
@end

@implementation AXSBackTapEnabled

uint64_t ___AXSBackTapEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.back.tap.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSBackTapEnabledPreference, @"com.apple.accessibility.cache.back.tap.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSBackTapEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheBackTapEnabled = result;
  }
  return result;
}

@end