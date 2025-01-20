@interface AXSFaceTimeCaptionsEnabled
@end

@implementation AXSFaceTimeCaptionsEnabled

uint64_t ___AXSFaceTimeCaptionsEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.FaceTimeCaptions", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSFaceTimeCaptionsPreference, @"com.apple.accessibility.cache.FaceTimeCaptions");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSFaceTimeCaptionsPreference, &v2);
  if (v2) {
    _kAXSCacheFaceTimeCaptionsEnabled = result;
  }
  return result;
}

@end