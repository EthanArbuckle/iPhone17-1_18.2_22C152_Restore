@interface UNSUserNotificationServerSettings
+ (id)settingsControllerModule;
@end

@implementation UNSUserNotificationServerSettings

+ (id)settingsControllerModule
{
  return (id)[MEMORY[0x263F622D8] moduleWithTitle:@"UserNotifications" contents:MEMORY[0x263EFFA68]];
}

@end