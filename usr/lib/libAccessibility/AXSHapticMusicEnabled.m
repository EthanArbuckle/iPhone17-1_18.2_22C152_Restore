@interface AXSHapticMusicEnabled
@end

@implementation AXSHapticMusicEnabled

uint64_t ___AXSHapticMusicEnabled_block_invoke()
{
  if (_kAXSCacheHapticMusicDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)_kAXSCacheHapticMusicDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    ObservePreferenceLocal(kAXSHapticMusicEnabledPreference, _kAXSCacheHapticMusicDidChangeNotification);
  }
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSHapticMusicEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheHapticMusicEnabled = result;
  }
  return result;
}

@end