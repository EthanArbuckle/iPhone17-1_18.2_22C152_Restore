@interface SUSUIInternalLoggingFacility
@end

@implementation SUSUIInternalLoggingFacility

void ___SUSUIInternalLoggingFacility_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.preferences.SoftwareUpdateSettingsUI", "log");
  v1 = (void *)_SUSUIInternalLoggingFacility_oslog;
  _SUSUIInternalLoggingFacility_oslog = (uint64_t)v0;
}

@end