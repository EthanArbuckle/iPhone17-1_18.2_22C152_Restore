@interface AXSGetUSBRMDisablers
@end

@implementation AXSGetUSBRMDisablers

void ___AXSGetUSBRMDisablers_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.cache.AXSUSBRMDisablersNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(kAXSUSBRMDisablersPreference, @"com.apple.accessibility.cache.AXSUSBRMDisablersNotification");
  char v6 = 1;
  CFNumberRef v1 = (const __CFNumber *)_copyValuePreferenceApp((const __CFString *)kAXSUSBRMDisablersPreference, 0, &v6);
  CFNumberRef v2 = v1;
  if (v6) {
    BOOL v3 = v1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    CFTypeID v4 = CFGetTypeID(v1);
    if (v4 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue(v2, kCFNumberIntType, &valuePtr);
      _kAXSCacheUSBRMDisablers = valuePtr;
    }
    goto LABEL_10;
  }
  if (v1) {
LABEL_10:
  }
    CFRelease(v2);
}

@end