@interface AXSPointerInertiaEnabled
@end

@implementation AXSPointerInertiaEnabled

uint64_t ___AXSPointerInertiaEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pointer.inertia", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSPointerInertiaEnabledPreference, @"com.apple.accessibility.cache.pointer.inertia");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSPointerInertiaEnabledPreference, &v2);
  if (v2) {
    _kAXSCachePointerInertiaEnabled = result;
  }
  return result;
}

@end