@interface PNAssetCurationUtilities
+ (BOOL)_assetIsSafeForWidgetDisplay:(id)a3 sceneClassifications:(id)a4 modelSet:(id)a5;
+ (BOOL)_isSupportedTabooEventIdentifier:(unint64_t)a3;
+ (BOOL)assetIsSafeForDisplay:(id)a3 modelSet:(id)a4;
+ (BOOL)assetIsSafeForWidgetDisplay:(id)a3;
+ (BOOL)assetIsSafeForWidgetDisplay:(id)a3 sceneClassifications:(id)a4;
+ (NSPredicate)internalPredicateToFilterAssetsEligibleForSyndication;
+ (NSPredicate)internalPredicateToFilterGuestSyndicatedAssetsEligibleForQuestion;
+ (NSPredicate)internalPredicateToFilterSyndicatedAssetsEligibleForCurationProcessing;
+ (NSPredicate)internalPredicateToFilterSyndicatedAssetsEligibleForGuestInferenceProcessing;
+ (NSPredicate)internalPredicateToFilterSyndicatedAssetsEligibleForQuestion;
+ (NSPredicate)internalPredicateToIncludeOnlyReceivedSyndicatedAssets;
+ (double)absolutePopularityOfPOI:(double)a3 assetLongitude:(double)a4 sceneGeography:(id)a5;
+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 POIGeoHash:(id)a4 sceneGeography:(id)a5;
+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 POIGeoHash:(id)a4 sceneGeography:(id)a5 maxScenesCount:(int64_t)a6;
+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 POIGeoHash:(id)a4 sceneGeography:(id)a5 maxScenesCount:(int64_t)a6 popularityWeight:(double)a7;
+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5;
+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6;
+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6 maxScenesCount:(int64_t)a7;
+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6 maxScenesCount:(int64_t)a7 popularityWeight:(double)a8;
+ (double)assetIconicScoreForSceneClassifications:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6 sceneTaxonomy:(id)a7;
+ (double)relativePopularityOfPOI:(double)a3 assetLongitude:(double)a4 sceneGeography:(id)a5;
+ (id)_internalPredicateToFilterSyndicatedAssetsEligibleWithCurationScore:(double)a3;
+ (id)assetsShowcasingFoodWithoutFacesInAssets:(id)a3;
+ (id)internalPredicateToIncludeOnlySentSyndicatedAssets;
+ (id)internalPredicateToIncludeReceivedNotAnalyzedSyndicatedAssets;
+ (id)internalPredicateToIncludeReceivedNotEligibleSyndicatedAssets;
+ (id)predicateForSourcingAssetsFromHighlightExtendedCuration;
+ (id)predicateForSourcingAssetsFromHighlightSummaryCuration;
+ (id)safeAssetsForWidgetDisplay:(id)a3;
+ (id)sceneIdentifiersByScoreForPOI:(double)a3 assetLongitude:(double)a4 sceneGeography:(id)a5;
+ (id)syndicationEligibilityForAssets:(id)a3;
@end

@implementation PNAssetCurationUtilities

+ (id)predicateForSourcingAssetsFromHighlightSummaryCuration
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != nil", @"highlightBeingSummaryAssets");
}

+ (id)predicateForSourcingAssetsFromHighlightExtendedCuration
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K > %f", @"highlightBeingExtendedAssets.promotionScore", *MEMORY[0x263F5DAF0]);
}

+ (id)sceneIdentifiersByScoreForPOI:(double)a3 assetLongitude:(double)a4 sceneGeography:(id)a5
{
  v7 = (void *)MEMORY[0x263F14D68];
  id v8 = a5;
  v9 = [v7 poiGeoHashWithGeoHashSize:6 latitude:a3 longitude:a4];
  v10 = [v8 scenesByScoreForPOIHash:v9];

  return v10;
}

+ (double)absolutePopularityOfPOI:(double)a3 assetLongitude:(double)a4 sceneGeography:(id)a5
{
  v7 = (void *)MEMORY[0x263F14D68];
  id v8 = a5;
  v9 = [v7 poiGeoHashWithGeoHashSize:6 latitude:a3 longitude:a4];
  [v8 popularityForPOI:v9 popularity:1];
  double v11 = v10;

  return v11;
}

+ (double)relativePopularityOfPOI:(double)a3 assetLongitude:(double)a4 sceneGeography:(id)a5
{
  v7 = (void *)MEMORY[0x263F14D68];
  id v8 = a5;
  v9 = [v7 poiGeoHashWithGeoHashSize:6 latitude:a3 longitude:a4];
  [v8 popularityForPOI:v9 popularity:0];
  double v11 = v10;

  return v11;
}

+ (double)assetIconicScoreForSceneClassifications:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6 sceneTaxonomy:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend(v20, "extendedSceneIdentifier", (void)v29);
        if ([v13 nodeRefForExtendedSceneClassId:v21])
        {
          PFSceneTaxonomyNodeSearchThreshold();
          double v23 = v22;
          [v20 confidence];
          if (v24 >= v23)
          {
            v25 = [NSNumber numberWithUnsignedLongLong:v21];
            [v14 addObject:v25];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v17);
  }

  +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:v14 assetLatitude:v12 assetLongitude:a4 sceneGeography:a5];
  double v27 = v26;

  return v27;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 POIGeoHash:(id)a4 sceneGeography:(id)a5 maxScenesCount:(int64_t)a6 popularityWeight:(double)a7
{
  [a5 scoreForPOI:a4 scenes:a3 maxScenesCount:a6 popularityWeight:a7];
  return result;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 POIGeoHash:(id)a4 sceneGeography:(id)a5 maxScenesCount:(int64_t)a6
{
  [a5 scoreForPOI:a4 scenes:a3 maxScenesCount:a6 popularityWeight:0.8];
  return result;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 POIGeoHash:(id)a4 sceneGeography:(id)a5
{
  [a5 scoreForPOI:a4 scenes:a3 maxScenesCount:0x7FFFFFFFFFFFFFFFLL popularityWeight:0.8];
  return result;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6 maxScenesCount:(int64_t)a7 popularityWeight:(double)a8
{
  id v13 = (void *)MEMORY[0x263F14D68];
  id v14 = a6;
  id v15 = a3;
  uint64_t v16 = [v13 poiGeoHashWithGeoHashSize:6 latitude:a4 longitude:a5];
  +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:v15 POIGeoHash:v16 sceneGeography:v14 maxScenesCount:a7 popularityWeight:a8];
  double v18 = v17;

  return v18;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6 maxScenesCount:(int64_t)a7
{
  id v11 = (void *)MEMORY[0x263F14D68];
  id v12 = a6;
  id v13 = a3;
  id v14 = [v11 poiGeoHashWithGeoHashSize:6 latitude:a4 longitude:a5];
  +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:v13 POIGeoHash:v14 sceneGeography:v12 maxScenesCount:a7];
  double v16 = v15;

  return v16;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6
{
  v9 = (void *)MEMORY[0x263F14D68];
  id v10 = a6;
  id v11 = a3;
  id v12 = [v9 poiGeoHashWithGeoHashSize:6 latitude:a4 longitude:a5];
  +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:v11 POIGeoHash:v12 sceneGeography:v10];
  double v14 = v13;

  return v14;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5
{
  v7 = (objc_class *)MEMORY[0x263F5DF60];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:v8 assetLatitude:v9 assetLongitude:a4 sceneGeography:a5];
  double v11 = v10;

  return v11;
}

+ (id)internalPredicateToIncludeReceivedNotEligibleSyndicatedAssets
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = +[PNAssetCurationUtilities internalPredicateToIncludeOnlyReceivedSyndicatedAssets];
  v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K < %f", @"curationScore", *MEMORY[0x263F5D9D8]);
  v4 = [MEMORY[0x263F5D940] predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestSceneVersion];
  v5 = (void *)MEMORY[0x263F08730];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  v7 = [v5 andPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)internalPredicateToIncludeReceivedNotAnalyzedSyndicatedAssets
{
  v19[5] = *MEMORY[0x263EF8340];
  double v17 = +[PNAssetCurationUtilities internalPredicateToIncludeOnlyReceivedSyndicatedAssets];
  v2 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K < 0", @"thumbnailIndex");
  v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K <= 0.0", @"curationScore");
  v4 = (void *)MEMORY[0x263F08730];
  v5 = [MEMORY[0x263F5D940] predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestSceneVersion];
  v6 = [v4 notPredicateWithSubpredicate:v5];

  uint64_t v7 = *MEMORY[0x263F5D9D8];
  id v8 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K >= %f && %K != nil && %K != %llu", @"curationScore", *MEMORY[0x263F5D9D8], @"faceAdjustmentVersion", @"mediaAnalysisAttributes.syndicationProcessingVersion", *MEMORY[0x263F15058]);
  id v9 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K >= %f && %K == nil && %K != %llu", @"curationScore", v7, @"faceAdjustmentVersion", @"mediaAnalysisAttributes.syndicationProcessingVersion", *MEMORY[0x263F15050]);
  double v10 = (void *)MEMORY[0x263F08730];
  v19[0] = v2;
  v19[1] = v3;
  v19[2] = v6;
  v19[3] = v8;
  v19[4] = v9;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:5];
  id v12 = [v10 orPredicateWithSubpredicates:v11];

  double v13 = (void *)MEMORY[0x263F08730];
  v18[0] = v17;
  v18[1] = v12;
  double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  double v15 = [v13 andPredicateWithSubpredicates:v14];

  return v15;
}

+ (id)internalPredicateToIncludeOnlySentSyndicatedAssets
{
  v2 = (void *)MEMORY[0x263F08730];
  v3 = +[PNAssetCurationUtilities internalPredicateToIncludeOnlyReceivedSyndicatedAssets];
  v4 = [v2 notPredicateWithSubpredicate:v3];

  return v4;
}

+ (NSPredicate)internalPredicateToIncludeOnlyReceivedSyndicatedAssets
{
  return (NSPredicate *)[MEMORY[0x263F5D940] filterPredicateToIncludeOnlyReceivedSyndicatedAssets];
}

+ (NSPredicate)internalPredicateToFilterSyndicatedAssetsEligibleForGuestInferenceProcessing
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = [a1 internalPredicateToFilterAssetsEligibleForSyndication];
  v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(%K & %i) != %i", @"mediaAnalysisAttributes.syndicationProcessingValue", 4096, 4096);
  v4 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"NOT (%K == %llu OR (%K == nil && %K == %llu))", @"mediaAnalysisAttributes.syndicationProcessingVersion", *MEMORY[0x263F15058], @"faceAdjustmentVersion", @"mediaAnalysisAttributes.syndicationProcessingVersion", *MEMORY[0x263F15050]);
  v5 = (void *)MEMORY[0x263F08730];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

  return (NSPredicate *)v7;
}

+ (NSPredicate)internalPredicateToFilterSyndicatedAssetsEligibleForCurationProcessing
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = [a1 internalPredicateToIncludeOnlyReceivedSyndicatedAssets];
  v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == 0.0", @"curationScore");
  v4 = [MEMORY[0x263F5D940] predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestSceneVersion];
  v5 = (void *)MEMORY[0x263F08730];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

  return (NSPredicate *)v7;
}

+ (NSPredicate)internalPredicateToFilterGuestSyndicatedAssetsEligibleForQuestion
{
  v14[2] = *MEMORY[0x263EF8340];
  v2 = [a1 internalPredicateToFilterSyndicatedAssetsEligibleForQuestion];
  v3 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %llu", @"mediaAnalysisAttributes.syndicationProcessingVersion", *MEMORY[0x263F15058]);
  v4 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %llu", @"mediaAnalysisAttributes.syndicationProcessingVersion", *MEMORY[0x263F15050]);
  v5 = (void *)MEMORY[0x263F08730];
  v14[0] = v3;
  v14[1] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  uint64_t v7 = [v5 orPredicateWithSubpredicates:v6];

  id v8 = objc_msgSend(MEMORY[0x263F5DB90], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x263F5DB90], "maskForGuestAsset"), 1);
  id v9 = (void *)MEMORY[0x263F08730];
  v13[0] = v2;
  v13[1] = v8;
  v13[2] = v7;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  double v11 = [v9 andPredicateWithSubpredicates:v10];

  return (NSPredicate *)v11;
}

+ (NSPredicate)internalPredicateToFilterSyndicatedAssetsEligibleForQuestion
{
  v11[3] = *MEMORY[0x263EF8340];
  v2 = [a1 _internalPredicateToFilterSyndicatedAssetsEligibleWithCurationScore:0.0];
  v3 = (void *)MEMORY[0x263F08A98];
  v4 = [(id)*MEMORY[0x263F1DAD0] identifier];
  v5 = [v3 predicateWithFormat:@"%K != %@", @"uniformTypeIdentifier", v4];

  v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(%K != %d) AND (%K != %d)", @"kindSubtype", 10, @"kindSubtype", 103);
  uint64_t v7 = (void *)MEMORY[0x263F08730];
  v11[0] = v2;
  v11[1] = v5;
  v11[2] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
  id v9 = [v7 andPredicateWithSubpredicates:v8];

  return (NSPredicate *)v9;
}

+ (NSPredicate)internalPredicateToFilterAssetsEligibleForSyndication
{
  return (NSPredicate *)[a1 _internalPredicateToFilterSyndicatedAssetsEligibleWithCurationScore:*MEMORY[0x263F5D9D8]];
}

+ (id)_internalPredicateToFilterSyndicatedAssetsEligibleWithCurationScore:(double)a3
{
  v12[4] = *MEMORY[0x263EF8340];
  v4 = [a1 internalPredicateToIncludeOnlyReceivedSyndicatedAssets];
  v5 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K >= %f", @"curationScore", *(void *)&a3);
  v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"additionalAttributes.importedByBundleIdentifier", *MEMORY[0x263F5D9F8]];
  uint64_t v7 = [MEMORY[0x263F5D940] predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestSceneVersion];
  id v8 = (void *)MEMORY[0x263F08730];
  v12[0] = v4;
  v12[1] = v5;
  v12[2] = v6;
  v12[3] = v7;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
  double v10 = [v8 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)syndicationEligibilityForAssets:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          double v13 = [MEMORY[0x263F08690] currentHandler];
          [v13 handleFailureInMethod:a2, a1, @"PNAssetCurationUtilities.m", 199, @"Invalid parameter not satisfying: %@", @"[asset isKindOfClass:PHAsset.class]" object file lineNumber description];
        }
        id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "syndicationEligibility"));
        [v5 setObject:v12 forKeyedSubscript:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)_isSupportedTabooEventIdentifier:(unint64_t)a3
{
  return (a3 - 2147482870 < 0xA) & (0x37Fu >> (a3 + 10));
}

+ (id)safeAssetsForWidgetDisplay:(id)a3
{
  id v4 = (void *)MEMORY[0x263F14EF0];
  id v5 = a3;
  id v6 = [v4 fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:v5];
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__PNAssetCurationUtilities_safeAssetsForWidgetDisplay___block_invoke;
  void v13[3] = &unk_26544F0F8;
  id v14 = v6;
  id v16 = a1;
  id v8 = v7;
  id v15 = v8;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v13];

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

void __55__PNAssetCurationUtilities_safeAssetsForWidgetDisplay___block_invoke(id *a1, void *a2)
{
  id v9 = a2;
  v3 = [v9 localIdentifier];
  uint64_t v4 = [a1[4] objectForKeyedSubscript:v3];
  id v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x263EFFA68];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  int v8 = [a1[6] assetIsSafeForWidgetDisplay:v9 sceneClassifications:v7];
  if (v8) {
    [a1[5] addObject:v9];
  }
}

+ (BOOL)_assetIsSafeForWidgetDisplay:(id)a3 sceneClassifications:(id)a4 modelSet:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (PNAssetSafeForDisplayModelSet *)a5;
  if (v8)
  {
    id v11 = v10;
    id v12 = v11;
    if (!v11)
    {
      double v13 = [v8 sceneAnalysisProperties];
      uint64_t v14 = [v13 sceneAnalysisVersion];

      id v15 = [PNAssetSafeForDisplayModelSet alloc];
      uint64_t v16 = v14;
      id v11 = 0;
      id v12 = [(PNAssetSafeForDisplayModelSet *)v15 initWithSceneAnalysisVersion:v16];
    }
    long long v17 = [(PNAssetSafeForDisplayModelSet *)v12 ivsNSFWModel];
    long long v18 = [v17 anyNode];

    long long v19 = [(PNAssetSafeForDisplayModelSet *)v12 nsfwModel];
    v20 = [v19 generalNode];

    v45 = v12;
    uint64_t v21 = [(PNAssetSafeForDisplayModelSet *)v12 tabooEventModel];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v22 = v9;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      v42 = v11;
      id v43 = v9;
      id v44 = v8;
      uint64_t v25 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(v22);
          }
          double v27 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          uint64_t v28 = objc_msgSend(v27, "extendedSceneIdentifier", v42, v43, v44);
          if (v28 == [v18 identifier])
          {
            [v27 confidence];
            double v30 = v29;
            [v18 highRecallOperatingPoint];
            if (v30 >= v31) {
              goto LABEL_19;
            }
          }
          if (!v18 && v28 == [v20 identifier])
          {
            [v27 confidence];
            double v33 = v32;
            [v20 highRecallOperatingPoint];
            if (v33 >= v34) {
              goto LABEL_19;
            }
          }
          if ([a1 _isSupportedTabooEventIdentifier:v28])
          {
            v35 = [v21 nodeForSignalIdentifier:v28];
            [v35 highRecallOperatingPoint];
            double v37 = v36;
            [v27 confidence];
            double v39 = v38;

            if (v39 >= v37)
            {
LABEL_19:
              BOOL v40 = 0;
              goto LABEL_20;
            }
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v24) {
          continue;
        }
        break;
      }
      BOOL v40 = 1;
LABEL_20:
      id v9 = v43;
      id v8 = v44;
      id v11 = v42;
    }
    else
    {
      BOOL v40 = 1;
    }

    uint64_t v10 = v45;
  }
  else
  {
    BOOL v40 = 0;
  }

  return v40;
}

+ (BOOL)assetIsSafeForWidgetDisplay:(id)a3 sceneClassifications:(id)a4
{
  return [a1 _assetIsSafeForWidgetDisplay:a3 sceneClassifications:a4 modelSet:0];
}

+ (BOOL)assetIsSafeForWidgetDisplay:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sceneClassifications];
  LOBYTE(a1) = [a1 _assetIsSafeForWidgetDisplay:v4 sceneClassifications:v5 modelSet:0];

  return (char)a1;
}

+ (BOOL)assetIsSafeForDisplay:(id)a3 modelSet:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 sceneAnalysisProperties];
  int v9 = [v8 sceneAnalysisVersion];
  int v10 = [v7 sceneAnalysisVersion];

  if (v9 != v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = [v6 sceneAnalysisProperties];
    v15[0] = 67109376;
    v15[1] = [v14 sceneAnalysisVersion];
    __int16 v16 = 1024;
    int v17 = [v7 sceneAnalysisVersion];
    _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[PNAssetCurationUtilities] assetIsSafeForDisplay asset and modelSet sceneAnalysisVersion mismatch (%d != %d)", (uint8_t *)v15, 0xEu);
  }
  id v11 = [v6 sceneClassifications];
  char v12 = [a1 _assetIsSafeForWidgetDisplay:v6 sceneClassifications:v11 modelSet:v7];

  return v12;
}

+ (id)assetsShowcasingFoodWithoutFacesInAssets:(id)a3
{
  v67[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 firstObject];
  id v5 = [v4 photoLibrary];
  if (v5)
  {
    v42 = v5;
    id v43 = v4;
    id v6 = [v5 librarySpecificFetchOptions];
    v67[0] = *MEMORY[0x263F15088];
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:1];
    [v6 setFetchPropertySets:v7];

    v41 = v6;
    id v8 = [MEMORY[0x263F14DF0] fetchFacesGroupedByAssetLocalIdentifierForAssets:v3 options:v6];
    long long v48 = [MEMORY[0x263F14EF0] fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:v3];
    [MEMORY[0x263EFF980] array];
    id v44 = v3;
    id v45 = (id)objc_claimAutoreleasedReturnValue();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = v3;
    uint64_t v9 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (!v9) {
      goto LABEL_29;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v62;
    uint64_t v46 = *(void *)v62;
    long long v47 = v8;
    while (1)
    {
      uint64_t v12 = 0;
      uint64_t v49 = v10;
      do
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v61 + 1) + 8 * v12);
        uint64_t v14 = (void *)MEMORY[0x25A2E0AC0]();
        id v15 = [v13 localIdentifier];
        __int16 v16 = [v8 objectForKeyedSubscript:v15];
        uint64_t v17 = [v16 count];

        if (!v17)
        {
          v55 = v14;
          uint64_t v56 = v12;
          v54 = v15;
          uint64_t v18 = [v48 objectForKeyedSubscript:v15];
          uint64_t v51 = v13;
          long long v19 = [v13 sceneAnalysisProperties];
          uint64_t v20 = (int)[v19 sceneAnalysisVersion];

          v53 = (void *)[objc_alloc(MEMORY[0x263F5E0E8]) initWithSceneAnalysisVersion:v20];
          uint64_t v21 = [v53 foodDrinkFoodieNode];
          v52 = (void *)[objc_alloc(MEMORY[0x263F5E0B8]) initWithSceneAnalysisVersion:v20];
          id v22 = [v52 foodOrDrinkNode];
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v23 = v18;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
          if (!v24) {
            goto LABEL_26;
          }
          uint64_t v25 = v24;
          char v26 = 0;
          char v27 = 0;
          uint64_t v28 = *(void *)v58;
          while (1)
          {
            uint64_t v29 = 0;
            do
            {
              if (*(void *)v58 != v28) {
                objc_enumerationMutation(v23);
              }
              double v30 = *(void **)(*((void *)&v57 + 1) + 8 * v29);
              uint64_t v31 = [v30 extendedSceneIdentifier];
              if (v31 == [v21 identifier]
                && ([v30 confidence], double v33 = v32, objc_msgSend(v21, "operatingPoint"), v33 >= v34))
              {
                char v27 = 1;
              }
              else
              {
                uint64_t v35 = [v30 extendedSceneIdentifier];
                if (v35 == [v22 identifier])
                {
                  [v30 confidence];
                  double v37 = v36;
                  [v22 highPrecisionOperatingPoint];
                  if (v37 >= v38) {
                    char v26 = 1;
                  }
                }
                if ((v27 & 1) == 0) {
                  goto LABEL_20;
                }
              }
              if (v26)
              {
                [v45 addObject:v51];
                goto LABEL_26;
              }
LABEL_20:
              ++v29;
            }
            while (v25 != v29);
            uint64_t v39 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
            uint64_t v25 = v39;
            if (!v39)
            {
LABEL_26:

              uint64_t v11 = v46;
              id v8 = v47;
              uint64_t v10 = v49;
              uint64_t v14 = v55;
              uint64_t v12 = v56;
              id v15 = v54;
              break;
            }
          }
        }

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (!v10)
      {
LABEL_29:

        id v4 = v43;
        id v3 = v44;
        id v5 = v42;
        goto LABEL_31;
      }
    }
  }
  id v45 = (id)MEMORY[0x263EFFA68];
LABEL_31:

  return v45;
}

@end