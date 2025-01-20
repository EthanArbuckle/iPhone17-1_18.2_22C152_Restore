@interface AXSSpatialAudioHeadTracking
@end

@implementation AXSSpatialAudioHeadTracking

void ___AXSSpatialAudioHeadTracking_block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, @"com.apple.accessibility.SpatialAudioHeadTracking.notification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  ObservePreferenceLocal(@"AXSSpatialAudioHeadTracking", @"com.apple.accessibility.SpatialAudioHeadTracking.notification");
  char v6 = 1;
  CFNumberRef v1 = (const __CFNumber *)_copyValuePreferenceApp(@"AXSSpatialAudioHeadTracking", 0, &v6);
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
      _kAXSCacheSpatialAudioHeadTracking = valuePtr;
    }
    goto LABEL_10;
  }
  if (v1) {
LABEL_10:
  }
    CFRelease(v2);
}

@end