@interface AXSFullKeyboardAccessFocusRingEnabled
@end

@implementation AXSFullKeyboardAccessFocusRingEnabled

uint64_t ___AXSFullKeyboardAccessFocusRingEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.full.keyboard.access.focus.ring", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSFullKeyboardAccessFocusRingEnabledPreference, @"com.apple.accessibility.cache.full.keyboard.access.focus.ring");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessFocusRingEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheFullKeyboardAccessFocusRingEnabled = result;
  }
  return result;
}

@end