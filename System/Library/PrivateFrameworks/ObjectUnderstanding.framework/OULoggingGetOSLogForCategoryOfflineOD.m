@interface OULoggingGetOSLogForCategoryOfflineOD
@end

@implementation OULoggingGetOSLogForCategoryOfflineOD

os_log_t ___OULoggingGetOSLogForCategoryOfflineOD_block_invoke()
{
  os_log_t result = os_log_create("com.apple.ObjectUnderstanding", "OfflineOD");
  _OULoggingGetOSLogForCategoryOfflineOD_oslog = (uint64_t)result;
  return result;
}

@end