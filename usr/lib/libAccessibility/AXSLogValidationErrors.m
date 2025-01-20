@interface AXSLogValidationErrors
@end

@implementation AXSLogValidationErrors

uint64_t ___AXSLogValidationErrors_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.internal.logvalidationerrors", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSLogValidationErrorsPreference, @"com.apple.accessibility.cache.internal.logvalidationerrors");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSLogValidationErrorsPreference, &v2);
  if (v2) {
    _kAXSCacheLogValidationErrors = result;
  }
  return result;
}

@end