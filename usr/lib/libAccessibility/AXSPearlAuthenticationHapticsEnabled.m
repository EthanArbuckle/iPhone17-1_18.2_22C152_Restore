@interface AXSPearlAuthenticationHapticsEnabled
@end

@implementation AXSPearlAuthenticationHapticsEnabled

uint64_t ___AXSPearlAuthenticationHapticsEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.perl.auth.haptics", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSPearlAuthenticationHapticsPreference, @"com.apple.accessibility.cache.perl.auth.haptics");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSPearlAuthenticationHapticsPreference, &v2);
  if (v2) {
    _kAXSCachePearlAuthenticationHapticsEnabled = result;
  }
  return result;
}

@end