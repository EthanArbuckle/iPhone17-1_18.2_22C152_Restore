@interface AXSZoomSpeakUnderFingerEnabled
@end

@implementation AXSZoomSpeakUnderFingerEnabled

uint64_t ___AXSZoomSpeakUnderFingerEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.zoom.speakunderfinger", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSZoomSpeakUnderFingerEnabledPreference, @"com.apple.accessibility.cache.zoom.speakunderfinger");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSZoomSpeakUnderFingerEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheZoomSpeakUnderFingerEnabled = result;
  }
  return result;
}

@end