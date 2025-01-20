@interface AXSReportValidationErrors
@end

@implementation AXSReportValidationErrors

uint64_t ___AXSReportValidationErrors_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.internal.reportvalidationerrors", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSReportValidationErrorsPreference, @"com.apple.accessibility.cache.internal.reportvalidationerrors");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSReportValidationErrorsPreference, &v2);
  if (v2) {
    _kAXSCacheReportValidationErrors = result;
  }
  return result;
}

@end