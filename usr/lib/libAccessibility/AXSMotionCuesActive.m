@interface AXSMotionCuesActive
@end

@implementation AXSMotionCuesActive

uint64_t ___AXSMotionCuesActive_block_invoke()
{
  if (_kAXSCacheMotionCuesActiveDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)_kAXSCacheMotionCuesActiveDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    ObservePreferenceLocal(@"AXSMotionCuesActive", _kAXSCacheMotionCuesActiveDidChangeNotification);
  }
  char v2 = 1;
  uint64_t result = _getBooleanPreference(@"AXSMotionCuesActive", &v2);
  if (v2) {
    _kAXSCacheMotionCuesActive = result;
  }
  return result;
}

@end