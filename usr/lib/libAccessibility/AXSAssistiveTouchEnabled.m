@interface AXSAssistiveTouchEnabled
@end

@implementation AXSAssistiveTouchEnabled

uint64_t ___AXSAssistiveTouchEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.ast", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAssistiveTouchEnabledPreference, @"com.apple.accessibility.cache.ast");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchEnabledPreference, &v2);
  if (v2) {
    _kAXSAssistiveTouchEnabledCache = result;
  }
  return result;
}

@end