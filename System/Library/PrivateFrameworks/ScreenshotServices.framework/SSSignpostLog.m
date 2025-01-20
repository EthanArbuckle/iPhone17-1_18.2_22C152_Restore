@interface SSSignpostLog
@end

@implementation SSSignpostLog

uint64_t ___SSSignpostLog_block_invoke()
{
  _SSSignpostLog____SSSignpostLog = (uint64_t)os_log_create("com.apple.screenshotservices", "signposts");
  return MEMORY[0x270F9A758]();
}

@end