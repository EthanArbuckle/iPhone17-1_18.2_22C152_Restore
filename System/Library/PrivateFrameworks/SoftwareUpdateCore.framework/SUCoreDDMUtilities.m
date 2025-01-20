@interface SUCoreDDMUtilities
+ (BOOL)_forceSupervision;
+ (id)sharedLogger;
+ (void)postNotificationOfType:(unsigned __int16)a3;
+ (void)postNotificationOfType:(unsigned __int16)a3 description:(id)a4;
@end

@implementation SUCoreDDMUtilities

+ (id)sharedLogger
{
  if (sharedLogger_loggerOnce != -1) {
    dispatch_once(&sharedLogger_loggerOnce, &__block_literal_global_7);
  }
  v2 = (void *)sharedLogger_logger;

  return v2;
}

uint64_t __34__SUCoreDDMUtilities_sharedLogger__block_invoke()
{
  sharedLogger_logger = [objc_alloc(MEMORY[0x263F77DE8]) initWithCategory:@"DDM"];

  return MEMORY[0x270F9A758]();
}

+ (void)postNotificationOfType:(unsigned __int16)a3
{
}

+ (void)postNotificationOfType:(unsigned __int16)a3 description:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (v5)
  {
    v6 = +[SUCoreDDMUtilities sharedLogger];
    v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v4 > 4) {
        v8 = @"Unknown";
      }
      else {
        v8 = off_2640DDA28[(__int16)v4];
      }
      int v9 = 136315650;
      v10 = "+[SUCoreDDMUtilities postNotificationOfType:description:]";
      __int16 v11 = 2114;
      v12 = v8;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "%s: Posting %{public}@ for %{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  if (v4 <= 4) {
    notify_post((const char *)[(__CFString *)*off_2640DDA50[(__int16)v4] UTF8String]);
  }
}

+ (BOOL)_forceSupervision
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ForceSupervision", @"com.apple.sucore.ddm", 0);
  if (AppBooleanValue)
  {
    v3 = +[SUCoreDDMUtilities sharedLogger];
    unsigned int v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "+[SUCoreDDMUtilities _forceSupervision]";
      _os_log_impl(&dword_20C8EA000, v4, OS_LOG_TYPE_DEFAULT, "%s: forceSupervision is set", (uint8_t *)&v6, 0xCu);
    }
  }
  return AppBooleanValue != 0;
}

@end