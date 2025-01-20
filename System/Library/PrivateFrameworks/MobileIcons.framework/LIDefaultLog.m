@interface LIDefaultLog
@end

@implementation LIDefaultLog

uint64_t ___LIDefaultLog_block_invoke()
{
  _LIDefaultLog_log = (uint64_t)os_log_create("com.apple.iconservices.mobileicons", "default");
  return MEMORY[0x270F9A758]();
}

uint64_t ___LIDefaultLog_block_invoke_0()
{
  _LIDefaultLog_log_0 = (uint64_t)os_log_create("com.apple.iconservices.mobileicons", "default");
  return MEMORY[0x270F9A758]();
}

@end