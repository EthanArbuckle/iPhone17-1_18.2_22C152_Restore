@interface AXSAutomationHitpointWarpingEnabled
@end

@implementation AXSAutomationHitpointWarpingEnabled

uint64_t ___AXSAutomationHitpointWarpingEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.automation.hitpoint_warping.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAutomationHitpointWarpingEnabledPreference, @"com.apple.accessibility.cache.automation.hitpoint_warping.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAutomationHitpointWarpingEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAutomationHitpointWarpingEnabled = result;
  }
  return result;
}

@end