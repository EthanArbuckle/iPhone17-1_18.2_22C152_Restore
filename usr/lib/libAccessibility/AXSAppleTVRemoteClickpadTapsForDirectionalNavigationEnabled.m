@interface AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled
@end

@implementation AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled

uint64_t ___AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.AppleTVRemoteClickpadTapsForDirectionalNavigationEnabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledPreference, @"com.apple.accessibility.cache.AppleTVRemoteClickpadTapsForDirectionalNavigationEnabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled = result;
  }
  return result;
}

@end