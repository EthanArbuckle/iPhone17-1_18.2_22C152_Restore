@interface AXSAutomaticSubtitlesShowWhenMuted
@end

@implementation AXSAutomaticSubtitlesShowWhenMuted

uint64_t ___AXSAutomaticSubtitlesShowWhenMuted_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.AutomationSubtitlesShowWhenMuted", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAutomaticSubtitlesShowWhenMutedPreference, @"com.apple.accessibility.cache.AutomationSubtitlesShowWhenMuted");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowWhenMutedPreference, &v2);
  if (v2) {
    _kAXSCacheAutomaticSubtitlesShowWhenMuted = result;
  }
  return result;
}

@end