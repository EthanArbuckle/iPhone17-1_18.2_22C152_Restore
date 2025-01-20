@interface AXSInPerformanceTestMode
@end

@implementation AXSInPerformanceTestMode

uint64_t ___AXSInPerformanceTestMode_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.performance.testing.mode", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSInPerformanceTestModePreference, @"com.apple.accessibility.cache.performance.testing.mode");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSInPerformanceTestModePreference, &v2);
  if (v2) {
    _kAXSCacheInPerformanceTestMode = result;
  }
  return result;
}

@end