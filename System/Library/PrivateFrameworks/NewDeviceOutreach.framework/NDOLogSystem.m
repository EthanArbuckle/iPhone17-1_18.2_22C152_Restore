@interface NDOLogSystem
@end

@implementation NDOLogSystem

uint64_t ___NDOLogSystem_block_invoke()
{
  _NDOLogSystem_log = (uint64_t)os_log_create("com.apple.NewDeviceOutreach", "core");
  return MEMORY[0x270F9A758]();
}

@end