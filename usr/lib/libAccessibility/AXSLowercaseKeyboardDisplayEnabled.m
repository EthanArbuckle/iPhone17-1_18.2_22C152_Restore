@interface AXSLowercaseKeyboardDisplayEnabled
@end

@implementation AXSLowercaseKeyboardDisplayEnabled

uint64_t ___AXSLowercaseKeyboardDisplayEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.lower.case.keyboard.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSLowerCaseKeyboardEnabledPreference, @"com.apple.accessibility.cache.lower.case.keyboard.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSLowerCaseKeyboardEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheLowercaseKeyboardEnabled = result;
  }
  return result;
}

@end