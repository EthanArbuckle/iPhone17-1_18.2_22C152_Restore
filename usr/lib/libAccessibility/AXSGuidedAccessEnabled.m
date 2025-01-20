@interface AXSGuidedAccessEnabled
@end

@implementation AXSGuidedAccessEnabled

uint64_t ___AXSGuidedAccessEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.guided.access", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSGuidedAccessEnabledPreference, @"com.apple.accessibility.cache.guided.access");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSGuidedAccessEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheGuidedAccessEnabled = result;
  }
  return result;
}

@end