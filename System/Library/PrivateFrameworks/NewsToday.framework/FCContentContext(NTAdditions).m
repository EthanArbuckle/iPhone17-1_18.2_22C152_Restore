@interface FCContentContext(NTAdditions)
+ (id)nt_contentContextWithConfigurationManager:()NTAdditions contentHostDirectory:networkBehaviorMonitor:;
@end

@implementation FCContentContext(NTAdditions)

+ (id)nt_contentContextWithConfigurationManager:()NTAdditions contentHostDirectory:networkBehaviorMonitor:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[FCContentContext(NTAdditions) nt_contentContextWithConfigurationManager:contentHostDirectory:networkBehaviorMonitor:]();
    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    +[FCContentContext(NTAdditions) nt_contentContextWithConfigurationManager:contentHostDirectory:networkBehaviorMonitor:]();
  }
LABEL_6:
  v10 = [MEMORY[0x263F59408] defaultConfiguration];
  id v11 = objc_alloc(MEMORY[0x263F59400]);
  v12 = [MEMORY[0x263F59548] sharedNetworkReachability];
  v13 = (void *)[v11 initWithConfiguration:v10 configurationManager:v7 contentHostDirectory:v8 networkBehaviorMonitor:v9 networkReachability:v12 desiredHeadlineFieldOptions:0x101FC383FLL feedUsage:10 assetKeyManagerDelegate:0 appActivityMonitor:0 backgroundTaskable:0 pptContext:0];

  return v13;
}

+ (void)nt_contentContextWithConfigurationManager:()NTAdditions contentHostDirectory:networkBehaviorMonitor:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentHostDirectoryFileURL", v6, 2u);
}

+ (void)nt_contentContextWithConfigurationManager:()NTAdditions contentHostDirectory:networkBehaviorMonitor:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"configurationManager", v6, 2u);
}

@end