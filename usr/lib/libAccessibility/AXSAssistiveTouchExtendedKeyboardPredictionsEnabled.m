@interface AXSAssistiveTouchExtendedKeyboardPredictionsEnabled
@end

@implementation AXSAssistiveTouchExtendedKeyboardPredictionsEnabled

uint64_t ___AXSAssistiveTouchExtendedKeyboardPredictionsEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.assistivetouch.useextendedkeyboardpredictions", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAssistiveTouchUseExtendedKeyboardPredictionsEnabledPreference, @"com.apple.accessibility.cache.assistivetouch.useextendedkeyboardpredictions");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchUseExtendedKeyboardPredictionsEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAssistiveTouchUseExtendedKeyboardPredictionsEnabled = result;
  }
  return result;
}

@end