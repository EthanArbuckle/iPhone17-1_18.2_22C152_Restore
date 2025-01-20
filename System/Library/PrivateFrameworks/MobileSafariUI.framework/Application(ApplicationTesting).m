@interface Application(ApplicationTesting)
@end

@implementation Application(ApplicationTesting)

+ (void)prepareTestControllerWithType:()ApplicationTesting suiteURL:bundleNames:outputURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1E102C000, v0, OS_LOG_TYPE_DEBUG, "Created result bundle: %@", v1, 0xCu);
}

+ (void)prepareTestControllerWithType:()ApplicationTesting suiteURL:bundleNames:outputURL:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1E102C000, v0, v1, "Failed to create/output result bundle: %@ (%@)");
}

+ (void)prepareTestControllerWithType:()ApplicationTesting suiteURL:bundleNames:outputURL:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1E102C000, v0, OS_LOG_TYPE_DEBUG, "Opened result fifo: %@", v1, 0xCu);
}

+ (void)prepareTestControllerWithType:()ApplicationTesting suiteURL:bundleNames:outputURL:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1E102C000, v0, v1, "Failed to create/output result fifo: %@ (%@)");
}

+ (void)prepareTestControllerWithType:()ApplicationTesting suiteURL:bundleNames:outputURL:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1E102C000, v0, v1, "Unknown test type %@", v2, v3, v4, v5, v6);
}

- (void)runTest:()ApplicationTesting options:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "The SplitView test has been removed, Safari now uses system windowing", v1, 2u);
}

- (void)_resetHistoryWithCompressedDatabaseAtURL:()ApplicationTesting error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1E102C000, v0, v1, "Failed to read %{public}@", v2, v3, v4, v5, v6);
}

- (void)_resetHistoryWithCompressedDatabaseAtURL:()ApplicationTesting error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1E102C000, v0, v1, "Failed to decompress %{public}@", v2, v3, v4, v5, v6);
}

@end