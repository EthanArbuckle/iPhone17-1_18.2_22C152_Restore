@interface AVAsset(TVPAudioSubtitleAdditions)
- (id)tvp_sortedAudioAVMediaSelectionOptions;
- (id)tvp_sortedSubtitleAVMediaSelectionOptions;
@end

@implementation AVAsset(TVPAudioSubtitleAdditions)

- (id)tvp_sortedAudioAVMediaSelectionOptions
{
  id v8 = 0;
  uint64_t v2 = [a1 statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:&v8];
  id v3 = v8;
  if (v2 == 2
    || (v4 = 0, v2 == 3)
    && (v4 = 0,
        objc_msgSend(MEMORY[0x263EFA470], "tvp_shouldIgnoreLoadFailureForKey:error:logObject:", @"availableMediaCharacteristicsWithMediaSelectionOptions", v3, 0)))
  {
    v5 = objc_msgSend(a1, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9C80]);
    v6 = [v5 options];
    v4 = objc_msgSend((id)objc_opt_class(), "tvp_groupedAudioAVMediaSelectionOptionsFromOptions:", v6);
  }
  return v4;
}

- (id)tvp_sortedSubtitleAVMediaSelectionOptions
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v45 = 0;
  uint64_t v3 = [a1 statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:&v45];
  id v4 = v45;
  if (v3 == 2
    || v3 == 3
    && objc_msgSend(MEMORY[0x263EFA470], "tvp_shouldIgnoreLoadFailureForKey:error:logObject:", @"availableMediaCharacteristicsWithMediaSelectionOptions", v4, 0))
  {
    id v29 = v4;
    v30 = v2;
    v5 = objc_msgSend(a1, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x263EF9CD0]);
    v6 = [v5 options];

    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    v28 = [MEMORY[0x263EFF960] currentLocale];
    id v8 = [MEMORY[0x263EFF960] preferredLanguages];
    v9 = [v8 firstObject];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v42;
      uint64_t v14 = *MEMORY[0x263EF9C98];
      uint64_t v15 = *MEMORY[0x263EF9CB8];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(v10);
          }
          v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if (![v17 hasMediaCharacteristic:v14]
            || [v17 hasMediaCharacteristic:v15])
          {
            [v7 addObject:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v12);
    }

    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __79__AVAsset_TVPAudioSubtitleAdditions__tvp_sortedSubtitleAVMediaSelectionOptions__block_invoke;
    v38[3] = &unk_264CC65D8;
    id v39 = v9;
    id v40 = v28;
    id v18 = v28;
    id v19 = v9;
    v20 = [v7 sortedArrayUsingComparator:v38];
    uint64_t v21 = [v20 count];
    v22 = [MEMORY[0x263EFF980] array];
    v23 = [MEMORY[0x263EFF980] array];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __79__AVAsset_TVPAudioSubtitleAdditions__tvp_sortedSubtitleAVMediaSelectionOptions__block_invoke_2;
    v31[3] = &unk_264CC6600;
    id v32 = v22;
    id v33 = v23;
    uint64_t v37 = v21;
    id v34 = v20;
    id v2 = v30;
    id v35 = v30;
    v36 = a1;
    id v24 = v20;
    id v25 = v23;
    id v26 = v22;
    [v24 enumerateObjectsUsingBlock:v31];

    id v4 = v29;
  }

  return v2;
}

@end