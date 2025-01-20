@interface AXSPointerEffectScalingEnabled
@end

@implementation AXSPointerEffectScalingEnabled

uint64_t ___AXSPointerEffectScalingEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pointer.effect.scaling", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSPointerEffectScalingEnabledPreference, @"com.apple.accessibility.cache.pointer.effect.scaling");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSPointerEffectScalingEnabledPreference, &v2);
  if (v2) {
    _kAXSCachePointerEffectScalingEnabled = result;
  }
  return result;
}

@end