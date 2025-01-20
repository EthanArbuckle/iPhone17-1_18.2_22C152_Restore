@interface AXSReduceMotionAutoplayMessagesEffectsEnabled
@end

@implementation AXSReduceMotionAutoplayMessagesEffectsEnabled

uint64_t ___AXSReduceMotionAutoplayMessagesEffectsEnabled_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.reduce.motion.autoplay.messages.effects", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  char v2 = 0;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSReduceMotionAutoplayMessagesEffectsPreference, &v2);
  if (!v2) {
    uint64_t result = !_AXSReduceMotionEnabled();
  }
  _kAXSCacheReduceMotionAutoplayMessagesEffectsEnabled = result;
  return result;
}

@end