@interface SUSLoggingFacility
@end

@implementation SUSLoggingFacility

void ___SUSLoggingFacility_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.preferences.SoftwareUpdateSettings", "log");
  v1 = (void *)_SUSLoggingFacility_oslog;
  _SUSLoggingFacility_oslog = (uint64_t)v0;
}

@end