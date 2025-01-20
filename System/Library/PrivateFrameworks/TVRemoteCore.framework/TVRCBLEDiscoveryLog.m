@interface TVRCBLEDiscoveryLog
@end

@implementation TVRCBLEDiscoveryLog

uint64_t ___TVRCBLEDiscoveryLog_block_invoke()
{
  _TVRCBLEDiscoveryLog_log = (uint64_t)os_log_create("com.apple.TVRemoteCore", "BLEDiscovery");

  return MEMORY[0x270F9A758]();
}

@end