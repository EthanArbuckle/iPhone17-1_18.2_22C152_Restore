@interface AXSSpeakThisEnabled
@end

@implementation AXSSpeakThisEnabled

uint64_t ___AXSSpeakThisEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.speak.this", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSSpeakThisEnabledPreference, @"com.apple.accessibility.cache.speak.this");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSSpeakThisEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheSpeakThisEnabled = result;
  }
  return result;
}

@end