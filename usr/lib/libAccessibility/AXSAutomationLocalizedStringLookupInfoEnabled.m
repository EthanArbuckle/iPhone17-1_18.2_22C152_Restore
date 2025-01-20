@interface AXSAutomationLocalizedStringLookupInfoEnabled
@end

@implementation AXSAutomationLocalizedStringLookupInfoEnabled

uint64_t ___AXSAutomationLocalizedStringLookupInfoEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.automation.localized.lookup", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAutomationLocalizedStringLookupInfoEnabledPreference, @"com.apple.accessibility.cache.automation.localized.lookup");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAutomationLocalizedStringLookupInfoEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAutomationLocalizedStringLookup = result;
  }
  return result;
}

@end