@interface MOEventBundleProcessor(LearnFromThisApp)
+ (void)_learningFromAppDenyList;
+ (void)readLearnedFromTheAppStatusTable;
@end

@implementation MOEventBundleProcessor(LearnFromThisApp)

+ (void)approvedForLearnFromThisApp:()LearnFromThisApp .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "approvedForLearnFromThisApp, nothing is blocked with deny list", v2, v3, v4, v5, v6);
}

+ (void)_learningFromAppDenyList
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "approvedForLearnFromThisApp,failed to read deny list", v2, v3, v4, v5, v6);
}

+ (void)readLearnedFromTheAppStatusTable
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_ERROR, "Could not read to the LFTA plist file, error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)persistLearnedFromTheAppStatusTable:()LearnFromThisApp .cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "invalid path for LFTA status plist file.", v2, v3, v4, v5, v6);
}

+ (void)persistLearnedFromTheAppStatusTable:()LearnFromThisApp .cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "Failed to get cache directory to store LFTA plist file, nil cache directory.", v2, v3, v4, v5, v6);
}

+ (void)persistLearnedFromTheAppStatusTable:()LearnFromThisApp .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D24AE000, a2, OS_LOG_TYPE_ERROR, "couldn't write to the LFTA status plist file, %@", (uint8_t *)&v2, 0xCu);
}

@end