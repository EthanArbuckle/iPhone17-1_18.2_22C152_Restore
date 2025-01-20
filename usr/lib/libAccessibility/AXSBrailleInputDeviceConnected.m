@interface AXSBrailleInputDeviceConnected
@end

@implementation AXSBrailleInputDeviceConnected

uint64_t ___AXSBrailleInputDeviceConnected_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.braille.input.connection.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSBrailleInputDeviceConnectedPreference, @"com.apple.accessibility.cache.braille.input.connection.changed");
  char v2 = 1;
  uint64_t result = _getBooleanPreference((const __CFString *)kAXSBrailleInputDeviceConnectedPreference, &v2);
  if (v2) {
    _kAXSCacheBrailleInputDeviceConnected = result;
  }
  return result;
}

@end