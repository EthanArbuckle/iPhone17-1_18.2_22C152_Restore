@interface AXSFullKeyboardAccessEnabled
@end

@implementation AXSFullKeyboardAccessEnabled

uint64_t ___AXSFullKeyboardAccessEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.full.keyboard.access", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSFullKeyboardAccessEnabledPreference, @"com.apple.accessibility.cache.full.keyboard.access");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheFullKeyboardAccessEnabled = result;
  }
  return result;
}

@end