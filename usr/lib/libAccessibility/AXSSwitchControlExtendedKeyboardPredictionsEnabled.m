@interface AXSSwitchControlExtendedKeyboardPredictionsEnabled
@end

@implementation AXSSwitchControlExtendedKeyboardPredictionsEnabled

uint64_t ___AXSSwitchControlExtendedKeyboardPredictionsEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.switch.control.useextendedkeyboardpredictions", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSSwitchControlUseExtendedKeyboardPredictionsEnabledPreference, @"com.apple.accessibility.cache.switch.control.useextendedkeyboardpredictions");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSSwitchControlUseExtendedKeyboardPredictionsEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheSwitchControlUseExtendedKeyboardPredictionsEnabled = result;
  }
  return result;
}

@end