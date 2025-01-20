@interface AXSSoftwareTTYEnabled
@end

@implementation AXSSoftwareTTYEnabled

uint64_t ___AXSSoftwareTTYEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.softwaretty", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSSoftwareTTYPreference, @"com.apple.accessibility.cache.softwaretty");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSSoftwareTTYPreference, &v2);
  if (v2) {
    _kAXSCacheSoftwareTTYEnabled = result;
  }
  return result;
}

@end