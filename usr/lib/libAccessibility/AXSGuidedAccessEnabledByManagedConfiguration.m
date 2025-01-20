@interface AXSGuidedAccessEnabledByManagedConfiguration
@end

@implementation AXSGuidedAccessEnabledByManagedConfiguration

uint64_t ___AXSGuidedAccessEnabledByManagedConfiguration_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.guided.access.via.mdm", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSGuidedAccessEnabledByManagedConfigurationPreference, @"com.apple.accessibility.cache.guided.access.via.mdm");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSGuidedAccessEnabledByManagedConfigurationPreference, &v2);
  if (v2) {
    _kAXSCacheGuidedAccessEnabledByManagedConfiguration = result;
  }
  return result;
}

@end