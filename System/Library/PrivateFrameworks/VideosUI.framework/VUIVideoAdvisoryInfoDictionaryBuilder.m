@interface VUIVideoAdvisoryInfoDictionaryBuilder
+ (id)advisoryInfoDictionaryWithRatingImage:(id)a3 photoSensitivityImage:(id)a4 highMotionWarningImage:(id)a5 andMediaItem:(id)a6;
@end

@implementation VUIVideoAdvisoryInfoDictionaryBuilder

+ (id)advisoryInfoDictionaryWithRatingImage:(id)a3 photoSensitivityImage:(id)a4 highMotionWarningImage:(id)a5 andMediaItem:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_opt_new();
  v14 = v13;
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:@"VUIAdvisoryViewLogoImageKey"];
  }
  if (v12)
  {
    v52 = v11;
    id v49 = v9;
    v50 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9DE8]];
    v51 = v14;
    if ([v50 count])
    {
      id v47 = v12;
      id v48 = v10;
      v15 = objc_opt_new();
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id obj = v50;
      uint64_t v16 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            v21 = objc_opt_new();
            v22 = [v20 ratingName];
            uint64_t v23 = [v22 length];

            if (v23)
            {
              v24 = [v20 ratingName];
              [v21 setObject:v24 forKeyedSubscript:@"VUIAdvisoryViewLegendNameKey"];
            }
            v25 = [v20 ratingDescription];
            uint64_t v26 = [v25 length];

            if (v26)
            {
              v27 = [v20 ratingDescription];
              [v21 setObject:v27 forKeyedSubscript:@"VUIAdvisoryViewLegendDescriptionKey"];
            }
            if ([v21 count]) {
              [v15 addObject:v21];
            }
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
        }
        while (v17);
      }

      [v14 setObject:v15 forKeyedSubscript:@"VUIAdvisoryViewLegendsKey"];
      id v12 = v47;
      id v10 = v48;
    }
    v28 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FE8]];
    v29 = [v28 localizedInfoString];
    uint64_t v30 = [v29 length];

    if (v30)
    {
      v31 = [v28 localizedInfoString];
      [v14 setObject:v31 forKeyedSubscript:@"VUIAdvisoryViewBlockDescriptionKey"];
    }
    v32 = objc_opt_new();
    v33 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FC8]];
    v34 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FC0]];
    if (v33)
    {
      [v33 floatValue];
      if (v10)
      {
        if (v35 > 0.0 && v34)
        {
          v60[0] = @"VUIIAdditionalAdvisoryInfoDisplayDurationKey";
          v60[1] = @"VUIIAdditionalAdvisoryInfoViewDescriptionKey";
          v61[0] = v33;
          v61[1] = v34;
          v60[2] = @"VUIAdditionalAdvisoryInfoViewImageKey";
          v61[2] = v10;
          v36 = (void *)MEMORY[0x1E4F1C9E8];
          id v37 = v10;
          v38 = [v36 dictionaryWithObjects:v61 forKeys:v60 count:3];

          [v32 addObject:v38];
        }
      }
    }
    v39 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F60]];
    v40 = [v12 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F58]];
    if (v39)
    {
      [v39 floatValue];
      if (v52)
      {
        if (v41 > 0.0 && v40)
        {
          v58[0] = @"VUIIAdditionalAdvisoryInfoDisplayDurationKey";
          v58[1] = @"VUIIAdditionalAdvisoryInfoViewDescriptionKey";
          v59[0] = v39;
          v59[1] = v40;
          v58[2] = @"VUIAdditionalAdvisoryInfoViewImageKey";
          v59[2] = v52;
          v42 = (void *)MEMORY[0x1E4F1C9E8];
          id v43 = v52;
          v44 = [v42 dictionaryWithObjects:v59 forKeys:v58 count:3];

          [v32 addObject:v44];
        }
      }
    }
    [v51 setObject:v32 forKeyedSubscript:@"VUIAdvisoryViewAdditionalViewsDictionaryKey"];

    v14 = v51;
    id v9 = v49;
    id v11 = v52;
  }
  v45 = (void *)[v14 copy];

  return v45;
}

@end