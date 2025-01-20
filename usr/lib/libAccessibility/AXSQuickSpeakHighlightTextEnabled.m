@interface AXSQuickSpeakHighlightTextEnabled
@end

@implementation AXSQuickSpeakHighlightTextEnabled

uint64_t ___AXSQuickSpeakHighlightTextEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.quick.speak.highlight.text", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSQuickSpeakHighlightTextEnabledPreference, @"com.apple.accessibility.cache.quick.speak.highlight.text");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSQuickSpeakHighlightTextEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheQuickSpeakHighlightTextEnabled = result;
  }
  return result;
}

@end