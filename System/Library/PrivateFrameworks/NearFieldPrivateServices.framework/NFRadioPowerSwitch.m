@interface NFRadioPowerSwitch
- (BOOL)canRun;
- (id)serviceName;
- (void)requestUserSettingsNotificationWithCompletion:(id)a3 popupInterval:(double)a4;
@end

@implementation NFRadioPowerSwitch

- (BOOL)canRun
{
  return 1;
}

- (id)serviceName
{
  return @"com.apple.stockholm.services.NFRadioPowerSwitch";
}

- (void)requestUserSettingsNotificationWithCompletion:(id)a3 popupInterval:(double)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v13 = @"PopupInterval";
  v7 = [NSNumber numberWithDouble:a4];
  v14[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__NFRadioPowerSwitch_requestUserSettingsNotificationWithCompletion_popupInterval___block_invoke;
  v11[3] = &unk_265429608;
  id v12 = v6;
  v10.receiver = self;
  v10.super_class = (Class)NFRadioPowerSwitch;
  id v9 = v6;
  [(NFPrivateService *)&v10 runService:v8 withCompletion:v11];
}

void __82__NFRadioPowerSwitch_requestUserSettingsNotificationWithCompletion_popupInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 valueForKey:@"Error"];
  v4 = [v3 valueForKey:@"UserResponse"];

  [v4 integerValue];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end