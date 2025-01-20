@interface OBPrivacyPresenter(SensorKitUI)
+ (uint64_t)srui_presenterForPrivacySplash;
@end

@implementation OBPrivacyPresenter(SensorKitUI)

+ (uint64_t)srui_presenterForPrivacySplash
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t result = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.sensorusage"];
  if (!result)
  {
    if (qword_26870D080 != -1) {
      dispatch_once(&qword_26870D080, &__block_literal_global_3);
    }
    v1 = _MergedGlobals_8;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_8, OS_LOG_TYPE_FAULT))
    {
      int v2 = 138543618;
      v3 = @"com.apple.onboarding.sensorusage";
      __int16 v4 = 2114;
      uint64_t v5 = 0;
      _os_log_fault_impl(&dword_230B11000, v1, OS_LOG_TYPE_FAULT, "Failed to find privacy splash %{public}@ because %{public}@", (uint8_t *)&v2, 0x16u);
    }
    return 0;
  }
  return result;
}

@end