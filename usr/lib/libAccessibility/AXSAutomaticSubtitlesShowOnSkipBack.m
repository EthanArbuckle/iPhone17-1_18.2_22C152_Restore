@interface AXSAutomaticSubtitlesShowOnSkipBack
@end

@implementation AXSAutomaticSubtitlesShowOnSkipBack

uint64_t ___AXSAutomaticSubtitlesShowOnSkipBack_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.AutomationSubtitlesShowOnSkipBack", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAutomaticSubtitlesShowOnSkipBackPreference, @"com.apple.accessibility.cache.AutomationSubtitlesShowOnSkipBack");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowOnSkipBackPreference, &v2);
  if (v2) {
    _kAXSCacheAutomaticSubtitlesShowOnSkipBack = result;
  }
  return result;
}

@end