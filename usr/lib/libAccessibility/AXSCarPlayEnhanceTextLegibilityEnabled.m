@interface AXSCarPlayEnhanceTextLegibilityEnabled
@end

@implementation AXSCarPlayEnhanceTextLegibilityEnabled

uint64_t ___AXSCarPlayEnhanceTextLegibilityEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.carplay.enhance.text.legibility", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(@"CarPlayEnhancedTextLegibilityEnabled", @"com.apple.accessibility.cache.carplay.enhance.text.legibility");
  char v2 = 1;
  uint64_t result = _getBooleanPreference(@"CarPlayEnhancedTextLegibilityEnabled", &v2);
  if (v2) {
    _kAXSCacheCarPlayEnhanceTextLegibility = result;
  }
  return result;
}

@end