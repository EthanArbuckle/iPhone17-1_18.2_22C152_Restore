@interface NSNumberFormatter(MTUtilities)
+ (id)mtDecimalStyleNumberFormatter;
@end

@implementation NSNumberFormatter(MTUtilities)

+ (id)mtDecimalStyleNumberFormatter
{
  if (mtDecimalStyleNumberFormatter_onceToken != -1) {
    dispatch_once(&mtDecimalStyleNumberFormatter_onceToken, &__block_literal_global_252);
  }
  v0 = (void *)mtDecimalStyleNumberFormatter__decimalStyleumberFormatter;
  return v0;
}

@end