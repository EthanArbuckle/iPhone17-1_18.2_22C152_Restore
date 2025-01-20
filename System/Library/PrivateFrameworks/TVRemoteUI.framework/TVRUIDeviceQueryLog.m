@interface TVRUIDeviceQueryLog
@end

@implementation TVRUIDeviceQueryLog

uint64_t ___TVRUIDeviceQueryLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "DeviceQuery");
  uint64_t v1 = _TVRUIDeviceQueryLog_log;
  _TVRUIDeviceQueryLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end