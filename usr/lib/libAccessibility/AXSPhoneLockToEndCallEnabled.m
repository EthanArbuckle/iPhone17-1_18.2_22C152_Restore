@interface AXSPhoneLockToEndCallEnabled
@end

@implementation AXSPhoneLockToEndCallEnabled

uint64_t ___AXSPhoneLockToEndCallEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.lock.to.end.call", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSPhoneLockToEndCallPreference, @"com.apple.accessibility.cache.lock.to.end.call");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSPhoneLockToEndCallPreference, &v2);
  if (v2) {
    _kAXSCachePhoneLockToEndCall = result;
  }
  return result;
}

@end