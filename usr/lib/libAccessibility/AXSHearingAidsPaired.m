@interface AXSHearingAidsPaired
@end

@implementation AXSHearingAidsPaired

uint64_t ___AXSHearingAidsPaired_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.hearing.aid.paired", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSHearingAidPairedPreference, @"com.apple.accessibility.cache.hearing.aid.paired");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSHearingAidPairedPreference, &v2);
  if (v2) {
    _kAXSCacheHearingAidPaired = result;
  }
  return result;
}

@end