@interface PHAUserFeedbackUpdater
+ (id)_memoriesFetchResultWithObjectIDs:(id)a3 existingMemoriesFetchResult:(id)a4;
+ (id)_userFeedbackCalculatorWithPhotoLibrary:(id)a3;
- (BOOL)_deleteWallpaperTopSuggestionsOfPersonsForLocalIdentifiers:(id)a3;
- (BOOL)_demoteFeaturedMemories;
- (BOOL)_neverFeatureMemories:(id)a3 error:(id *)a4;
- (BOOL)_retireAndUnfeatureSuggestions:(id)a3 didUnfeatureSuggestions:(BOOL *)a4;
- (BOOL)_unfeaturePersonMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs:(id)a3;
- (BOOL)_unfeatureSocialGroupMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs:(id)a3;
- (BOOL)updateFeatureContentWithPersonUUIDs:(id)a3 error:(id *)a4;
- (PHAUserFeedbackUpdater)initWithGraphManager:(id)a3;
- (double)_userFeedbackScoreForAssetCollection:(id)a3 assetsFetchResult:(id)a4 keyAsset:(id)a5 personUUIDsByAssetUUID:(id)a6;
- (id)_fetchAssetsWithNegativeFeedbackFrom:(id)a3;
- (id)_notRecommendedMemoriesFromMemories:(id)a3;
- (id)_personUUIDsByAssetUUIDFromAssets:(id)a3;
- (id)_suggestionsToRetire;
- (void)_clearEnrichmentStateOfHighlightsWithNegativeFeedback:(id)a3;
- (void)_demoteNotFeaturedMemories;
- (void)_enrichKeyAssetsforHighlightsWithNegativeFeedbackWithAssets:(id)a3;
- (void)_processWallpaperSuggestionsWithNegativeFeedbackPersonUUIDs:(id)a3;
- (void)_reloadWallpaperSuggestionsWithRejectedPersonsForLocalIdentifiers:(id)a3 forceReload:(BOOL)a4;
@end

@implementation PHAUserFeedbackUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_highlighUpdationQueue, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_graphManager, 0);
}

- (double)_userFeedbackScoreForAssetCollection:(id)a3 assetsFetchResult:(id)a4 keyAsset:(id)a5 personUUIDsByAssetUUID:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v19), "uuid", (void)v32);
        [v14 addObject:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v17);
  }

  v21 = [v12 uuid];
  v22 = [v14 arrayByAddingObject:v21];

  v23 = (void *)MEMORY[0x1E4F1C9E8];
  v24 = [v13 objectsForKeys:v22 notFoundMarker:MEMORY[0x1E4F1CBF0]];
  v25 = [v23 dictionaryWithObjects:v24 forKeys:v22];

  v26 = [(id)objc_opt_class() _blockableFeaturesForAssetCollection:v10];
  userFeedbackCalculator = self->_userFeedbackCalculator;
  v28 = [v12 uuid];
  [(PHUserFeedbackCalculator *)userFeedbackCalculator scoreForAssetUUIDs:v14 keyAssetUUID:v28 personsUUIDsByAssetUUIDs:v25 memoryFeatures:v26];
  double v30 = v29;

  return v30;
}

- (id)_personUUIDsByAssetUUIDFromAssets:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
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
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "uuid", (void)v16);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v12 = [v5 sortedArrayUsingSelector:sel_compare_];
  id v13 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v13 setIncludedDetectionTypes:&unk_1F291AC60];
  v14 = [MEMORY[0x1E4F391F0] fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v12 options:v13];

  return v14;
}

- (void)_clearEnrichmentStateOfHighlightsWithNegativeFeedback:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] About to mark highlights with negative feedback persons for re-erichment.", buf, 2u);
  }
  uint64_t v6 = [v4 count];
  uint64_t v7 = self->_loggingConnection;
  if (v6)
  {
    uint64_t v8 = v7;
    os_signpost_id_t v9 = os_signpost_id_generate(v8);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    id v10 = v8;
    id v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "UpdateHighlightsWithNegativeFeedbackPersons", "", buf, 2u);
    }

    uint64_t v12 = mach_absolute_time();
    id v13 = self->_loggingConnection;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Initiate fetching highlights for assets.", buf, 2u);
    }
    v14 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    id v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"enrichmentState != %ld", 0);
    [v14 setPredicate:v15];

    long long v16 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAssets:v4 withType:6 options:v14];
    uint64_t v17 = [v16 count];
    long long v18 = self->_loggingConnection;
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v17)
    {
      if (v19)
      {
        v20 = v18;
        int v21 = [v16 count];
        *(_DWORD *)buf = 67109120;
        LODWORD(v36) = v21;
        _os_log_impl(&dword_1D21F2000, v20, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Initiate marking highlights with negative feedback persons to re-enrich. Highlights with assets with persons with negative feedback is %d", buf, 8u);
      }
      photoLibrary = self->_photoLibrary;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __80__PHAUserFeedbackUpdater__clearEnrichmentStateOfHighlightsWithNegativeFeedback___block_invoke;
      v32[3] = &unk_1E6918C50;
      id v33 = v16;
      id v31 = 0;
      BOOL v23 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v32 error:&v31];
      v24 = (char *)v31;
      v25 = self->_loggingConnection;
      if (v23)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Finished marking highlights with negative feedback persons for re-erichment.", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v24;
        _os_log_error_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Failed to update highlights with negative feedback: %@", buf, 0xCu);
      }
    }
    else if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] No highlights found with negative feedback persons.", buf, 2u);
    }
    uint64_t v26 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    double v29 = v11;
    double v30 = v29;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v30, OS_SIGNPOST_INTERVAL_END, v9, "UpdateHighlightsWithNegativeFeedbackPersons", "", buf, 2u);
    }

    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "UpdateHighlightsWithNegativeFeedbackPersons";
      __int16 v37 = 2048;
      double v38 = (float)((float)((float)((float)(v26 - v12) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_DEBUG, "[PHAUserFeedbackUpdater] No assets with persons with negative feedback, nothing to do", buf, 2u);
  }
}

void __80__PHAUserFeedbackUpdater__clearEnrichmentStateOfHighlightsWithNegativeFeedback___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
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
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F39240], "changeRequestForPhotosHighlight:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setEnrichmentState:0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_enrichKeyAssetsforHighlightsWithNegativeFeedbackWithAssets:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] About to initiate enriching key assets for persons with negative feedback.", buf, 2u);
  }
  uint64_t v6 = [v4 count];
  long long v7 = self->_loggingConnection;
  if (v6)
  {
    long long v8 = v7;
    os_signpost_id_t v9 = os_signpost_id_generate(v8);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    long long v10 = v8;
    id v11 = v10;
    unint64_t v12 = v9 - 1;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EnrichKeyAssetsUserFeedback", "", buf, 2u);
    }
    os_signpost_id_t spid = v9;
    v43 = v11;

    uint64_t v13 = mach_absolute_time();
    v14 = self->_loggingConnection;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Initiate fetching highlights for assets.", buf, 2u);
    }
    id v15 = [v4 fetchedObjectIDsSet];
    long long v16 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    v42 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@ OR ANY %K IN %@ OR ANY %K IN %@ OR ANY %K IN %@", @"keyAssetPrivate", v15, @"keyAssetShared", v15, @"dayGroupKeyAssetPrivate", v15, @"dayGroupKeyAssetShared", v15];
    objc_msgSend(v17, "addObject:");
    long long v18 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v17];
    [v16 setInternalPredicate:v18];

    BOOL v19 = [MEMORY[0x1E4F39238] fetchHighlightsWithOptions:v16];
    if ([v19 count])
    {
      unint64_t v39 = v12;
      uint64_t v40 = v13;
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F8D6C8]) initWithHighlightTailorOptions:24];
      v46 = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];

      double v38 = (void *)v21;
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F8D658]) initWithManager:self->_graphManager enrichmentProcessors:v21];
      BOOL v23 = self->_loggingConnection;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = v23;
        int v25 = [v19 count];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v25;
        _os_log_impl(&dword_1D21F2000, v24, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Initiate enriching key assets for persons with negative feedback.Number of highlights with key asset with negative feedback is %d", buf, 8u);
      }
      uint64_t v26 = (objc_class *)MEMORY[0x1E4F1CA80];
      id v27 = v19;
      id v28 = objc_alloc_init(v26);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __86__PHAUserFeedbackUpdater__enrichKeyAssetsforHighlightsWithNegativeFeedbackWithAssets___block_invoke_2;
      v48 = &unk_1E69174C0;
      id v29 = v28;
      id v49 = v29;
      [v27 enumerateObjectsUsingBlock:buf];

      id v44 = 0;
      LOBYTE(v27) = [v22 enrichDataModelForHighlightUUIDs:v29 withError:&v44 progressBlock:&__block_literal_global_373];
      id v30 = v44;

      id v31 = self->_loggingConnection;
      if (v27)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v31, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Finished enriching key assets for persons with negative feedback.", buf, 2u);
        }
      }
      else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v30;
        _os_log_error_impl(&dword_1D21F2000, v31, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Failed to enrich key assets for highlights with persons with negative feedback: %@", buf, 0xCu);
      }

      unint64_t v12 = v39;
      uint64_t v13 = v40;
    }
    else
    {
      long long v32 = self->_loggingConnection;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D21F2000, v32, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] No highlights found with negative feedback persons.", buf, 2u);
      }
    }
    uint64_t v33 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v36 = v43;
    __int16 v37 = v36;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v37, OS_SIGNPOST_INTERVAL_END, spid, "EnrichKeyAssetsUserFeedback", "", buf, 2u);
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "EnrichKeyAssetsUserFeedback";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v33 - v13) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_DEBUG, "[PHAUserFeedbackUpdater] No assets with persons with negative feedback, nothing to do", buf, 2u);
  }
}

void __86__PHAUserFeedbackUpdater__enrichKeyAssetsforHighlightsWithNegativeFeedbackWithAssets___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

- (id)_fetchAssetsWithNegativeFeedbackFrom:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Initiate fetching assets for persons with negative feedback.", buf, 2u);
  }
  uint64_t v6 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v6 setIncludedDetectionTypes:&unk_1F291AC48];
  long long v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN (%@)", @"personUUID", v4];
  [v6 setInternalPredicate:v7];

  long long v8 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v6];
  os_signpost_id_t v9 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v14[0] = *MEMORY[0x1E4F394A8];
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v9 setFetchPropertySets:v10];

  id v11 = [MEMORY[0x1E4F38EB8] fetchAssetsForPersons:v8 options:v9];

  return v11;
}

- (void)_reloadWallpaperSuggestionsWithRejectedPersonsForLocalIdentifiers:(id)a3 forceReload:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  long long v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %d AND %K = %d AND %K IN %@", @"subtype", 652, @"featuredState", 1, @"context", v6];
  [v7 setPredicate:v8];

  os_signpost_id_t v9 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v7];
  if ([v9 count]) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v38 + 1) + 8 * i) uuid];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v14);
    }

    long long v18 = [[PHAWallpaperSuggestionRefreshSession alloc] initWithGraphManager:self->_graphManager];
    id v37 = 0;
    BOOL v19 = [(PHAWallpaperSuggestionRefreshSession *)v18 prepareWithError:&v37];
    id v20 = v37;
    if (!v19)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v43 = v20;
        _os_log_fault_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_FAULT, "[PHAUserFeedbackUpdater] Failed to prepare Wallpaper Suggestions refresh session: %@", buf, 0xCu);
      }
      goto LABEL_23;
    }
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F8D898]) initWithTaskName:@"ReloadWallpaperSuggestionsForUserFeedbackUpdater" loggingConnection:self->_loggingConnection];
    id v22 = objc_alloc(MEMORY[0x1E4F71F20]);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __104__PHAUserFeedbackUpdater__reloadWallpaperSuggestionsWithRejectedPersonsForLocalIdentifiers_forceReload___block_invoke;
    v35[3] = &unk_1E6918D90;
    id v34 = v21;
    id v36 = v34;
    uint64_t v33 = (void *)[v22 initWithProgressBlock:v35];
    LODWORD(v22) = -[PHAWallpaperSuggestionRefreshSession reloadWallpaperSuggestionsForUUIDs:progress:error:](v18, "reloadWallpaperSuggestionsForUUIDs:progress:error:", v11);
    id v32 = v20;

    [(PHAWallpaperSuggestionRefreshSession *)v18 cleanup];
    BOOL v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
    v46 = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    int v25 = [v11 sortedArrayUsingDescriptors:v24];

    uint64_t v26 = self->_loggingConnection;
    if (v22)
    {
      id v20 = v32;
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      id v27 = v26;
      int v28 = [v25 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v43 = v28;
      *(_WORD *)&v43[4] = 2112;
      *(void *)&v43[6] = v25;
      _os_log_impl(&dword_1D21F2000, v27, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] Successfully reloaded Wallpaper Suggestions for %d impacted featured Suggestions %@", buf, 0x12u);
    }
    else
    {
      id v20 = v32;
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      id v27 = v26;
      int v31 = [v25 count];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v43 = v31;
      *(_WORD *)&v43[4] = 2112;
      *(void *)&v43[6] = v25;
      __int16 v44 = 2112;
      id v45 = v32;
      _os_log_error_impl(&dword_1D21F2000, v27, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Failed to reload Wallpaper Suggestions for %d impacted featured Suggestions %@: %@", buf, 0x1Cu);
    }

    goto LABEL_22;
  }
  id v29 = self->_loggingConnection;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] No featured Wallpaper Suggestion to reload for", buf, 2u);
  }
LABEL_24:
}

uint64_t __104__PHAUserFeedbackUpdater__reloadWallpaperSuggestionsWithRejectedPersonsForLocalIdentifiers_forceReload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkCallsWithProgress:stop:", 0);
}

- (BOOL)_deleteWallpaperTopSuggestionsOfPersonsForLocalIdentifiers:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F29008];
  id v5 = a3;
  id v6 = [v4 sortDescriptorWithKey:@"self" ascending:1];
  v30[0] = v6;
  long long v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  long long v8 = [v5 sortedArrayUsingDescriptors:v7];
  os_signpost_id_t v9 = [v8 componentsJoinedByString:@", "];

  BOOL v10 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %d AND %K IN %@", @"subtype", 602, @"context", v5];

  [v10 setPredicate:v11];
  id v12 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v10];
  if ([v12 count])
  {
    photoLibrary = self->_photoLibrary;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __85__PHAUserFeedbackUpdater__deleteWallpaperTopSuggestionsOfPersonsForLocalIdentifiers___block_invoke;
    v24[3] = &unk_1E6918C50;
    id v14 = v12;
    id v25 = v14;
    id v23 = 0;
    BOOL v15 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v24 error:&v23];
    id v16 = v23;
    loggingConnection = self->_loggingConnection;
    if (v15)
    {
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
      long long v18 = loggingConnection;
      int v19 = [v14 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)id v27 = v19;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v9;
      _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] Successfully deleted %d Wallpaper Top Suggestions for persons %@", buf, 0x12u);
    }
    else
    {
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      long long v18 = loggingConnection;
      int v22 = [v14 count];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)id v27 = v22;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v9;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_error_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Failed to delete %d Wallpaper Top Suggestions for persons %@: %@", buf, 0x1Cu);
    }

    goto LABEL_9;
  }
  id v20 = self->_loggingConnection;
  LOBYTE(v15) = 0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)id v27 = v9;
    _os_log_impl(&dword_1D21F2000, v20, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] No Wallpaper Top Suggestions for persons %@", buf, 0xCu);
    LOBYTE(v15) = 0;
  }
LABEL_10:

  return v15;
}

uint64_t __85__PHAUserFeedbackUpdater__deleteWallpaperTopSuggestionsOfPersonsForLocalIdentifiers___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F39318] deleteSuggestions:*(void *)(a1 + 32)];
}

- (BOOL)_unfeaturePersonMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs:(id)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    long long v7 = (void *)MEMORY[0x1E4F28BA0];
    long long v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"type", 10);
    v30[0] = v8;
    os_signpost_id_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"featuredState", 1);
    v30[1] = v9;
    BOOL v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"relatedCollectionUUID", v5];
    void v30[2] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
    id v12 = [v7 andPredicateWithSubpredicates:v11];
    [v6 setInternalPredicate:v12];

    uint64_t v13 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v6];
    if (![v13 count])
    {
      LOBYTE(v17) = 0;
LABEL_12:

      goto LABEL_13;
    }
    id v14 = [v13 firstObject];
    photoLibrary = self->_photoLibrary;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __93__PHAUserFeedbackUpdater__unfeaturePersonMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs___block_invoke;
    v24[3] = &unk_1E6918C50;
    id v16 = v14;
    id v25 = v16;
    id v23 = 0;
    BOOL v17 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v24 error:&v23];
    id v18 = v23;
    loggingConnection = self->_loggingConnection;
    if (v17)
    {
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        goto LABEL_12;
      }
      id v20 = loggingConnection;
      uint64_t v21 = [v16 relatedCollectionUUID];
      *(_DWORD *)buf = 138412290;
      id v27 = v21;
      _os_log_impl(&dword_1D21F2000, v20, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] Successfully unfeatured Magic Slot suggestion for person %@", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      id v20 = loggingConnection;
      uint64_t v21 = [v16 relatedCollectionUUID];
      *(_DWORD *)buf = 138412546;
      id v27 = v21;
      __int16 v28 = 2112;
      id v29 = v18;
      _os_log_error_impl(&dword_1D21F2000, v20, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Failed to unfeature Magic Slot suggestion for person %@: %@", buf, 0x16u);
    }

    goto LABEL_11;
  }
  LOBYTE(v17) = 0;
LABEL_13:

  return v17;
}

void __93__PHAUserFeedbackUpdater__unfeaturePersonMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39318] changeRequestForSuggestion:*(void *)(a1 + 32)];
  [v1 setFeaturedState:0];
}

- (BOOL)_unfeatureSocialGroupMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs:(id)a3
{
  v43[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  long long v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"type", 10);
  v43[0] = v7;
  long long v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"subtype", 916);
  v43[1] = v8;
  os_signpost_id_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"featuredState", 1);
  v43[2] = v9;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];
  id v11 = [v6 andPredicateWithSubpredicates:v10];
  [v5 setInternalPredicate:v11];

  id v12 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v5];
  if ([v12 count])
  {
    uint64_t v13 = [v12 firstObject];
    id v14 = [v13 relatedCollectionUUID];
    if (v14)
    {
      id v32 = v4;
      id v15 = [MEMORY[0x1E4F39300] localIdentifierWithUUID:v14];
      id v16 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      BOOL v17 = (void *)MEMORY[0x1E4F39300];
      id v42 = v15;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      int v19 = [v17 fetchSocialGroupsWithLocalIdentifiers:v18 options:v16];

      if (![v19 count])
      {

        LOBYTE(v19) = 0;
LABEL_15:

        id v4 = v32;
        goto LABEL_16;
      }
      id v30 = v14;
      int v31 = v13;
      id v20 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      uint64_t v21 = [v19 firstObject];
      [MEMORY[0x1E4F391F0] fetchPersonsInSocialGroup:v21 option:v20];
      v22 = id v29 = v15;
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __98__PHAUserFeedbackUpdater__unfeatureSocialGroupMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs___block_invoke;
      v36[3] = &unk_1E6917498;
      id v37 = v23;
      id v24 = v23;
      [v22 enumerateObjectsUsingBlock:v36];
      int v25 = [v24 intersectsSet:v32];

      if (v25)
      {
        photoLibrary = self->_photoLibrary;
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __98__PHAUserFeedbackUpdater__unfeatureSocialGroupMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs___block_invoke_2;
        v34[3] = &unk_1E6918C50;
        uint64_t v13 = v31;
        id v35 = v31;
        id v33 = 0;
        LODWORD(v19) = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v34 error:&v33];
        id v15 = v33;
        loggingConnection = self->_loggingConnection;
        if (v19)
        {
          id v14 = v30;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v39 = v30;
            _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] Successfully unfeatured Magic Slot suggestion for social group %@", buf, 0xCu);
          }
        }
        else
        {
          id v14 = v30;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            long long v39 = v30;
            __int16 v40 = 2112;
            id v41 = v15;
            _os_log_error_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Failed to unfeature Magic Slot suggestion for social group %@: %@", buf, 0x16u);
          }
        }
        id v16 = v35;
        goto LABEL_15;
      }
      LOBYTE(v19) = 0;
      uint64_t v13 = v31;
      id v4 = v32;
      id v14 = v30;
    }
    else
    {
      LOBYTE(v19) = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  LOBYTE(v19) = 0;
LABEL_17:

  return (char)v19;
}

void __98__PHAUserFeedbackUpdater__unfeatureSocialGroupMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

void __98__PHAUserFeedbackUpdater__unfeatureSocialGroupMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs___block_invoke_2(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39318] changeRequestForSuggestion:*(void *)(a1 + 32)];
  [v1 setFeaturedState:0];
}

- (void)_processWallpaperSuggestionsWithNegativeFeedbackPersonUUIDs:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] About to process Wallpaper Suggestions", buf, 2u);
  }
  if ([v4 count])
  {
    id v6 = [MEMORY[0x1E4F391F0] localIdentifiersWithUUIDs:v4];
    long long v7 = self->_loggingConnection;
    os_signpost_id_t v8 = os_signpost_id_generate((os_log_t)v7);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    os_signpost_id_t v9 = v7;
    BOOL v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "WallpaperTopSuggestionDeletion", "", buf, 2u);
    }

    uint64_t v11 = mach_absolute_time();
    BOOL v12 = [(PHAUserFeedbackUpdater *)self _deleteWallpaperTopSuggestionsOfPersonsForLocalIdentifiers:v6];
    uint64_t v13 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    id v16 = v10;
    BOOL v17 = v16;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v17, OS_SIGNPOST_INTERVAL_END, v8, "WallpaperTopSuggestionDeletion", "", buf, 2u);
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v31 = "WallpaperTopSuggestionDeletion";
      __int16 v32 = 2048;
      double v33 = (float)((float)((float)((float)(v13 - v11) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    id v18 = self->_loggingConnection;
    os_signpost_id_t v19 = os_signpost_id_generate((os_log_t)v18);
    mach_timebase_info v28 = 0;
    mach_timebase_info(&v28);
    id v20 = v18;
    uint64_t v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "WallpaperSuggestionReload", "", buf, 2u);
    }

    uint64_t v22 = mach_absolute_time();
    [(PHAUserFeedbackUpdater *)self _reloadWallpaperSuggestionsWithRejectedPersonsForLocalIdentifiers:v6 forceReload:v12];
    uint64_t v23 = mach_absolute_time();
    mach_timebase_info v24 = v28;
    int v25 = v21;
    uint64_t v26 = v25;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D21F2000, v26, OS_SIGNPOST_INTERVAL_END, v19, "WallpaperSuggestionReload", "", buf, 2u);
    }

    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      int v31 = "WallpaperSuggestionReload";
      __int16 v32 = 2048;
      double v33 = (float)((float)((float)((float)(v23 - v22) * (float)v24.numer) / (float)v24.denom) / 1000000.0);
      _os_log_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    id v27 = self->_loggingConnection;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v27, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] No person with negative feedback, nothing to do", buf, 2u);
    }
  }
}

- (BOOL)_neverFeatureMemories:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    photoLibrary = self->_photoLibrary;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__PHAUserFeedbackUpdater__neverFeatureMemories_error___block_invoke;
    v10[3] = &unk_1E6918C50;
    id v11 = v6;
    char v8 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v10 error:a4];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

void __54__PHAUserFeedbackUpdater__neverFeatureMemories_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
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
        id v6 = objc_msgSend(MEMORY[0x1E4F39170], "changeRequestForMemory:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setFeaturedState:-1];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (id)_notRecommendedMemoriesFromMemories:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v5 setIncludeGuestAssets:1];
  uint64_t v21 = v5;
  id v6 = [MEMORY[0x1E4F38EB8] fetchKeyAssetByMemoryUUIDForMemories:v4 options:v5];
  long long v7 = [v6 allValues];
  uint64_t v23 = [(PHAUserFeedbackUpdater *)self _personUUIDsByAssetUUIDFromAssets:v7];

  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1D26057A0]();
        id v15 = [v13 uuid];
        id v16 = [v6 objectForKeyedSubscript:v15];

        if (v16)
        {
          [(PHAUserFeedbackUpdater *)self _userFeedbackScoreForAssetCollection:v13 assetsFetchResult:0 keyAsset:v16 personUUIDsByAssetUUID:v23];
          if (objc_msgSend(MEMORY[0x1E4F39338], "score:meetsScoreThreshold:")) {
            [v22 addObject:v13];
          }
        }
        else
        {
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
          {
            id v18 = loggingConnection;
            os_signpost_id_t v19 = [v13 uuid];
            *(_DWORD *)buf = 138412290;
            id v29 = v19;
            _os_log_error_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Key asset is nil for memory with UUID %@", buf, 0xCu);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v10);
  }

  return v22;
}

- (void)_demoteNotFeaturedMemories
{
  uint64_t v2 = self;
  v61[2] = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Started marking memories as never feature based on user feedback.", buf, 2u);
    loggingConnection = v2->_loggingConnection;
  }
  id v4 = loggingConnection;
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v6 = v4;
  long long v7 = v6;
  unint64_t v43 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "UnfeatureMemories", "", buf, 2u);
  }
  os_signpost_id_t spid = v5;
  id v42 = v7;

  uint64_t v41 = mach_absolute_time();
  id v8 = [(PHPhotoLibrary *)v2->_photoLibrary librarySpecificFetchOptions];
  [v8 setWantsIncrementalChangeDetails:1];
  [v8 setChunkSizeForFetch:13];
  [v8 setCacheSizeForFetch:13];
  [v8 setIncludePendingMemories:1];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"rejected = NO AND featuredState == %d", 0);
  [v8 setPredicate:v9];

  uint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v61[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v61[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  [v8 setSortDescriptors:v12];

  __int16 v44 = v8;
  uint64_t v13 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v8];
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v60 count:16];
  v46 = v15;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    uint64_t v48 = *(void *)v52;
    while (2)
    {
      uint64_t v19 = 0;
      uint64_t v49 = v18 + 1;
      uint64_t v45 = v18 + v17;
      do
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v51 + 1) + 8 * v19);
        uint64_t v21 = (void *)MEMORY[0x1D26057A0]();
        id v22 = [v20 objectID];
        [v14 addObject:v22];

        unint64_t v23 = v49 + v19;
        if ([v14 count] == 13 || v23 >= objc_msgSend(v15, "count"))
        {
          long long v24 = [(id)objc_opt_class() _memoriesFetchResultWithObjectIDs:v14 existingMemoriesFetchResult:v15];
          long long v25 = v2;
          long long v26 = [(PHAUserFeedbackUpdater *)v2 _notRecommendedMemoriesFromMemories:v24];
          [v47 addObjectsFromArray:v26];
          id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

          unint64_t v28 = v23 - [v47 count];
          if (v28 > 4)
          {
            id v14 = v27;
            uint64_t v2 = v25;
            id v15 = v46;
            goto LABEL_19;
          }
          id v14 = v27;
          uint64_t v2 = v25;
          id v15 = v46;
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v51 objects:v60 count:16];
      uint64_t v18 = v45;
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  id v50 = 0;
  BOOL v29 = [(PHAUserFeedbackUpdater *)v2 _neverFeatureMemories:v47 error:&v50];
  id v30 = (char *)v50;
  uint64_t v31 = v2->_loggingConnection;
  if (v29)
  {
    __int16 v32 = v42;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      double v33 = v31;
      uint64_t v34 = [v47 count];
      *(_DWORD *)buf = 134217984;
      v57 = (const char *)v34;
      _os_log_impl(&dword_1D21F2000, v33, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] Finished marking memories as never feature based on user feedback. %lu memories marked as never featured.", buf, 0xCu);
    }
  }
  else
  {
    __int16 v32 = v42;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v57 = v30;
      _os_log_error_impl(&dword_1D21F2000, v31, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Marking memories as never featurebased on user feedback failed with error: %@", buf, 0xCu);
    }
  }
  uint64_t v35 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  long long v38 = v32;
  long long v39 = v38;
  if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v39, OS_SIGNPOST_INTERVAL_END, spid, "UnfeatureMemories", "", buf, 2u);
  }

  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "UnfeatureMemories";
    __int16 v58 = 2048;
    double v59 = (float)((float)((float)((float)(v35 - v41) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v39, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (BOOL)_demoteFeaturedMemories
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Started unfeaturing memories based on user feedback.", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  id v4 = loggingConnection;
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v6 = v4;
  long long v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "UnfeatureMemories", "", buf, 2u);
  }

  uint64_t v8 = mach_absolute_time();
  uint64_t v9 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"featuredState == %d", 1);
  [v9 setPredicate:v10];

  [v9 setIncludePendingMemories:1];
  uint64_t v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v9];
  uint64_t v12 = [(PHAUserFeedbackUpdater *)self _notRecommendedMemoriesFromMemories:v11];
  id v25 = 0;
  BOOL v13 = [(PHAUserFeedbackUpdater *)self _neverFeatureMemories:v12 error:&v25];
  id v14 = (char *)v25;
  id v15 = self->_loggingConnection;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v15;
      uint64_t v17 = [v12 count];
      *(_DWORD *)buf = 134217984;
      unint64_t v28 = (const char *)v17;
      _os_log_impl(&dword_1D21F2000, v16, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] Finished unfeaturing memories based on user feedback. %lu memories marked as never featured.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v28 = v14;
    _os_log_error_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Unfeaturing memories based on user feedback failed with error: %@", buf, 0xCu);
  }
  uint64_t v18 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v21 = v7;
  id v22 = v21;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v22, OS_SIGNPOST_INTERVAL_END, v5, "UnfeatureMemories", "", buf, 2u);
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v28 = "UnfeatureMemories";
    __int16 v29 = 2048;
    double v30 = (float)((float)((float)((float)(v18 - v8) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  BOOL v23 = v13 && [v12 count] != 0;

  return v23;
}

- (BOOL)_retireAndUnfeatureSuggestions:(id)a3 didUnfeatureSuggestions:(BOOL *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    LOBYTE(v15) = 0;
    goto LABEL_23;
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Started retiring suggestions.", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  uint64_t v8 = loggingConnection;
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v10 = v8;
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RetireAndUnfeatureSuggestions", "", buf, 2u);
  }

  uint64_t v12 = mach_absolute_time();
  *(void *)buf = 0;
  __int16 v32 = buf;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  photoLibrary = self->_photoLibrary;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __81__PHAUserFeedbackUpdater__retireAndUnfeatureSuggestions_didUnfeatureSuggestions___block_invoke;
  v28[3] = &unk_1E6917470;
  id v14 = v6;
  id v29 = v14;
  double v30 = buf;
  id v27 = 0;
  BOOL v15 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v28 error:&v27];
  uint64_t v16 = (char *)v27;
  uint64_t v17 = self->_loggingConnection;
  if (v15)
  {
    uint64_t v18 = v17;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v14 count];
      *(_DWORD *)id v36 = 134217984;
      id v37 = (const char *)v19;
      _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_DEFAULT, "[PHAUserFeedbackUpdater] %lu suggestion(s) marked as retired.", v36, 0xCu);
    }

    if (!a4) {
      goto LABEL_17;
    }
    uint8_t v20 = v32[24];
    goto LABEL_16;
  }
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  *(_DWORD *)id v36 = 138412290;
  id v37 = v16;
  _os_log_error_impl(&dword_1D21F2000, v17, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Retiring suggestions failed with error: %@", v36, 0xCu);
  if (a4)
  {
LABEL_15:
    uint8_t v20 = 0;
LABEL_16:
    *a4 = v20;
  }
LABEL_17:
  uint64_t v21 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  long long v24 = v11;
  id v25 = v24;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)id v36 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v25, OS_SIGNPOST_INTERVAL_END, v9, "RetireAndUnfeatureSuggestions", "", v36, 2u);
  }

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v36 = 136315394;
    id v37 = "RetireAndUnfeatureSuggestions";
    __int16 v38 = 2048;
    double v39 = (float)((float)((float)((float)(v21 - v12) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v36, 0x16u);
  }

  _Block_object_dispose(buf, 8);
LABEL_23:

  return v15;
}

void __81__PHAUserFeedbackUpdater__retireAndUnfeatureSuggestions_didUnfeatureSuggestions___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F39318], "changeRequestForSuggestion:", v7, (void)v9);
        [v8 markRetired];
        if ([v7 featuredState] == 1)
        {
          [v8 setFeaturedState:0];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)_suggestionsToRetire
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Started fetching suggestions to retire based on user feedback.", buf, 2u);
    loggingConnection = self->_loggingConnection;
  }
  uint64_t v4 = loggingConnection;
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v6 = v4;
  long long v7 = v6;
  unint64_t v35 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SuggestionsToRetire", "", buf, 2u);
  }
  os_signpost_id_t spid = v5;
  char v34 = v7;

  uint64_t v32 = mach_absolute_time();
  uint64_t v8 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v8 setWantsIncrementalChangeDetails:0];
  long long v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(state == %d || state == %d || state == %d)", 1, 0, 3);
  [v8 setPredicate:v9];

  id v37 = v8;
  long long v10 = [MEMORY[0x1E4F39310] fetchAllFeaturedStateEnabledSuggestionsWithOptions:v8];
  long long v11 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v11 setIncludeGuestAssets:1];
  id v36 = v11;
  long long v12 = [MEMORY[0x1E4F38EB8] fetchKeyAssetBySuggestionUUIDForSuggestions:v10 options:v11];
  uint64_t v33 = [v12 allValues];
  uint64_t v40 = -[PHAUserFeedbackUpdater _personUUIDsByAssetUUIDFromAssets:](self, "_personUUIDsByAssetUUIDFromAssets:");
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v18 = (void *)MEMORY[0x1D26057A0]();
        uint64_t v19 = [v17 uuid];
        uint8_t v20 = [v12 objectForKeyedSubscript:v19];

        if (v20)
        {
          [(PHAUserFeedbackUpdater *)self _userFeedbackScoreForAssetCollection:v17 assetsFetchResult:0 keyAsset:v20 personUUIDsByAssetUUID:v40];
          if (objc_msgSend(MEMORY[0x1E4F39338], "score:meetsScoreThreshold:")) {
            [v38 addObject:v17];
          }
        }
        else
        {
          uint64_t v21 = self->_loggingConnection;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v22 = v21;
            BOOL v23 = [v17 uuid];
            *(_DWORD *)buf = 138412290;
            id v47 = v23;
            _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "[PHAUserFeedbackUpdater] Key asset is nil for suggestion with UUID %@", buf, 0xCu);
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v14);
  }

  long long v24 = self->_loggingConnection;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D21F2000, v24, OS_LOG_TYPE_INFO, "[PHAUserFeedbackUpdater] Finished fetching suggestions to retire based on user feedback.", buf, 2u);
  }
  uint64_t v25 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  unint64_t v28 = v34;
  id v29 = v28;
  if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D21F2000, v29, OS_SIGNPOST_INTERVAL_END, spid, "SuggestionsToRetire", "", buf, 2u);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v47 = "SuggestionsToRetire";
    __int16 v48 = 2048;
    double v49 = (float)((float)((float)((float)(v25 - v32) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v38;
}

- (BOOL)updateFeatureContentWithPersonUUIDs:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(PHAUserFeedbackUpdater *)self _suggestionsToRetire];
  char v18 = 0;
  BOOL v7 = [(PHAUserFeedbackUpdater *)self _retireAndUnfeatureSuggestions:v6 didUnfeatureSuggestions:&v18];
  [(PHAUserFeedbackUpdater *)self _demoteNotFeaturedMemories];
  BOOL v8 = [(PHAUserFeedbackUpdater *)self _demoteFeaturedMemories];
  long long v9 = [(PHUserFeedbackCalculator *)self->_userFeedbackCalculator personUUIDsWithNegativeFeedback];
  [(PHAUserFeedbackUpdater *)self _processWallpaperSuggestionsWithNegativeFeedbackPersonUUIDs:v9];
  if (v5 && [v5 count])
  {
    highlighUpdationQueue = self->_highlighUpdationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PHAUserFeedbackUpdater_updateFeatureContentWithPersonUUIDs_error___block_invoke;
    block[3] = &unk_1E69189B0;
    block[4] = self;
    id v11 = v5;
    id v17 = v11;
    dispatch_async(highlighUpdationQueue, block);
    LODWORD(highlighUpdationQueue) = [(PHAUserFeedbackUpdater *)self _unfeatureSocialGroupMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs:v11];
    unsigned int v12 = highlighUpdationQueue | [(PHAUserFeedbackUpdater *)self _unfeaturePersonMagicSlotSuggestionWithNegativeFeedbackPersonUUIDs:v11];
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  if (v18) {
    BOOL v13 = v7;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13) {
    char v14 = 1;
  }
  else {
    char v14 = v8 | v12;
  }

  return v14;
}

void __68__PHAUserFeedbackUpdater_updateFeatureContentWithPersonUUIDs_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fetchAssetsWithNegativeFeedbackFrom:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _clearEnrichmentStateOfHighlightsWithNegativeFeedback:v2];
  [*(id *)(a1 + 32) _enrichKeyAssetsforHighlightsWithNegativeFeedbackWithAssets:v2];
}

- (PHAUserFeedbackUpdater)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PHAUserFeedbackUpdater;
  id v6 = [(PHAUserFeedbackUpdater *)&v21 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    uint64_t v8 = [v5 photoLibrary];
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    long long v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PHAUserFeedbackHighlightUpdation", v10);
    highlighUpdationQueue = v7->_highlighUpdationQueue;
    v7->_highlighUpdationQueue = (OS_dispatch_queue *)v11;

    BOOL v13 = objc_opt_class();
    char v14 = [v5 photoLibrary];
    uint64_t v15 = [v13 _userFeedbackCalculatorWithPhotoLibrary:v14];
    userFeedbackCalculator = v7->_userFeedbackCalculator;
    v7->_userFeedbackCalculator = (PHUserFeedbackCalculator *)v15;

    id v17 = [v5 workingContext];
    uint64_t v18 = [v17 loggingConnection];
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v18;
  }
  return v7;
}

+ (id)_memoriesFetchResultWithObjectIDs:(id)a3 existingMemoriesFetchResult:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F390B0];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithExistingFetchResult:v6 filteredObjectIDs:v7];

  return v8;
}

+ (id)_userFeedbackCalculatorWithPhotoLibrary:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F39338];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithPhotoLibrary:v4];

  return v5;
}

@end