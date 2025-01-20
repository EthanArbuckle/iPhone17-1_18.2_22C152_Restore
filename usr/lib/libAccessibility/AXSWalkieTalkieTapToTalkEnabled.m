@interface AXSWalkieTalkieTapToTalkEnabled
@end

@implementation AXSWalkieTalkieTapToTalkEnabled

uint64_t ___AXSWalkieTalkieTapToTalkEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.AXSCacheWalkieTalkieTapToTalkNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSWalkieTalkieTapToTalkPreference, @"com.apple.accessibility.cache.AXSCacheWalkieTalkieTapToTalkNotification");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSWalkieTalkieTapToTalkPreference, &v2);
  if (v2) {
    _kAXSCacheWalkieTalkieTapToTalk = result;
  }
  return result;
}

@end