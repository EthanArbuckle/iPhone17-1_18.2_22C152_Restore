@interface TVRUIDeviceInfoLog
@end

@implementation TVRUIDeviceInfoLog

uint64_t ___TVRUIDeviceInfoLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "DeviceInfo");
  uint64_t v1 = _TVRUIDeviceInfoLog_log;
  _TVRUIDeviceInfoLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end