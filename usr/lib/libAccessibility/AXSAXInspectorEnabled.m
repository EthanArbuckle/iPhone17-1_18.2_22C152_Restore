@interface AXSAXInspectorEnabled
@end

@implementation AXSAXInspectorEnabled

uint64_t ___AXSAXInspectorEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.internal.axinspector", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAXInspectorPreference, @"com.apple.accessibility.cache.internal.axinspector");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAXInspectorPreference, &v2);
  if (v2) {
    _kAXSCacheAXInspectorEnabled = result;
  }
  return result;
}

@end