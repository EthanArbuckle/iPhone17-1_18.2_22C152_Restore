@interface PGDefaultEnrichmentProfile
+ (double)evaluatedDurationsWithAssets:(id)a3 options:(id)a4;
+ (double)evaluatedDurationsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 options:(id)a5;
+ (double)targetCurationDurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 options:(id)a5;
+ (double)targetCurationDurationWithPrivateAssets:(id)a3 sharedAssets:(id)a4 sharingFilter:(unsigned __int16)a5 options:(id)a6;
+ (unint64_t)durationForSummary;
- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4;
- (BOOL)canUseLocationInformationWithHighlightInfo:(id)a3 graph:(id)a4;
- (BOOL)collectsDebugInfo;
- (NSDictionary)debugInfos;
- (NSString)identifier;
- (PGCurationManager)curationManager;
- (PGCurationOptions)curationOptions;
- (PGDefaultEnrichmentProfile)initWithCurationManager:(id)a3 loggingConnection:(id)a4;
- (PGDejunkerDeduperOptions)extendedCurationOptions;
- (PGKeyAssetCurationOptions)keyAssetCurationOptions;
- (double)promotionScoreWithHighlightInfo:(id)a3;
- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4;
- (id)debugInfoDictionaryByAddingItemInfosToDebugInfo:(id)a3;
- (id)extendedCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5;
- (id)faceInfosWithAsset:(id)a3;
- (id)highlightInfoWithHighlight:(id)a3 graph:(id)a4 highlightTailorContext:(id)a5;
- (id)keyAssetCurationCriteriaWithHighlightInfo:(id)a3 graph:(id)a4;
- (id)keyAssetWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 graph:(id)a5 progressBlock:(id)a6;
- (id)momentProcessedLocationByMomentUUIDWithHighlightInfo:(id)a3 graph:(id)a4;
- (id)momentTitleByMomentUUIDWithHighlightInfo:(id)a3;
- (id)summaryCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5;
- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8;
- (unsigned)targetEnrichmentState;
- (void)setCollectsDebugInfo:(BOOL)a3;
- (void)setExtendedCurationOptions:(id)a3;
@end

@implementation PGDefaultEnrichmentProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedCurationOptions, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_debugInfos, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (void)setExtendedCurationOptions:(id)a3
{
}

- (PGDejunkerDeduperOptions)extendedCurationOptions
{
  return self->_extendedCurationOptions;
}

- (NSDictionary)debugInfos
{
  return &self->_debugInfos->super;
}

- (void)setCollectsDebugInfo:(BOOL)a3
{
  self->_collectsDebugInfo = a3;
}

- (BOOL)collectsDebugInfo
{
  return self->_collectsDebugInfo;
}

- (PGCurationManager)curationManager
{
  return self->_curationManager;
}

- (id)faceInfosWithAsset:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(PGCurationManager *)self->_curationManager photoLibrary];
  v7 = [v6 librarySpecificFetchOptions];

  v38[0] = *MEMORY[0x1E4F39608];
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  [v7 setFetchPropertySets:v8];

  v26 = v5;
  v9 = [MEMORY[0x1E4F39050] fetchFacesInAsset:v5 options:v7];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v9;
  uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v12 = [v11 faceClusteringProperties];
        v13 = [v12 faceprint];

        v35[0] = @"personLocalIdentifier";
        uint64_t v14 = [v11 personLocalIdentifier];
        v15 = (void *)v14;
        v16 = @"unknown";
        if (v14) {
          v16 = (__CFString *)v14;
        }
        v36[0] = v16;
        v35[1] = @"size";
        v17 = NSNumber;
        [v11 size];
        v18 = objc_msgSend(v17, "numberWithDouble:");
        v36[1] = v18;
        v35[2] = @"quality";
        v19 = NSNumber;
        [v11 quality];
        v20 = objc_msgSend(v19, "numberWithDouble:");
        v36[2] = v20;
        v35[3] = @"faceprint";
        v21 = [v13 faceprintData];
        v22 = v21;
        if (!v21)
        {
          v3 = [MEMORY[0x1E4F1C9B8] data];
          v22 = v3;
        }
        v36[3] = v22;
        v35[4] = @"faceprintVersion";
        v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "faceprintVersion"));
        v36[4] = v23;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:5];

        if (!v21) {
        [v29 addObject:v24];
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v30);
  }

  return v29;
}

- (id)debugInfoDictionaryByAddingItemInfosToDebugInfo:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F8E778];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__PGDefaultEnrichmentProfile_debugInfoDictionaryByAddingItemInfosToDebugInfo___block_invoke;
  v10[3] = &unk_1E68E9948;
  id v11 = v6;
  v12 = self;
  id v7 = v6;
  v8 = [v5 dictionaryRepresentationWithAppendExtraItemInfoBlock:v10];

  return v8;
}

void __78__PGDefaultEnrichmentProfile_debugInfoDictionaryByAddingItemInfosToDebugInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = NSNumber;
  [v5 curationScore];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [v6 setObject:v8 forKeyedSubscript:@"persistedCurationScore"];

  v9 = [v5 creationDate];
  [v6 setObject:v9 forKeyedSubscript:@"creationDate"];

  v10 = [v5 localCreationDate];
  [v6 setObject:v10 forKeyedSubscript:@"localCreationDate"];

  id v11 = [v5 location];
  v12 = v11;
  if (v11)
  {
    [v11 coordinate];
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1E750];
    double v16 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  v67.latitude = v14;
  v67.longitude = v16;
  if (CLLocationCoordinate2DIsValid(v67))
  {
    v65[0] = @"latitude";
    v17 = [NSNumber numberWithDouble:v14];
    v65[1] = @"longitude";
    v66[0] = v17;
    v18 = [NSNumber numberWithDouble:v16];
    v66[1] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
    [v6 setObject:v19 forKeyedSubscript:@"location"];
  }
  else
  {
    [v6 setObject:&unk_1F28D59C8 forKeyedSubscript:@"location"];
  }
  v20 = [v5 clsSceneprint];
  if (v20)
  {
    uint64_t v64 = 0;
    v21 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v20 requiringSecureCoding:1 error:&v64];
    [v6 setObject:v21 forKeyedSubscript:@"sceneprint"];
  }
  v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInterestingVideo"));
  [v6 setObject:v22 forKeyedSubscript:@"isInterestingVideo"];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInterestingLivePhoto"));
  [v6 setObject:v23 forKeyedSubscript:@"isInterestingLivePhoto"];

  v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInterestingPanorama"));
  [v6 setObject:v24 forKeyedSubscript:@"isInterestingPanorama"];

  v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInterestingSDOF"));
  [v6 setObject:v25 forKeyedSubscript:@"isInterestingSDOF"];

  v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInterestingHDR"));
  [v6 setObject:v26 forKeyedSubscript:@"isInterestingHDR"];

  v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsHasInterestingAudioClassification"));
  [v6 setObject:v27 forKeyedSubscript:@"hasInterestingAudioClassification"];

  uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsHasCustomPlaybackVariation"));
  [v6 setObject:v28 forKeyedSubscript:@"hasCustomPlaybackVariation"];

  id v29 = NSNumber;
  [v5 clsSharpnessScore];
  uint64_t v30 = objc_msgSend(v29, "numberWithDouble:");
  [v6 setObject:v30 forKeyedSubscript:@"sharpnessScore"];

  long long v31 = NSNumber;
  [v5 clsExposureScore];
  long long v32 = objc_msgSend(v31, "numberWithDouble:");
  [v6 setObject:v32 forKeyedSubscript:@"exposureScore"];

  long long v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsBlurry"));
  [v6 setObject:v33 forKeyedSubscript:@"isBlurry"];

  long long v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInhabited"));
  [v6 setObject:v34 forKeyedSubscript:@"isInhabited"];

  v35 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsHasInterestingScenes"));
  [v6 setObject:v35 forKeyedSubscript:@"hasInterestingScenes"];

  v36 = [v5 clsPersonLocalIdentifiers];
  [v6 setObject:v36 forKeyedSubscript:@"peopleNames"];

  v37 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isVideo"));
  [v6 setObject:v37 forKeyedSubscript:@"isVideo"];

  v38 = +[PGCurationManager sceneInfoWithAsset:v5 curationSession:*(void *)(a1 + 32)];
  [v6 setObject:v38 forKeyedSubscript:@"scenes"];

  v39 = NSNumber;
  [v5 clsBehavioralScore];
  v40 = objc_msgSend(v39, "numberWithFloat:");
  [v6 setObject:v40 forKeyedSubscript:@"behavioralScore"];

  v41 = NSNumber;
  [v5 clsInteractionScore];
  v42 = objc_msgSend(v41, "numberWithFloat:");
  [v6 setObject:v42 forKeyedSubscript:@"interactionScore"];

  v43 = NSNumber;
  [v5 clsHighlightVisibilityScore];
  v44 = objc_msgSend(v43, "numberWithDouble:");
  [v6 setObject:v44 forKeyedSubscript:@"highlightVisibilityScore"];

  v45 = NSNumber;
  [v5 clsAutoplaySuggestionScore];
  v46 = objc_msgSend(v45, "numberWithDouble:");
  [v6 setObject:v46 forKeyedSubscript:@"autoplaySuggestionScore"];

  v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isShinyGem"));
  [v6 setObject:v47 forKeyedSubscript:@"isShinyGem"];

  v48 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isRegularGem"));
  [v6 setObject:v48 forKeyedSubscript:@"isRegularGem"];

  v49 = NSNumber;
  [v5 clsFaceScore];
  v50 = objc_msgSend(v49, "numberWithDouble:");
  [v6 setObject:v50 forKeyedSubscript:@"faceScore"];

  v51 = [*(id *)(a1 + 40) faceInfosWithAsset:v5];
  [v6 setObject:v51 forKeyedSubscript:@"faceInfos"];

  v52 = NSNumber;
  [v5 clsDuration];
  v53 = objc_msgSend(v52, "numberWithDouble:");
  [v6 setObject:v53 forKeyedSubscript:@"duration"];

  v54 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsNonMemorable"));
  [v6 setObject:v54 forKeyedSubscript:@"isNonMemorable"];

  v55 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsLoopOrBounce"));
  [v6 setObject:v55 forKeyedSubscript:@"isLoopOrBounce"];

  v56 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsLongExposure"));
  [v6 setObject:v56 forKeyedSubscript:@"isLongExposure"];

  v57 = NSNumber;
  objc_msgSend(v5, "pl_gpsHorizontalAccuracy");
  v58 = objc_msgSend(v57, "numberWithDouble:");
  [v6 setObject:v58 forKeyedSubscript:@"gpsHorizontalAccuracy"];

  v59 = NSNumber;
  [v5 clsSquareCropScore];
  v60 = objc_msgSend(v59, "numberWithDouble:");
  [v6 setObject:v60 forKeyedSubscript:@"squareCropScore"];

  v61 = [v5 clsFaceInformationSummary];
  v62 = [v61 dictionaryRepresentation];
  [v6 setObject:v62 forKeyedSubscript:@"faceInformationSummary"];

  v63 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "clsIsInSharedLibrary"));
  [v6 setObject:v63 forKeyedSubscript:@"isInSharedLibrary"];
}

- (id)summaryCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2020000000;
  char v103 = 0;
  uint64_t v96 = 0;
  v97 = (double *)&v96;
  uint64_t v98 = 0x2020000000;
  uint64_t v99 = 0;
  v70 = _Block_copy(v8);
  v71 = v7;
  v65 = v8;
  if (v70
    && (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v97[3] >= 0.01)
    && (v97[3] = v9,
        char v95 = 0,
        (*((void (**)(void *, char *, double))v70 + 2))(v70, &v95, 0.0),
        char v10 = *((unsigned char *)v101 + 24) | v95,
        (*((unsigned char *)v101 + 24) = v10) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v108 = 486;
      __int16 v109 = 2080;
      v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/En"
             "richment Profile/PGDefaultEnrichmentProfile.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v69 = [v7 feeder];
    v12 = [v7 highlightTailorContext];
    double v13 = [v12 curationContext];

    double v14 = [v69 allItems];
    double v15 = [v71 highlightTailorContext];
    [v15 topTierAestheticScore];
    double v16 = +[PGMemoryGenerationHelper scoringContextForMemoriesWithAssets:withTopTierAestheticScore:](PGMemoryGenerationHelper, "scoringContextForMemoriesWithAssets:withTopTierAestheticScore:", v14);

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v18 = v14;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v91 objects:v106 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v92 != v20) {
            objc_enumerationMutation(v18);
          }
          v22 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          if ([v22 prepareWithAlternateJunkingHeuristics:1 withContext:v16 curationContext:v13])objc_msgSend(v17, "addObject:", v22); {
        }
          }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v91 objects:v106 count:16];
      }
      while (v19);
    }

    v23 = [(PGDefaultEnrichmentProfile *)self curationOptionsWithHighlightInfo:v71 sharingFilter:v6];
    [v23 setDuration:21];
    v72 = v23;
    id v24 = [[PGDejunkerDeduperOptions alloc] initForMemories];
    [v24 setUseAllPersonsForDeduping:1];
    v25 = [v23 uuidsOfRequiredAssets];
    [v24 setIdentifiersOfRequiredItems:v25];

    v26 = [v72 uuidsOfEligibleAssets];
    [v24 setIdentifiersOfEligibleItems:v26];

    v27 = [[PGDejunkerDeduper_PHAsset alloc] initWithSimilarityModelClass:objc_opt_class()];
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __91__PGDefaultEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke;
    v86[3] = &unk_1E68F03F8;
    id v63 = v70;
    id v87 = v63;
    v88 = &v96;
    v89 = &v100;
    uint64_t v90 = 0x3F847AE147AE147BLL;
    uint64_t v28 = [(PGDejunkerDeduper_PHAsset *)v27 dejunkedDedupedAssetsInAssets:v18 options:v24 debugInfo:0 progressBlock:v86];
    id v29 = v28;
    int v30 = *((unsigned __int8 *)v101 + 24);
    if (*((unsigned char *)v101 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v108 = 515;
        __int16 v109 = 2080;
        v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/"
               "Enrichment Profile/PGDefaultEnrichmentProfile.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      long long v31 = (void *)MEMORY[0x1E4F1CAD0];
      long long v32 = [v28 valueForKey:@"uuid"];
      long long v33 = [v31 setWithArray:v32];
      [v72 setUuidsOfEligibleAssets:v33];
    }
    if (v30)
    {
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      long long v34 = self;
      v35 = objc_alloc_init(PGCurator_PHAsset);
      [(PGCurator *)v35 setLoggingConnection:self->_loggingConnection];
      if (self->_collectsDebugInfo)
      {
        id v36 = objc_alloc(MEMORY[0x1E4F76C78]);
        v37 = [v69 allItems];
        v38 = (void *)[v36 initWithItems:v37];

        long long v34 = self;
      }
      else
      {
        v38 = 0;
      }
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __91__PGDefaultEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke_343;
      v81[3] = &unk_1E68F03F8;
      id v39 = v63;
      id v82 = v39;
      v83 = &v96;
      v84 = &v100;
      uint64_t v85 = 0x3F847AE147AE147BLL;
      v40 = [(PGCurator_PHAsset *)v35 bestAssetsForFeeder:v69 options:v72 debugInfo:v38 progressBlock:v81];
      if (*((unsigned char *)v101 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v108 = 527;
          __int16 v109 = 2080;
          v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enric"
                 "h/Enrichment Profile/PGDefaultEnrichmentProfile.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v11 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        if (v34->_collectsDebugInfo)
        {
          v41 = [(PGDefaultEnrichmentProfile *)v34 debugInfoDictionaryByAddingItemInfosToDebugInfo:v38];
          v42 = (void *)[v41 mutableCopy];

          v43 = [v72 dictionaryRepresentation];
          [v42 setObject:v43 forKeyedSubscript:@"curationOptions"];

          [(NSMutableDictionary *)self->_debugInfos setObject:v42 forKeyedSubscript:@"curation"];
        }
        v62 = (void (**)(id, unsigned char *, double))v39;
        uint64_t v64 = v40;
        if (v40 && [v40 count])
        {
          uint64_t v44 = [v40 count];
          v45 = [v72 uuidsOfRequiredAssets];
          BOOL v46 = v44 == [v45 count];

          v47 = v64;
          if (v46)
          {
            long long v79 = 0u;
            long long v80 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            id v48 = v64;
            uint64_t v49 = [v48 countByEnumeratingWithState:&v77 objects:v105 count:16];
            if (v49)
            {
              CLLocationCoordinate2D v67 = v38;
              uint64_t v50 = *(void *)v78;
              v47 = (void *)MEMORY[0x1E4F1CBF0];
              while (2)
              {
                for (uint64_t j = 0; j != v49; ++j)
                {
                  if (*(void *)v78 != v50) {
                    objc_enumerationMutation(v48);
                  }
                  if ((objc_msgSend(*(id *)(*((void *)&v77 + 1) + 8 * j), "clsIsUtility", v62) & 1) == 0)
                  {
                    v47 = v48;
                    goto LABEL_45;
                  }
                }
                uint64_t v49 = [v48 countByEnumeratingWithState:&v77 objects:v105 count:16];
                if (v49) {
                  continue;
                }
                break;
              }
LABEL_45:
              v38 = v67;
            }
            else
            {
              v47 = (void *)MEMORY[0x1E4F1CBF0];
            }
          }
          id v52 = v47;
        }
        else
        {
          id v52 = (id)MEMORY[0x1E4F1CBF0];
        }
        v68 = v52;
        v53 = v38;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v54 = v17;
        uint64_t v55 = [v54 countByEnumeratingWithState:&v73 objects:v104 count:16];
        if (v55)
        {
          uint64_t v56 = *(void *)v74;
          do
          {
            for (uint64_t k = 0; k != v55; ++k)
            {
              if (*(void *)v74 != v56) {
                objc_enumerationMutation(v54);
              }
              objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * k), "prepareWithAlternateJunkingHeuristics:withContext:curationContext:", 0, v16, v13, v62);
            }
            uint64_t v55 = [v54 countByEnumeratingWithState:&v73 objects:v104 count:16];
          }
          while (v55);
        }

        v38 = v53;
        if (v70
          && (double Current = CFAbsoluteTimeGetCurrent(), Current - v97[3] >= 0.01)
          && (v97[3] = Current,
              char v95 = 0,
              v62[2](v62, &v95, 1.0),
              char v59 = *((unsigned char *)v101 + 24) | v95,
              (*((unsigned char *)v101 + 24) = v59) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v108 = 557;
            __int16 v109 = 2080;
            v110 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enr"
                   "ich/Enrichment Profile/PGDefaultEnrichmentProfile.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v11 = (id)MEMORY[0x1E4F1CBF0];
          v60 = v68;
        }
        else
        {
          v60 = v68;
          id v11 = v68;
        }

        v40 = v64;
      }
    }
  }
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);

  return v11;
}

void __91__PGDefaultEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __91__PGDefaultEnrichmentProfile_summaryCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke_343(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)extendedCurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 progressBlock:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v32 = a5;
  double v9 = _Block_copy(v32);
  uint64_t v45 = 0;
  BOOL v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v41 = 0;
  v42 = (double *)&v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  if (!v9
    || (double v10 = CFAbsoluteTimeGetCurrent(), v10 - v42[3] < 0.01)
    || (v42[3] = v10,
        char v40 = 0,
        (*((void (**)(void *, char *, double))v9 + 2))(v9, &v40, 0.0),
        char v11 = *((unsigned char *)v46 + 24) | v40,
        (*((unsigned char *)v46 + 24) = v11) == 0))
  {
    long long v34 = objc_msgSend(v8, "feeder", v32);
    if (self->_collectsDebugInfo)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F76C78]);
      double v14 = [v34 allItems];
      long long v33 = (void *)[v13 initWithItems:v14];
    }
    else
    {
      long long v33 = 0;
    }
    id v15 = [(PGDefaultEnrichmentProfile *)self extendedCurationOptions];
    if (!v15)
    {
      id v15 = [[PGDejunkerDeduperOptions alloc] initForCuratedLibrary];
      double v16 = [v8 uuidsOfRequiredAssetsForSharingFilter:v6];
      if ([v16 count]) {
        [v15 setIdentifiersOfRequiredItems:v16];
      }
    }
    id v17 = [[PGDejunkerDeduper_PHAsset alloc] initWithSimilarityModelClass:objc_opt_class()];
    [(PGDejunkerDeduper *)v17 setLoggingConnection:self->_loggingConnection];
    id v18 = [v34 allItems];
    uint64_t v19 = [v8 highlight];
    uint64_t v20 = +[PGHighlightEnrichmentUtilities filteredAssetsInAssets:withSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredAssetsInAssets:withSharingComposition:forSharingFilter:", v18, [v19 sharingComposition], v6);

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __92__PGDefaultEnrichmentProfile_extendedCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke;
    v35[3] = &unk_1E68F03F8;
    id v21 = v9;
    id v36 = v21;
    v37 = &v41;
    v38 = &v45;
    uint64_t v39 = 0x3F847AE147AE147BLL;
    v22 = [(PGDejunkerDeduper_PHAsset *)v17 dejunkedDedupedAssetsInAssets:v20 options:v15 debugInfo:v33 progressBlock:v35];
    id v23 = v22;
    if (*((unsigned char *)v46 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v50 = 464;
        __int16 v51 = 2080;
        id v52 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/E"
              "nrichment Profile/PGDefaultEnrichmentProfile.m";
        id v24 = MEMORY[0x1E4F14500];
LABEL_17:
        _os_log_impl(&dword_1D1805000, v24, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (![v22 count])
      {
        id v25 = v20;

        id v23 = v25;
      }
      if (self->_collectsDebugInfo)
      {
        v26 = [(PGDefaultEnrichmentProfile *)self debugInfoDictionaryByAddingItemInfosToDebugInfo:v33];
        v27 = (void *)[v26 mutableCopy];

        uint64_t v28 = [v15 dictionaryRepresentationRestrictingToGlobalOptions:0];
        [v27 setObject:v28 forKeyedSubscript:@"curationOptions"];

        [(NSMutableDictionary *)self->_debugInfos setObject:v27 forKeyedSubscript:@"extended"];
      }
      if (!v9
        || (double Current = CFAbsoluteTimeGetCurrent(), Current - v42[3] < 0.01)
        || (v42[3] = Current,
            char v40 = 0,
            (*((void (**)(id, char *, double))v21 + 2))(v21, &v40, 1.0),
            char v30 = *((unsigned char *)v46 + 24) | v40,
            (*((unsigned char *)v46 + 24) = v30) == 0))
      {
        id v23 = v23;
        v12 = v23;
        goto LABEL_29;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v50 = 478;
        __int16 v51 = 2080;
        id v52 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/E"
              "nrichment Profile/PGDefaultEnrichmentProfile.m";
        id v24 = MEMORY[0x1E4F14500];
        goto LABEL_17;
      }
    }
    v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_29:

    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v50 = 440;
    __int16 v51 = 2080;
    id v52 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/Enric"
          "hment Profile/PGDefaultEnrichmentProfile.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_30:
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  return v12;
}

void __92__PGDefaultEnrichmentProfile_extendedCurationWithHighlightInfo_sharingFilter_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(PGDefaultEnrichmentProfile *)self curationOptions];
  [v6 promotionScore];
  if (v8 == -1.0) {
    [(PGDefaultEnrichmentProfile *)self promotionScoreWithHighlightInfo:v6];
  }
  if (v8 > 0.4)
  {
    uint64_t v9 = [(id)objc_opt_class() durationForSummary];
    double v10 = v7;
LABEL_7:
    [v10 setDuration:v9];
    goto LABEL_8;
  }
  if (v8 == 0.4)
  {
    double v10 = v7;
    uint64_t v9 = 12;
    goto LABEL_7;
  }
  if (v8 < 0.4)
  {
    [v7 setDuration:12];
    [v7 setFocusOnInterestingItems:1];
  }
LABEL_8:
  char v11 = [v6 uuidsOfRequiredAssetsForSharingFilter:v4];
  if ([v11 count]) {
    [v7 setUuidsOfRequiredAssets:v11];
  }
  v12 = [v6 uuidsOfEligibleAssets];
  if ([v12 count])
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];
    [v7 setUuidsOfEligibleAssets:v13];
  }
  [v7 setSharingFilter:v4];
  [v7 setUseDurationBasedCuration:1];
  [v7 setMinimumDuration:0.0];
  [(id)objc_opt_class() targetCurationDurationWithHighlightInfo:v6 sharingFilter:v4 options:v7];
  objc_msgSend(v7, "setTargetDuration:");
  [v7 setFailIfMinimumDurationNotReached:0];

  return v7;
}

- (id)keyAssetWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 graph:(id)a5 progressBlock:(id)a6
{
  uint64_t v8 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v34 = a5;
  id v33 = a6;
  char v11 = _Block_copy(v33);
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = (double *)&v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  if (v11
    && (double v12 = CFAbsoluteTimeGetCurrent(), v12 - v45[3] >= 0.01)
    && (v45[3] = v12,
        char v43 = 0,
        (*((void (**)(void *, char *, double))v11 + 2))(v11, &v43, 0.0),
        char v13 = *((unsigned char *)v49 + 24) | v43,
        (*((unsigned char *)v49 + 24) = v13) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v53 = 293;
      __int16 v54 = 2080;
      uint64_t v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich/Enr"
            "ichment Profile/PGDefaultEnrichmentProfile.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    id v14 = 0;
  }
  else
  {
    id v15 = [v10 assetsForSharingFilter:v8];
    if ([v15 count])
    {
      double v16 = [(PGDefaultEnrichmentProfile *)self keyAssetCurationOptions];
      id v32 = [(PGDefaultEnrichmentProfile *)self keyAssetCurationCriteriaWithHighlightInfo:v10 graph:v34];
      id v17 = [v10 highlight];
      BOOL v18 = [v17 type] == 5;

      if (v18)
      {
        BOOL v19 = +[PGUserDefaults useIconicScoreForTrips];
        [v16 setUseIconicScore:v19];
        [v16 setAvoidPromotingAutoplayableItemsWhenUsingIconicScore:v19];
      }
      if (self->_collectsDebugInfo) {
        uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F76C78]) initWithItems:v15];
      }
      else {
        uint64_t v20 = 0;
      }
      id v21 = [PGKeyCurator_PHAsset alloc];
      v22 = [(PGCurationManager *)self->_curationManager curationCriteriaFactory];
      long long v31 = [(PGKeyCurator *)v21 initWithCurationCriteriaFactory:v22];

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __90__PGDefaultEnrichmentProfile_keyAssetWithHighlightInfo_sharingFilter_graph_progressBlock___block_invoke;
      void v38[3] = &unk_1E68F03F8;
      id v23 = v11;
      id v39 = v23;
      char v40 = &v44;
      uint64_t v41 = &v48;
      uint64_t v42 = 0x3F847AE147AE147BLL;
      id v24 = [(PGKeyCurator_PHAsset *)v31 keyAssetInAssets:v15 options:v16 criteria:v32 debugInfo:v20 progressBlock:v38];
      if (v20)
      {
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __90__PGDefaultEnrichmentProfile_keyAssetWithHighlightInfo_sharingFilter_graph_progressBlock___block_invoke_2;
        v35[3] = &unk_1E68E9948;
        id v36 = v32;
        id v37 = v34;
        id v25 = [v20 dictionaryRepresentationWithAppendExtraItemInfoBlock:v35];
        v26 = (void *)[v25 mutableCopy];

        v27 = [v16 dictionaryRepresentation];
        [v26 setObject:v27 forKeyedSubscript:@"curationOptions"];

        [(NSMutableDictionary *)self->_debugInfos setObject:v26 forKeyedSubscript:@"keyAsset"];
      }
      if (v11
        && (double Current = CFAbsoluteTimeGetCurrent(), Current - v45[3] >= 0.01)
        && (v45[3] = Current,
            char v43 = 0,
            (*((void (**)(id, char *, double))v23 + 2))(v23, &v43, 1.0),
            char v29 = *((unsigned char *)v49 + 24) | v43,
            (*((unsigned char *)v49 + 24) = v29) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v53 = 337;
          __int16 v54 = 2080;
          uint64_t v55 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Enrich"
                "/Enrichment Profile/PGDefaultEnrichmentProfile.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v14 = 0;
      }
      else
      {
        id v14 = v24;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v14;
}

void __90__PGDefaultEnrichmentProfile_keyAssetWithHighlightInfo_sharingFilter_graph_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __90__PGDefaultEnrichmentProfile_keyAssetWithHighlightInfo_sharingFilter_graph_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v12 = 0;
    double v13 = 0.0;
    uint64_t v8 = [v7 passesForItem:v5 score:&v13 graph:*(void *)(a1 + 40) reasonString:&v12];
    id v9 = v12;
    id v10 = [NSNumber numberWithBool:v8];
    [v6 setObject:v10 forKeyedSubscript:@"passesCriteria"];

    if (v8)
    {
      char v11 = [NSNumber numberWithDouble:v13];
      [v6 setObject:v11 forKeyedSubscript:@"criteriaScore"];
    }
    [v6 setObject:v9 forKeyedSubscript:@"criteriaReason"];
  }
}

- (double)promotionScoreWithHighlightInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 highlightNode];
  uint64_t v6 = [(PGDefaultEnrichmentProfile *)self targetEnrichmentState];
  uint64_t v7 = [v4 numberOfExtendedAssets];
  uint64_t v8 = [v4 highlightTailorContext];

  id v9 = [v8 neighborScoreComputer];
  +[PGGraphHighlightNode promotionScoreWithHighlightNode:v5 enrichmentState:v6 numberOfExtendedAssets:v7 neighborScoreComputer:v9];
  double v11 = v10;

  return v11;
}

- (id)momentProcessedLocationByMomentUUIDWithHighlightInfo:(id)a3 graph:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [PGGraphMomentNodeCollection alloc];
  uint64_t v8 = [v5 momentNodes];
  id v9 = [(MAElementCollection *)v7 initWithSet:v8 graph:v6];

  double v10 = (void *)MEMORY[0x1E4F71E88];
  double v11 = +[PGGraphMomentNode poiOfMoment];
  id v12 = [v10 adjacencyWithSources:v9 relation:v11 targetsClass:objc_opt_class()];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __89__PGDefaultEnrichmentProfile_momentProcessedLocationByMomentUUIDWithHighlightInfo_graph___block_invoke;
  v31[3] = &unk_1E68E4EC8;
  id v14 = v13;
  id v32 = v14;
  [v12 enumerateTargetsBySourceWithBlock:v31];
  if ([v14 count])
  {
    id v25 = v9;
    id v26 = v6;
    id v15 = [v5 momentFetchResult];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v21 = [v20 uuid];
          v22 = [v14 objectForKeyedSubscript:v21];

          if (v22 && [v20 processedLocation] != 6) {
            [v14 removeObjectForKey:v21];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v17);
    }
    if ([v14 count]) {
      id v23 = v14;
    }
    else {
      id v23 = 0;
    }
    id v9 = v25;
    id v6 = v26;
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

void __89__PGDefaultEnrichmentProfile_momentProcessedLocationByMomentUUIDWithHighlightInfo_graph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = [a3 labels];
  int v6 = [v5 containsObject:@"Travel"];

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v10 uuids];
    id v9 = [v8 anyObject];
    [v7 setObject:&unk_1F28D0648 forKeyedSubscript:v9];
  }
}

- (id)momentTitleByMomentUUIDWithHighlightInfo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 momentNodes];
  id v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v20 = v3;
  id v5 = [v3 highlightTailorContext];
  int v6 = [v5 titleGenerationContext];

  id v23 = v6;
  uint64_t v7 = [v6 locationHelper];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v4;
  uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v25)
  {
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v28 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v9 = [[PGTitleGenerator alloc] initWithMomentNode:v28 type:0 titleGenerationContext:v23];
        [(PGTitleGenerator *)v9 setPreferredTitleType:2];
        [(PGTitleGenerator *)v9 setLineBreakBehavior:2];
        long long v27 = [(PGTitleGenerator *)v9 title];
        id v26 = [(PGTitleGenerator *)v9 subtitle];
        id v10 = [MEMORY[0x1E4F1CA48] array];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        double v11 = [(PGTitleGenerator *)v9 usedLocationNodes];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v30;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:*(void *)(*((void *)&v29 + 1) + 8 * j) locationHelper:v7];
              if (v16) {
                [v10 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v13);
        }

        uint64_t v17 = [[PGTitleTuple alloc] initWithWithTitle:v27 subtitle:v26 locationNames:v10];
        uint64_t v18 = [v28 uuid];
        [v24 setObject:v17 forKeyedSubscript:v18];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }

  return v24;
}

- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = [v14 highlightNode];
  uint64_t v18 = +[PGHighlightEnrichmentUtilities filteredMomentNodesWithHighlightNode:v17 forSharingFilter:v12];
  if ([v18 count])
  {
    if (!_os_feature_enabled_impl() || v9)
    {
      if (v9)
      {
        long long v29 = [PGHighlightTitleGenerator alloc];
        long long v30 = [v14 highlightNode];
        long long v31 = [v14 highlightTailorContext];
        long long v32 = [v31 titleGenerationContext];
        BOOL v19 = [(PGHighlightTitleGenerator *)v29 initWithCollection:v30 filteredMomentNodes:v18 curatedAssetCollection:0 keyAsset:0 createVerboseTitle:1 titleGenerationContext:v32];
      }
      else
      {
        long long v30 = +[PGHighlightEnrichmentUtilities filteredAssetsInAssets:withSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredAssetsInAssets:withSharingComposition:forSharingFilter:", v15, [v17 sharingComposition], v12);
        id v37 = v15;
        if ([v30 count])
        {
          long long v31 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v30 title:0];
        }
        else
        {
          long long v31 = 0;
        }
        long long v33 = [PGHighlightTitleGenerator alloc];
        long long v32 = [v14 highlightNode];
        long long v34 = [v14 highlightTailorContext];
        long long v35 = [v34 titleGenerationContext];
        BOOL v19 = [(PGHighlightTitleGenerator *)v33 initWithCollection:v32 filteredMomentNodes:v18 curatedAssetCollection:v31 keyAsset:v16 createVerboseTitle:0 titleGenerationContext:v35];

        id v15 = v37;
      }

      uint64_t v25 = [(PGHighlightTitleGenerator *)v19 titleTuple];
    }
    else
    {
      BOOL v19 = +[PGHighlightEnrichmentUtilities filteredSummarizedFeaturesForHighlightWithInfo:v14 sharingFilter:v12];
      uint64_t v20 = [PGDayHighlightTitleGenerator alloc];
      id v21 = [v14 highlightTailorContext];
      [v21 titleGenerationContext];
      id v23 = v22 = v15;
      id v24 = [(PGDayHighlightTitleGenerator *)v20 initWithSummarizedFeatures:v19 momentNodes:v18 titleGenerationContext:v23 loggingConnection:self->_loggingConnection];

      id v15 = v22;
      uint64_t v25 = [(PGDayHighlightTitleGenerator *)v24 titleTuple];
    }
  }
  else
  {
    if (!a8)
    {
      uint64_t v25 = 0;
      goto LABEL_16;
    }
    id v26 = (void *)MEMORY[0x1E4F28C58];
    long long v27 = NSString;
    PHDescriptionForSharingFilter();
    BOOL v19 = (PGHighlightTitleGenerator *)objc_claimAutoreleasedReturnValue();
    long long v28 = [v27 stringWithFormat:@"No moment nodes for sharing filter %@", v19];
    *a8 = [v26 errorWithDescription:v28];

    uint64_t v25 = 0;
  }

LABEL_16:
  return v25;
}

- (id)highlightInfoWithHighlight:(id)a3 graph:(id)a4 highlightTailorContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[PGHighlightTailorHighlightInfo alloc] initWithHighlight:v9 graph:v8 highlightTailorContext:v7];

  return v10;
}

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  id v4 = a3;
  if (_os_feature_enabled_impl()) {
    LOBYTE(v5) = 1;
  }
  else {
    int v5 = [v4 isRecent] ^ 1;
  }

  return v5;
}

- (id)keyAssetCurationCriteriaWithHighlightInfo:(id)a3 graph:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 highlightNode];
  id v9 = [v6 meaningLabels];
  if ([v9 count])
  {
    uint64_t v50 = self;
    +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v48 = v8;
      id v49 = v7;
      id v13 = 0;
      uint64_t v14 = *(void *)v56;
LABEL_4:
      uint64_t v15 = 0;
      id v16 = v13;
      while (1)
      {
        if (*(void *)v56 != v14) {
          objc_enumerationMutation(v10);
        }
        id v13 = *(id *)(*((void *)&v55 + 1) + 8 * v15);

        if ([v9 containsObject:v13]) {
          break;
        }
        ++v15;
        id v16 = v13;
        if (v12 == v15)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v55 objects:v60 count:16];
          if (v12) {
            goto LABEL_4;
          }

          id v13 = 0;
          uint64_t v17 = 0;
          uint64_t v18 = 0;
          BOOL v19 = v10;
          id v8 = v48;
          id v7 = v49;
          goto LABEL_33;
        }
      }

      if (!v13)
      {
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        id v8 = v48;
        id v7 = v49;
        goto LABEL_39;
      }
      uint64_t v20 = [(PGCurationManager *)v50->_curationManager curationCriteriaFactory];
      id v8 = v48;
      id v7 = v49;
      uint64_t v18 = [v20 curationCriteriaWithCollection:v48 meaningLabel:v13 inGraph:v49 client:0];

      id v21 = [v18 scenesTrait];
      [v21 setTargetNumberOfMatches:3];

      if (!v50->_collectsDebugInfo)
      {
        uint64_t v17 = 0;
        goto LABEL_39;
      }
      BOOL v19 = [NSString stringWithFormat:@"[%@]", v13];
      if ((unint64_t)[v9 count] >= 2)
      {
        uint64_t v46 = v19;
        id v47 = v6;
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v23 = v10;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v52 != v26) {
                objc_enumerationMutation(v23);
              }
              id v28 = *(id *)(*((void *)&v51 + 1) + 8 * i);
              if (v28 != v13
                && [v9 containsObject:*(void *)(*((void *)&v51 + 1) + 8 * i)])
              {
                [v22 addObject:v28];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v51 objects:v59 count:16];
          }
          while (v25);
        }

        long long v29 = [v22 componentsJoinedByString:@") - ("];
        BOOL v19 = [v46 stringByAppendingFormat:@" - (%@)", v29];

        id v6 = v47;
        id v8 = v48;
        id v7 = v49;
      }
      uint64_t v17 = [NSString stringWithFormat:@"Meanings: %@", v19];
    }
    else
    {
      id v13 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      BOOL v19 = v10;
    }
LABEL_33:

LABEL_39:
    self = v50;
    if (v18) {
      goto LABEL_40;
    }
    goto LABEL_42;
  }
  int v30 = [v8 isPartOfTrip];
  long long v31 = [(PGCurationManager *)self->_curationManager curationCriteriaFactory];
  long long v32 = v31;
  if (!v30)
  {
    char v40 = [v6 highlightTailorContext];
    [v40 curationContext];
    v42 = uint64_t v41 = v8;
    uint64_t v18 = [v32 petCurationCriteriaWithCollection:v41 client:0 curationContext:v42];

    id v8 = v41;
LABEL_35:
    uint64_t v17 = 0;
    if (!v18) {
      goto LABEL_42;
    }
    goto LABEL_40;
  }
  uint64_t v18 = [v31 tripCurationCriteriaWithCollection:v8 client:0];

  long long v33 = [v7 infoNode];
  [v33 topTierAestheticScoreForTripKeyAsset];
  double v35 = v34;

  long long v36 = [PGCurationContentOrAestheticScoreTrait alloc];
  id v37 = [(PGCurationContentOrAestheticScoreTrait *)v36 initWithMinimumContentScore:*MEMORY[0x1E4F8E738] minimumAestheticScore:v35];
  [v18 setContentOrAestheticScoreTrait:v37];

  if (!self->_collectsDebugInfo) {
    goto LABEL_35;
  }
  int v38 = [v8 isPartOfShortTrip];
  uint64_t v39 = @"Part of Long Trip";
  if (v38) {
    uint64_t v39 = @"Part of Short Trip";
  }
  uint64_t v17 = v39;
  if (v18)
  {
LABEL_40:
    if (self->_collectsDebugInfo)
    {
      [(NSMutableDictionary *)self->_debugInfos setObject:v17 forKeyedSubscript:@"keyAssetReason"];
      char v43 = [v18 niceDescriptionWithGraph:v7];
      [(NSMutableDictionary *)self->_debugInfos setObject:v43 forKeyedSubscript:@"keyAssetCurationCriteria"];
    }
  }
LABEL_42:
  id v44 = v18;

  return v44;
}

- (PGKeyAssetCurationOptions)keyAssetCurationOptions
{
  v2 = objc_alloc_init(PGKeyAssetCurationOptions);
  [(PGKeyAssetCurationOptions *)v2 setPromoteAutoplayableItems:1];
  return v2;
}

- (PGCurationOptions)curationOptions
{
  v2 = [[PGCurationOptions alloc] initWithDuration:0];
  [(PGCurationOptions *)v2 setLastPassMovieAdditionEnabled:0];
  return v2;
}

- (BOOL)canUseLocationInformationWithHighlightInfo:(id)a3 graph:(id)a4
{
  return +[PGHighlightEnrichmentUtilities canUseLocationInformationWithHighlightInfo:a3 graph:a4];
}

- (unsigned)targetEnrichmentState
{
  return 1;
}

- (NSString)identifier
{
  return (NSString *)@"Default Enrichment Profile";
}

- (PGDefaultEnrichmentProfile)initWithCurationManager:(id)a3 loggingConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGDefaultEnrichmentProfile;
  id v9 = [(PGDefaultEnrichmentProfile *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curationManager, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    debugInfos = v10->_debugInfos;
    v10->_debugInfos = v11;
  }
  return v10;
}

+ (double)evaluatedDurationsWithAssets:(id)a3 options:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = a4;
  id v6 = [v24 uuidsOfEligibleAssets];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    unint64_t v25 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_super v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (v6)
        {
          uint64_t v15 = [*(id *)(*((void *)&v26 + 1) + 8 * i) uuid];
          int v16 = [v6 containsObject:v15];

          if (!v16) {
            continue;
          }
        }
        if ([v14 isVideo])
        {
          ++v10;
        }
        else if ([v14 clsIsInterestingLivePhoto])
        {
          ++v25;
        }
        else
        {
          ++v11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
    unint64_t v25 = 0;
    unint64_t v11 = 0;
  }

  [v24 defaultDurationOfStillPhoto];
  double v18 = v17;
  [v24 defaultDurationOfLivePhoto];
  double v20 = v19;
  [v24 defaultDurationOfVideo];
  double v22 = v21;

  return v20 * (double)v25 + v18 * (double)v11 + v22 * (double)v10;
}

+ (double)evaluatedDurationsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 options:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 assetsForSharingFilter:v5];
  [a1 evaluatedDurationsWithAssets:v9 options:v8];
  double v11 = v10;

  return v11;
}

+ (double)targetCurationDurationWithPrivateAssets:(id)a3 sharedAssets:(id)a4 sharingFilter:(unsigned __int16)a5 options:(id)a6
{
  int v6 = a5;
  id v10 = a6;
  id v11 = a4;
  [a1 evaluatedDurationsWithAssets:a3 options:v10];
  double v13 = v12;
  [a1 evaluatedDurationsWithAssets:v11 options:v10];
  double v15 = v14;

  if (v6) {
    double v16 = v15;
  }
  else {
    double v16 = v13;
  }
  return v16 * 90.0 / (v13 + v15);
}

+ (double)targetCurationDurationWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 options:(id)a5
{
  uint64_t v7 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 highlight];
  int v12 = [v11 sharingComposition];

  if (v12 == 2)
  {
    double v14 = [v9 assetsForSharingFilter:0];
    double v15 = [v9 assetsForSharingFilter:1];
    [a1 targetCurationDurationWithPrivateAssets:v14 sharedAssets:v15 sharingFilter:v7 options:v10];
    double v5 = v16;

    goto LABEL_10;
  }
  if (v12 == 1)
  {
    BOOL v13 = v7 == 0;
  }
  else
  {
    if (v12) {
      goto LABEL_10;
    }
    BOOL v13 = v7 == 1;
  }
  if (v13) {
    double v5 = 0.0;
  }
  else {
    double v5 = 90.0;
  }
LABEL_10:

  return v5;
}

+ (unint64_t)durationForSummary
{
  return 13;
}

@end