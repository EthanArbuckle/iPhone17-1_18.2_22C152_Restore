@interface AXSHoverTextTypingEnabled
@end

@implementation AXSHoverTextTypingEnabled

uint64_t ___AXSHoverTextTypingEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.hovertext.typing", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSHoverTextTypingEnabledPreference, @"com.apple.accessibility.cache.hovertext.typing");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSHoverTextTypingEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheHoverTextTypingEnabled = result;
  }
  return result;
}

@end