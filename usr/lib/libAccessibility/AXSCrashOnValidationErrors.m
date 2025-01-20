@interface AXSCrashOnValidationErrors
@end

@implementation AXSCrashOnValidationErrors

uint64_t ___AXSCrashOnValidationErrors_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.internal.crashonvalidationerrors", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSCrashOnValidationErrorsPreference, @"com.apple.accessibility.cache.internal.crashonvalidationerrors");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSCrashOnValidationErrorsPreference, &v2);
  if (v2) {
    _kAXSCacheCrashOnValidationErrors = result;
  }
  return result;
}

@end