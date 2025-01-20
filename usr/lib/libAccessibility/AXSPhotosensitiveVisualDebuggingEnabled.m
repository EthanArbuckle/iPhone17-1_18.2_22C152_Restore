@interface AXSPhotosensitiveVisualDebuggingEnabled
@end

@implementation AXSPhotosensitiveVisualDebuggingEnabled

uint64_t ___AXSPhotosensitiveVisualDebuggingEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.pse.visual.debugging", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(@"PhotosensitiveVisualDebugging", @"com.apple.accessibility.cache.pse.visual.debugging");
  char v2 = 1;
  uint64_t result = _getBooleanPreference(@"PhotosensitiveVisualDebugging", &v2);
  if (v2) {
    _kAXSCachePhotosensitiveVisualDebuggingEnabled = result;
  }
  return result;
}

@end