@interface AXSHearingAidRingtoneStreamingEnabled
@end

@implementation AXSHearingAidRingtoneStreamingEnabled

uint64_t ___AXSHearingAidRingtoneStreamingEnabled_block_invoke()
{
  if (kAXSHearingAidRingtoneStreamPreferenceChangedNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)kAXSHearingAidRingtoneStreamPreferenceChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    ObservePreferenceLocal(kAXSHearingAidRingtoneStreamingPreference, kAXSHearingAidRingtoneStreamPreferenceChangedNotification);
  }
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSHearingAidRingtoneStreamingPreference, &v2);
  if (v2) {
    _kAXSCacheHearingAidRingtonStreamingEnabled = result;
  }
  return result;
}

@end