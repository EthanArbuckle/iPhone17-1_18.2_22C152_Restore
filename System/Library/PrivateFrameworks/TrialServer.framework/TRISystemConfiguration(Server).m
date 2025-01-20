@interface TRISystemConfiguration(Server)
+ (void)updateSystemInfoUsingContext:()Server;
- (id)userSettingsSiriLocale;
- (uint64_t)userSettingsIsSiriEnabled;
@end

@implementation TRISystemConfiguration(Server)

- (uint64_t)userSettingsIsSiriEnabled
{
  v0 = (void *)CFPreferencesCopyAppValue(@"Assistant Enabled", @"com.apple.assistant.support");
  if (objc_opt_respondsToSelector()) {
    uint64_t v1 = [v0 BOOLValue];
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

- (id)userSettingsSiriLocale
{
  if ([a1 userSettingsIsSiriEnabled]) {
    uint64_t v1 = (void *)CFPreferencesCopyAppValue(@"Session Language", @"com.apple.assistant.backedup");
  }
  else {
    uint64_t v1 = 0;
  }
  return v1;
}

+ (void)updateSystemInfoUsingContext:()Server
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Updating system info.", (uint8_t *)&v18, 2u);
  }

  id v5 = objc_alloc(MEMORY[0x1E4FB0258]);
  v6 = [v3 paths];
  v7 = (void *)[v5 initWithPaths:v6];

  v8 = [v7 deviceId];

  if (!v8) {
    id v9 = (id)[v7 createPersistentDeviceIdentifier];
  }
  v10 = (void *)MEMORY[0x1E4FB0260];
  v11 = [v3 client];
  v12 = [v10 createSystemInfoWithFactorProvider:v11];

  if (v12 && ([v12 save] & 1) != 0)
  {
    v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Update sysconfig", (uint8_t *)&v18, 2u);
    }

    id v14 = (id)[v7 reloadSystemInfo];
  }
  else
  {
    v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      v19 = @"Failed to create system info";
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
    }

    v16 = [v3 client];
    int v17 = [v16 shouldLogAtLevel:50 withPrivacyRadar:54260918];

    if (v17) {
      [v3 logErrorMetric:@"Failed to create system info"];
    }
  }
  notify_post("com.apple.trial.covariates-updated");
}

@end