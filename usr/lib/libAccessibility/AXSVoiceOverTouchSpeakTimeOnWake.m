@interface AXSVoiceOverTouchSpeakTimeOnWake
@end

@implementation AXSVoiceOverTouchSpeakTimeOnWake

uint64_t ___AXSVoiceOverTouchSpeakTimeOnWake_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.AXSCacheVoiceOverSpeakTimeOnWakeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSVoiceOverTouchSpeakTimeOnWakePreference, @"com.apple.accessibility.cache.AXSCacheVoiceOverSpeakTimeOnWakeNotification");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchSpeakTimeOnWakePreference, &v2);
  if (v2) {
    _kAXSCacheVoiceOverSpeakTimeOnWake = result;
  }
  return result;
}

@end