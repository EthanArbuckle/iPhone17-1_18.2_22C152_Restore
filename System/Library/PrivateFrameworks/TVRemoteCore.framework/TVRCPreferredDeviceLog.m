@interface TVRCPreferredDeviceLog
@end

@implementation TVRCPreferredDeviceLog

uint64_t ___TVRCPreferredDeviceLog_block_invoke()
{
  _TVRCPreferredDeviceLog_log = (uint64_t)os_log_create("com.apple.TVRemoteCore", "PreferredDevice");

  return MEMORY[0x270F9A758]();
}

@end