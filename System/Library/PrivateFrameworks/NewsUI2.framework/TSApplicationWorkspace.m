@interface TSApplicationWorkspace
+ (void)openAppleAccountLoginSettings;
+ (void)openNewsSettings;
+ (void)openNewsSystemNotificationSettings;
@end

@implementation TSApplicationWorkspace

+ (void)openNewsSettings
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=NEWS"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

+ (void)openAppleAccountLoginSettings
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

+ (void)openNewsSystemNotificationSettings
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=NEWS&path=NOTIFICATIONS"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

@end