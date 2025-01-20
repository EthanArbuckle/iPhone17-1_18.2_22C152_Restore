@interface NRMagicSwitchHelper
+ (id)companionSeed;
+ (void)clearCompanionSeed;
@end

@implementation NRMagicSwitchHelper

+ (id)companionSeed
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  if (!qword_1EB30BB00)
  {
    v2 = (void *)CFPreferencesCopyAppValue(@"AdvertisingIdentifierSeed", @"com.apple.NanoRegistry");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
      v4 = (void *)qword_1EB30BB00;
      qword_1EB30BB00 = v3;
    }
    if (!qword_1EB30BB00)
    {
      uint64_t v5 = objc_opt_new();
      v6 = (void *)qword_1EB30BB00;
      qword_1EB30BB00 = v5;

      CFPreferencesSetAppValue(@"AdvertisingIdentifierSeed", (CFPropertyListRef)[(id)qword_1EB30BB00 UUIDString], @"com.apple.NanoRegistry");
      int v7 = CFPreferencesAppSynchronize(@"com.apple.NanoRegistry");
      v8 = nr_framework_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        v10 = nr_framework_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = [(id)qword_1EB30BB00 UUIDString];
          int v14 = 138412546;
          v15 = v11;
          __int16 v16 = 1024;
          int v17 = v7;
          _os_log_impl(&dword_1A356E000, v10, OS_LOG_TYPE_DEFAULT, "Generated and persisted new companion seed: (%@); ret: (%u)",
            (uint8_t *)&v14,
            0x12u);
        }
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_12);
  v12 = (void *)qword_1EB30BB00;

  return v12;
}

+ (void)clearCompanionSeed
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  v2 = (void *)qword_1EB30BB00;
  qword_1EB30BB00 = 0;

  CFPreferencesSetAppValue(@"AdvertisingIdentifierSeed", 0, @"com.apple.NanoRegistry");
  int v3 = CFPreferencesAppSynchronize(@"com.apple.NanoRegistry");
  v4 = nr_framework_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1A356E000, v6, OS_LOG_TYPE_DEFAULT, "Cleared Advertising Identifier Seed; ret: (%u)",
        (uint8_t *)v7,
        8u);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_12);
}

@end