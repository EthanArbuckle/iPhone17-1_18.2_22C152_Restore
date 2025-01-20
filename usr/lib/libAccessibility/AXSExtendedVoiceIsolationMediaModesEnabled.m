@interface AXSExtendedVoiceIsolationMediaModesEnabled
@end

@implementation AXSExtendedVoiceIsolationMediaModesEnabled

uint64_t ___AXSExtendedVoiceIsolationMediaModesEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.extendedvoiceisolationmodes", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSExtendedVoiceIsolationMediaModesEnabledPreference, @"com.apple.accessibility.cache.extendedvoiceisolationmodes");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSExtendedVoiceIsolationMediaModesEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheExtendedVoiceIsolationMediaModesEnabled = result;
  }
  return result;
}

@end