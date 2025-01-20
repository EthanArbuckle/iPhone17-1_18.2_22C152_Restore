@interface AVAsset(TVPAdditions)
+ (uint64_t)tvp_shouldIgnoreLoadFailureForKey:()TVPAdditions error:logObject:;
- (int64_t)tvp_maximumVideoRange;
- (uint64_t)tvp_maximumVideoResolution;
@end

@implementation AVAsset(TVPAdditions)

+ (uint64_t)tvp_shouldIgnoreLoadFailureForKey:()TVPAdditions error:logObject:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = a5;
  if (([v7 isEqualToString:@"availableVideoDynamicRanges"] & 1) == 0
    && ([v7 isEqualToString:@"maximumVideoResolution"] & 1) == 0
    && ([v7 isEqualToString:@"availableChapterLocales"] & 1) == 0)
  {
    v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v13 = [v12 arrayForKey:@"AVAssetKeysForWhichToIgnoreFailures"];

    if (v7 && v13)
    {
      if ([v13 containsObject:v7])
      {
        if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          id v19 = v7;
          _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring failure of key %@ due to user defaults", (uint8_t *)&v18, 0xCu);
        }
LABEL_20:
        uint64_t v10 = 1;
LABEL_23:

        goto LABEL_5;
      }
    }
    else if (!v7)
    {
      goto LABEL_22;
    }
    if ([v7 isEqualToString:@"availableMediaCharacteristicsWithMediaSelectionOptions"])
    {
      v14 = [v8 userInfo];
      v15 = [v14 objectForKey:*MEMORY[0x263EF9818]];

      if (![v15 count]
        || [v15 count] == 1
        && ([v15 firstObject],
            v16 = objc_claimAutoreleasedReturnValue(),
            int v17 = [v16 isEqualToString:*MEMORY[0x263F12468]],
            v16,
            v17))
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412546;
          id v19 = v7;
          __int16 v20 = 2112;
          id v21 = v8;
          _os_log_impl(&dword_236FC5000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring failure of key %@ due to non-fatal failure to load localized media selection names: %@", (uint8_t *)&v18, 0x16u);
        }

        goto LABEL_20;
      }
    }
LABEL_22:
    uint64_t v10 = 0;
    goto LABEL_23;
  }
  uint64_t v10 = 1;
LABEL_5:

  return v10;
}

- (uint64_t)tvp_maximumVideoResolution
{
  uint64_t v2 = [a1 statusOfValueForKey:@"maximumVideoResolution" error:0];
  uint64_t result = 0;
  if (v2 == 2)
  {
    [a1 maximumVideoResolution];
    uint64_t v5 = 3;
    if (v4 < 3456.0) {
      uint64_t v5 = 2;
    }
    if (v4 < 1280.0) {
      uint64_t v5 = 1;
    }
    if (v4 > 0.0) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (int64_t)tvp_maximumVideoRange
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t v2 = 0;
  if ([a1 statusOfValueForKey:@"availableVideoDynamicRanges" error:0] == 2)
  {
    v3 = [a1 availableVideoDynamicRanges];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      LODWORD(v6) = 0;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v3);
          }
          int v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) intValue];
          if (v9 <= (int)v6) {
            uint64_t v6 = v6;
          }
          else {
            uint64_t v6 = v9;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      uint64_t v6 = 0;
    }
    int64_t v2 = +[TVPPlayer tvpVideoRangeForVideoDynamicRange:v6];
  }
  return v2;
}

@end