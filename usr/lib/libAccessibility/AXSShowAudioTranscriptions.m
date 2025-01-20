@interface AXSShowAudioTranscriptions
@end

@implementation AXSShowAudioTranscriptions

uint64_t ___AXSShowAudioTranscriptions_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.show.audio.transcriptions", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSShowAudioTranscriptionsEnabled, @"com.apple.accessibility.cache.show.audio.transcriptions");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSShowAudioTranscriptionsEnabled, &v2);
  if (v2) {
    _kAXSCacheShowAudioTranscriptionsEnabled = result;
  }
  return result;
}

@end