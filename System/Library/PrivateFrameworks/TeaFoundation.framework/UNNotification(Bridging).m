@interface UNNotification(Bridging)
+ (id)notificationWithRequest:()Bridging;
@end

@implementation UNNotification(Bridging)

+ (id)notificationWithRequest:()Bridging
{
  v3 = (void *)MEMORY[0x1E4F445C8];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v3 notificationWithRequest:v4 date:v5 sourceIdentifier:&stru_1EE2C21A0 intentIdentifiers:MEMORY[0x1E4F1CBF0]];

  return v6;
}

@end