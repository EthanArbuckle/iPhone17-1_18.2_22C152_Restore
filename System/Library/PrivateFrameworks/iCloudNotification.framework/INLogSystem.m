@interface INLogSystem
@end

@implementation INLogSystem

uint64_t ___INLogSystem_block_invoke()
{
  _INLogSystem_log = (uint64_t)os_log_create("com.apple.icloudnotification", "log");
  return MEMORY[0x270F9A758]();
}

@end