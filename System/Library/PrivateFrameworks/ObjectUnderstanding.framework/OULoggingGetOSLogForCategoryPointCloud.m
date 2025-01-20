@interface OULoggingGetOSLogForCategoryPointCloud
@end

@implementation OULoggingGetOSLogForCategoryPointCloud

os_log_t ___OULoggingGetOSLogForCategoryPointCloud_block_invoke()
{
  os_log_t result = os_log_create("com.apple.ObjectUnderstanding", "PointCloud");
  _OULoggingGetOSLogForCategoryPointCloud_oslog = (uint64_t)result;
  return result;
}

@end