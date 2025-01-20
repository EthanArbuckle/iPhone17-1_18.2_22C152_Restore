@interface PSGLoggingFacility
@end

@implementation PSGLoggingFacility

uint64_t ___PSGLoggingFacility_block_invoke()
{
  _PSGLoggingFacility_oslog = (uint64_t)os_log_create("com.apple.preferences.GeneralSettings", "log");
  return MEMORY[0x270F9A758]();
}

@end