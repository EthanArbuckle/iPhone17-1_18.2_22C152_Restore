@interface AXSLiveSpeechEnabled
@end

@implementation AXSLiveSpeechEnabled

uint64_t ___AXSLiveSpeechEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.livespeech", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSLiveSpeechEnabledPreference, @"com.apple.accessibility.cache.livespeech");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSLiveSpeechEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheLiveSpeechEnabled = result;
  }
  return result;
}

@end