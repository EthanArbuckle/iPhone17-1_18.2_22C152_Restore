@interface TIInputModeController
+ (id)_inputModesForLocale:(id)a3 language:(id)a4 modeFetcher:(id)a5;
+ (id)sharedInputModeController;
- (BOOL)identifierIsValidSystemInputMode:(id)a3;
- (NSArray)defaultInputModes;
- (NSArray)enabledInputModeIdentifiers;
- (NSArray)enabledInputModes;
- (NSArray)inputModesForTesting;
- (NSArray)preferredLanguages;
- (NSArray)supportedInputModeIdentifiers;
- (NSArray)supportedInputModeLanguageAndRegions;
- (NSString)currentLocale;
- (id)defaultDictationLanguagesForKeyboardLanguage:(id)a3;
- (id)defaultEnabledInputModesForCurrentLocale;
- (id)suggestedDictationLanguageForDeviceLanguage;
- (void)setCurrentLocale:(id)a3;
- (void)setDefaultInputModes:(id)a3;
- (void)setEnabledInputModes:(id)a3;
- (void)setInputModesForTesting:(id)a3;
- (void)setPreferredLanguages:(id)a3;
@end

@implementation TIInputModeController

- (NSArray)supportedInputModeIdentifiers
{
  supportedInputModeIdentifiers = self->_supportedInputModeIdentifiers;
  if (!supportedInputModeIdentifiers)
  {
    v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"ain", @"ak", @"am", @"apw", @"ar", @"ars", @"as", @"az_Latn", @"be", @"bg_BG", @"bn-Translit", @"bn", @"bo", @"brx", @"ca_ES", @"cho", @"chr",
                      @"cic",
                      @"ckb",
                      @"cs_CZ",
                      @"cv",
                      @"cy_GB",
                      @"da_DK",
                      @"de_AT",
                      @"de_CH",
                      @"de_DE",
                      @"doi_Deva",
                      @"dv",
                      @"dz",
                      @"el_GR",
                      @"emoji",
                      @"en_AU",
                      @"en_CA",
                      @"en_GB",
                      @"en_JP",
                      @"en_IN",
                      @"en_NZ",
                      @"en_SG",
                      @"en_US",
                      @"en_ZA",
                      @"es_ES",
                      @"es_MX",
                      @"es_419",
                      @"et_EE",
                      @"fa",
                      @"fa_AF",
                      @"ff_Adlm",
                      @"fi_FI",
                      @"fo",
                      @"fr_FR",
                      @"fr_BE",
                      @"fr_CA",
                      @"fr_CH",
                      @"ga_IE",
                      @"gu-Translit",
                      @"gu",
                      @"ha",
                      @"haw",
                      @"he_IL",
                      @"hi-Translit",
                      @"hi");
    v5 = self->_supportedInputModeIdentifiers;
    self->_supportedInputModeIdentifiers = v4;

    supportedInputModeIdentifiers = self->_supportedInputModeIdentifiers;
  }
  v6 = supportedInputModeIdentifiers;
  v7 = +[TIPreferencesController sharedPreferencesController];
  int v8 = [v7 BOOLForKey:2];

  if (v8)
  {
    uint64_t v9 = [(NSArray *)v6 arrayByAddingObject:@"intl"];

    v6 = (NSArray *)v9;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v10 = [(NSArray *)v6 arrayByAddingObjectsFromArray:&unk_1EDC28720];

    v6 = (NSArray *)v10;
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v11 = [(NSArray *)v6 arrayByAddingObjectsFromArray:&unk_1EDC28738];

    v6 = (NSArray *)v11;
  }

  return v6;
}

void __61__TIInputModeController_supportedInputModeLanguageAndRegions__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isEqualToString:@"intl"] & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = TIInputModeGetLanguageWithRegion(v5);
    [v3 addObject:v4];
  }
}

- (id)defaultEnabledInputModesForCurrentLocale
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [v3 localeIdentifier];

  id v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v6 = [(TIInputModeController *)self defaultInputModes];
  if ([v6 count])
  {
    v7 = [(TIInputModeController *)self currentLocale];
    if ([v7 isEqualToString:v4])
    {
      int v8 = [(TIInputModeController *)self preferredLanguages];
      char v9 = [v8 isEqualToArray:v5];

      if (v9) {
        goto LABEL_15;
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  [(TIInputModeController *)self setCurrentLocale:v4];
  uint64_t v10 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v20 = v5;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = +[TIInputModeController _inputModesForLocale:v4 language:*(void *)(*((void *)&v21 + 1) + 8 * i) modeFetcher:&__block_literal_global_64];
        [v10 addObjectsFromArray:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  [v10 addObject:@"emoji"];
  v17 = [v10 array];
  [(TIInputModeController *)self setDefaultInputModes:v17];

  id v5 = v20;
LABEL_15:
  v18 = [(TIInputModeController *)self defaultInputModes];

  return v18;
}

- (NSArray)defaultInputModes
{
  return self->defaultInputModes;
}

- (BOOL)identifierIsValidSystemInputMode:(id)a3
{
  v4 = TIInputModeGetNormalizedIdentifier(a3);
  if (([v4 isEqualToString:@"dictation"] & 1) != 0
    || ([v4 isEqualToString:@"intl"] & 1) != 0
    || ([v4 isEqualToString:@"intl_HWR"] & 1) != 0)
  {
    char v5 = 1;
  }
  else if ([v4 length])
  {
    v7 = [(TIInputModeController *)self supportedInputModeIdentifiers];
    int v8 = [(TIInputModeController *)self supportedInputModeLanguageAndRegions];
    if ([v7 containsObject:v4]) {
      char v5 = 1;
    }
    else {
      char v5 = [v8 containsObject:v4];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)_inputModesForLocale:(id)a3 language:(id)a4 modeFetcher:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(void, void))v9;
  id v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (!v7 || !v9) {
    goto LABEL_42;
  }
  uint64_t v12 = [v7 rangeOfString:@"@"];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = [v7 substringToIndex:v12];

    id v7 = (id)v13;
  }
  if ([v8 hasPrefix:@"zh-"]
    && (([v7 hasPrefix:@"zh-"] & 1) != 0
     || [v7 hasPrefix:@"zh_"]))
  {
    if (![v8 isEqualToString:@"zh-Hant"]
      || ([v7 hasSuffix:@"TW"] & 1) == 0
      && ([v7 hasSuffix:@"HK"] & 1) == 0
      && ([v7 hasSuffix:@"MO"] & 1) == 0)
    {
      if (![v8 isEqualToString:@"zh-Hans"])
      {
        int v14 = 0;
        goto LABEL_25;
      }
      if (([v7 hasSuffix:@"CN"] & 1) == 0)
      {
        int v14 = [v7 hasSuffix:@"SG"];
        goto LABEL_25;
      }
    }
    int v14 = 1;
LABEL_25:
    [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:v7];
    v15 = v7;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
  if (v8)
  {
    if (_inputModesForLocale_language_modeFetcher__once != -1) {
      dispatch_once(&_inputModesForLocale_language_modeFetcher__once, &__block_literal_global_2349);
    }
    v15 = TIInputModeGetComponentsFromIdentifier(v8);
    v16 = TIInputModeGetComponentsFromIdentifier(v7);
    uint64_t v17 = *MEMORY[0x1E4F1C438];
    v18 = [v15 objectForKey:*MEMORY[0x1E4F1C438]];
    v19 = [v16 objectForKey:v17];
    if ([v18 isEqualToString:v19])
    {
      v20 = (void *)_inputModesForLocale_language_modeFetcher__exceptionListToUseLanguageCode;
      long long v21 = [v8 stringByAppendingString:@"/"];
      long long v22 = [v21 stringByAppendingString:v7];
      int v14 = [v20 containsObject:v22] ^ 1;
    }
    else
    {
      int v14 = 0;
    }

    goto LABEL_26;
  }
  int v14 = 1;
LABEL_27:
  long long v23 = ((void (**)(void, id))v10)[2](v10, v7);
  id v11 = v23;
  if (!v14 || ![v23 count])
  {
    long long v24 = ((void (**)(void, id))v10)[2](v10, v8);
    if (![v24 count])
    {
      v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v26 = (void *)MEMORY[0x1E4F1CA20];
      v27 = [v25 preferredLocalizations];
      v28 = [v27 objectAtIndex:0];
      v29 = [v26 canonicalLanguageIdentifierFromString:v28];
      uint64_t v30 = ((void (**)(void, void *))v10)[2](v10, v29);

      long long v24 = (void *)v30;
    }
    if ([v11 count])
    {
      if (![v24 count])
      {
LABEL_39:

        goto LABEL_40;
      }
      v31 = [MEMORY[0x1E4F1CA48] arrayWithArray:v24];
      v32 = [v31 objectAtIndex:0];
      v33 = [v32 substringToIndex:2];

      if (([v33 isEqualToString:@"en"] & 1) == 0
        && ([v33 isEqualToString:@"pt"] & 1) == 0)
      {

        v33 = 0;
      }
      uint64_t v38 = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      v40 = __67__TIInputModeController__inputModesForLocale_language_modeFetcher___block_invoke_2;
      v41 = &unk_1E5558C90;
      id v42 = v33;
      id v34 = v31;
      id v43 = v34;
      id v35 = v33;
      [v11 enumerateObjectsUsingBlock:&v38];
      id v36 = v34;
    }
    else
    {
      id v36 = v24;
    }
    id v11 = v36;
    goto LABEL_39;
  }
LABEL_40:
  if (!objc_msgSend(v11, "count", v38, v39, v40, v41))
  {

    id v11 = &unk_1EDC28708;
  }
LABEL_42:

  return v11;
}

id __65__TIInputModeController_defaultEnabledInputModesForCurrentLocale__block_invoke(uint64_t a1, void *a2)
{
  return TIGetDefaultInputModesForLanguage(a2);
}

+ (id)sharedInputModeController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__TIInputModeController_sharedInputModeController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInputModeController_createSharedInputModeControllerOnce != -1) {
    dispatch_once(&sharedInputModeController_createSharedInputModeControllerOnce, block);
  }
  v2 = (void *)sharedInputModeController_sharedInputModeController;

  return v2;
}

- (NSArray)supportedInputModeLanguageAndRegions
{
  supportedInputModeLanguageAndRegions = self->_supportedInputModeLanguageAndRegions;
  if (!supportedInputModeLanguageAndRegions)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    char v5 = [(TIInputModeController *)self supportedInputModeIdentifiers];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__TIInputModeController_supportedInputModeLanguageAndRegions__block_invoke;
    v14[3] = &unk_1E5558CD8;
    v6 = v4;
    v15 = v6;
    [v5 enumerateObjectsUsingBlock:v14];

    id v7 = self->_supportedInputModeLanguageAndRegions;
    self->_supportedInputModeLanguageAndRegions = v6;
    id v8 = v6;

    supportedInputModeLanguageAndRegions = self->_supportedInputModeLanguageAndRegions;
  }
  id v9 = supportedInputModeLanguageAndRegions;
  uint64_t v10 = +[TIPreferencesController sharedPreferencesController];
  int v11 = [v10 BOOLForKey:2];

  if (v11)
  {
    uint64_t v12 = [(NSArray *)self->_supportedInputModeLanguageAndRegions arrayByAddingObject:@"intl"];

    id v9 = (NSArray *)v12;
  }

  return v9;
}

- (void)setDefaultInputModes:(id)a3
{
}

- (void)setCurrentLocale:(id)a3
{
}

- (NSArray)preferredLanguages
{
  return self->preferredLanguages;
}

- (NSString)currentLocale
{
  return self->currentLocale;
}

uint64_t __67__TIInputModeController__inputModesForLocale_language_modeFetcher___block_invoke()
{
  _inputModesForLocale_language_modeFetcher__exceptionListToUseLanguageCode = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"en-GB/en_US", @"pt-PT/pt_BR", 0);

  return MEMORY[0x1F41817F8]();
}

- (id)defaultDictationLanguagesForKeyboardLanguage:(id)a3
{
  return TIGetDefaultDictationLanguagesForKeyboardLanguage(a3);
}

uint64_t __50__TIInputModeController_sharedInputModeController__block_invoke()
{
  sharedInputModeController_sharedInputModeController = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputModesForTesting, 0);
  objc_storeStrong((id *)&self->defaultInputModes, 0);
  objc_storeStrong((id *)&self->enabledInputModes, 0);
  objc_storeStrong((id *)&self->preferredLanguages, 0);
  objc_storeStrong((id *)&self->currentLocale, 0);
  objc_storeStrong((id *)&self->_supportedInputModeLanguageAndRegions, 0);

  objc_storeStrong((id *)&self->_supportedInputModeIdentifiers, 0);
}

- (void)setInputModesForTesting:(id)a3
{
}

- (NSArray)inputModesForTesting
{
  return self->inputModesForTesting;
}

- (void)setEnabledInputModes:(id)a3
{
}

- (NSArray)enabledInputModes
{
  return self->enabledInputModes;
}

- (void)setPreferredLanguages:(id)a3
{
}

- (id)suggestedDictationLanguageForDeviceLanguage
{
  v2 = TIGetSuggestedDictationLanguagesForDeviceLanguage();
  v3 = [v2 firstObject];

  return v3;
}

- (NSArray)enabledInputModeIdentifiers
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(TIInputModeController *)self inputModesForTesting];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    char v5 = [(TIInputModeController *)self inputModesForTesting];
    goto LABEL_25;
  }
  v6 = +[TIPreferencesController sharedPreferencesController];
  uint64_t v7 = [v6 BOOLForKey:1];

  if (v7)
  {
    id v8 = +[TIPreferencesController sharedPreferencesController];
    id v9 = [v8 valueForKey:0];

    uint64_t v10 = [(TIInputModeController *)self enabledInputModes];
    if ([v10 count])
    {
      int v11 = [(TIInputModeController *)self enabledInputModes];
      char v12 = [v11 isEqualToArray:v9];

      if (v12) {
        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v23 = v9;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(id *)(*((void *)&v24 + 1) + 8 * v18);
          if ([v19 rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v20 = TICanonicalInputModeName(v19);

            id v19 = (id)v20;
          }
          if (([v13 containsObject:v19] & 1) == 0) {
            [v13 addObject:v19];
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }

    if ([v13 count])
    {
      [(TIInputModeController *)self setEnabledInputModes:v13];
    }
    else
    {
      long long v21 = [(TIInputModeController *)self defaultEnabledInputModesForCurrentLocale];
      [(TIInputModeController *)self setEnabledInputModes:v21];
    }
    id v9 = v23;
    goto LABEL_24;
  }
  id v9 = [(TIInputModeController *)self defaultEnabledInputModesForCurrentLocale];
  [(TIInputModeController *)self setEnabledInputModes:v9];
LABEL_24:

  char v5 = [(TIInputModeController *)self enabledInputModes];
LABEL_25:

  return (NSArray *)v5;
}

uint64_t __67__TIInputModeController__inputModesForLocale_language_modeFetcher___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v7 = v3;
  if (!*(void *)(a1 + 32) || (char v5 = objc_msgSend(v3, "hasPrefix:"), v4 = v7, (v5 & 1) == 0))
  {
    if (([*(id *)(a1 + 40) containsObject:v4] & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }

  return MEMORY[0x1F41817F8]();
}

@end