@interface AXSWatchTypeToSiriEnabled
@end

@implementation AXSWatchTypeToSiriEnabled

uint64_t ___AXSWatchTypeToSiriEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.watch.typetosiri.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSWatchTypeToSiriEnabledPreference, @"com.apple.accessibility.cache.watch.typetosiri.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSWatchTypeToSiriEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheWatchTypeToSiriEnabled = result;
  }
  return result;
}

@end