@interface AXSFullKeyboardAccessPassthroughModeEnabled
@end

@implementation AXSFullKeyboardAccessPassthroughModeEnabled

uint64_t ___AXSFullKeyboardAccessPassthroughModeEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.full.keyboard.access.passthrough.mode", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSFullKeyboardAccessPassthroughModeEnabledPreference, @"com.apple.accessibility.cache.full.keyboard.access.passthrough.mode");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessPassthroughModeEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheFullKeyboardAccessPassthroughModeEnabled = result;
  }
  return result;
}

@end