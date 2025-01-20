@interface CLLogObjectForCategory
@end

@implementation CLLogObjectForCategory

uint64_t ___CLLogObjectForCategory_MicroLocation_Default_block_invoke()
{
  logObject_MicroLocation_Default = (uint64_t)os_log_create("com.apple.MicroLocation", "MicroLocation");

  return MEMORY[0x270F9A758]();
}

@end