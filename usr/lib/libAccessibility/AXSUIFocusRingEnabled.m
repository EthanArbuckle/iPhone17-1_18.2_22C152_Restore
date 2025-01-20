@interface AXSUIFocusRingEnabled
@end

@implementation AXSUIFocusRingEnabled

uint64_t ___AXSUIFocusRingEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.ui.focus.ring", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSUIFocusRingEnabledPreference, @"com.apple.accessibility.cache.ui.focus.ring");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSUIFocusRingEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheUIFocusRingEnabled = result;
  }
  return result;
}

@end