@interface DefaultLogHandler
@end

@implementation DefaultLogHandler

os_log_t ___DefaultLogHandler_block_invoke()
{
  os_log_t result = os_log_create("com.apple.libauthinstall", "AMAuthInstallLog");
  _DefaultLogHandler_logHandle = (uint64_t)result;
  return result;
}

@end