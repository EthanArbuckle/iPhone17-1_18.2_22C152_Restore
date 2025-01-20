@interface NSLocale(TPSCoreAdditions)
+ (id)tps_userLanguageCode;
+ (id)tps_userPreferredLocalizations;
+ (id)tps_userPreferredLocalizationsForLanguages:()TPSCoreAdditions;
@end

@implementation NSLocale(TPSCoreAdditions)

+ (id)tps_userLanguageCode
{
  v1 = objc_msgSend(a1, "tps_userPreferredLocalizations");
  v2 = [v1 firstObject];

  return v2;
}

+ (id)tps_userPreferredLocalizations
{
  v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v3 = objc_msgSend(a1, "tps_userPreferredLocalizationsForLanguages:", v2);

  return v3;
}

+ (id)tps_userPreferredLocalizationsForLanguages:()TPSCoreAdditions
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  v6 = [v4 systemLanguages];
  v7 = [v3 preferredLocalizationsFromArray:v6 forPreferences:v5];

  return v7;
}

@end