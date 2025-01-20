@interface POCoreConfigurationUtil
+ (BOOL)appSSOEnabled;
+ (BOOL)isInternalBuild;
+ (BOOL)platformSSODevModeEnabled;
+ (BOOL)platformSSOEnabled;
+ (id)platformSSODevModeTriggerFile;
+ (id)platformSSOTriggerFile;
+ (void)appSSOEnabled;
+ (void)platformSSODevModeEnabled;
+ (void)platformSSOEnabled;
+ (void)updateTriggerFile;
+ (void)writeTriggerFileToPath:(id)a3;
@end

@implementation POCoreConfigurationUtil

+ (BOOL)platformSSOEnabled
{
  v2 = PO_LOG_POCoreConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[POCoreConfigurationUtil platformSSOEnabled]();
  }

  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = +[POCoreConfigurationUtil platformSSOTriggerFile];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    v6 = PO_LOG_POCoreConfigurationUtil();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[POCoreConfigurationUtil platformSSOEnabled]();
    }
  }
  return v5;
}

+ (BOOL)appSSOEnabled
{
  v2 = PO_LOG_POCoreConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[POCoreConfigurationUtil appSSOEnabled]();
  }

  v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = [v3 fileExistsAtPath:@"/var/mobile/Library/ExtensibleSSO/Configuration/com.apple.AppSSO.configuration.plist"];

  return v4;
}

+ (BOOL)platformSSODevModeEnabled
{
  v3 = PO_LOG_POCoreConfigurationUtil();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    +[POCoreConfigurationUtil platformSSODevModeEnabled]();
  }

  int v4 = [a1 isInternalBuild];
  if (v4)
  {
    if ((_os_feature_enabled_impl() & 1) != 0
      || ([MEMORY[0x263F08850] defaultManager],
          int v5 = objc_claimAutoreleasedReturnValue(),
          +[POCoreConfigurationUtil platformSSODevModeTriggerFile](POCoreConfigurationUtil, "platformSSODevModeTriggerFile"), v6 = objc_claimAutoreleasedReturnValue(), int v7 = [v5 fileExistsAtPath:v6], v6, v5, v7))
    {
      v8 = PO_LOG_POCoreConfigurationUtil();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[POCoreConfigurationUtil platformSSODevModeEnabled]();
      }

      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (void)writeTriggerFileToPath:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [MEMORY[0x263EFF8F8] data];
  id v22 = 0;
  char v5 = [v4 writeToFile:v3 options:268435457 error:&v22];
  id v6 = v22;
  int v7 = v6;
  if (v5)
  {
    uint64_t v23 = *MEMORY[0x263F08078];
    v24[0] = &unk_2707DBC10;
    v8 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v9 = [MEMORY[0x263F08850] defaultManager];
    id v18 = v7;
    char v10 = [v9 setAttributes:v8 ofItemAtPath:v3 error:&v18];
    id v11 = v18;

    if (v10)
    {
      v12 = PO_LOG_POCoreConfigurationUtil();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        +[POCoreConfigurationUtil writeTriggerFileToPath:]();
      }
    }
    else
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_18;
      v15[3] = &unk_265463A00;
      v16 = v11;
      id v17 = v3;
      id v14 = __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_18((uint64_t)v15);

      v12 = v16;
    }
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke;
    v19[3] = &unk_265463A00;
    id v11 = v6;
    id v20 = v11;
    id v21 = v3;
    id v13 = __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke((uint64_t)v19);

    v8 = v20;
  }
}

id __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to create trigger file"];
  v2 = PO_LOG_POCoreConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_cold_1();
  }

  return v1;
}

id __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_18(uint64_t a1)
{
  v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to set trigger file attributes"];
  v2 = PO_LOG_POCoreConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_cold_1();
  }

  return v1;
}

+ (void)updateTriggerFile
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

id __44__POCoreConfigurationUtil_updateTriggerFile__block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1004 underlyingError:*(void *)(a1 + 32) description:@"Did not find configuration files."];
  uint64_t v2 = PO_LOG_POCoreConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v1, v2);
  }

  return v1;
}

id __44__POCoreConfigurationUtil_updateTriggerFile__block_invoke_28(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to remove trigger file."];
  uint64_t v2 = PO_LOG_POCoreConfigurationUtil();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__POPrebootDeviceConfiguration_dataRepresentationForDisplay___block_invoke_cold_1((uint64_t)v1, v2);
  }

  return v1;
}

+ (id)platformSSOTriggerFile
{
  return (id)[@"/var/mobile/Library/ExtensibleSSO/Configuration/PlatformSSO" stringByAppendingPathComponent:@"psso.configured"];
}

+ (id)platformSSODevModeTriggerFile
{
  return (id)[@"/var/mobile/Library/ExtensibleSSO/Configuration/PlatformSSO" stringByAppendingPathComponent:@"psso.development"];
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_20);
  }
  return isInternalBuild_internalBuild;
}

void __42__POCoreConfigurationUtil_isInternalBuild__block_invoke()
{
  isInternalBuild_internalBuild = os_variant_has_internal_content();
  v0 = PO_LOG_POCoreConfigurationUtil();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __42__POCoreConfigurationUtil_isInternalBuild__block_invoke_cold_1(v0);
  }
}

+ (void)platformSSOEnabled
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

+ (void)appSSOEnabled
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

+ (void)platformSSODevModeEnabled
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_2(&dword_259DFE000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
}

+ (void)writeTriggerFileToPath:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "trigger file created", v2, v3, v4, v5, v6);
}

void __50__POCoreConfigurationUtil_writeTriggerFileToPath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_3_3(&dword_259DFE000, v0, v1, "%{public}@, %{public}@");
}

void __42__POCoreConfigurationUtil_isInternalBuild__block_invoke_cold_1(os_log_t log)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (isInternalBuild_internalBuild) {
    os_log_t v1 = "YES";
  }
  else {
    os_log_t v1 = "NO";
  }
  int v2 = 136446210;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_259DFE000, log, OS_LOG_TYPE_DEBUG, "isInternalBuild=%{public}s", (uint8_t *)&v2, 0xCu);
}

@end