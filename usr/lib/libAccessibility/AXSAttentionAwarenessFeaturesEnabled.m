@interface AXSAttentionAwarenessFeaturesEnabled
@end

@implementation AXSAttentionAwarenessFeaturesEnabled

uint64_t ___AXSAttentionAwarenessFeaturesEnabled_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _AXSAttentionAwarenessFeaturesEnabled_supported = result;
  return result;
}

uint64_t ___AXSAttentionAwarenessFeaturesEnabled_block_invoke_1917()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.attention.awareness", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSAttentionAwarenessFeaturesEnabledPreference, @"com.apple.accessibility.cache.attention.awareness");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSAttentionAwarenessFeaturesEnabledPreference, &v2);
  if (v2) {
    _kAXSCacheAttentionAwarenessFeaturesEnabled = result;
  }
  return result;
}

@end