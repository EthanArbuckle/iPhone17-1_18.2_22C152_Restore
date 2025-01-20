@interface AXSSiriSemanticContextEnabled
@end

@implementation AXSSiriSemanticContextEnabled

uint64_t ___AXSSiriSemanticContextEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.siri.semantic.context.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSSiriSemanticContextEnabledPreference, @"com.apple.accessibility.cache.siri.semantic.context.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSSiriSemanticContextEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheSiriSemanticContextEnabled = result;
  }
  return result;
}

@end