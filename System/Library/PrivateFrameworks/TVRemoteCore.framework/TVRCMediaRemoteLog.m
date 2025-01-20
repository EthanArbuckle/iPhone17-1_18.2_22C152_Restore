@interface TVRCMediaRemoteLog
@end

@implementation TVRCMediaRemoteLog

uint64_t ___TVRCMediaRemoteLog_block_invoke()
{
  _TVRCMediaRemoteLog_log = (uint64_t)os_log_create("com.apple.TVRemoteCore", "MediaRemote");

  return MEMORY[0x270F9A758]();
}

@end