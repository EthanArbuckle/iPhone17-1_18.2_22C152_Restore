@interface MTSessionUtilities
+ (BOOL)mtSBUIIsSystemApertureEnabled;
+ (void)logDebug:(id)a3;
+ (void)logError:(id)a3;
+ (void)logInfo:(id)a3;
@end

@implementation MTSessionUtilities

+ (void)logInfo:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    id v7 = a1;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1BE27A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ INFO: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

+ (void)logError:(id)a3
{
  id v3 = a3;
  id v4 = MTLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[MTSessionUtilities logError:]();
  }
}

+ (void)logDebug:(id)a3
{
  id v3 = a3;
  id v4 = MTLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    int v6 = MTLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[MTSessionUtilities logDebug:]();
    }
  }
}

+ (BOOL)mtSBUIIsSystemApertureEnabled
{
  return [MEMORY[0x1E4F78BB0] mtSBUIIsSystemApertureEnabled];
}

+ (void)logError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1BE27A000, v0, OS_LOG_TYPE_ERROR, "%{public}@ ERROR: %{public}@", v1, 0x16u);
}

+ (void)logDebug:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1BE27A000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ DEBUG: %{public}@", v1, 0x16u);
}

@end