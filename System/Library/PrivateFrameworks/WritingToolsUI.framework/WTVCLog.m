@interface WTVCLog
@end

@implementation WTVCLog

uint64_t ___WTVCLog_block_invoke()
{
  _WTVCLog_log = (uint64_t)os_log_create("com.apple.WritingTools", "WTWritingToolsViewController");

  return MEMORY[0x270F9A758]();
}

@end