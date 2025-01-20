@interface STBlueprint(AlwaysAllow)
@end

@implementation STBlueprint(AlwaysAllow)

+ (void)saveAlwaysAllowListForUser:()AlwaysAllow withBundleIDs:overwriteExistingList:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "User has no managing organization: %@", v2, v3, v4, v5, v6);
}

+ (void)saveAlwaysAllowListForUser:()AlwaysAllow withBundleIDs:overwriteExistingList:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to fetch existing always allow blueprint: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)saveAlwaysAllowListForUser:()AlwaysAllow withBundleIDs:overwriteExistingList:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1DA519000, v0, OS_LOG_TYPE_FAULT, "Failed to serialize always allow list data: %{public}@", v1, 0xCu);
}

+ (void)saveAlwaysAllowListForUser:()AlwaysAllow withBundleIDs:overwriteExistingList:error:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA519000, v0, v1, "Failed to save always allow list: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)saveAlwaysAllowListForUser:()AlwaysAllow withBundleIDs:overwriteExistingList:error:.cold.5(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "Always Allow blueprint already exists. Will not attempt to save default Always Allow list.", v1, 2u);
}

+ (void)saveAlwaysAllowListForUser:()AlwaysAllow withBundleIDs:overwriteExistingList:error:.cold.6()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1DA519000, v0, OS_LOG_TYPE_FAULT, "More than one always allow blueprint with the same identifier found in the database: %{public}@", v1, 0xCu);
}

@end