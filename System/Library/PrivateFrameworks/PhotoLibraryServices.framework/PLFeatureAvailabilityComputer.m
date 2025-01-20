@interface PLFeatureAvailabilityComputer
+ (id)_predicateForAllAssetsAllowedForProcessingForSceneAnalysis:(BOOL)a3;
+ (id)_predicateForAllCuratedAssetsForSceneAnalysis:(BOOL)a3;
+ (id)_predicateForCountOfProcessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 versionProvider:(id)a5;
+ (id)_predicateForEnrichedHighlights;
+ (id)_predicatesForVisibleAssets;
+ (id)_savedAssetTypePredicateForSceneAnalysis:(BOOL)a3;
- (BOOL)_addAnalysisStatusForMediaTaskID:(unint64_t)a3 toProcessingSnapshot:(id)a4 managedObjectContext:(id)a5 error:(id *)a6;
- (BOOL)_addAssetCountsToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 forSceneAnalysis:(BOOL)a5 error:(id *)a6;
- (BOOL)_addCaptioningStatusToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)_addEmbeddingVectorIndexingStatusToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)_addHighlightStatusToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)_addSpotlightSearchIndexingStatusToProcessingSnapshot:(id)a3 forTaskID:(unint64_t)a4 completedCount:(int64_t)a5 totalCount:(int64_t)a6 error:(id *)a7;
- (BOOL)_clearAvailabilityForPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)_failAvailabilityForPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)clearAvailabilityStateForPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)didDropSearchIndexForPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)didFinishSearchIndexRebuidForPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)failAvailabilityForPhotoLibrary:(id)a3 error:(id *)a4;
- (PLFeatureAvailabilityComputer)initWithTransitionDelegate:(id)a3 progressDelegate:(id)a4;
- (id)_computeAvailabilityForSnapshot:(id)a3 photoLibrary:(id)a4 shouldPersist:(BOOL)a5 error:(id *)a6;
- (unint64_t)_assetCountForPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (void)_addAssetCountsToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_addAssetForSceneCountsToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_addCaptioningToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_addEmbeddingIndexingToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_addHighlightStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_addMediaAnalysisIndexingToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_addPhotosKnowledgeGraphAvailabilityToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_addSceneAnalysisIndexingToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_addSceneAnalysisToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_addVUIndexFullClusterStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_addVersionsToProcessingSnapshot:(id)a3;
- (void)_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_fetchSpotlightSearchIndexingStatusForTaskID:(unint64_t)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_onDemandAvailabilityUpdateForPhotoLibrary:(id)a3 completionHandler:(id)a4;
- (void)_onDemand_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)_persistFeatureAvailabilityDictionary:(id)a3 photoLibrary:(id)a4;
- (void)_readLastFullModeClusterDateWithPhotoLibrary:(id)a3 completionHandler:(id)a4;
- (void)_updateVUClusterStateInProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5;
- (void)computeAvailabilityForPhotoLibrary:(id)a3 shouldPersist:(BOOL)a4 completionHandler:(id)a5;
- (void)computeSnapshotForPhotoLibrary:(id)a3 completionHandler:(id)a4;
- (void)onDemandAvailabilityUpdateForPhotoLibrary:(id)a3 completionHandler:(id)a4;
- (void)updatePersistedSnapshotIfNeededWithLightweightVersionCheckForPhotoLibrary:(id)a3;
@end

@implementation PLFeatureAvailabilityComputer

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressDelegate);
  objc_destroyWeak((id *)&self->_transitionDelegate);
  objc_storeStrong((id *)&self->_versionProvider, 0);
}

- (void)_updateVUClusterStateInProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__PLFeatureAvailabilityComputer__updateVUClusterStateInProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v12[3] = &unk_1E5870780;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(PLFeatureAvailabilityComputer *)self _readLastFullModeClusterDateWithPhotoLibrary:a4 completionHandler:v12];
}

void __106__PLFeatureAvailabilityComputer__updateVUClusterStateInProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v10 = a4;
  if (a2)
  {
    BOOL v7 = a3 != 0;
    id v8 = *(void **)(a1 + 32);
    id v9 = a3;
    [v8 setVuIndexIsFullClustered:v7];
    [*(id *)(a1 + 32) setLastFullVUIndexClusterDate:v9];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_readLastFullModeClusterDateWithPhotoLibrary:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  PLPhotosSearchGetLog();
  BOOL v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FeatureAvailability - LastFullModeClusterDate", "", buf, 2u);
  }

  id v11 = [v5 pathManager];
  v12 = [v11 libraryURL];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3254779904;
  v17[2] = __96__PLFeatureAvailabilityComputer__readLastFullModeClusterDateWithPhotoLibrary_completionHandler___block_invoke;
  v17[3] = &unk_1EEB2D5D8;
  id v13 = v12;
  id v18 = v13;
  id v14 = v10;
  v21 = v14;
  os_signpost_id_t v22 = v8;
  id v15 = v6;
  id v20 = v15;
  id v16 = v5;
  id v19 = v16;
  +[PLMediaAnalysisServiceRequestAdapter queryVUIndexLastFullModeClusterDateWithPhotoLibraryURL:v13 completionHandler:v17];
}

void __96__PLFeatureAvailabilityComputer__readLastFullModeClusterDateWithPhotoLibrary_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__85960;
  v24[4] = __Block_byref_object_dispose__85961;
  id v9 = v7;
  id v25 = v9;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__85960;
  v22[4] = __Block_byref_object_dispose__85961;
  id v10 = v8;
  id v23 = v10;
  id v11 = +[PLConcurrencyLimiter sharedLimiter];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3254779904;
  v14[2] = __96__PLFeatureAvailabilityComputer__readLastFullModeClusterDateWithPhotoLibrary_completionHandler___block_invoke_2;
  v14[3] = &unk_1EEB2D5A0;
  int v21 = a2;
  v17 = v22;
  id v18 = v24;
  id v15 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  id v19 = v12;
  uint64_t v20 = v13;
  id v16 = *(id *)(a1 + 48);
  [v11 async:v14 identifyingBlock:0 library:*(void *)(a1 + 40)];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

uint64_t __96__PLFeatureAvailabilityComputer__readLastFullModeClusterDateWithPhotoLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  *(void *)&v27[13] = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 80);
  if (v2 == +[PLMediaAnalysisServiceRequestAdapter invalidMADRequestID](PLMediaAnalysisServiceRequestAdapter, "invalidMADRequestID")&& [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) code] == 46309&& (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "domain"), v3 = objc_claimAutoreleasedReturnValue(), int v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E4F8C500]), v3, v4))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v22 = *(id *)(v10 + 40);
    id obj = v8;
    int v11 = +[PLMediaAnalysisServiceRequestAdapter queryVUIndexLastFullModeClusterDate:&obj photoLibraryURL:v9 error:&v22];
    objc_storeStrong((id *)(v7 + 40), obj);
    objc_storeStrong((id *)(v10 + 40), v22);
    if (v11 || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136315650;
        id v25 = "-[PLFeatureAvailabilityComputer _readLastFullModeClusterDateWithPhotoLibrary:completionHandler:]_block_invoke_2";
        __int16 v26 = 1024;
        *(_DWORD *)v27 = v11;
        v27[2] = 2112;
        *(void *)&v27[3] = v13;
        id v14 = "FeatureAvailability - %s - sync MAD query failed with returnCode %d and error: %@";
        id v15 = v12;
        uint32_t v16 = 28;
LABEL_11:
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      id v25 = "-[PLFeatureAvailabilityComputer _readLastFullModeClusterDateWithPhotoLibrary:completionHandler:]_block_invoke";
      __int16 v26 = 2112;
      *(void *)v27 = v17;
      id v14 = "FeatureAvailability - %s - async MAD query failed with error: %@";
      id v15 = v12;
      uint32_t v16 = 22;
      goto LABEL_11;
    }
LABEL_12:
  }
  id v18 = *(id *)(a1 + 64);
  id v19 = v18;
  os_signpost_id_t v20 = *(void *)(a1 + 72);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "FeatureAvailability - LastFullModeClusterDate", "", buf, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)didFinishSearchIndexRebuidForPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 libraryServicesManager];
  uint64_t v7 = [v6 backgroundJobService];

  if (v7)
  {
    id v8 = [v5 libraryBundle];
    [v7 signalBackgroundProcessingNeededOnBundle:v8];
  }
  else
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"FeatureAvailability - %s - no background job service", "-[PLFeatureAvailabilityComputer didFinishSearchIndexRebuidForPhotoLibrary:error:]");
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    if (a4) {
      *a4 = (id)PLErrorCreate();
    }
  }
  return v7 != 0;
}

- (BOOL)didDropSearchIndexForPhotoLibrary:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 globalValues];
  id v8 = [v7 featureAvailability];

  if (v8)
  {
    uint64_t v9 = [[PLFeatureAvailability alloc] initWithDictionary:v8];
    uint64_t v10 = [(PLFeatureAvailability *)v9 processingSnapshot];
    int v11 = v10;
    BOOL v12 = v10 != 0;
    if (v10)
    {
      [v10 resetSearchIndexState];
      uint64_t v13 = [[PLFeatureAvailability alloc] initWithProcessingSnapshot:v11];
      uint64_t v14 = [(PLFeatureAvailability *)v13 dictionary];
      [(PLFeatureAvailabilityComputer *)self _persistFeatureAvailabilityDictionary:v14 photoLibrary:v6];
    }
    else
    {
      id v15 = [NSString stringWithFormat:@"FeatureAvailability - %s - availability state persisted, but no snapshot", "-[PLFeatureAvailabilityComputer didDropSearchIndexForPhotoLibrary:error:]"];
      uint32_t v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v15;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      if (a4) {
        *a4 = (id)PLErrorCreate();
      }
    }
  }
  else
  {
    PLBackendGetLog();
    uint64_t v9 = (PLFeatureAvailability *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = 1;
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[PLFeatureAvailabilityComputer didDropSearchIndexForPhotoLibrary:error:]";
      _os_log_impl(&dword_19B3C7000, &v9->super, OS_LOG_TYPE_INFO, "FeatureAvailability - %s - no persisted availability", buf, 0xCu);
    }
  }

  return v12;
}

- (void)_onDemandAvailabilityUpdateForPhotoLibrary:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  PLPhotosSearchGetLog();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = v8;
  int v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FeatureAvailability - OnDemandUpdate", "", buf, 2u);
  }

  BOOL v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "FeatureAvailability - on-demand availability update", buf, 2u);
  }

  uint64_t v13 = [v6 globalValues];
  uint64_t v14 = [v13 featureAvailability];

  if (v14)
  {
    id v15 = [[PLFeatureAvailability alloc] initWithDictionary:v14];
    uint32_t v16 = [(PLFeatureAvailability *)v15 processingSnapshot];
    if (v16)
    {
      objc_initWeak((id *)buf, self);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3254779904;
      v25[2] = __94__PLFeatureAvailabilityComputer__onDemandAvailabilityUpdateForPhotoLibrary_completionHandler___block_invoke;
      v25[3] = &unk_1EEB2D450;
      objc_copyWeak(&v29, (id *)buf);
      id v17 = v7;
      id v28 = v7;
      id v26 = v16;
      id v18 = v6;
      id v19 = v6;
      uint64_t v20 = self;
      id v21 = v19;
      id v27 = v19;
      v30 = v11;
      os_signpost_id_t v31 = v9;
      [(PLFeatureAvailabilityComputer *)v20 _updateVUClusterStateInProcessingSnapshot:v26 photoLibrary:v21 completionHandler:v25];

      id v6 = v18;
      id v7 = v17;

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v23 = [NSString stringWithFormat:@"FeatureAvailability - %s - availability state persisted, but no snapshot", "-[PLFeatureAvailabilityComputer _onDemandAvailabilityUpdateForPhotoLibrary:completionHandler:]"];
      v24 = (void *)PLErrorCreate();
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v24);
    }
  }
  else
  {
    id v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[PLFeatureAvailabilityComputer _onDemandAvailabilityUpdateForPhotoLibrary:completionHandler:]";
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "FeatureAvailability - %s - no persisted availability", buf, 0xCu);
    }

    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

void __94__PLFeatureAvailabilityComputer__onDemandAvailabilityUpdateForPhotoLibrary_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3254779904;
      v15[2] = __94__PLFeatureAvailabilityComputer__onDemandAvailabilityUpdateForPhotoLibrary_completionHandler___block_invoke_78;
      v15[3] = &unk_1EEB2D568;
      objc_copyWeak(&v20, (id *)(a1 + 56));
      id v19 = *(id *)(a1 + 48);
      id v16 = 0;
      id v17 = *(id *)(a1 + 32);
      id v18 = *(id *)(a1 + 40);
      id v9 = *(id *)(a1 + 64);
      uint64_t v10 = *(void *)(a1 + 72);
      id v21 = v9;
      uint64_t v22 = v10;
      objc_msgSend(WeakRetained, "_onDemand_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:photoLibrary:completionHandler:", v7, v8, v15);

      objc_destroyWeak(&v20);
    }
    else
    {
      uint64_t v14 = PLBackendGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[PLFeatureAvailabilityComputer _onDemandAvailabilityUpdateForPhotoLibrary:completionHandler:]_block_invoke";
        __int16 v25 = 2112;
        id v26 = v5;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed to read last full mode cluster date from MAD, error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"FeatureAvailability - %s - completion missing self", "-[PLFeatureAvailabilityComputer _onDemandAvailabilityUpdateForPhotoLibrary:completionHandler:]_block_invoke");
    int v11 = (char *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    uint64_t v13 = (void *)PLErrorCreate();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __94__PLFeatureAvailabilityComputer__onDemandAvailabilityUpdateForPhotoLibrary_completionHandler___block_invoke_78(uint64_t a1, char a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"FeatureAvailability - %s - completion missing self", "-[PLFeatureAvailabilityComputer _onDemandAvailabilityUpdateForPhotoLibrary:completionHandler:]_block_invoke");
    id v5 = (PLFeatureAvailability *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = (const char *)v5;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    int v11 = (void *)PLErrorCreate();
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    goto LABEL_10;
  }
  if (a2)
  {
    id v5 = [[PLFeatureAvailability alloc] initWithProcessingSnapshot:*(void *)(a1 + 40)];
    id v6 = [(PLFeatureAvailability *)v5 dictionary];
    [WeakRetained _persistFeatureAvailabilityDictionary:v6 photoLibrary:*(void *)(a1 + 48)];

    uint64_t v7 = *(id *)(a1 + 72);
    uint64_t v8 = v7;
    os_signpost_id_t v9 = *(void *)(a1 + 80);
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "FeatureAvailability - OnDemandUpdate", "", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_10:

    goto LABEL_14;
  }
  BOOL v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v15 = "-[PLFeatureAvailabilityComputer _onDemandAvailabilityUpdateForPhotoLibrary:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed to add cluster index status from MAD, error: %@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_14:
}

- (void)onDemandAvailabilityUpdateForPhotoLibrary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = +[PLConcurrencyLimiter sharedLimiter];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__PLFeatureAvailabilityComputer_onDemandAvailabilityUpdateForPhotoLibrary_completionHandler___block_invoke;
  v11[3] = &unk_1E5870758;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  [v8 async:v11 identifyingBlock:0 library:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __93__PLFeatureAvailabilityComputer_onDemandAvailabilityUpdateForPhotoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __93__PLFeatureAvailabilityComputer_onDemandAvailabilityUpdateForPhotoLibrary_completionHandler___block_invoke_2;
    v4[3] = &unk_1E5874DE8;
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    [WeakRetained _onDemandAvailabilityUpdateForPhotoLibrary:v3 completionHandler:v4];
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer onDemandAvailabilityUpdateForPhotoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 40));
  }
}

void __93__PLFeatureAvailabilityComputer_onDemandAvailabilityUpdateForPhotoLibrary_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = (void *)MEMORY[0x1E4F8B9B8];
  if (a3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F8B9B8], "failureWithError:");
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
    id v7 = [v4 successWithResult:v6];

    uint64_t v5 = (uint64_t)v7;
  }
  id v8 = (id)v5;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updatePersistedSnapshotIfNeededWithLightweightVersionCheckForPhotoLibrary:(id)a3
{
  id v12 = a3;
  int v4 = [v12 globalValues];
  uint64_t v5 = [v4 featureAvailability];

  if (v5)
  {
    id v6 = [[PLFeatureAvailability alloc] initWithDictionary:v5];
    id v7 = [(PLFeatureAvailability *)v6 processingSnapshot];
    if (![v7 mediaAnalysisImageVersion])
    {
      [v7 setMediaAnalysisImageVersion:67];
      [v7 setHasConsistentMediaAnalysisImageVersion:1];
    }
    id v8 = +[PLFeatureProcessingAlgorithmVersionProvider provider];
    uint64_t v9 = [v7 mediaAnalysisImageVersion];
    if (v9 != (int)[v8 mediaAnalysisImageVersion]) {
      [v7 setHasConsistentMediaAnalysisImageVersion:0];
    }
    id v10 = [[PLFeatureAvailability alloc] initWithProcessingSnapshot:v7];
    int v11 = [(PLFeatureAvailability *)v10 dictionary];
    if (v11 != v5) {
      [(PLFeatureAvailabilityComputer *)self _persistFeatureAvailabilityDictionary:v11 photoLibrary:v12];
    }
  }
}

- (void)_persistFeatureAvailabilityDictionary:(id)a3 photoLibrary:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 globalValues];
  uint64_t v9 = [v8 featureAvailability];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v36 = v9;
  if (v9)
  {
    int v11 = -[PLFeatureAvailability initWithDictionary:]([PLFeatureAvailability alloc], "initWithDictionary:", v9, v9);
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    v42 = v11;
    id v13 = [(PLFeatureAvailability *)v11 availabilityByFeature];
    id v14 = [v13 allKeys];
    id v15 = [v12 setWithArray:v14];
    [v10 unionSet:v15];

    if (v6)
    {
LABEL_3:
      __int16 v16 = [[PLFeatureAvailability alloc] initWithDictionary:v6];
      uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v18 = [(PLFeatureAvailability *)v16 availabilityByFeature];
      id v19 = [v18 allKeys];
      id v20 = [v17 setWithArray:v19];
      [v10 unionSet:v20];

      goto LABEL_6;
    }
  }
  else
  {
    v42 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  __int16 v16 = 0;
LABEL_6:
  v38 = v7;
  id v21 = objc_msgSend(v7, "globalValues", v36);
  v39 = v6;
  [v21 setFeatureAvailability:v6];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v10;
  uint64_t v22 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v44;
    p_progressDelegate = &self->_progressDelegate;
    id location = (id *)&self->_transitionDelegate;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)p_progressDelegate);
        [WeakRetained featureAvailability:v16 updateProgressForFeature:v27];

        id v29 = [(PLFeatureAvailability *)v42 availabilityByFeature];
        v30 = [v29 objectForKeyedSubscript:v27];
        int v31 = [v30 BOOLValue];

        v32 = [(PLFeatureAvailability *)v16 availabilityByFeature];
        v33 = [v32 objectForKeyedSubscript:v27];
        uint64_t v34 = [v33 BOOLValue];

        if (v31 != v34)
        {
          id v35 = objc_loadWeakRetained(location);
          [v35 availability:v16 feature:v27 didTransition:v34];
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v23);
  }
}

- (BOOL)_failAvailabilityForPhotoLibrary:(id)a3 error:(id *)a4
{
  int v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 date];
  id v7 = [v5 globalValues];
  [v7 setTimeOfLastFeatureAvailabilityJob:v6];

  id v8 = [v5 globalValues];

  [v8 setFeatureAvailabilityJobDidFail:MEMORY[0x1E4F1CC38]];
  return 1;
}

- (BOOL)_clearAvailabilityForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [(PLFeatureAvailabilityComputer *)self _persistFeatureAvailabilityDictionary:0 photoLibrary:v5];
  id v6 = [v5 globalValues];
  [v6 setTimeOfLastFeatureAvailabilityJob:0];

  id v7 = [v5 globalValues];

  [v7 setFeatureAvailabilityJobDidFail:0];
  return 1;
}

- (id)_computeAvailabilityForSnapshot:(id)a3 photoLibrary:(id)a4 shouldPersist:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [[PLFeatureAvailability alloc] initWithProcessingSnapshot:v10];

  if (v6)
  {
    id v12 = [(PLFeatureAvailability *)v11 dictionary];
    [(PLFeatureAvailabilityComputer *)self _persistFeatureAvailabilityDictionary:v12 photoLibrary:v9];
  }
  return v11;
}

- (void)_fetchSpotlightSearchIndexingStatusForTaskID:(unint64_t)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  PLPhotosSearchGetLog();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  int v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FeatureAvailability - IndexingStatusForTaskID", "", buf, 2u);
  }

  id v13 = [v7 libraryServicesManager];
  id v14 = [v13 searchDonationProgress];

  if (v14)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3254779904;
    v17[2] = __109__PLFeatureAvailabilityComputer__fetchSpotlightSearchIndexingStatusForTaskID_photoLibrary_completionHandler___block_invoke;
    v17[3] = &unk_1EEB29368;
    id v18 = v8;
    id v19 = v12;
    os_signpost_id_t v20 = v10;
    unint64_t v21 = a3;
    id v15 = (id)[v14 donationProgressForMediaProcessingTaskID:a3 completionHandler:v17];

    __int16 v16 = v18;
  }
  else
  {
    __int16 v16 = (void *)PLErrorCreate();
    (*((void (**)(id, void, void, void, void *))v8 + 2))(v8, 0, 0, 0, v16);
  }
}

void __109__PLFeatureAvailabilityComputer__fetchSpotlightSearchIndexingStatusForTaskID_photoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLBackendGetLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      id v15 = "-[PLFeatureAvailabilityComputer _fetchSpotlightSearchIndexingStatusForTaskID:photoLibrary:completionHandler:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - searchDonationProgress failed with error: %@", (uint8_t *)&v14, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v9 = *(id *)(a1 + 40);
    os_signpost_id_t v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 48);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(v14) = 0;
LABEL_12:
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FeatureAvailability - IndexingStatusForTaskID", "", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v12 = *(const char **)(a1 + 56);
      int v14 = 134217984;
      id v15 = v12;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "FeatureAvailability - Finished indexing status task for taskID: %tu", (uint8_t *)&v14, 0xCu);
    }

    [v5 completedUnitCount];
    [v5 totalUnitCount];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v13 = *(id *)(a1 + 40);
    os_signpost_id_t v10 = v13;
    os_signpost_id_t v11 = *(void *)(a1 + 48);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v14) = 0;
      goto LABEL_12;
    }
  }
}

- (BOOL)_addSpotlightSearchIndexingStatusToProcessingSnapshot:(id)a3 forTaskID:(unint64_t)a4 completedCount:(int64_t)a5 totalCount:(int64_t)a6 error:(id *)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  os_signpost_id_t v11 = PLBackendGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v26 = a4;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "FeatureAvailability - adding spotlight search indexing status to processing snapshot for taskID: %tu", buf, 0xCu);
  }

  if (a4 == 1)
  {
    unint64_t v17 = [v10 totalAssetCount];
    if (v17) {
      double v18 = (double)a5 / (double)v17;
    }
    else {
      double v18 = 0.0;
    }
    [v10 setFractionOfAllAssetsWithMediaAnalysisInSearchIndex:v18];
LABEL_19:
    BOOL v23 = 1;
    goto LABEL_20;
  }
  if (a4 == 2)
  {
    unint64_t v12 = [v10 totalCuratedAssetForScenesCount];
    double v13 = 0.0;
    double v14 = 0.0;
    if (v12) {
      double v14 = (double)a5 / (double)v12;
    }
    double v15 = fmin(v14, 1.0);
    unint64_t v16 = [v10 totalAssetForScenesCount];
    if (v16) {
      double v13 = (double)a5 / (double)v16;
    }
    [v10 setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndex:v15];
    objc_msgSend(v10, "setFractionOfAllAssetsWithSceneAnalysisInSearchIndex:", fmin(v13, 1.0));
    goto LABEL_19;
  }
  id v19 = objc_msgSend(NSString, "stringWithFormat:", @"FeatureAvailability - %s - unexpected media processing taskID: %tu", "-[PLFeatureAvailabilityComputer _addSpotlightSearchIndexingStatusToProcessingSnapshot:forTaskID:completedCount:totalCount:error:]", a4);
  os_signpost_id_t v20 = (void *)PLErrorCreate();
  unint64_t v21 = v20;
  if (a7) {
    *a7 = v20;
  }
  uint64_t v22 = PLBackendGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v26 = (unint64_t)v19;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  BOOL v23 = 0;
LABEL_20:

  return v23;
}

- (BOOL)_addAnalysisStatusForMediaTaskID:(unint64_t)a3 toProcessingSnapshot:(id)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v31 = a4;
  id v10 = a5;
  PLPhotosSearchGetLog();
  os_signpost_id_t v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  double v13 = v11;
  double v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FeatureAvailability - AddAnalysisStatus", "", buf, 2u);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  unint64_t v16 = +[PLManagedAsset entityName];
  unint64_t v17 = PLSafeEntityForNameInManagedObjectContext((uint64_t)v16, (uint64_t)v10, 0);
  [v15 setEntity:v17];

  double v18 = [(id)objc_opt_class() _predicateForCountOfProcessedAssetsForMediaProcessingTaskID:a3 priority:0 versionProvider:self->_versionProvider];
  [v15 setPredicate:v18];

  id v32 = 0;
  unint64_t v19 = [v10 countForFetchRequest:v15 error:&v32];
  id v20 = v32;
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == 2)
    {
      unint64_t v23 = [v31 totalAssetForScenesCount];
      if (v23) {
        double v24 = (double)v19 / (double)v23;
      }
      else {
        double v24 = 0.0;
      }
      objc_msgSend(v31, "setFractionOfAllAssetsAnalyzedForScenes:", v24, v31);
      BOOL v22 = 1;
      goto LABEL_20;
    }
    __int16 v25 = (void *)PLErrorCreate();
    unint64_t v26 = v25;
    if (a6) {
      *a6 = v25;
    }
    uint64_t v27 = PLBackendGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v34 = a3;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "FeatureAvailability - unexpected media processing task ID: %tu", buf, 0xCu);
    }

    goto LABEL_17;
  }
  unint64_t v21 = PLBackendGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v34 = a3;
    __int16 v35 = 2112;
    id v36 = v20;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "FeatureAvailability - Failed to fetch count of assets that have been analyzed for media task ID: %tu, error: %@", buf, 0x16u);
  }

  if (!a6)
  {
LABEL_17:
    BOOL v22 = 0;
    goto LABEL_20;
  }
  BOOL v22 = 0;
  *a6 = v20;
LABEL_20:
  id v28 = v14;
  id v29 = v28;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_END, v12, "FeatureAvailability - AddAnalysisStatus", "", buf, 2u);
  }

  return v22;
}

- (BOOL)_addHighlightStatusToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v7 = a4;
  PLPhotosSearchGetLog();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = v8;
  os_signpost_id_t v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FeatureAvailability - HighlightProcessing", "", buf, 2u);
  }

  double v13 = PLBackendGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "FeatureAvailability - adding highlight enrichment status to processing snapshot", buf, 2u);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v15 = +[PLPhotosHighlight entityName];
  unint64_t v16 = PLSafeEntityForNameInManagedObjectContext((uint64_t)v15, (uint64_t)v7, 0);
  [v14 setEntity:v16];

  id v34 = 0;
  unint64_t v17 = [v7 countForFetchRequest:v14 error:&v34];
  id v18 = v34;
  if (!v17)
  {
    [v32 setFractionOfHighlightsEnriched:0.0];
    id v23 = v18;
    goto LABEL_27;
  }
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v24 = [(id)objc_opt_class() _predicateForEnrichedHighlights];
    [v14 setPredicate:v24];

    id v33 = v18;
    unint64_t v25 = [v7 countForFetchRequest:v14 error:&v33];
    id v23 = v33;

    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v26 = PLBackendGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v23;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "FeatureAvailability - Failed to fetch count of enriched highlights, error: %@", buf, 0xCu);
      }

      if (a5) {
        *a5 = v23;
      }
      uint64_t v27 = v11;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        id v28 = v27;
        if (os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v28, OS_SIGNPOST_INTERVAL_END, v9, "FeatureAvailability - HighlightProcessing", "", buf, 2u);
        }
      }
      BOOL v22 = 0;
LABEL_31:
      id v18 = v23;
      goto LABEL_32;
    }
    [v32 setFractionOfHighlightsEnriched:(double)v25 / (double)v17];
LABEL_27:
    id v29 = v11;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v30 = v29;
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v30, OS_SIGNPOST_INTERVAL_END, v9, "FeatureAvailability - HighlightProcessing", "", buf, 2u);
      }
    }
    BOOL v22 = 1;
    goto LABEL_31;
  }
  unint64_t v19 = PLBackendGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v18;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "FeatureAvailability - Failed to fetch count of highlights, error: %@", buf, 0xCu);
  }

  if (a5) {
    *a5 = v18;
  }
  id v20 = v11;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v21 = v20;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_INTERVAL_END, v9, "FeatureAvailability - HighlightProcessing", "", buf, 2u);
    }
  }
  BOOL v22 = 0;
LABEL_32:

  return v22;
}

- (BOOL)_addEmbeddingVectorIndexingStatusToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  PLPhotosSearchGetLog();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  unint64_t v12 = v10;
  double v13 = v12;
  unint64_t v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FeatureAvailability - AddVectorIndexingStateToAvailability", "", buf, 2u);
  }

  id v15 = PLBackendGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "FeatureAvailability - adding embedding vector indexing status to processing snapshot", buf, 2u);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  unint64_t v17 = +[PLManagedAsset entityName];
  id v18 = PLSafeEntityForNameInManagedObjectContext((uint64_t)v17, (uint64_t)v9, 0);
  [v16 setEntity:v18];

  unint64_t v19 = [(id)objc_opt_class() _predicateForCountOfProcessedAssetsForMediaProcessingTaskID:17 priority:0 versionProvider:self->_versionProvider];
  [v16 setPredicate:v19];

  id v29 = 0;
  unint64_t v20 = [v9 countForFetchRequest:v16 error:&v29];
  id v21 = v29;
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v24 = PLBackendGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v21;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "FeatureAvailability - Failed to fetch count of assets with mediaAnalysisImageVersion, error: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v21;
    }
    unint64_t v25 = v13;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      unint64_t v26 = v25;
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
LABEL_20:
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v11, "FeatureAvailability - AddVectorIndexingStateToAvailability", "", buf, 2u);
      }
    }
  }
  else
  {
    unint64_t v22 = [v8 totalCuratedAssetCount];
    if (v22) {
      double v23 = (double)v20 / (double)v22;
    }
    else {
      double v23 = 0.0;
    }
    objc_msgSend(v8, "setFractionOfCuratedAssetsWithEmbeddingsInVectorIndex:", fmin(v23, 1.0));
    uint64_t v27 = v13;
    if (v14 < 0xFFFFFFFFFFFFFFFELL)
    {
      unint64_t v26 = v27;
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        goto LABEL_20;
      }
    }
  }

  return v20 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_onDemand_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  PLPhotosSearchGetLog();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  unint64_t v12 = v10;
  double v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FeatureAvailability - VisualUnderstandingClustering", "", buf, 2u);
  }

  unint64_t v14 = PLBackendGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "FeatureAvailability - adding VU cluster index status to processing snapshot", buf, 2u);
  }

  id v15 = [v8 pathManager];
  id v16 = [v15 libraryURL];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  v21[2] = __135__PLFeatureAvailabilityComputer__onDemand_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v21[3] = &unk_1EEB2D530;
  id v17 = v8;
  id v22 = v17;
  id v18 = v13;
  unint64_t v25 = v18;
  os_signpost_id_t v26 = v11;
  id v19 = v9;
  id v24 = v19;
  id v20 = v7;
  id v23 = v20;
  +[PLMediaAnalysisServiceRequestAdapter queryVUIndexAssetCountForType:0 photoLibraryURL:v16 completionHandler:v21];
}

void __135__PLFeatureAvailabilityComputer__onDemand_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__85960;
  void v17[4] = __Block_byref_object_dispose__85961;
  id v5 = a4;
  id v18 = v5;
  id v6 = +[PLConcurrencyLimiter sharedLimiter];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3254779904;
  v9[2] = __135__PLFeatureAvailabilityComputer__onDemand_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2;
  v9[3] = &unk_1EEB2D4F8;
  double v13 = v17;
  id v10 = *(id *)(a1 + 32);
  unint64_t v14 = v19;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  id v15 = v7;
  uint64_t v16 = v8;
  id v12 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  [v6 async:v9 identifyingBlock:0 library:*(void *)(a1 + 32)];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

uint64_t __135__PLFeatureAvailabilityComputer__onDemand_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void **)(*(void *)(v2 + 8) + 40);
  if (v3)
  {
    uint64_t v4 = [v3 code];
    uint64_t v2 = *(void *)(a1 + 56);
    if (v4 == 46309)
    {
      id v5 = [*(id *)(*(void *)(v2 + 8) + 40) domain];
      int v6 = [v5 isEqualToString:*MEMORY[0x1E4F8C500]];

      uint64_t v2 = *(void *)(a1 + 56);
      if (v6)
      {
        uint64_t v7 = *(void *)(v2 + 8);
        uint64_t v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = 0;

        id v9 = [*(id *)(a1 + 32) pathManager];
        id v10 = [v9 libraryURL];
        uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
        id obj = *(id *)(v11 + 40);
        id v12 = +[PLMediaAnalysisServiceRequestAdapter queryVUIndexAssetCountForType:0 photoLibraryURL:v10 error:&obj];
        objc_storeStrong((id *)(v11 + 40), obj);

        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (int)[v12 intValue];
        uint64_t v2 = *(void *)(a1 + 56);
      }
    }
  }
  if (*(void *)(*(void *)(v2 + 8) + 40))
  {
    double v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "FeatureAvailability - Encountered an error when querying for VU cluster index status.", buf, 2u);
    }

    unint64_t v14 = *(id *)(a1 + 72);
    id v15 = v14;
    os_signpost_id_t v16 = *(void *)(a1 + 80);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)unint64_t v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "FeatureAvailability - VisualUnderstandingClustering", "", v25, 2u);
    }

    id v17 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    unint64_t v18 = [*(id *)(a1 + 40) totalCuratedAssetCount];
    if (v18) {
      double v19 = (double)*(uint64_t *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) / (double)v18;
    }
    else {
      double v19 = 0.0;
    }
    objc_msgSend(*(id *)(a1 + 40), "setFractionOfCuratedAssetsIndexedInVUClustering:", fmin(v19, 1.0));
    id v20 = *(id *)(a1 + 72);
    id v21 = v20;
    os_signpost_id_t v22 = *(void *)(a1 + 80);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)id v24 = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "FeatureAvailability - VisualUnderstandingClustering", "", v24, 2u);
    }

    id v17 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  return v17();
}

- (BOOL)_addCaptioningStatusToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  PLPhotosSearchGetLog();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = v10;
  double v13 = v12;
  unint64_t v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FeatureAvailability - Captioning", "", buf, 2u);
  }

  id v15 = PLBackendGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "FeatureAvailability - adding captioning status to processing snapshot", buf, 2u);
  }

  id v16 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v17 = +[PLManagedAsset entityName];
  unint64_t v18 = PLSafeEntityForNameInManagedObjectContext((uint64_t)v17, (uint64_t)v9, 0);
  [v16 setEntity:v18];

  double v19 = [(id)objc_opt_class() _predicateForCountOfProcessedAssetsForMediaProcessingTaskID:17 priority:0 versionProvider:self->_versionProvider];
  [v16 setPredicate:v19];

  id v31 = 0;
  unint64_t v20 = [v9 countForFetchRequest:v16 error:&v31];
  id v21 = v31;
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v24 = PLBackendGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v33 = "-[PLFeatureAvailabilityComputer _addCaptioningStatusToProcessingSnapshot:managedObjectContext:error:]";
      __int16 v34 = 2112;
      id v35 = v21;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
    }

    if (a5) {
      *a5 = v21;
    }
    unint64_t v25 = v13;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v26 = v25;
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
LABEL_23:
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v11, "FeatureAvailability - Captioning", "", buf, 2u);
      }
    }
  }
  else
  {
    unint64_t v22 = [v8 totalCuratedAssetCount];
    if (v22) {
      double v23 = (double)v20 / (double)v22;
    }
    else {
      double v23 = 0.0;
    }
    objc_msgSend(v8, "setFractionOfCuratedAssetsWithCaptions:", fmin(v23, 1.0));
    unint64_t v27 = [v8 totalAssetCount];
    if (v27) {
      double v28 = (double)v20 / (double)v27;
    }
    else {
      double v28 = 0.0;
    }
    [v8 setFractionOfAllAssetsWithCaptions:v28];
    id v29 = v13;
    if (v14 < 0xFFFFFFFFFFFFFFFELL)
    {
      os_signpost_id_t v26 = v29;
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        goto LABEL_23;
      }
    }
  }

  return v20 != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_assetCountForPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  os_signpost_id_t v11 = +[PLManagedAsset entityName];
  id v12 = PLSafeEntityForNameInManagedObjectContext((uint64_t)v11, (uint64_t)v8, 0);
  [v10 setEntity:v12];

  [v10 setPredicate:v9];
  id v17 = 0;
  unint64_t v13 = [v8 countForFetchRequest:v10 error:&v17];

  id v14 = v17;
  id v15 = v14;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = 0;
    if (a5) {
      *a5 = v14;
    }
  }

  return v13;
}

- (BOOL)_addAssetCountsToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 forSceneAnalysis:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  PLPhotosSearchGetLog();
  os_signpost_id_t v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  unint64_t v13 = v11;
  id v14 = v13;
  os_signpost_id_t spid = v12;
  unint64_t v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FeatureAvailability - InitializeCounts", "", buf, 2u);
  }

  if (v6)
  {
    [v9 setTotalCuratedAssetForScenesCount:0];
    [v9 setTotalAssetForScenesCount:0];
  }
  else
  {
    [v9 setTotalCuratedAssetCount:0];
    [v9 setTotalAssetCount:0];
  }
  id v16 = [(id)objc_opt_class() _predicateForAllAssetsAllowedForProcessingForSceneAnalysis:v6];
  id v35 = 0;
  unint64_t v17 = [(PLFeatureAvailabilityComputer *)self _assetCountForPredicate:v16 managedObjectContext:v10 error:&v35];
  id v18 = v35;
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v37 = "-[PLFeatureAvailabilityComputer _addAssetCountsToProcessingSnapshot:managedObjectContext:forSceneAnalysis:error:]";
      __int16 v38 = 2112;
      id v39 = v18;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
    }

    if (a6) {
      *a6 = v18;
    }
    unint64_t v20 = v14;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      id v21 = v20;
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_INTERVAL_END, spid, "FeatureAvailability - InitializeCounts", "", buf, 2u);
      }
    }
    BOOL v22 = 0;
  }
  else
  {
    uint64_t v23 = [(id)objc_opt_class() _predicateForAllCuratedAssetsForSceneAnalysis:v6];

    id v34 = v18;
    unint64_t v24 = [(PLFeatureAvailabilityComputer *)self _assetCountForPredicate:v23 managedObjectContext:v10 error:&v34];
    id v25 = v34;

    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      os_signpost_id_t v26 = PLBackendGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v37 = "-[PLFeatureAvailabilityComputer _addAssetCountsToProcessingSnapshot:managedObjectContext:forSceneAnalysis:error:]";
        __int16 v38 = 2112;
        id v39 = v25;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      if (a6) {
        *a6 = v25;
      }
      unint64_t v27 = v14;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        double v28 = v27;
        if (os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v28, OS_SIGNPOST_INTERVAL_END, spid, "FeatureAvailability - InitializeCounts", "", buf, 2u);
        }
      }
      BOOL v22 = 0;
    }
    else
    {
      if (v6)
      {
        [v9 setTotalAssetForScenesCount:v17];
        [v9 setTotalCuratedAssetForScenesCount:v24];
      }
      else
      {
        [v9 setTotalAssetCount:v17];
        [v9 setTotalCuratedAssetCount:v24];
      }
      id v29 = v14;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v30 = v29;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v30, OS_SIGNPOST_INTERVAL_END, spid, "FeatureAvailability - InitializeCounts", "", buf, 2u);
        }
      }
      BOOL v22 = 1;
    }
    id v18 = v25;
    id v16 = (void *)v23;
  }

  return v22;
}

- (void)_addVersionsToProcessingSnapshot:(id)a3
{
  versionProvider = self->_versionProvider;
  id v4 = a3;
  objc_msgSend(v4, "setMediaAnalysisImageVersion:", (int)-[PLMediaProcessingAlgorithmVersionProvider mediaAnalysisImageVersion](versionProvider, "mediaAnalysisImageVersion"));
  [v4 setHasConsistentMediaAnalysisImageVersion:1];
}

- (void)_addMediaAnalysisIndexingToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __110__PLFeatureAvailabilityComputer__addMediaAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v13[3] = &unk_1E5870730;
  id v11 = v10;
  id v15 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = v8;
  id v14 = v12;
  [(PLFeatureAvailabilityComputer *)self _fetchSpotlightSearchIndexingStatusForTaskID:1 photoLibrary:v9 completionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __110__PLFeatureAvailabilityComputer__addMediaAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(id *a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = +[PLConcurrencyLimiter sharedLimiter];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __110__PLFeatureAvailabilityComputer__addMediaAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5870708;
  char v17 = a2;
  id v11 = v9;
  id v13 = v11;
  id v15 = a1[5];
  objc_copyWeak(v16, a1 + 6);
  id v14 = a1[4];
  v16[1] = a3;
  v16[2] = a4;
  [v10 sync:v12 identifyingBlock:0 library:0];

  objc_destroyWeak(v16);
}

void __110__PLFeatureAvailabilityComputer__addMediaAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 80))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 64);
      uint64_t v6 = *(void *)(a1 + 72);
      id v16 = 0;
      int v7 = [WeakRetained _addSpotlightSearchIndexingStatusToProcessingSnapshot:v4 forTaskID:1 completedCount:v5 totalCount:v6 error:&v16];
      id v8 = v16;
      id v9 = PLBackendGetLog();
      id v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          id v18 = "-[PLFeatureAvailabilityComputer _addMediaAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHan"
                "dler:]_block_invoke";
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "FeatureAvailability - %s - finished all processing steps, will signal complete with populated processing snapshot", buf, 0xCu);
        }

        uint64_t v11 = [MEMORY[0x1E4F8B9B8] successWithResult:*(void *)(a1 + 40)];
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v18 = "-[PLFeatureAvailabilityComputer _addMediaAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHan"
                "dler:]_block_invoke";
          __int16 v19 = 2112;
          id v20 = v8;
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
        }

        uint64_t v11 = [MEMORY[0x1E4F8B9B8] failureWithError:v8];
      }
      id v15 = (void *)v11;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addMediaAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
    }
  }
  else
  {
    id v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v18 = "-[PLFeatureAvailabilityComputer _addMediaAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHandler"
            ":]_block_invoke_2";
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
    }

    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v3 = [MEMORY[0x1E4F8B9B8] failureWithError:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v3);
  }
}

- (void)_addSceneAnalysisIndexingToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __110__PLFeatureAvailabilityComputer__addSceneAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E58706E0;
  id v11 = v10;
  id v17 = v11;
  objc_copyWeak(&v18, &location);
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [(PLFeatureAvailabilityComputer *)self _fetchSpotlightSearchIndexingStatusForTaskID:2 photoLibrary:v13 completionHandler:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __110__PLFeatureAvailabilityComputer__addSceneAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(id *a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = +[PLConcurrencyLimiter sharedLimiter];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __110__PLFeatureAvailabilityComputer__addSceneAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2;
  v12[3] = &unk_1E58706B8;
  char v18 = a2;
  id v11 = v9;
  id v13 = v11;
  id v16 = a1[6];
  objc_copyWeak(v17, a1 + 7);
  id v14 = a1[4];
  v17[1] = a3;
  v17[2] = a4;
  id v15 = a1[5];
  [v10 sync:v12 identifyingBlock:0 library:0];

  objc_destroyWeak(v17);
}

void __110__PLFeatureAvailabilityComputer__addSceneAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 88))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 72);
      uint64_t v6 = *(void *)(a1 + 80);
      id v15 = 0;
      int v7 = [WeakRetained _addSpotlightSearchIndexingStatusToProcessingSnapshot:v4 forTaskID:2 completedCount:v5 totalCount:v6 error:&v15];
      id v8 = v15;
      if (v7)
      {
        [v3 _addMediaAnalysisIndexingToProcessingSnapshot:*(void *)(a1 + 40) photoLibrary:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
      }
      else
      {
        id v12 = PLBackendGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v17 = "-[PLFeatureAvailabilityComputer _addSceneAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHan"
                "dler:]_block_invoke";
          __int16 v18 = 2112;
          id v19 = v8;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
        }

        uint64_t v13 = *(void *)(a1 + 56);
        id v14 = [MEMORY[0x1E4F8B9B8] failureWithError:v8];
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
      }
    }
    else
    {
      PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addSceneAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 56));
    }
  }
  else
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v17 = "-[PLFeatureAvailabilityComputer _addSceneAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHandler"
            ":]_block_invoke_2";
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
    }

    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v3 = [MEMORY[0x1E4F8B9B8] failureWithError:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v3);
  }
}

- (void)_addPhotosKnowledgeGraphAvailabilityToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  PLPhotosSearchGetLog();
  uint64_t v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  uint64_t v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FeatureAvailability - PhotosKnowledgeGraph", "", (uint8_t *)buf, 2u);
  }

  id v15 = PLBackendGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "FeatureAvailability - adding knowledge graph status to processing snapshot", (uint8_t *)buf, 2u);
  }

  id v16 = [PLPhotoAnalysisMomentGraphService alloc];
  id v17 = [v9 photoAnalysisClient];
  __int16 v18 = [(PLPhotoAnalysisMomentGraphService *)v16 initWithServiceProvider:v17];

  if (v18)
  {
    objc_initWeak(buf, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3254779904;
    v23[2] = __121__PLFeatureAvailabilityComputer__addPhotosKnowledgeGraphAvailabilityToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
    v23[3] = &unk_1EEB2D4C0;
    objc_copyWeak(&v27, buf);
    id v26 = v10;
    double v28 = v14;
    os_signpost_id_t v29 = v12;
    id v24 = v8;
    id v25 = v9;
    [(PLPhotoAnalysisMomentGraphService *)v18 requestGraphIsAvailableWithReply:v23];

    objc_destroyWeak(&v27);
    objc_destroyWeak(buf);
  }
  else
  {
    id v19 = (void *)PLErrorCreate();
    uint64_t v20 = v14;
    uint64_t v21 = v20;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_INTERVAL_END, v12, "FeatureAvailability - PhotosKnowledgeGraph", "", (uint8_t *)buf, 2u);
    }

    BOOL v22 = [MEMORY[0x1E4F8B9B8] failureWithError:v19];
    (*((void (**)(id, void *))v10 + 2))(v10, v22);
  }
}

void __121__PLFeatureAvailabilityComputer__addPhotosKnowledgeGraphAvailabilityToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = +[PLConcurrencyLimiter sharedLimiter];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3254779904;
  v12[2] = __121__PLFeatureAvailabilityComputer__addPhotosKnowledgeGraphAvailabilityToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2;
  v12[3] = &unk_1EEB2D488;
  objc_copyWeak(&v18, (id *)(a1 + 56));
  id v17 = *(id *)(a1 + 48);
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  id v10 = *(id *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  id v19 = v10;
  uint64_t v20 = v11;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  [v7 async:v12 identifyingBlock:0 library:0];

  objc_destroyWeak(&v18);
}

void __121__PLFeatureAvailabilityComputer__addPhotosKnowledgeGraphAvailabilityToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 48), "setPhotosKnowledgeGraphIsReady:", objc_msgSend(v3, "BOOLValue"));
      uint64_t v4 = *(id *)(a1 + 80);
      id v5 = v4;
      os_signpost_id_t v6 = *(void *)(a1 + 88);
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "FeatureAvailability - PhotosKnowledgeGraph", "", (uint8_t *)&v14, 2u);
      }

      [WeakRetained _addSceneAnalysisIndexingToProcessingSnapshot:*(void *)(a1 + 48) photoLibrary:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
    }
    else
    {
      int v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        int v14 = 136315394;
        id v15 = "-[PLFeatureAvailabilityComputer _addPhotosKnowledgeGraphAvailabilityToProcessingSnapshot:photoLibrary:comp"
              "letionHandler:]_block_invoke_2";
        __int16 v16 = 2112;
        uint64_t v17 = v8;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", (uint8_t *)&v14, 0x16u);
      }

      id v9 = *(id *)(a1 + 80);
      id v10 = v9;
      os_signpost_id_t v11 = *(void *)(a1 + 88);
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        LOWORD(v14) = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FeatureAvailability - PhotosKnowledgeGraph", "", (uint8_t *)&v14, 2u);
      }

      uint64_t v12 = *(void *)(a1 + 64);
      id v13 = [MEMORY[0x1E4F8B9B8] failureWithError:*(void *)(a1 + 40)];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addPhotosKnowledgeGraphAvailabilityToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke_2", *(void **)(a1 + 64));
  }
}

- (void)_addVUIndexFullClusterStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  PLPhotosSearchGetLog();
  os_signpost_id_t v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = v11;
  int v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FeatureAvailability - VUIndexFullClusterStatus", "", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  v19[2] = __113__PLFeatureAvailabilityComputer__addVUIndexFullClusterStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v19[3] = &unk_1EEB2D450;
  objc_copyWeak(&v23, buf);
  id v15 = v10;
  id v22 = v15;
  id v16 = v8;
  id v20 = v16;
  id v17 = v9;
  id v21 = v17;
  id v24 = v14;
  os_signpost_id_t v25 = v12;
  uint64_t v18 = v14;
  [(PLFeatureAvailabilityComputer *)self _updateVUClusterStateInProcessingSnapshot:v16 photoLibrary:v17 completionHandler:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak(buf);
}

void __113__PLFeatureAvailabilityComputer__addVUIndexFullClusterStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      [WeakRetained _addPhotosKnowledgeGraphAvailabilityToProcessingSnapshot:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F8B9B8] failureWithError:v5];
      id v9 = *(id *)(a1 + 64);
      id v10 = v9;
      os_signpost_id_t v11 = *(void *)(a1 + 72);
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FeatureAvailability - VUIndexFullClusterStatus", "", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addVUIndexFullClusterStatusToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }
  os_signpost_id_t v12 = *(id *)(a1 + 64);
  id v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 72);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)id v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "FeatureAvailability - VUIndexFullClusterStatus", "", v15, 2u);
  }
}

- (void)_addSceneAnalysisToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__PLFeatureAvailabilityComputer__addSceneAnalysisToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E5870668;
  objc_copyWeak(&v18, &location);
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v13 performBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __102__PLFeatureAvailabilityComputer__addSceneAnalysisToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) managedObjectContext];
    id v9 = 0;
    int v5 = [WeakRetained _addAnalysisStatusForMediaTaskID:2 toProcessingSnapshot:v3 managedObjectContext:v4 error:&v9];
    id v6 = v9;

    if (v5)
    {
      [WeakRetained _addVUIndexFullClusterStatusToProcessingSnapshot:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
    else
    {
      int v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "-[PLFeatureAvailabilityComputer _addSceneAnalysisToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke";
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      id v8 = [MEMORY[0x1E4F8B9B8] failureWithError:v6];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addSceneAnalysisToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }
}

- (void)_addHighlightStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__PLFeatureAvailabilityComputer__addHighlightStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E5870668;
  objc_copyWeak(&v18, &location);
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v13 performBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __104__PLFeatureAvailabilityComputer__addHighlightStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) managedObjectContext];
    id v9 = 0;
    int v5 = [WeakRetained _addHighlightStatusToProcessingSnapshot:v3 managedObjectContext:v4 error:&v9];
    id v6 = v9;

    if (v5)
    {
      [WeakRetained _addSceneAnalysisToProcessingSnapshot:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
    else
    {
      int v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "-[PLFeatureAvailabilityComputer _addHighlightStatusToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke";
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      id v8 = [MEMORY[0x1E4F8B9B8] failureWithError:v6];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addHighlightStatusToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }
}

- (void)_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __126__PLFeatureAvailabilityComputer__addVisualUnderstandingClusterIndexStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E5870690;
  objc_copyWeak(&v18, &location);
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [(PLFeatureAvailabilityComputer *)self _onDemand_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:v12 photoLibrary:v13 completionHandler:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __126__PLFeatureAvailabilityComputer__addVisualUnderstandingClusterIndexStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      [WeakRetained _addHighlightStatusToProcessingSnapshot:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
    else
    {
      id v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315394;
        id v11 = "-[PLFeatureAvailabilityComputer _addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:photoLibrary"
              ":completionHandler:]_block_invoke";
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", (uint8_t *)&v10, 0x16u);
      }

      id v9 = [MEMORY[0x1E4F8B9B8] failureWithError:v5];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }
}

- (void)_addEmbeddingIndexingToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__PLFeatureAvailabilityComputer__addEmbeddingIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E5870668;
  objc_copyWeak(&v18, &location);
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v13 performBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __106__PLFeatureAvailabilityComputer__addEmbeddingIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) managedObjectContext];
    id v9 = 0;
    int v5 = [WeakRetained _addEmbeddingVectorIndexingStatusToProcessingSnapshot:v3 managedObjectContext:v4 error:&v9];
    id v6 = v9;

    if (v5)
    {
      [WeakRetained _addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
    else
    {
      int v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "-[PLFeatureAvailabilityComputer _addEmbeddingIndexingToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke";
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      id v8 = [MEMORY[0x1E4F8B9B8] failureWithError:v6];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addEmbeddingIndexingToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }
}

- (void)_addCaptioningToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__PLFeatureAvailabilityComputer__addCaptioningToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E5870668;
  objc_copyWeak(&v18, &location);
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v13 performBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __99__PLFeatureAvailabilityComputer__addCaptioningToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) managedObjectContext];
    id v9 = 0;
    int v5 = [WeakRetained _addCaptioningStatusToProcessingSnapshot:v3 managedObjectContext:v4 error:&v9];
    id v6 = v9;

    if (v5)
    {
      [WeakRetained _addEmbeddingIndexingToProcessingSnapshot:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
    else
    {
      int v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "-[PLFeatureAvailabilityComputer _addCaptioningToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke";
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      id v8 = [MEMORY[0x1E4F8B9B8] failureWithError:v6];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addCaptioningToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }
}

- (void)_addAssetForSceneCountsToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __108__PLFeatureAvailabilityComputer__addAssetForSceneCountsToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E5870668;
  objc_copyWeak(&v18, &location);
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v13 performBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __108__PLFeatureAvailabilityComputer__addAssetForSceneCountsToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) managedObjectContext];
    id v9 = 0;
    int v5 = [WeakRetained _addAssetCountsToProcessingSnapshot:v3 managedObjectContext:v4 forSceneAnalysis:1 error:&v9];
    id v6 = v9;

    if (v5)
    {
      [WeakRetained _addCaptioningToProcessingSnapshot:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
    else
    {
      int v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "-[PLFeatureAvailabilityComputer _addAssetForSceneCountsToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke";
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      id v8 = [MEMORY[0x1E4F8B9B8] failureWithError:v6];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addAssetForSceneCountsToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }
}

- (void)_addAssetCountsToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__PLFeatureAvailabilityComputer__addAssetCountsToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E5870668;
  objc_copyWeak(&v18, &location);
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v15 = v12;
  id v13 = v9;
  id v16 = v13;
  [v13 performBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __100__PLFeatureAvailabilityComputer__addAssetCountsToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) managedObjectContext];
    id v9 = 0;
    int v5 = [WeakRetained _addAssetCountsToProcessingSnapshot:v3 managedObjectContext:v4 forSceneAnalysis:0 error:&v9];
    id v6 = v9;

    if (v5)
    {
      [WeakRetained _addAssetForSceneCountsToProcessingSnapshot:*(void *)(a1 + 32) photoLibrary:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
    }
    else
    {
      int v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v11 = "-[PLFeatureAvailabilityComputer _addAssetCountsToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke";
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      id v8 = [MEMORY[0x1E4F8B9B8] failureWithError:v6];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _addAssetCountsToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }
}

- (BOOL)failAvailabilityForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  PLPhotosSearchGetLog();
  int v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FeatureAvailability - FailAvailability", "", buf, 2u);
  }

  *(void *)buf = 0;
  id v27 = buf;
  uint64_t v28 = 0x3032000000;
  os_signpost_id_t v29 = __Block_byref_object_copy__85960;
  v30 = __Block_byref_object_dispose__85961;
  id v31 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  id v11 = +[PLConcurrencyLimiter sharedLimiter];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__PLFeatureAvailabilityComputer_failAvailabilityForPhotoLibrary_error___block_invoke;
  v18[3] = &unk_1E5874900;
  id v20 = &v22;
  v18[4] = self;
  id v12 = v6;
  id v19 = v12;
  id v21 = buf;
  [v11 sync:v18 identifyingBlock:0 library:0];

  if (a4) {
    *a4 = *((id *)v27 + 5);
  }
  id v13 = v10;
  uint64_t v14 = v13;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)id v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v8, "FeatureAvailability - FailAvailability", "", v17, 2u);
  }

  char v15 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  return v15;
}

void __71__PLFeatureAvailabilityComputer_failAvailabilityForPhotoLibrary_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id obj = 0;
  char v4 = [v2 _failAvailabilityForPhotoLibrary:v3 error:&obj];
  id v5 = obj;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
}

- (BOOL)clearAvailabilityStateForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  PLPhotosSearchGetLog();
  int v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FeatureAvailability - ClearAvailability", "", buf, 2u);
  }

  *(void *)buf = 0;
  id v27 = buf;
  uint64_t v28 = 0x3032000000;
  os_signpost_id_t v29 = __Block_byref_object_copy__85960;
  v30 = __Block_byref_object_dispose__85961;
  id v31 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  id v11 = +[PLConcurrencyLimiter sharedLimiter];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__PLFeatureAvailabilityComputer_clearAvailabilityStateForPhotoLibrary_error___block_invoke;
  v18[3] = &unk_1E5874900;
  id v20 = &v22;
  v18[4] = self;
  id v12 = v6;
  id v19 = v12;
  id v21 = buf;
  [v11 sync:v18 identifyingBlock:0 library:0];

  if (a4) {
    *a4 = *((id *)v27 + 5);
  }
  id v13 = v10;
  uint64_t v14 = v13;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)id v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v8, "FeatureAvailability - ClearAvailability", "", v17, 2u);
  }

  char v15 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  return v15;
}

void __77__PLFeatureAvailabilityComputer_clearAvailabilityStateForPhotoLibrary_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id obj = 0;
  char v4 = [v2 _clearAvailabilityForPhotoLibrary:v3 error:&obj];
  id v5 = obj;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
}

- (void)computeAvailabilityForPhotoLibrary:(id)a3 shouldPersist:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  PLPhotosSearchGetLog();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = v10;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FeatureAvailability - ComputeAndPersistAvailability", "", (uint8_t *)buf, 2u);
  }

  uint64_t v14 = PLBackendGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "FeatureAvailability - computing feature availability", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3254779904;
  v18[2] = __100__PLFeatureAvailabilityComputer_computeAvailabilityForPhotoLibrary_shouldPersist_completionHandler___block_invoke;
  v18[3] = &unk_1EEB293A0;
  id v15 = v9;
  id v20 = v15;
  id v16 = v13;
  uint64_t v22 = v16;
  os_signpost_id_t v23 = v11;
  objc_copyWeak(&v21, buf);
  id v17 = v8;
  id v19 = v17;
  BOOL v24 = a4;
  [(PLFeatureAvailabilityComputer *)self computeSnapshotForPhotoLibrary:v17 completionHandler:v18];

  objc_destroyWeak(&v21);
  objc_destroyWeak(buf);
}

void __100__PLFeatureAvailabilityComputer_computeAvailabilityForPhotoLibrary_shouldPersist_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isFailure])
  {
    char v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [v3 error];
      *(_DWORD *)buf = 136315394;
      os_signpost_id_t v23 = "-[PLFeatureAvailabilityComputer computeAvailabilityForPhotoLibrary:shouldPersist:completionHandler:]_block_invoke";
      __int16 v24 = 2112;
      char v25 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
    }
    id v6 = (void *)MEMORY[0x1E4F8B9B8];
    int v7 = [v3 error];
    id v8 = [v6 failureWithError:v7];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v9 = *(id *)(a1 + 56);
    id v10 = v9;
    os_signpost_id_t v11 = *(void *)(a1 + 64);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FeatureAvailability - ComputeAndPersistAvailability", "", buf, 2u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v13 = [v3 result];
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(unsigned __int8 *)(a1 + 72);
    id v21 = 0;
    id v10 = [WeakRetained _computeAvailabilityForSnapshot:v13 photoLibrary:v14 shouldPersist:v15 error:&v21];
    id v8 = v21;

    if (v10) {
      [MEMORY[0x1E4F8B9B8] successWithResult:v10];
    }
    else {
    id v16 = [MEMORY[0x1E4F8B9B8] failureWithError:v8];
    }
    id v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "FeatureAvailability - finished computing feature availability", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v18 = *(id *)(a1 + 56);
    id v19 = v18;
    os_signpost_id_t v20 = *(void *)(a1 + 64);
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "FeatureAvailability - ComputeAndPersistAvailability", "", buf, 2u);
    }
  }
}

- (void)computeSnapshotForPhotoLibrary:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  PLPhotosSearchGetLog();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = v8;
  os_signpost_id_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FeatureAvailability - TotalSnapshotCompute", "", buf, 2u);
  }

  id v12 = objc_alloc_init(PLFeatureProcessingSnapshot);
  id v13 = PLBackendGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "FeatureAvailability - computing processing snapshot", buf, 2u);
  }

  [(PLFeatureAvailabilityComputer *)self _addVersionsToProcessingSnapshot:v12];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  v16[2] = __82__PLFeatureAvailabilityComputer_computeSnapshotForPhotoLibrary_completionHandler___block_invoke;
  id v16[3] = &unk_1EEB29330;
  id v14 = v7;
  id v17 = v14;
  uint64_t v15 = v11;
  id v18 = v15;
  os_signpost_id_t v19 = v9;
  [(PLFeatureAvailabilityComputer *)self _addAssetCountsToProcessingSnapshot:v12 photoLibrary:v6 completionHandler:v16];
}

void __82__PLFeatureAvailabilityComputer_computeSnapshotForPhotoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSuccess])
  {
    char v4 = [MEMORY[0x1E4F1C9C8] date];
    id v5 = [v3 result];
    [v5 setDateComputed:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "FeatureAvailability - finished computed processing snapshot", buf, 2u);
  }

  id v7 = *(id *)(a1 + 40);
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_END, v9, "FeatureAvailability - TotalSnapshotCompute", "", v10, 2u);
  }
}

- (PLFeatureAvailabilityComputer)initWithTransitionDelegate:(id)a3 progressDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLFeatureAvailabilityComputer;
  id v8 = [(PLFeatureAvailabilityComputer *)&v14 init];
  os_signpost_id_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_transitionDelegate, v6);
    objc_storeWeak((id *)&v9->_progressDelegate, v7);
    uint64_t v10 = +[PLFeatureProcessingAlgorithmVersionProvider provider];
    versionProvider = v9->_versionProvider;
    v9->_versionProvider = (PLMediaProcessingAlgorithmVersionProvider *)v10;

    id v12 = v9;
  }

  return v9;
}

+ (id)_predicateForEnrichedHighlights
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28BA0];
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"enrichmentState", 4);
  v8[0] = v3;
  char v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %K", @"enrichmentVersion", @"highlightVersion");
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v6 = [v2 andPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)_savedAssetTypePredicateForSceneAnalysis:(BOOL)a3
{
  uint64_t v3 = [MEMORY[0x1E4F8BA10] maskForFeatureAvailabilityForSceneAnalysis:a3];
  char v4 = (void *)MEMORY[0x1E4F8BA10];
  return (id)[v4 predicateForIncludeMask:v3 useIndex:1];
}

+ (id)_predicatesForVisibleAssets
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = +[PLManagedAsset predicateToExcludeHiddenAssets];
  if (v3) {
    [v2 addObject:v3];
  }
  char v4 = +[PLManagedAsset predicateToExcludeTrashedAssets];

  if (v4) {
    [v2 addObject:v4];
  }
  id v5 = +[PLManagedAsset predicateToExcludeNonvisibleBurstAssets];

  if (v5) {
    [v2 addObject:v5];
  }

  return v2;
}

+ (id)_predicateForAllAssetsAllowedForProcessingForSceneAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = +[PLManagedAsset predicateToIncludeOnlyAllowedForAnalysisAssets];
  if (v5) {
    [v4 addObject:v5];
  }
  id v6 = [(id)objc_opt_class() _predicatesForVisibleAssets];
  [v4 addObjectsFromArray:v6];

  id v7 = [(id)objc_opt_class() _savedAssetTypePredicateForSceneAnalysis:v3];
  [v4 addObject:v7];

  if ([v4 count])
  {
    if ([v4 count] == 1) {
      [v4 firstObject];
    }
    else {
    id v8 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_predicateForAllCuratedAssetsForSceneAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = PLExtendedAssetsInHighlightPredicate();
  if (v5) {
    [v4 addObject:v5];
  }
  id v6 = +[PLManagedAsset predicateToIncludeOnlyAllowedForAnalysisAssets];

  if (v6) {
    [v4 addObject:v6];
  }
  id v7 = [(id)objc_opt_class() _predicatesForVisibleAssets];
  [v4 addObjectsFromArray:v7];

  id v8 = [(id)objc_opt_class() _savedAssetTypePredicateForSceneAnalysis:v3];
  [v4 addObject:v8];

  if ([v4 count])
  {
    if ([v4 count] == 1) {
      [v4 firstObject];
    }
    else {
    os_signpost_id_t v9 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
    }
  }
  else
  {
    os_signpost_id_t v9 = 0;
  }

  return v9;
}

+ (id)_predicateForCountOfProcessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 versionProvider:(id)a5
{
  return PLInternalPredicateForMediaProcessingTaskID(a3, a4, a5, 1, 0, 0.0);
}

@end