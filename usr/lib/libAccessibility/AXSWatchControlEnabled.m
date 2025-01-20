@interface AXSWatchControlEnabled
@end

@implementation AXSWatchControlEnabled

uint64_t ___AXSWatchControlEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.watch.control.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSWatchControlEnabledPreference, @"com.apple.accessibility.cache.watch.control.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSWatchControlEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheWatchControlEnabled = result;
  }
  return result;
}

@end