@interface AXSZoomTouchReadyForObservers
@end

@implementation AXSZoomTouchReadyForObservers

uint64_t ___AXSZoomTouchReadyForObservers_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.zoom.readyForObservers", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSZoomTouchReadyForObserversPreference, @"com.apple.accessibility.cache.zoom.readyForObservers");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSZoomTouchReadyForObserversPreference, &v2);
  if (v2) {
    _kAXSCacheZoomTouchReadyForObservers = result;
  }
  return result;
}

@end