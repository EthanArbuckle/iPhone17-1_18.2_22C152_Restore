@interface AXSAllowsMixToUplink
@end

@implementation AXSAllowsMixToUplink

uint64_t ___AXSAllowsMixToUplink_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.mix.to.uplink.notification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(@"AXSAllowsMixToUplinkPreference", @"com.apple.accessibility.cache.mix.to.uplink.notification");
  char v2 = 1;
  uint64_t result = _getBooleanPreference(@"AXSAllowsMixToUplinkPreference", &v2);
  if (v2) {
    _kAXSCacheAllowsMixToUplink = result;
  }
  return result;
}

@end