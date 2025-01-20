@interface AXSIncreaseBrightnessFloorEnabled
@end

@implementation AXSIncreaseBrightnessFloorEnabled

uint64_t ___AXSIncreaseBrightnessFloorEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.increase.brightness.floor.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSIncreaseBrightnessFloorEnabledPreference, @"com.apple.accessibility.cache.increase.brightness.floor.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSIncreaseBrightnessFloorEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheIncreaseBrightnessFloorEnabled = result;
  }
  return result;
}

@end