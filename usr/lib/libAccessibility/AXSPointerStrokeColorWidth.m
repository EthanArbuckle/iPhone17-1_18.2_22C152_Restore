@interface AXSPointerStrokeColorWidth
@end

@implementation AXSPointerStrokeColorWidth

void ___AXSPointerStrokeColorWidth_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pointer.stroke.color.width", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceDistributed(kAXSPointerStrokeColorWidthPreference, @"com.apple.accessibility.cache.pointer.stroke.color.width");
  char v2 = 1;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSPointerStrokeColorWidthPreference, 0, &v2);
  if (v2) {
    _kAXSCachePointerStrokeColorWidth = LODWORD(FloatPreference);
  }
}

@end