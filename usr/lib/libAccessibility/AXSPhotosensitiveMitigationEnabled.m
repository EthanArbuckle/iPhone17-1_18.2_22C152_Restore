@interface AXSPhotosensitiveMitigationEnabled
@end

@implementation AXSPhotosensitiveMitigationEnabled

uint64_t ___AXSPhotosensitiveMitigationEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pse.mitigation", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(@"PhotosensitiveMitigation", @"com.apple.accessibility.cache.pse.mitigation");
  char v2 = 1;
  uint64_t result = _getBooleanPreference(@"PhotosensitiveMitigation", &v2);
  if (v2) {
    _kAXSCachePhotosensitiveMitigationEnabled = result;
  }
  return result;
}

@end