@interface SUICAssistantVoiceSettingsConnection
+ (id)assistantLanguageTitlesDictionary;
+ (id)capitalizeFirstPartOfCountry:(id)a3;
+ (id)shortTitlesForLanguageIdentifiers:(id)a3 deviceLanguageLocale:(id)a4;
+ (id)titlesForLanguageIdentifiers:(id)a3;
- (BOOL)languageHasVoiceSelection:(id)a3;
- (BOOL)languageHasVoiceVariations:(id)a3;
- (NSMutableDictionary)cachedAvailableVoices;
- (id)_regionForLanguageIdentifier:(id)a3;
- (id)dialectForLanguageIdentifier:(id)a3;
- (id)getAvailableDialectsForLanguage:(id)a3;
- (id)getAvailableVoicesForLanguage:(id)a3;
- (void)setCachedAvailableVoices:(id)a3;
@end

@implementation SUICAssistantVoiceSettingsConnection

- (BOOL)languageHasVoiceVariations:(id)a3
{
  v3 = [(SUICAssistantVoiceSettingsConnection *)self getAvailableVoicesForLanguage:a3];
  v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_7];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  LOBYTE(v3) = (unint64_t)[v5 count] > 1;
  return (char)v3;
}

BOOL __67__SUICAssistantVoiceSettingsConnection_languageHasVoiceVariations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCustom])
  {
    v3 = [v2 name];
    BOOL v4 = [v3 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)getAvailableVoicesForLanguage:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4)
  {
    v6 = self->_cachedAvailableVoices;
    objc_sync_enter(v6);
    cachedAvailableVoices = self->_cachedAvailableVoices;
    if (!cachedAvailableVoices)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = self->_cachedAvailableVoices;
      self->_cachedAvailableVoices = v8;

      cachedAvailableVoices = self->_cachedAvailableVoices;
    }
    v10 = [(NSMutableDictionary *)cachedAvailableVoices objectForKeyedSubscript:v4];

    if (!v10)
    {
      v11 = [MEMORY[0x1E4F4E680] allVoicesForSiriSessionLanguage:v4];
      v12 = (void *)MEMORY[0x1E4F28F60];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __70__SUICAssistantVoiceSettingsConnection_getAvailableVoicesForLanguage___block_invoke;
      v18[3] = &unk_1E5C59D88;
      id v13 = v4;
      id v19 = v13;
      v14 = [v12 predicateWithBlock:v18];
      v15 = [v11 filteredArrayUsingPredicate:v14];

      if (v15) {
        v16 = v15;
      }
      else {
        v16 = v5;
      }
      [(NSMutableDictionary *)self->_cachedAvailableVoices setObject:v16 forKeyedSubscript:v13];
    }
    objc_sync_exit(v6);

    v5 = [(NSMutableDictionary *)self->_cachedAvailableVoices objectForKeyedSubscript:v4];
  }

  return v5;
}

uint64_t __70__SUICAssistantVoiceSettingsConnection_getAvailableVoicesForLanguage___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 languageCode];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)getAvailableDialectsForLanguage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 pathForResource:@"AssistantVoiceDialects" ofType:@"plist"];

  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5];
  v7 = [v6 objectForKeyedSubscript:v3];
  if (v7) {
    [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  }
  else {
  v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v3, 0);
  }

  return v8;
}

- (BOOL)languageHasVoiceSelection:(id)a3
{
  id v4 = a3;
  if ([(SUICAssistantVoiceSettingsConnection *)self languageHasVoiceVariations:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(SUICAssistantVoiceSettingsConnection *)self getAvailableDialectsForLanguage:v4];
    BOOL v5 = (unint64_t)[v6 count] > 1;
  }
  return v5;
}

- (id)_regionForLanguageIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  BOOL v5 = [v3 _deviceLanguage];
  v6 = [v3 localeWithLocaleIdentifier:v5];

  v7 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v4];

  uint64_t v8 = *MEMORY[0x1E4F1C400];
  v9 = [v7 objectForKey:*MEMORY[0x1E4F1C400]];
  v10 = [v6 displayNameForKey:v8 value:v9];

  return v10;
}

- (id)dialectForLanguageIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [NSString stringWithFormat:@"REGION_%@", v4];
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:v5 value:&stru_1EFB44F78 table:0];

  if (v7 && ([v7 isEqualToString:v5] & 1) == 0)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [(SUICAssistantVoiceSettingsConnection *)self _regionForLanguageIdentifier:v4];
  }
  v9 = v8;

  return v9;
}

+ (id)assistantLanguageTitlesDictionary
{
  id v3 = AFPreferencesSupportedLanguages();
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  BOOL v5 = [a1 titlesForLanguageIdentifiers:v4];

  return v5;
}

+ (id)titlesForLanguageIdentifiers:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = 0x1E4F1C000uLL;
  v6 = (void *)MEMORY[0x1E4F1CA20];
  v7 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  uint64_t v8 = [v6 localeWithLocaleIdentifier:v7];

  v54 = [MEMORY[0x1E4F28BD0] set];
  v53 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  id v43 = a1;
  v52 = (void *)v8;
  v48 = [a1 shortTitlesForLanguageIdentifiers:v4 deviceLanguageLocale:v8];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v64;
    uint64_t v12 = *MEMORY[0x1E4F1C438];
    uint64_t v55 = *MEMORY[0x1E4F1C400];
    id v13 = @"zh";
    uint64_t v50 = *MEMORY[0x1E4F1C438];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v64 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v16 = [*(id *)(v5 + 2592) componentsFromLocaleIdentifier:v15];
        v17 = [v16 objectForKey:v12];
        if ([(__CFString *)v17 isEqualToString:v13])
        {
          uint64_t v18 = v11;
          id v19 = v13;
          unint64_t v20 = v5;
          v21 = [v16 objectForKey:v55];
          int v22 = [v21 isEqualToString:@"HK"];

          if (v22)
          {

            v17 = @"yue";
          }
          unint64_t v5 = v20;
          id v13 = v19;
          uint64_t v11 = v18;
          uint64_t v12 = v50;
        }
        [v53 setObject:v16 forKey:v15];
        [v54 addObject:v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v10);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v44 = obj;
  v23 = v43;
  uint64_t v49 = [v44 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v49)
  {
    uint64_t v47 = *(void *)v60;
    uint64_t v51 = *MEMORY[0x1E4F1C438];
    uint64_t v46 = *MEMORY[0x1E4F1C400];
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v60 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v25 = *(void *)(*((void *)&v59 + 1) + 8 * j);
        v26 = [v53 objectForKey:v25];
        v27 = [v26 objectForKey:v51];
        v28 = [v26 objectForKey:v46];
        id obja = [v48 objectForKey:v25];
        v56 = [v52 displayNameForKey:v46 value:v28];
        if ([v27 isEqualToString:@"zh"])
        {
          if ([v28 isEqualToString:@"HK"])
          {
            v29 = [v52 displayNameForKey:v51 value:@"yue"];
          }
          else
          {
            v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v29 = [v32 localizedStringForKey:@"MANDARIN_SPOKEN_DIALECT" value:&stru_1EFB44F78 table:0];
          }
        }
        else if ([v27 isEqualToString:@"yue"] {
               && [v28 isEqualToString:@"CN"])
        }
        {
          v29 = [v52 displayNameForKey:v51 value:@"yue"];
          v30 = [v52 displayNameForKey:v51 value:@"zh"];
          uint64_t v31 = [v23 capitalizeFirstPartOfCountry:v30];

          id obja = (id)v31;
        }
        else
        {
          v29 = 0;
        }
        if ((unint64_t)[v54 countForObject:v27] < 2)
        {
          if ([v27 isEqualToString:@"pt"])
          {
            id v38 = v56;

            v29 = v38;
          }
          if (!v29)
          {
            id v37 = obja;
            if (!v37) {
              goto LABEL_38;
            }
LABEL_37:
            [v45 setValue:v37 forKey:v25];
            goto LABEL_38;
          }
          v39 = NSString;
          v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v40 = [v35 localizedStringForKey:@"LANGUAGE_WITH_REGION" value:&stru_1EFB44F78 table:0];
          objc_msgSend(v39, "stringWithFormat:", v40, obja, v29);
          id v37 = (id)objc_claimAutoreleasedReturnValue();

          v23 = v43;
          goto LABEL_32;
        }
        v33 = NSString;
        v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v35 = v34;
        if (v29)
        {
          v36 = [v34 localizedStringForKey:@"LANGUAGE_WITH_REGION_AND_DIALECT" value:&stru_1EFB44F78 table:0];
          objc_msgSend(v33, "stringWithFormat:", v36, obja, v29, v56);
          id v37 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
          if (v37) {
            goto LABEL_37;
          }
          goto LABEL_38;
        }
        v41 = [v34 localizedStringForKey:@"LANGUAGE_WITH_REGION" value:&stru_1EFB44F78 table:0];
        objc_msgSend(v33, "stringWithFormat:", v41, obja, v56);
        id v37 = (id)objc_claimAutoreleasedReturnValue();

        if (v37) {
          goto LABEL_37;
        }
LABEL_38:
      }
      uint64_t v49 = [v44 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v49);
  }

  return v45;
}

+ (id)shortTitlesForLanguageIdentifiers:(id)a3 deviceLanguageLocale:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    uint64_t v10 = *MEMORY[0x1E4F1C438];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v12];
        v14 = [v13 objectForKey:v10];
        uint64_t v15 = [v6 displayNameForKey:v10 value:v14];
        v16 = [a1 capitalizeFirstPartOfCountry:v15];
        if (v16) {
          [v19 setValue:v16 forKey:v12];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return v19;
}

+ (id)capitalizeFirstPartOfCountry:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"(");
    id v5 = [v3 componentsSeparatedByCharactersInSet:v4];

    id v6 = [v5 objectAtIndex:0];
    uint64_t v7 = [v6 capitalizedString];

    uint64_t v8 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v7];
    if ((unint64_t)[v5 count] >= 2)
    {
      unint64_t v9 = 1;
      do
      {
        -[__CFString appendString:](v8, "appendString:", @"(");
        uint64_t v10 = [v5 objectAtIndex:v9];
        [(__CFString *)v8 appendString:v10];

        ++v9;
      }
      while ([v5 count] > v9);
    }
  }
  else
  {
    uint64_t v8 = &stru_1EFB44F78;
  }

  return v8;
}

- (NSMutableDictionary)cachedAvailableVoices
{
  return self->_cachedAvailableVoices;
}

- (void)setCachedAvailableVoices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end