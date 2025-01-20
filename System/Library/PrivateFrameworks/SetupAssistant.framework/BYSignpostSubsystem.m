@interface BYSignpostSubsystem
@end

@implementation BYSignpostSubsystem

uint64_t ___BYSignpostSubsystem_block_invoke()
{
  _BYSignpostSubsystem_log = (uint64_t)os_log_create("com.apple.purplebuddy", "signpost");
  return MEMORY[0x1F41817F8]();
}

@end