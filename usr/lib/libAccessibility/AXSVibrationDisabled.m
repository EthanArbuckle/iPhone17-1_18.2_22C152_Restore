@interface AXSVibrationDisabled
@end

@implementation AXSVibrationDisabled

uint64_t ___AXSVibrationDisabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.VibrationDisabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSVibrationDisabledPreference, @"com.apple.accessibility.cache.VibrationDisabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSVibrationDisabledPreference, &v2);
  if (v2) {
    _kAXSCacheVibrationDisabled = result;
  }
  return result;
}

@end