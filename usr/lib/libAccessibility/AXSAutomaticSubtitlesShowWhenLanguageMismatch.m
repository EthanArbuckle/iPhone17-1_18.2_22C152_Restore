@interface AXSAutomaticSubtitlesShowWhenLanguageMismatch
@end

@implementation AXSAutomaticSubtitlesShowWhenLanguageMismatch

uint64_t ___AXSAutomaticSubtitlesShowWhenLanguageMismatch_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.AutomaticSubtitlesShowWhenLanguageMismatch", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAutomaticSubtitlesShowWhenLanguageMismatchPreference, @"com.apple.accessibility.cache.AutomaticSubtitlesShowWhenLanguageMismatch");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowWhenLanguageMismatchPreference, &v2);
  if (v2) {
    _kAXSCacheAutomaticSubtitlesShowWhenLanguageMismatch = result;
  }
  return result;
}

@end