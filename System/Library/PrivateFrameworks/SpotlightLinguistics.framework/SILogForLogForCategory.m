@interface SILogForLogForCategory
@end

@implementation SILogForLogForCategory

os_log_t ___SILogForLogForCategory_block_invoke()
{
  for (uint64_t i = 0; i != 21; ++i)
  {
    os_log_t result = os_log_create("com.apple.spotlightindex", SILogCategoryNames[i]);
    gSILogArray[i] = (uint64_t)result;
  }
  return result;
}

@end