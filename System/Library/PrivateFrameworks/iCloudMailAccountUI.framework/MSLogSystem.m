@interface MSLogSystem
@end

@implementation MSLogSystem

uint64_t ___MSLogSystem_block_invoke()
{
  _MSLogSystem_log = (uint64_t)os_log_create("com.apple.icloudMCCKit", "icloudMailSettings");
  return MEMORY[0x270F9A758]();
}

@end