@interface TVRCXPCLog
@end

@implementation TVRCXPCLog

uint64_t ___TVRCXPCLog_block_invoke()
{
  _TVRCXPCLog_log = (uint64_t)os_log_create("com.apple.tvremotecore.xpc", "Client");

  return MEMORY[0x270F9A758]();
}

@end