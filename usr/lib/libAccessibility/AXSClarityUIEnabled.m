@interface AXSClarityUIEnabled
@end

@implementation AXSClarityUIEnabled

uint64_t ___AXSClarityUIEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.clarityui", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSClarityUIEnabledPreference, @"com.apple.accessibility.cache.clarityui");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSClarityUIEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheClarityUIEnabled = result;
  }
  return result;
}

@end