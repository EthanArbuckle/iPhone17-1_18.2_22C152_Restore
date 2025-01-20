@interface OULoggingGetOSLogForCategoryObjectUnderstanding
@end

@implementation OULoggingGetOSLogForCategoryObjectUnderstanding

os_log_t ___OULoggingGetOSLogForCategoryObjectUnderstanding_block_invoke()
{
  os_log_t result = os_log_create("com.apple.ObjectUnderstanding", "ObjectUnderstanding");
  _OULoggingGetOSLogForCategoryObjectUnderstanding_oslog = (uint64_t)result;
  return result;
}

@end