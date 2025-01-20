@interface AXSHoverTextBackgroundOpacity
@end

@implementation AXSHoverTextBackgroundOpacity

void ___AXSHoverTextBackgroundOpacity_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.hovertext.backgroundopacity.change", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceDistributed(kAXSHoverTextBackgroundOpacityPreference, @"com.apple.accessibility.cache.hovertext.backgroundopacity.change");
  char v2 = 1;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSHoverTextBackgroundOpacityPreference, 0, &v2);
  if (v2) {
    _kAXSCachedHoverTextBackgroundOpacity = LODWORD(FloatPreference);
  }
}

@end