@interface AXSLiveHeadphoneLevelEnabled
@end

@implementation AXSLiveHeadphoneLevelEnabled

uint64_t ___AXSLiveHeadphoneLevelEnabled_block_invoke()
{
  if (kAXSLiveHeadphoneLevelEnabledDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)kAXSLiveHeadphoneLevelEnabledDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    ObservePreferenceLocal(kAXSLiveHeadphoneLevelEnabledPreference, kAXSLiveHeadphoneLevelEnabledDidChangeNotification);
  }
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSLiveHeadphoneLevelEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheLiveHeadphoneLevelEnabled = result;
  }
  return result;
}

@end