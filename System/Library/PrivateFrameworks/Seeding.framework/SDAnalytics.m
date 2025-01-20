@interface SDAnalytics
+ (NSUUID)deviceIdentifier;
+ (void)deviceDidDeclineLegalAgreement;
+ (void)deviceDidEnrollInSeeding;
+ (void)deviceDidUnenrollFromSeeding;
@end

@implementation SDAnalytics

+ (NSUUID)deviceIdentifier
{
  if (deviceIdentifier_onceToken != -1) {
    dispatch_once(&deviceIdentifier_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)deviceIdentifier_uuid;
  return (NSUUID *)v2;
}

void __31__SDAnalytics_deviceIdentifier__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.seeding"];
  v1 = [v0 stringForKey:@"DeviceIdentifier"];
  if (v1)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v1];
    v3 = (void *)deviceIdentifier_uuid;
    deviceIdentifier_uuid = v2;

    v4 = +[SDSeedingLogging analyticsHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(id)deviceIdentifier_uuid UUIDString];
      int v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "Device identifier: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  if (!deviceIdentifier_uuid)
  {
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = (void *)deviceIdentifier_uuid;
    deviceIdentifier_uuid = v6;

    v8 = +[SDSeedingLogging analyticsHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(id)deviceIdentifier_uuid UUIDString];
      int v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_DEFAULT, "Device identifier (new): %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v10 = [(id)deviceIdentifier_uuid UUIDString];
    [v0 setValue:v10 forKey:@"DeviceIdentifier"];
  }
}

+ (void)deviceDidEnrollInSeeding
{
  uint64_t v2 = +[SDSeedingLogging analyticsHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "Sending activated event", v3, 2u);
  }

  AnalyticsSendEventLazy();
}

void *__39__SDAnalytics_deviceDidEnrollInSeeding__block_invoke()
{
  return &unk_1F38EAFA8;
}

+ (void)deviceDidUnenrollFromSeeding
{
  uint64_t v2 = +[SDSeedingLogging analyticsHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "Sending deactivated event", v3, 2u);
  }

  AnalyticsSendEventLazy();
}

void *__43__SDAnalytics_deviceDidUnenrollFromSeeding__block_invoke()
{
  return &unk_1F38EAFD0;
}

+ (void)deviceDidDeclineLegalAgreement
{
  uint64_t v2 = +[SDSeedingLogging analyticsHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "Sending legaldeclined event", v3, 2u);
  }

  AnalyticsSendEventLazy();
}

void *__45__SDAnalytics_deviceDidDeclineLegalAgreement__block_invoke()
{
  return &unk_1F38EAFF8;
}

@end