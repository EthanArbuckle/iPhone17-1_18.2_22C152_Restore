@interface AXSApplicationAccessibilityEnabled
@end

@implementation AXSApplicationAccessibilityEnabled

uint64_t ___AXSApplicationAccessibilityEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.app.ax", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSApplicationAccessibilityEnabledPreference, @"com.apple.accessibility.cache.app.ax");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSApplicationAccessibilityEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheApplicationAccessibilityEnabled = result;
  }
  return result;
}

@end