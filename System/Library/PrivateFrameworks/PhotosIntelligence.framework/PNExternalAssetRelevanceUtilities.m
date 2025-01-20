@interface PNExternalAssetRelevanceUtilities
+ (BOOL)importedAssetInferredRelevant:(id)a3;
+ (id)internalPredicateToIncludeExternalAssetsEligibleForProcessing;
+ (id)internalPredicateToIncludeExternalAssetsNeedingProcessing;
+ (id)internalPredicateToIncludeProcessedExternalAssets;
+ (int64_t)externalAssetEligibilityForAsset:(id)a3;
@end

@implementation PNExternalAssetRelevanceUtilities

+ (BOOL)importedAssetInferredRelevant:(id)a3
{
  id v3 = a3;
  v4 = [v3 curationProperties];
  v5 = [v4 importedByBundleIdentifier];

  if (!v5) {
    goto LABEL_4;
  }
  v6 = [MEMORY[0x263F5D960] importedByBundleIdentifiersAllowListForMomentGeneration];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) != 0
    || ([v3 mediaAnalysisProperties],
        v8 = objc_claimAutoreleasedReturnValue(),
        __int16 v9 = [v8 syndicationProcessingValue],
        v8,
        (v9 & 0x3CF1) != 0))
  {
LABEL_4:
    BOOL v10 = 1;
  }
  else
  {
    v12 = [MEMORY[0x263F5D960] importedByBundleIdentifiersToIncludeIfNotProcessed];
    if ([v12 containsObject:v5])
    {
      v13 = [v3 mediaAnalysisProperties];
      BOOL v10 = [v13 syndicationProcessingVersion] == 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  return v10;
}

+ (id)internalPredicateToIncludeExternalAssetsEligibleForProcessing
{
  return (id)[MEMORY[0x263F5D960] internalPredicateToIncludeExternalAssetsEligibleForProcessing];
}

+ (id)internalPredicateToIncludeProcessedExternalAssets
{
  v9[2] = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %llu", @"mediaAnalysisAttributes.syndicationProcessingVersion", 8);
  v4 = (void *)MEMORY[0x263F08730];
  v5 = [a1 internalPredicateToIncludeExternalAssetsEligibleForProcessing];
  v9[0] = v5;
  v9[1] = v3;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  char v7 = [v4 andPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)internalPredicateToIncludeExternalAssetsNeedingProcessing
{
  v12[5] = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %llu", @"mediaAnalysisAttributes.syndicationProcessingVersion", 8);
  v4 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K >= %f", @"curationScore", 0x3FE0000000000000);
  v5 = [MEMORY[0x263F5D940] predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestSceneVersion];
  v6 = [MEMORY[0x263F5D940] predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestFaceVersion];
  char v7 = (void *)MEMORY[0x263F08730];
  v8 = [a1 internalPredicateToIncludeExternalAssetsEligibleForProcessing];
  v12[0] = v8;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  __int16 v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
  BOOL v10 = [v7 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (int64_t)externalAssetEligibilityForAsset:(id)a3
{
  id v3 = a3;
  v4 = [v3 sceneAnalysisProperties];
  int v5 = [v4 sceneAnalysisVersion];
  v6 = [MEMORY[0x263F5D958] currentSceneVersion];
  int v7 = [v6 intValue];

  if (v7 <= v5)
  {
    __int16 v9 = [v3 faceAdjustmentVersion];

    if (v9)
    {
      [v3 curationScore];
      if (v10 == 0.0)
      {
        int64_t v8 = -2;
      }
      else
      {
        [v3 curationScore];
        if (v11 >= *MEMORY[0x263F5D9D8])
        {
          v12 = [v3 mediaAnalysisProperties];
          uint64_t v13 = [v12 syndicationProcessingVersion];

          if (v13 == 8)
          {
            v14 = [v3 mediaAnalysisProperties];
            __int16 v15 = [v14 syndicationProcessingValue];

            if ((v15 & 0x3CF1) != 0) {
              int64_t v8 = 2;
            }
            else {
              int64_t v8 = 1;
            }
          }
          else
          {
            int64_t v8 = -1;
          }
        }
        else
        {
          int64_t v8 = 0;
        }
      }
    }
    else
    {
      int64_t v8 = -3;
    }
  }
  else
  {
    int64_t v8 = -4;
  }

  return v8;
}

@end