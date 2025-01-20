@interface BYLoggingFacility
@end

@implementation BYLoggingFacility

uint64_t ___BYLoggingFacility_block_invoke()
{
  _BYLoggingFacility_oslog = (uint64_t)os_log_create("com.apple.purplebuddy", "general");
  return MEMORY[0x1F41817F8]();
}

@end