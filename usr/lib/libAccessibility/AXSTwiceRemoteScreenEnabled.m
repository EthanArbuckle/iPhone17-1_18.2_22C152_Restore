@interface AXSTwiceRemoteScreenEnabled
@end

@implementation AXSTwiceRemoteScreenEnabled

uint64_t ___AXSTwiceRemoteScreenEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.twice.remote.screen.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSTwiceRemoteScreenEnabledPreference, @"com.apple.accessibility.cache.twice.remote.screen.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSTwiceRemoteScreenEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheTwiceRemoteScreenEnabled = result;
  }
  return result;
}

@end