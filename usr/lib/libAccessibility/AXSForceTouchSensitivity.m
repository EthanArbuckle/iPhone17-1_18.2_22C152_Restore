@interface AXSForceTouchSensitivity
@end

@implementation AXSForceTouchSensitivity

void ___AXSForceTouchSensitivity_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.forcetouch.sensitivity.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceDistributed(kAXSForceTouchSensitivityPreference, @"com.apple.accessibility.cache.forcetouch.sensitivity.changed");
  char v2 = 1;
  float FloatPreference = _getFloatPreference((const __CFString *)kAXSForceTouchSensitivityPreference, 0, &v2);
  if (v2) {
    _kAXSCachedForceTouchSensitivity = LODWORD(FloatPreference);
  }
}

@end