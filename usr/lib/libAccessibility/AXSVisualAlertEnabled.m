@interface AXSVisualAlertEnabled
@end

@implementation AXSVisualAlertEnabled

uint64_t ___AXSVisualAlertEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.visual.alert", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSVisualAlertEnabledPreference, @"com.apple.accessibility.cache.visual.alert");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSVisualAlertEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheVisualAlertEnabled = result;
  }
  return result;
}

@end