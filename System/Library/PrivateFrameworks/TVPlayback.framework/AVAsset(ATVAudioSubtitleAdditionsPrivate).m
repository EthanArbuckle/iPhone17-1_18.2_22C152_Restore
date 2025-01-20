@interface AVAsset(ATVAudioSubtitleAdditionsPrivate)
+ (id)tvp_filteredAndSubsortedMainProgramSubtitleOptionsFromOptions:()ATVAudioSubtitleAdditionsPrivate;
+ (id)tvp_groupedAudioAVMediaSelectionOptionsFromOptions:()ATVAudioSubtitleAdditionsPrivate;
+ (id)tvp_sortedAuxSubtitleOptionsFromOptions:()ATVAudioSubtitleAdditionsPrivate;
@end

@implementation AVAsset(ATVAudioSubtitleAdditionsPrivate)

+ (id)tvp_groupedAudioAVMediaSelectionOptionsFromOptions:()ATVAudioSubtitleAdditionsPrivate
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [MEMORY[0x263EFF980] array];
    v5 = [MEMORY[0x263EFF980] array];
    [MEMORY[0x263EFF980] array];
    v22 = id v21 = v3;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      uint64_t v10 = *MEMORY[0x263EF9CA8];
      uint64_t v11 = *MEMORY[0x263EF9CC0];
      uint64_t v12 = *MEMORY[0x263EF9CB8];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          char v15 = objc_msgSend(v14, "hasMediaCharacteristic:", v10, v21);
          v16 = v5;
          if ((v15 & 1) == 0)
          {
            char v17 = [v14 hasMediaCharacteristic:v11];
            v16 = v4;
            if ((v17 & 1) == 0)
            {
              int v18 = [v14 hasMediaCharacteristic:v12];
              v16 = v22;
              if (!v18) {
                continue;
              }
            }
          }
          [v16 addObject:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    v19 = [MEMORY[0x263EFF980] array];
    [v19 addObjectsFromArray:v4];
    [v19 addObjectsFromArray:v5];
    [v19 addObjectsFromArray:v22];

    id v3 = v21;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)tvp_filteredAndSubsortedMainProgramSubtitleOptionsFromOptions:()ATVAudioSubtitleAdditionsPrivate
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v19 = [MEMORY[0x263EFF980] array];
  v22 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263EFF980] array];
  id v21 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    uint64_t v9 = *MEMORY[0x263EF9CF0];
    uint64_t v10 = *MEMORY[0x263EF9CA0];
    uint64_t v23 = *MEMORY[0x263EF9CD8];
    uint64_t v20 = *MEMORY[0x263EF9CB0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v13 = [v12 mediaType];
        char v14 = [v13 isEqualToString:v9];

        char v15 = v5;
        if ((v14 & 1) == 0)
        {
          char v16 = [v12 hasMediaCharacteristic:v10];
          char v15 = v4;
          if ((v16 & 1) == 0)
          {
            char v17 = [v12 hasMediaCharacteristic:v23];
            char v15 = v4;
            if ((v17 & 1) == 0)
            {
              if ([v12 hasMediaCharacteristic:v20]) {
                char v15 = v21;
              }
              else {
                char v15 = v22;
              }
            }
          }
        }
        [v15 addObject:v12];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  [v19 addObjectsFromArray:v22];
  [v19 addObjectsFromArray:v4];
  [v19 addObjectsFromArray:v5];
  [v19 addObjectsFromArray:v21];

  return v19;
}

+ (id)tvp_sortedAuxSubtitleOptionsFromOptions:()ATVAudioSubtitleAdditionsPrivate
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF8C0] array];
  if (v3)
  {
    uint64_t v5 = [v3 sortedArrayUsingComparator:&__block_literal_global_13];

    v4 = (void *)v5;
  }

  return v4;
}

@end