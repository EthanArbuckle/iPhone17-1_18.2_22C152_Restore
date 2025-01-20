@interface ICLocalizationUtilities
+ (BOOL)isArabic;
+ (BOOL)supportsRTL;
@end

@implementation ICLocalizationUtilities

+ (BOOL)supportsRTL
{
  if (supportsRTL_onceToken != -1) {
    dispatch_once(&supportsRTL_onceToken, &__block_literal_global_68);
  }
  return supportsRTL_sCachedSupportsRTL;
}

void __38__ICLocalizationUtilities_supportsRTL__block_invoke()
{
  supportsRTL_sCachedSupportsRTL = ICAnyInputLanguagePassesBlock(&__block_literal_global_39_0);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4FB3028];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_4_0];
}

BOOL __38__ICLocalizationUtilities_supportsRTL__block_invoke_2()
{
  BOOL result = ICAnyInputLanguagePassesBlock(&__block_literal_global_39_0);
  supportsRTL_sCachedSupportsRTL = result;
  return result;
}

+ (BOOL)isArabic
{
  id v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v3 = [v2 languageCode];

  LOBYTE(v2) = [v3 hasPrefix:@"ar"];
  return (char)v2;
}

@end