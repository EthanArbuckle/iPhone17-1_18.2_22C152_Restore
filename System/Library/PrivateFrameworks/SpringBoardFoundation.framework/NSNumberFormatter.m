@interface NSNumberFormatter
@end

@implementation NSNumberFormatter

uint64_t __72__NSNumberFormatter_SBFCacheInstances__sbf_cachedDecimalNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)sbf_cachedDecimalNumberFormatter__cachedDecimalNumberFormatter;
  sbf_cachedDecimalNumberFormatter__cachedDecimalNumberFormatter = (uint64_t)v0;

  v2 = (void *)sbf_cachedDecimalNumberFormatter__cachedDecimalNumberFormatter;
  v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  v4 = (void *)sbf_cachedDecimalNumberFormatter__cachedDecimalNumberFormatter;
  return [v4 setNumberStyle:1];
}

@end