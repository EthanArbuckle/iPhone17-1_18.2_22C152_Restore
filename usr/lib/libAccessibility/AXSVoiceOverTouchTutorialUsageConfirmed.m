@interface AXSVoiceOverTouchTutorialUsageConfirmed
@end

@implementation AXSVoiceOverTouchTutorialUsageConfirmed

uint64_t ___AXSVoiceOverTouchTutorialUsageConfirmed_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.vo.usage.tutorial.confirm", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSVoiceOverTouchTutorialUsageConfirmedPreference, @"com.apple.accessibility.cache.vo.usage.tutorial.confirm");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchTutorialUsageConfirmedPreference, &v2);
  if (v2) {
    _kAXSCacheVoiceOverTutorialUsageConfirmation = result;
  }
  return result;
}

@end