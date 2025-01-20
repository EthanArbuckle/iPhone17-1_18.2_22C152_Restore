@interface AXSGuidedAccessHasPasscode
@end

@implementation AXSGuidedAccessHasPasscode

uint64_t ___AXSGuidedAccessHasPasscode_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.gax.haspasscode", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSGuidedAccessHasPasscodePreference, @"com.apple.accessibility.cache.gax.haspasscode");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSGuidedAccessHasPasscodePreference, &v2);
  if (v2) {
    _kAXSCacheGuidedAccessHasPasscode = result;
  }
  return result;
}

@end