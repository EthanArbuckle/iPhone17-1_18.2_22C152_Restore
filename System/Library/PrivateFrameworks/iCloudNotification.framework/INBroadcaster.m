@interface INBroadcaster
+ (void)broadcastFamilyDidChangeNotification;
@end

@implementation INBroadcaster

+ (void)broadcastFamilyDidChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)INFamilyDidChangeNotification;
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
}

@end