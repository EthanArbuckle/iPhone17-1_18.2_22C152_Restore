@interface AXSAppSwitcherAutoSelectEnabled
@end

@implementation AXSAppSwitcherAutoSelectEnabled

uint64_t ___AXSAppSwitcherAutoSelectEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.AXSCacheAppSwitcherAutoSelectNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAppSwitcherAutoSelectPreference, @"com.apple.accessibility.cache.AXSCacheAppSwitcherAutoSelectNotification");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAppSwitcherAutoSelectPreference, &v2);
  if (v2) {
    _kAXSCacheAppSwitcherAutoSelect = result;
  }
  return result;
}

@end