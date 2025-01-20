@interface AXSZoomTouchSmoothScalingDisabled
@end

@implementation AXSZoomTouchSmoothScalingDisabled

uint64_t ___AXSZoomTouchSmoothScalingDisabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.zoom.smoothscaling", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSZoomTouchSmoothScalingPreference, @"com.apple.accessibility.cache.zoom.smoothscaling");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSZoomTouchSmoothScalingPreference, &v2);
  if (v2) {
    _kAXSCacheZoomTouchSmoothScalingDisabled = result;
  }
  return result;
}

@end