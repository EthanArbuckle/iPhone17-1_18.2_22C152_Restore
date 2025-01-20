@interface AXSSpeakThisHighlightVisible
@end

@implementation AXSSpeakThisHighlightVisible

uint64_t ___AXSSpeakThisHighlightVisible_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.speak.this.highlight.visible", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSSpeakThisHighlightVisiblePreference, @"com.apple.accessibility.cache.speak.this.highlight.visible");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSSpeakThisHighlightVisiblePreference, &v2);
  if (v2) {
    _kAXSCacheSpeakThisHighlightVisible = result;
  }
  return result;
}

@end