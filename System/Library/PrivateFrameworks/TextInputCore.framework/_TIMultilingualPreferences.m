@interface _TIMultilingualPreferences
+ (id)inputModesForIdentifiers:(id)a3;
- (NSArray)preferredAdditionalInputModes;
- (NSArray)userEnabledInputModes;
- (NSArray)userPreferredLanguages;
- (TIInputMode)preferredSecondaryInputMode;
@end

@implementation _TIMultilingualPreferences

- (NSArray)userPreferredLanguages
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v4 = [v2 languagesByAddingRelatedLanguagesToLanguages:v3];
  v5 = v4;
  if (!v4) {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = v4;

  return v6;
}

- (NSArray)userEnabledInputModes
{
  v2 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  v3 = [v2 enabledInputModeIdentifiers];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v5 = +[_TIMultilingualPreferences inputModesForIdentifiers:v4];

  return (NSArray *)v5;
}

- (NSArray)preferredAdditionalInputModes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v4 = [v3 valueForPreferenceKey:*MEMORY[0x1E4FAE778]];
  v5 = [v4 stringValue];

  v6 = [v5 componentsSeparatedByString:@","];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v11 && ([*(id *)(*((void *)&v14 + 1) + 8 * i) isEqualToString:@"auto"] & 1) == 0)
        {
          v12 = +[TIInputMode inputModeWithIdentifier:v11];
          [v2 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return (NSArray *)v2;
}

- (TIInputMode)preferredSecondaryInputMode
{
  v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v3 = [v2 valueForPreferenceKey:*MEMORY[0x1E4FAE950]];
  v4 = [v3 stringValue];

  if (v4 && ([v4 isEqualToString:@"auto"] & 1) == 0)
  {
    v5 = +[TIInputMode inputModeWithIdentifier:v4];
  }
  else
  {
    v5 = 0;
  }

  return (TIInputMode *)v5;
}

+ (id)inputModesForIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end