@interface PNSuggestionWallpaperUtilities
+ (BOOL)_assetPassesFRCInstantPlayback:(id)a3;
+ (BOOL)_cacheExistsForAsset:(id)a3;
+ (BOOL)_updateAvailableFeatures:(unint64_t)a3 forSuggestions:(id)a4 toClear:(BOOL)a5;
+ (BOOL)assetIsEligibleForSettlingEffect:(id)a3;
+ (BOOL)clearAvailableFeatures:(unint64_t)a3 forSuggestions:(id)a4;
+ (BOOL)hasAnyKnownPersonLocalIdentifierInPhotoLibrary:(id)a3;
+ (BOOL)setAvailableFeatures:(unint64_t)a3 forSuggestions:(id)a4;
+ (BOOL)wallpaperDemoModeEnabled;
+ (CGRect)bestWallpaperCropForAsset:(id)a3 classification:(unint64_t)a4 outputCropScore:(double *)a5 outputLayoutAcceptable:(BOOL *)a6;
+ (CGRect)bestWallpaperCropForAsset:(id)a3 classification:(unint64_t)a4 outputCropScore:(double *)a5 outputLayoutAcceptable:(BOOL *)a6 layoutConfiguration:(id)a7;
+ (CGRect)bestWallpaperCropForSuggestion:(id)a3 outputCropScore:(double *)a4 outputLayoutAcceptable:(BOOL *)a5;
+ (double)cropScoreWithAsset:(id)a3 classification:(unint64_t)a4 passesClockOverlap:(BOOL *)a5 cropZoomRatio:(double *)a6 orientation:(int64_t)a7;
+ (id)_assetSortComparatorForPortraitWallpaper;
+ (id)_coldStartPortraitWallpaperInPhotoLibrary:(id)a3 candidatePersons:(id)a4 passingFilterBlock:(id)a5 maximumNumberOfTries:(unint64_t)a6 targetCount:(unint64_t)a7;
+ (id)_facePredicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:(id)a3 deviceAspectRatio:(double)a4;
+ (id)_fetchMeContactIdentifier;
+ (id)_fetchSettlingEffectSuggestionKeyAssetsWithOptions:(id)a3;
+ (id)_fetchSuggestedMePersonLocalIdentifierInPhotoLibrary:(id)a3;
+ (id)_filterSuggestions:(id)a3 withSingleFeature:(unint64_t)a4 included:(BOOL)a5;
+ (id)_mePersonUUIDInPhotoLibrary:(id)a3;
+ (id)_mostRecentAssetDateInPhotoLibrary:(id)a3;
+ (id)_personFetchOptionsWithPhotoLibrary:(id)a3;
+ (id)_settlingEffectAssetFetchPropertySets;
+ (id)coldStartDeviceOwnerWallpaperInPhotoLibrary:(id)a3;
+ (id)coldStartPortraitWallpaperInPhotoLibrary:(id)a3;
+ (id)coldStartPortraitWallpaperInPhotoLibrary:(id)a3 passingFilterBlock:(id)a4 maximumNumberOfTries:(unint64_t)a5;
+ (id)fetchKnownPersonLocalIdentifiersInPhotoLibrary:(id)a3 fetchLimit:(unint64_t)a4;
+ (id)fetchLivePhotoTabAssetsWithOptions:(id)a3;
+ (id)fetchLivePhotoTabHighlightCandidateAssetsWithOptions:(id)a3 excludeExistingWallpapers:(BOOL)a4 statistics:(id *)a5;
+ (id)fetchLivePhotoTabHighlightSettlingEffectAssetsWithOptions:(id)a3 excludeExistingWallpapers:(BOOL)a4;
+ (id)fetchPersonLocalIdentifiersForSuggestionSubtype:(unsigned __int16)a3 photoLibrary:(id)a4;
+ (id)fetchPortraitAssetsWithOptions:(id)a3;
+ (id)fetchSettlingEffectSuggestionsInPhotoLibrary:(id)a3;
+ (id)fetchSettlingEffectSuggestionsWithOptions:(id)a3;
+ (id)fetchWallpaperGallerySuggestionsInPhotoLibrary:(id)a3;
+ (id)filterSuggestions:(id)a3 excludingSingleFeature:(unint64_t)a4;
+ (id)filterSuggestions:(id)a3 includingSingleFeature:(unint64_t)a4;
+ (id)knownPersonLocalIdentifiersInPhotoLibrary:(id)a3;
+ (id)predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:(id)a3;
+ (id)predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:(id)a3 deviceAspectRatio:(double)a4;
+ (id)randomNumberGeneratorForWallpaperDonation;
+ (id)randomNumberGeneratorForWallpaperDonationWithDate:(id)a3;
+ (id)randomizedSuggestionsFromSuggestions:(id)a3 limit:(unint64_t)a4;
+ (id)settlingEffectAssetInternalSortDescriptors;
+ (id)settlingEffectLivePhotoPredicate;
+ (id)wallpaperCroppingDebugKeyValuePairsForAsset:(id)a3;
+ (id)wallpaperGalleryFeaturedPhotoSortedSuggestionsFromSuggestions:(id)a3;
+ (id)wallpaperGallerySmartAlbumSuggestionsFromSuggestions:(id)a3;
+ (id)wallpaperPeopleLocalIdentifiersInPhotoLibrary:(id)a3 vipOnly:(BOOL)a4;
+ (int64_t)primaryOrientation;
+ (unint64_t)_settlingEffectVideoDecisionForAsset:(id)a3;
+ (unint64_t)mediaAnalysisTypeForPosterClassification:(unint64_t)a3;
+ (unint64_t)posterClassificationForMedia:(id)a3 descriptorType:(int64_t)a4;
+ (unint64_t)posterClassificationForSuggestionMedia:(id)a3;
+ (unint64_t)posterClassificationForSuggestionSubtype:(unsigned __int16)a3;
+ (void)rejectWallpaperSuggestions:(id)a3 completionHandler:(id)a4;
+ (void)rejectWallpaperSuggestionsUsingAsset:(id)a3 completionHandler:(id)a4;
+ (void)rejectWallpaperSuggestionsUsingAssetOfSuggestion:(id)a3 completionHandler:(id)a4;
@end

@implementation PNSuggestionWallpaperUtilities

+ (BOOL)wallpaperDemoModeEnabled
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PNWallpaperDemoModeEnabled"];

  return v3;
}

+ (BOOL)_updateAvailableFeatures:(unint64_t)a3 forSuggestions:(id)a4 toClear:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if ([v7 count])
  {
    PLWallpaperGetLog();
    os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    v8 = [v7 firstObject];
    v27 = [v8 photoLibrary];

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v33 = 0u;
    long long v34 = 0u;
    if (v5) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = a3;
    }
    long long v35 = 0uLL;
    long long v36 = 0uLL;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (([v16 availableFeatures] & a3) != v10) {
            [v9 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v13);
    }

    if ([v9 count])
    {
      int v17 = [v11 count];
      int v18 = [v9 count];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __82__PNSuggestionWallpaperUtilities__updateAvailableFeatures_forSuggestions_toClear___block_invoke;
      v29[3] = &unk_26544F040;
      BOOL v32 = v5;
      id v30 = v11;
      unint64_t v31 = a3;
      id v28 = 0;
      char v19 = [v27 performChangesAndWait:v29 error:&v28];
      v20 = (__CFString *)v28;
      os_log_t v21 = oslog;
      if (v19)
      {
        v22 = oslog;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          if (v5) {
            v23 = @"Cleared";
          }
          else {
            v23 = @"Set";
          }
          int v24 = [v9 count];
          *(_DWORD *)buf = 138413058;
          v38 = v23;
          __int16 v39 = 1024;
          int v40 = a3;
          __int16 v41 = 1024;
          int v42 = v24;
          __int16 v43 = 1024;
          int v44 = v17 - v18;
          os_log_t v21 = oslog;
          _os_log_impl(&dword_25934C000, v22, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] %@ availableFeatures (%d) to %d suggestions, %d unchanged", buf, 0x1Eu);
        }
      }
      else if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v20;
        _os_log_error_impl(&dword_25934C000, oslog, OS_LOG_TYPE_ERROR, "[PNSuggestionWallpaperUtilities] Error updating availableFeatures: %@", buf, 0xCu);
      }
    }
    else
    {
      char v19 = 1;
      os_log_t v21 = oslog;
    }
  }
  else
  {
    char v19 = 1;
  }

  return v19;
}

void __82__PNSuggestionWallpaperUtilities__updateAvailableFeatures_forSuggestions_toClear___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v8 = objc_msgSend(MEMORY[0x263F14F58], "changeRequestForSuggestion:", v7, (void)v15);
        int v9 = *(unsigned __int8 *)(a1 + 48);
        uint64_t v10 = [v7 availableFeatures];
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = v11 | v10;
        uint64_t v13 = v10 & ~v11;
        if (v9) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = v12;
        }
        [v8 setAvailableFeatures:v14];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

+ (BOOL)clearAvailableFeatures:(unint64_t)a3 forSuggestions:(id)a4
{
  return [a1 _updateAvailableFeatures:a3 forSuggestions:a4 toClear:1];
}

+ (BOOL)setAvailableFeatures:(unint64_t)a3 forSuggestions:(id)a4
{
  return [a1 _updateAvailableFeatures:a3 forSuggestions:a4 toClear:0];
}

+ (BOOL)_cacheExistsForAsset:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F14F70]) initWithPhotoAsset:v3];
  uint64_t v5 = [v4 segmentationResourceURL];

  if (!v5)
  {
    v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v3 uuid];
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_25934C000, v6, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] missing segmentationResourceURL for asset %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v5 != 0;
}

+ (unint64_t)_settlingEffectVideoDecisionForAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 photoAnalysisWallpaperProperties];
  uint64_t v5 = [v4 wallpaperPropertiesData];

  if (v5)
  {
    v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:0];
    id v7 = v6;
    if (v6)
    {
      v8 = [v6 objectForKeyedSubscript:@"segmentationScores"];
      if (v8)
      {
        int v9 = v8;
        uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5DFD8]];
        if ([v10 BOOLValue]) {
          unint64_t v11 = 1;
        }
        else {
          unint64_t v11 = 2;
        }

        goto LABEL_12;
      }
    }
  }
  uint64_t v12 = PLWallpaperGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [v3 uuid];
    int v15 = 138412290;
    long long v16 = v13;
    _os_log_impl(&dword_25934C000, v12, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] missing settlingEffectVideoDecision for asset %@", (uint8_t *)&v15, 0xCu);
  }
  unint64_t v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)_assetPassesFRCInstantPlayback:(id)a3
{
  id v4 = a3;
  if ([a1 _settlingEffectVideoDecisionForAsset:v4] == 1) {
    char v5 = [a1 _cacheExistsForAsset:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)settlingEffectAssetInternalSortDescriptors
{
  v11[7] = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"mediaAnalysisAttributes.activityScore" ascending:0];
  id v3 = objc_msgSend(MEMORY[0x263F08B30], "sortDescriptorWithKey:ascending:", @"mediaAnalysisAttributes.wallpaperScore", 0, v2);
  v11[1] = v3;
  id v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"mediaAnalysisAttributes.settlingEffectScore" ascending:0];
  v11[2] = v4;
  char v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"mediaAnalysisAttributes.autoplaySuggestionScore" ascending:0];
  v11[3] = v5;
  v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"favorite" ascending:0];
  v11[4] = v6;
  id v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"dateCreated" ascending:0];
  v11[5] = v7;
  v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"uuid" ascending:1];
  v11[6] = v8;
  int v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)_settlingEffectAssetFetchPropertySets
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F15028];
  v6[0] = *MEMORY[0x263F14FF0];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x263F15000];
  v6[2] = *MEMORY[0x263F14FD0];
  v6[3] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  return v4;
}

+ (id)_fetchSettlingEffectSuggestionKeyAssetsWithOptions:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PLWallpaperGetLog();
  char v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchSettlingEffectSuggestionKeyAssets", "", buf, 2u);
  }

  uint64_t v9 = mach_absolute_time();
  uint64_t v10 = [v4 photoLibrary];
  unint64_t v11 = [a1 fetchSettlingEffectSuggestionsInPhotoLibrary:v10];

  uint64_t v12 = [MEMORY[0x263F14D18] fetchKeyAssetForEachSuggestion:v11 options:v4];

  uint64_t v13 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  long long v16 = v8;
  uint64_t v17 = v16;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v17, OS_SIGNPOST_INTERVAL_END, v6, "FetchSettlingEffectSuggestionKeyAssets", "", buf, 2u);
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "FetchSettlingEffectSuggestionKeyAssets";
    __int16 v24 = 2048;
    double v25 = (float)((float)((float)((float)(v13 - v9) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v17, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  long long v18 = v17;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v19 = [v12 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v19;
    _os_log_impl(&dword_25934C000, v18, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Found %d settling effect suggestion assets", buf, 8u);
  }

  return v12;
}

+ (id)fetchLivePhotoTabHighlightCandidateAssetsWithOptions:(id)a3 excludeExistingWallpapers:(BOOL)a4 statistics:(id *)a5
{
  BOOL v5 = a4;
  v138[2] = *MEMORY[0x263EF8340];
  id v119 = a3;
  os_signpost_id_t v6 = PLWallpaperGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (v5) {
      id v7 = @", excluding existing wallpapers";
    }
    else {
      id v7 = &stru_270753580;
    }
    uint64_t v8 = [v119 fetchLimit];
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = -1;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2048;
    double v132 = *(double *)&v9;
    _os_log_impl(&dword_25934C000, v6, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Fetch LivePhoto tab highlight candidates%@. Limit: %lu", buf, 0x16u);
  }
  BOOL v126 = v5;
  uint64_t v10 = v6;
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = v10;
  uint64_t v13 = v12;
  unint64_t v111 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FetchLivePhotoTabHighlightAssets", "", buf, 2u);
  }
  os_signpost_id_t v104 = v11;
  os_log_t oslog = v13;

  uint64_t v106 = mach_absolute_time();
  v117 = [v119 photoLibrary];
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v15 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"highlightBeingExtendedAssets.kind", 0);
  [v14 addObject:v15];
  long long v16 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K >= %d", @"highlightBeingExtendedAssets.enrichmentState", 3);
  [v14 addObject:v16];
  uint64_t v17 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"highlightBeingExtendedAssets.visibilityState", 0);
  [v14 addObject:v17];

  v120 = [a1 settlingEffectLivePhotoPredicate];
  objc_msgSend(v14, "addObject:");
  uint64_t v18 = [MEMORY[0x263F5E108] latestVersion];
  int v19 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K >= %lu", @"additionalAttributes.sceneAnalysisVersion", v18);
  [v14 addObject:v19];
  id v20 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v20 setYear:2020];
  [v20 setMonth:9];
  [v20 setDay:16];
  os_log_t v21 = [MEMORY[0x263EFF8F0] currentCalendar];
  v22 = [v21 dateFromComponents:v20];

  v23 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K > %@", @"dateCreated", v22];
  [v14 addObject:v23];
  id v24 = objc_alloc(MEMORY[0x263F5E0C0]);
  double v25 = objc_msgSend(v24, "initWithMediaAnalysisVersion:", objc_msgSend(MEMORY[0x263F5E0C0], "latestVersion"));
  uint64_t v26 = [v25 settlingEffectScoreNode];
  [v26 operatingPoint];
  float v28 = v27;

  v29 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K > %f", @"mediaAnalysisAttributes.settlingEffectScore", v28);
  id v30 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(%K == %f) AND (%K > %f)", @"mediaAnalysisAttributes.settlingEffectScore", 0xBFF0000000000000, @"mediaAnalysisAttributes.autoplaySuggestionScore", 0x3FE0000000000000);
  unint64_t v31 = (void *)MEMORY[0x263F08730];
  v138[0] = v29;
  v138[1] = v30;
  BOOL v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v138 count:2];
  long long v33 = [v31 orPredicateWithSubpredicates:v32];

  v118 = v14;
  [v14 addObject:v33];

  if (v126)
  {
    long long v34 = [MEMORY[0x263F08A98] predicateWithFormat:@"SUBQUERY(%K, $suggestion, $suggestion.%K = %d).@count == 0", @"suggestionsBeingKeyAssets", @"type", 6];
    [v14 addObject:v34];
  }
  v127 = [MEMORY[0x263EFFA08] set];
  long long v35 = (void *)MEMORY[0x25A2E0AC0]();
  long long v36 = v117;
  v37 = [a1 _mePersonUUIDInPhotoLibrary:v117];
  unint64_t v38 = 0x263F14000;
  if (v37)
  {
    v121 = v35;
    __int16 v39 = oslog;
    os_signpost_id_t v40 = os_signpost_id_generate(v39);
    mach_timebase_info v129 = 0;
    mach_timebase_info(&v129);
    __int16 v41 = v39;
    int v42 = v41;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25934C000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "FetchMEHighlightAssets", "", buf, 2u);
    }

    uint64_t v115 = mach_absolute_time();
    __int16 v43 = [MEMORY[0x263F14E88] localIdentifierWithUUID:v37];
    int v44 = (void *)MEMORY[0x263F14E88];
    v137 = v43;
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v137 count:1];
    uint64_t v46 = [v117 librarySpecificFetchOptions];
    v47 = [v44 fetchPersonsWithLocalIdentifiers:v45 options:v46];
    v48 = [v47 firstObject];

    if (v48)
    {
      v49 = [v117 librarySpecificFetchOptions];
      uint64_t v136 = *MEMORY[0x263F14FE0];
      v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v136 count:1];
      [v49 setFetchPropertySets:v50];

      v51 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v118];
      [v49 setInternalPredicate:v51];

      v52 = [MEMORY[0x263F14D18] fetchAssetsForPerson:v48 faceCount:1 options:v49];
      uint64_t v53 = [v52 fetchedObjectIDsSet];

      v127 = (void *)v53;
    }
    else if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25934C000, v42, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] ME Person not found", buf, 2u);
    }
    os_log_t v54 = oslog;
    uint64_t v55 = mach_absolute_time();
    uint32_t numer = v129.numer;
    uint32_t denom = v129.denom;
    v58 = v42;
    v59 = v58;
    if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25934C000, v59, OS_SIGNPOST_INTERVAL_END, v40, "FetchMEHighlightAssets", "", buf, 2u);
    }

    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "FetchMEHighlightAssets";
      *(_WORD *)&buf[12] = 2048;
      double v132 = (float)((float)((float)((float)(v55 - v115) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_25934C000, v59, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    long long v36 = v117;
    unint64_t v38 = 0x263F14000uLL;
    long long v35 = v121;
  }
  else
  {
    os_log_t v54 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25934C000, oslog, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] ME not found", buf, 2u);
    }
  }

  id v122 = objc_alloc_init(MEMORY[0x263EFF980]);
  context = (void *)MEMORY[0x25A2E0AC0]();
  v60 = [v36 librarySpecificFetchOptions];
  objc_msgSend(v60, "setFetchLimit:", objc_msgSend(v119, "fetchLimit"));
  v61 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v118];
  [v60 setInternalPredicate:v61];

  v62 = [a1 _settlingEffectAssetFetchPropertySets];
  [v60 setFetchPropertySets:v62];

  v63 = [v119 sortDescriptors];
  [v60 setSortDescriptors:v63];

  v64 = [v119 internalSortDescriptors];
  [v60 setInternalSortDescriptors:v64];

  [v60 setCacheSizeForFetch:500];
  [v60 setChunkSizeForFetch:500];
  v109 = v60;
  v65 = [*(id *)(v38 + 3352) fetchAssetsWithOptions:v60];
  int v107 = [v65 count];
  v66 = v54;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    int v67 = [v65 count];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v67;
    _os_log_impl(&dword_25934C000, v66, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Found %d highlight extended live photo candidates", buf, 8u);
  }

  v68 = v66;
  os_signpost_id_t v69 = os_signpost_id_generate(v68);
  mach_timebase_info v129 = 0;
  mach_timebase_info(&v129);
  v70 = v68;
  v71 = v70;
  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v71, OS_SIGNPOST_INTERVAL_BEGIN, v69, "FilterAssetFailedFRC", "", buf, 2u);
  }

  uint64_t v105 = mach_absolute_time();
  v108 = v71;
  if ([v65 count])
  {
    unint64_t v72 = 0;
    int v73 = 0;
    int osloga = 0;
    int v113 = 0;
    int spid = 0;
    int v116 = 0;
    int v74 = 0;
    do
    {
      v75 = (void *)MEMORY[0x25A2E0AC0]();
      v76 = [v65 objectAtIndexedSubscript:v72];
      v77 = [v76 objectID];
      int v78 = [v127 containsObject:v77];

      if (v78)
      {
        ++v74;
      }
      else
      {
        char v128 = 0;
        *(void *)buf = 0;
        v79 = [v76 mediaAnalysisProperties];
        if ([v79 faceCount]) {
          uint64_t v80 = 1;
        }
        else {
          uint64_t v80 = 5;
        }

        +[PNSuggestionWallpaperUtilities bestWallpaperCropForAsset:v76 classification:v80 outputCropScore:buf outputLayoutAcceptable:&v128];
        if (v128 && *(double *)buf >= 0.4)
        {
          if (+[PNAssetCurationUtilities assetIsSafeForWidgetDisplay:](PNAssetCurationUtilities, "assetIsSafeForWidgetDisplay:", v76, *(double *)buf))
          {
            uint64_t v81 = [a1 _settlingEffectVideoDecisionForAsset:v76];
            if (v81 == 2)
            {
              ++v116;
            }
            else
            {
              if (v81 == 1)
              {
                ++spid;
              }
              else if (!v81)
              {
                ++v113;
              }
              v82 = [v76 objectID];
              [v122 addObject:v82];
            }
          }
          else
          {
            ++osloga;
          }
        }
        else
        {
          ++v73;
        }
      }

      ++v72;
    }
    while (v72 < [v65 count]);
  }
  else
  {
    int v74 = 0;
    int v116 = 0;
    int v113 = 0;
    int spid = 0;
    int osloga = 0;
    int v73 = 0;
  }
  uint64_t v83 = mach_absolute_time();
  uint32_t v85 = v129.numer;
  uint32_t v84 = v129.denom;
  v86 = v108;
  v87 = v86;
  if (v69 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v86))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v87, OS_SIGNPOST_INTERVAL_END, v69, "FilterAssetFailedFRC", "", buf, 2u);
  }

  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "FilterAssetFailedFRC";
    *(_WORD *)&buf[12] = 2048;
    double v132 = (float)((float)((float)((float)(v83 - v105) * (float)v85) / (float)v84) / 1000000.0);
    _os_log_impl(&dword_25934C000, v87, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  int v88 = [v122 count];
  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)&uint8_t buf[4] = v73;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = osloga;
    LOWORD(v132) = 1024;
    *(_DWORD *)((char *)&v132 + 2) = v116;
    HIWORD(v132) = 1024;
    int v133 = v74;
    __int16 v134 = 1024;
    int v135 = v88;
    _os_log_impl(&dword_25934C000, v87, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Filtered out %d candidates for cropping, %d candidates for NSFW, %d candidates for known FRC failure, %d candidates of device owner, %d candidates left", buf, 0x20u);
  }
  id v89 = objc_alloc(MEMORY[0x263F14E58]);
  v90 = [v119 photoLibrary];
  uint64_t v91 = *MEMORY[0x263F15090];
  v92 = (void *)MEMORY[0x263EFFA08];
  v93 = [v119 fetchPropertySets];
  v94 = [v92 setWithArray:v93];
  v95 = (void *)[v89 initWithOids:v122 photoLibrary:v90 fetchType:v91 fetchPropertySets:v94 identifier:0 registerIfNeeded:0];

  v96 = v87;
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    int v97 = [v95 count];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&uint8_t buf[4] = v97;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = spid;
    LOWORD(v132) = 1024;
    *(_DWORD *)((char *)&v132 + 2) = v113;
    _os_log_impl(&dword_25934C000, v96, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Found %d (passed: %d, unanalyzed: %d) highlight live photo candidates not failing FRC and other checks", buf, 0x14u);
  }

  if (a5)
  {
    a5->var0 = v107;
    a5->var1 = v88;
    a5->var2 = v73;
    a5->var3 = osloga;
    a5->var4 = v116;
    a5->var5 = v74;
  }
  uint64_t v98 = mach_absolute_time();
  uint32_t v100 = info.numer;
  uint32_t v99 = info.denom;
  v101 = v96;
  v102 = v101;
  if (v111 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v102, OS_SIGNPOST_INTERVAL_END, v104, "FetchLivePhotoTabHighlightAssets", "", buf, 2u);
  }

  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "FetchLivePhotoTabHighlightAssets";
    *(_WORD *)&buf[12] = 2048;
    double v132 = (float)((float)((float)((float)(v98 - v106) * (float)v100) / (float)v99) / 1000000.0);
    _os_log_impl(&dword_25934C000, v102, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v95;
}

+ (id)fetchLivePhotoTabHighlightSettlingEffectAssetsWithOptions:(id)a3 excludeExistingWallpapers:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = PLWallpaperGetLog();
  uint64_t v8 = [v6 fetchLimit];
  if (v8) {
    double v9 = *(double *)&v8;
  }
  else {
    double v9 = NAN;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = &stru_270753580;
    if (v4) {
      uint64_t v10 = @", excluding existing wallpapers";
    }
    *(_DWORD *)buf = 138412546;
    os_signpost_id_t v69 = (const char *)v10;
    __int16 v70 = 2048;
    double v71 = v9;
    _os_log_impl(&dword_25934C000, v7, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Fetch LivePhoto tab highlight SettlingEffect assets%@. Limit: %lu", buf, 0x16u);
  }
  os_signpost_id_t v11 = v7;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v13 = v11;
  id v14 = v13;
  unint64_t v59 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FetchLivePhotoTabHighlightSettlingEffectAssets", "", buf, 2u);
  }
  os_signpost_id_t v54 = v12;

  uint64_t v56 = mach_absolute_time();
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  context = (void *)MEMORY[0x25A2E0AC0]();
  long long v16 = [v6 photoLibrary];
  uint64_t v17 = [v16 librarySpecificFetchOptions];

  uint64_t v18 = [a1 _settlingEffectAssetFetchPropertySets];
  [v17 setFetchPropertySets:v18];

  v60 = v6;
  int v19 = [v6 internalSortDescriptors];
  [v17 setInternalSortDescriptors:v19];

  v57 = v17;
  id v20 = [a1 fetchLivePhotoTabHighlightCandidateAssetsWithOptions:v17 excludeExistingWallpapers:v4 statistics:0];
  os_log_t v21 = v14;
  os_signpost_id_t v22 = os_signpost_id_generate(v21);
  mach_timebase_info v65 = 0;
  mach_timebase_info(&v65);
  v23 = v21;
  id v24 = v23;
  unint64_t v25 = v22 - 1;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "CheckFRCResources", "", buf, 2u);
  }
  os_signpost_id_t spid = v22;

  uint64_t v55 = mach_absolute_time();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v26 = v20;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v62;
LABEL_16:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v62 != v29) {
        objc_enumerationMutation(v26);
      }
      unint64_t v31 = *(void **)(*((void *)&v61 + 1) + 8 * v30);
      if (objc_msgSend(a1, "_settlingEffectVideoDecisionForAsset:", v31, spid, v54) == 1)
      {
        BOOL v32 = [v31 objectID];
        [v15 addObject:v32];
      }
      if ((unint64_t)[v15 count] >= *(void *)&v9) {
        break;
      }
      if (v28 == ++v30)
      {
        uint64_t v28 = [v26 countByEnumeratingWithState:&v61 objects:v67 count:16];
        if (v28) {
          goto LABEL_16;
        }
        break;
      }
    }
  }

  uint64_t v33 = mach_absolute_time();
  uint32_t numer = v65.numer;
  uint32_t denom = v65.denom;
  long long v36 = v24;
  v37 = v36;
  if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v37, OS_SIGNPOST_INTERVAL_END, spid, "CheckFRCResources", "", buf, 2u);
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    os_signpost_id_t v69 = "CheckFRCResources";
    __int16 v70 = 2048;
    double v71 = (float)((float)((float)((float)(v33 - v55) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  id v38 = objc_alloc(MEMORY[0x263F14E58]);
  __int16 v39 = [v60 photoLibrary];
  uint64_t v40 = *MEMORY[0x263F15090];
  __int16 v41 = (void *)MEMORY[0x263EFFA08];
  int v42 = [v60 fetchPropertySets];
  __int16 v43 = [v41 setWithArray:v42];
  int v44 = (void *)[v38 initWithOids:v15 photoLibrary:v39 fetchType:v40 fetchPropertySets:v43 identifier:0 registerIfNeeded:0];

  v45 = v37;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    int v46 = [v44 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v69) = v46;
    _os_log_impl(&dword_25934C000, v45, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Found %d settling effect assets", buf, 8u);
  }

  uint64_t v47 = mach_absolute_time();
  uint32_t v49 = info.numer;
  uint32_t v48 = info.denom;
  v50 = v45;
  v51 = v50;
  if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v51, OS_SIGNPOST_INTERVAL_END, v54, "FetchLivePhotoTabHighlightSettlingEffectAssets", "", buf, 2u);
  }

  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    os_signpost_id_t v69 = "FetchLivePhotoTabHighlightSettlingEffectAssets";
    __int16 v70 = 2048;
    double v71 = (float)((float)((float)((float)(v47 - v56) * (float)v49) / (float)v48) / 1000000.0);
    _os_log_impl(&dword_25934C000, v51, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v44;
}

+ (id)fetchLivePhotoTabAssetsWithOptions:(id)a3
{
  v49[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = PLWallpaperGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25934C000, v5, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Fetch LivePhoto tab assets", buf, 2u);
  }
  id v6 = v5;
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v8 = v6;
  double v9 = v8;
  unint64_t v42 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchLivePhotoTabAssets", "", buf, 2u);
  }
  os_signpost_id_t spid = v7;

  uint64_t v41 = mach_absolute_time();
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  os_signpost_id_t v11 = (void *)MEMORY[0x25A2E0AC0]();
  os_signpost_id_t v12 = [v4 photoLibrary];
  uint64_t v13 = [v12 librarySpecificFetchOptions];

  v49[0] = *MEMORY[0x263F14FE0];
  uint64_t v14 = v49[0];
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
  [v13 setFetchPropertySets:v15];

  long long v16 = [a1 _fetchSettlingEffectSuggestionKeyAssetsWithOptions:v13];
  uint64_t v17 = [v16 fetchedObjectIDsSet];
  [v10 unionSet:v17];

  uint64_t v18 = (void *)MEMORY[0x25A2E0AC0]();
  int v19 = [v4 photoLibrary];
  id v20 = [v19 librarySpecificFetchOptions];

  objc_msgSend(v20, "setFetchLimit:", objc_msgSend(v4, "fetchLimit"));
  os_log_t v21 = [a1 settlingEffectAssetInternalSortDescriptors];
  [v20 setInternalSortDescriptors:v21];

  uint64_t v48 = v14;
  os_signpost_id_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
  [v20 setFetchPropertySets:v22];

  v23 = [a1 fetchLivePhotoTabHighlightSettlingEffectAssetsWithOptions:v20 excludeExistingWallpapers:1];
  id v24 = [v23 fetchedObjectIDsSet];
  [v10 unionSet:v24];

  unint64_t v25 = [v4 photoLibrary];
  id v26 = [v25 librarySpecificFetchOptions];

  uint64_t v27 = [a1 settlingEffectAssetInternalSortDescriptors];
  [v26 setInternalSortDescriptors:v27];

  uint64_t v28 = [v4 fetchPropertySets];
  [v26 setFetchPropertySets:v28];

  objc_msgSend(v26, "setFetchLimit:", objc_msgSend(v4, "fetchLimit"));
  uint64_t v29 = (void *)MEMORY[0x263F14D18];
  uint64_t v30 = [v10 allObjects];
  unint64_t v31 = [v29 fetchAssetsWithObjectIDs:v30 options:v26];

  BOOL v32 = v9;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    int v33 = objc_msgSend(v31, "count", spid);
    *(_DWORD *)buf = 67109120;
    LODWORD(v45) = v33;
    _os_log_impl(&dword_25934C000, v32, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] Found %d combined assets", buf, 8u);
  }

  uint64_t v34 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v37 = v32;
  id v38 = v37;
  if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v38, OS_SIGNPOST_INTERVAL_END, spid, "FetchLivePhotoTabAssets", "", buf, 2u);
  }

  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "FetchLivePhotoTabAssets";
    __int16 v46 = 2048;
    double v47 = (float)((float)((float)((float)(v34 - v41) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v31;
}

+ (id)_filterSuggestions:(id)a3 withSingleFeature:(unint64_t)a4 included:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)a4);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] != 1)
  {
    unint64_t v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PNSuggestionWallpaperUtilities.m", 1039, @"Invalid parameter not satisfying: %@", @"__builtin_popcountll(singleFeature) == 1" object file lineNumber description];
  }
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (((((a4 & ~[v17 availableFeatures]) == 0) ^ v5) & 1) == 0)
        {
          uint64_t v18 = [v17 objectID];
          [v11 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  id v19 = objc_alloc(MEMORY[0x263F14E58]);
  id v20 = [v12 photoLibrary];
  uint64_t v21 = *MEMORY[0x263F150A0];
  os_signpost_id_t v22 = [v12 fetchPropertySets];
  v23 = (void *)[v19 initWithOids:v11 photoLibrary:v20 fetchType:v21 fetchPropertySets:v22 identifier:0 registerIfNeeded:0];

  return v23;
}

+ (id)filterSuggestions:(id)a3 excludingSingleFeature:(unint64_t)a4
{
  return (id)[a1 _filterSuggestions:a3 withSingleFeature:a4 included:0];
}

+ (id)filterSuggestions:(id)a3 includingSingleFeature:(unint64_t)a4
{
  return (id)[a1 _filterSuggestions:a3 withSingleFeature:a4 included:1];
}

+ (id)fetchSettlingEffectSuggestionsWithOptions:(id)a3
{
  id v4 = [MEMORY[0x263F14F50] fetchSuggestionsWithOptions:a3];
  BOOL v5 = [a1 filterSuggestions:v4 includingSingleFeature:1];

  return v5;
}

+ (id)fetchSettlingEffectSuggestionsInPhotoLibrary:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = [a3 librarySpecificFetchOptions];
  BOOL v5 = (void *)MEMORY[0x263F08730];
  id v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v12[0] = v6;
  os_signpost_id_t v7 = [MEMORY[0x263F14F50] predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper];
  v12[1] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v9 = [v5 andPredicateWithSubpredicates:v8];
  [v4 setPredicate:v9];

  uint8x8_t v10 = [a1 fetchSettlingEffectSuggestionsWithOptions:v4];

  return v10;
}

+ (id)settlingEffectLivePhotoPredicate
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"kindSubtype", 2);
}

+ (BOOL)assetIsEligibleForSettlingEffect:(id)a3
{
  return [a3 isPhotoIris];
}

+ (id)wallpaperCroppingDebugKeyValuePairsForAsset:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 wallpaperCroppingDebugKeyValuePairs];
  os_signpost_id_t v7 = (void *)[v5 initWithDictionary:v6];

  uint64_t v8 = [[PNWallpaperCropResult alloc] initWithAsset:v4 classification:0];
  id v9 = [(PNWallpaperCropResult *)v8 dictionaryRepresentation];
  [v7 setObject:v9 forKeyedSubscript:@"posterClassificationUnspecified"];

  uint8x8_t v10 = [[PNWallpaperCropResult alloc] initWithAsset:v4 classification:1];
  id v11 = [(PNWallpaperCropResult *)v10 dictionaryRepresentation];
  [v7 setObject:v11 forKeyedSubscript:@"posterClassificationPerson"];

  id v12 = [[PNWallpaperCropResult alloc] initWithAsset:v4 classification:2];
  uint64_t v13 = [(PNWallpaperCropResult *)v12 dictionaryRepresentation];
  [v7 setObject:v13 forKeyedSubscript:@"posterClassificationPet"];

  uint64_t v14 = [[PNWallpaperCropResult alloc] initWithAsset:v4 classification:3];
  uint64_t v15 = [(PNWallpaperCropResult *)v14 dictionaryRepresentation];
  [v7 setObject:v15 forKeyedSubscript:@"posterClassificationNature"];

  long long v16 = [[PNWallpaperCropResult alloc] initWithAsset:v4 classification:4];
  uint64_t v17 = [(PNWallpaperCropResult *)v16 dictionaryRepresentation];
  [v7 setObject:v17 forKeyedSubscript:@"posterClassificationCityscape"];

  uint64_t v18 = [[PNWallpaperCropResult alloc] initWithAsset:v4 classification:5];
  id v19 = [(PNWallpaperCropResult *)v18 dictionaryRepresentation];
  [v7 setObject:v19 forKeyedSubscript:@"posterClassificationOther"];

  return v7;
}

+ (unint64_t)mediaAnalysisTypeForPosterClassification:(unint64_t)a3
{
  return (unint64_t)(a3 == 2) << 17;
}

+ (id)fetchKnownPersonLocalIdentifiersInPhotoLibrary:(id)a3 fetchLimit:(unint64_t)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v5 = [a3 librarySpecificFetchOptions];
  v10[0] = *MEMORY[0x263F15100];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v5 setFetchPropertySets:v6];

  if (a4)
  {
    [v5 setFetchLimit:a4];
    [v5 setShouldPrefetchCount:1];
  }
  os_signpost_id_t v7 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K > %d OR %K >= %f OR %K >= %d", @"verifiedType", 0, @"mergeCandidateConfidence", 0x3FE999999999999ALL, @"faceCount", 10);
  [v5 setInternalPredicate:v7];

  uint64_t v8 = [MEMORY[0x263F14E88] fetchPersonsWithOptions:v5];

  return v8;
}

+ (BOOL)hasAnyKnownPersonLocalIdentifierInPhotoLibrary:(id)a3
{
  uint64_t v3 = [a1 fetchKnownPersonLocalIdentifiersInPhotoLibrary:a3 fetchLimit:1];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (unint64_t)posterClassificationForSuggestionMedia:(id)a3
{
  int v3 = [a3 suggestionSubtype];
  unint64_t result = 1;
  if (!(!v6 & v5))
  {
    switch(v3)
    {
      case 602:
        return result;
      case 603:
        goto LABEL_5;
      case 604:
        goto LABEL_6;
      case 605:
        goto LABEL_7;
      default:
        JUMPOUT(0);
    }
  }
  switch(v3)
  {
    case 652:
      return result;
    case 653:
LABEL_5:
      unint64_t result = 2;
      break;
    case 654:
LABEL_6:
      unint64_t result = 3;
      break;
    case 655:
LABEL_7:
      unint64_t result = 4;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

+ (unint64_t)posterClassificationForMedia:(id)a3 descriptorType:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = 0;
  if (a4 <= 100)
  {
    if ((unint64_t)(a4 - 1) >= 2)
    {
      if (a4 != 4) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if ((unint64_t)(a4 - 101) < 2)
  {
LABEL_6:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v7 = [a1 posterClassificationForSuggestionMedia:v6];
    }
    else {
      unint64_t v7 = 0;
    }
    goto LABEL_11;
  }
  if (a4 == 103) {
LABEL_10:
  }
    unint64_t v7 = 1;
LABEL_11:

  return v7;
}

+ (id)knownPersonLocalIdentifiersInPhotoLibrary:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = [a1 fetchKnownPersonLocalIdentifiersInPhotoLibrary:a3 fetchLimit:0];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
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
        uint8x8_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "localIdentifier", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PFDeviceScreenSize();
  double v7 = v5;
  double v8 = v6;
  if (v5 == 0.0
    || v6 == 0.0
    || (v5 == *MEMORY[0x263F5D550] ? (BOOL v9 = v6 == *(double *)(MEMORY[0x263F5D550] + 8)) : (BOOL v9 = 0), v9))
  {
    double v10 = 1.0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      int v13 = 134218496;
      double v14 = v7;
      __int16 v15 = 2048;
      double v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    double v10 = fabs(v5 / v6);
  }
  id v11 = [a1 predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:v4 deviceAspectRatio:v10];

  return v11;
}

+ (id)predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:(id)a3 deviceAspectRatio:(double)a4
{
  double v6 = (objc_class *)MEMORY[0x263EFF980];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  long long v26 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K.@count == %d", @"detectedFaces", 1);
  [v8 addObject:v26];
  unint64_t v25 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"kind", 0);
  [v8 addObject:v25];
  id v24 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"kindSubtype", 10);
  [v8 addObject:v24];
  v23 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"kindSubtype", 1);
  [v8 addObject:v23];
  BOOL v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (%K IN %@)", @"playbackStyle", &unk_27076A5C8];
  [v8 addObject:v9];
  double v10 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K >= %f", @"curationScore", 0x3FE0000000000000);
  [v8 addObject:v10];
  id v11 = [(id)objc_opt_class() _blockedImportedByBundleIdentifiers];
  long long v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == nil OR NOT (%K IN %@)", @"additionalAttributes.importedByBundleIdentifier", @"additionalAttributes.importedByBundleIdentifier", v11];
  [v8 addObject:v12];
  int v13 = (void *)MEMORY[0x263F087F0];
  double v14 = [MEMORY[0x263F087F0] expressionForKeyPath:@"detectedFaces"];
  __int16 v15 = [a1 _facePredicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:v7 deviceAspectRatio:a4];

  double v16 = [v13 expressionForSubquery:v14 usingIteratorVariable:@"face" predicate:v15];

  __int16 v17 = (void *)MEMORY[0x263F08720];
  uint64_t v18 = [MEMORY[0x263F087F0] expressionWithFormat:@"%@.@count", v16];
  uint64_t v19 = [MEMORY[0x263F087F0] expressionForConstantValue:&unk_27076A428];
  id v20 = [v17 predicateWithLeftExpression:v18 rightExpression:v19 modifier:0 type:5 options:0];

  [v8 addObject:v20];
  uint64_t v21 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v8];

  return v21;
}

+ (id)_facePredicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:(id)a3 deviceAspectRatio:(double)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = [MEMORY[0x263F14E88] uuidFromLocalIdentifier:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v10);
    }

    double v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"$face.%K.%K in %@", @"personForFace", @"personUUID", v7];
    [v6 addObject:v14];
  }
  [MEMORY[0x263F5DF40] facePositionLimits];
  double v15 = 0.0 * a4;
  long long v36 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K >= %K AND $face.%K >= %f AND $face.%K < %f", @"height", @"width", @"size", 0, @"size", *(void *)&v15);
  long long v35 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K < %K AND $face.%K >= (%f * %d / %d) AND $face.%K < (%f * %d / %d)", @"height", @"width", @"size", 0, @"width", @"height", @"size", *(void *)&v15, @"width", @"height");
  double v16 = (void *)MEMORY[0x263F08730];
  v42[0] = v36;
  v42[1] = v35;
  __int16 v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
  uint64_t v34 = [v16 orPredicateWithSubpredicates:v17];

  [v6 addObject:v34];
  int v33 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"($face.%K - $face.%K * 0.5) >= %f AND ($face.%K + $face.%K * 0.5) <= %f", @"centerX", @"size", 0, @"centerX", @"size", 0);
  BOOL v32 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"($face.%K - $face.%K * 0.5) >= (%f * %d / %d) AND ($face.%K + $face.%K * 0.5) <= (%f * %d / %d)", @"centerX", @"size", @"width", @"height", 0, @"centerX", @"size", @"width", @"height", 0);
  uint64_t v18 = (void *)MEMORY[0x263F08730];
  v41[0] = v33;
  v41[1] = v32;
  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  uint64_t v31 = [v18 orPredicateWithSubpredicates:v19];

  [v6 addObject:v31];
  id v20 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"($face.%K + $face.%K * 0.5) >= %f AND ($face.%K + $face.%K * 0.5) <= %f", @"bodyCenterY", @"bodyHeight", 0, @"bodyCenterY", @"bodyHeight", 0);
  [v6 addObject:v20];
  objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"$face.%K >= %f AND $face.%K <= %f", @"roll", 0xBFE921FB54442D18, @"roll", 0x3FE921FB54442D18);
  uint64_t v21 = v30 = v5;
  [v6 addObject:v21];
  os_signpost_id_t v22 = [MEMORY[0x263F08A98] predicateWithFormat:@"$face.%K IN %@", @"poseType", &unk_27076A5B0];
  [v6 addObject:v22];
  v23 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"$face.%K >= %f", @"quality", 0x3FD0000000000000);
  [v6 addObject:v23];
  id v24 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"$face.%K >= %f", @"blurScore", 0x3FC999999999999ALL);
  [v6 addObject:v24];
  unint64_t v25 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"$face.%K != %d AND $face.%K != %d", @"faceExpressionType", 3, @"faceExpressionType", 2);
  [v6 addObject:v25];
  long long v26 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"$face.%K == %d", @"eyesState", 2);
  [v6 addObject:v26];
  long long v27 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"$face.%K == %d", @"hasFaceMask", 0);
  [v6 addObject:v27];
  long long v28 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v6];

  return v28;
}

+ (double)cropScoreWithAsset:(id)a3 classification:(unint64_t)a4 passesClockOverlap:(BOOL *)a5 cropZoomRatio:(double *)a6 orientation:(int64_t)a7
{
  id v12 = a3;
  int v13 = [MEMORY[0x263F5DF38] deviceConfigurationForOrientation:a7];
  double v24 = 0.0;
  [a1 bestWallpaperCropForAsset:v12 classification:a4 outputCropScore:&v24 outputLayoutAcceptable:a5 layoutConfiguration:v13];
  if (a6)
  {
    double v15 = v14;
    [v13 screenSize];
    double v17 = v16;
    double v18 = v15 * (double)(unint64_t)[v12 pixelWidth];
    double v19 = v17 / v18;
    BOOL v20 = v18 <= 0.0;
    double v21 = 1.0;
    if (!v20) {
      double v21 = v19;
    }
    *a6 = v21;
  }
  double v22 = v24;

  return v22;
}

+ (CGRect)bestWallpaperCropForSuggestion:(id)a3 outputCropScore:(double *)a4 outputLayoutAcceptable:(BOOL *)a5
{
  id v7 = a3;
  id v8 = [v7 photoLibrary];
  uint64_t v9 = [v8 librarySpecificFetchOptions];

  [v9 setFetchLimit:1];
  uint64_t v10 = [MEMORY[0x263F14D18] fetchKeyAssetsInAssetCollection:v7 options:v9];
  uint64_t v11 = [v10 firstObject];

  if (v11)
  {
    +[PNSuggestionWallpaperUtilities bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:](PNSuggestionWallpaperUtilities, "bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:", v11, +[PNSuggestionWallpaperUtilities posterClassificationForSuggestionSubtype:](PNSuggestionWallpaperUtilities, "posterClassificationForSuggestionSubtype:", [v7 subtype]), a4, a5);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    if (a4) {
      *a4 = 0.0;
    }
    if (a5) {
      *a5 = 0;
    }
    double v13 = *MEMORY[0x263F001A0];
    double v15 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v17 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v19 = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (CGRect)bestWallpaperCropForAsset:(id)a3 classification:(unint64_t)a4 outputCropScore:(double *)a5 outputLayoutAcceptable:(BOOL *)a6
{
  [a1 bestWallpaperCropForAsset:a3 classification:a4 outputCropScore:a5 outputLayoutAcceptable:a6 layoutConfiguration:0];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)bestWallpaperCropForAsset:(id)a3 classification:(unint64_t)a4 outputCropScore:(double *)a5 outputLayoutAcceptable:(BOOL *)a6 layoutConfiguration:(id)a7
{
  id v11 = a7;
  id v12 = a3;
  [v12 normalizedFaceAreaRect];
  uint64_t v50 = v14;
  uint64_t v51 = v13;
  uint64_t v48 = v16;
  uint64_t v49 = v15;
  uint64_t v52 = 0;
  if (!v11)
  {
    id v11 = [MEMORY[0x263F5DF38] deviceConfigurationForOrientation:1];
  }
  double v17 = (void *)MEMORY[0x263F5DF00];
  uint64_t v18 = [v12 pixelWidth];
  uint64_t v19 = [v12 pixelHeight];
  [v12 preferredCropRect];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  [v12 acceptableCropRect];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  objc_msgSend(v17, "bestCropRectV2ForPosterClassification:layoutConfiguration:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:outputLayoutScore:outputClockOverlapAcceptable:", a4, v11, v18, v19, a5, &v52, v21, v23, v25, v27, v29, v31, v33, v35, v51,
    v50,
    v49,
    v48,
    a6);
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;

  double v44 = v37;
  double v45 = v39;
  double v46 = v41;
  double v47 = v43;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

+ (unint64_t)posterClassificationForSuggestionSubtype:(unsigned __int16)a3
{
  unint64_t result = 1;
  if (!(!v4 & v3))
  {
    switch(a3)
    {
      case 0x25Au:
        return result;
      case 0x25Bu:
        goto LABEL_5;
      case 0x25Cu:
        goto LABEL_6;
      case 0x25Du:
        goto LABEL_7;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 0x28Cu:
      return result;
    case 0x28Du:
LABEL_5:
      unint64_t result = 2;
      break;
    case 0x28Eu:
LABEL_6:
      unint64_t result = 3;
      break;
    case 0x28Fu:
LABEL_7:
      unint64_t result = 4;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

+ (int64_t)primaryOrientation
{
  if (PLPhysicalDeviceIsIPad()) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (void)rejectWallpaperSuggestions:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    double v7 = [v5 firstObject];
    double v8 = [v7 photoLibrary];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __79__PNSuggestionWallpaperUtilities_rejectWallpaperSuggestions_completionHandler___block_invoke;
    void v12[3] = &unk_26544F1A0;
    id v13 = v5;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __79__PNSuggestionWallpaperUtilities_rejectWallpaperSuggestions_completionHandler___block_invoke_2;
    v9[3] = &unk_26544F018;
    id v11 = v6;
    id v10 = v13;
    [v8 performChanges:v12 completionHandler:v9];
  }
}

void __79__PNSuggestionWallpaperUtilities_rejectWallpaperSuggestions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = objc_msgSend(MEMORY[0x263F14F58], "changeRequestForSuggestion:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 markDeclined];
        [v6 setFeaturedState:0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __79__PNSuggestionWallpaperUtilities_rejectWallpaperSuggestions_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_25934C000, v6, OS_LOG_TYPE_ERROR, "Could not decline wallpaper suggestion: %@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = PLWallpaperGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [v12 uuid];
          *(_DWORD *)buf = 138412290;
          id v21 = v14;
          _os_log_impl(&dword_25934C000, v13, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] reject wallpaper suggestion: %@", buf, 0xCu);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

+ (void)rejectWallpaperSuggestionsUsingAsset:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLWallpaperGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [v6 uuid];
    *(_DWORD *)buf = 138412290;
    long long v16 = v9;
    _os_log_impl(&dword_25934C000, v8, OS_LOG_TYPE_INFO, "[PNSuggestionWallpaperUtilities] reject wallpaper asset: %@", buf, 0xCu);
  }
  uint64_t v10 = [v6 photoLibrary];
  id v11 = [v10 librarySpecificFetchOptions];

  uint64_t v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"type", 6);
  [v11 setPredicate:v12];

  id v13 = [MEMORY[0x263F14D28] fetchAssetCollectionsContainingAsset:v6 withType:8 options:v11];
  uint64_t v14 = [v13 fetchedObjects];
  [a1 rejectWallpaperSuggestions:v14 completionHandler:v7];
}

+ (void)rejectWallpaperSuggestionsUsingAssetOfSuggestion:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 photoLibrary];
  id v11 = [v8 librarySpecificFetchOptions];

  [v11 setFetchLimit:1];
  uint64_t v9 = [MEMORY[0x263F14D18] fetchKeyAssetsInAssetCollection:v7 options:v11];

  uint64_t v10 = [v9 firstObject];

  [a1 rejectWallpaperSuggestionsUsingAsset:v10 completionHandler:v6];
}

+ (id)wallpaperPeopleLocalIdentifiersInPhotoLibrary:(id)a3 vipOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v39[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x3032000000;
  double v29 = __Block_byref_object_copy__1352;
  double v30 = __Block_byref_object_dispose__1353;
  id v31 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v7 = [v5 photoAnalysisClient];
  double v38 = @"VipOnly";
  uint64_t v8 = [NSNumber numberWithBool:v4];
  v39[0] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __88__PNSuggestionWallpaperUtilities_wallpaperPeopleLocalIdentifiersInPhotoLibrary_vipOnly___block_invoke;
  double v23 = &unk_26544EFF0;
  double v25 = &v26;
  uint64_t v10 = v6;
  double v24 = v10;
  [v7 requestPeopleForWallpaperSuggestionsWithOptions:v9 reply:&v20];

  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v10, v11))
  {
    uint64_t v12 = PLWallpaperGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25934C000, v12, OS_LOG_TYPE_ERROR, "[PNSuggestionWallpaperUtilities] Timeout getting wallpaper people local identifiers", buf, 2u);
    }
  }
  id v13 = @"all";
  if (v4) {
    id v13 = @"VIP";
  }
  uint64_t v14 = v13;
  long long v15 = PLWallpaperGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = objc_msgSend((id)v27[5], "count", v20, v21, v22, v23);
    uint64_t v17 = v27[5];
    *(_DWORD *)buf = 67109634;
    int v33 = v16;
    __int16 v34 = 2112;
    double v35 = v14;
    __int16 v36 = 2112;
    uint64_t v37 = v17;
    _os_log_impl(&dword_25934C000, v15, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] Found %d %@ wallpaper people: %@", buf, 0x1Cu);
  }

  id v18 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v18;
}

void __88__PNSuggestionWallpaperUtilities_wallpaperPeopleLocalIdentifiersInPhotoLibrary_vipOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [a2 objectForKeyedSubscript:@"personLocalIdentifiers"];
    id v7 = (void *)v6;
    uint64_t v8 = (void *)MEMORY[0x263EFFA68];
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    id v9 = v8;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v9];
  }
  else
  {
    uint64_t v10 = PLWallpaperGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_25934C000, v10, OS_LOG_TYPE_ERROR, "[PNSuggestionWallpaperUtilities] Error getting wallpaper people local identifier: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (id)randomizedSuggestionsFromSuggestions:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 count] > 1)
  {
    id v8 = objc_alloc(MEMORY[0x263EFF980]);
    id v9 = [v6 fetchedObjectIDs];
    uint64_t v10 = (void *)[v8 initWithArray:v9];

    int v11 = [a1 randomNumberGeneratorForWallpaperDonation];
    PFMutableArrayShuffleWithRandomNumberGenerator();
    unint64_t v12 = [v10 count];
    if (v12 >= a4) {
      unint64_t v13 = a4;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v14 = objc_msgSend(v10, "subarrayWithRange:", 0, v13);
    id v15 = objc_alloc(MEMORY[0x263F14E58]);
    int v16 = [v6 photoLibrary];
    uint64_t v17 = *MEMORY[0x263F150A0];
    id v18 = [v6 fetchPropertySets];
    id v7 = (id)[v15 initWithOids:v14 photoLibrary:v16 fetchType:v17 fetchPropertySets:v18 identifier:0 registerIfNeeded:0];
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

+ (id)fetchPersonLocalIdentifiersForSuggestionSubtype:(unsigned __int16)a3 photoLibrary:(id)a4
{
  unsigned int v4 = a3;
  v25[2] = *MEMORY[0x263EF8340];
  id v5 = [a4 librarySpecificFetchOptions];
  id v6 = (void *)MEMORY[0x263F08730];
  id v7 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v25[0] = v7;
  id v8 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"subtype", v4);
  v25[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  uint64_t v10 = [v6 andPredicateWithSubpredicates:v9];
  [v5 setPredicate:v10];

  int v11 = [MEMORY[0x263F14F50] fetchSuggestionsWithOptions:v5];
  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [*(id *)(*((void *)&v20 + 1) + 8 * i) context];
        if (v18) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v12;
}

+ (id)fetchPortraitAssetsWithOptions:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 internalPredicate];
  id v6 = [v4 photoLibrary];
  id v7 = [a1 knownPersonLocalIdentifiersInPhotoLibrary:v6];

  id v8 = [a1 predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:v7];
  id v9 = v8;
  if (v5)
  {
    uint64_t v10 = (void *)MEMORY[0x263F08730];
    v24[0] = v8;
    v24[1] = v5;
    int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    id v12 = [v10 andPredicateWithSubpredicates:v11];
  }
  else
  {
    id v12 = v8;
  }
  [v4 setInternalPredicate:v12];
  id v13 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"addedDate" ascending:0];
  v23[0] = v14;
  uint64_t v15 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sortToken" ascending:0];
  v23[1] = v15;
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  uint64_t v17 = (void *)[v13 initWithArray:v16];

  id v18 = [v4 internalSortDescriptors];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    long long v20 = [v4 internalSortDescriptors];
    [v17 addObjectsFromArray:v20];
  }
  [v4 setInternalSortDescriptors:v17];
  long long v21 = [MEMORY[0x263F14D18] fetchAssetsWithOptions:v4];

  return v21;
}

+ (id)_mePersonUUIDInPhotoLibrary:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 _fetchMeContactIdentifier];
  if (v5)
  {
    id v6 = [a1 _personFetchOptionsWithPhotoLibrary:v4];

    id v7 = (void *)MEMORY[0x263F14E88];
    v18[0] = v5;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    id v9 = [v7 fetchPersonsForContactIdentifiers:v8 options:v6];
    uint64_t v10 = [v9 firstObject];

    if (v10)
    {
      int v11 = [v10 uuid];
      id v12 = PLWallpaperGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        uint64_t v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_impl(&dword_25934C000, v12, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] Found me person with contact identifier: %@, personUUID: %@", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      int v11 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  id v6 = [a1 _fetchSuggestedMePersonLocalIdentifierInPhotoLibrary:v4];

  if (v6)
  {
    int v11 = [MEMORY[0x263F14E88] uuidFromLocalIdentifier:v6];
    uint64_t v10 = PLWallpaperGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      uint64_t v15 = v11;
      _os_log_impl(&dword_25934C000, v10, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] Found suggestedMe personUUID: %@", (uint8_t *)&v14, 0xCu);
    }
    goto LABEL_10;
  }
  int v11 = 0;
LABEL_11:

  return v11;
}

+ (id)_assetSortComparatorForPortraitWallpaper
{
  return &__block_literal_global_272;
}

uint64_t __74__PNSuggestionWallpaperUtilities__assetSortComparatorForPortraitWallpaper__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isFavorite] && !objc_msgSend(v5, "isFavorite")) {
    goto LABEL_6;
  }
  if ([v5 isFavorite] && !objc_msgSend(v4, "isFavorite")) {
    goto LABEL_8;
  }
  id v6 = [v4 mediaAnalysisProperties];
  [v6 wallpaperScore];
  float v8 = v7;
  double v9 = v7;

  uint64_t v10 = [v5 mediaAnalysisProperties];
  [v10 wallpaperScore];
  float v12 = v11;
  double v13 = v11;

  [v4 overallAestheticScore];
  float v15 = v14;
  double v16 = v14;
  [v5 overallAestheticScore];
  double v18 = v13 + v17;
  if (v9 + v16 > v18)
  {
LABEL_6:
    uint64_t v19 = -1;
    goto LABEL_9;
  }
  if (v18 > v9 + v16) {
    goto LABEL_8;
  }
  if (v8 > v12) {
    goto LABEL_6;
  }
  if (v12 > v8) {
    goto LABEL_8;
  }
  if (v15 > v17) {
    goto LABEL_6;
  }
  if (v17 > v15)
  {
LABEL_8:
    uint64_t v19 = 1;
    goto LABEL_9;
  }
  long long v21 = [v5 creationDate];
  long long v22 = [v4 creationDate];
  uint64_t v19 = [v21 compare:v22];

  if (!v19)
  {
    long long v23 = [v4 uuid];
    double v24 = [v5 uuid];
    uint64_t v19 = [v23 compare:v24];
  }
LABEL_9:

  return v19;
}

+ (id)_mostRecentAssetDateInPhotoLibrary:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 librarySpecificFetchOptions];
  [v3 setFetchLimit:1];
  id v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:0];
  v10[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v3 setSortDescriptors:v5];

  id v6 = [MEMORY[0x263F14D18] fetchAssetsWithOptions:v3];
  float v7 = [v6 firstObject];

  float v8 = [v7 creationDate];

  return v8;
}

+ (id)_personFetchOptionsWithPhotoLibrary:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 librarySpecificFetchOptions];
  v6[0] = *MEMORY[0x263F15100];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v3 setFetchPropertySets:v4];

  [v3 setPersonContext:1];
  return v3;
}

+ (id)_fetchSuggestedMePersonLocalIdentifierInPhotoLibrary:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = 0;
  uint64_t v3 = [a3 suggestedMePersonIdentifierWithError:&v6];
  id v4 = v6;
  if (!v3 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] No suggested me person found, error: %@", buf, 0xCu);
  }

  return v3;
}

+ (id)_fetchMeContactIdentifier
{
  uint64_t v2 = [MEMORY[0x263F14E98] sharedContactStore];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  float v12 = __Block_byref_object_copy__1352;
  double v13 = __Block_byref_object_dispose__1353;
  id v14 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __59__PNSuggestionWallpaperUtilities__fetchMeContactIdentifier__block_invoke;
  v6[3] = &unk_26544EFA8;
  id v3 = v2;
  id v7 = v3;
  id v8 = &v9;
  [v3 requestAccessForEntityType:0 completionHandler:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __59__PNSuggestionWallpaperUtilities__fetchMeContactIdentifier__block_invoke(uint64_t a1, int a2, void *a3)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    v16[0] = *MEMORY[0x263EFDFE0];
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    id v13 = 0;
    id v8 = [v6 _crossPlatformUnifiedMeContactWithKeysToFetch:v7 error:&v13];
    id v9 = v13;

    if (v8)
    {
      uint64_t v10 = [v8 identifier];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      float v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] No me contact found: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[PNSuggestionWallpaperUtilities] Error gaining access to Contacts: %@", buf, 0xCu);
  }
}

+ (id)_coldStartPortraitWallpaperInPhotoLibrary:(id)a3 candidatePersons:(id)a4 passingFilterBlock:(id)a5 maximumNumberOfTries:(unint64_t)a6 targetCount:(unint64_t)a7
{
  uint64_t v226 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v173 = (unsigned int (**)(id, void))a5;
  if ([v10 count])
  {
    PLWallpaperGetLog();
    uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v12 = os_signpost_id_generate(v11);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    id v13 = v11;
    id v14 = v13;
    unint64_t v151 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25934C000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ColdStartPortraitWallpaper", "", buf, 2u);
    }
    os_signpost_id_t spid = v12;

    uint64_t v150 = mach_absolute_time();
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v211 = 0u;
    long long v212 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v211 objects:v225 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v212;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v212 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [*(id *)(*((void *)&v211 + 1) + 8 * i) uuid];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v211 objects:v225 count:16];
      }
      while (v18);
    }

    long long v22 = PLWallpaperGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = [v16 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v224 = v23;
      *(_WORD *)&v224[4] = 2112;
      *(void *)&v224[6] = v15;
      _os_log_impl(&dword_25934C000, v22, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] Starting with %d candidate people: %@", buf, 0x12u);
    }

    double v24 = [a1 _mostRecentAssetDateInPhotoLibrary:v9];
    double v25 = v24;
    if (v24)
    {
      uint64_t v26 = [v24 dateByAddingTimeInterval:-94608000.0];
      double v27 = [MEMORY[0x263F14E88] momentCountsByPersonUUIDForPersonsWithUUIDs:v15 afterDate:v26 photoLibrary:v9];
      uint64_t v28 = [v27 count];
      if (v28)
      {
        unint64_t v29 = v28;
        v144 = v26;
        v145 = v25;
        v147 = v14;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          double v30 = [v27 allKeys];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v224 = v29;
          *(_WORD *)&v224[4] = 2112;
          *(void *)&v224[6] = v30;
          _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] %d people found in library that were present in the past 3 years: %@", buf, 0x12u);
        }
        id v148 = v10;
        id v31 = [v16 fetchedObjects];
        v209[0] = MEMORY[0x263EF8330];
        v209[1] = 3221225472;
        v209[2] = __145__PNSuggestionWallpaperUtilities__coldStartPortraitWallpaperInPhotoLibrary_candidatePersons_passingFilterBlock_maximumNumberOfTries_targetCount___block_invoke;
        v209[3] = &unk_26544EF60;
        id v32 = v27;
        id v210 = v32;
        int v33 = [v31 sortedArrayUsingComparator:v209];

        long long v207 = 0u;
        long long v208 = 0u;
        long long v205 = 0u;
        long long v206 = 0u;
        obuint64_t j = v32;
        uint64_t v34 = [obj countByEnumeratingWithState:&v205 objects:v222 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v206;
          double v37 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v206 != v36) {
                objc_enumerationMutation(obj);
              }
              double v39 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v205 + 1) + 8 * j)];
              double v37 = v37 + (double)(unint64_t)[v39 unsignedIntegerValue];
            }
            uint64_t v35 = [obj countByEnumeratingWithState:&v205 objects:v222 count:16];
          }
          while (v35);
        }
        else
        {
          double v37 = 0.0;
        }
        v143 = v27;
        id v146 = v15;
        v155 = v9;

        id v158 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v172 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v201 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        long long v204 = 0u;
        id v168 = v33;
        uint64_t v53 = [v168 countByEnumeratingWithState:&v201 objects:v221 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v202;
          do
          {
            for (uint64_t k = 0; k != v54; ++k)
            {
              if (*(void *)v202 != v55) {
                objc_enumerationMutation(v168);
              }
              v57 = *(void **)(*((void *)&v201 + 1) + 8 * k);
              v58 = [v57 uuid];
              unint64_t v59 = [obj objectForKeyedSubscript:v58];
              uint64_t v60 = [v59 unsignedIntegerValue];

              if (v60)
              {
                long long v61 = [v57 uuid];
                [v172 addObject:v61];
              }
            }
            uint64_t v54 = [v168 countByEnumeratingWithState:&v201 objects:v221 count:16];
          }
          while (v54);
        }

        long long v62 = [a1 _assetSortComparatorForPortraitWallpaper];
        id v63 = objc_alloc_init(MEMORY[0x263EFF980]);
        unint64_t v64 = [v172 count];
        uint64_t v65 = 5;
        if (v64 < 5) {
          uint64_t v65 = v64;
        }
        uint64_t v159 = v65;
        id v66 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        id v163 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v162 = v66;
        if ([v63 count] < a7)
        {
          unint64_t v164 = 0;
          double v67 = v37 / (double)v29;
          uint64_t v154 = *MEMORY[0x263F14FF0];
          uint64_t v153 = *MEMORY[0x263F14FA0];
          uint64_t v152 = *MEMORY[0x263F15028];
          v68 = &off_26544D000;
          v170 = v63;
          do
          {
            if (![v172 count] || v164 >= a6) {
              break;
            }
            os_signpost_id_t v69 = (void *)[v172 copy];
            if (![v69 count]) {
              goto LABEL_141;
            }
            v160 = v69;
            uint64_t v161 = 0;
            uint64_t v70 = 0;
            do
            {
              context = (void *)MEMORY[0x25A2E0AC0]();
              uint64_t v167 = v70;
              double v71 = [v69 objectAtIndexedSubscript:v70];
              v171 = v71;
              if ((unint64_t)[v66 count] >= 5
                && ([v66 containsObject:v71] & 1) == 0)
              {
                [v172 removeObject:v71];
                ++v161;
                goto LABEL_140;
              }
              if ((unint64_t)[v66 count] >= 3)
              {
                uint64_t v72 = [v158 objectForKeyedSubscript:v71];
                if ([v72 type] == 1)
                {

                  id v66 = v162;
                }
                else
                {
                  int v73 = [obj objectForKeyedSubscript:v71];
                  [v73 doubleValue];
                  double v75 = v74;

                  id v66 = v162;
                  if (v75 < v67)
                  {
                    id v66 = v162;
                    objc_msgSend(v172, "removeObjectsInRange:", v167 - v161, objc_msgSend(v172, "count") - (v167 - v161));

                    os_signpost_id_t v69 = v160;
                    break;
                  }
                }
              }
              v76 = [v163 objectForKeyedSubscript:v71];
              if (!v76)
              {
                v77 = [v155 librarySpecificFetchOptions];
                v220[0] = v154;
                v220[1] = v153;
                v220[2] = v152;
                int v78 = [MEMORY[0x263EFF8C0] arrayWithObjects:v220 count:3];
                [v77 setFetchPropertySets:v78];

                v79 = (void *)MEMORY[0x263EFFA08];
                uint64_t v80 = [MEMORY[0x263F14E88] localIdentifierWithUUID:v71];
                uint64_t v81 = [v79 setWithObject:v80];
                v82 = [a1 predicateForPortraitWallpaperCandidatesWithPersonLocalIdentifiers:v81];
                [v77 setInternalPredicate:v82];

                id v174 = v77;
                uint64_t v83 = [MEMORY[0x263F14D18] fetchAssetsWithOptions:v77];
                id v178 = objc_alloc_init(MEMORY[0x263EFF980]);
                long long v197 = 0u;
                long long v198 = 0u;
                long long v199 = 0u;
                long long v200 = 0u;
                id v84 = v83;
                uint64_t v85 = [v84 countByEnumeratingWithState:&v197 objects:v219 count:16];
                id v182 = v84;
                if (v85)
                {
                  uint64_t v86 = v85;
                  uint64_t v87 = *(void *)v198;
                  do
                  {
                    for (uint64_t m = 0; m != v86; ++m)
                    {
                      if (*(void *)v198 != v87) {
                        objc_enumerationMutation(v182);
                      }
                      uint64_t v89 = *(void *)(*((void *)&v197 + 1) + 8 * m);
                      if ([v68[267] assetIsSafeForWidgetDisplay:v89])
                      {
                        buf[0] = 0;
                        +[PNSuggestionWallpaperUtilities bestWallpaperCropForAsset:v89 classification:1 outputCropScore:0 outputLayoutAcceptable:buf];
                        if (buf[0]) {
                          [v178 addObject:v89];
                        }
                      }
                    }
                    id v84 = v182;
                    uint64_t v86 = [v182 countByEnumeratingWithState:&v197 objects:v219 count:16];
                  }
                  while (v86);
                }

                if (![v178 count])
                {
                  [v172 removeObject:v171];
                  ++v161;

                  id v63 = v170;
                  id v66 = v162;
                  os_signpost_id_t v69 = v160;
                  goto LABEL_139;
                }
                v90 = (void *)[objc_alloc(MEMORY[0x263F5D8D8]) initWithDistanceBlock:&__block_literal_global_266];
                [v90 setMaximumDistance:7200.0];
                [v90 setMinimumNumberOfObjects:1];
                v157 = v90;
                uint64_t v91 = [v90 performWithDataset:v178 progressBlock:0];
                id v177 = objc_alloc_init(MEMORY[0x263EFF980]);
                long long v193 = 0u;
                long long v194 = 0u;
                long long v195 = 0u;
                long long v196 = 0u;
                id v180 = v91;
                uint64_t v92 = [v180 countByEnumeratingWithState:&v193 objects:v218 count:16];
                if (v92)
                {
                  uint64_t v93 = v92;
                  uint64_t v183 = *(void *)v194;
                  do
                  {
                    for (uint64_t n = 0; n != v93; ++n)
                    {
                      if (*(void *)v194 != v183) {
                        objc_enumerationMutation(v180);
                      }
                      v95 = *(void **)(*((void *)&v193 + 1) + 8 * n);
                      long long v189 = 0u;
                      long long v190 = 0u;
                      long long v191 = 0u;
                      long long v192 = 0u;
                      v96 = [v95 objects];
                      uint64_t v97 = [v96 countByEnumeratingWithState:&v189 objects:v217 count:16];
                      if (!v97)
                      {
                        uint32_t v99 = v96;
                        goto LABEL_98;
                      }
                      uint64_t v98 = v97;
                      uint32_t v99 = 0;
                      uint64_t v100 = *(void *)v190;
                      do
                      {
                        for (iuint64_t i = 0; ii != v98; ++ii)
                        {
                          if (*(void *)v190 != v100) {
                            objc_enumerationMutation(v96);
                          }
                          v102 = *(void **)(*((void *)&v189 + 1) + 8 * ii);
                          if (!v99
                            || ((uint64_t (**)(void, void, void *))v62)[2](v62, *(void *)(*((void *)&v189 + 1) + 8 * ii), v99) == -1)
                          {
                            id v103 = v102;

                            uint32_t v99 = v103;
                          }
                        }
                        uint64_t v98 = [v96 countByEnumeratingWithState:&v189 objects:v217 count:16];
                      }
                      while (v98);

                      if (v99)
                      {
                        [v177 addObject:v99];
LABEL_98:

                        continue;
                      }
                    }
                    uint64_t v93 = [v180 countByEnumeratingWithState:&v193 objects:v218 count:16];
                  }
                  while (v93);
                }

                v76 = [v177 sortedArrayUsingComparator:v62];
                [v163 setObject:v76 forKeyedSubscript:v171];

                id v63 = v170;
                id v66 = v162;
              }
              unint64_t v104 = v159 - [v66 count];
              unint64_t v105 = a7 - [v63 count];
              unint64_t v106 = vcvtmd_u64_f64((double)v105 / (double)v104);
              unint64_t v107 = v164;
              if (v106 <= 1) {
                uint64_t v108 = 1;
              }
              else {
                uint64_t v108 = v106;
              }
              unint64_t v109 = vcvtmd_u64_f64((double)(a6 - v164) / (double)v104);
              if (v109 <= 1) {
                uint64_t v110 = 1;
              }
              else {
                uint64_t v110 = v109;
              }
              id v182 = (id)[v76 mutableCopy];
              long long v185 = 0u;
              long long v186 = 0u;
              long long v187 = 0u;
              long long v188 = 0u;
              id v174 = v76;
              uint64_t v111 = [v174 countByEnumeratingWithState:&v185 objects:v216 count:16];
              if (!v111)
              {
                char v116 = 0;
                unint64_t v121 = v164;
                goto LABEL_133;
              }
              uint64_t v112 = v111;
              uint64_t v113 = v108;
              uint64_t v114 = 0;
              uint64_t v115 = 0;
              id v181 = (id)(v113 + v105 - v113 * v104);
              char v116 = 0;
              unint64_t v184 = v110 + a6 - v164 - v110 * v104;
              uint64_t v117 = *(void *)v186;
              while (2)
              {
                uint64_t v118 = 0;
                unint64_t v165 = v107 + v112;
                uint64_t v119 = v115 + 1;
                uint64_t v179 = v115 + v112;
                do
                {
                  if (*(void *)v186 != v117) {
                    objc_enumerationMutation(v174);
                  }
                  uint64_t v120 = *(void *)(*((void *)&v185 + 1) + 8 * v118);
                  [v182 removeObject:v120];
                  if (v173[2](v173, v120))
                  {
                    [v170 addObject:v120];
                    if (++v114 >= (unint64_t)v181 || [v170 count] >= a7)
                    {
                      unint64_t v121 = v107 + v118;
                      char v116 = 1;
                      goto LABEL_133;
                    }
                    char v116 = 1;
                  }
                  unint64_t v121 = v107 + v118 + 1;
                  if (v121 >= a6)
                  {
                    if (a6 <= v107 + 1) {
                      unint64_t v121 = v107 + 1;
                    }
                    else {
                      unint64_t v121 = a6;
                    }
                    id v122 = PLWallpaperGetLog();
                    if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)v224 = v121;
                      v123 = v122;
                      v124 = "[PNSuggestionWallpaperUtilities] max (%d) number of total filter tries reached, stopping early.";
                      uint32_t v125 = 8;
                      goto LABEL_131;
                    }
LABEL_132:

                    goto LABEL_133;
                  }
                  if (v119 + v118 >= v184)
                  {
                    id v122 = PLWallpaperGetLog();
                    if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v224 = v107 + v118 + 1;
                      *(_WORD *)&v224[4] = 2112;
                      *(void *)&v224[6] = v171;
                      v123 = v122;
                      v124 = "[PNSuggestionWallpaperUtilities] max (%d) number of filter tries reached for person (%@), s"
                             "topping early for person.";
                      uint32_t v125 = 18;
LABEL_131:
                      _os_log_impl(&dword_25934C000, v123, OS_LOG_TYPE_INFO, v124, buf, v125);
                    }
                    goto LABEL_132;
                  }
                  ++v118;
                }
                while (v112 != v118);
                uint64_t v112 = [v174 countByEnumeratingWithState:&v185 objects:v216 count:16];
                unint64_t v121 = v165;
                unint64_t v107 = v165;
                uint64_t v115 = v179;
                if (v112) {
                  continue;
                }
                break;
              }
LABEL_133:
              unint64_t v164 = v121;

              if ([v182 count])
              {
                [v163 setObject:v182 forKeyedSubscript:v171];
              }
              else
              {
                [v172 removeObject:v171];
                ++v161;
              }
              id v63 = v170;
              id v66 = v162;
              v68 = &off_26544D000;
              os_signpost_id_t v69 = v160;
              if (v116) {
                [v162 addObject:v171];
              }
LABEL_139:

LABEL_140:
              uint64_t v70 = v167 + 1;
            }
            while (v167 + 1 < (unint64_t)[v69 count]);
LABEL_141:
          }
          while ([v63 count] < a7);
        }
        uint64_t v126 = [v66 count];
        v127 = PLWallpaperGetLog();
        BOOL v128 = os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT);
        id v10 = v148;
        if (v126)
        {
          id v14 = v147;
          if (v128)
          {
            uint64_t v129 = [v162 count];
            *(_DWORD *)buf = 134217984;
            *(void *)v224 = v129;
            _os_log_impl(&dword_25934C000, v127, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] %tu important people found in library to feature", buf, 0xCu);
          }

          uint64_t v130 = mach_absolute_time();
          uint32_t numer = info.numer;
          uint32_t denom = info.denom;
          int v133 = v147;
          __int16 v134 = v133;
          id v9 = v155;
          id v15 = v146;
          double v27 = v143;
          if (v151 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v133))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_25934C000, v134, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartPortraitWallpaper", "", buf, 2u);
          }

          if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)v224 = "ColdStartPortraitWallpaper";
            *(_WORD *)&v224[8] = 2048;
            *(double *)&v224[10] = (float)((float)((float)((float)(v130 - v150) * (float)numer) / (float)denom)
                                         / 1000000.0);
            _os_log_impl(&dword_25934C000, v134, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }
          int v135 = PLWallpaperGetLog();
          if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v136 = [v63 count];
            *(_DWORD *)buf = 134217984;
            *(void *)v224 = v136;
            _os_log_impl(&dword_25934C000, v135, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] %tu assets selected as fallback wallpaper gallery featured photo suggestions", buf, 0xCu);
          }

          id v40 = v63;
        }
        else
        {
          id v15 = v146;
          id v14 = v147;
          if (v128)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_25934C000, v127, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] No candidate assets found for important people found in library, returning 0 fallback featured photos for wallpaper gallery", buf, 2u);
          }

          uint64_t v137 = mach_absolute_time();
          uint32_t v138 = info.numer;
          uint32_t v139 = info.denom;
          v140 = v147;
          v141 = v140;
          id v9 = v155;
          double v27 = v143;
          if (v151 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v140))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_25934C000, v141, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartPortraitWallpaper", "", buf, 2u);
          }

          if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)v224 = "ColdStartPortraitWallpaper";
            *(_WORD *)&v224[8] = 2048;
            *(double *)&v224[10] = (float)((float)((float)((float)(v137 - v150) * (float)v138) / (float)v139) / 1000000.0);
            _os_log_impl(&dword_25934C000, v141, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }
          id v40 = (id)MEMORY[0x263EFFA68];
        }

        uint64_t v26 = v144;
        double v25 = v145;
      }
      else
      {
        double v47 = PLWallpaperGetLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_25934C000, v47, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] No people found in library that were present in the past 3 years, returning 0 fallback featured photos for wallpaper gallery", buf, 2u);
        }

        uint64_t v48 = mach_absolute_time();
        uint32_t v49 = info.numer;
        uint32_t v50 = info.denom;
        uint64_t v51 = v14;
        uint64_t v52 = v51;
        if (v151 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_25934C000, v52, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartPortraitWallpaper", "", buf, 2u);
        }

        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v224 = "ColdStartPortraitWallpaper";
          *(_WORD *)&v224[8] = 2048;
          *(double *)&v224[10] = (float)((float)((float)((float)(v48 - v150) * (float)v49) / (float)v50) / 1000000.0);
          _os_log_impl(&dword_25934C000, v52, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        id v40 = (id)MEMORY[0x263EFFA68];
      }
    }
    else
    {
      double v41 = PLWallpaperGetLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25934C000, v41, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] Library has no assets, returning 0 fallback featured photos for wallpaper gallery", buf, 2u);
      }

      uint64_t v42 = mach_absolute_time();
      uint32_t v43 = info.numer;
      uint32_t v44 = info.denom;
      double v45 = v14;
      double v46 = v45;
      if (v151 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_25934C000, v46, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartPortraitWallpaper", "", buf, 2u);
      }

      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)v224 = "ColdStartPortraitWallpaper";
        *(_WORD *)&v224[8] = 2048;
        *(double *)&v224[10] = (float)((float)((float)((float)(v42 - v150) * (float)v43) / (float)v44) / 1000000.0);
        _os_log_impl(&dword_25934C000, v46, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      id v40 = (id)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    id v40 = (id)MEMORY[0x263EFFA68];
  }

  return v40;
}

uint64_t __145__PNSuggestionWallpaperUtilities__coldStartPortraitWallpaperInPhotoLibrary_candidatePersons_passingFilterBlock_maximumNumberOfTries_targetCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 type] == 1 && objc_msgSend(v6, "type") != 1) {
    goto LABEL_6;
  }
  if ([v6 type] == 1 && objc_msgSend(v5, "type") != 1) {
    goto LABEL_8;
  }
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 uuid];
  id v9 = [v7 objectForKeyedSubscript:v8];
  unint64_t v10 = [v9 unsignedIntegerValue];

  uint64_t v11 = *(void **)(a1 + 32);
  os_signpost_id_t v12 = [v6 uuid];
  id v13 = [v11 objectForKeyedSubscript:v12];
  unint64_t v14 = [v13 unsignedIntegerValue];

  if (v10 <= v14)
  {
    if (v14 <= v10)
    {
      uint64_t v17 = [v5 name];
      uint64_t v18 = [v17 length];

      uint64_t v19 = [v6 name];
      uint64_t v20 = [v19 length];

      if (v18 && !v20) {
        goto LABEL_6;
      }
      if (!v20 || v18)
      {
        long long v21 = [v5 uuid];
        long long v22 = [v6 uuid];
        uint64_t v15 = [v21 compare:v22];

        goto LABEL_9;
      }
    }
LABEL_8:
    uint64_t v15 = 1;
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v15 = -1;
LABEL_9:

  return v15;
}

double __145__PNSuggestionWallpaperUtilities__coldStartPortraitWallpaperInPhotoLibrary_candidatePersons_passingFilterBlock_maximumNumberOfTries_targetCount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 creationDate];
  id v6 = [v4 creationDate];

  [v5 timeIntervalSinceDate:v6];
  double v8 = fabs(v7);

  return v8;
}

+ (id)coldStartDeviceOwnerWallpaperInPhotoLibrary:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = PLWallpaperGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  double v7 = v5;
  double v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ColdStartMeWallpaperPeopleFetch", "", buf, 2u);
  }

  uint64_t v10 = mach_absolute_time();
  uint64_t v11 = [a1 _mePersonUUIDInPhotoLibrary:v4];
  if (v11)
  {
    os_signpost_id_t spid = v6;
    uint64_t v31 = v10;
    os_signpost_id_t v12 = [a1 _personFetchOptionsWithPhotoLibrary:v4];
    id v13 = [MEMORY[0x263F14E88] localIdentifierWithUUID:v11];
    unint64_t v14 = (void *)MEMORY[0x263F14E88];
    int v33 = v13;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
    id v16 = [v14 fetchPersonsWithLocalIdentifiers:v15 options:v12];

    uint64_t v17 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    uint64_t v20 = v8;
    long long v21 = v20;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25934C000, v21, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartMeWallpaperPeopleFetch", "", buf, 2u);
    }

    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v35 = "ColdStartMeWallpaperPeopleFetch";
      __int16 v36 = 2048;
      double v37 = (float)((float)((float)((float)(v17 - v31) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_25934C000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    long long v22 = [a1 _coldStartPortraitWallpaperInPhotoLibrary:v4 candidatePersons:v16 passingFilterBlock:&__block_literal_global_255 maximumNumberOfTries:0x7FFFFFFFFFFFFFFFLL targetCount:0x7FFFFFFFFFFFFFFFLL];
  }
  else
  {
    int v23 = PLWallpaperGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25934C000, v23, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] No device owner found", buf, 2u);
    }

    uint64_t v24 = mach_absolute_time();
    uint32_t v26 = info.numer;
    uint32_t v25 = info.denom;
    double v27 = v8;
    uint64_t v28 = v27;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_25934C000, v28, OS_SIGNPOST_INTERVAL_END, v6, "ColdStartMeWallpaperPeopleFetch", "", buf, 2u);
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v35 = "ColdStartMeWallpaperPeopleFetch";
      __int16 v36 = 2048;
      double v37 = (float)((float)((float)((float)(v24 - v10) * (float)v26) / (float)v25) / 1000000.0);
      _os_log_impl(&dword_25934C000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    long long v22 = (void *)MEMORY[0x263EFFA68];
  }

  return v22;
}

uint64_t __78__PNSuggestionWallpaperUtilities_coldStartDeviceOwnerWallpaperInPhotoLibrary___block_invoke()
{
  return 1;
}

+ (id)coldStartPortraitWallpaperInPhotoLibrary:(id)a3 passingFilterBlock:(id)a4 maximumNumberOfTries:(unint64_t)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v32 = a4;
  double v8 = PLWallpaperGetLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v10 = v8;
  uint64_t v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ColdStartPortraitWallpaperPeopleFetch", "", buf, 2u);
  }
  os_signpost_id_t spid = v9;

  uint64_t v30 = mach_absolute_time();
  id v13 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x263F14F60]) initWithPhotoLibrary:v7];
  unint64_t v14 = [v31 personUUIDsWithNegativeFeedback];
  [v13 unionSet:v14];
  uint64_t v15 = [a1 _mePersonUUIDInPhotoLibrary:v7];
  if (v15)
  {
    id v16 = PLWallpaperGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v36 = v15;
      _os_log_impl(&dword_25934C000, v16, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] exclude mePersonUUID %@", buf, 0xCu);
    }

    [v13 addObject:v15];
  }
  uint64_t v17 = [a1 _personFetchOptionsWithPhotoLibrary:v7];
  uint64_t v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"NOT (%K IN %@)", @"personUUID", v13];
  [v17 setInternalPredicate:v18];

  uint64_t v19 = [MEMORY[0x263F14E88] fetchPersonsWithOptions:v17];
  uint64_t v20 = PLWallpaperGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = [v19 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = v21;
    _os_log_impl(&dword_25934C000, v20, OS_LOG_TYPE_DEFAULT, "[PNSuggestionWallpaperUtilities] %d candidate people found in library", buf, 8u);
  }

  uint64_t v22 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint32_t v25 = v11;
  uint32_t v26 = v25;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v26, OS_SIGNPOST_INTERVAL_END, spid, "ColdStartPortraitWallpaperPeopleFetch", "", buf, 2u);
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v36 = "ColdStartPortraitWallpaperPeopleFetch";
    __int16 v37 = 2048;
    double v38 = (float)((float)((float)((float)(v22 - v30) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  double v27 = [a1 _coldStartPortraitWallpaperInPhotoLibrary:v7 candidatePersons:v19 passingFilterBlock:v32 maximumNumberOfTries:a5 targetCount:10];

  return v27;
}

+ (id)coldStartPortraitWallpaperInPhotoLibrary:(id)a3
{
  return (id)[a1 coldStartPortraitWallpaperInPhotoLibrary:a3 passingFilterBlock:&__block_literal_global_1409 maximumNumberOfTries:0x7FFFFFFFFFFFFFFFLL];
}

uint64_t __75__PNSuggestionWallpaperUtilities_coldStartPortraitWallpaperInPhotoLibrary___block_invoke()
{
  return 1;
}

+ (id)wallpaperGallerySmartAlbumSuggestionsFromSuggestions:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = [a1 wallpaperGalleryFeaturedPhotoSortedSuggestionsFromSuggestions:a3];
  if ([v3 count])
  {
    id v4 = [v3 lastObject];
    v7[0] = v4;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

+ (id)wallpaperGalleryFeaturedPhotoSortedSuggestionsFromSuggestions:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 fetchedObjects];

  double v8 = (void *)[v6 initWithArray:v7];
  os_signpost_id_t v9 = [a1 randomNumberGeneratorForWallpaperDonation];
  PFMutableArrayShuffleWithRandomNumberGenerator();

  return v8;
}

+ (id)fetchWallpaperGallerySuggestionsInPhotoLibrary:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = [a3 librarySpecificFetchOptions];
  id v4 = (void *)MEMORY[0x263F08730];
  id v5 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v11[0] = v5;
  id v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K >= %d AND %K <= %d", @"subtype", 602, @"subtype", 605);
  v11[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  double v8 = [v4 andPredicateWithSubpredicates:v7];
  [v3 setPredicate:v8];

  os_signpost_id_t v9 = [MEMORY[0x263F14F50] fetchWallpaperSuggestionsWithFeaturedState:1 withOptions:v3];

  return v9;
}

+ (id)randomNumberGeneratorForWallpaperDonationWithDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyMMdd"];
  id v5 = [v4 stringFromDate:v3];
  uint64_t v6 = [v5 length];
  if (v6 < 1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = v9 + 1;
      v8 += (v9 + 1) * objc_msgSend(v5, "characterAtIndex:");
      uint64_t v9 = v10;
    }
    while (v7 != v10);
  }
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F5DF58]) initWithSeed:v8];

  return v11;
}

+ (id)randomNumberGeneratorForWallpaperDonation
{
  id v3 = [MEMORY[0x263EFF910] date];
  id v4 = [a1 randomNumberGeneratorForWallpaperDonationWithDate:v3];

  return v4;
}

@end