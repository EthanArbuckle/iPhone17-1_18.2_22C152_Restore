@interface PLSubmissions(XPCScheduling)
@end

@implementation PLSubmissions(XPCScheduling)

- (void)enqueueFileForUpload:()XPCScheduling .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "Not queueing submission record due to missing info", v2, v3, v4, v5, v6);
}

- (void)submitRecord:()XPCScheduling withActivity:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Failed to create CloudKit asset for %@", (uint8_t *)&v2, 0xCu);
}

- (void)finishXPCActivity:()XPCScheduling .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "Failed to set background state to done", v2, v3, v4, v5, v6);
}

- (void)finishXPCActivity:()XPCScheduling .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "Background state not in continue", v2, v3, v4, v5, v6);
}

- (void)removeFileAtURL:()XPCScheduling .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to remove file at %@, error: %@");
}

@end