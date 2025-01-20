@interface SpringBoard(SBApplicationTesting)
@end

@implementation SpringBoard(SBApplicationTesting)

- (void)runTest:()SBApplicationTesting options:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Unrecognized test: %@", v2, v3, v4, v5, v6);
}

- (void)startLaunchTestNamed:()SBApplicationTesting options:withCompletionBlock:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 bundleIdentifier];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Killing %{public}@ so that the launch test may begin", v4, 0xCu);
}

- (void)_locationInScreenReferenceSpaceForLocation:()SBApplicationTesting inOrientation:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Unsupported orientation: %ld", (uint8_t *)&v1, 0xCu);
}

- (void)_handleApplicationExit:()SBApplicationTesting .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

@end