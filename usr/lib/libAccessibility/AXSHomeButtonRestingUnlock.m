@interface AXSHomeButtonRestingUnlock
@end

@implementation AXSHomeButtonRestingUnlock

uint64_t ___AXSHomeButtonRestingUnlock_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.resting.home.button.unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSRestingHomeButtonUnlockPreference, @"com.apple.accessibility.cache.resting.home.button.unlock");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSRestingHomeButtonUnlockPreference, &v2);
  if (v2) {
    _kAXSCacheRestingHomeButtonUnlockEnabled = result;
  }
  return result;
}

@end