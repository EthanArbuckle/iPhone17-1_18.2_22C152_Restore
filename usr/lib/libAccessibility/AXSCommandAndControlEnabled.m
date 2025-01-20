@interface AXSCommandAndControlEnabled
@end

@implementation AXSCommandAndControlEnabled

uint64_t ___AXSCommandAndControlEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.command.and.control", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSCommandAndControlEnabledPreference, @"com.apple.accessibility.cache.command.and.control");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSCommandAndControlEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheCommandAndControlEnabled = result;
  }
  return result;
}

@end