@interface PSGSignpostLoggingFacility
@end

@implementation PSGSignpostLoggingFacility

uint64_t ___PSGSignpostLoggingFacility_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.preferences.GeneralSettings", "Signposts");
  uint64_t v1 = _PSGSignpostLoggingFacility_oslog;
  _PSGSignpostLoggingFacility_oslog = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end