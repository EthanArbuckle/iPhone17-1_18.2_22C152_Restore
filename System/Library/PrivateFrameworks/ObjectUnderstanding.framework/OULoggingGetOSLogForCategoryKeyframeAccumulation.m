@interface OULoggingGetOSLogForCategoryKeyframeAccumulation
@end

@implementation OULoggingGetOSLogForCategoryKeyframeAccumulation

os_log_t ___OULoggingGetOSLogForCategoryKeyframeAccumulation_block_invoke()
{
  os_log_t result = os_log_create("com.apple.ObjectUnderstanding", "KeyframeAccumulation");
  _OULoggingGetOSLogForCategoryKeyframeAccumulation_oslog = (uint64_t)result;
  return result;
}

@end