@interface NSDateFormatter(MTUtilities)
+ (id)mtTimeOnlyFormatter;
@end

@implementation NSDateFormatter(MTUtilities)

+ (id)mtTimeOnlyFormatter
{
  if (mtTimeOnlyFormatter_onceToken != -1) {
    dispatch_once(&mtTimeOnlyFormatter_onceToken, &__block_literal_global_246);
  }
  v0 = (void *)mtTimeOnlyFormatter__timeOnlyFormatter;
  return v0;
}

@end