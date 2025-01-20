@interface NSLocale(PKAdditions)
+ (__CFString)pk_deviceLanguage;
+ (id)pk_preferredLocale;
@end

@implementation NSLocale(PKAdditions)

+ (id)pk_preferredLocale
{
  v0 = (void *)MEMORY[0x1E4F1CA20];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v1 preferredLocalizations];
  v3 = [v2 firstObject];
  v4 = [v0 localeWithLocaleIdentifier:v3];

  return v4;
}

+ (__CFString)pk_deviceLanguage
{
  v0 = (void *)MEMORY[0x1E4F28B50];
  v1 = PKPassKitBundle();
  v2 = [v1 localizations];
  v3 = [v0 preferredLocalizationsFromArray:v2 forPreferences:0];
  v4 = [v3 firstObject];

  v5 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v4];
  v6 = v5;
  if (!v5) {
    v5 = @"en";
  }
  v7 = v5;

  return v7;
}

@end