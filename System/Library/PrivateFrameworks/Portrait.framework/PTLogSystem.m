@interface PTLogSystem
@end

@implementation PTLogSystem

uint64_t ___PTLogSystem_block_invoke()
{
  _PTLogSystem_log = (uint64_t)os_log_create("com.apple.portrait", "core");

  return MEMORY[0x1F41817F8]();
}

@end