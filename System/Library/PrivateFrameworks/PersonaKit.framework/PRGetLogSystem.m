@interface PRGetLogSystem
@end

@implementation PRGetLogSystem

uint64_t ___PRGetLogSystem_block_invoke()
{
  _PRGetLogSystem_log = (uint64_t)os_log_create("com.apple.persona", "core");
  return MEMORY[0x270F9A758]();
}

@end