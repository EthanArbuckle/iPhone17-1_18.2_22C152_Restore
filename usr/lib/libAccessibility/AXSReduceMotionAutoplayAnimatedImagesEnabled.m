@interface AXSReduceMotionAutoplayAnimatedImagesEnabled
@end

@implementation AXSReduceMotionAutoplayAnimatedImagesEnabled

uint64_t ___AXSReduceMotionAutoplayAnimatedImagesEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.reduce.motion.autoplay.animated.images", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSReduceMotionAutoplayAnimatedImagesPreference, @"com.apple.accessibility.cache.reduce.motion.autoplay.animated.images");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSReduceMotionAutoplayAnimatedImagesPreference, &v2);
  if (v2) {
    _kAXSCacheReduceMotionAutoplayAnimatedImagesEnabled = result;
  }
  return result;
}

@end