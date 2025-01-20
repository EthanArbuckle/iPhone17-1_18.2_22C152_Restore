@interface NSLocale(RCAdditions)
+ (id)rc_preferredLanguageCodes;
@end

@implementation NSLocale(RCAdditions)

+ (id)rc_preferredLanguageCodes
{
  if (rc_preferredLanguageCodes_onceToken != -1) {
    dispatch_once(&rc_preferredLanguageCodes_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)rc_preferredLanguageCodes_s_languageCodes;

  return v0;
}

@end