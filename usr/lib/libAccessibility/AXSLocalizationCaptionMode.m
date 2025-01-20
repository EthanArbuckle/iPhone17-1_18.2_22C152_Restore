@interface AXSLocalizationCaptionMode
@end

@implementation AXSLocalizationCaptionMode

uint64_t ___AXSLocalizationCaptionMode_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.loc.caption.mode.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSLocalizationCaptionModeEnabledPreference, @"com.apple.accessibility.cache.loc.caption.mode.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSLocalizationCaptionModeEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheLocalizationCaptionModeEnabled = result;
  }
  return result;
}

@end