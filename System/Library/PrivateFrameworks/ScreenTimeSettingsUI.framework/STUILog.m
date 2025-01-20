@interface STUILog
+ (NSDictionary)logCategories;
+ (OS_os_log)accessList;
+ (OS_os_log)alwaysAllowed;
+ (OS_os_log)apps;
+ (OS_os_log)budgets;
+ (OS_os_log)childSetup;
+ (OS_os_log)communication;
+ (OS_os_log)communicationSafety;
+ (OS_os_log)contentPrivacy;
+ (OS_os_log)eyeRelief;
+ (OS_os_log)icons;
+ (OS_os_log)persistence;
+ (OS_os_log)requests;
+ (OS_os_log)usage;
+ (OS_os_log)users;
@end

@implementation STUILog

+ (NSDictionary)logCategories
{
  if (logCategories_onceToken != -1) {
    dispatch_once(&logCategories_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)logCategories__logCategories;

  return (NSDictionary *)v2;
}

void __24__STUILog_logCategories__block_invoke()
{
  v17[14] = *MEMORY[0x263EF8340];
  v16[0] = @"accessList";
  os_log_t v15 = os_log_create("com.apple.screentime.settingsui", "accessList");
  v17[0] = v15;
  v16[1] = @"apps";
  os_log_t v14 = os_log_create("com.apple.screentime.settingsui", "apps");
  v17[1] = v14;
  v16[2] = @"budgets";
  os_log_t v13 = os_log_create("com.apple.screentime.settingsui", "budgets");
  v17[2] = v13;
  v16[3] = @"alwaysAllowed";
  os_log_t v12 = os_log_create("com.apple.screentime.settingsui", "alwaysAllowed");
  v17[3] = v12;
  v16[4] = @"communication";
  os_log_t v0 = os_log_create("com.apple.screentime.settingsui", "communication");
  v17[4] = v0;
  v16[5] = @"communicationSafety";
  os_log_t v1 = os_log_create("com.apple.screentime.settingsui", "communicationSafety");
  v17[5] = v1;
  v16[6] = @"contentPrivacy";
  os_log_t v2 = os_log_create("com.apple.screentime.settingsui", "contentPrivacy");
  v17[6] = v2;
  v16[7] = @"persistence";
  os_log_t v3 = os_log_create("com.apple.screentime.settingsui", "persistence");
  v17[7] = v3;
  v16[8] = @"usage";
  os_log_t v4 = os_log_create("com.apple.screentime.settingsui", "usage");
  v17[8] = v4;
  v16[9] = @"icons";
  os_log_t v5 = os_log_create("com.apple.screentime.settingsui", "icons");
  v17[9] = v5;
  v16[10] = @"requests";
  os_log_t v6 = os_log_create("com.apple.screentime.settingsui", "requests");
  v17[10] = v6;
  v16[11] = @"users";
  os_log_t v7 = os_log_create("com.apple.screentime.settingsui", "users");
  v17[11] = v7;
  v16[12] = @"childSetup";
  os_log_t v8 = os_log_create("com.apple.screentime.settingsui", "childSetup");
  v17[12] = v8;
  v16[13] = @"eyeRelief";
  os_log_t v9 = os_log_create("com.apple.screentime.settingsui", "eyeRelief");
  v17[13] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:14];
  v11 = (void *)logCategories__logCategories;
  logCategories__logCategories = v10;
}

+ (OS_os_log)accessList
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"accessList"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)apps
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"apps"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)budgets
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"budgets"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)alwaysAllowed
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"alwaysAllowed"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)communication
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"communication"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)communicationSafety
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"communicationSafety"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)contentPrivacy
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"contentPrivacy"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)persistence
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"persistence"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)usage
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"usage"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)icons
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"icons"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)requests
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"requests"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)users
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"users"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)childSetup
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"childSetup"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)eyeRelief
{
  os_log_t v2 = +[STUILog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"eyeRelief"];

  return (OS_os_log *)v3;
}

@end