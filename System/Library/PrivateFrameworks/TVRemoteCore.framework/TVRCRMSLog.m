@interface TVRCRMSLog
@end

@implementation TVRCRMSLog

uint64_t ___TVRCRMSLog_block_invoke()
{
  _TVRCRMSLog_log = (uint64_t)os_log_create("com.apple.TVRemoteCore", "RMS");

  return MEMORY[0x270F9A758]();
}

@end