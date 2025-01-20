@interface OULoggingGetOSLogForCategoryPostProcess
@end

@implementation OULoggingGetOSLogForCategoryPostProcess

os_log_t ___OULoggingGetOSLogForCategoryPostProcess_block_invoke()
{
  os_log_t result = os_log_create("com.apple.ObjectUnderstanding", "PostProcess");
  _OULoggingGetOSLogForCategoryPostProcess_oslog = (uint64_t)result;
  return result;
}

@end