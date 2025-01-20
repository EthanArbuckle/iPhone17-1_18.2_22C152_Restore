@interface AXSVoiceOverTouchScreenCurtainEnabled
@end

@implementation AXSVoiceOverTouchScreenCurtainEnabled

uint64_t ___AXSVoiceOverTouchScreenCurtainEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.vo.screen.curtain", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSVoiceOverTouchScreenCurtainPreference, @"com.apple.accessibility.cache.vo.screen.curtain");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchScreenCurtainPreference, &v2);
  if (v2) {
    _kAXSCacheVoiceOverScreenCurtain = result;
  }
  return result;
}

@end