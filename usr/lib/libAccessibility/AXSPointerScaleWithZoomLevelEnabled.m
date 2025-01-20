@interface AXSPointerScaleWithZoomLevelEnabled
@end

@implementation AXSPointerScaleWithZoomLevelEnabled

uint64_t ___AXSPointerScaleWithZoomLevelEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pointer.scale.with.zoom.level", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSPointerScaleWithZoomLevelEnabledPreference, @"com.apple.accessibility.cache.pointer.scale.with.zoom.level");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSPointerScaleWithZoomLevelEnabledPreference, &v2);
  if (v2) {
    _kAXSCachePointerScaleWithZoomLevelEnabled = result;
  }
  return result;
}

@end