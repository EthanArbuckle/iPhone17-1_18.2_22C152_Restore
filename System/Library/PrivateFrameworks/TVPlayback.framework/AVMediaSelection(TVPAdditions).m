@interface AVMediaSelection(TVPAdditions)
- (id)tvp_description;
@end

@implementation AVMediaSelection(TVPAdditions)

- (id)tvp_description
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [a1 asset];
  id v20 = 0;
  uint64_t v3 = [v2 statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:&v20];
  id v4 = v20;
  if (v3 == 2
    || (id v5 = 0, v3 == 3)
    && (id v5 = 0,
        objc_msgSend(MEMORY[0x263EFA470], "tvp_shouldIgnoreLoadFailureForKey:error:logObject:", @"availableMediaCharacteristicsWithMediaSelectionOptions", v4, 0)))
  {
    id v14 = v4;
    id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [v2 availableMediaCharacteristicsWithMediaSelectionOptions];
    uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v11 = objc_msgSend(v2, "tvp_mediaSelectionGroupForMediaCharacteristic:", v10);
          v12 = [a1 selectedMediaOptionInMediaSelectionGroup:v11];
          [v5 appendFormat:@"%@: %@ ", v10, v12];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v7);
    }

    id v4 = v14;
  }

  return v5;
}

@end