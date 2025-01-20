@interface AXSNocturneAccessibilityModeEnabled
@end

@implementation AXSNocturneAccessibilityModeEnabled

uint64_t ___AXSNocturneAccessibilityModeEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.nocturne.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSNocturneAccessibilityModeEnabledPreference, @"com.apple.accessibility.cache.nocturne.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSNocturneAccessibilityModeEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheNocturneAccessibilityModeEnabled = result;
  }
  return result;
}

@end