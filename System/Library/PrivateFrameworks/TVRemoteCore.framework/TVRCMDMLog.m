@interface TVRCMDMLog
@end

@implementation TVRCMDMLog

uint64_t ___TVRCMDMLog_block_invoke()
{
  _TVRCMDMLog_log = (uint64_t)os_log_create("com.apple.TVRemoteCore", "MDM");

  return MEMORY[0x270F9A758]();
}

@end