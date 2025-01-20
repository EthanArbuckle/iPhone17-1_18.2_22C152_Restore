@interface NSLocale(TIExtras)
+ (id)localeForBundleLanguage:()TIExtras;
@end

@implementation NSLocale(TIExtras)

+ (id)localeForBundleLanguage:()TIExtras
{
  v3 = (void *)MEMORY[0x1E4F1CA20];
  v4 = [a3 preferredLocalizations];
  v5 = [v4 firstObject];
  v6 = [v3 canonicalLanguageIdentifierFromString:v5];

  if (v6) {
    [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v6];
  }
  else {
  v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  }

  return v7;
}

@end