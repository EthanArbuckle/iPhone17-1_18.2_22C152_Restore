@interface AXSPointerAutoHideEnabled
@end

@implementation AXSPointerAutoHideEnabled

uint64_t ___AXSPointerAutoHideEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pointer.auto.hide", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSPointerAutoHideEnabledPreference, @"com.apple.accessibility.cache.pointer.auto.hide");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSPointerAutoHideEnabledPreference, &v2);
  if (v2) {
    _kAXSCachePointerAutoHideEnabled = result;
  }
  return result;
}

@end