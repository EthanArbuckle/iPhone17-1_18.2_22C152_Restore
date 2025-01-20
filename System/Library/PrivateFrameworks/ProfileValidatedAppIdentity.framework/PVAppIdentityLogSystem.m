@interface PVAppIdentityLogSystem
@end

@implementation PVAppIdentityLogSystem

uint64_t ___PVAppIdentityLogSystem_block_invoke()
{
  _PVAppIdentityLogSystem_log = (uint64_t)os_log_create("com.apple.devicecheck", "pvappidentity");

  return MEMORY[0x270F9A758]();
}

@end