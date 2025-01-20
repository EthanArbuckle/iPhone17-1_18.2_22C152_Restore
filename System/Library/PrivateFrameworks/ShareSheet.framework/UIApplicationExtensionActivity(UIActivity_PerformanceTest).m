@interface UIApplicationExtensionActivity(UIActivity_PerformanceTest)
@end

@implementation UIApplicationExtensionActivity(UIActivity_PerformanceTest)

+ (void)_applicationExtensionActivitiesForItems:()UIActivity_PerformanceTest .cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A0AD8000, v0, OS_LOG_TYPE_ERROR, "Cannot find application extensions: %{public}@", v1, 0xCu);
}

@end