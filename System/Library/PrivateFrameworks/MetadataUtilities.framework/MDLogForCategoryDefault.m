@interface MDLogForCategoryDefault
@end

@implementation MDLogForCategoryDefault

os_log_t ___MDLogForCategoryDefault_block_invoke()
{
  os_log_t result = os_log_create("com.apple.metadata.utilities", "default");
  _MDLogForCategoryDefault_log = (uint64_t)result;
  return result;
}

@end