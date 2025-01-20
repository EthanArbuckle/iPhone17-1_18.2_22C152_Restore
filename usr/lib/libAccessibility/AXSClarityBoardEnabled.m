@interface AXSClarityBoardEnabled
@end

@implementation AXSClarityBoardEnabled

void ___AXSClarityBoardEnabled_block_invoke()
{
  v0 = _AXSClarityBoardEnabledDirectory();
  v1 = [v0 path];
  v2 = [v1 stringByAppendingPathComponent:@"ClarityBoardEnabled"];

  if (!v2)
  {
    v5 = CLFLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      ___AXSClarityBoardEnabled_block_invoke_cold_1();
    }
    goto LABEL_9;
  }
  id v3 = v2;
  int v4 = access((const char *)[v3 cStringUsingEncoding:4], 0);
  _AXSClarityBoardEnabled_isEnabled = v4 == 0;
  if (v4 && (v4 != -1 || *__error() != 2))
  {
    v5 = CLFLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      ___AXSClarityBoardEnabled_block_invoke_cold_2((uint64_t)v3, v5);
    }
LABEL_9:
  }
}

void ___AXSClarityBoardEnabled_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_190274000, v0, v1, "Unable to get _AXSClarityBoardEnabledDirectory()", v2, v3, v4, v5, v6);
}

void ___AXSClarityBoardEnabled_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  v9 = v5;
  _os_log_fault_impl(&dword_190274000, a2, OS_LOG_TYPE_FAULT, "Unable to check whether file existed at %@. Error: %s", (uint8_t *)&v6, 0x16u);
}

@end