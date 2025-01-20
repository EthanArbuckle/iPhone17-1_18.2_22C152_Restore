@interface IMMultiFrameImage(ASTC_Persistence)
@end

@implementation IMMultiFrameImage(ASTC_Persistence)

- (void)writeASTCImage:()ASTC_Persistence duration:error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeASTCImage:()ASTC_Persistence duration:error:.cold.2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C5188000, log, OS_LOG_TYPE_ERROR, "Image destination failed to finalize.", v1, 2u);
}

- (void)writeASTCImage:()ASTC_Persistence duration:error:.cold.3(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_1C5188000, a2, OS_LOG_TYPE_ERROR, "No image (%@) or duration (%f)", (uint8_t *)&v3, 0x16u);
}

- (void)finalizeASTCWithError:()ASTC_Persistence .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C5188000, v0, v1, "Failed to write IMMultiFrameImage format magic bytes to stream with error: %@", v2, v3, v4, v5, v6);
}

- (void)finalizeASTCWithError:()ASTC_Persistence .cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C5188000, v0, v1, "Failed to write frame count to stream with error: %@", v2, v3, v4, v5, v6);
}

- (void)finalizeASTCWithError:()ASTC_Persistence .cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C5188000, v0, v1, "Failed to write plist data length to stream with error: %@", v2, v3, v4, v5, v6);
}

- (void)finalizeASTCWithError:()ASTC_Persistence .cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C5188000, v0, v1, "Metadata dictionary writing to atsc output stream failed. Error: %@", v2, v3, v4, v5, v6);
}

@end