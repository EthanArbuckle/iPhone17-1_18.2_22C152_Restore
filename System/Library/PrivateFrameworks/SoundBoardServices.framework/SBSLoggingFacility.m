@interface SBSLoggingFacility
@end

@implementation SBSLoggingFacility

uint64_t ___SBSLoggingFacility_block_invoke()
{
  _SBSLoggingFacility_oslog = (uint64_t)os_log_create("com.apple.soundboard.services", "log");
  return MEMORY[0x270F9A758]();
}

@end