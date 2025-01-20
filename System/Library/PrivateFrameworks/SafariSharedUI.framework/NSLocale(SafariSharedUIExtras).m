@interface NSLocale(SafariSharedUIExtras)
+ (id)safari_baseLanguageFromLanguage:()SafariSharedUIExtras;
+ (id)safari_displayNameForLocaleIdentifier:()SafariSharedUIExtras inNativeLanguage:;
+ (id)safari_displayNameForLocaleIdentifier:()SafariSharedUIExtras usingLanguageForLocalization:;
+ (uint64_t)safari_currentLocaleHasSameBaseLanguageAsLocaleIdentifier:()SafariSharedUIExtras;
+ (uint64_t)safari_displayNameForLocaleIdentifier:()SafariSharedUIExtras;
@end

@implementation NSLocale(SafariSharedUIExtras)

+ (id)safari_displayNameForLocaleIdentifier:()SafariSharedUIExtras usingLanguageForLocalization:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F03420C8];
  if (v7) {
    [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v7];
  }
  else {
  v9 = [a1 currentLocale];
  }
  v10 = objc_msgSend(MEMORY[0x1E4F1CA20], "safari_baseLanguageFromLanguage:", v6);
  if (![v8 containsObject:v10]
    || ([v9 localizedStringForLocaleIdentifier:v10],
        (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v11 = [v9 localizedStringForLanguageCode:v6];
  }
  v12 = [v11 capitalizedStringWithLocale:v9];

  return v12;
}

+ (id)safari_displayNameForLocaleIdentifier:()SafariSharedUIExtras inNativeLanguage:
{
  if (a4) {
    v5 = a3;
  }
  else {
    v5 = 0;
  }
  id v6 = a3;
  id v7 = objc_msgSend(a1, "safari_displayNameForLocaleIdentifier:usingLanguageForLocalization:", v6, v5);

  return v7;
}

+ (uint64_t)safari_displayNameForLocaleIdentifier:()SafariSharedUIExtras
{
  return objc_msgSend(a1, "safari_displayNameForLocaleIdentifier:inNativeLanguage:", a3, 0);
}

+ (uint64_t)safari_currentLocaleHasSameBaseLanguageAsLocaleIdentifier:()SafariSharedUIExtras
{
  v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  id v6 = [a1 currentLocale];
  id v7 = [v6 localeIdentifier];
  v8 = objc_msgSend(v4, "safari_baseLanguageFromLanguage:", v7);

  v9 = objc_msgSend(MEMORY[0x1E4F1CA20], "safari_baseLanguageFromLanguage:", v5);

  uint64_t v10 = [v8 isEqualToString:v9];
  return v10;
}

+ (id)safari_baseLanguageFromLanguage:()SafariSharedUIExtras
{
  v3 = a3;
  if (safari_baseLanguageFromLanguage__once != -1) {
    dispatch_once(&safari_baseLanguageFromLanguage__once, &__block_literal_global_61);
  }
  if (!v3) {
    v3 = &stru_1F031A860;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&safari_baseLanguageFromLanguage__lock);
  v4 = [(id)safari_baseLanguageFromLanguage__cache objectForKeyedSubscript:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&safari_baseLanguageFromLanguage__lock);
  if (!v4)
  {
    v4 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v3];
    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&safari_baseLanguageFromLanguage__lock);
      [(id)safari_baseLanguageFromLanguage__cache setObject:v4 forKeyedSubscript:v3];
      os_unfair_lock_unlock((os_unfair_lock_t)&safari_baseLanguageFromLanguage__lock);
    }
  }
  id v5 = v4;

  return v5;
}

@end