@interface AXSPointerIncreasedContrastEnabled
@end

@implementation AXSPointerIncreasedContrastEnabled

uint64_t ___AXSPointerIncreasedContrastEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pointer.increased.contrast", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSPointerIncreasedContrastEnabledPreference, @"com.apple.accessibility.cache.pointer.increased.contrast");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSPointerIncreasedContrastEnabledPreference, &v2);
  if (v2) {
    _kAXSCachePointerIncreasedContrastEnabled = result;
  }
  return result;
}

@end