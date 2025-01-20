@interface OULoggingGetOSLogForCategoryRGBRefinement
@end

@implementation OULoggingGetOSLogForCategoryRGBRefinement

os_log_t ___OULoggingGetOSLogForCategoryRGBRefinement_block_invoke()
{
  os_log_t result = os_log_create("com.apple.ObjectUnderstanding", "RGBRefinement");
  _OULoggingGetOSLogForCategoryRGBRefinement_oslog = (uint64_t)result;
  return result;
}

@end