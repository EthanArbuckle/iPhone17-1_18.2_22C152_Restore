@interface OULoggingGetOSLogForCategoryOUSession
@end

@implementation OULoggingGetOSLogForCategoryOUSession

os_log_t ___OULoggingGetOSLogForCategoryOUSession_block_invoke()
{
  os_log_t result = os_log_create("com.apple.ObjectUnderstanding", "OUSession");
  _OULoggingGetOSLogForCategoryOUSession_oslog = (uint64_t)result;
  return result;
}

@end