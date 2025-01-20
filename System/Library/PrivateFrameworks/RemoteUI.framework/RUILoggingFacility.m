@interface RUILoggingFacility
@end

@implementation RUILoggingFacility

uint64_t ___RUILoggingFacility_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.remoteui", "log");
  uint64_t v1 = _RUILoggingFacility_oslog;
  _RUILoggingFacility_oslog = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end