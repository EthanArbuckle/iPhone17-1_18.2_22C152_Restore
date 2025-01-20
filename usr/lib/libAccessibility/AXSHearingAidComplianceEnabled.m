@interface AXSHearingAidComplianceEnabled
@end

@implementation AXSHearingAidComplianceEnabled

uint64_t ___AXSHearingAidComplianceEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.hac.audio", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSHearingAidCompliancePreference, @"com.apple.accessibility.cache.hac.audio");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSHearingAidCompliancePreference, &v2);
  if (v2) {
    _kAXSCacheHearingAidComplianceEnabled = result;
  }
  return result;
}

@end