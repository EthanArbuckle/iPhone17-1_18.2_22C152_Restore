@interface AXSPearlRestingUnlockEverSet
@end

@implementation AXSPearlRestingUnlockEverSet

uint64_t ___AXSPearlRestingUnlockEverSet_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.resting.pearl.unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSRestingPearlUnlockPreference, @"com.apple.accessibility.cache.resting.pearl.unlock");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSRestingPearlUnlockPreference, &v2);
  if (v2) {
    _kAXSCacheRestingPearlUnlockEnabled = result;
  }
  return result;
}

@end