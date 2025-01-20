@interface LTOSLogDeviceState
@end

@implementation LTOSLogDeviceState

uint64_t ___LTOSLogDeviceState_block_invoke()
{
  _LTOSLogDeviceState_log = (uint64_t)os_log_create("com.apple.Translation", "DeviceState");
  return MEMORY[0x270F9A758]();
}

@end