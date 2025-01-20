@interface POConfigurationUtil
+ (BOOL)appSSOEnabled;
+ (BOOL)platformSSOEnabled;
+ (BOOL)platformSSOEnabledForUsername:(id)a3;
+ (id)platformSSOTriggerFile;
+ (void)appSSOEnabled;
+ (void)platformSSOEnabled;
+ (void)updateTriggerFile;
@end

@implementation POConfigurationUtil

+ (BOOL)platformSSOEnabled
{
  v2 = PO_LOG_POConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[POConfigurationUtil platformSSOEnabled]();
  }

  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = +[POConfigurationUtil platformSSOTriggerFile];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    v6 = PO_LOG_POConfigurationUtil();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[POConfigurationUtil platformSSOEnabled];
    }
  }
  return v5;
}

+ (BOOL)appSSOEnabled
{
  v2 = PO_LOG_POConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[POConfigurationUtil appSSOEnabled]();
  }

  v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = [v3 fileExistsAtPath:@"/var/mobile/Library/ExtensibleSSO/Configuration/com.apple.AppSSO.configuration.plist"];

  return v4;
}

+ (BOOL)platformSSOEnabledForUsername:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  char v4 = [[POConfigurationManager alloc] initWithUserName:v3];

  int v5 = [(POConfigurationManager *)v4 currentDeviceConfiguration];
  if ([v5 registrationCompleted])
  {
    v6 = [(POConfigurationManager *)v4 currentUserConfiguration];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (void)updateTriggerFile
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

id __40__POConfigurationUtil_updateTriggerFile__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1004 underlyingError:*(void *)(a1 + 32) description:@"Did not find configuration files."];
  uint64_t v2 = PO_LOG_POConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __40__POConfigurationUtil_updateTriggerFile__block_invoke_12(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to create trigger file"];
  uint64_t v2 = PO_LOG_POConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __40__POConfigurationUtil_updateTriggerFile__block_invoke_18(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to set trigger file attributes"];
  uint64_t v2 = PO_LOG_POConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

id __40__POConfigurationUtil_updateTriggerFile__block_invoke_25(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to remove trigger file."];
  uint64_t v2 = PO_LOG_POConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

+ (id)platformSSOTriggerFile
{
  return (id)[(id)*MEMORY[0x263F5E6E0] stringByAppendingPathComponent:@"psso.configured"];
}

+ (void)platformSSOEnabled
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

+ (void)appSSOEnabled
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_230E51000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

void __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_230E51000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

@end