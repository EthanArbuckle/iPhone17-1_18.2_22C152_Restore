@interface AXSCommandAndControlCarPlayEnabled
@end

@implementation AXSCommandAndControlCarPlayEnabled

uint64_t ___AXSCommandAndControlCarPlayEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.command.and.control.carplay", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSCommandAndControlCarPlayEnabledPreference, @"com.apple.accessibility.cache.command.and.control.carplay");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSCommandAndControlCarPlayEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheCommandAndControlCarPlayEnabled = result;
  }
  return result;
}

@end