@interface AXSVoiceOverTouchVolume
@end

@implementation AXSVoiceOverTouchVolume

void ___AXSVoiceOverTouchVolume_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.vot.volume", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceDistributed(kAXSVoiceOverTouchVolumePreference, @"com.apple.accessibility.cache.vot.volume");
  char v2 = 1;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSVoiceOverTouchVolumePreference, 0, &v2);
  if (v2) {
    _kAXSCachedVoiceOverVolume = LODWORD(FloatPreference);
  }
}

@end