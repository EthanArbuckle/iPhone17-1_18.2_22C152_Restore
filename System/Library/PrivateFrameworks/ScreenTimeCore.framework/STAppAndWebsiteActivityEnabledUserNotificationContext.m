@interface STAppAndWebsiteActivityEnabledUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (STAppAndWebsiteActivityEnabledUserNotificationContext)init;
- (STAppAndWebsiteActivityEnabledUserNotificationContext)initWithCoder:(id)a3;
- (id)notificationBundleIdentifier;
- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4;
@end

@implementation STAppAndWebsiteActivityEnabledUserNotificationContext

- (STAppAndWebsiteActivityEnabledUserNotificationContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)STAppAndWebsiteActivityEnabledUserNotificationContext;
  return [(STUserNotificationContext *)&v3 initWithIdentifier:@"app_and_website_activity_enabled"];
}

- (STAppAndWebsiteActivityEnabledUserNotificationContext)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STAppAndWebsiteActivityEnabledUserNotificationContext;
  return [(STUserNotificationContext *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__STAppAndWebsiteActivityEnabledUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E6BC7080;
  id v12 = v6;
  id v13 = v7;
  v10.receiver = self;
  v10.super_class = (Class)STAppAndWebsiteActivityEnabledUserNotificationContext;
  id v8 = v7;
  id v9 = v6;
  [(STUserNotificationContext *)&v10 customizeNotificationContent:v9 withCompletionBlock:v11];
}

uint64_t __106__STAppAndWebsiteActivityEnabledUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = [NSString localizedUserNotificationStringForKey:@"AppAndWebsiteActivityEnabledUserNotificationTitle" arguments:0];
  [*(id *)(a1 + 32) setTitle:v2];

  objc_super v3 = [NSString localizedUserNotificationStringForKey:@"AppAndWebsiteActivityEnabledUserNotificationBody" arguments:0];
  [*(id *)(a1 + 32) setBody:v3];

  [*(id *)(a1 + 32) setShouldIgnoreDoNotDisturb:1];
  [*(id *)(a1 + 32) setShouldSuppressScreenLightUp:1];
  [*(id *)(a1 + 32) setCategoryIdentifier:@"com.apple.screentime.enabled"];
  objc_super v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (id)notificationBundleIdentifier
{
  return @"com.apple.ScreenTimeEnabledNotifications";
}

@end