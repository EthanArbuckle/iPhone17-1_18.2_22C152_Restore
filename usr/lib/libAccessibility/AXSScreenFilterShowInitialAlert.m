@interface AXSScreenFilterShowInitialAlert
@end

@implementation AXSScreenFilterShowInitialAlert

uint64_t ___AXSScreenFilterShowInitialAlert_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.displayfilter.showinitialalert", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSDisplayFilterShowInitialAlertPreference, @"com.apple.accessibility.cache.displayfilter.showinitialalert");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSDisplayFilterShowInitialAlertPreference, &v2);
  if (v2) {
    _kAXSCacheDisplayFilterShowInitialAlert = result;
  }
  return result;
}

@end