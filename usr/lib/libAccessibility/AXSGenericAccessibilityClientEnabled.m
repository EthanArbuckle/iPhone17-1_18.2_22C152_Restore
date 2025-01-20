@interface AXSGenericAccessibilityClientEnabled
@end

@implementation AXSGenericAccessibilityClientEnabled

uint64_t ___AXSGenericAccessibilityClientEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.generic.accessibility.client", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSGenericAccessibilityClientEnabledPreference, @"com.apple.accessibility.cache.generic.accessibility.client");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSGenericAccessibilityClientEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheGenericAccessibilityClientEnabled = result;
  }
  return result;
}

@end