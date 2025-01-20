@interface AXSHoverTextFontSize
@end

@implementation AXSHoverTextFontSize

void ___AXSHoverTextFontSize_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.hovertext.fontsize.change", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceDistributed(kAXSHoverTextFontSizePreference, @"com.apple.accessibility.cache.hovertext.fontsize.change");
  char v2 = 1;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSHoverTextFontSizePreference, 0, &v2);
  if (v2) {
    _kAXSCachedHoverTextFontSize = LODWORD(FloatPreference);
  }
}

@end