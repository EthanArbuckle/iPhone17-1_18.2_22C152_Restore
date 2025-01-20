@interface AXSAppleTVRemoteForceLiveTVButtons
@end

@implementation AXSAppleTVRemoteForceLiveTVButtons

uint64_t ___AXSAppleTVRemoteForceLiveTVButtons_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.apple.tv.live.tv.buttons", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAppleTVForceLiveTVButtonsEnabledPreference, @"com.apple.accessibility.cache.apple.tv.live.tv.buttons");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAppleTVForceLiveTVButtonsEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAppleTVForceLiveTVButtonsEnabled = result;
  }
  return result;
}

@end