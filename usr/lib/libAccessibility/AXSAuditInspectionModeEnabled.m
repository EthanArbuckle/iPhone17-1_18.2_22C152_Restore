@interface AXSAuditInspectionModeEnabled
@end

@implementation AXSAuditInspectionModeEnabled

uint64_t ___AXSAuditInspectionModeEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.audit.inspection.mode", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAuditInspectionModeEnabledPreference, @"com.apple.accessibility.cache.audit.inspection.mode");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAuditInspectionModeEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAuditInspectionModeModeEnabled = result;
  }
  return result;
}

@end