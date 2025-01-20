@interface TVRCHomeKitLog
@end

@implementation TVRCHomeKitLog

uint64_t ___TVRCHomeKitLog_block_invoke()
{
  _TVRCHomeKitLog_log = (uint64_t)os_log_create("com.apple.TVRemoteCore", "HomeKit");

  return MEMORY[0x270F9A758]();
}

@end