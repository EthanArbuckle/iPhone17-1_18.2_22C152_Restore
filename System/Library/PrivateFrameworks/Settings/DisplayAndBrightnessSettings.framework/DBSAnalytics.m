@interface DBSAnalytics
+ (BOOL)checkAndUpdateFirst:(id)a3;
+ (BOOL)isChild;
+ (void)logAutomaticDarkModeEvent:(BOOL)a3;
+ (void)logBoldTextEvent:(BOOL)a3;
+ (void)logDarkModeEvent:(BOOL)a3;
+ (void)logEvent:(id)a3 feature:(id)a4 value:(id)a5;
+ (void)logTextSizeEvent:(id)a3;
@end

@implementation DBSAnalytics

+ (void)logDarkModeEvent:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [a1 logEvent:@"DarkMode" feature:@"dark_mode" value:v4];
}

+ (void)logAutomaticDarkModeEvent:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [a1 logEvent:@"AutomaticDarkMode" feature:@"automatic_dark_mode" value:v4];
}

+ (void)logTextSizeEvent:(id)a3
{
}

+ (void)logBoldTextEvent:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [a1 logEvent:@"BoldText" feature:@"bold_text" value:v4];
}

+ (void)logEvent:(id)a3 feature:(id)a4 value:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)MEMORY[0x263EFFA40];
  id v11 = a3;
  v12 = (void *)[[v10 alloc] initWithSuiteName:@"com.apple.purplebuddy.notbackedup"];
  uint64_t v13 = [v12 stringForKey:@"AppearanceModeChoice"];
  if (v13) {
    v14 = (__CFString *)v13;
  }
  else {
    v14 = &stru_26E931C58;
  }
  [a1 checkAndUpdateFirst:v11];

  v18 = v8;
  v19 = v9;
  id v15 = v9;
  id v16 = v8;
  v17 = v14;
  AnalyticsSendEventLazy();
}

id __39__DBSAnalytics_logEvent_feature_value___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v6[0] = @"child_account";
  v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 56), "isChild"));
  v7[0] = v2;
  v6[1] = @"first_update";
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v7[1] = v3;
  long long v8 = *(_OWORD *)(a1 + 32);
  v6[2] = @"original_size";
  v6[3] = @"update_feature";
  v6[4] = @"update_option";
  uint64_t v9 = *(void *)(a1 + 48);
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:5];

  return v4;
}

+ (BOOL)isChild
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.purplebuddy.notbackedup"];
  v3 = [v2 objectForKey:@"disposition"];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKey:@"child"];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)checkAndUpdateFirst:(id)a3
{
  v3 = [@"DBSSettingsUpdated-" stringByAppendingString:a3];
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v5 = [v4 BOOLForKey:v3] ^ 1;

  char v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v6 setBool:1 forKey:v3];

  return v5;
}

@end