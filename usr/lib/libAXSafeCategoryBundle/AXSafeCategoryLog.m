@interface AXSafeCategoryLog
@end

@implementation AXSafeCategoryLog

uint64_t ___AXSafeCategoryLog_block_invoke()
{
  _AXSafeCategoryLog__LogObject = (uint64_t)os_log_create("com.apple.Accessibility", "AXValidations");

  return MEMORY[0x270F9A758]();
}

@end