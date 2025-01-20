@interface AXSAssistiveTouchScannerEnabled
@end

@implementation AXSAssistiveTouchScannerEnabled

uint64_t ___AXSAssistiveTouchScannerEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.switch.control", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAssistiveTouchScannerEnabledPreference, @"com.apple.accessibility.cache.switch.control");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchScannerEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheSwitchControlEnabled = result;
  }
  return result;
}

@end