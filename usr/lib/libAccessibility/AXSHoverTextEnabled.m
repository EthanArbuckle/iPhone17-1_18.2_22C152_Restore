@interface AXSHoverTextEnabled
@end

@implementation AXSHoverTextEnabled

uint64_t ___AXSHoverTextEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.hovertext", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSHoverTextEnabledPreference, @"com.apple.accessibility.cache.hovertext");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSHoverTextEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheHoverTextEnabled = result;
  }
  return result;
}

@end