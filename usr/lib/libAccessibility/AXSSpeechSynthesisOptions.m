@interface AXSSpeechSynthesisOptions
@end

@implementation AXSSpeechSynthesisOptions

uint64_t ___AXSSpeechSynthesisOptions_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.speech.synth.options", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSSpeechSynthesisOptionsPreference, @"com.apple.accessibility.cache.speech.synth.options");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSSpeechSynthesisOptionsPreference, &v2);
  if (v2) {
    _kAXSCacheSpeechSynthesisOptions = result;
  }
  return result;
}

@end