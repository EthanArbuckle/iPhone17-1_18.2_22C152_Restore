@interface AXSUseSingleSystemColor
@end

@implementation AXSUseSingleSystemColor

uint64_t ___AXSUseSingleSystemColor_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.use.single.system.color.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSUseSingleSystemColorPreference, @"com.apple.accessibility.cache.use.single.system.color.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSUseSingleSystemColorPreference, &v2);
  if (v2) {
    _kAXSCacheUseSingleSystemColor = result;
  }
  return result;
}

@end