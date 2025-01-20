@interface NSNumberFormatter(SBFCacheInstances)
+ (id)sbf_cachedDecimalNumberFormatter;
@end

@implementation NSNumberFormatter(SBFCacheInstances)

+ (id)sbf_cachedDecimalNumberFormatter
{
  if (sbf_cachedDecimalNumberFormatter_onceToken != -1) {
    dispatch_once(&sbf_cachedDecimalNumberFormatter_onceToken, &__block_literal_global_231);
  }
  v0 = (void *)sbf_cachedDecimalNumberFormatter__cachedDecimalNumberFormatter;
  return v0;
}

@end