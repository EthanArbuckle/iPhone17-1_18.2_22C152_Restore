@interface NSBundle(Loading)
+ (id)ics_loadBundle:()Loading atPath:;
+ (uint64_t)iCloudSettingsBundle;
@end

@implementation NSBundle(Loading)

+ (id)ics_loadBundle:()Loading atPath:
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = MEMORY[0x263E5BB10]();
  v8 = [v7 stringByAppendingPathComponent:v6];

  v9 = [v8 stringByAppendingPathComponent:v5];
  v10 = [MEMORY[0x263F086E0] bundleWithPath:v9];
  if (([v10 isLoaded] & 1) == 0)
  {
    v11 = LogSubsystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_262993000, v11, OS_LOG_TYPE_DEFAULT, "%@ not loaded. Loading...", (uint8_t *)&v13, 0xCu);
    }

    [v10 load];
  }

  return v10;
}

+ (uint64_t)iCloudSettingsBundle
{
  v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();

  return [v0 bundleForClass:v1];
}

@end