@interface PUILoggingFacility
@end

@implementation PUILoggingFacility

uint64_t ___PUILoggingFacility_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.preferences.PrivacySettings", "log");
  uint64_t v1 = _PUILoggingFacility_oslog;
  _PUILoggingFacility_oslog = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end