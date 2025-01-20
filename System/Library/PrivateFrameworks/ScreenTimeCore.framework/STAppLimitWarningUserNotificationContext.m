@interface STAppLimitWarningUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4;
- (void)setLimitDisplayName:(id)a3 timeLeft:(double)a4;
@end

@implementation STAppLimitWarningUserNotificationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setLimitDisplayName:(id)a3 timeLeft:(double)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 length])
  {
    v7 = objc_opt_new();
    [v7 setAllowedUnits:64];
    [v7 setUnitsStyle:3];
    v8 = [v7 stringFromTimeInterval:a4];
    v10[0] = v8;
    v10[1] = v6;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    [(STUserNotificationContext *)self setLocalizedUserNotificationBodyArguments:v9];
  }
  else
  {
    [(STUserNotificationContext *)self setLocalizedUserNotificationBodyArguments:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__STAppLimitWarningUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E6BC6F40;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  v10.receiver = self;
  v10.super_class = (Class)STAppLimitWarningUserNotificationContext;
  id v8 = v7;
  id v9 = v6;
  [(STUserNotificationContext *)&v10 customizeNotificationContent:v9 withCompletionBlock:v11];
}

uint64_t __93__STAppLimitWarningUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = [NSString localizedUserNotificationStringForKey:@"AppLimitWarningUserNotificationTitle" arguments:0];
  [*(id *)(a1 + 32) setTitle:v2];

  v3 = NSString;
  v4 = [*(id *)(a1 + 40) localizedUserNotificationBodyArguments];
  v5 = [v3 localizedUserNotificationStringForKey:@"AppLimitWarningUserNotificationBody" arguments:v4];
  [*(id *)(a1 + 32) setBody:v5];

  [*(id *)(a1 + 32) setInterruptionLevel:2];
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v6();
}

@end