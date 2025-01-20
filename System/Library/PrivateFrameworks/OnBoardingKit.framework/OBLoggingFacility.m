@interface OBLoggingFacility
@end

@implementation OBLoggingFacility

uint64_t ___OBLoggingFacility_block_invoke()
{
  _OBLoggingFacility_oslog = (uint64_t)os_log_create("com.apple.onboarding", "log");
  return MEMORY[0x1F41817F8]();
}

@end