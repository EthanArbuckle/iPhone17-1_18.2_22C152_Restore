@interface NSLocale(FCAdditions)
+ (id)fc_preferredLanguageCodes;
@end

@implementation NSLocale(FCAdditions)

+ (id)fc_preferredLanguageCodes
{
  if (qword_1EB5D1AB0 != -1) {
    dispatch_once(&qword_1EB5D1AB0, &__block_literal_global_161);
  }
  v0 = (void *)_MergedGlobals_213;
  return v0;
}

@end