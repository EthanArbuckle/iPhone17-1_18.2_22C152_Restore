@interface AXSVoiceOverSpeakUnderPointerDelay
@end

@implementation AXSVoiceOverSpeakUnderPointerDelay

void ___AXSVoiceOverSpeakUnderPointerDelay_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.voiceover.speak.under.pointer", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceDistributed(kAXSVoiceOverSpeakUnderPointerDelayPreference, @"com.apple.accessibility.cache.voiceover.speak.under.pointer");
  char v2 = 1;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSVoiceOverSpeakUnderPointerDelayPreference, 0, &v2);
  if (v2) {
    _kAXSCacheVoiceOverSpeakUnderPointerDelay = LODWORD(FloatPreference);
  }
}

@end