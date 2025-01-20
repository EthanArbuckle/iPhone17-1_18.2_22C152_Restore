@interface PNAmbientSuggestionUtilities
+ (BOOL)_hasAcceptableCropScoreWithAsset:(id)a3;
+ (CGSize)_deviceScreenSize;
+ (double)_cropScoreWithAsset:(id)a3;
+ (id)fetchHighlightAssetsInPhotoLibrary:(id)a3 limit:(unint64_t)a4 randomSeed:(unint64_t)a5;
+ (id)fetchMemoryKeyAssetsInPhotoLibrary:(id)a3 limit:(unint64_t)a4 randomSeed:(unint64_t)a5;
+ (int64_t)assetIsEligibleForDisplay:(id)a3 modelSet:(id)a4;
+ (int64_t)suggestionIsEligibleForDisplay:(id)a3 asset:(id)a4 modelSet:(id)a5;
@end

@implementation PNAmbientSuggestionUtilities

+ (double)_cropScoreWithAsset:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 _deviceScreenSize];
  if (v5 <= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  if (v5 <= v6) {
    double v8 = v6;
  }
  else {
    double v8 = v5;
  }
  [v4 faceAreaMinX];
  double v10 = v9;
  [v4 faceAreaMinY];
  double v12 = v11;
  [v4 faceAreaMaxX];
  double v14 = v13;
  [v4 faceAreaMaxY];
  double v15 = v14 - v10;
  double v17 = v16 - v12;
  if (v8 != 0.0 && v7 != 0.0 && (v8 != *MEMORY[0x263F5D550] || v7 != *(double *)(MEMORY[0x263F5D550] + 8)))
  {
    double v19 = fabs(v8 / v7);
LABEL_15:
    double v40 = v19;
    goto LABEL_16;
  }
  BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  double v19 = 1.0;
  if (!v20) {
    goto LABEL_15;
  }
  double v40 = 1.0;
  *(_DWORD *)buf = 134218496;
  double v42 = v8;
  __int16 v43 = 2048;
  double v44 = v7;
  __int16 v45 = 2048;
  uint64_t v46 = 0x3FF0000000000000;
  _os_log_fault_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
LABEL_16:
  uint64_t v21 = [v4 pixelWidth];
  uint64_t v22 = [v4 pixelHeight];
  [v4 acceptableCropRect];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  [v4 preferredCropRect];
  +[PNCropUtilitiesWrapper cropVariantsFromSignalsWithCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:](PNCropUtilitiesWrapper, "cropVariantsFromSignalsWithCropTypes:aspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:faceAreaRect:objectSaliencyRects:gazeAreaRect:isDenormalized:", &unk_27076A598, v21, v22, MEMORY[0x263EFFA68], 1, v40, v24, v26, v28, v30, v31, v32, v33, v34, *(void *)&v10, *(void *)&v12,
    *(void *)&v15,
    *(void *)&v17,
    *MEMORY[0x263F001A0],
    *(void *)(MEMORY[0x263F001A0] + 8),
    *(void *)(MEMORY[0x263F001A0] + 16),
  v35 = *(void *)(MEMORY[0x263F001A0] + 24));
  if ([v35 count])
  {
    v36 = [v35 firstObject];
    [v36 cropScore];
    double v38 = v37;
  }
  else
  {
    double v38 = 0.0;
  }

  return v38;
}

+ (CGSize)_deviceScreenSize
{
  if (_deviceScreenSize_onceToken != -1) {
    dispatch_once(&_deviceScreenSize_onceToken, &__block_literal_global_975);
  }
  double v2 = *(double *)&_deviceScreenSize_deviceSize_0;
  double v3 = *(double *)&_deviceScreenSize_deviceSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t __49__PNAmbientSuggestionUtilities__deviceScreenSize__block_invoke()
{
  uint64_t result = PFDeviceScreenSize();
  _deviceScreenSize_deviceSize_0 = v1;
  _deviceScreenSize_deviceSize_1 = v2;
  return result;
}

+ (BOOL)_hasAcceptableCropScoreWithAsset:(id)a3
{
  [a1 _cropScoreWithAsset:a3];
  return v3 > 0.4;
}

+ (id)fetchMemoryKeyAssetsInPhotoLibrary:(id)a3 limit:(unint64_t)a4 randomSeed:(unint64_t)a5
{
  v84[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = PLAmbientPhotoFrameGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v80 = (const char *)a4;
    _os_log_impl(&dword_25934C000, v7, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] fetchMemoryKeyAssets with limit %lu", buf, 0xCu);
  }
  unint64_t v70 = a4;
  double v8 = v7;
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  double v10 = v8;
  double v11 = v10;
  unint64_t v72 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchMemoryKeyAssets", "", buf, 2u);
  }
  os_signpost_id_t spid = v9;

  uint64_t v71 = mach_absolute_time();
  double v12 = [MEMORY[0x263EFF910] date];
  uint64_t v13 = [v12 dateByAddingTimeInterval:-63115200.0];

  v74 = v6;
  double v14 = [v6 librarySpecificFetchOptions];
  uint64_t v15 = *MEMORY[0x263F15028];
  v84[0] = *MEMORY[0x263F15028];
  double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:1];
  [v14 setFetchPropertySets:v16];

  double v17 = (void *)MEMORY[0x263F08730];
  v73 = (void *)v13;
  v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K > %@", @"creationDate", v13];
  v83[0] = v18;
  double v19 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == NO", @"rejected");
  v83[1] = v19;
  BOOL v20 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == NO", @"userCreated");
  v83[2] = v20;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v83 count:3];
  uint64_t v22 = [v17 andPredicateWithSubpredicates:v21];
  [v14 setPredicate:v22];

  double v23 = v11;
  os_signpost_id_t v24 = os_signpost_id_generate(v23);
  mach_timebase_info v77 = 0;
  mach_timebase_info(&v77);
  double v25 = v23;
  double v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "FetchAmbientMemories", "", buf, 2u);
  }

  uint64_t v27 = mach_absolute_time();
  v75 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v14];
  uint64_t v28 = mach_absolute_time();
  uint32_t numer = v77.numer;
  uint32_t denom = v77.denom;
  uint64_t v31 = v26;
  uint64_t v32 = v31;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v32, OS_SIGNPOST_INTERVAL_END, v24, "FetchAmbientMemories", "", buf, 2u);
  }

  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v80 = "FetchAmbientMemories";
    __int16 v81 = 2048;
    double v82 = (float)((float)((float)((float)(v28 - v27) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v33 = v32;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    int v34 = [v75 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v80) = v34;
    _os_log_impl(&dword_25934C000, v33, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] Found %d memories", buf, 8u);
  }

  v35 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F14FE0], v15, 0);
  v36 = [v74 librarySpecificFetchOptions];
  [v36 setIncludeGuestAssets:1];
  double v37 = [v35 allObjects];
  [v36 setFetchPropertySets:v37];

  double v38 = v33;
  os_signpost_id_t v39 = os_signpost_id_generate(v38);
  mach_timebase_info v76 = 0;
  mach_timebase_info(&v76);
  double v40 = v38;
  v41 = v40;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "FetchAmbientMemoryKeyAssets", "", buf, 2u);
  }

  uint64_t v42 = mach_absolute_time();
  __int16 v43 = [MEMORY[0x263F14D18] fetchKeyAssetByMemoryUUIDForMemories:v75 options:v36];
  double v44 = v41;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    int v45 = [v43 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v80) = v45;
    _os_log_impl(&dword_25934C000, v44, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] Found %d memory key assets", buf, 8u);
  }

  uint64_t v46 = mach_absolute_time();
  uint32_t v48 = v76.numer;
  uint32_t v47 = v76.denom;
  v49 = v44;
  v50 = v49;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v50, OS_SIGNPOST_INTERVAL_END, v39, "FetchAmbientMemoryKeyAssets", "", buf, 2u);
  }

  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v80 = "FetchAmbientMemoryKeyAssets";
    __int16 v81 = 2048;
    double v82 = (float)((float)((float)((float)(v46 - v42) * (float)v48) / (float)v47) / 1000000.0);
    _os_log_impl(&dword_25934C000, v50, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v51 = [v43 allValues];
  if ((unint64_t)[v51 count] >= 2)
  {
    v52 = [MEMORY[0x263EFFA08] setWithArray:v51];
    v53 = (void *)[objc_alloc(MEMORY[0x263F5DF58]) initWithSeed:a5];
    v54 = [v52 allObjects];
    v55 = PFShuffledArrayWithRandomNumberGenerator();

    unint64_t v56 = [v55 count];
    if (v56 >= v70) {
      unint64_t v57 = v70;
    }
    else {
      unint64_t v57 = v56;
    }
    v51 = objc_msgSend(v55, "subarrayWithRange:", 0, v57);
  }
  id v58 = objc_alloc(MEMORY[0x263F14E58]);
  v59 = (void *)[v58 initWithObjects:v51 photoLibrary:v74 fetchType:*MEMORY[0x263F15090] fetchPropertySets:v35 identifier:0 registerIfNeeded:0];
  v60 = v50;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    int v61 = [v59 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v80) = v61;
    _os_log_impl(&dword_25934C000, v60, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] Return %d unique memory key assets", buf, 8u);
  }

  uint64_t v62 = mach_absolute_time();
  uint32_t v64 = info.numer;
  uint32_t v63 = info.denom;
  v65 = v60;
  v66 = v65;
  if (v72 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v66, OS_SIGNPOST_INTERVAL_END, spid, "FetchMemoryKeyAssets", "", buf, 2u);
  }

  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v80 = "FetchMemoryKeyAssets";
    __int16 v81 = 2048;
    double v82 = (float)((float)((float)((float)(v62 - v71) * (float)v64) / (float)v63) / 1000000.0);
    _os_log_impl(&dword_25934C000, v66, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v59;
}

+ (id)fetchHighlightAssetsInPhotoLibrary:(id)a3 limit:(unint64_t)a4 randomSeed:(unint64_t)a5
{
  v67[2] = *MEMORY[0x263EF8340];
  id v60 = a3;
  double v7 = PLAmbientPhotoFrameGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint32_t v63 = (const char *)a4;
    _os_log_impl(&dword_25934C000, v7, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] fetchHighlightAssets with limit %lu", buf, 0xCu);
  }
  double v8 = v7;
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  double v10 = v8;
  double v11 = v10;
  unint64_t v54 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FetchHighlightAssets", "", buf, 2u);
  }
  os_signpost_id_t spid = v9;

  uint64_t v48 = mach_absolute_time();
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  v59 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"highlightBeingSummaryAssets.kind", 0);
  objc_msgSend(v12, "addObject:");
  id v58 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"highlightBeingSummaryAssets.enrichmentState", 4);
  objc_msgSend(v12, "addObject:");
  uint64_t v13 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d AND %K = %d", @"highlightBeingSummaryAssets.type", 0, @"highlightBeingSummaryAssets.visibilityState", 3);
  uint64_t v14 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K = %d", @"highlightBeingSummaryAssets.type", 5);
  uint64_t v15 = (void *)MEMORY[0x263F08730];
  unint64_t v56 = (void *)v14;
  unint64_t v57 = (void *)v13;
  v67[0] = v13;
  v67[1] = v14;
  double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
  uint64_t v17 = [v15 orPredicateWithSubpredicates:v16];

  v55 = (void *)v17;
  [v12 addObject:v17];
  v53 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K > %f", @"highlightBeingSummaryAssets.promotionScore", 0x3FD0000000000000);
  objc_msgSend(v12, "addObject:");
  v52 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"kind", 0);
  objc_msgSend(v12, "addObject:");
  uint64_t v18 = [MEMORY[0x263F5E108] latestVersion];
  v51 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K.%K >= %lu", @"additionalAttributes", @"sceneAnalysisVersion", v18);
  objc_msgSend(v12, "addObject:");
  v50 = (void *)[objc_alloc(MEMORY[0x263F5E108]) initWithSceneAnalysisVersion:v18];
  double v19 = [v50 minimumWallpaperScoreNode];
  [v19 operatingPoint];
  float v21 = v20;

  v49 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K.%K > %f", @"mediaAnalysisAttributes", @"wallpaperScore", v21);
  objc_msgSend(v12, "addObject:");
  uint64_t v22 = [v60 librarySpecificFetchOptions];
  double v23 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v12];
  [v22 setInternalPredicate:v23];

  uint64_t v66 = *MEMORY[0x263F15028];
  os_signpost_id_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
  [v22 setFetchPropertySets:v24];

  [v22 setSuppressSlowFetchReports:1];
  double v25 = [MEMORY[0x263F14D18] fetchAssetsWithOptions:v22];
  double v26 = v11;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    int v27 = [v25 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v63) = v27;
    _os_log_impl(&dword_25934C000, v26, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] Found %d highlight summary assets", buf, 8u);
  }

  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F5DF58]) initWithSeed:a5];
  id v29 = objc_alloc(MEMORY[0x263EFF980]);
  double v30 = [v25 fetchedObjectIDs];
  uint64_t v31 = (void *)[v29 initWithArray:v30];

  PFMutableArrayShuffleWithRandomNumberGenerator();
  unint64_t v32 = [v31 count];
  if (v32 >= a4) {
    unint64_t v33 = a4;
  }
  else {
    unint64_t v33 = v32;
  }
  int v34 = objc_msgSend(v31, "subarrayWithRange:", 0, v33);
  id v35 = objc_alloc(MEMORY[0x263F14E58]);
  uint64_t v36 = *MEMORY[0x263F15090];
  double v37 = [v25 fetchPropertySets];
  double v38 = (void *)[v35 initWithOids:v34 photoLibrary:v60 fetchType:v36 fetchPropertySets:v37 identifier:0 registerIfNeeded:0];

  os_signpost_id_t v39 = v26;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    int v40 = [v38 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v63) = v40;
    _os_log_impl(&dword_25934C000, v39, OS_LOG_TYPE_INFO, "[PNAmbientSuggestionUtilities] Return %d assets", buf, 8u);
  }

  uint64_t v41 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  double v44 = v39;
  int v45 = v44;
  if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_25934C000, v45, OS_SIGNPOST_INTERVAL_END, spid, "FetchHighlightAssets", "", buf, 2u);
  }

  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint32_t v63 = "FetchHighlightAssets";
    __int16 v64 = 2048;
    double v65 = (float)((float)((float)((float)(v41 - v48) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_25934C000, v45, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v38;
}

+ (int64_t)assetIsEligibleForDisplay:(id)a3 modelSet:(id)a4
{
  id v6 = a3;
  double v7 = (PNAssetSafeForDisplayModelSet *)a4;
  if (!v7)
  {
    double v8 = [v6 sceneAnalysisProperties];
    uint64_t v9 = [v8 sceneAnalysisVersion];

    double v7 = [[PNAssetSafeForDisplayModelSet alloc] initWithSceneAnalysisVersion:v9];
  }
  if (+[PNAssetCurationUtilities assetIsSafeForDisplay:v6 modelSet:v7])
  {
    if ([a1 _hasAcceptableCropScoreWithAsset:v6]) {
      int64_t v10 = 0;
    }
    else {
      int64_t v10 = 2;
    }
  }
  else
  {
    int64_t v10 = 1;
  }

  return v10;
}

+ (int64_t)suggestionIsEligibleForDisplay:(id)a3 asset:(id)a4 modelSet:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = (PNAssetSafeForDisplayModelSet *)a5;
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = [MEMORY[0x263F14F50] allFeaturedStateEnabledSuggestionTypesForWidget];
  [v11 addObjectsFromArray:v12];

  [v11 addObject:&unk_27076A350];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v8, "type"));
  int v14 = [v11 containsObject:v13];

  if (v14)
  {
    if ([v8 subtype] == 502 || objc_msgSend(v8, "type") == 8) {
      goto LABEL_15;
    }
    if (!v10)
    {
      uint64_t v15 = [v9 sceneAnalysisProperties];
      uint64_t v16 = [v15 sceneAnalysisVersion];

      int64_t v10 = [[PNAssetSafeForDisplayModelSet alloc] initWithSceneAnalysisVersion:v16];
    }
    if (+[PNAssetCurationUtilities assetIsSafeForDisplay:v9 modelSet:v10])
    {
LABEL_15:
      if ([a1 _hasAcceptableCropScoreWithAsset:v9]) {
        int64_t v17 = 0;
      }
      else {
        int64_t v17 = 2;
      }
    }
    else
    {
      int64_t v17 = 1;
    }
  }
  else
  {
    int64_t v17 = 0;
  }

  return v17;
}

@end