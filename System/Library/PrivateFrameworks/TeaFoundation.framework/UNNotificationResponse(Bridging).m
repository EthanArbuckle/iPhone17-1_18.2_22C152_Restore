@interface UNNotificationResponse(Bridging)
+ (uint64_t)responseWithNotification:()Bridging;
@end

@implementation UNNotificationResponse(Bridging)

+ (uint64_t)responseWithNotification:()Bridging
{
  return [MEMORY[0x1E4F44630] responseWithNotification:a3 actionIdentifier:&stru_1EE2C21A0];
}

@end