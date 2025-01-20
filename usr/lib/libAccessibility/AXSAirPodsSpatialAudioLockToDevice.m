@interface AXSAirPodsSpatialAudioLockToDevice
@end

@implementation AXSAirPodsSpatialAudioLockToDevice

uint64_t ___AXSAirPodsSpatialAudioLockToDevice_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.airpod.spatial.audio.lock.to.device", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(@"AXSAirPodsSpatialAudioLockToDevice", @"com.apple.accessibility.cache.airpod.spatial.audio.lock.to.device");
  char v2 = 1;
  uint64_t result = _getBooleanPreference(@"AXSAirPodsSpatialAudioLockToDevice", &v2);
  if (v2) {
    _kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled = result;
  }
  return result;
}

@end