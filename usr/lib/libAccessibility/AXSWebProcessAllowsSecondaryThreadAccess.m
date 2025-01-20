@interface AXSWebProcessAllowsSecondaryThreadAccess
@end

@implementation AXSWebProcessAllowsSecondaryThreadAccess

uint64_t ___AXSWebProcessAllowsSecondaryThreadAccess_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.allows.notification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSWebProcessAllowsSecondaryThreadEnabledPreference, @"com.apple.accessibility.cache.allows.notification");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSWebProcessAllowsSecondaryThreadEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheWebProcessAllowsSecondaryThreadEnabled = result;
  }
  return result;
}

@end