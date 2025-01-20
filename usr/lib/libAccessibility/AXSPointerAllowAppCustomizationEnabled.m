@interface AXSPointerAllowAppCustomizationEnabled
@end

@implementation AXSPointerAllowAppCustomizationEnabled

uint64_t ___AXSPointerAllowAppCustomizationEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pointer.allow.app.customization", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSPointerAllowAppCustomizationEnabledPreference, @"com.apple.accessibility.cache.pointer.allow.app.customization");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSPointerAllowAppCustomizationEnabledPreference, &v2);
  if (v2) {
    _kAXSCachePointerAllowAppCustomizationEnabled = result;
  }
  return result;
}

@end