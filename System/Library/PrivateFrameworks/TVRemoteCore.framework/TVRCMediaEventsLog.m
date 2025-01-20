@interface TVRCMediaEventsLog
@end

@implementation TVRCMediaEventsLog

uint64_t ___TVRCMediaEventsLog_block_invoke()
{
  _TVRCMediaEventsLog_log = (uint64_t)os_log_create("com.apple.TVRemoteCore", "MediaEvents");

  return MEMORY[0x270F9A758]();
}

@end