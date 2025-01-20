@interface AXSBrailleScreenInputEnabled
@end

@implementation AXSBrailleScreenInputEnabled

uint64_t ___AXSBrailleScreenInputEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.bsi", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSBrailleScreenInputEnabledPreference, @"com.apple.accessibility.cache.bsi");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSBrailleScreenInputEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheBrailleScreenInputEnabled = result;
  }
  return result;
}

@end