@interface STDowntimeWarningUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (STDowntimeWarningUserNotificationContext)init;
- (STDowntimeWarningUserNotificationContext)initWithCoder:(id)a3;
- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4;
- (void)setTimeLeft:(double)a3;
@end

@implementation STDowntimeWarningUserNotificationContext

- (STDowntimeWarningUserNotificationContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)STDowntimeWarningUserNotificationContext;
  return [(STUserNotificationContext *)&v3 initWithIdentifier:@"device_downtime_warning"];
}

- (STDowntimeWarningUserNotificationContext)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)STDowntimeWarningUserNotificationContext;
  return [(STUserNotificationContext *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setTimeLeft:(double)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  [v5 setAllowedUnits:64];
  [v5 setUnitsStyle:3];
  v6 = [v5 stringFromTimeInterval:ceil(a3 / 60.0) * 60.0];
  v8[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(STUserNotificationContext *)self setLocalizedUserNotificationBodyArguments:v7];
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__STDowntimeWarningUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E6BC6F40;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  v10.receiver = self;
  v10.super_class = (Class)STDowntimeWarningUserNotificationContext;
  id v8 = v7;
  id v9 = v6;
  [(STUserNotificationContext *)&v10 customizeNotificationContent:v9 withCompletionBlock:v11];
}

uint64_t __93__STDowntimeWarningUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = [NSString localizedUserNotificationStringForKey:@"DowntimeWarningUserNotificationTitle" arguments:0];
  [*(id *)(a1 + 32) setTitle:v2];

  objc_super v3 = NSString;
  objc_super v4 = [*(id *)(a1 + 40) localizedUserNotificationBodyArguments];
  v5 = [v3 localizedUserNotificationStringForKey:@"DowntimeWarningUserNotificationBody" arguments:v4];
  [*(id *)(a1 + 32) setBody:v5];

  [*(id *)(a1 + 32) setInterruptionLevel:2];
  [*(id *)(a1 + 32) setShouldSuppressScreenLightUp:1];
  BKSDisplayBrightnessGetCurrent();
  if (v6 == 0.0) {
    [*(id *)(a1 + 32) setSound:0];
  }
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v7();
}

@end