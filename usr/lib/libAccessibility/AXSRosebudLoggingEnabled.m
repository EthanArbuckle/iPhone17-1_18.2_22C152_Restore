@interface AXSRosebudLoggingEnabled
@end

@implementation AXSRosebudLoggingEnabled

uint64_t ___AXSRosebudLoggingEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.rosebud.logging.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSRosebudLoggingEnabledPreference, @"com.apple.accessibility.cache.rosebud.logging.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSRosebudLoggingEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheRosebudLoggingEnabled = result;
  }
  return result;
}

@end