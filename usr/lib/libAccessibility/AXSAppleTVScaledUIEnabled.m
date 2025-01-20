@interface AXSAppleTVScaledUIEnabled
@end

@implementation AXSAppleTVScaledUIEnabled

uint64_t ___AXSAppleTVScaledUIEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.AppleTVScaledUIEnabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAppleTVScaledUIEnabledPreference, @"com.apple.accessibility.cache.AppleTVScaledUIEnabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAppleTVScaledUIEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAppleTVScaledUIEnabled = result;
  }
  return result;
}

@end