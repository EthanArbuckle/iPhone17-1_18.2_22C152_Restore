@interface AXSPointerSizeMultiplier
@end

@implementation AXSPointerSizeMultiplier

void ___AXSPointerSizeMultiplier_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pointer.size.multiplier", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceDistributed(kAXSPointerSizeMultiplierPreference, @"com.apple.accessibility.cache.pointer.size.multiplier");
  char v2 = 1;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSPointerSizeMultiplierPreference, 0, &v2);
  if (v2) {
    _kAXSCachePointerSizeMultiplier = LODWORD(FloatPreference);
  }
}

@end