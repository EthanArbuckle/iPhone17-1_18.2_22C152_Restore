@interface AXSDwellControlEnabled
@end

@implementation AXSDwellControlEnabled

uint64_t ___AXSDwellControlEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.dwell.control", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSDwellControlEnabledPreference, @"com.apple.accessibility.cache.dwell.control");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSDwellControlEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheDwellControlEnabled = result;
  }
  return result;
}

@end