@interface TSLogDomain
@end

@implementation TSLogDomain

uint64_t ___TSLogDomain_block_invoke()
{
  _TSLogDomain_oslog = (uint64_t)os_log_create("com.apple.SIMSetupSupport", "log");
  return MEMORY[0x270F9A758]();
}

@end