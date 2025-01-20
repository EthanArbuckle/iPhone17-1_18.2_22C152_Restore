@interface AXSVoiceOverSpeakUnderPointerEnabled
@end

@implementation AXSVoiceOverSpeakUnderPointerEnabled

uint64_t ___AXSVoiceOverSpeakUnderPointerEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.voiceover.speak.under.pointer", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSVoiceOverSpeakUnderPointerPreference, @"com.apple.accessibility.cache.voiceover.speak.under.pointer");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSVoiceOverSpeakUnderPointerPreference, &v2);
  if (v2) {
    _kAXSCacheVoiceOverSpeakUnderPointer = result;
  }
  return result;
}

@end