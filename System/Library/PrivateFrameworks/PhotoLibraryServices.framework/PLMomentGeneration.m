@interface PLMomentGeneration
+ (id)dateIntervalsAroundSortedDates:(id)a3 minimumIntervalDuration:(double)a4;
- (BOOL)_hasWorkWorkRemainingWithCompletionBlocks:(id *)a3;
- (BOOL)_isAsset:(id)a3 identicalToAssetForMoments:(id)a4;
- (BOOL)_writeDetails:(id)a3 toFilepath:(id)a4 withDefaultFilename:(id)a5;
- (BOOL)isGenerationPassInProgress;
- (BOOL)regenerateMonthHighlightTitlesWithManager:(id)a3 error:(id *)a4;
- (PLMomentGeneration)initWithMomentGenerationDataManager:(id)a3 bundle:(id)a4;
- (PLMomentGeneration)initWithMomentGenerationDataManager:(id)a3 bundle:(id)a4 locale:(id)a5;
- (PLMomentGenerationDataManagement)momentGenerationDataManager;
- (id)_detailsForAsset:(id)a3 simpleOnly:(BOOL)a4;
- (id)_detailsForMoment:(id)a3;
- (id)_highlightGenerator;
- (id)_logEntryForAssets:(id)a3 isBatchUpdate:(BOOL)a4;
- (id)_newPublicGlobalUUIDsToAssetsMappingWithAssets:(id)a3;
- (id)allAssetMetadataWriteToFile:(id)a3;
- (id)allMomentsMetadataWriteToFile:(id)a3;
- (id)frequentLocationManager;
- (id)localCreationDateCreator;
- (id)momentGenerationStatus;
- (id)newFrequentLocationManager;
- (id)newLocalCreationDateCreator;
- (void)_appendAssetsToReplayLog:(id)a3 forBatchUpdate:(BOOL)a4;
- (void)_clearReplayLog;
- (void)_runIncrementalGenerationPassWithCompletionHandler:(id)a3;
- (void)_runIncrementalMomentGenerationIfItemsArePendingWithCompletion:(id)a3;
- (void)_runMomentAndHighlightGenerationForAssets:(id)a3 hiddenAssets:(id)a4 updatedAssetIDsForHighlights:(id)a5 updatedMomentIDsForHighlights:(id)a6 affectedMoments:(id)a7 highlightsWithDeletedMoments:(id)a8 sharedAssetContainerIncrementalChanges:(id)a9 insertedOrUpdatedMoments:(id *)a10;
- (void)_updateIncrementalMomentGeneration;
- (void)cleanupEmptyHighlightsWithCompletionBlock:(id)a3;
- (void)generateWithAssetInsertsAndUpdates:(id)a3 assetDeletes:(id)a4 assetUpdatesForHighlights:(id)a5 momentUpdatesForHighlights:(id)a6 completionHandler:(id)a7;
- (void)generateWithIncrementalDataCompletionHandler:(id)a3;
- (void)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:(id)a3;
- (void)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale:(BOOL)a3 completionBlock:(id)a4;
- (void)locationOfInterestUpdateWithCompletionBlock:(id)a3;
- (void)processRecentHighlightsWithCompletionBlock:(id)a3;
- (void)processUnprocessedMomentLocationsWithCompletionBlock:(id)a3;
- (void)rebuildAllHighlightsWithOptions:(id)a3 completionHandler:(id)a4;
- (void)rebuildAllMomentsWithOptions:(id)a3 completionHandler:(id)a4;
- (void)releaseMemoryIntensiveObjects;
- (void)saveChangesForAssetInsertsAndUpdates:(id)a3 assetDeletes:(id)a4 assetUpdatesForHighlights:(id)a5 momentUpdatesForHighlights:(id)a6 sharedAssetContainerIncrementalChangesByAssetID:(id)a7;
- (void)updateHighlightTitlesWithCompletionBlock:(id)a3;
- (void)validateLibraryWithCompletionBlock:(id)a3;
@end

@implementation PLMomentGeneration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_momentGenerationDataManager);
  objc_storeStrong((id *)&self->_dateRangeTitleGenerator, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
  objc_storeStrong((id *)&self->_incrementalMomentGenThrottle, 0);
  objc_storeStrong((id *)&self->_lazyLocalCreationDateCreator, 0);
  objc_storeStrong((id *)&self->_lazyFrequentLocationManager, 0);
  objc_storeStrong((id *)&self->_incrementalGenerationStateQueue, 0);
  objc_storeStrong((id *)&self->_pendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingSharedAssetContainerIncrementalChanges, 0);
  objc_storeStrong((id *)&self->_pendingMomentUpdatesForHighlights, 0);
  objc_storeStrong((id *)&self->_pendingUpdatesForHighlights, 0);
  objc_storeStrong((id *)&self->_pendingDeletes, 0);
  objc_storeStrong((id *)&self->_pendingInsertsAndUpdates, 0);
}

- (PLMomentGenerationDataManagement)momentGenerationDataManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  return (PLMomentGenerationDataManagement *)WeakRetained;
}

- (BOOL)regenerateMonthHighlightTitlesWithManager:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__108981;
  v23 = __Block_byref_object_dispose__108982;
  id v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__PLMomentGeneration_regenerateMonthHighlightTitlesWithManager_error___block_invoke;
  v10[3] = &unk_1E5874900;
  id v7 = v6;
  v13 = &v15;
  v14 = &v19;
  id v11 = v7;
  v12 = self;
  [v7 performDataTransaction:v10 synchronously:1 completionHandler:0];
  if (a4) {
    *a4 = (id) v20[5];
  }
  char v8 = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

void __70__PLMomentGeneration_regenerateMonthHighlightTitlesWithManager_error___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Re-generating month highlight titles.", buf, 2u);
  }

  v3 = (void *)a1[4];
  id v8 = 0;
  v4 = [v3 allPhotosHighlightsOfKind:1 error:&v8];
  id v5 = v8;
  id v6 = v8;
  if (v4)
  {
    +[PLPhotosHighlightGenerator updateTitleForHighlights:v4 forKind:1 forceUpdateLocale:0 dateRangeTitleGenerator:*(void *)(a1[5] + 104)];
  }
  else
  {
    id v7 = PLMomentsGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Fetching Months failed: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
  }
}

- (void)validateLibraryWithCompletionBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([(PLMomentGeneration *)self isGenerationPassInProgress])
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    id v5 = [(PLMomentGeneration *)self momentGenerationDataManager];
    if (([v5 shouldPerformLightweightValidation] & 1) != 0
      && (int v6 = +[PLModelMigrator currentModelVersion],
          unint64_t v7 = [v5 previousValidatedModelVersion],
          char v8 = [v5 previousValidationSucceeded],
          v7 < v6))
    {
      char v9 = v8;
      id v10 = PLMomentGenerationGetLog();
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x2020000000;
      char v36 = 1;
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x3032000000;
      v33[3] = __Block_byref_object_copy__108981;
      v33[4] = __Block_byref_object_dispose__108982;
      id v34 = [MEMORY[0x1E4F1CA48] array];
      v31[0] = 0;
      v31[1] = v31;
      v31[2] = 0x3032000000;
      v31[3] = __Block_byref_object_copy__108981;
      v31[4] = __Block_byref_object_dispose__108982;
      id v32 = [MEMORY[0x1E4F1CA48] array];
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3032000000;
      v29[3] = __Block_byref_object_copy__108981;
      v29[4] = __Block_byref_object_dispose__108982;
      id v30 = [MEMORY[0x1E4F1CA48] array];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __57__PLMomentGeneration_validateLibraryWithCompletionBlock___block_invoke;
      v21[3] = &unk_1E5874368;
      id v11 = v10;
      id v22 = v11;
      v25 = v35;
      v26 = v33;
      id v23 = v5;
      id v24 = self;
      v27 = v31;
      v28 = v29;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57__PLMomentGeneration_validateLibraryWithCompletionBlock___block_invoke_270;
      v12[3] = &unk_1E5874390;
      char v20 = v9;
      uint64_t v15 = v35;
      v16 = v33;
      uint64_t v17 = v31;
      char v18 = v29;
      id v13 = v23;
      uint64_t v19 = v6;
      v14 = v4;
      [v13 performDataTransaction:v21 synchronously:0 completionHandler:v12];

      _Block_object_dispose(v29, 8);
      _Block_object_dispose(v31, 8);

      _Block_object_dispose(v33, 8);
      _Block_object_dispose(v35, 8);
    }
    else if (v4)
    {
      v4[2](v4);
    }
  }
}

void __57__PLMomentGeneration_validateLibraryWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  v2 = *(id *)(a1 + 32);
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v4 = v2;
  id v5 = v4;
  unint64_t v6 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "ValidateAssetsPerBatch", "", buf, 2u);
  }

  uint64_t v7 = mach_absolute_time();
  char v8 = *(void **)(a1 + 40);
  id v120 = 0;
  char v9 = [v8 allInvalidAssetsWithError:&v120];
  id v10 = (char *)v120;
  v103 = v9;
  if (!v9)
  {
    id v13 = PLBackendGetLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412290;
    v125 = v10;
    char v20 = "[MomentsGeneration.Validation] Could not fetch invalid assets with error:%@";
    uint64_t v21 = v13;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    uint32_t v23 = 12;
LABEL_22:
    _os_log_impl(&dword_19B3C7000, v21, v22, v20, buf, v23);
    goto LABEL_23;
  }
  if (![v9 count])
  {
    id v13 = PLMomentsGetLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    char v20 = "[MomentsGeneration.Validation] All assets valid";
    uint64_t v21 = v13;
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    uint32_t v23 = 2;
    goto LABEL_22;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  id v11 = PLBackendGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = [v9 count];
    *(_DWORD *)buf = 134217984;
    v125 = (const char *)v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Detected %lu invalid assets", buf, 0xCu);
  }

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v116 objects:v128 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    os_signpost_id_t spid = v7;
    v100 = v10;
    uint64_t v16 = *(void *)v117;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v117 != v16) {
          objc_enumerationMutation(v13);
        }
        char v18 = [*(id *)(*((void *)&v116 + 1) + 8 * i) uuid];
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v18];
        uint64_t v19 = PLBackendGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v125 = v18;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Invalid asset with identifier:%@", buf, 0xCu);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v116 objects:v128 count:16];
    }
    while (v15);
    id v10 = v100;
    unint64_t v6 = v3 - 1;
    uint64_t v7 = spid;
  }
LABEL_23:

  uint64_t v24 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v27 = v5;
  v28 = v27;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v28, OS_SIGNPOST_INTERVAL_END, v3, "ValidateAssetsPerBatch", "", buf, 2u);
  }

  v29 = &off_19BA99000;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v125 = "ValidateAssetsPerBatch";
    __int16 v126 = 2048;
    double v127 = (float)((float)((float)((float)(v24 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  id v30 = *(id *)(a1 + 32);
  os_signpost_id_t v31 = os_signpost_id_generate(v30);
  mach_timebase_info v115 = 0;
  mach_timebase_info(&v115);
  id v32 = v30;
  v33 = v32;
  unint64_t v101 = v31 - 1;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "ValidateMomentsPerBatch", "", buf, 2u);
  }

  uint64_t v98 = mach_absolute_time();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 112));
  v114 = v10;
  v35 = [WeakRetained allInvalidMomentsWithError:&v114];
  char v36 = v114;

  os_signpost_id_t spida = v31;
  if (!v35)
  {
    v39 = PLBackendGetLog();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_50;
    }
    *(_DWORD *)buf = 138412290;
    v125 = v36;
    v46 = "[MomentsGeneration.Validation] Could not fetch invalid moments with error:%@";
    v47 = v39;
    os_log_type_t v48 = OS_LOG_TYPE_ERROR;
    uint32_t v49 = 12;
LABEL_49:
    _os_log_impl(&dword_19B3C7000, v47, v48, v46, buf, v49);
    goto LABEL_50;
  }
  if (![v35 count])
  {
    v39 = PLMomentsGetLog();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_50;
    }
    *(_WORD *)buf = 0;
    v46 = "[MomentsGeneration.Validation] All moments valid";
    v47 = v39;
    os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
    uint32_t v49 = 2;
    goto LABEL_49;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  v37 = PLBackendGetLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    uint64_t v38 = [v35 count];
    *(_DWORD *)buf = 134217984;
    v125 = (const char *)v38;
    _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Detected %lu invalid moments", buf, 0xCu);
  }

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v39 = v35;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v110 objects:v123 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    v91 = v35;
    v93 = v36;
    v88 = v28;
    uint64_t v42 = *(void *)v111;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v111 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = [*(id *)(*((void *)&v110 + 1) + 8 * j) uuid];
        [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v44];
        v45 = PLBackendGetLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v125 = v44;
          _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Invalid moment with identifier:%@", buf, 0xCu);
        }
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v110 objects:v123 count:16];
    }
    while (v41);
    v28 = v88;
    v29 = &off_19BA99000;
    v35 = v91;
    char v36 = v93;
  }
LABEL_50:

  uint64_t v50 = mach_absolute_time();
  uint32_t v52 = v115.numer;
  uint32_t v51 = v115.denom;
  v53 = v33;
  v54 = v53;
  if (v101 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v54, OS_SIGNPOST_INTERVAL_END, spida, "ValidateMomentsPerBatch", "", buf, 2u);
  }

  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v29 + 105);
    v125 = "ValidateMomentsPerBatch";
    __int16 v126 = 2048;
    double v127 = (float)((float)((float)((float)(v50 - v98) * (float)v52) / (float)v51) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v55 = v29;
  v56 = *(id *)(a1 + 32);
  os_signpost_id_t v57 = os_signpost_id_generate(v56);
  mach_timebase_info v109 = 0;
  mach_timebase_info(&v109);
  v58 = v56;
  v59 = v58;
  unint64_t v99 = v57 - 1;
  if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v59, OS_SIGNPOST_INTERVAL_BEGIN, v57, "ValidateHighlightsPerBatch", "", buf, 2u);
  }
  spidb = v59;

  uint64_t v94 = mach_absolute_time();
  id v60 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 112));
  v108 = v36;
  v61 = [v60 allInvalidPhotosHighlightsOfAllKindsWithError:&v108];
  v62 = v108;

  v63 = v61;
  v102 = v62;
  if (!v61)
  {
    v67 = PLBackendGetLog();
    uint64_t v65 = (uint64_t)v55;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v125 = v62;
      v77 = "[MomentsGeneration.Validation] Could not fetch invalid highlights with error:%@";
      v78 = v67;
      os_log_type_t v79 = OS_LOG_TYPE_ERROR;
      uint32_t v80 = 12;
LABEL_76:
      _os_log_impl(&dword_19B3C7000, v78, v79, v77, buf, v80);
    }
LABEL_77:
    v69 = v103;
    goto LABEL_78;
  }
  if (![v61 count])
  {
    v67 = PLMomentsGetLog();
    uint64_t v65 = (uint64_t)v55;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v77 = "[MomentsGeneration.Validation] All highlights valid";
      v78 = v67;
      os_log_type_t v79 = OS_LOG_TYPE_DEFAULT;
      uint32_t v80 = 2;
      goto LABEL_76;
    }
    goto LABEL_77;
  }
  v90 = v61;
  v92 = v35;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  v64 = PLBackendGetLog();
  uint64_t v65 = (uint64_t)v55;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
  {
    uint64_t v66 = [v90 count];
    *(_DWORD *)buf = 134217984;
    v125 = (const char *)v66;
    _os_log_impl(&dword_19B3C7000, v64, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Detected %lu invalid highlights", buf, 0xCu);
  }

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  v63 = v90;
  v67 = v90;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v104 objects:v122 count:16];
  v69 = v103;
  if (v68)
  {
    uint64_t v70 = v68;
    os_signpost_id_t v86 = v57;
    v87 = v54;
    v89 = v28;
    uint64_t v71 = *(void *)v105;
    do
    {
      for (uint64_t k = 0; k != v70; ++k)
      {
        if (*(void *)v105 != v71) {
          objc_enumerationMutation(v67);
        }
        v73 = *(void **)(*((void *)&v104 + 1) + 8 * k);
        objc_msgSend(v73, "uuid", v86, v87);
        double v74 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:*(void *)&v74];
        +[PLPhotosHighlight stringFromHighlightKind:](PLPhotosHighlight, "stringFromHighlightKind:", [v73 kind]);
        v75 = (char *)objc_claimAutoreleasedReturnValue();
        v76 = PLBackendGetLog();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v125 = v75;
          __int16 v126 = 2112;
          double v127 = v74;
          _os_log_impl(&dword_19B3C7000, v76, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Invalid %@ highlight with identifier:%@", buf, 0x16u);
        }
      }
      uint64_t v70 = [v67 countByEnumeratingWithState:&v104 objects:v122 count:16];
    }
    while (v70);
    v69 = v103;
    v54 = v87;
    v28 = v89;
    uint64_t v65 = 0x19BA99000;
    v63 = v90;
    v35 = v92;
    os_signpost_id_t v57 = v86;
  }
LABEL_78:

  uint64_t v81 = mach_absolute_time();
  uint32_t v83 = v109.numer;
  uint32_t v82 = v109.denom;
  v84 = spidb;
  v85 = v84;
  if (v99 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v85, OS_SIGNPOST_INTERVAL_END, v57, "ValidateHighlightsPerBatch", "", buf, 2u);
  }

  if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *(void *)(v65 + 840);
    v125 = "ValidateHighlightsPerBatch";
    __int16 v126 = 2048;
    double v127 = (float)((float)((float)((float)(v81 - v94) * (float)v83) / (float)v82) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v85, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

uint64_t __57__PLMomentGeneration_validateLibraryWithCompletionBlock___block_invoke_270(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && *(unsigned char *)(a1 + 88))
  {
    uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
    id v5 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@\n\n", @"Photos has detected some inconsistencies in the curation."];
    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
    {
      objc_msgSend(v5, "appendFormat:", @"%lu asset identifiers:\n", v2);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v6 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v33 != v9) {
              objc_enumerationMutation(v6);
            }
            [v5 appendFormat:@"%@\n", *(void *)(*((void *)&v32 + 1) + 8 * i)];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v8);
      }

      [v5 appendString:@"\n"];
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
    {
      objc_msgSend(v5, "appendFormat:", @"%lu moment identifiers:\n", v3);
      [v5 appendString:@"Moment identifiers:\n"];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v11 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            [v5 appendFormat:@"%@\n", *(void *)(*((void *)&v28 + 1) + 8 * j)];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v13);
      }

      [v5 appendString:@"\n"];
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
    {
      objc_msgSend(v5, "appendFormat:", @"%lu highlight identifiers:\n", v4);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v16 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          for (uint64_t k = 0; k != v18; ++k)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            [v5 appendFormat:@"%@\n", *(void *)(*((void *)&v24 + 1) + 8 * k)];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
        }
        while (v18);
      }

      [v5 appendString:@"\n"];
    }
    uint64_t v21 = [NSString stringWithFormat:@"%@ Please file a radar to help diagnose the problem.", @"Photos has detected some inconsistencies in the curation."];
    os_log_type_t v22 = [NSString stringWithFormat:@"Photos Clustering Error (%lu, %lu, %lu)", v2, v3, v4];
    +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Photos Curation Inconsistencies" message:v21 radarTitle:v22 radarDescription:v5];
  }
  [*(id *)(a1 + 32) setPreviousValidatedModelVersion:*(void *)(a1 + 80)];
  [*(id *)(a1 + 32) setPreviousValidationSucceeded:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)allMomentsMetadataWriteToFile:(id)a3
{
  id v4 = a3;
  id v5 = [(PLMomentGeneration *)self momentGenerationDataManager];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__108981;
  void v21[4] = __Block_byref_object_dispose__108982;
  id v22 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__108981;
  uint64_t v19 = __Block_byref_object_dispose__108982;
  id v20 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PLMomentGeneration_allMomentsMetadataWriteToFile___block_invoke;
  v10[3] = &unk_1E5874900;
  uint64_t v13 = v21;
  id v6 = v5;
  uint64_t v14 = &v15;
  id v11 = v6;
  uint64_t v12 = self;
  [v6 performBlock:v10 synchronously:1 completionHandler:0];
  if (v4)
  {
    if (![(PLMomentGeneration *)self _writeDetails:v16[5] toFilepath:v4 withDefaultFilename:@"momentsMetadataDump.plist"])NSLog(&cfstr_ThereWasAnErro_0.isa, v4); {
    uint64_t v7 = (void *)v16[5];
    }
    v16[5] = 0;
  }
  id v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);

  return v8;
}

void __52__PLMomentGeneration_allMomentsMetadataWriteToFile___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) allMomentsWithError:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        uint64_t v15 = (void *)MEMORY[0x19F38D3B0](v10);
        id v16 = objc_msgSend(*(id *)(a1 + 40), "_detailsForMoment:", v14, (void)v17);
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v11 = v10;
    }
    while (v10);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setValue:v8 forKey:@"AllMoments"];
}

- (id)_detailsForMoment:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 approximateLocation];

    if (v6)
    {
      uint64_t v7 = [v5 approximateLocation];
      [v7 coordinate];
      double v9 = v8;
      double v11 = v10;

      uint64_t v12 = [NSNumber numberWithDouble:v9];
      uint64_t v13 = [NSNumber numberWithDouble:v11];
      v32[0] = @"MomentApproximateLocationLatitude";
      v32[1] = @"MomentApproximateLocationLongitude";
      v33[0] = v12;
      v33[1] = v13;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v15 = [v5 startDate];
    [v14 setValue:v15 forKey:@"MomentStartDate"];

    id v16 = [v5 endDate];
    [v14 setValue:v16 forKey:@"MomentEndDate"];

    long long v17 = [v5 representativeDate];
    [v14 setValue:v17 forKey:@"MomentRepresentativeDate"];

    [v14 setValue:v6 forKey:@"MomentApproximateLocation"];
    long long v18 = [v5 assets];
    long long v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = -[PLMomentGeneration _detailsForAsset:simpleOnly:](self, "_detailsForAsset:simpleOnly:", *(void *)(*((void *)&v27 + 1) + 8 * i), 0, (void)v27);
          [v19 addObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v22);
    }

    [v14 setValue:v19 forKey:@"MomentAssets"];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)allAssetMetadataWriteToFile:(id)a3
{
  id v4 = a3;
  id v5 = [(PLMomentGeneration *)self momentGenerationDataManager];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__108981;
  uint64_t v21 = __Block_byref_object_dispose__108982;
  id v22 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __50__PLMomentGeneration_allAssetMetadataWriteToFile___block_invoke;
  uint64_t v13 = &unk_1E5875340;
  id v6 = v5;
  uint64_t v15 = self;
  id v16 = &v17;
  id v14 = v6;
  [v6 performBlock:&v10 synchronously:1 completionHandler:0];
  if (v4)
  {
    if (![(PLMomentGeneration *)self _writeDetails:v18[5] toFilepath:v4 withDefaultFilename:@"metadataDump.plist"])NSLog(&cfstr_ThereWasAnErro_0.isa, v4, v10, v11, v12, v13); {
    uint64_t v7 = (void *)v18[5];
    }
    v18[5] = 0;
  }
  id v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __50__PLMomentGeneration_allAssetMetadataWriteToFile___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) allAssetsToBeIncludedInMomentsWithError:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v7 = [MEMORY[0x1E4F1C978] array];
  [v6 setObject:v7 forKey:@"AllMoments"];

  id v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  double v9 = [MEMORY[0x1E4F1C978] array];
  [v8 setObject:v9 forKey:@"AllMomentLists"];

  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v2;
  uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = [*(id *)(a1 + 40) _detailsForAsset:*(void *)(*((void *)&v22 + 1) + 8 * v15) simpleOnly:0];
        ++v15;
        uint64_t v17 = v13 + v15;
        long long v18 = [NSNumber numberWithInteger:v13 + v15];
        [v16 setValue:v18 forKey:@"AssetID"];

        [v10 addObject:v16];
      }
      while (v12 != v15);
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      v13 += v15;
    }
    while (v12);
  }
  else
  {
    uint64_t v17 = 0;
  }

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setValue:v10 forKey:@"AllAssets"];
  uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v20 = [NSNumber numberWithInteger:v17];
  [v19 setObject:v20 forKey:@"CurrentMaxID"];
}

- (id)_logEntryForAssets:(id)a3 isBatchUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = [NSNumber numberWithBool:v4];
  [v7 setObject:v8 forKey:@"EntryIsBatchUpdate"];

  double v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = -[PLMomentGeneration _detailsForAsset:simpleOnly:](self, "_detailsForAsset:simpleOnly:", *(void *)(*((void *)&v17 + 1) + 8 * i), 1, (void)v17);
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [v7 setObject:v9 forKey:@"AllAssets"];
  return v7;
}

- (void)_appendAssetsToReplayLog:(id)a3 forBatchUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PLMomentGeneration *)self momentGenerationDataManager];
  id v8 = [v7 replayLogPath];

  double v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8];
  if (v9)
  {
    id v42 = 0;
    id v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:&v42];
    id v11 = v42;
    if (v11)
    {
      uint64_t v12 = PLMomentsGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [v11 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v44 = v13;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Error reading replay log: %@", buf, 0xCu);
      }
    }
    if (v10)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];

      goto LABEL_10;
    }
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
  [v14 setObject:&unk_1EEBF0AA0 forKey:@"ReplayLogAssetCount"];
LABEL_10:
  uint64_t v15 = [v14 objectForKey:@"ReplayLogAssetCount"];
  uint64_t v16 = [v15 integerValue];

  if ((unint64_t)([v6 count] + v16) < 0x2711)
  {
    uint64_t v18 = [v6 count] + v16;
    long long v17 = [v14 objectForKey:@"ReplayStream"];
    long long v19 = [MEMORY[0x1E4F1CA48] arrayWithArray:v17];
    if ([v6 count])
    {
      long long v20 = [(PLMomentGeneration *)self _logEntryForAssets:v6 isBatchUpdate:v4];
      [v19 addObject:v20];
    }
    uint64_t v21 = v19;
    [v14 setObject:v19 forKey:@"ReplayStream"];
    uint64_t v22 = [NSNumber numberWithInteger:v18];
    [v14 setObject:v22 forKey:@"ReplayLogAssetCount"];

    id v41 = 0;
    long long v23 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:200 options:0 error:&v41];
    id v24 = v41;

    if (v24)
    {
      long long v25 = PLMomentsGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        long long v26 = [v24 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v44 = v26;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Error reading moments replay log plist: %@", buf, 0xCu);
      }
      goto LABEL_30;
    }
    long long v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v38 = [v8 stringByDeletingLastPathComponent];
    if ((-[NSObject fileExistsAtPath:](v25, "fileExistsAtPath:") & 1) != 0
      || (id v40 = 0,
          int v27 = [v25 createDirectoryAtPath:v38 withIntermediateDirectories:0 attributes:0 error:&v40], v28 = v40, v29 = v28, v27)&& !v28)
    {
      id v39 = 0;
      int v30 = [v23 writeToFile:v8 options:0 error:&v39];
      id v31 = v39;
      long long v29 = v31;
      if (v30)
      {
        id v24 = 0;
        if (!v31) {
          goto LABEL_29;
        }
      }
      long long v32 = PLMomentsGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        [v29 localizedDescription];
        long long v33 = v37 = v32;
        *(_DWORD *)buf = 138412290;
        v44 = v33;
        long long v34 = "Error writing moments replay log data: %@";
        long long v35 = v37;
        uint32_t v36 = 12;
LABEL_27:
        _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);

        long long v32 = v37;
      }
    }
    else
    {
      long long v32 = PLMomentsGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        [v29 localizedDescription];
        long long v33 = v37 = v32;
        *(_DWORD *)buf = 138412546;
        long long v35 = v37;
        v44 = v38;
        __int16 v45 = 2112;
        v46 = v33;
        long long v34 = "Unable to create directory at %@ for moments replay log: %@";
        uint32_t v36 = 22;
        goto LABEL_27;
      }
    }

    id v24 = v29;
LABEL_29:

LABEL_30:
    id v11 = v24;
    goto LABEL_31;
  }
  long long v17 = PLMomentsGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Moment generation has exceeded the maximum replay log size. Not logging", buf, 2u);
  }
LABEL_31:
}

- (void)_clearReplayLog
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PLMomentGeneration *)self momentGenerationDataManager];
  id v3 = [v2 replayLogPath];

  BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  int v5 = [v4 removeItemAtPath:v3 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    double v9 = PLMomentsGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v7 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error deleting replay log file: %@", buf, 0xCu);
    }
  }
}

- (id)_detailsForAsset:(id)a3 simpleOnly:(BOOL)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = [v5 location];

    if (v7)
    {
      BOOL v8 = [v5 location];
      [v8 coordinate];
      double v10 = v9;
      double v12 = v11;

      uint64_t v13 = [NSNumber numberWithDouble:v10];
      uint64_t v14 = [NSNumber numberWithDouble:v12];
      v29[0] = @"AssetLocationLatitude";
      v29[1] = @"AssetLocationLongitude";
      v30[0] = v13;
      v30[1] = v14;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    }
    [v6 setValue:v7 forKey:@"AssetLocation"];
    uint64_t v15 = [v5 dateCreated];
    [v6 setValue:v15 forKey:@"AssetDateCreated"];

    if (!a4)
    {
      uint64_t v16 = [v5 cloudAssetGUID];
      uint64_t v17 = [v5 uuid];
      uint64_t v18 = (void *)v17;
      if (v16) {
        long long v19 = v16;
      }
      else {
        long long v19 = (void *)v17;
      }
      [v6 setValue:v19 forKey:@"AssetCloudOrLocalID"];
      long long v20 = [v5 modificationDate];
      [v6 setValue:v20 forKey:@"AssetModificationDate"];

      uint64_t v21 = NSNumber;
      [v5 duration];
      uint64_t v22 = objc_msgSend(v21, "numberWithDouble:");
      [v6 setValue:v22 forKey:@"AssetDuration"];

      long long v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "favorite"));
      [v6 setValue:v23 forKey:@"AssetIsFavorite"];

      id v24 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v5, "kind"));
      [v6 setValue:v24 forKey:@"AssetKind"];

      long long v25 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v5, "kindSubtype"));
      [v6 setValue:v25 forKey:@"AssetKindSubtype"];

      long long v26 = objc_msgSend(NSNumber, "numberWithShort:", (__int16)objc_msgSend(v5, "height"));
      [v6 setValue:v26 forKey:@"AssetHeight"];

      int v27 = objc_msgSend(NSNumber, "numberWithShort:", (__int16)objc_msgSend(v5, "width"));
      [v6 setValue:v27 forKey:@"AssetWidth"];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_writeDetails:(id)a3 toFilepath:(id)a4 withDefaultFilename:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v8 pathExtension];
  if (![v10 isEqual:&stru_1EEB2EB80]) {
    goto LABEL_7;
  }
  char v18 = 0;
  double v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v12 = [v11 fileExistsAtPath:v8 isDirectory:&v18];

  if (v12)
  {
    if (!v18) {
      goto LABEL_7;
    }
    uint64_t v13 = [v8 stringByAppendingPathComponent:v9];
  }
  else
  {
    uint64_t v13 = [v8 stringByAppendingPathExtension:@"plist"];
  }
  uint64_t v14 = (void *)v13;

  id v8 = v14;
LABEL_7:
  if (v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:100 options:0 error:0];
    char v16 = [v15 writeToFile:v8 options:1073741825 error:0];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (id)momentGenerationStatus
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  pl_dispatch_sync();
  if (*((unsigned char *)v21 + 24)) {
    uint64_t v2 = @"YES";
  }
  else {
    uint64_t v2 = @"NO";
  }
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"In Progress: %@\n", v2, v6, 3221225472, __44__PLMomentGeneration_momentGenerationStatus__block_invoke, &unk_1E5874340, self, &v20, &v16, &v12, &v8];
  BOOL v4 = v3;
  if (*((unsigned char *)v21 + 24)) {
    objc_msgSend(v3, "appendFormat:", @"\tIn progress count: %lu\n", v17[3]);
  }
  objc_msgSend(v4, "appendFormat:", @"Pending Update Count: %lu\n", v13[3]);
  objc_msgSend(v4, "appendFormat:", @"Pending Delete Count: %lu\n", v9[3]);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v4;
}

uint64_t __44__PLMomentGeneration_momentGenerationStatus__block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [*(id *)(a1[4] + 88) isIdle] ^ 1;
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 8);
  *(void *)(*(void *)(a1[7] + 8) + 24) = [*(id *)(a1[4] + 16) count];
  uint64_t result = [*(id *)(a1[4] + 24) count];
  *(void *)(*(void *)(a1[8] + 8) + 24) = result;
  return result;
}

- (void)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale:(BOOL)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(PLMomentGeneration *)self momentGenerationDataManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __116__PLMomentGeneration_invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale_completionBlock___block_invoke;
  v12[3] = &unk_1E5874318;
  BOOL v15 = a3;
  id v13 = v7;
  uint64_t v14 = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __116__PLMomentGeneration_invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale_completionBlock___block_invoke_143;
  v10[3] = &unk_1E5875198;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [v9 performDataTransaction:v12 synchronously:1 completionHandler:v10];
}

void __116__PLMomentGeneration_invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 48)) {
      id v3 = @"yes";
    }
    else {
      id v3 = @"no";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v68 = (const char *)v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating highlight subtitles and re-generating highlight titles, forceUpdateLocale: %@.", buf, 0xCu);
  }

  PLMomentGenerationGetLog();
  BOOL v4 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v6 = v4;
  id v7 = v6;
  unint64_t v57 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "RegenerateTitle", "", buf, 2u);
  }

  uint64_t v8 = mach_absolute_time();
  [*(id *)(a1 + 32) invalidateAllHighlightSubtitles];
  id v9 = *(id *)(*(void *)(a1 + 40) + 104);
  uint64_t v10 = (void *)MEMORY[0x19F38D3B0]();
  id v11 = *(void **)(a1 + 32);
  id v64 = 0;
  uint64_t v12 = [v11 allPhotosHighlightsOfKind:1 error:&v64];
  id v13 = (char *)v64;
  uint64_t v14 = PLMomentsGetLog();
  BOOL v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v68 = v13;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Fetching Months failed: %@", buf, 0xCu);
    }

    uint64_t v16 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    uint64_t v19 = v7;
    uint64_t v20 = v19;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v5, "RegenerateTitle", "", buf, 2u);
    }

    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [v12 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v68 = (const char *)v21;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Generating highlight titles/subtitles for %zu month highlights.", buf, 0xCu);
  }

  +[PLPhotosHighlightGenerator updateTitleForHighlights:v12 forKind:1 forceUpdateLocale:*(unsigned __int8 *)(a1 + 48) dateRangeTitleGenerator:v9];
  uint64_t v10 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v22 = *(void **)(a1 + 32);
  id v63 = 0;
  uint64_t v12 = [v22 allPhotosHighlightsOfKind:2 error:&v63];
  id v13 = (char *)v63;
  char v23 = PLMomentsGetLog();
  id v24 = v23;
  if (v13)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v68 = v13;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Fetching Years failed: %@", buf, 0xCu);
    }

    uint64_t v16 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    long long v25 = v7;
    uint64_t v20 = v25;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v5, "RegenerateTitle", "", buf, 2u);
    }

    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
LABEL_26:
    *(_DWORD *)buf = 136315394;
    uint64_t v68 = "RegenerateTitle";
    __int16 v69 = 2048;
    double v70 = (float)((float)((float)((float)(v16 - v8) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v56 = v8;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = [v12 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v68 = (const char *)v26;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Generating highlight titles/subtitles for %zu year highlights.", buf, 0xCu);
  }

  +[PLPhotosHighlightGenerator updateTitleForHighlights:v12 forKind:2 forceUpdateLocale:*(unsigned __int8 *)(a1 + 48) dateRangeTitleGenerator:v9];
  int v27 = (void *)MEMORY[0x19F38D3B0]();
  id v28 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %ld OR %K = %ld", @"kind", 0, @"kind", 3);
  long long v29 = *(void **)(a1 + 32);
  id v62 = 0;
  int v30 = [v29 allPhotosHighlightsWithPredicate:v28 error:&v62];
  id v31 = (char *)v62;
  long long v32 = PLMomentsGetLog();
  long long v33 = v32;
  if (v31)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v68 = v31;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Fetching Days and DayGroups failed: %@", buf, 0xCu);
    }

    uint64_t v34 = mach_absolute_time();
    uint32_t v36 = info.numer;
    uint32_t v35 = info.denom;
    v37 = v7;
    uint64_t v38 = v37;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v38, OS_SIGNPOST_INTERVAL_END, v5, "RegenerateTitle", "", buf, 2u);
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v68 = "RegenerateTitle";
      __int16 v69 = 2048;
      double v70 = (float)((float)((float)((float)(v34 - v56) * (float)v36) / (float)v35) / 1000000.0);
      _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    v53 = v28;
    context = v27;
    id v55 = v9;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = [v30 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v68 = (const char *)v39;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "Generating highlight titles/subtitles for %zu day/dayGroup highlights.", buf, 0xCu);
    }

    uint64_t v40 = *(unsigned __int8 *)(a1 + 48);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v41 = v30;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v59 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          uint64_t v47 = (void *)MEMORY[0x19F38D3B0]();
          +[PLPhotosHighlightGenerator updateTitlesForHighlight:v46 dateRangeTitleGenerator:*(void *)(*(void *)(a1 + 40) + 104) options:v40];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v43);
    }

    uint64_t v48 = mach_absolute_time();
    uint32_t v50 = info.numer;
    uint32_t v49 = info.denom;
    uint32_t v51 = v7;
    uint32_t v52 = v51;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v52, OS_SIGNPOST_INTERVAL_END, v5, "RegenerateTitle", "", buf, 2u);
    }

    id v9 = v55;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v68 = "RegenerateTitle";
      __int16 v69 = 2048;
      double v70 = (float)((float)((float)((float)(v48 - v56) * (float)v50) / (float)v49) / 1000000.0);
      _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
LABEL_28:
}

uint64_t __116__PLMomentGeneration_invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale_completionBlock___block_invoke_143(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:(id)a3
{
}

- (void)locationOfInterestUpdateWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  id v6 = [WeakRetained isolationQueue];
  id v7 = v4;
  pl_dispatch_async();
}

void __66__PLMomentGeneration_locationOfInterestUpdateWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) momentGenerationDataManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PLMomentGeneration_locationOfInterestUpdateWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E5875CE0;
  v5[4] = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__PLMomentGeneration_locationOfInterestUpdateWithCompletionBlock___block_invoke_3;
  v3[3] = &unk_1E5875198;
  id v4 = *(id *)(a1 + 40);
  [v2 performDataTransaction:v5 synchronously:1 completionHandler:v3];
}

void __66__PLMomentGeneration_locationOfInterestUpdateWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _highlightGenerator];
  [v1 processCachedLocationOfInterest];
}

uint64_t __66__PLMomentGeneration_locationOfInterestUpdateWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)cleanupEmptyHighlightsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  id v6 = [WeakRetained isolationQueue];
  id v7 = v4;
  pl_dispatch_async();
}

void __64__PLMomentGeneration_cleanupEmptyHighlightsWithCompletionBlock___block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v3 = PLMomentGenerationGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  os_signpost_id_t v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CleanupEmptyHighlights", "", buf, 2u);
  }

  id v7 = [*(id *)(a1 + 32) momentGenerationDataManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PLMomentGeneration_cleanupEmptyHighlightsWithCompletionBlock___block_invoke_128;
  v14[3] = &unk_1E5875CE0;
  v14[4] = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PLMomentGeneration_cleanupEmptyHighlightsWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E5874278;
  uint64_t v10 = v6;
  os_signpost_id_t v12 = v4;
  CFAbsoluteTime v13 = Current;
  id v11 = *(id *)(a1 + 40);
  uint64_t v8 = v6;
  [v7 performDataTransaction:v14 synchronously:1 completionHandler:v9];
}

void __64__PLMomentGeneration_cleanupEmptyHighlightsWithCompletionBlock___block_invoke_128(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _highlightGenerator];
  [v1 cleanupEmptyHighlights];
}

uint64_t __64__PLMomentGeneration_cleanupEmptyHighlightsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CleanupEmptyHighlights", "", (uint8_t *)&v8, 2u);
  }

  os_signpost_id_t v5 = PLMomentsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    int v8 = 134217984;
    CFAbsoluteTime v9 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Cleanup Empty Highlights finished in %.2f", (uint8_t *)&v8, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateHighlightTitlesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  CFAbsoluteTime v6 = [WeakRetained isolationQueue];
  id v7 = v4;
  pl_dispatch_async();
}

void __63__PLMomentGeneration_updateHighlightTitlesWithCompletionBlock___block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v3 = PLMomentGenerationGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  os_signpost_id_t v5 = v3;
  CFAbsoluteTime v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "UpdateHighlightTitles", "", buf, 2u);
  }

  id v7 = [*(id *)(a1 + 32) momentGenerationDataManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__PLMomentGeneration_updateHighlightTitlesWithCompletionBlock___block_invoke_127;
  v14[3] = &unk_1E5875CE0;
  v14[4] = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PLMomentGeneration_updateHighlightTitlesWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E5874278;
  uint64_t v10 = v6;
  os_signpost_id_t v12 = v4;
  CFAbsoluteTime v13 = Current;
  id v11 = *(id *)(a1 + 40);
  int v8 = v6;
  [v7 performDataTransaction:v14 synchronously:1 completionHandler:v9];
}

void __63__PLMomentGeneration_updateHighlightTitlesWithCompletionBlock___block_invoke_127(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _highlightGenerator];
  [v1 updateHighlightTitles];
}

uint64_t __63__PLMomentGeneration_updateHighlightTitlesWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "UpdateHighlightTitles", "", (uint8_t *)&v8, 2u);
  }

  os_signpost_id_t v5 = PLMomentsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    int v8 = 134217984;
    CFAbsoluteTime v9 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Update Highlight Titles finished in %.2f", (uint8_t *)&v8, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)processUnprocessedMomentLocationsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  CFAbsoluteTime v6 = [WeakRetained isolationQueue];
  id v7 = v4;
  pl_dispatch_async();
}

void __75__PLMomentGeneration_processUnprocessedMomentLocationsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) momentGenerationDataManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PLMomentGeneration_processUnprocessedMomentLocationsWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E5875CE0;
  v5[4] = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__PLMomentGeneration_processUnprocessedMomentLocationsWithCompletionBlock___block_invoke_3;
  v3[3] = &unk_1E5875198;
  id v4 = *(id *)(a1 + 40);
  [v2 performDataTransaction:v5 synchronously:1 completionHandler:v3];
}

void __75__PLMomentGeneration_processUnprocessedMomentLocationsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _highlightGenerator];
  [v1 processUnprocessedMomentLocations];
}

uint64_t __75__PLMomentGeneration_processUnprocessedMomentLocationsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)processRecentHighlightsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  CFAbsoluteTime v6 = [WeakRetained isolationQueue];
  id v7 = v4;
  pl_dispatch_async();
}

void __65__PLMomentGeneration_processRecentHighlightsWithCompletionBlock___block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v3 = PLMomentGenerationGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  os_signpost_id_t v5 = v3;
  CFAbsoluteTime v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ProcessRecentHighlights", "", buf, 2u);
  }

  id v7 = [*(id *)(a1 + 32) momentGenerationDataManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__PLMomentGeneration_processRecentHighlightsWithCompletionBlock___block_invoke_126;
  v14[3] = &unk_1E5875CE0;
  v14[4] = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PLMomentGeneration_processRecentHighlightsWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E5874278;
  uint64_t v10 = v6;
  os_signpost_id_t v12 = v4;
  CFAbsoluteTime v13 = Current;
  id v11 = *(id *)(a1 + 40);
  int v8 = v6;
  [v7 performDataTransaction:v14 synchronously:1 completionHandler:v9];
}

void __65__PLMomentGeneration_processRecentHighlightsWithCompletionBlock___block_invoke_126(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _highlightGenerator];
  [v1 processRecentHighlights];
}

uint64_t __65__PLMomentGeneration_processRecentHighlightsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ProcessRecentHighlights", "", (uint8_t *)&v8, 2u);
  }

  os_signpost_id_t v5 = PLMomentsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    int v8 = 134217984;
    CFAbsoluteTime v9 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Process Recent Highlights finished in %.2f", (uint8_t *)&v8, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)rebuildAllHighlightsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PLPlatformMomentsSupported())
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime v9 = PLMomentsGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment incremental rebuild starting", buf, 2u);
    }

    uint64_t v10 = PLMomentGenerationGetLog();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);
    os_signpost_id_t v12 = v10;
    CFAbsoluteTime v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FullRebuild", "", buf, 2u);
    }

    uint64_t v14 = [v6 objectForKey:PLMomentGenerationShouldDeleteAllHighlightsKey];
    char v15 = [v14 BOOLValue];

    uint64_t v16 = [(PLMomentGeneration *)self momentGenerationDataManager];
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    char v45 = 0;
    *(void *)buf = 0;
    uint64_t v39 = buf;
    uint64_t v40 = 0x3032000000;
    id v41 = __Block_byref_object_copy__108981;
    uint64_t v42 = __Block_byref_object_dispose__108982;
    id v43 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __72__PLMomentGeneration_rebuildAllHighlightsWithOptions_completionHandler___block_invoke;
    v33[3] = &unk_1E58742A0;
    char v37 = v15;
    uint32_t v35 = v44;
    id v17 = v16;
    id v34 = v17;
    uint32_t v36 = buf;
    [v17 performDataTransaction:v33 synchronously:1 completionHandler:0];
    if ([v17 wantsMomentReplayLogging]) {
      [(PLMomentGeneration *)self _clearReplayLog];
    }
    uint64_t v18 = dispatch_group_create();
    dispatch_group_enter(v18);
    BOOL v19 = [(PLMomentGenerationThrottle *)self->_incrementalMomentGenThrottle singleThreaded];
    [(PLMomentGenerationThrottle *)self->_incrementalMomentGenThrottle setSingleThreaded:1];
    uint64_t v20 = *((void *)v39 + 5);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __72__PLMomentGeneration_rebuildAllHighlightsWithOptions_completionHandler___block_invoke_125;
    v27[3] = &unk_1E58742C8;
    uint64_t v21 = v13;
    id v28 = v21;
    os_signpost_id_t v31 = v11;
    CFAbsoluteTime v32 = Current;
    id v30 = v7;
    uint64_t v22 = v18;
    long long v29 = v22;
    [(PLMomentGeneration *)self generateWithAssetInsertsAndUpdates:MEMORY[0x1E4F1CBF0] assetDeletes:0 assetUpdatesForHighlights:0 momentUpdatesForHighlights:v20 completionHandler:v27];
    char v23 = PLMomentsGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v26 = 0;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment incremental rebuild, waiting for completion...", (uint8_t *)&v26, 2u);
    }

    dispatch_group_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
    [(PLMomentGenerationThrottle *)self->_incrementalMomentGenThrottle setSingleThreaded:v19];

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v44, 8);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
    long long v25 = [WeakRetained isolationQueue];
    pl_dispatch_async();
  }
}

void __72__PLMomentGeneration_rebuildAllHighlightsWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = PLMomentsGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Deleting existing highlights...", buf, 2u);
    }

    id v3 = *(void **)(a1 + 32);
    id v14 = 0;
    char v4 = [v3 deleteAllHighlightsWithError:&v14];
    id v5 = v14;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
    if (v5)
    {
      id v6 = PLMomentsGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Error deleting existing highlights %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  id v7 = *(void **)(a1 + 32);
  id v13 = v5;
  uint64_t v8 = [v7 allMomentIDsWithError:&v13];
  id v9 = v13;

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  os_signpost_id_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;

  if (v9)
  {
    os_signpost_id_t v12 = PLMomentsGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Error fetching moments %@", buf, 0xCu);
    }
  }
}

void __72__PLMomentGeneration_rebuildAllHighlightsWithOptions_completionHandler___block_invoke_125(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "FullRebuild", "", (uint8_t *)&v8, 2u);
  }

  id v5 = PLMomentsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    int v8 = 134217984;
    CFAbsoluteTime v9 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment incremental rebuild finished in %f", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)rebuildAllMomentsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PLPlatformMomentsSupported())
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime v9 = PLMomentsGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment incremental rebuild starting", buf, 2u);
    }

    uint64_t v10 = PLMomentGenerationGetLog();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);
    os_signpost_id_t v12 = v10;
    id v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FullRebuild", "", buf, 2u);
    }

    id v14 = [v6 objectForKey:PLMomentGenerationShouldDeleteAllMomentsKey];
    char v15 = [v14 BOOLValue];

    id v16 = [(PLMomentGeneration *)self momentGenerationDataManager];
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    char v40 = 0;
    *(void *)buf = 0;
    id v34 = buf;
    uint64_t v35 = 0x3032000000;
    uint32_t v36 = __Block_byref_object_copy__108981;
    char v37 = __Block_byref_object_dispose__108982;
    id v38 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__PLMomentGeneration_rebuildAllMomentsWithOptions_completionHandler___block_invoke;
    v27[3] = &unk_1E5874250;
    char v32 = v15;
    id v30 = v39;
    id v17 = v16;
    id v28 = v17;
    os_signpost_id_t v31 = buf;
    id v29 = v6;
    [v17 performDataTransaction:v27 synchronously:1 completionHandler:0];
    if ([v17 wantsMomentReplayLogging]) {
      [(PLMomentGeneration *)self _clearReplayLog];
    }
    uint64_t v18 = *((void *)v34 + 5);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__PLMomentGeneration_rebuildAllMomentsWithOptions_completionHandler___block_invoke_124;
    v22[3] = &unk_1E5874278;
    BOOL v19 = v13;
    char v23 = v19;
    os_signpost_id_t v25 = v11;
    CFAbsoluteTime v26 = Current;
    id v24 = v7;
    [(PLMomentGeneration *)self generateWithAssetInsertsAndUpdates:v18 assetDeletes:0 assetUpdatesForHighlights:0 momentUpdatesForHighlights:0 completionHandler:v22];

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v39, 8);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
    uint64_t v21 = [WeakRetained isolationQueue];
    pl_dispatch_async();
  }
}

void __69__PLMomentGeneration_rebuildAllMomentsWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = PLMomentsGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Deleting existing moments and highlights", buf, 2u);
    }

    id v3 = *(void **)(a1 + 32);
    id v25 = 0;
    char v4 = [v3 deleteAllHighlightsWithError:&v25];
    id v5 = v25;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
    id v6 = *(void **)(a1 + 32);
    id v24 = v5;
    char v7 = [v6 deleteAllMomentsWithError:&v24];
    id v8 = v24;

    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v9 + 24)) {
      char v10 = v7;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)(v9 + 24) = v10;
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:PLMomentGenerationTargetedAssetOIDsKey];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = PLMomentsGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Rebuilding moments with %tu targetted assets", buf, 0xCu);
    }
  }
  else
  {
    id v17 = *(void **)(a1 + 32);
    id v23 = v8;
    uint64_t v18 = [v17 allAssetIDsToBeIncludedInMomentsWithError:&v23];
    id v19 = v23;

    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v18;

    id v16 = PLMomentsGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v22;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Rebuilding for all moments with %tu assests", buf, 0xCu);
    }
    id v8 = v19;
  }
}

uint64_t __69__PLMomentGeneration_rebuildAllMomentsWithOptions_completionHandler___block_invoke_124(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "FullRebuild", "", (uint8_t *)&v8, 2u);
  }

  id v5 = PLMomentsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    int v8 = 134217984;
    CFAbsoluteTime v9 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment incremental rebuild finished in %.2f s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_runMomentAndHighlightGenerationForAssets:(id)a3 hiddenAssets:(id)a4 updatedAssetIDsForHighlights:(id)a5 updatedMomentIDsForHighlights:(id)a6 affectedMoments:(id)a7 highlightsWithDeletedMoments:(id)a8 sharedAssetContainerIncrementalChanges:(id)a9 insertedOrUpdatedMoments:(id *)a10
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v82 = a5;
  id v81 = a6;
  id v18 = a7;
  id v79 = a8;
  id v19 = a9;
  uint64_t v20 = [(PLMomentGeneration *)self localCreationDateCreator];
  uint64_t v21 = [(PLMomentGeneration *)self frequentLocationManager];
  uint64_t v22 = (void *)MEMORY[0x19F38D3B0]();
  id v23 = [PLAssetCollectionGenerator alloc];
  id v24 = [(PLMomentGeneration *)self momentGenerationDataManager];
  v77 = (void *)v21;
  v78 = (void *)v20;
  id v25 = [(PLAssetCollectionGenerator *)v23 initWithDataManager:v24 frequentLocationManager:v21 localCreationDateCreator:v20];

  uint32_t v80 = v18;
  CFAbsoluteTime v26 = [(PLAssetCollectionGenerator *)v25 processMomentsWithAssets:v16 affectedMoments:v18];

  *a10 = [v26 insertedOrUpdatedMoments];
  uint64_t v27 = [(PLMomentGeneration *)self _highlightGenerator];
  if (v27)
  {
    context = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v28 = [(PLMomentGeneration *)self momentGenerationDataManager];
    id v75 = v17;
    id v76 = v16;
    [v27 beginGenerationWithAssets:v16 hiddenAssets:v17];
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __245__PLMomentGeneration__runMomentAndHighlightGenerationForAssets_hiddenAssets_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_affectedMoments_highlightsWithDeletedMoments_sharedAssetContainerIncrementalChanges_insertedOrUpdatedMoments___block_invoke;
    v99[3] = &unk_1E5874228;
    id v29 = v28;
    id v100 = v29;
    id v71 = v27;
    id v101 = v71;
    [v19 enumerateKeysAndObjectsUsingBlock:v99];
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __245__PLMomentGeneration__runMomentAndHighlightGenerationForAssets_hiddenAssets_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_affectedMoments_highlightsWithDeletedMoments_sharedAssetContainerIncrementalChanges_insertedOrUpdatedMoments___block_invoke_2;
    v97[3] = &unk_1E5876010;
    id v72 = v29;
    id v98 = v72;
    id v74 = v19;
    [v19 enumerateKeysAndObjectsUsingBlock:v97];
    id v30 = [(PLMomentGeneration *)self momentGenerationDataManager];
    id v96 = 0;
    os_signpost_id_t v31 = [v30 momentsForAssetsWithUniqueIDs:v82 error:&v96];
    id v32 = v96;
    long long v33 = (void *)MEMORY[0x1E4F1CBF0];
    if (v31) {
      id v34 = v31;
    }
    else {
      id v34 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v69 = v34;

    uint64_t v35 = [(PLMomentGeneration *)self momentGenerationDataManager];
    id v95 = v32;
    uint32_t v36 = [v35 momentsWithUniqueIDs:v81 error:&v95];
    id v70 = v95;

    if (v36) {
      char v37 = v36;
    }
    else {
      char v37 = v33;
    }
    id v38 = v37;

    uint64_t v39 = [MEMORY[0x1E4F1CA80] set];
    char v40 = [MEMORY[0x1E4F1CA80] set];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v41 = [v26 insertedOrUpdatedMoments];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v91 objects:v104 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v92 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          if (objc_msgSend(v46, "isDeleted", v69, v70)) {
            uint64_t v47 = v40;
          }
          else {
            uint64_t v47 = v39;
          }
          [v47 addObject:v46];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v91 objects:v104 count:16];
      }
      while (v43);
    }

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v48 = v69;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v87 objects:v103 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v88 != v51) {
            objc_enumerationMutation(v48);
          }
          v53 = *(void **)(*((void *)&v87 + 1) + 8 * j);
          if (objc_msgSend(v53, "isDeleted", v69)) {
            v54 = v40;
          }
          else {
            v54 = v39;
          }
          [v54 addObject:v53];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v87 objects:v103 count:16];
      }
      while (v50);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v55 = v38;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v83 objects:v102 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v57; ++k)
        {
          if (*(void *)v84 != v58) {
            objc_enumerationMutation(v55);
          }
          long long v60 = *(void **)(*((void *)&v83 + 1) + 8 * k);
          if (objc_msgSend(v60, "isDeleted", v69)) {
            long long v61 = v40;
          }
          else {
            long long v61 = v39;
          }
          [v61 addObject:v60];
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v83 objects:v102 count:16];
      }
      while (v57);
    }

    id v16 = v76;
    id v62 = v77;
    if ([v39 count] || objc_msgSend(v40, "count")) {
      objc_msgSend(v77, "invalidateCurrentFrequentLocations", v69);
    }
    id v63 = v79;
    objc_msgSend(v71, "registerHighlightsWithDeletedMoments:", v79, v69);
    objc_msgSend(v71, "generateHighlightsForUpsertedMoments:frequentLocationsDidChange:", v39, objc_msgSend(v26, "frequentLocationsDidChange"));
    [v71 finishGeneration];

    id v19 = v74;
    id v17 = v75;
    id v64 = v26;
    uint64_t v66 = v81;
    uint64_t v65 = v82;
  }
  else
  {
    id v64 = v26;
    uint64_t v66 = v81;
    uint64_t v65 = v82;
    v67 = PLMomentsGetLog();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      libraryBundle = self->_libraryBundle;
      *(_DWORD *)buf = 138412290;
      long long v106 = libraryBundle;
      _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEFAULT, "Skipping highlight generation on photoLibrary: %@", buf, 0xCu);
    }

    id v63 = v79;
    id v62 = v77;
  }
}

uint64_t __245__PLMomentGeneration__runMomentAndHighlightGenerationForAssets_hiddenAssets_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_affectedMoments_highlightsWithDeletedMoments_sharedAssetContainerIncrementalChanges_insertedOrUpdatedMoments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  if ([a3 hasSharingChanges])
  {
    id v5 = [*(id *)(a1 + 32) assetWithUniqueID:v7 error:0];
    if (v5) {
      [*(id *)(a1 + 40) markHighlightNeedingNewKeyAssetsWithAsset:v5];
    }
  }
  return MEMORY[0x1F4181820]();
}

void __245__PLMomentGeneration__runMomentAndHighlightGenerationForAssets_hiddenAssets_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_affectedMoments_highlightsWithDeletedMoments_sharedAssetContainerIncrementalChanges_insertedOrUpdatedMoments___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v45 = a1;
  CFAbsoluteTime v6 = [*(id *)(a1 + 32) assetWithUniqueID:a2 error:0];
  if (![v5 hasSharingOrSuggestionChanges]
    || [v5 collectionChangeType]
    || ([v5 highlightContainerChanges],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    uint64_t v42 = v6;
    CFAbsoluteTime v9 = [MEMORY[0x1E4F1CA80] set];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = [v5 highlightContainerChanges];
    uint64_t v46 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v46)
    {
      uint64_t v44 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v48 != v44) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v12 = [v11 relationshipKey];
          char v13 = [v12 isEqualToString:@"highlightBeingAssets"];

          uint64_t v14 = @"assetsCount";
          if ((v13 & 1) == 0)
          {
            uint64_t v15 = [v11 relationshipKey];
            char v16 = [v15 isEqualToString:@"highlightBeingExtendedAssets"];

            uint64_t v14 = @"extendedCount";
            if ((v16 & 1) == 0)
            {
              id v17 = [v11 relationshipKey];
              char v18 = [v17 isEqualToString:@"highlightBeingSummaryAssets"];

              uint64_t v14 = @"summaryCount";
              if ((v18 & 1) == 0)
              {
                id v19 = [v11 relationshipKey];
                char v20 = [v19 isEqualToString:@"dayGroupHighlightBeingAssets"];

                uint64_t v14 = @"dayGroupAssetsCount";
                if ((v20 & 1) == 0)
                {
                  uint64_t v21 = [v11 relationshipKey];
                  char v22 = [v21 isEqualToString:@"dayGroupHighlightBeingExtendedAssets"];

                  uint64_t v14 = @"dayGroupExtendedAssetsCount";
                  if ((v22 & 1) == 0)
                  {
                    id v23 = [v11 relationshipKey];
                    char v24 = [v23 isEqualToString:@"dayGroupHighlightBeingSummaryAssets"];

                    uint64_t v14 = @"dayGroupSummaryAssetsCount";
                    if ((v24 & 1) == 0)
                    {
                      char v40 = PLMomentsGetLog();
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                      {
                        id v41 = [v11 relationshipKey];
                        *(_DWORD *)buf = 138543362;
                        uint32_t v52 = v41;
                        _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "Unexpected relationship name: %{public}@", buf, 0xCu);
                      }
                      goto LABEL_39;
                    }
                  }
                }
              }
            }
          }
          id v25 = [*(id *)(v45 + 32) managedObjectContext];
          CFAbsoluteTime v26 = [v25 persistentStoreCoordinator];
          uint64_t v27 = [v11 sourceHighlightURI];
          uint64_t v28 = [v26 managedObjectIDForURIRepresentation:v27];

          id v29 = [v25 persistentStoreCoordinator];
          id v30 = [v11 destinationHighlightURI];
          os_signpost_id_t v31 = [v29 managedObjectIDForURIRepresentation:v30];

          uint64_t v32 = [v5 sharingChange];
          int v33 = [v5 suggestionStateChange];
          id v34 = objc_alloc_init(PLSharedAssetsContainerIncrementalChange);
          uint64_t v35 = v34;
          if (v32 == 1) {
            uint64_t v36 = 1;
          }
          else {
            uint64_t v36 = 2;
          }
          [(PLSharedAssetsContainerIncrementalChange *)v34 setSharingChange:v36];
          if (v33 == 1) {
            uint64_t v37 = 1;
          }
          else {
            uint64_t v37 = 2;
          }
          [(PLSharedAssetsContainerIncrementalChange *)v35 setSuggestionStateChange:v37];
          -[PLSharedAssetsContainerIncrementalChange setMediaType:](v35, "setMediaType:", [v5 mediaType]);
          if (v31)
          {
            id v38 = [v25 existingObjectWithID:v31 error:0];
            if (v38)
            {
              [(PLSharedAssetsContainerIncrementalChange *)v35 setCollectionChangeType:1];
              if ([v9 containsObject:v38]) {
                [(PLSharedAssetsContainerIncrementalChange *)v35 setSuggestionStateChange:0];
              }
              [v38 reportSharedAssetContainerIncrementalChange:v35 forAllAssetsCountKey:v14];
              [v9 addObject:v38];
            }
          }
          if (v28)
          {
            uint64_t v39 = [v25 existingObjectWithID:v28 error:0];
            if (v39)
            {
              [(PLSharedAssetsContainerIncrementalChange *)v35 setCollectionChangeType:2];
              if ([v9 containsObject:v39]) {
                [(PLSharedAssetsContainerIncrementalChange *)v35 setSuggestionStateChange:0];
              }
              [v39 reportSharedAssetContainerIncrementalChange:v35 forAllAssetsCountKey:v14];
              [v9 addObject:v39];
            }
          }
        }
        uint64_t v46 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v46) {
          continue;
        }
        break;
      }
    }
LABEL_39:

    CFAbsoluteTime v6 = v42;
  }
  else
  {
    [v6 reportSharedAssetIncrementalChange:v5];
  }
}

- (id)_highlightGenerator
{
  id v3 = (void *)MEMORY[0x1E4F8B980];
  os_signpost_id_t v4 = [(PLPhotoLibraryBundle *)self->_libraryBundle libraryServicesManager];
  LODWORD(v3) = objc_msgSend(v3, "shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:", objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier"));

  if (v3)
  {
    id v5 = [(PLMomentGeneration *)self localCreationDateCreator];
    CFAbsoluteTime v6 = [(PLMomentGeneration *)self frequentLocationManager];
    id v7 = [PLPhotosHighlightGenerator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
    CFAbsoluteTime v9 = [(PLPhotosHighlightGenerator *)v7 initWithDataManager:WeakRetained frequentLocationManager:v6 localCreationDateCreator:v5 dateRangeTitleGenerator:self->_dateRangeTitleGenerator];
  }
  else
  {
    CFAbsoluteTime v9 = 0;
  }
  return v9;
}

- (id)newFrequentLocationManager
{
  id v3 = [PLFrequentLocationManager alloc];
  p_momentGenerationDataManager = &self->_momentGenerationDataManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  CFAbsoluteTime v6 = [(PLFrequentLocationManager *)v3 initWithMomentGenerationDataManager:WeakRetained];

  id v7 = objc_loadWeakRetained((id *)p_momentGenerationDataManager);
  LOBYTE(WeakRetained) = [v7 cameraIsActive];

  if (WeakRetained)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = objc_loadWeakRetained((id *)p_momentGenerationDataManager);
    uint64_t v10 = [v8 dateByAddingTimeInterval:-15724800.0];
    uint64_t v11 = [v9 momentsBetweenDate:v10 andDate:v8 sorted:1 excludeExternal:1];
  }
  else
  {
    id v12 = objc_loadWeakRetained((id *)p_momentGenerationDataManager);
    id v17 = 0;
    uint64_t v11 = [v12 allMomentsWithError:&v17];
    id v13 = v17;
  }
  id v14 = objc_loadWeakRetained((id *)p_momentGenerationDataManager);
  uint64_t v15 = [(id)objc_opt_class() processingMomentsFromMoments:v11];

  [(PLFrequentLocationManager *)v6 frequentLocationsDidChangeFromUpdateWithMoments:v15];
  return v6;
}

- (id)frequentLocationManager
{
  return (id)[(PLLazyObject *)self->_lazyFrequentLocationManager objectValue];
}

- (id)newLocalCreationDateCreator
{
  id v3 = [PLLocalCreationDateCreator alloc];
  os_signpost_id_t v4 = [(PLPhotoLibraryBundle *)self->_libraryBundle timeZoneLookup];
  id v5 = [(PLLocalCreationDateCreator *)v3 initWithTimeZoneLookup:v4];

  return v5;
}

- (id)localCreationDateCreator
{
  return (id)[(PLLazyObject *)self->_lazyLocalCreationDateCreator objectValue];
}

- (void)_runIncrementalGenerationPassWithCompletionHandler:(id)a3
{
  id v5 = a3;
  CFAbsoluteTime v6 = [(PLMomentGeneration *)self momentGenerationDataManager];
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__108981;
  v51[4] = __Block_byref_object_dispose__108982;
  id v52 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  uint64_t v50 = 0;
  uint64_t v50 = [v6 hardGenerationBatchSizeLimit];
  PLMomentGenerationGetLog();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "IncrementalMomentGeneration", "", buf, 2u);
  }

  uint64_t v11 = mach_absolute_time();
  *(void *)buf = 0;
  uint64_t v43 = buf;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__108981;
  uint64_t v46 = __Block_byref_object_dispose__108982;
  id v12 = v10;
  long long v47 = v12;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  os_signpost_id_t v41 = 0;
  os_signpost_id_t v41 = os_signpost_id_generate(v12);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2810000000;
  void v39[3] = &unk_19BBAE189;
  v39[4] = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke;
  v27[3] = &unk_1E58741D8;
  uint64_t v28 = v12;
  id v29 = self;
  os_signpost_id_t v31 = v49;
  id v13 = v6;
  uint64_t v36 = v38;
  SEL v37 = a2;
  id v30 = v13;
  uint64_t v32 = v51;
  int v33 = v39;
  id v34 = buf;
  uint64_t v35 = v40;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_75;
  v16[3] = &unk_1E5874200;
  id v19 = v51;
  char v20 = v38;
  uint64_t v21 = v39;
  char v22 = buf;
  id v23 = v40;
  uint64_t v24 = v11;
  mach_timebase_info v26 = info;
  id v14 = v28;
  id v17 = v14;
  os_signpost_id_t v25 = v8;
  id v15 = v5;
  id v18 = v15;
  [v13 performDataTransaction:v27 synchronously:0 completionHandler:v16];

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);
}

void __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v246 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id *)(a1 + 32);
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  os_signpost_id_t v4 = v2;
  id v5 = v4;
  unint64_t v144 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CollectAffectedAssetsAndMoments", "", buf, 2u);
  }
  os_signpost_id_t spid = v3;
  v147 = v5;

  uint64_t v142 = mach_absolute_time();
  CFAbsoluteTime v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  os_signpost_id_t v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = *(void **)(a1 + 40);
  v224[1] = (id)MEMORY[0x1E4F143A8];
  v224[2] = (id)3221225472;
  v224[3] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_49;
  v224[4] = &unk_1E58741B0;
  v224[5] = v11;
  id v151 = v7;
  id v225 = v151;
  id v12 = v8;
  uint64_t v13 = *(void *)(a1 + 56);
  id v150 = v12;
  id v226 = v12;
  uint64_t v230 = v13;
  id v14 = v6;
  id v227 = v14;
  id v148 = v9;
  id v228 = v148;
  id v149 = v10;
  id v229 = v149;
  pl_dispatch_sync();
  if ([*(id *)(a1 + 48) hasChanges])
  {
    id v15 = *(void **)(a1 + 48);
    v224[0] = 0;
    char v16 = [v15 save:v224];
    id v17 = v224[0];
    if ((v16 & 1) == 0)
    {
      id v18 = PLMomentsGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v17 userInfo];
        *(_DWORD *)buf = 138412546;
        v241 = (const char *)v17;
        __int16 v242 = 2112;
        *(void *)v243 = v19;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Error saving changes, error: %@, userInfo: %@", buf, 0x16u);
      }
    }
  }
  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
  [*(id *)(a1 + 48) assetsWithUniqueIDs:v14 error:0];
  long long v220 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  long long v223 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [obj countByEnumeratingWithState:&v220 objects:v245 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v221;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v221 != v24) {
          objc_enumerationMutation(obj);
        }
        mach_timebase_info v26 = *(void **)(*((void *)&v220 + 1) + 8 * i);
        uint64_t v27 = (void *)MEMORY[0x19F38D3B0]();
        if (v26 && ([v26 isDeleted] & 1) == 0)
        {
          if ([v26 visibilityStateIsEqualToState:0]) {
            uint64_t v28 = (void *)v20;
          }
          else {
            uint64_t v28 = v21;
          }
          [v28 addObject:v26];
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v220 objects:v245 count:16];
    }
    while (v23);
  }
  v145 = v14;

  if ([*(id *)(a1 + 48) wantsMomentReplayLogging]) {
    [*(id *)(a1 + 40) _appendAssetsToReplayLog:v20 forBatchUpdate:1];
  }
  v153 = (void *)v20;
  uint64_t v169 = a1;
  id v29 = [MEMORY[0x1E4F1CA80] set];
  id v30 = [MEMORY[0x1E4F1CA80] set];
  v163 = [MEMORY[0x1E4F1CA80] set];
  v157 = [MEMORY[0x1E4F1CA80] set];
  long long v216 = 0u;
  long long v217 = 0u;
  long long v218 = 0u;
  long long v219 = 0u;
  id v31 = v21;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v216 objects:v244 count:16];
  int v33 = &off_19BA99000;
  id v155 = v31;
  if (!v32)
  {
    v156 = 0;
    v152 = 0;
    uint64_t v57 = v31;
    goto LABEL_57;
  }
  uint64_t v34 = v32;
  v156 = 0;
  v152 = 0;
  v154 = 0;
  uint64_t v35 = *(void *)v217;
  uint64_t v177 = *(void *)v217;
  do
  {
    for (uint64_t j = 0; j != v34; ++j)
    {
      if (*(void *)v217 != v35) {
        objc_enumerationMutation(v31);
      }
      SEL v37 = *(void **)(*((void *)&v216 + 1) + 8 * j);
      id v38 = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v39 = [v37 moment];
      char v40 = v39;
      if (v39 && ([v39 isDeleted] & 1) == 0)
      {
        if ([v37 visibilityStateIsEqualToState:2])
        {
          uint64_t v41 = [v37 globalUUID];
          if (v41)
          {
            uint64_t v42 = (void *)v41;
            uint64_t v43 = v156;
            if (!v156) {
              uint64_t v43 = (void *)[*(id *)(v169 + 40) _newPublicGlobalUUIDsToAssetsMappingWithAssets:v153];
            }
            v156 = v43;
            context = [v43 objectForKey:v42];
            if (context)
            {
              uint64_t v44 = [v40 assets];
              int v45 = [v44 containsObject:v37];

              uint64_t v35 = v177;
              if (v45)
              {
                if ([*(id *)(v169 + 40) _isAsset:v37 identicalToAssetForMoments:context])
                {
                  uint64_t v46 = PLMomentsGetLog();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                  {
                    v173 = [v37 uniqueObjectID];
                    id v47 = [context uniqueObjectID];
                    id v170 = [v40 uniqueObjectID];
                    *(_DWORD *)buf = 138412802;
                    v241 = v173;
                    __int16 v242 = 2112;
                    *(void *)v243 = v47;
                    *(_WORD *)&v243[8] = 2112;
                    *(void *)&v243[10] = v170;
                    _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEBUG, "Asset %@ was replaced by %@ in moment %@", buf, 0x20u);
                  }
                  unsigned int v174 = [v37 reverseLocationDataIsValid];
                  uint64_t v48 = [v37 reverseLocationData];
                  [context setReverseLocationDataIsValid:v174];
                  v175 = (void *)v48;
                  [context setReverseLocationData:v48];
                  [v40 removeAssetData:v37];
                  [v40 insertAssetData:context];
                  [context setMoment:v40];
                  [v156 removeObjectForKey:v42];
                  id v49 = v154;
                  if (!v154) {
                    id v49 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  }
                  v154 = v49;
                  id v50 = v152;
                  if (!v152) {
                    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  uint64_t v51 = [v37 uniqueObjectID];
                  v152 = v50;
                  [v50 addObject:v51];

                  [v154 addObject:context];
                  id v31 = v155;
                  uint64_t v35 = v177;
LABEL_49:

                  [v37 setMoment:0];
                  goto LABEL_50;
                }
              }
            }

            id v31 = v155;
          }
        }
        [v29 addObject:v40];
        [v157 addObject:v40];
        [v40 removeAssetData:v37];
        uint64_t v42 = [v40 assets];
        if (![v42 count]) {
          [v30 addObject:v40];
        }
        goto LABEL_49;
      }
LABEL_50:
    }
    uint64_t v34 = [v31 countByEnumeratingWithState:&v216 objects:v244 count:16];
  }
  while (v34);

  if (!v154)
  {
    if (!v152)
    {
      v152 = 0;
      int v33 = &off_19BA99000;
      goto LABEL_60;
    }
    uint64_t v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:*(void *)(v169 + 104) object:*(void *)(v169 + 40) file:@"PLMomentGeneration.m" lineNumber:586 description:@"Should not have switched deleted assets without switching some inserted asset"];
    int v33 = &off_19BA99000;
LABEL_57:

LABEL_60:
    id v54 = v153;
    id v56 = v148;
    v154 = 0;
    goto LABEL_61;
  }
  uint64_t v52 = [v152 count];
  if (v52 != [v154 count])
  {
    v140 = [MEMORY[0x1E4F28B00] currentHandler];
    id v31 = v155;
    objc_msgSend(v140, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(v169 + 104), *(void *)(v169 + 40), @"PLMomentGeneration.m", 573, @"Number of switched deleted assets (%lu) does not match the number of switched inserted assets (%lu)", objc_msgSend(v152, "count"), objc_msgSend(v154, "count"), spid);
  }
  v53 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v153];
  [v53 minusSet:v154];
  id v54 = [v53 allObjects];
  id v55 = (void *)[v148 mutableCopy];
  [v55 removeObjectsForKeys:v152];
  id v56 = v55;

  int v33 = &off_19BA99000;
LABEL_61:
  if (![v56 count]
    && ![v54 count]
    && ![v30 count]
    && ![v29 count]
    && ![v151 count]
    && ![v150 count]
    && ![v149 count])
  {
    goto LABEL_167;
  }
  v146 = v56;
  uint64_t v58 = [MEMORY[0x1E4F1CA80] set];
  v164 = [MEMORY[0x1E4F1CA48] array];
  long long v212 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  long long v215 = 0u;
  id v143 = v54;
  id v167 = v54;
  uint64_t v59 = [v167 countByEnumeratingWithState:&v212 objects:v239 count:16];
  if (!v59) {
    goto LABEL_97;
  }
  uint64_t v60 = v59;
  uint64_t v61 = *(void *)v213;
  int v161 = *((void *)v33 + 88);
  uint64_t v165 = *(void *)v213;
  while (2)
  {
    uint64_t v62 = 0;
    while (2)
    {
      if (*(void *)v213 != v61) {
        objc_enumerationMutation(v167);
      }
      id v63 = *(void **)(*((void *)&v212 + 1) + 8 * v62);
      id v64 = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v65 = [v63 dateCreated];
      if ([v63 isDeleted])
      {
        if (v65)
        {
          uint64_t v66 = v65;
          v67 = [v63 moment];
          if (v67)
          {
            [v29 addObject:v67];
            [v157 addObject:v67];
            [v67 removeAssetData:v63];
            [v63 setMoment:0];
          }
          v178 = v64;

          uint64_t v65 = v66;
LABEL_79:
          contexta = v65;
          [v164 addObject:v65];
          uint64_t v68 = [v63 highlightBeingAssets];
          id v69 = v68;
          if (v68)
          {
            id v70 = [v68 startDate];
            id v71 = [v69 endDate];
            if (v70) {
              [v164 addObject:v70];
            }
            if (v71) {
              [v164 addObject:v71];
            }
          }
          goto LABEL_85;
        }
      }
      else
      {
        v178 = v64;
        if (v65) {
          goto LABEL_79;
        }
        contexta = 0;
        id v69 = PLMomentsGetLog();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          int v79 = [v63 isDeleted];
          uint64_t v80 = *(void *)(v169 + 48);
          *(_DWORD *)buf = v161;
          v241 = (const char *)v63;
          __int16 v242 = 1024;
          *(_DWORD *)v243 = v79;
          *(_WORD *)&v243[4] = 2048;
          *(void *)&v243[6] = v80;
          _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_ERROR, "Missing dateCreated?! %@ isDeleted %d manager %p", buf, 0x1Cu);
        }
LABEL_85:

        id v72 = [v63 moment];
        uint64_t v73 = [v63 highlightBeingAssets];
        id v74 = (void *)v73;
        if (v72 && v73)
        {
          id v75 = [v72 startDate];
          id v171 = (id)[contexta compare:v75];

          [v72 endDate];
          v77 = uint64_t v76 = v60;
          uint64_t v78 = [contexta compare:v77];

          uint64_t v60 = v76;
          uint64_t v61 = v165;
          if (v171 == (id)-1 || v78 == 1)
          {
            [v58 addObject:v63];
            [v29 addObject:v72];
            [v72 removeAssetData:v63];
            [v63 setMoment:0];
          }
        }
        else
        {
          [v58 addObject:v63];
        }

        id v64 = v178;
        uint64_t v65 = contexta;
      }

      if (v60 != ++v62) {
        continue;
      }
      break;
    }
    uint64_t v81 = [v167 countByEnumeratingWithState:&v212 objects:v239 count:16];
    uint64_t v60 = v81;
    if (v81) {
      continue;
    }
    break;
  }
LABEL_97:

  long long v210 = 0u;
  long long v211 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  id v82 = v146;
  uint64_t v83 = [v82 countByEnumeratingWithState:&v208 objects:v238 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v209;
    do
    {
      for (uint64_t k = 0; k != v84; ++k)
      {
        if (*(void *)v209 != v85) {
          objc_enumerationMutation(v82);
        }
        long long v87 = [v82 objectForKeyedSubscript:*(void *)(*((void *)&v208 + 1) + 8 * k)];
        long long v88 = [v87 objectForKeyedSubscript:@"dateCreated"];
        if (v88) {
          [v164 addObject:v88];
        }
      }
      uint64_t v84 = [v82 countByEnumeratingWithState:&v208 objects:v238 count:16];
    }
    while (v84);
  }

  [v164 sortUsingSelector:sel_compare_];
  [(id)objc_opt_class() dateIntervalsAroundSortedDates:v164 minimumIntervalDuration:115200.0];
  long long v204 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  id v158 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v162 = [v158 countByEnumeratingWithState:&v204 objects:v237 count:16];
  if (v162)
  {
    uint64_t v160 = *(void *)v205;
    do
    {
      long long v89 = 0;
      do
      {
        if (*(void *)v205 != v160) {
          objc_enumerationMutation(v158);
        }
        v168 = v89;
        uint64_t v166 = *(void *)(*((void *)&v204 + 1) + 8 * (void)v89);
        long long v90 = objc_msgSend(*(id *)(v169 + 48), "highlightsIntersectingDateInterval:ofKind:");
        long long v200 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        id v172 = v90;
        uint64_t v179 = [v172 countByEnumeratingWithState:&v200 objects:v236 count:16];
        if (v179)
        {
          uint64_t v176 = *(void *)v201;
          do
          {
            for (uint64_t m = 0; m != v179; ++m)
            {
              if (*(void *)v201 != v176) {
                objc_enumerationMutation(v172);
              }
              long long v92 = *(void **)(*((void *)&v200 + 1) + 8 * m);
              contextb = (void *)MEMORY[0x19F38D3B0]();
              long long v93 = [v92 moments];
              long long v196 = 0u;
              long long v197 = 0u;
              long long v198 = 0u;
              long long v199 = 0u;
              id v94 = v93;
              uint64_t v95 = [v94 countByEnumeratingWithState:&v196 objects:v235 count:16];
              if (v95)
              {
                uint64_t v96 = v95;
                uint64_t v97 = *(void *)v197;
                do
                {
                  for (uint64_t n = 0; n != v96; ++n)
                  {
                    if (*(void *)v197 != v97) {
                      objc_enumerationMutation(v94);
                    }
                    unint64_t v99 = *(void **)(*((void *)&v196 + 1) + 8 * n);
                    [v29 addObject:v99];
                    id v100 = [v99 assets];
                    if ([v100 count]) {
                      [v58 unionSet:v100];
                    }
                    else {
                      [v30 addObject:v99];
                    }
                  }
                  uint64_t v96 = [v94 countByEnumeratingWithState:&v196 objects:v235 count:16];
                }
                while (v96);
              }
            }
            uint64_t v179 = [v172 countByEnumeratingWithState:&v200 objects:v236 count:16];
          }
          while (v179);
        }

        id v101 = [*(id *)(v169 + 48) momentsIntersectingDateInterval:v166];
        long long v192 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        id v102 = v101;
        uint64_t v103 = [v102 countByEnumeratingWithState:&v192 objects:v234 count:16];
        if (v103)
        {
          uint64_t v104 = v103;
          uint64_t v105 = *(void *)v193;
          do
          {
            for (iuint64_t i = 0; ii != v104; ++ii)
            {
              if (*(void *)v193 != v105) {
                objc_enumerationMutation(v102);
              }
              uint64_t v107 = *(void **)(*((void *)&v192 + 1) + 8 * ii);
              v108 = (void *)MEMORY[0x19F38D3B0]();
              [v29 addObject:v107];
              mach_timebase_info v109 = [v107 assets];
              if ([v109 count]) {
                [v58 unionSet:v109];
              }
              else {
                [v30 addObject:v107];
              }
            }
            uint64_t v104 = [v102 countByEnumeratingWithState:&v192 objects:v234 count:16];
          }
          while (v104);
        }

        long long v89 = v168 + 1;
      }
      while (v168 + 1 != (char *)v162);
      uint64_t v162 = [v158 countByEnumeratingWithState:&v204 objects:v237 count:16];
    }
    while (v162);
  }

  long long v190 = 0u;
  long long v191 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  id v110 = v30;
  uint64_t v111 = [v110 countByEnumeratingWithState:&v188 objects:v233 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v189;
    do
    {
      for (juint64_t j = 0; jj != v112; ++jj)
      {
        if (*(void *)v189 != v113) {
          objc_enumerationMutation(v110);
        }
        mach_timebase_info v115 = *(void **)(*((void *)&v188 + 1) + 8 * jj);
        long long v116 = [v115 highlight];
        long long v117 = [v116 parentDayGroupPhotosHighlight];
        if (v116) {
          [v163 addObject:v116];
        }
        if (v117) {
          [v163 addObject:v117];
        }
        [v115 delete];
      }
      uint64_t v112 = [v110 countByEnumeratingWithState:&v188 objects:v233 count:16];
    }
    while (v112);
  }

  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  id v118 = v157;
  uint64_t v119 = [v118 countByEnumeratingWithState:&v184 objects:v232 count:16];
  if (v119)
  {
    uint64_t v120 = v119;
    uint64_t v121 = *(void *)v185;
    do
    {
      for (kuint64_t k = 0; kk != v120; ++kk)
      {
        if (*(void *)v185 != v121) {
          objc_enumerationMutation(v118);
        }
        v123 = [*(id *)(*((void *)&v184 + 1) + 8 * kk) assets];
        [v58 unionSet:v123];
      }
      uint64_t v120 = [v118 countByEnumeratingWithState:&v184 objects:v232 count:16];
    }
    while (v120);
  }

  uint64_t v124 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  double v127 = v147;
  v128 = v127;
  if (v144 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
  {
    uint64_t v129 = [v58 count];
    uint64_t v130 = [v29 count];
    *(_DWORD *)buf = 134218240;
    v241 = (const char *)v129;
    __int16 v242 = 2048;
    *(void *)v243 = v130;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v128, OS_SIGNPOST_INTERVAL_END, spid, "CollectAffectedAssetsAndMoments", "affectedAssets: %lu, affectedMoments %lu", buf, 0x16u);
  }

  v131 = v128;
  id v31 = v155;
  if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
  {
    float v132 = (float)((float)((float)(v124 - v142) * (float)numer) / (float)denom) / 1000000.0;
    id v133 = [NSString stringWithFormat:@"affectedAssets: %lu, affectedMoments %lu", objc_msgSend(v58, "count"), objc_msgSend(v29, "count")];
    *(_DWORD *)buf = 136315650;
    v241 = "CollectAffectedAssetsAndMoments";
    __int16 v242 = 2112;
    *(void *)v243 = v133;
    *(_WORD *)&v243[8] = 2048;
    *(double *)&v243[10] = v132;
    _os_log_impl(&dword_19B3C7000, v131, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  v134 = *(void **)(v169 + 40);
  id v183 = 0;
  [v134 _runMomentAndHighlightGenerationForAssets:v58 hiddenAssets:v155 updatedAssetIDsForHighlights:v151 updatedMomentIDsForHighlights:v150 affectedMoments:v29 highlightsWithDeletedMoments:v163 sharedAssetContainerIncrementalChanges:v149 insertedOrUpdatedMoments:&v183];
  id v135 = v183;
  id v136 = v183;
  objc_storeStrong((id *)(*(void *)(*(void *)(v169 + 64) + 8) + 40), v135);
  mach_timebase_info((mach_timebase_info_t)(*(void *)(*(void *)(v169 + 72) + 8) + 32));
  v137 = *(id *)(*(void *)(*(void *)(v169 + 80) + 8) + 40);
  v138 = v137;
  os_signpost_id_t v139 = *(void *)(*(void *)(*(void *)(v169 + 88) + 8) + 24);
  if (v139 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v138, OS_SIGNPOST_INTERVAL_BEGIN, v139, "ExecuteLibraryBatchTransaction", "", buf, 2u);
  }

  *(void *)(*(void *)(*(void *)(v169 + 96) + 8) + 24) = mach_absolute_time();
  id v54 = v143;
  id v56 = v146;
LABEL_167:
}

uint64_t __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_75(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  uint64_t v3 = mach_absolute_time();
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  unsigned int v7 = *(_DWORD *)(v5 + 32);
  unsigned int v6 = *(_DWORD *)(v5 + 36);
  os_signpost_id_t v8 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v10, "ExecuteLibraryBatchTransaction", "", buf, 2u);
  }

  uint64_t v11 = *(NSObject **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    mach_timebase_info v26 = "ExecuteLibraryBatchTransaction";
    __int16 v27 = 2048;
    double v28 = (float)((float)((float)((float)(v3 - v4) * (float)v7) / (float)v6) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  uint64_t v12 = mach_absolute_time();
  uint64_t v13 = *(void *)(a1 + 88);
  unsigned int v15 = *(_DWORD *)(a1 + 104);
  unsigned int v14 = *(_DWORD *)(a1 + 108);
  char v16 = *(id *)(a1 + 32);
  id v17 = v16;
  os_signpost_id_t v18 = *(void *)(a1 + 96);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 134217984;
    mach_timebase_info v26 = (const char *)v2;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "IncrementalMomentGeneration", "updatedMoments: %lu", buf, 0xCu);
  }

  id v19 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    float v20 = (float)((float)((float)(v12 - v13) * (float)v15) / (float)v14) / 1000000.0;
    uint64_t v21 = NSString;
    uint64_t v22 = v19;
    uint64_t v23 = objc_msgSend(v21, "stringWithFormat:", @"updatedMoments: %lu", v2);
    *(_DWORD *)buf = 136315650;
    mach_timebase_info v26 = "IncrementalMomentGeneration";
    __int16 v27 = 2112;
    double v28 = *(double *)&v23;
    __int16 v29 = 2048;
    double v30 = v20;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_49(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    unsigned int v6 = [*(id *)(v3 + 16) set];
    unsigned int v7 = [v5 setWithSet:v6];
    [v4 minusSet:v7];

    os_signpost_id_t v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "count"));
    id v9 = *(void **)(*(void *)(a1 + 32) + 24);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_2;
    v58[3] = &unk_1E5874138;
    id v59 = v8;
    id v10 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v58];
    [*(id *)(*(void *)(a1 + 32) + 32) minusSet:v10];
  }
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 32) array];
  [v11 addObjectsFromArray:v12];

  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  uint64_t v13 = *(void **)(a1 + 48);
  unsigned int v14 = [*(id *)(*(void *)(a1 + 32) + 40) array];
  [v13 addObjectsFromArray:v14];

  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
    && (unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count] > *(void *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                                                 + 24))
  {
    uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 16) count];
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    uint64_t v17 = v15 - v16;
    os_signpost_id_t v18 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithOrderedSet:range:copyItems:", *(void *)(*(void *)(a1 + 32) + 16), v15 - v16, v16, 0);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeObjectsInRange:", v17, v16);
    id v19 = *(void **)(a1 + 56);
    float v20 = [v18 array];
    [v19 addObjectsFromArray:v20];
  }
  else
  {
    uint64_t v21 = *(void **)(a1 + 56);
    uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 16) array];
    [v21 addObjectsFromArray:v22];

    [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
    && (unint64_t)[*(id *)(*(void *)(a1 + 32) + 24) count] > *(void *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                                                 + 24))
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v62 = 0;
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 24);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_3;
    v53[3] = &unk_1E5874160;
    id v54 = *(id *)(a1 + 64);
    id v25 = v23;
    id v55 = v25;
    id v56 = buf;
    uint64_t v57 = *(void *)(a1 + 80);
    [v24 enumerateKeysAndObjectsUsingBlock:v53];
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectsForKeys:v25];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [*(id *)(a1 + 64) setDictionary:*(void *)(*(void *)(a1 + 32) + 24)];
    [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  }
  uint64_t v26 = [*(id *)(a1 + 56) count];
  *(void *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 64) count] + v26;
  __int16 v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v28 = *(id *)(a1 + 56);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v50 != v30) {
          objc_enumerationMutation(v28);
        }
        uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        int v33 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v32];
        uint64_t v34 = v33;
        if (v33)
        {
          if (([v33 hasChangesAffectingSharingComposition] & 1) == 0
            && [v34 hasNoOtherAssetChangesRequiringMomentGeneration])
          {
            [v27 addObject:v32];
          }
          [*(id *)(a1 + 72) setObject:v34 forKeyedSubscript:v32];
          [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:v32];
        }
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v29);
  }

  [*(id *)(a1 + 56) removeObjectsInArray:v27];
  if (![*(id *)(a1 + 72) count] && objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "count"))
  {
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v36 = *(void **)(*(void *)(a1 + 32) + 48);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_4;
    v45[3] = &unk_1E5874188;
    id v46 = *(id *)(a1 + 72);
    id v47 = v35;
    uint64_t v48 = *(void *)(a1 + 80);
    id v37 = v35;
    [v36 enumerateKeysAndObjectsUsingBlock:v45];
    [*(id *)(*(void *)(a1 + 32) + 48) removeObjectsForKeys:v37];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 48) count] || objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    id v38 = PLMomentsGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = [*(id *)(a1 + 72) count];
      uint64_t v40 = [*(id *)(*(void *)(a1 + 32) + 48) count];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v39;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v40;
      _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Identified %lu shared asset container changes for current batch. %lu remain", buf, 0x16u);
    }
  }
  uint64_t v41 = PLMomentsGetLog();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = *(void *)(a1 + 32);
    uint64_t v43 = *(void *)(v42 + 8);
    uint64_t v44 = [*(id *)(v42 + 16) count];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v43;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v44;
    _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Beginning moment generation pass with %lu changes. %lu remain", buf, 0x16u);
  }
}

uint64_t __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unsigned int v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v7 setObject:a3 forKey:v8];
  [*(id *)(a1 + 40) addObject:v8];

  if (++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(void *)(*(void *)(*(void *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 24))
    *a4 = 1;
}

unint64_t __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unsigned int v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v7 setObject:a3 forKeyedSubscript:v8];
  [*(id *)(a1 + 40) addObject:v8];

  unint64_t result = [*(id *)(a1 + 32) count];
  if (result >= *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (void)generateWithIncrementalDataCompletionHandler:(id)a3
{
  id v4 = a3;
  if (PLPlatformMomentsSupported())
  {
    if (v4)
    {
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      id v9 = __67__PLMomentGeneration_generateWithIncrementalDataCompletionHandler___block_invoke;
      id v10 = &unk_1E58742F0;
      uint64_t v11 = self;
      id v12 = v4;
      pl_dispatch_sync();
    }
    [(PLMomentGeneration *)self _updateIncrementalMomentGeneration];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
    unsigned int v6 = [WeakRetained isolationQueue];
    pl_dispatch_async();
  }
}

void __67__PLMomentGeneration_generateWithIncrementalDataCompletionHandler___block_invoke(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 40) copy];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = (void *)MEMORY[0x19F38D650]();
  [v2 addObject:v3];
}

- (void)generateWithAssetInsertsAndUpdates:(id)a3 assetDeletes:(id)a4 assetUpdatesForHighlights:(id)a5 momentUpdatesForHighlights:(id)a6 completionHandler:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (PLPlatformMomentsSupported()
    && ([v18 count]
     || [v12 count]
     || [v13 count]
     || [v14 count]))
  {
    [(PLMomentGeneration *)self saveChangesForAssetInsertsAndUpdates:v18 assetDeletes:v12 assetUpdatesForHighlights:v13 momentUpdatesForHighlights:v14 sharedAssetContainerIncrementalChangesByAssetID:0];
    [(PLMomentGeneration *)self generateWithIncrementalDataCompletionHandler:v15];
  }
  else if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
    uint64_t v17 = [WeakRetained isolationQueue];
    pl_dispatch_async();
  }
}

- (void)saveChangesForAssetInsertsAndUpdates:(id)a3 assetDeletes:(id)a4 assetUpdatesForHighlights:(id)a5 momentUpdatesForHighlights:(id)a6 sharedAssetContainerIncrementalChangesByAssetID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (PLPlatformMomentsSupported()
    && ([v11 count]
     || [v12 count]
     || [v13 count]
     || [v14 count]))
  {
    id v16 = v11;
    id v17 = v12;
    id v18 = v13;
    id v19 = v14;
    id v20 = v15;
    pl_dispatch_sync();
  }
}

uint64_t __173__PLMomentGeneration_saveChangesForAssetInsertsAndUpdates_assetDeletes_assetUpdatesForHighlights_momentUpdatesForHighlights_sharedAssetContainerIncrementalChangesByAssetID___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) addObjectsFromArray:a1[5]];
  [*(id *)(a1[4] + 24) addEntriesFromDictionary:a1[6]];
  [*(id *)(a1[4] + 32) addObjectsFromArray:a1[7]];
  [*(id *)(a1[4] + 40) addObjectsFromArray:a1[8]];
  uint64_t v2 = (void *)a1[9];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __173__PLMomentGeneration_saveChangesForAssetInsertsAndUpdates_assetDeletes_assetUpdatesForHighlights_momentUpdatesForHighlights_sharedAssetContainerIncrementalChangesByAssetID___block_invoke_2;
  v4[3] = &unk_1E5876010;
  v4[4] = a1[4];
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __173__PLMomentGeneration_saveChangesForAssetInsertsAndUpdates_assetDeletes_assetUpdatesForHighlights_momentUpdatesForHighlights_sharedAssetContainerIncrementalChangesByAssetID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:v9];
  uint64_t v8 = v7;
  if (v7) {
    [v7 mergeChangesFrom:v6];
  }
  else {
    [*(id *)(*(void *)(a1 + 32) + 48) setObject:v6 forKeyedSubscript:v9];
  }
}

- (BOOL)_isAsset:(id)a3 identicalToAssetForMoments:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 dateCreated];
  uint64_t v8 = [v6 dateCreated];
  id v9 = (void *)v8;
  if (v7)
  {
    if (v8 && ([v7 isEqual:v8] & 1) != 0) {
      goto LABEL_4;
    }
LABEL_9:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  if (v8) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v10 = [v5 location];
  uint64_t v11 = [v6 location];
  id v12 = (void *)v11;
  BOOL v13 = (v10 | v11) == 0;
  if (v10 && v11)
  {
    [(id)v10 coordinate];
    double v15 = v14;
    [v12 coordinate];
    if (v15 == v16)
    {
      [(id)v10 coordinate];
      double v18 = v17;
      [v12 coordinate];
      BOOL v13 = v18 == v19;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

LABEL_12:
  return v13;
}

- (id)_newPublicGlobalUUIDsToAssetsMappingWithAssets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "moment", (void)v13);

        uint64_t v11 = [v10 globalUUID];
        if (v11) {
          [v4 setObject:v10 forKey:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_runIncrementalMomentGenerationIfItemsArePendingWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  v29[0] = 0;
  v29[1] = v29;
  void v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__108981;
  v29[4] = __Block_byref_object_dispose__108982;
  id v30 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  BOOL v28 = 0;
  obuint64_t j = 0;
  BOOL v5 = [(PLMomentGeneration *)self _hasWorkWorkRemainingWithCompletionBlocks:&obj];
  objc_storeStrong(&v30, obj);
  BOOL v28 = v5;
  uint64_t v6 = self->_incrementalMomentGenThrottle;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  uint64_t v8 = [WeakRetained isolationQueue];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__PLMomentGeneration__runIncrementalMomentGenerationIfItemsArePendingWithCompletion___block_invoke;
  v21[3] = &unk_1E5875E68;
  uint64_t v23 = v29;
  id v9 = v8;
  id v22 = v9;
  uint64_t v10 = MEMORY[0x19F38D650](v21);
  uint64_t v11 = (void *)v10;
  if (*((unsigned char *)v26 + 24))
  {
    id v12 = (void *)MEMORY[0x19F38D3B0]();
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__PLMomentGeneration__runIncrementalMomentGenerationIfItemsArePendingWithCompletion___block_invoke_3;
    v14[3] = &unk_1E58740E8;
    CFAbsoluteTime v20 = Current;
    uint64_t v18 = &v25;
    v14[4] = self;
    double v19 = v29;
    long long v15 = v6;
    id v16 = v11;
    double v17 = v4;
    [(PLMomentGeneration *)self _runIncrementalGenerationPassWithCompletionHandler:v14];
  }
  else
  {
    (*(void (**)(uint64_t))(v10 + 16))(v10);
    v4[2](v4);
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

uint64_t __85__PLMomentGeneration__runIncrementalMomentGenerationIfItemsArePendingWithCompletion___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)) {
    return pl_dispatch_async();
  }
  return result;
}

uint64_t __85__PLMomentGeneration__runIncrementalMomentGenerationIfItemsArePendingWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLMomentsGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v3 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 80);
    *(_DWORD *)buf = 134217984;
    CFAbsoluteTime v10 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment generation pass completed in %.2f s", buf, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  obuint64_t j = *(id *)(v5 + 40);
  char v6 = [v4 _hasWorkWorkRemainingWithCompletionBlocks:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v6;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    [*(id *)(a1 + 40) update];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __85__PLMomentGeneration__runIncrementalMomentGenerationIfItemsArePendingWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)releaseMemoryIntensiveObjects
{
  [(PLLazyObject *)self->_lazyLocalCreationDateCreator resetObject];
  [(PLLazyObject *)self->_lazyFrequentLocationManager resetObject];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  [WeakRetained releaseMemoryIntensiveObjects];
}

- (BOOL)_hasWorkWorkRemainingWithCompletionBlocks:(id *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__108981;
  long long v14 = __Block_byref_object_dispose__108982;
  id v15 = 0;
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  pl_dispatch_sync();
  if (a3) {
    *a3 = (id) v11[5];
  }
  char v4 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);

  return v4;
}

uint64_t __64__PLMomentGeneration__hasWorkWorkRemainingWithCompletionBlocks___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) count];
  uint64_t v3 = [*(id *)(a1[4] + 24) count];
  uint64_t v4 = [*(id *)(a1[4] + 32) count];
  uint64_t v5 = [*(id *)(a1[4] + 40) count];
  uint64_t result = [*(id *)(a1[4] + 48) count];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = (v2 | v3 | v4 | v5 | result) != 0;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(a1[4] + 56)];
    uint64_t v8 = *(void *)(a1[6] + 8);
    char v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(a1[4] + 56) removeAllObjects];
    uint64_t v10 = (void *)a1[4];
    return [v10 releaseMemoryIntensiveObjects];
  }
  return result;
}

- (void)_updateIncrementalMomentGeneration
{
}

- (BOOL)isGenerationPassInProgress
{
  return ![(PLMomentGenerationThrottle *)self->_incrementalMomentGenThrottle isIdle];
}

- (PLMomentGeneration)initWithMomentGenerationDataManager:(id)a3 bundle:(id)a4 locale:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v49.receiver = self;
  v49.super_class = (Class)PLMomentGeneration;
  uint64_t v11 = [(PLMomentGeneration *)&v49 init];
  if (PLPlatformMomentsSupported())
  {
    if (v11)
    {
      objc_storeWeak((id *)&v11->_momentGenerationDataManager, v8);
      uint64_t v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      pendingInsertsAndUpdates = v11->_pendingInsertsAndUpdates;
      v11->_pendingInsertsAndUpdates = v12;

      long long v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      pendingDeletes = v11->_pendingDeletes;
      v11->_pendingDeletes = v14;

      id v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      pendingCompletionBlocks = v11->_pendingCompletionBlocks;
      v11->_pendingCompletionBlocks = v16;

      uint64_t v18 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      pendingUpdatesForHighlights = v11->_pendingUpdatesForHighlights;
      v11->_pendingUpdatesForHighlights = v18;

      CFAbsoluteTime v20 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      pendingMomentUpdatesForHighlights = v11->_pendingMomentUpdatesForHighlights;
      v11->_pendingMomentUpdatesForHighlights = v20;

      id v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      pendingSharedAssetContainerIncrementalChanges = v11->_pendingSharedAssetContainerIncrementalChanges;
      v11->_pendingSharedAssetContainerIncrementalChanges = v22;

      dispatch_queue_t v24 = dispatch_queue_create("com.apple.moment.generation.pendingIsolation", 0);
      incrementalGenerationStateQueue = v11->_incrementalGenerationStateQueue;
      v11->_incrementalGenerationStateQueue = (OS_dispatch_queue *)v24;

      objc_storeStrong((id *)&v11->_libraryBundle, a4);
      if (v10) {
        uint64_t v26 = [[PLDateRangeTitleGenerator alloc] initWithLocale:v10];
      }
      else {
        uint64_t v26 = objc_alloc_init(PLDateRangeTitleGenerator);
      }
      dateRangeTitleGenerator = v11->_dateRangeTitleGenerator;
      v11->_dateRangeTitleGenerator = v26;

      id v28 = objc_initWeak(&location, v11);
      id v29 = objc_alloc(MEMORY[0x1E4F8B948]);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke;
      v46[3] = &unk_1E5874070;
      objc_copyWeak(&v47, &location);
      uint64_t v30 = [v29 initWithRetriableBlock:v46];
      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
      lazyFrequentLocationManager = v11->_lazyFrequentLocationManager;
      v11->_lazyFrequentLocationManager = (PLLazyObject *)v30;

      id v32 = objc_initWeak(&location, v11);
      id v33 = objc_alloc(MEMORY[0x1E4F8B948]);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_2;
      void v44[3] = &unk_1E5874070;
      objc_copyWeak(&v45, &location);
      uint64_t v34 = [v33 initWithRetriableBlock:v44];
      objc_destroyWeak(&v45);
      objc_destroyWeak(&location);
      lazyLocalCreationDateCreator = v11->_lazyLocalCreationDateCreator;
      v11->_lazyLocalCreationDateCreator = (PLLazyObject *)v34;

      objc_initWeak(&location, v11);
      uint64_t v36 = [PLMomentGenerationThrottle alloc];
      uint64_t v37 = [v8 isLightweightMigrationManager];
      id v38 = [v8 isolationQueue];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_3;
      v42[3] = &unk_1E58740C0;
      objc_copyWeak(&v43, &location);
      uint64_t v39 = [(PLMomentGenerationThrottle *)v36 initWithName:@"MomentGeneration" canDelayAnyQOS:0 singleThreadedMode:v37 timeProvider:0 targetQueue:v38 target:v42];
      incrementalMomentGenThrottle = v11->_incrementalMomentGenThrottle;
      v11->_incrementalMomentGenThrottle = (PLMomentGenerationThrottle *)v39;

      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    uint64_t v11 = 0;
  }

  return v11;
}

id __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = (void *)[WeakRetained newFrequentLocationManager];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained) {
    uint64_t v3 = (void *)[WeakRetained newLocalCreationDateCreator];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_initWeak(&location, WeakRetained);
  uint64_t v5 = PLMomentsGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = @"MomentGeneration";
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[MomentGenerationThrottle] %{public}@ executing target, waiting for completion...", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_44;
  v7[3] = &unk_1E5874098;
  objc_copyWeak(&v9, &location);
  id v6 = v3;
  id v8 = v6;
  [WeakRetained _runIncrementalMomentGenerationIfItemsArePendingWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_44(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = [WeakRetained[11] timeProvider];
    [v3 currentTime];
    double v5 = v4;

    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v5);
    id WeakRetained = v6;
  }
}

- (PLMomentGeneration)initWithMomentGenerationDataManager:(id)a3 bundle:(id)a4
{
  return [(PLMomentGeneration *)self initWithMomentGenerationDataManager:a3 bundle:a4 locale:0];
}

+ (id)dateIntervalsAroundSortedDates:(id)a3 minimumIntervalDuration:(double)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [v5 firstObject];
    double v7 = a4 * 0.5;
    uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
    double v8 = -(a4 * 0.5);
    id v9 = [v6 dateByAddingTimeInterval:v8];
    uint64_t v25 = v6;
    id v10 = [v6 dateByAddingTimeInterval:v7];
    uint64_t v11 = [v10 dateByAddingTimeInterval:v7];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v5;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        uint64_t v16 = 0;
        double v17 = v10;
        uint64_t v18 = v11;
        do
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          double v19 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
          if ([v18 compare:v19] == -1)
          {
            CFAbsoluteTime v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v17];
            [v27 addObject:v20];
            uint64_t v21 = [v19 dateByAddingTimeInterval:v8];

            id v9 = (void *)v21;
          }
          id v10 = [v19 dateByAddingTimeInterval:v7];

          uint64_t v11 = [v10 dateByAddingTimeInterval:v7];

          ++v16;
          double v17 = v10;
          uint64_t v18 = v11;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v10];
    [v27 addObject:v22];
    id v23 = v27;

    id v5 = v26;
  }
  else
  {
    id v23 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v23;
}

@end