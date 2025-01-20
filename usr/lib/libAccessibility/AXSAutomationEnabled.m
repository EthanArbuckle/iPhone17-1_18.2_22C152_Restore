@interface AXSAutomationEnabled
@end

@implementation AXSAutomationEnabled

uint64_t ___AXSAutomationEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.automation.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAutomationEnabledPreference, @"com.apple.accessibility.cache.automation.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAutomationEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAutomationEnabled = result;
  }
  return result;
}

@end