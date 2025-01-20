@interface AXSMotionCuesEnabled
@end

@implementation AXSMotionCuesEnabled

uint64_t ___AXSMotionCuesEnabled_block_invoke()
{
  if (_kAXSCacheMotionCuesDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)_kAXSCacheMotionCuesDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    ObservePreferenceLocal(kAXSMotionCuesEnabledPreference, _kAXSCacheMotionCuesDidChangeNotification);
  }
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSMotionCuesEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheMotionCuesEnabled = result;
  }
  return result;
}

@end