@interface AXSAppleTVRemoteUsesSimpleGestures
@end

@implementation AXSAppleTVRemoteUsesSimpleGestures

uint64_t ___AXSAppleTVRemoteUsesSimpleGestures_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.apple.tv.simple.gestures", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAppleTVSimpleGesturesEnabledPreference, @"com.apple.accessibility.cache.apple.tv.simple.gestures");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAppleTVSimpleGesturesEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAppleTVSimpleGesturesEnabled = result;
  }
  return result;
}

@end