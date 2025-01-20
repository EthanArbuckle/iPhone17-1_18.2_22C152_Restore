@interface UNUserNotificationCenter
+ (id)weatherNotificationCenter;
@end

@implementation UNUserNotificationCenter

+ (id)weatherNotificationCenter
{
  id v2 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.weather"];
  return v2;
}

@end