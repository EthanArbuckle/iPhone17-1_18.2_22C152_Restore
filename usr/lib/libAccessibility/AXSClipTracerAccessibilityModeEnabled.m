@interface AXSClipTracerAccessibilityModeEnabled
@end

@implementation AXSClipTracerAccessibilityModeEnabled

uint64_t ___AXSClipTracerAccessibilityModeEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.clip.tracer.enabled", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSClipTracerAccessibilityModeEnabledPreference, @"com.apple.accessibility.cache.clip.tracer.enabled");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSClipTracerAccessibilityModeEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheClipTracerAccessibilityModeEnabled = result;
  }
  return result;
}

@end