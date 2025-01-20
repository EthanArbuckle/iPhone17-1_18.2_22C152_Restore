@interface AXSAccessibilitySecureIntentProvider
@end

@implementation AXSAccessibilitySecureIntentProvider

uint64_t ___AXSAccessibilitySecureIntentProvider_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.secure.intent.provider", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSSecureIntentProviderPreference, @"com.apple.accessibility.cache.secure.intent.provider");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSSecureIntentProviderPreference, &v2);
  if (v2) {
    _kAXSCacheSecureIntentProviderPreference = result;
  }
  return result;
}

@end