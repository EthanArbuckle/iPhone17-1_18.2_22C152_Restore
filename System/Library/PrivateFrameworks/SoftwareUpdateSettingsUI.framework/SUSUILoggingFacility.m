@interface SUSUILoggingFacility
@end

@implementation SUSUILoggingFacility

void ___SUSUILoggingFacility_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.preferences.SoftwareUpdateSettingsUI", "log");
  v1 = (void *)_SUSUILoggingFacility_oslog;
  _SUSUILoggingFacility_oslog = (uint64_t)v0;
}

@end