@interface TVRCGeneralLog
@end

@implementation TVRCGeneralLog

uint64_t ___TVRCGeneralLog_block_invoke()
{
  _TVRCGeneralLog_log = (uint64_t)os_log_create("com.apple.TVRemoteCore", "General");

  return MEMORY[0x270F9A758]();
}

@end