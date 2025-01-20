@interface AXSVoiceOverTouchUsageConfirmed
@end

@implementation AXSVoiceOverTouchUsageConfirmed

uint64_t ___AXSVoiceOverTouchUsageConfirmed_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.vo.usage.confirm", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSVoiceOverTouchUsageConfirmedPreference, @"com.apple.accessibility.cache.vo.usage.confirm");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchUsageConfirmedPreference, &v2);
  if (v2) {
    _kAXSCacheVoiceOverUsageConfirmation = result;
  }
  return result;
}

@end