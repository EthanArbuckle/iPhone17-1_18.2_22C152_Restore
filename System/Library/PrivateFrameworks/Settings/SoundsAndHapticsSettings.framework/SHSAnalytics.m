@interface SHSAnalytics
+ (void)trackingDualSIMToneValueChanged:(id)a3 didSelectDifferentTones:(BOOL)a4;
+ (void)trackingVibrateOnRingValueChanged:(BOOL)a3 age:(unint64_t)a4;
+ (void)trackingVibrateOnSilentValueChanged:(BOOL)a3 age:(unint64_t)a4;
@end

@implementation SHSAnalytics

+ (void)trackingVibrateOnRingValueChanged:(BOOL)a3 age:(unint64_t)a4
{
}

id __54__SHSAnalytics_trackingVibrateOnRingValueChanged_age___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"value";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = @"age";
  v7[0] = v2;
  v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (void)trackingVibrateOnSilentValueChanged:(BOOL)a3 age:(unint64_t)a4
{
}

id __56__SHSAnalytics_trackingVibrateOnSilentValueChanged_age___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"value";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = @"age";
  v7[0] = v2;
  v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (void)trackingDualSIMToneValueChanged:(id)a3 didSelectDifferentTones:(BOOL)a4
{
  BOOL v4 = a4;
  v17[2] = *MEMORY[0x263EF8340];
  v16[0] = @"alertType";
  v16[1] = @"isDualSIMToneDifferent";
  v17[0] = a3;
  v5 = NSNumber;
  id v6 = a3;
  v7 = [v5 numberWithBool:v4];
  v17[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  v9 = SHSLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    v11 = "+[SHSAnalytics trackingDualSIMToneValueChanged:didSelectDifferentTones:]";
    __int16 v12 = 2112;
    v13 = @"com.apple.settings.didChangeDualSIMToneSettings";
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_237305000, v9, OS_LOG_TYPE_DEFAULT, "%s Sending analytics event: %@ with payload: %@", (uint8_t *)&v10, 0x20u);
  }

  AnalyticsSendEvent();
}

@end