@interface AXSEarpieceNoiseCancellationEnabled
@end

@implementation AXSEarpieceNoiseCancellationEnabled

uint64_t ___AXSEarpieceNoiseCancellationEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.earpiece.noise", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSEarpieceNoiseCancellationPreference, @"com.apple.accessibility.cache.earpiece.noise");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSEarpieceNoiseCancellationPreference, &v2);
  if (v2) {
    _kAXSCacheEarpieceNoiseCancellation = result;
  }
  return result;
}

@end