@interface AXSLiveTranscriptionEnabled
@end

@implementation AXSLiveTranscriptionEnabled

uint64_t ___AXSLiveTranscriptionEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"_AXSCacheLiveTranscriptionNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSLiveTranscriptionEnabledPreference, @"_AXSCacheLiveTranscriptionNotification");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSLiveTranscriptionEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheLiveTranscriptionEnabled = result;
  }
  return result;
}

@end