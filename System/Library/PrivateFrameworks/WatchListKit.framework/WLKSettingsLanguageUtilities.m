@interface WLKSettingsLanguageUtilities
+ (BOOL)_isSpecialSpokenLanguage:(id)a3;
+ (id)_localizedNameForLanguageCode:(id)a3 withLocale:(id)a4;
+ (id)availableAudioLanguageCodes;
+ (id)localizedNameForLanguageCode:(id)a3;
+ (id)localizedNameForLanguageCodeInItsOwnLanguage:(id)a3;
+ (id)userFacingAudioLanguageTitles:(id)a3;
+ (id)userFacingLocalizedNameForLanguageCode:(id)a3 autoString:(id)a4;
@end

@implementation WLKSettingsLanguageUtilities

+ (id)localizedNameForLanguageCodeInItsOwnLanguage:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CA20];
    id v4 = a3;
    v5 = [v3 localeWithLocaleIdentifier:v4];
    v6 = +[WLKSettingsLanguageUtilities _localizedNameForLanguageCode:v4 withLocale:v5];
  }
  else
  {
    v6 = &stru_1F13BCF18;
  }

  return v6;
}

+ (id)localizedNameForLanguageCode:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  v5 = [v3 autoupdatingCurrentLocale];
  v6 = +[WLKSettingsLanguageUtilities _localizedNameForLanguageCode:v4 withLocale:v5];

  return v6;
}

+ (id)userFacingLocalizedNameForLanguageCode:(id)a3 autoString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"AUTO_SENTINEL_VALUE"])
  {
    id v7 = v6;
  }
  else
  {
    id v7 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v5];
  }
  id v8 = v7;
  if (!v7) {
    id v8 = v5;
  }

  return v8;
}

+ (id)userFacingAudioLanguageTitles:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = +[WLKSettingsLanguageUtilities availableAudioLanguageCodes];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = +[WLKSettingsLanguageUtilities userFacingLocalizedNameForLanguageCode:v10 autoString:v3];
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)availableAudioLanguageCodes
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[&unk_1F13D9B10 mutableCopy];
  id v3 = +[WLKSystemPreferencesStore sharedPreferences];
  id v4 = [v3 supplementaryAvailableAudioLanguages];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        if (([v2 containsObject:v10] & 1) == 0) {
          [v2 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v7);
  }

  v11 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v12 = [v11 firstObject];

  unint64_t v13 = 0x1E4F1C000uLL;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = v15;
  if (v12)
  {
    v17 = [v12 componentsSeparatedByString:@"-"];
    uint64_t v18 = [v17 firstObject];
    if (v18)
    {
      v28 = v17;
      v29 = v12;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v19 = v2;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v30 + 1) + 8 * j);
            if (objc_msgSend(v24, "hasPrefix:", v18, v28, v29, (void)v30)) {
              v25 = v14;
            }
            else {
              v25 = v16;
            }
            [v25 addObject:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v21);
      }

      v17 = v28;
      v12 = v29;
      unint64_t v13 = 0x1E4F1C000;
    }
    else
    {
      [v16 addObjectsFromArray:v2];
    }
  }
  else
  {
    [v15 addObjectsFromArray:v2];
  }
  objc_msgSend(v14, "sortUsingComparator:", &__block_literal_global_17, v28, v29);
  [v16 sortUsingComparator:&__block_literal_global_433];
  v26 = (void *)[objc_alloc(*(Class *)(v13 + 2632)) initWithArray:v14];
  [v26 addObjectsFromArray:v16];
  [v26 insertObject:@"AUTO_SENTINEL_VALUE" atIndex:0];

  return v26;
}

uint64_t __59__WLKSettingsLanguageUtilities_availableAudioLanguageCodes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:a2];
  uint64_t v6 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v4];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

uint64_t __59__WLKSettingsLanguageUtilities_availableAudioLanguageCodes__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:a2];
  uint64_t v6 = +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:v4];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

+ (id)_localizedNameForLanguageCode:(id)a3 withLocale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F1C430];
  uint64_t v8 = [v6 displayNameForKey:*MEMORY[0x1E4F1C430] value:v5];
  if (+[WLKSettingsLanguageUtilities _isSpecialSpokenLanguage:v5])
  {
    v9 = [v5 componentsSeparatedByString:@"-"];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:v10];
    if (v11)
    {
      v12 = (void *)v11;
      if ((unint64_t)[v9 count] >= 2)
      {
        unint64_t v13 = [v9 objectAtIndex:1];
        uint64_t v14 = [NSString stringWithFormat:@"%@-%@", v12, v13];

        v12 = (void *)v14;
      }
      uint64_t v15 = [v6 displayNameForKey:v7 value:v12];

      uint64_t v8 = (void *)v15;
    }
  }
  long long v16 = [v8 capitalizedStringWithLocale:v6];
  v17 = v16;
  if (!v16) {
    long long v16 = v5;
  }
  id v18 = v16;

  return v18;
}

+ (BOOL)_isSpecialSpokenLanguage:(id)a3
{
  return [a3 containsString:@"cmn"];
}

@end