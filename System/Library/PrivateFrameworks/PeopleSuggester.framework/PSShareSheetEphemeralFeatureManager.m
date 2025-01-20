@interface PSShareSheetEphemeralFeatureManager
@end

@implementation PSShareSheetEphemeralFeatureManager

uint64_t __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 intValue];
  uint64_t v5 = *(void *)(a1 + 40);

  return [v3 callFeatureFunctionWithFeature:v4 histogramFeatureData:v5];
}

uint64_t __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 intValue];

  return BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString();
}

void __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke_4;
  v7[3] = &unk_1E5AE1998;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:v10];

  if (!v7)
  {
    id v8 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v10];
  }
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
  [v9 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
}

@end