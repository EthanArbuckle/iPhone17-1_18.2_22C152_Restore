@interface AXSAudioDonationSiriImprovementEnabled
@end

@implementation AXSAudioDonationSiriImprovementEnabled

uint64_t ___AXSAudioDonationSiriImprovementEnabled_block_invoke()
{
  if (_kAXSCacheAudioDonationSiriImprovementDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)_kAXSCacheAudioDonationSiriImprovementDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    ObservePreferenceLocal(kAXSAudioDonationSiriImprovementEnabledPreference, _kAXSCacheAudioDonationSiriImprovementDidChangeNotification);
  }
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAudioDonationSiriImprovementEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAudioDonationSiriImprovementEnabled = result;
  }
  return result;
}

@end