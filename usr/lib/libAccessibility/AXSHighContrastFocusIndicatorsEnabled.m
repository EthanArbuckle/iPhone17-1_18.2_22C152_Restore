@interface AXSHighContrastFocusIndicatorsEnabled
@end

@implementation AXSHighContrastFocusIndicatorsEnabled

uint64_t ___AXSHighContrastFocusIndicatorsEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.use.prominent.focus.indicators", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSHighContrastFocusIndicatorsEnabledPreference, @"com.apple.accessibility.cache.use.prominent.focus.indicators");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSHighContrastFocusIndicatorsEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheHighContrastFocusIndicatorsEnabled = result;
  }
  return result;
}

@end