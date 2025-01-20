@interface AXSUserEnabledPasscodeForPurchases
@end

@implementation AXSUserEnabledPasscodeForPurchases

uint64_t ___AXSUserEnabledPasscodeForPurchases_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.passcode.purchases", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSPasscodeForPurchasesPreference, @"com.apple.accessibility.cache.passcode.purchases");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSPasscodeForPurchasesPreference, &v2);
  if (v2) {
    _kAXSCachePasscodeForPurchases = result;
  }
  return result;
}

@end