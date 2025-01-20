@interface STRemoteExtractor(STAEAExtractor)
@end

@implementation STRemoteExtractor(STAEAExtractor)

+ (void)STAEAExtractorWithOptions:()STAEAExtractor .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

+ (void)STAEAExtractorWithOptions:()STAEAExtractor .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

+ (void)fullReplacementSTAEAExtractor:()STAEAExtractor .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

+ (void)incrementalPatchSTAEAExtractor:()STAEAExtractor srcDirectory:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

+ (void)incrementalPatchSTAEAExtractor:()STAEAExtractor srcDirectory:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)setSourceDirectory:()STAEAExtractor sandboxExtension:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21FAFD000, v0, v1, "%{public}s: %s: AssertMacros: %s - Failed to get realpath for source dir, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

- (void)setSourceDirectory:()STAEAExtractor sandboxExtension:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v4 = __error();
  strerror(*v4);
  int v7 = 136448002;
  v8 = "-[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:]";
  __int16 v9 = 2080;
  v10 = "-[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:]";
  __int16 v11 = 2080;
  OUTLINED_FUNCTION_3();
  uint64_t v12 = a1;
  __int16 v13 = v5;
  uint64_t v14 = v6;
  __int16 v15 = v5;
  v16 = "";
  __int16 v17 = v5;
  v18 = "/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STAEAExtractor.m";
  __int16 v19 = 1024;
  int v20 = 183;
  _os_log_error_impl(&dword_21FAFD000, a2, OS_LOG_TYPE_ERROR, "%{public}s: %s: AssertMacros: %s - Failed to get sandbox extension for \"%s\" : %s, %s file: %s, line: %d\n", (uint8_t *)&v7, 0x4Eu);
}

@end