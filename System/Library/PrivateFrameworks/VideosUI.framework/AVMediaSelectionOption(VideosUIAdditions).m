@interface AVMediaSelectionOption(VideosUIAdditions)
- (id)vui_localizedDisplayNameOverride;
@end

@implementation AVMediaSelectionOption(VideosUIAdditions)

- (id)vui_localizedDisplayNameOverride
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F16558] identifierForKey:*MEMORY[0x1E4F15E70] keySpace:*MEMORY[0x1E4F15DF8]];
  v3 = (void *)MEMORY[0x1E4F16558];
  v4 = [a1 commonMetadata];
  v5 = [v3 metadataItemsFromArray:v4 filteredByIdentifier:v2];

  if ([v5 count])
  {
    v6 = 0;
  }
  else
  {
    v25 = v5;
    v26 = v2;
    v7 = [a1 extendedLanguageTag];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v8 = +[VUIFeaturesConfiguration sharedInstance];
    v9 = [v8 nowPlayingConfig];
    v10 = [v9 mediaCharacteristicsToLocalize];

    id obj = v10;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v27 = 0;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([a1 hasMediaCharacteristic:v15])
          {
            id v16 = v15;
            if ([v7 length])
            {
              uint64_t v17 = [NSString stringWithFormat:@"%@.%@", v16, v7];

              id v16 = (id)v17;
            }
            if ([v16 length])
            {
              v18 = +[VUIFeaturesConfiguration sharedInstance];
              v19 = [v18 nowPlayingConfig];
              v20 = [v19 mediaLocalizationKeyMapping];
              v21 = [v20 objectForKey:v16];

              if ([v21 length])
              {
                v22 = +[VUILocalizationManager sharedInstance];
                uint64_t v23 = [v22 localizedStringForKey:v21];

                v27 = (void *)v23;
              }
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v12);
    }
    else
    {
      v27 = 0;
    }

    v5 = v25;
    v2 = v26;
    v6 = v27;
  }

  return v6;
}

@end