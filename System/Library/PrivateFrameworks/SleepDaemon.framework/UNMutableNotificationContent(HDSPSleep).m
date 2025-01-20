@interface UNMutableNotificationContent(HDSPSleep)
+ (id)hdsp_notificationContentWithEnvironment:()HDSPSleep;
@end

@implementation UNMutableNotificationContent(HDSPSleep)

+ (id)hdsp_notificationContentWithEnvironment:()HDSPSleep
{
  id v0 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  [v0 setThreadIdentifier:*MEMORY[0x263F75AE0]];

  return v0;
}

@end