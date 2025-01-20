@interface PSLoggingFacility
@end

@implementation PSLoggingFacility

uint64_t ___PSLoggingFacility_block_invoke()
{
  _PSLoggingFacility_oslog = (uint64_t)os_log_create("com.apple.preferences", "log");
  return MEMORY[0x1F41817F8]();
}

@end