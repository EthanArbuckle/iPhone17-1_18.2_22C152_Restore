@interface AXSPencilExtendedSqueezeRangeEnabled
@end

@implementation AXSPencilExtendedSqueezeRangeEnabled

uint64_t ___AXSPencilExtendedSqueezeRangeEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pencil.extended.squeeze.range", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(@"AXSPencilExtendedSqueezeRangeEnabledPreference", @"com.apple.accessibility.cache.pencil.extended.squeeze.range");
  char v2 = 1;
  uint64_t result = _getBooleanPreference(@"AXSPencilExtendedSqueezeRangeEnabledPreference", &v2);
  if (v2) {
    _kAXSCachePencilExtendedSqueezeRangeEnabled = result;
  }
  return result;
}

@end