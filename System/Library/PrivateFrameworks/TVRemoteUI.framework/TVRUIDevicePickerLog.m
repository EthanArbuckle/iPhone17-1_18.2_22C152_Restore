@interface TVRUIDevicePickerLog
@end

@implementation TVRUIDevicePickerLog

uint64_t ___TVRUIDevicePickerLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.TVRemoteUI", "DevicePicker");
  uint64_t v1 = _TVRUIDevicePickerLog_log;
  _TVRUIDevicePickerLog_log = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end