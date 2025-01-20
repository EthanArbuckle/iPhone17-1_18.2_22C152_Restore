@interface AXSPhotosensitiveSourceCopyDebuggingEnabled
@end

@implementation AXSPhotosensitiveSourceCopyDebuggingEnabled

uint64_t ___AXSPhotosensitiveSourceCopyDebuggingEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pse.source.copy.debugging", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(@"PhotosensitiveSourceCopyDebugging", @"com.apple.accessibility.cache.pse.source.copy.debugging");
  char v2 = 1;
  uint64_t result = _getBooleanPreference(@"PhotosensitiveSourceCopyDebugging", &v2);
  if (v2) {
    _kAXSCachePhotosensitiveSourceCopyDebuggingEnabled = result;
  }
  return result;
}

@end