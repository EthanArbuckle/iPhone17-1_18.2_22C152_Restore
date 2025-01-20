@interface AXSForceTouchEnabled
@end

@implementation AXSForceTouchEnabled

uint64_t ___AXSForceTouchEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.forcetouch.enabled.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSForceTouchEnabledPreference, @"com.apple.accessibility.cache.forcetouch.enabled.changed");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSForceTouchEnabledPreference, &v2);
  if (v2) {
    _kAXSCachedForceTouchEnabled = result;
  }
  return result;
}

@end