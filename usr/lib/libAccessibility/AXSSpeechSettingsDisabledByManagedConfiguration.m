@interface AXSSpeechSettingsDisabledByManagedConfiguration
@end

@implementation AXSSpeechSettingsDisabledByManagedConfiguration

uint64_t ___AXSSpeechSettingsDisabledByManagedConfiguration_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.speech.settings.disabled.by.mc", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSSpeechSettingsDisabledByManagedConfigurationPreference, @"com.apple.accessibility.cache.speech.settings.disabled.by.mc");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSSpeechSettingsDisabledByManagedConfigurationPreference, &v2);
  if (v2) {
    _kAXSCacheSpeechSettingsDisabledByManagedConfiguration = result;
  }
  return result;
}

@end