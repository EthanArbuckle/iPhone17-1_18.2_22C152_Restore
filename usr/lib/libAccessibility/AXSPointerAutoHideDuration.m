@interface AXSPointerAutoHideDuration
@end

@implementation AXSPointerAutoHideDuration

void ___AXSPointerAutoHideDuration_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pointer.auto.hide.duration", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceDistributed(kAXSPointerAutoHideDurationPreference, @"com.apple.accessibility.cache.pointer.auto.hide.duration");
  char v2 = 1;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSPointerAutoHideDurationPreference, 0, &v2);
  if (v2) {
    _kAXSCachePointerAutoHideDuration = LODWORD(FloatPreference);
  }
}

@end