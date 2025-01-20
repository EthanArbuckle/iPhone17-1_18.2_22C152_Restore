@interface AXSClassicInvertColorsEnabled
@end

@implementation AXSClassicInvertColorsEnabled

uint64_t ___AXSClassicInvertColorsEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.classic.invert.colors", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSClassicInvertColorsPreference, @"com.apple.accessibility.cache.classic.invert.colors");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSClassicInvertColorsPreference, &v2);
  if (v2) {
    _kAXSCacheClassicInvertColorsEnabled = result;
  }
  return result;
}

@end