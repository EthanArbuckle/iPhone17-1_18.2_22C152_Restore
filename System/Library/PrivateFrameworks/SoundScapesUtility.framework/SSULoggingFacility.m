@interface SSULoggingFacility
@end

@implementation SSULoggingFacility

uint64_t ___SSULoggingFacility_block_invoke()
{
  _SSULoggingFacility_oslog = (uint64_t)os_log_create("com.apple.soundscapes.utility", "log");

  return MEMORY[0x270F9A758]();
}

@end