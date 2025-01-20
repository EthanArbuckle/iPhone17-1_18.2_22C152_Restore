@interface AXSPreferredFontSize
@end

@implementation AXSPreferredFontSize

void ___AXSPreferredFontSize_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.large.text.change", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceDistributed(kAXSPreferredFontSizePreference, @"com.apple.accessibility.cache.large.text.change");
  char v2 = 1;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSPreferredFontSizePreference, 0, &v2);
  if (v2) {
    _kAXSCachedPreferredFontSize = LODWORD(FloatPreference);
  }
}

@end