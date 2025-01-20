@interface PLDeferredPhotoFinalizer
+ (BOOL)errorIsRecoverable:(id)a3;
- (BOOL)isRenderFromMetadata:(id)a3;
- (id)_createAssetAdjustmentsForAsset:(id)a3 error:(id *)a4;
- (id)_imageConversionOptionsForAsset:(id)a3 adjustments:(id)a4 isBackgroundPriority:(BOOL)a5 reason:(id)a6;
- (id)initForUseCase:(int64_t)a3;
- (id)requestFrameDropRecoveryForAsset:(id)a3 completionHandler:(id)a4;
- (int64_t)_requestFrameDropRecoveryForAssetURL:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
- (void)_callCompletionHandlersForPhotoProxy:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_copyFrameRecoveredVideoComplementToFinalSlot:(id)a3 libraryServicesManager:(id)a4 resultURL:(id)a5 completionHandler:(id)a6;
- (void)_copyOriginalVideoComplementToDiagnosticPath:(id)a3;
- (void)_createTTRForNonRecoverableError:(id)a3 assetDescription:(id)a4 asset:(id)a5;
- (void)_prepareFinalizedAssetForSemanticDevelopment:(id)a3 finalizedPhotoData:(id)a4;
- (void)_promoteProxyAndRecoverErrors:(id)a3 libraryServicesManager:(id)a4 inError:(id)a5 completionHandler:(id)a6;
- (void)_repushOriginalVideoComplementIfNeeded:(id)a3;
- (void)_setupMediaConversionSourceCollections:(id)a3 destinationCollection:(id)a4 forAsset:(id)a5;
- (void)_transitionDeferredProcessingNeededToNextStateForAsset:(id)a3 originalHeight:(int64_t)a4 originalWidth:(int64_t)a5;
- (void)_writeDebugFileFromProxyMetadata:(id)a3 forAsset:(id)a4;
- (void)cancelOutstandingFrameDropRecoveryRequests;
- (void)deleteIntermediatesExcludingDeferredIdentifierRequestIdentifiers:(id)a3 withCompletionHandler:(id)a4;
- (void)performSemanticEnhanceForAsset:(id)a3 isBackgroundPriority:(BOOL)a4 reason:(id)a5 completionHandler:(id)a6;
- (void)processor:(id)a3 didFinishProcessingPhotoProxy:(id)a4 finalPhoto:(id)a5 error:(id)a6;
- (void)requestFinalizationOfAsset:(id)a3 isBackgroundPriority:(BOOL)a4 reason:(id)a5 completionHandler:(id)a6;
@end

@implementation PLDeferredPhotoFinalizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalizerQueueUnspecified, 0);
  objc_storeStrong((id *)&self->_finalizerQueueUI, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_finalizer, 0);
  objc_storeStrong((id *)&self->_identifierToPendingRecords, 0);
}

- (void)cancelOutstandingFrameDropRecoveryRequests
{
  id v2 = [getVCPMediaAnalysisServiceClass() sharedAnalysisService];
  [v2 cancelAllRequests];
}

- (void)_copyOriginalVideoComplementToDiagnosticPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 pathForDeferredVideoComplementFile];
  v6 = [v3 pathForOriginalVideoComplementDiagnosticFile];
  id v14 = 0;
  char v7 = [v4 copyItemAtPath:v5 toPath:v6 error:&v14];
  v8 = v14;

  if ((v7 & 1) == 0)
  {
    v9 = PLDeferredProcessingGetLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    v11 = "[FDR] Unable to copy original video complement file to diagnostic path with error: %@";
    v10 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 12;
LABEL_6:
    _os_log_impl(&dword_19B3C7000, v10, v12, v11, buf, v13);
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v3 pathForOriginalVideoComplementDiagnosticFile];
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    __int16 v17 = 2112;
    v18 = @"PLFrameDropRecoverySaveOriginalVideoComplement";
    v10 = MEMORY[0x1E4F14500];
    v11 = "[FDR] Original video complement file saved to %@ because the user default %@ is set";
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
LABEL_8:
}

- (int64_t)_requestFrameDropRecoveryForAssetURL:(id)a3 withOptions:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint32_t v13 = [getVCPMediaAnalysisServiceClass() sharedAnalysisService];
  if (objc_opt_respondsToSelector()) {
    int64_t v14 = (int)[v13 requestFRCForAssetURL:v9 withOptions:v10 progressHandler:v11 andCompletionHandler:v12];
  }
  else {
    int64_t v14 = 0;
  }

  return v14;
}

- (void)_repushOriginalVideoComplementIfNeeded:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 master];

  if (v4)
  {
    v5 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [v3 master];
      char v7 = [v3 uuid];
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2114;
      uint32_t v13 = v7;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "[FDR] Marking existing master %{public}@ for asset %{public}@ as not pushed to repush master resource to CPL", (uint8_t *)&v10, 0x16u);
    }
    v8 = [v3 master];
    [v8 setCloudLocalState:0];

    id v9 = [v3 masterResourceForCPLType:18];
    if ([v9 cloudLocalState]) {
      [v9 setCloudLocalState:0];
    }
  }
}

- (void)_copyFrameRecoveredVideoComplementToFinalSlot:(id)a3 libraryServicesManager:(id)a4 resultURL:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint32_t v13 = (void (**)(id, void))a6;
  uint64_t v14 = [v11 databaseContext];
  v15 = (void *)[v14 newShortLivedLibraryWithName:"-[PLDeferredPhotoFinalizer _copyFrameRecoveredVideoComplementToFinalSlot:libraryServicesManager:resultURL:completionHandler:]"];

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__33432;
  v29 = __Block_byref_object_dispose__33433;
  id v30 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __125__PLDeferredPhotoFinalizer__copyFrameRecoveredVideoComplementToFinalSlot_libraryServicesManager_resultURL_completionHandler___block_invoke;
  v19[3] = &unk_1E5875BD0;
  id v16 = v15;
  id v20 = v16;
  id v17 = v10;
  id v21 = v17;
  id v18 = v12;
  v23 = self;
  v24 = &v25;
  id v22 = v18;
  [v16 performTransactionAndWait:v19];
  v13[2](v13, v26[5]);

  _Block_object_dispose(&v25, 8);
}

void __125__PLDeferredPhotoFinalizer__copyFrameRecoveredVideoComplementToFinalSlot_libraryServicesManager_resultURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v31 = 0;
  v4 = [v2 existingObjectWithID:v3 error:&v31];
  id v5 = v31;

  if (v4)
  {
    v6 = (void *)MEMORY[0x1E4F8B908];
    uint64_t v7 = *(void *)(a1 + 48);
    v8 = [v4 fileURLForOriginalVideoComplement];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v9 + 40);
    LOBYTE(v6) = [v6 copyItemAtURL:v7 toURL:v8 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    if (v6)
    {
    }
    else
    {
      char v12 = [MEMORY[0x1E4F8B908] isFileExistsError:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

      if ((v12 & 1) == 0)
      {
        id v20 = PLDeferredProcessingGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v21 = [MEMORY[0x1E4F8B908] redactedDescriptionForFileURL:*(void *)(a1 + 48)];
          id v22 = [v4 uuidDescription];
          v23 = *(NSObject **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 138412802;
          v33 = v21;
          __int16 v34 = 2114;
          id v35 = v22;
          __int16 v36 = 2112;
          v37 = v23;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "[FDR] Error copying FDR video complement from path: %@, for asset: %{public}@: %@", buf, 0x20u);
        }
        uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
        id v29 = *(id *)(v24 + 40);
        char v25 = [v4 promoteProxyToFinalVideoComplementWithOutError:&v29];
        objc_storeStrong((id *)(v24 + 40), v29);
        if (v25) {
          goto LABEL_12;
        }
        uint32_t v13 = PLDeferredProcessingGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v26 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          v33 = v26;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "[FDR] Error promoting proxy to final video complement: %@", buf, 0xCu);
        }
LABEL_11:

LABEL_12:
        uint64_t v15 = *(void *)(a1 + 48);
        id v27 = 0;
        char v16 = [MEMORY[0x1E4F8B908] removeItemAtURL:v15 error:&v27];
        id v10 = v27;
        if ((v16 & 1) == 0)
        {
          id v17 = PLDeferredProcessingGetLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v18 = [MEMORY[0x1E4F8B908] redactedDescriptionForFileURL:*(void *)(a1 + 48)];
            uint64_t v19 = [v4 uuidDescription];
            *(_DWORD *)buf = 138412802;
            v33 = v18;
            __int16 v34 = 2114;
            id v35 = v19;
            __int16 v36 = 2112;
            v37 = v10;
            _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "[FDR] Error removing URL: %@ for asset: %{public}@ with error: %@", buf, 0x20u);
          }
        }
        [v4 setVideoDeferredProcessingNeeded:0];
        [*(id *)(a1 + 56) _repushOriginalVideoComplementIfNeeded:v4];
        PLSendFRCCompletedAnalytics(v4, 1, 0, *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
LABEL_17:

        goto LABEL_18;
      }
    }
    uint32_t v13 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
    if (-[NSObject BOOLForKey:](v13, "BOOLForKey:", @"PLFrameDropRecoverySaveOriginalVideoComplement"))[*(id *)(a1 + 56) _copyOriginalVideoComplementToDiagnosticPath:v4]; {
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    }
    id v28 = *(id *)(v14 + 40);
    [v4 installFinalVideoComplementAndRemoveDeferredFilesWithOutError:&v28];
    objc_storeStrong((id *)(v14 + 40), v28);
    goto LABEL_11;
  }
  if (v5)
  {
    id v10 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v33 = v11;
      __int16 v34 = 2112;
      id v35 = v5;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Existing object with id %@ no longer found with error %@", buf, 0x16u);
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (void)_promoteProxyAndRecoverErrors:(id)a3 libraryServicesManager:(id)a4 inError:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint32_t v13 = (void (**)(id, void))a6;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__33432;
  id v29 = __Block_byref_object_dispose__33433;
  id v30 = 0;
  uint64_t v14 = [v11 databaseContext];
  uint64_t v15 = (void *)[v14 newShortLivedLibraryWithName:"-[PLDeferredPhotoFinalizer _promoteProxyAndRecoverErrors:libraryServicesManager:inError:completionHandler:]"];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __107__PLDeferredPhotoFinalizer__promoteProxyAndRecoverErrors_libraryServicesManager_inError_completionHandler___block_invoke;
  v19[3] = &unk_1E5875BD0;
  id v16 = v15;
  id v20 = v16;
  id v17 = v10;
  uint64_t v24 = &v25;
  id v21 = v17;
  id v22 = self;
  id v18 = v12;
  id v23 = v18;
  [v16 performTransactionAndWait:v19];
  v13[2](v13, v26[5]);

  _Block_object_dispose(&v25, 8);
}

void __107__PLDeferredPhotoFinalizer__promoteProxyAndRecoverErrors_libraryServicesManager_inError_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v19 = 0;
  v4 = [v2 existingObjectWithID:v3 error:&v19];
  id v5 = v19;

  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v6 + 40);
    char v7 = [v4 promoteProxyToFinalVideoComplementWithOutError:&obj];
    objc_storeStrong((id *)(v6 + 40), obj);
    if ((v7 & 1) == 0)
    {
      v8 = PLDeferredProcessingGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v9;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "[FDR] Error promoting proxy to final video complement: %@", buf, 0xCu);
      }
    }
    [v4 setVideoDeferredProcessingNeeded:0];
    [*(id *)(a1 + 48) _repushOriginalVideoComplementIfNeeded:v4];
    if ([*(id *)(a1 + 56) code]
      || ([*(id *)(a1 + 56) domain],
          id v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isEqualToString:*MEMORY[0x1E4F28760]],
          v10,
          !v11))
    {
      id v12 = *(void **)(a1 + 56);
      if (v12)
      {
        uint32_t v13 = v4;
        uint64_t v14 = 0;
      }
      else
      {
        id v12 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        uint32_t v13 = v4;
        uint64_t v14 = 1;
      }
      uint64_t v15 = 0;
    }
    else
    {
      id v12 = *(void **)(a1 + 56);
      uint32_t v13 = v4;
      uint64_t v14 = 1;
      uint64_t v15 = 1;
    }
    PLSendFRCCompletedAnalytics(v13, v14, v15, v12);
  }
  else if (v5)
  {
    id v16 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Existing object with id %@ no longer found with error %@", buf, 0x16u);
    }
  }
}

- (id)requestFrameDropRecoveryForAsset:(id)a3 completionHandler:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = a4;
  id val = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  objc_initWeak(&location, self);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke;
  v42[3] = &unk_1E5875F08;
  objc_copyWeak(&v43, &location);
  [val setCancellationHandler:v42];
  uint64_t v6 = [v28 uuid];
  char v7 = [v28 uuidDescription];
  v8 = [v28 objectID];
  uint64_t v9 = [v28 photoLibrary];
  id v10 = [v9 libraryServicesManager];

  int v11 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    qos_class_self();
    id v12 = PLShortStringFromQoSClass();
    *(_DWORD *)buf = 138543618;
    v46 = v7;
    __int16 v47 = 2114;
    v48 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[FDR] Requesting frame drop recovery for asset %{public}@, QoS: %{public}@", buf, 0x16u);
  }
  objc_initWeak(&from, val);
  uint32_t v13 = PLBackendGetLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  uint64_t v15 = v13;
  id v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v6;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "requestFrameDropRecoveryForAsset", "uuid: %{public}@", buf, 0xCu);
  }

  uint64_t v17 = (void *)MEMORY[0x1E4F1CB10];
  id v18 = [v28 pathForDeferredVideoComplementFile];
  id v19 = [v17 fileURLWithPath:v18];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke_226;
  v39[3] = &unk_1E5868888;
  objc_copyWeak(&v40, &from);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke_228;
  v30[3] = &unk_1E58688B0;
  id v20 = v7;
  id v31 = v20;
  uint64_t v21 = v16;
  v32 = v21;
  os_signpost_id_t v38 = v14;
  id v22 = v6;
  id v33 = v22;
  __int16 v34 = self;
  id v23 = v8;
  id v35 = v23;
  id v24 = v10;
  id v36 = v24;
  id v25 = v27;
  id v37 = v25;
  [(PLDeferredPhotoFinalizer *)self _requestFrameDropRecoveryForAssetURL:v19 withOptions:0 progressHandler:v39 andCompletionHandler:v30];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);

  return val;
}

void __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancelOutstandingFrameDropRecoveryRequests];
}

void __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke_226(uint64_t a1, double a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (uint64_t)a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setCompletedUnitCount:v3];

  id v5 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134217984;
    double v7 = a2;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "[FDR] Progress updated to %f", (uint8_t *)&v6, 0xCu);
  }
}

void __79__PLDeferredPhotoFinalizer_requestFrameDropRecoveryForAsset_completionHandler___block_invoke_228(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    qos_class_self();
    uint64_t v9 = PLShortStringFromQoSClass();
    int v16 = 138543874;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2114;
    uint64_t v21 = v9;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "[FDR] Received frame drop recovery completion handler for asset %{public}@, url %@, QoS: %{public}@", (uint8_t *)&v16, 0x20u);
  }
  id v10 = *(id *)(a1 + 40);
  int v11 = v10;
  os_signpost_id_t v12 = *(void *)(a1 + 88);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    uint64_t v13 = *(void *)(a1 + 48);
    int v16 = 138543362;
    uint64_t v17 = v13;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v12, "requestFrameDropRecoveryForAsset", "uuid: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  if (!v5 || v6)
  {
    os_signpost_id_t v14 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "[FDR] Error performing FDR for asset %{public}@, promoting proxy and bailing out: %@", (uint8_t *)&v16, 0x16u);
    }

    [*(id *)(a1 + 56) _promoteProxyAndRecoverErrors:*(void *)(a1 + 64) libraryServicesManager:*(void *)(a1 + 72) inError:v6 completionHandler:*(void *)(a1 + 80)];
  }
  else
  {
    [*(id *)(a1 + 56) _copyFrameRecoveredVideoComplementToFinalSlot:*(void *)(a1 + 64) libraryServicesManager:*(void *)(a1 + 72) resultURL:v5 completionHandler:*(void *)(a1 + 80)];
  }
}

- (void)_prepareFinalizedAssetForSemanticDevelopment:(id)a3 finalizedPhotoData:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 uuidDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v22 = v8;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "[SemDev] Transferring finalized DF asset %{public}@ to SemDev proxy slot", buf, 0xCu);
  }
  uint64_t v9 = [v5 fileURLForCurrentDeferredProcessingPreviewFile];
  [v5 setDeferredProcessingNeeded:10];
  id v10 = [v5 fileURLForCurrentDeferredProcessingPreviewFile];
  if ([v9 isEqual:v10])
  {
    int v11 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[SemDev] already transferred proxy to semdev url: :%@, skipping copy", buf, 0xCu);
    }
  }
  else
  {
    id v20 = 0;
    char v12 = [v6 writeToURL:v10 options:1073741825 error:&v20];
    int v11 = v20;
    if ((v12 & 1) == 0)
    {
      uint64_t v13 = PLDeferredProcessingGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        os_signpost_id_t v14 = [v5 fileURLForCurrentDeferredProcessingPreviewFile];
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = v14;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "[SemDev] Error copying finalized photo data to semdev url %@, error: %@", buf, 0x16u);
      }
    }
    uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v19 = 0;
    char v16 = [v15 removeItemAtURL:v9 error:&v19];
    uint64_t v17 = v19;

    if ((v16 & 1) == 0)
    {
      __int16 v18 = PLDeferredProcessingGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = v9;
        __int16 v23 = 2112;
        id v24 = v17;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "[SemDev] Error removing proxy photo url: %@, error: %@", buf, 0x16u);
      }
    }
  }
}

- (void)_setupMediaConversionSourceCollections:(id)a3 destinationCollection:(id)a4 forAsset:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v8 fileURLForCurrentDeferredProcessingPreviewFile];
  uint64_t v11 = *MEMORY[0x1E4F74910];
  [v7 setResourceURL:v10 forRole:*MEMORY[0x1E4F74910] deleteOnDeallocation:0];

  char v12 = [v8 pathManager];
  uint64_t v13 = [v8 mainFileURL];

  os_signpost_id_t v14 = [v13 pathExtension];
  uint64_t v15 = [v12 temporaryRenderContentURLForInternalRendersWithExtension:v14];

  [v9 setResourceURL:v15 forRole:v11 deleteOnDeallocation:1];
  char v16 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v7 resourceURLForRole:v11];
    int v18 = 138412546;
    id v19 = v17;
    __int16 v20 = 2112;
    uint64_t v21 = v15;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "[SemDev] Main source URL: %@, destination URL: %@", (uint8_t *)&v18, 0x16u);
  }
}

- (id)_imageConversionOptionsForAsset:(id)a3 adjustments:(id)a4 isBackgroundPriority:(BOOL)a5 reason:(id)a6
{
  BOOL v6 = a5;
  v26[3] = *MEMORY[0x1E4F143B8];
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v9 dictionary];
  v25[0] = *MEMORY[0x1E4F74920];
  os_signpost_id_t v14 = [v11 adjustmentData];
  v26[0] = v14;
  v25[1] = *MEMORY[0x1E4F74928];
  uint64_t v15 = [v11 adjustmentFormatIdentifier];
  v26[1] = v15;
  v25[2] = *MEMORY[0x1E4F74930];
  char v16 = [v11 adjustmentFormatVersion];

  v26[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  [v13 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F74978]];

  int v18 = [MEMORY[0x1E4F748B8] standardPolicy];
  [v13 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F749F0]];

  [v13 setObject:&unk_1EEBEE370 forKeyedSubscript:*MEMORY[0x1E4F74A30]];
  [v13 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F74988]];
  id v19 = NSString;
  __int16 v20 = [v12 uuidDescription];

  uint64_t v21 = [v19 stringWithFormat:@"%@ for asset %@", v10, v20];

  [v13 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F74A20]];
  if (v6) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = 4;
  }
  __int16 v23 = [NSNumber numberWithInteger:v22];
  [v13 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F749D8]];

  [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F749A8]];
  return v13;
}

- (id)_createAssetAdjustmentsForAsset:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (void *)MEMORY[0x1E4F1C9B8];
  id v7 = [v5 pathForCameraMetadataFile];
  id v8 = [v6 dataWithContentsOfFile:v7];

  id v9 = (void *)MEMORY[0x1E4F28DC0];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  id v21 = 0;
  uint64_t v13 = [v9 unarchivedObjectOfClasses:v12 fromData:v8 error:&v21];
  id v14 = v21;

  if (v13)
  {
    uint64_t v15 = +[PLPhotoEditExportProperties exportPropertiesWithImageWidth:imageHeight:exifOrientation:](PLPhotoEditExportProperties, "exportPropertiesWithImageWidth:imageHeight:exifOrientation:", [v5 originalWidth], objc_msgSend(v5, "originalHeight"), (int)objc_msgSend(v5, "orientation"));
    id v16 = +[PLCompositionHelper newIdentityCompositionController];
    +[PLCompositionHelper compositionController:v16 updateSemanticEnhanceFromCameraMetadata:v13 exportProperties:v15];
    uint64_t v17 = +[PLImageWriter assetAdjustmentsFromCompositionController:v16 exportProperties:v15];
  }
  else
  {
    int v18 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v5 pathForCameraMetadataFile];
      *(_DWORD *)buf = 138412546;
      __int16 v23 = v19;
      __int16 v24 = 2112;
      id v25 = v14;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "[SemDev] Error deserializing camera metadata from path: %@, error: %@", buf, 0x16u);
    }
    uint64_t v17 = 0;
    if (a4) {
      *a4 = v14;
    }
  }

  return v17;
}

- (void)performSemanticEnhanceForAsset:(id)a3 isBackgroundPriority:(BOOL)a4 reason:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  v61[2] = *(id *)MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v39 = a6;
  id v12 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v10 uuidDescription];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "[SemDev] performing semantic enhance for asset %{public}@", (uint8_t *)&buf, 0xCu);
  }
  id v14 = PLBackendGetLog();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);
  id v16 = v14;
  uint64_t v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v18 = [v10 uuid];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v18;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "performSemanticEnhanceForAsset", "uuid: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  os_signpost_id_t v38 = v17;

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__33432;
  v60 = __Block_byref_object_dispose__33433;
  v61[0] = 0;
  id obj = 0;
  id v40 = [(PLDeferredPhotoFinalizer *)self _createAssetAdjustmentsForAsset:v10 error:&obj];
  objc_storeStrong(v61, obj);
  if (v40)
  {
    uint64_t v19 = [(PLDeferredPhotoFinalizer *)self _imageConversionOptionsForAsset:v10 adjustments:v40 isBackgroundPriority:v8 reason:v11];
    __int16 v20 = objc_opt_new();
    id v21 = objc_opt_new();
    [(PLDeferredPhotoFinalizer *)self _setupMediaConversionSourceCollections:v20 destinationCollection:v21 forAsset:v10];
    uint64_t v22 = [v10 objectID];
    id v37 = (void *)v19;
    __int16 v23 = [v10 photoLibrary];
    __int16 v24 = [v23 libraryServicesManager];

    id v25 = v11;
    uint64_t v26 = [v21 resourceURLForRole:*MEMORY[0x1E4F74910]];
    imageConversionServiceClient = self->_imageConversionServiceClient;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_2;
    v41[3] = &unk_1E5868860;
    v42 = v38;
    os_signpost_id_t v48 = v15;
    id v28 = v24;
    id v43 = v28;
    id v29 = v22;
    id v44 = v29;
    id v30 = v26;
    id v45 = v30;
    id v46 = v10;
    id v47 = v39;
    [(PAImageConversionServiceClient *)imageConversionServiceClient convertImageAtSourceURLCollection:v20 toDestinationURLCollection:v21 options:v37 completionHandler:v41];

    id v11 = v25;
    id v31 = v37;
  }
  else
  {
    v32 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = v11;
      uint64_t v34 = *(void *)(*((void *)&buf + 1) + 40);
      id v35 = [v10 uuidDescription];
      *(_DWORD *)v53 = 138412546;
      uint64_t v54 = v34;
      __int16 v55 = 2114;
      v56 = v35;
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "[SemDev] adjustments are nil: %@ for asset uuid: %{public}@ ", v53, 0x16u);

      id v11 = v33;
    }

    id v36 = [v10 photoLibrary];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke;
    v49[3] = &unk_1E5875E68;
    id v50 = v10;
    p_long long buf = &buf;
    [v36 performBlockAndWait:v49];

    (*((void (**)(id, void))v39 + 2))(v39, *(void *)(*((void *)&buf + 1) + 40));
    id v31 = v50;
  }

  _Block_object_dispose(&buf, 8);
}

void __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = 0;
  char v3 = [v2 promoteSemanticEnhancePreviewToFinalImage:&v6];
  id v4 = v6;
  id v5 = v6;
  if ((v3 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  }
}

void __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__33432;
  id v35 = __Block_byref_object_dispose__33433;
  id v36 = 0;
  id v9 = *(id *)(a1 + 32);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 80);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v11, "performSemanticEnhanceForAsset", "", buf, 2u);
  }

  id v12 = [*(id *)(a1 + 40) databaseContext];
  uint64_t v13 = (void *)[v12 newShortLivedLibraryWithName:"-[PLDeferredPhotoFinalizer performSemanticEnhanceForAsset:isBackgroundPriority:reason:completionHandler:]_block_invoke"];

  if (a2 == 1)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_2_206;
    v27[3] = &unk_1E5875368;
    id v28 = v13;
    id v29 = *(id *)(a1 + 48);
    v30[0] = *(id *)(a1 + 56);
    v30[1] = &v31;
    [v28 performTransactionAndWait:v27];
    id v14 = &v28;
    os_signpost_id_t v15 = &v29;
    id v16 = (id *)v30;
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_210;
    v23[3] = &unk_1E5875368;
    id v24 = *(id *)(a1 + 64);
    id v25 = *(id *)(a1 + 48);
    v26[1] = &v31;
    id v17 = v8;
    v26[0] = v17;
    [v13 performTransactionAndWait:v23];
    int v18 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218242;
      uint64_t v38 = a2;
      __int16 v39 = 2112;
      id v40 = v17;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "[SemDev] Media conversion did not succeed for semantic enhance, status: %ld, error: %@", buf, 0x16u);
    }

    id v14 = &v24;
    os_signpost_id_t v15 = &v25;
    id v16 = (id *)v26;
  }

  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v32[5], v19, v20, v21, v22);
  _Block_object_dispose(&v31, 8);
}

void __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_2_206(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  char v3 = [v2 existingObjectWithID:*(void *)(a1 + 40) error:0];

  id v4 = [v3 uuidDescription];
  id v5 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v38 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[SemDev] Media conversion success for semantic enhance adjustment for asset uuid: %{public}@", buf, 0xCu);
  }

  id v6 = (void *)MEMORY[0x1E4F8B908];
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [v3 mainFileURL];
  id v9 = [v3 pathManager];
  id v10 = [v9 capabilities];
  id v36 = 0;
  LOBYTE(v6) = [v6 ingestItemAtURL:v7 toURL:v8 type:3 options:2 capabilities:v10 error:&v36];
  id v11 = v36;

  uint64_t v12 = [v3 height];
  uint64_t v13 = [v3 width];
  if (v6)
  {
    uint64_t v14 = v13;
    os_signpost_id_t v15 = [v3 mainFileURL];
    id v34 = v11;
    int v16 = [v3 installFinalImageAndRemoveDeferredFilesWithFinalImageURL:v15 outError:&v34];
    id v17 = v34;

    if (v16)
    {
      [v3 cleanUpMetadataPath];
      [v3 setDeferredProcessingNeeded:0];
      int v18 = [v3 additionalAttributes];
      [v18 setDeferredProcessingCandidateOptions:0];

      [v3 transitionToDeferredProcessingNeededAdjustmentWithOriginalWidth:v14 originalHeight:v12 shouldSignalBackgroundProcessingNeeded:1 reason:@"[SemDev] Installed final image and removed deferred files"];
LABEL_22:
      id v29 = v17;
      goto LABEL_23;
    }
    int v23 = [MEMORY[0x1E4F8B908] isFileExistsError:v17];
    id v24 = PLDeferredProcessingGetLog();
    id v25 = v24;
    if (!v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v38 = v4;
        __int16 v39 = 2112;
        id v40 = v17;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "[SemDev] Failed to install image for asset: %{public}@, reason: %@", buf, 0x16u);
      }

      goto LABEL_22;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [v3 mainFileURL];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v38 = v4;
      __int16 v39 = 2112;
      id v40 = v26;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "[SemDev] Asset %{public}@ has already had file written to %@, skipping copy", buf, 0x16u);
    }
    id v27 = [v3 mainFileURL];
    id v33 = v17;
    char v28 = [v3 installFinalImageAndRemoveDeferredFilesWithFinalImageURL:v27 outError:&v33];
    id v29 = v33;

    if ((v28 & 1) == 0)
    {
      id v30 = PLDeferredProcessingGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v38 = v4;
        __int16 v39 = 2112;
        id v40 = v29;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "[SemDev] Error installing final image and removing deferred files for asset %{public}@ with error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    int v19 = [MEMORY[0x1E4F8B908] isFileExistsError:v11];
    uint64_t v20 = PLDeferredProcessingGetLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        uint64_t v22 = [v3 mainFileURL];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v38 = v22;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "[SemDev] file already exists, no need to ingest at url: %@", buf, 0xCu);
      }
      goto LABEL_25;
    }
    if (v21)
    {
      uint64_t v31 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v38 = v31;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "[SemDev] Failed to ingest %@: %@", buf, 0x16u);
    }

    id v35 = v11;
    [v3 promoteSemanticEnhancePreviewToFinalImage:&v35];
    id v29 = v35;
  }
LABEL_23:
  if (v29)
  {
    uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v20 = *(NSObject **)(v32 + 40);
    *(void *)(v32 + 40) = v29;
    id v11 = v29;
LABEL_25:
  }
}

void __105__PLDeferredPhotoFinalizer_performSemanticEnhanceForAsset_isBackgroundPriority_reason_completionHandler___block_invoke_210(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) photoLibrary];
  char v3 = [v2 managedObjectContext];
  id v4 = [v3 existingObjectWithID:*(void *)(a1 + 40) error:0];

  id v5 = [v4 uuidDescription];
  id v11 = 0;
  char v6 = [v4 promoteSemanticEnhancePreviewToFinalImage:&v11];
  id v7 = v11;
  id v8 = v11;
  if ((v6 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
  }
  id v9 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "[SemDev] Media conversion failure for asset %{public}@, promoted preview to final image, error: %@", buf, 0x16u);
  }
}

- (void)_createTTRForNonRecoverableError:(id)a3 assetDescription:(id)a4 asset:(id)a5
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (MEMORY[0x19F38BDA0]())
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28E78];
    id v11 = [v9 additionalAttributes];
    uint64_t v12 = [v11 deferredPhotoIdentifier];
    id v60 = v8;
    v59 = [v10 stringWithFormat:@"Failed during finalization in a NON-recoverable way for asset: %@ with deferredPhotoIdentifier: %@ reason: %@", v8, v12, v7];

    id v61 = v7;
    uint64_t v58 = objc_msgSend(NSString, "stringWithFormat:", @"TTR Photos: Non-recoverable deferredmediad error when processing the proxy (Error Code: %ld)", objc_msgSend(v7, "code"));
    v65 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    __int16 v14 = [v9 additionalAttributes];
    uint64_t v15 = [v14 deferredPhotoIdentifier];

    v62 = v15;
    uint64_t v16 = [v15 componentsSeparatedByString:@"/"];
    id v17 = [v16 firstObject];

    v64 = v9;
    int v18 = [v9 pathManager];
    int v19 = [v18 photoDirectoryWithType:1];

    v57 = v19;
    v63 = [v19 stringByAppendingString:@"/Deferred/CaptureContainers"];
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
    v82[0] = *MEMORY[0x1E4F1C6E8];
    BOOL v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
    uint64_t v22 = [v13 enumeratorAtURL:v20 includingPropertiesForKeys:v21 options:0 errorHandler:&__block_literal_global_33505];

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v68 objects:v81 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v69;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v69 != v26) {
            objc_enumerationMutation(v23);
          }
          char v28 = [*(id *)(*((void *)&v68 + 1) + 8 * i) path];
          id v29 = [v28 stringByAppendingPathComponent:v17];

          if ([v13 fileExistsAtPath:v29])
          {
            id v30 = [v63 stringByDeletingLastPathComponent];
            uint64_t v31 = [v30 stringByAppendingPathComponent:@"tmpCaptureContainers"];

            if (([v13 directoryExistsAtPath:v31] & 1) == 0)
            {
              id v67 = 0;
              char v32 = [v13 createDirectoryAtPath:v31 withIntermediateDirectories:0 attributes:0 error:&v67];
              id v33 = v67;
              if ((v32 & 1) == 0)
              {
                id v34 = PLBackendGetLog();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  id v35 = [v64 uuid];
                  *(_DWORD *)long long buf = 138412802;
                  v76 = v31;
                  __int16 v77 = 2112;
                  v78 = v35;
                  __int16 v79 = 2112;
                  v80 = v62;
                  _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to create temporary capture containers directory: %@ for asset with uuid: %@ and deferred identifier: %@", buf, 0x20u);
                }
              }
            }
            id v36 = [NSString stringWithFormat:@"%@-copy", v17];
            id v37 = [v31 stringByAppendingPathComponent:v36];

            uint64_t v66 = 0;
            [v13 copyItemAtPath:v29 toPath:v37 error:&v66];
            uint64_t v38 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v37];
            [v65 addObject:v38];

            goto LABEL_18;
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v68 objects:v81 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    id v9 = v64;
    __int16 v39 = [v64 pathForDiagnosticFile];
    int v40 = [v13 fileExistsAtPath:v39];

    if (v40)
    {
      uint64_t v41 = (void *)MEMORY[0x1E4F1CB10];
      v42 = [v64 pathForDiagnosticFile];
      id v43 = [v41 fileURLWithPath:v42];

      [v65 addObject:v43];
    }
    id v44 = [v64 mainFileURL];
    id v45 = [v44 path];
    int v46 = [v13 fileExistsAtPath:v45];

    if (v46)
    {
      id v47 = [v64 mainFileURL];
      [v65 addObject:v47];
    }
    os_signpost_id_t v48 = [v64 uuid];

    if (v48)
    {
      id v49 = objc_alloc_init(MEMORY[0x1E4F28C80]);
      v74[0] = @"currentAssets";
      v73[0] = @"previewStyle";
      v73[1] = @"assetLocalIdentifiers";
      v56 = [v64 uuid];
      v72 = v56;
      id v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
      v74[1] = v50;
      v73[2] = @"photoLibraryURLString";
      v51 = [v64 photoLibrary];
      v52 = [v51 pathManager];
      v53 = [v52 libraryURL];
      uint64_t v54 = [v53 absoluteString];
      v74[2] = v54;
      __int16 v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
      [v49 setUserInfo:v55];

      id v9 = v64;
    }
    else
    {
      id v49 = 0;
    }
    id v8 = v60;
    id v7 = v61;
    +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Failure occured while processing Photo" message:@"A higher-quality image couldn't be processed. File a radar with this photo and its intermediate processing files?" radarTitle:v58 radarDescription:v59 radarComponent:2 diagnosticTTRType:1 attachments:v65 extensionItem:v49];
  }
}

uint64_t __84__PLDeferredPhotoFinalizer__createTTRForNonRecoverableError_assetDescription_asset___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  char v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = [v4 path];
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate '%@': %@", (uint8_t *)&v9, 0x16u);
  }
  return 1;
}

- (void)deleteIntermediatesExcludingDeferredIdentifierRequestIdentifiers:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  finalizer = self->_finalizer;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__PLDeferredPhotoFinalizer_deleteIntermediatesExcludingDeferredIdentifierRequestIdentifiers_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E5868838;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PLCaptureDeferredPhotoProcessor *)finalizer persistentlyStoredDeferredPhotoProxiesWithCompletionHandler:v11];
}

void __115__PLDeferredPhotoFinalizer_deleteIntermediatesExcludingDeferredIdentifierRequestIdentifiers_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v4 = 138543362;
    long long v15 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "deferredPhotoIdentifier", v15);
        __int16 v11 = +[PLPhotoLibrary requestIdentifierFromDeferredIdentifier:v10];
        char v12 = [*(id *)(a1 + 32) containsObject:v11];
        uint64_t v13 = PLDeferredProcessingGetLog();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if (v12)
        {
          if (v14)
          {
            *(_DWORD *)long long buf = v15;
            uint64_t v22 = v10;
            _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "%{public}@ is still needed for later processing", buf, 0xCu);
          }
        }
        else
        {
          if (v14)
          {
            *(_DWORD *)long long buf = v15;
            uint64_t v22 = v10;
            _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "%{public}@ is not needed anymore, requesting deletion", buf, 0xCu);
          }

          [*(id *)(*(void *)(a1 + 40) + 16) deletePersistentStorageForPhotoProxy:v9];
          ++v6;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_callCompletionHandlersForPhotoProxy:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  p_identifierToPendingRecordsLock = &self->_identifierToPendingRecordsLock;
  os_unfair_lock_lock(&self->_identifierToPendingRecordsLock);
  identifierToPendingRecords = self->_identifierToPendingRecords;
  char v12 = [v8 deferredPhotoIdentifier];
  uint64_t v13 = [(NSMutableDictionary *)identifierToPendingRecords objectForKeyedSubscript:v12];

  BOOL v14 = self->_identifierToPendingRecords;
  long long v15 = [v8 deferredPhotoIdentifier];
  [(NSMutableDictionary *)v14 setObject:0 forKeyedSubscript:v15];

  os_unfair_lock_unlock(&self->_identifierToPendingRecordsLock);
  id v33 = v9;
  if (v6)
  {
    uint64_t v16 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = [v8 deferredPhotoIdentifier];
      qos_class_self();
      long long v18 = PLShortStringFromQoSClass();
      *(_DWORD *)long long buf = 138412546;
      int v40 = v17;
      __int16 v41 = 2114;
      v42 = v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "Requesting deletion of intermediates for deferredUUID: %@ QoS: %{public}@", buf, 0x16u);
    }
    [(PLCaptureDeferredPhotoProcessor *)self->_finalizer deletePersistentStorageForPhotoProxy:v8];

    long long v19 = 0;
  }
  else
  {
    long long v19 = v9;
    if (!v9)
    {
      long long v20 = [MEMORY[0x1E4F1CA60] dictionary];
      BOOL v21 = NSStringFromPLErrorCode();
      [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F28568]];

      long long v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:48001 userInfo:v20];
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v22 = v13;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = [*(id *)(*((void *)&v34 + 1) + 8 * v26) completionHandler];
        ((void (**)(void, void *))v27)[2](v27, v19);

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v24);
  }

  if (v6 && !self->_useCase)
  {
    os_unfair_lock_lock(&self->_identifierToPendingRecordsLock);
    uint64_t v28 = [(NSMutableDictionary *)self->_identifierToPendingRecords count];
    os_unfair_lock_unlock(p_identifierToPendingRecordsLock);
    if (!v28)
    {
      id v29 = [v22 firstObject];
      id v30 = [v29 lsm];
      uint64_t v31 = [v30 libraryBundle];
      char v32 = [v31 constraintsDirector];
      [v32 informAssetsFinishedDeferredProcessing];
    }
  }
}

- (void)_transitionDeferredProcessingNeededToNextStateForAsset:(id)a3 originalHeight:(int64_t)a4 originalWidth:(int64_t)a5
{
  id v10 = a3;
  char v7 = [v10 transitionToDeferredProcessingNeededAdjustmentWithOriginalWidth:a5 originalHeight:a4 shouldSignalBackgroundProcessingNeeded:0 reason:@"Deferred photo finalizer transitioned to next processing state"];
  id v8 = v10;
  if ((v7 & 1) == 0)
  {
    if ([v10 isSemanticEnhanceProcessingCandidate])
    {
      uint64_t v9 = 7;
      id v8 = v10;
    }
    else
    {
      [v10 setDeferredProcessingNeeded:0];
      uint64_t v9 = [v10 expectedDeferredProcessingNeededOnAssetCreation];
      id v8 = v10;
      if (!v9) {
        goto LABEL_6;
      }
    }
    [v8 setDeferredProcessingNeeded:v9];
    id v8 = v10;
  }
LABEL_6:
}

- (void)processor:(id)a3 didFinishProcessingPhotoProxy:(id)a4 finalPhoto:(id)a5 error:(id)a6
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v9 = a4;
  id v56 = a5;
  id obj = a6;
  id v54 = a6;
  id v60 = v9;
  uint64_t v58 = [v9 deferredPhotoIdentifier];
  id v10 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    qos_class_self();
    __int16 v11 = PLShortStringFromQoSClass();
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v58;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Received didFinishProcessing callback for identifier: %@ QoS: %{public}@", buf, 0x16u);
  }
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2020000000;
  char v118 = 0;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v125 = __Block_byref_object_copy__33432;
  v126 = __Block_byref_object_dispose__33433;
  id v127 = 0;
  v53 = [v56 fileDataRepresentation];
  uint64_t v12 = [v56 metadata];
  v52 = (void *)v12;
  if (v12) {
    BOOL v49 = [(PLDeferredPhotoFinalizer *)self isRenderFromMetadata:v12];
  }
  else {
    BOOL v49 = 0;
  }
  os_unfair_lock_t lock = &self->_identifierToPendingRecordsLock;
  os_unfair_lock_lock(&self->_identifierToPendingRecordsLock);
  identifierToPendingRecords = self->_identifierToPendingRecords;
  BOOL v14 = [v60 deferredPhotoIdentifier];
  __int16 v55 = [(NSMutableDictionary *)identifierToPendingRecords objectForKeyedSubscript:v14];

  if (v55)
  {
    v57 = [v55 firstObject];
    long long v15 = PLBackendGetLog();
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v16 = v55;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v111 objects:v123 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v112;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v112 != v18) {
            objc_enumerationMutation(v16);
          }
          long long v20 = *(void **)(*((void *)&v111 + 1) + 8 * i);
          BOOL v21 = v15;
          os_signpost_id_t v22 = [v20 signpostId];
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
          {
            *(_WORD *)v119 = 0;
            _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "requestFinalizationOfAsset", "", v119, 2u);
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v111 objects:v123 count:16];
      }
      while (v17);
    }

    os_unfair_lock_unlock(lock);
    uint64_t v23 = [v57 assetObjectID];
    uint64_t v24 = [v57 lsm];
    char v25 = [v57 expectsSecondProcessingCallback];
    uint64_t v26 = [v57 logDescription];
    [v57 startTimestamp];
    uint64_t v28 = v27;
    id v29 = [v24 databaseContext];
    id v30 = (void *)[v29 newShortLivedLibraryWithName:"-[PLDeferredPhotoFinalizer processor:didFinishProcessingPhotoProxy:finalPhoto:error:]" libraryRole:2];

    int v31 = [v57 needsSemanticDevelopment];
    *(void *)v119 = 0;
    *(void *)&v119[8] = v119;
    *(void *)&v119[16] = 0x3032000000;
    v120 = __Block_byref_object_copy__33432;
    v121 = __Block_byref_object_dispose__33433;
    id v122 = 0;
    if (v49) {
      [v57 fileURLForFullsizeRenderImage];
    }
    else {
    uint64_t v32 = [v57 mainFileURL];
    }
    long long v35 = *(void **)(*(void *)&v119[8] + 40);
    *(void *)(*(void *)&v119[8] + 40) = v32;

    long long v36 = [MEMORY[0x1E4F8B8F0] descriptionWithFileURL:*(void *)(*(void *)&v119[8] + 40)];
    uint64_t v107 = 0;
    v108 = &v107;
    uint64_t v109 = 0x2020000000;
    char v110 = 0;
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke;
    v100[3] = &unk_1E5874840;
    id v37 = v23;
    id v101 = v37;
    id v38 = v30;
    id v102 = v38;
    id v39 = v26;
    id v103 = v39;
    v105 = &v107;
    id v40 = v58;
    id v104 = v40;
    v106 = &v115;
    [v38 performBlockAndWait:v100];
    if (*((unsigned char *)v108 + 24))
    {
      [(PLDeferredPhotoFinalizer *)self _callCompletionHandlersForPhotoProxy:v60 success:*((unsigned __int8 *)v116 + 24) error:0];
LABEL_31:

      _Block_object_dispose(&v107, 8);
      _Block_object_dispose(v119, 8);

      goto LABEL_32;
    }
    if (v54)
    {
      objc_storeStrong((id *)(*(void *)&buf[8] + 40), obj);
      __int16 v41 = (id *)v95;
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_151;
      v95[3] = &unk_1E5868798;
      v95[4] = v37;
      id v42 = v38;
      v95[5] = v42;
      v95[6] = v39;
      v95[7] = self;
      id v96 = v54;
      v98 = buf;
      v99 = &v115;
      id v97 = v60;
      [v42 performTransactionAndWait:v95];
    }
    else
    {
      if (!v31)
      {
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_158;
        v75[3] = &unk_1E58687E8;
        id v76 = v37;
        id v77 = v38;
        id v78 = v39;
        v83 = v119;
        v84 = buf;
        id v79 = v53;
        v80 = self;
        BOOL v86 = v49;
        id v81 = v52;
        v85 = &v115;
        id v82 = v36;
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_161;
        v61[3] = &unk_1E5868810;
        char v73 = v25;
        BOOL v74 = v49;
        uint64_t v72 = v28;
        id v62 = v78;
        long long v70 = &v115;
        id v63 = v40;
        v64 = self;
        id v65 = v77;
        id v66 = v76;
        id v67 = 0;
        id v68 = v57;
        id v69 = v60;
        long long v71 = buf;
        [v65 performTransaction:v75 completionHandler:v61];

        id v45 = &v76;
        int v46 = &v77;
        id v47 = &v78;
        goto LABEL_30;
      }
      __int16 v41 = (id *)v87;
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_152;
      v87[3] = &unk_1E58687C0;
      v87[4] = v37;
      id v43 = v38;
      v87[5] = v43;
      v87[6] = v39;
      v87[7] = self;
      id v88 = v60;
      v93 = &v115;
      id v89 = v53;
      id v90 = v52;
      id v44 = v57;
      v94 = buf;
      id v91 = v44;
      id v92 = 0;
      [v43 performTransactionAndWait:v87];
    }
    id v45 = v41 + 4;
    int v46 = v41 + 5;
    id v47 = v41 + 6;
LABEL_30:

    goto LABEL_31;
  }
  id v33 = PLDeferredProcessingGetLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    long long v34 = [(NSMutableDictionary *)self->_identifierToPendingRecords allKeys];
    *(_DWORD *)v119 = 138543618;
    *(void *)&v119[4] = v58;
    *(_WORD *)&v119[12] = 2114;
    *(void *)&v119[14] = v34;
    _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Received finished proxy for an asset we weren't tracking. identifier:%{public}@, current list:%{public}@", v119, 0x16u);
  }
  os_unfair_lock_unlock(lock);
LABEL_32:

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v115, 8);
}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = +[PLManagedAsset assetWithObjectID:a1[4] inLibrary:a1[5]];
  uint64_t v3 = v2;
  if (!v2)
  {
    id v8 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[6];
      int v14 = 138543362;
      uint64_t v15 = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Refreshed asset %{public}@ does not exist in managed object context, bailing out", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v10 = *(void *)(a1[8] + 8);
    goto LABEL_12;
  }
  int v4 = [v2 deferredProcessingNeeded];
  uint64_t v5 = PLDeferredProcessingGetLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      uint64_t v11 = a1[6];
      uint64_t v12 = a1[7];
      qos_class_self();
      uint64_t v13 = PLShortStringFromQoSClass();
      int v14 = 138543874;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      long long v19 = v13;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Already finalized this asset, calling completion handlers with success. asset: %{public}@, deferredIdentifier: %{public}@, QoS: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
    uint64_t v10 = *(void *)(a1[8] + 8);
LABEL_12:
    *(unsigned char *)(v10 + 24) = 1;
    goto LABEL_13;
  }
  if (v6)
  {
    uint64_t v7 = a1[6];
    int v14 = 138543618;
    uint64_t v15 = v7;
    __int16 v16 = 1024;
    LODWORD(v17) = [v3 deferredProcessingNeeded];
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ with deferred processing state %hu not yet finalized", (uint8_t *)&v14, 0x12u);
  }

LABEL_13:
}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_151(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v5 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v23 = v9;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Refreshed asset %{public}@ does not exist in managed object context, bailing out", buf, 0xCu);
    }
    goto LABEL_7;
  }
  int v3 = [(id)objc_opt_class() errorIsRecoverable:*(void *)(a1 + 64)];
  int v4 = PLDeferredProcessingGetLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void **)(a1 + 64);
      qos_class_self();
      id v8 = PLShortStringFromQoSClass();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v23 = v6;
      __int16 v24 = 2112;
      char v25 = v7;
      __int16 v26 = 2114;
      uint64_t v27 = v8;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "didFinishProcessingPhotoProxy failed in a recoverable way, will try again later for asset: %{public}@, reason: %@, QoS: %{public}@", buf, 0x20u);
    }
LABEL_7:

    goto LABEL_17;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void **)(a1 + 64);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v23 = v10;
    __int16 v24 = 2112;
    char v25 = v11;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "didFinishProcessingPhotoProxy failed in a NON-recoverable way for asset: %{public}@, reason: %@", buf, 0x16u);
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
  id obj = *(id *)(v12 + 40);
  int v13 = [v2 promoteDeferredPreviewToFinalImageWithOutError:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  int v14 = PLDeferredProcessingGetLog();
  uint64_t v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      qos_class_self();
      uint64_t v17 = PLShortStringFromQoSClass();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v23 = v16;
      __int16 v24 = 2114;
      char v25 = v17;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Successfully promoted deferred preview for asset: %{public}@ QoS: %{public}@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v15 = *(NSObject **)(v18 + 40);
    *(void *)(v18 + 40) = 0;
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = *(void *)(a1 + 48);
    uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v23 = v19;
    __int16 v24 = 2112;
    char v25 = v20;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to promote deferred preview for asset: %{public}@, reason: %@", buf, 0x16u);
  }

  [*(id *)(a1 + 56) _createTTRForNonRecoverableError:*(void *)(a1 + 64) assetDescription:*(void *)(a1 + 48) asset:v2];
LABEL_17:
  [*(id *)(a1 + 56) _callCompletionHandlersForPhotoProxy:*(void *)(a1 + 72) success:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) error:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_152(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 72);
    int v4 = PLDeferredProcessingGetLog();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v26 = v6;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[SemDev] DF capture needs semantic development for asset: %@", buf, 0xCu);
      }

      [*(id *)(a1 + 56) _prepareFinalizedAssetForSemanticDevelopment:v2 finalizedPhotoData:*(void *)(a1 + 72)];
      [*(id *)(a1 + 56) _writeDebugFileFromProxyMetadata:*(void *)(a1 + 80) forAsset:v2];
      uint64_t v7 = NSString;
      id v8 = [*(id *)(a1 + 88) requestReason];
      id v9 = [v7 stringWithFormat:@"%@ (from AVCaptureDeferredPhotoProcessor didFinish)", v8];

      uint64_t v10 = *(void **)(a1 + 56);
      uint64_t v11 = [*(id *)(a1 + 88) isBackgroundPriority];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_156;
      v22[3] = &unk_1E586C2A0;
      uint64_t v12 = *(void *)(a1 + 56);
      int v13 = *(void **)(a1 + 64);
      uint64_t v24 = *(void *)(a1 + 104);
      v22[4] = v12;
      id v23 = v13;
      [v10 performSemanticEnhanceForAsset:v2 isBackgroundPriority:v11 reason:v9 completionHandler:v22];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 48);
        uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v26 = v16;
        __int16 v27 = 2112;
        id v28 = v17;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Finalized photo data representation is nil for asset: %{public}@, error: %@", buf, 0x16u);
      }

      id v21 = 0;
      int v18 = [v2 promoteDeferredPreviewToFinalImageWithOutError:&v21];
      id v9 = v21;
      if (v18)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
      }
      else
      {
        uint64_t v19 = PLDeferredProcessingGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = *(void *)(a1 + 48);
          *(_DWORD *)long long buf = 138543618;
          uint64_t v26 = v20;
          __int16 v27 = 2112;
          id v28 = v9;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to promote deferred preview for asset: %{public}@, reason %@", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 56) _createTTRForNonRecoverableError:*(void *)(a1 + 96) assetDescription:*(void *)(a1 + 48) asset:v2];
      [*(id *)(a1 + 56) _callCompletionHandlersForPhotoProxy:*(void *)(a1 + 64) success:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) error:*(void *)(a1 + 96)];
    }
  }
  else
  {
    int v14 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v26 = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Refreshed asset %{public}@ does not exist in managed object context, bailing out", buf, 0xCu);
    }

    [*(id *)(a1 + 56) _callCompletionHandlersForPhotoProxy:*(void *)(a1 + 64) success:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) error:0];
  }
}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_158(uint64_t a1)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 height];
    uint64_t v5 = [v3 width];
    if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void **)(a1 + 56);
      if (v7)
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 96) + 8);
        id obj = *(id *)(v8 + 40);
        int v9 = objc_msgSend(v7, "writeToURL:options:error:");
        objc_storeStrong((id *)(v8 + 40), obj);
        if (v9)
        {
          [*(id *)(a1 + 64) _writeDebugFileFromProxyMetadata:*(void *)(a1 + 72) forAsset:v3];
          if (*(unsigned char *)(a1 + 112))
          {
            if ([v3 kindSubtype] == 2)
            {
              uint64_t v10 = [v3 fileURLForFullsizeRenderVideo];
              uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
              uint64_t v12 = [v3 fileURLForOriginalVideoComplement];
              id v72 = 0;
              char v13 = [v11 copyItemAtURL:v12 toURL:v10 error:&v72];
              id v14 = v72;

              if ((v13 & 1) == 0)
              {
                uint64_t v15 = PLDeferredProcessingGetLog();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v16 = [v3 fileURLForOriginalVideoComplement];
                  *(_DWORD *)long long buf = 138412802;
                  v75 = v16;
                  __int16 v76 = 2112;
                  *(void *)id v77 = v10;
                  *(_WORD *)&v77[8] = 2112;
                  *(void *)&v77[10] = v14;
                  _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to copy video complement from %@ to %@ with error: %@", buf, 0x20u);
                }
              }
            }
            else
            {
              uint64_t v10 = 0;
            }
            [v3 setDeferredProcessingNeeded:2];
            id v38 = [v3 additionalAttributes];
            [v38 setDeferredProcessingCandidateOptions:0];

            uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
            id v71 = 0;
            char v40 = [v3 updateDeferredAdjustmentWithFullSizeRenderImageURL:v39 videoURL:v10 videoPosterURL:0 error:&v71];
            id v41 = v71;
            if ((v40 & 1) == 0)
            {
              id v42 = PLDeferredProcessingGetLog();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                id v43 = *(void **)(a1 + 48);
                *(_DWORD *)long long buf = 138543618;
                v75 = v43;
                __int16 v76 = 2112;
                *(void *)id v77 = v41;
                _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "Failed to update deferred adjustment (possibly non-fatal, finalizer will continue as if success) for asset: %{public}@ error: %@", buf, 0x16u);
              }
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;

LABEL_40:
LABEL_41:
            if ([v3 deferredProcessingNeeded])
            {
              id v44 = PLDeferredProcessingGetLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                id v45 = *(void **)(a1 + 48);
                int v46 = [v3 deferredProcessingNeeded];
                qos_class_self();
                id v47 = PLShortStringFromQoSClass();
                *(_DWORD *)long long buf = 138543874;
                v75 = v45;
                __int16 v76 = 1024;
                *(_DWORD *)id v77 = v46;
                *(_WORD *)&v77[4] = 2114;
                *(void *)&v77[6] = v47;
                _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEFAULT, "Scheduling asset: %{public}@ for deferred processing with value: %d QoS: %{public}@", buf, 0x1Cu);
              }
              os_signpost_id_t v48 = [v3 photoLibrary];
              BOOL v49 = [v48 libraryServicesManager];
              id v50 = [v49 backgroundJobService];
              v51 = [v3 photoLibrary];
              [v50 signalBackgroundProcessingNeededOnLibrary:v51];
            }
            goto LABEL_45;
          }
          uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
          uint64_t v36 = *(void *)(*(void *)(a1 + 96) + 8);
          id v70 = *(id *)(v36 + 40);
          int v37 = [v3 installFinalImageAndRemoveDeferredFilesWithFinalImageURL:v35 outError:&v70];
          objc_storeStrong((id *)(v36 + 40), v70);
          if (!v37)
          {
            int v57 = [MEMORY[0x1E4F8B908] isFileExistsError:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
            uint64_t v58 = PLDeferredProcessingGetLog();
            uint64_t v10 = v58;
            if (v57)
            {
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                v59 = *(void **)(a1 + 48);
                uint64_t v60 = *(void *)(a1 + 80);
                *(_DWORD *)long long buf = 138543618;
                v75 = v59;
                __int16 v76 = 2112;
                *(void *)id v77 = v60;
                _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ has already had file written to %@, skipping copy", buf, 0x16u);
              }

              uint64_t v61 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
              uint64_t v62 = *(void *)(*(void *)(a1 + 96) + 8);
              id v69 = *(id *)(v62 + 40);
              char v63 = [v3 installFinalImageAndRemoveDeferredFilesWithFinalImageURL:v61 outError:&v69];
              objc_storeStrong((id *)(v62 + 40), v69);
              *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v63;
              goto LABEL_41;
            }
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              v64 = *(void **)(a1 + 48);
              uint64_t v65 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
              *(_DWORD *)long long buf = 138543618;
              v75 = v64;
              __int16 v76 = 2112;
              *(void *)id v77 = v65;
              _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to install image for asset: %{public}@, reason: %@", buf, 0x16u);
            }
            goto LABEL_40;
          }
          [*(id *)(a1 + 64) _transitionDeferredProcessingNeededToNextStateForAsset:v3 originalHeight:v4 originalWidth:v6];
        }
        else
        {
          if (![MEMORY[0x1E4F8B908] isFileExistsError:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)])
          {
            uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) copy];
            int v31 = PLDeferredProcessingGetLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              uint64_t v32 = [v3 uuid];
              uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
              *(_DWORD *)long long buf = 138543618;
              v75 = v32;
              __int16 v76 = 2112;
              *(void *)id v77 = v33;
              _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Failed to write out file data for deferred photo for asset: %{public}@, reason: %@", buf, 0x16u);
            }
            uint64_t v34 = *(void *)(*(void *)(a1 + 96) + 8);
            id v67 = *(id *)(v34 + 40);
            [v3 promoteDeferredPreviewToFinalImageWithOutError:&v67];
            objc_storeStrong((id *)(v34 + 40), v67);
            [*(id *)(a1 + 64) _createTTRForNonRecoverableError:v10 assetDescription:*(void *)(a1 + 48) asset:v3];
            goto LABEL_40;
          }
          int v26 = *(unsigned __int8 *)(a1 + 112);
          __int16 v27 = PLDeferredProcessingGetLog();
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
          if (!v26)
          {
            if (v28)
            {
              v52 = *(void **)(a1 + 48);
              uint64_t v53 = *(void *)(a1 + 80);
              *(_DWORD *)long long buf = 138543618;
              v75 = v52;
              __int16 v76 = 2112;
              *(void *)id v77 = v53;
              _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ has already had data written to %@, skipping copy", buf, 0x16u);
            }

            uint64_t v54 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
            uint64_t v55 = *(void *)(*(void *)(a1 + 96) + 8);
            id v68 = *(id *)(v55 + 40);
            char v56 = [v3 installFinalImageAndRemoveDeferredFilesWithFinalImageURL:v54 outError:&v68];
            objc_storeStrong((id *)(v55 + 40), v68);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v56;
            [*(id *)(a1 + 64) _transitionDeferredProcessingNeededToNextStateForAsset:v3 originalHeight:v4 originalWidth:v6];
            goto LABEL_41;
          }
          if (v28)
          {
            uint64_t v29 = *(void **)(a1 + 48);
            uint64_t v30 = *(void *)(a1 + 80);
            *(_DWORD *)long long buf = 138543618;
            v75 = v29;
            __int16 v76 = 2112;
            *(void *)id v77 = v30;
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Render for asset %{public}@ has already had data written to %@, skipping copy", buf, 0x16u);
          }
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
        goto LABEL_41;
      }
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
    {
      uint64_t v17 = PLDeferredProcessingGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = *(void **)(a1 + 48);
        *(_DWORD *)long long buf = 138543362;
        v75 = v18;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "File data representation was nil for deferred photo for asset: %{public}@", buf, 0xCu);
      }

      uint64_t v19 = *(void *)(*(void *)(a1 + 96) + 8);
      id v66 = *(id *)(v19 + 40);
      char v20 = [v3 promoteDeferredPreviewToFinalImageWithOutError:&v66];
      objc_storeStrong((id *)(v19 + 40), v66);
      if ((v20 & 1) == 0)
      {
        id v21 = PLDeferredProcessingGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          os_signpost_id_t v22 = *(void **)(a1 + 48);
          uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
          *(_DWORD *)long long buf = 138543618;
          v75 = v22;
          __int16 v76 = 2112;
          *(void *)id v77 = v23;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to promote deferred preview for asset %{public}@, with error: %@", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 64) _createTTRForNonRecoverableError:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) assetDescription:*(void *)(a1 + 48) asset:v3];
    }
  }
  else
  {
    uint64_t v24 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      char v25 = *(void **)(a1 + 48);
      *(_DWORD *)long long buf = 138543362;
      v75 = v25;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Refreshed asset %{public}@ does not exist in managed object context, bailing out", buf, 0xCu);
    }
  }
LABEL_45:
}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_161(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 120) && !*(unsigned char *)(a1 + 121))
  {
    char v13 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v24 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "Expecting second callback for asset: %{public}@, not calling completion handlers yet", buf, 0xCu);
    }
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v3 = v2 - *(double *)(a1 + 112);
    uint64_t v4 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      uint64_t v8 = v7;
      qos_class_self();
      int v9 = PLShortStringFromQoSClass();
      *(_DWORD *)long long buf = 138544386;
      uint64_t v24 = v5;
      __int16 v25 = 2114;
      uint64_t v26 = v6;
      __int16 v27 = 2114;
      BOOL v28 = v8;
      __int16 v29 = 2114;
      uint64_t v30 = v9;
      __int16 v31 = 2048;
      double v32 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Calling completion handlers for asset: %{public}@ deferredIdentifier: %{public}@, success: %{public}@, QoS: %{public}@, duration %.3fs", buf, 0x34u);
    }
    if (*(void *)(*(void *)(a1 + 48) + 40)) {
      uint64_t v10 = @"Tail";
    }
    else {
      uint64_t v10 = @"Head";
    }
    uint64_t v11 = v10;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_168;
    v15[3] = &unk_1E58701C8;
    uint64_t v12 = *(void **)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 56);
    double v21 = v3;
    id v18 = *(id *)(a1 + 72);
    char v22 = *(unsigned char *)(a1 + 121);
    id v19 = *(id *)(a1 + 80);
    char v20 = v11;
    char v13 = v11;
    [v12 performBlockAndWait:v15];
    [*(id *)(a1 + 48) _callCompletionHandlersForPhotoProxy:*(void *)(a1 + 88) success:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) error:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
  }
}

void __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_168(uint64_t a1)
{
  id v6 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  double v2 = *(double *)(a1 + 72);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 56) qosToProcess];
  PLSendAssetFinalizationAnalytics(v6, v4, v3, v5, *(void **)(a1 + 64), v2);
}

uint64_t __85__PLDeferredPhotoFinalizer_processor_didFinishProcessingPhotoProxy_finalPhoto_error___block_invoke_156(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) _callCompletionHandlersForPhotoProxy:*(void *)(a1 + 40) success:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) error:a2];
}

- (BOOL)isRenderFromMetadata:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F15578]];
  unint64_t v5 = [v4 longValue];

  return (v5 >> 3) & 1;
}

- (void)requestFinalizationOfAsset:(id)a3 isBackgroundPriority:(BOOL)a4 reason:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, NSObject *))a6;
  uint64_t v62 = v11;
  if ([v10 deferredProcessingNeeded] != 10)
  {
    BOOL v58 = v8;
    char v13 = [v10 additionalAttributes];
    uint64_t v60 = [v13 deferredPhotoIdentifier];

    uint64_t v61 = (void *)[objc_alloc(MEMORY[0x1E4F16428]) initWithDeferredPhotoIdentifier:v60];
    v59 = [v10 uuidDescription];
    finalizer = self->_finalizer;
    if (v61)
    {
      if (finalizer)
      {
        log = PLBackendGetLog();
        os_signpost_id_t spid = os_signpost_id_generate(log);
        if (!self->_useCase)
        {
          uint64_t v15 = [v10 photoLibrary];
          id v16 = [v15 constraintsDirector];
          [v16 informAssetDeferredProcessingOccurring];
        }
        id v17 = [v10 additionalAttributes];
        unsigned int v18 = [v17 deferredProcessingCandidateOptions];

        qos_class_self();
        int v57 = PLShortStringFromQoSClass();
        id v19 = [PLDeferredPhotoPendingAssetRecord alloc];
        char v20 = [v10 objectID];
        double v21 = [v10 photoLibrary];
        char v22 = [v21 libraryServicesManager];
        uint64_t v23 = [v10 fileURLForFullsizeRenderImage];
        uint64_t v24 = [v10 mainFileURL];
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        LOBYTE(v53) = (v18 & 8) != 0;
        uint64_t v54 = -[PLDeferredPhotoPendingAssetRecord initWithAssetObjectID:lsm:requestReason:isBackgroundPriority:signpostId:expectsSecondProcessingCallback:needsSemanticDevelopment:fileURLForFullsizeRenderImage:mainFileURL:logDescription:startTimestamp:deferredmediadQos:completionHandler:](v19, "initWithAssetObjectID:lsm:requestReason:isBackgroundPriority:signpostId:expectsSecondProcessingCallback:needsSemanticDevelopment:fileURLForFullsizeRenderImage:mainFileURL:logDescription:startTimestamp:deferredmediadQos:completionHandler:", v20, v22, v62, v58, spid, (v18 >> 4) & 1, v53, v23, v24, v59, v57, v12);

        os_unfair_lock_lock(&self->_identifierToPendingRecordsLock);
        identifierToPendingRecords = self->_identifierToPendingRecords;
        uint64_t v26 = [v61 deferredPhotoIdentifier];
        id v27 = [(NSMutableDictionary *)identifierToPendingRecords objectForKey:v26];

        if (v27)
        {
          BOOL v28 = PLDeferredProcessingGetLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v29 = [v61 deferredPhotoIdentifier];
            *(_DWORD *)long long buf = 138543874;
            uint64_t v65 = v59;
            __int16 v66 = 2114;
            id v67 = v29;
            __int16 v68 = 2114;
            id v69 = v57;
            _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Adding another pending asset record for asset: %{public}@ with deferred identifier: %{public}@, QoS: %{public}@", buf, 0x20u);
          }
        }
        else
        {
          id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          BOOL v28 = PLDeferredProcessingGetLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v38 = [v61 deferredPhotoIdentifier];
            *(_DWORD *)long long buf = 138543874;
            uint64_t v65 = v59;
            __int16 v66 = 2114;
            id v67 = v38;
            __int16 v68 = 2114;
            id v69 = v57;
            _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "First instance of request finalization for asset: %{public}@ with deferred identifier: %{public}@, QoS %{public}@", buf, 0x20u);
          }
        }

        [v27 addObject:v54];
        uint64_t v39 = self->_identifierToPendingRecords;
        char v40 = [v61 deferredPhotoIdentifier];
        [(NSMutableDictionary *)v39 setObject:v27 forKey:v40];

        os_unfair_lock_unlock(&self->_identifierToPendingRecordsLock);
        id v41 = log;
        uint64_t v36 = v41;
        if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          id v42 = [v10 uuid];
          *(_DWORD *)long long buf = 138543362;
          uint64_t v65 = v42;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v36, OS_SIGNPOST_INTERVAL_BEGIN, spid, "requestFinalizationOfAsset", "uuid: %{public}@", buf, 0xCu);
        }
        id v43 = (id *)MEMORY[0x1E4F157D8];
        if (self->_useCase) {
          id v43 = (id *)MEMORY[0x1E4F157E0];
        }
        id v44 = *v43;
        id v45 = PLDeferredProcessingGetLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          int v46 = [v61 deferredPhotoIdentifier];
          uint64_t v47 = PLDeferredPhotoFinalizerUseCaseToString(self->_useCase);
          os_signpost_id_t v48 = (void *)v47;
          BOOL v49 = @"NO";
          *(_DWORD *)long long buf = 138544642;
          uint64_t v65 = v59;
          __int16 v66 = 2114;
          if (v58) {
            BOOL v49 = @"YES";
          }
          id v67 = v46;
          __int16 v68 = 2114;
          id v69 = v57;
          __int16 v70 = 2114;
          uint64_t v71 = v47;
          __int16 v72 = 2114;
          char v73 = v49;
          __int16 v74 = 2114;
          v75 = v62;
          id v50 = v49;
          _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_DEFAULT, "Requesting finalization for asset %{public}@ with deferredPhotoIdentifier: %{public}@, QoS: %{public}@, useCase: %{public}@, backgroundPriority: %{public}@, reason: %{public}@", buf, 0x3Eu);
        }
        qos_class_t v51 = qos_class_self();
        uint64_t v52 = 56;
        if (v51 == QOS_CLASS_USER_INITIATED) {
          uint64_t v52 = 48;
        }
        [(PLCaptureDeferredPhotoProcessor *)self->_finalizer processPhotoProxy:v61 queuePosition:v44 delegate:self delegateQueue:*(Class *)((char *)&self->super.isa + v52)];

LABEL_36:
        goto LABEL_37;
      }
    }
    else if (finalizer)
    {
      uint64_t v30 = PLDeferredProcessingGetLog();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      if (v60)
      {
        if (v31)
        {
          double v32 = [v10 additionalAttributes];
          uint64_t v33 = [v32 deferredPhotoIdentifier];
          *(_DWORD *)long long buf = 138543362;
          uint64_t v65 = v33;
          _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "deferredPhotoIdentifier not recognized by deferredmediad, attempting promotion of preview: %{public}@", buf, 0xCu);
        }
        goto LABEL_17;
      }
      if (v31)
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v65 = v59;
        uint64_t v34 = "deferredPhotoIdentifier is nil for asset: %{public}@ likely due to asset deletion, bailing out";
        goto LABEL_16;
      }
LABEL_17:

      id v63 = 0;
      char v35 = [v10 promoteDeferredPreviewToFinalImageWithOutError:&v63];
      uint64_t v36 = v63;
      if ((v35 & 1) == 0)
      {
        int v37 = PLDeferredProcessingGetLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138543618;
          uint64_t v65 = v59;
          __int16 v66 = 2112;
          id v67 = v36;
          _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Failed to promote deferred preview of asset %{public}@ with error: %@", buf, 0x16u);
        }
      }
      v12[2](v12, v36);
      goto LABEL_36;
    }
    uint64_t v30 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v65 = v59;
      uint64_t v34 = "nil shared photo processor when trying to finalize asset: %{public}@";
LABEL_16:
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, v34, buf, 0xCu);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  [(PLDeferredPhotoFinalizer *)self performSemanticEnhanceForAsset:v10 isBackgroundPriority:v8 reason:v11 completionHandler:v12];
LABEL_37:
}

- (void)_writeDebugFileFromProxyMetadata:(id)a3 forAsset:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKey:@"{Diagnostic}"];
  if (![v7 count])
  {
    CFDataRef XMPData = 0;
    goto LABEL_10;
  }
  BOOL v8 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v21 = 0;
  int v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v21];
  id v10 = v9;
  if (!v9)
  {
    id v11 = PLDeferredProcessingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "failed to deserialize diagnostics data", buf, 2u);
    }
    goto LABEL_8;
  }
  id v11 = [v9 base64EncodedStringWithOptions:0];
  Mutable = CGImageMetadataCreateMutable();
  if (!Mutable)
  {
LABEL_8:
    CFDataRef XMPData = 0;
    goto LABEL_9;
  }
  char v13 = Mutable;
  CGImageMetadataRegisterNamespaceForPrefix(Mutable, @"http://ns.apple.com/ios_debug", @"ios_debug", 0);
  CGImageMetadataSetValueWithPath(v13, 0, @"ios_debug:camera_diagnostics_bplist", v11);
  CFDataRef XMPData = CGImageMetadataCreateXMPData(v13, 0);
  CFRelease(v13);
LABEL_9:

LABEL_10:
  if ([(__CFData *)XMPData length])
  {
    uint64_t v15 = [v6 pathForDiagnosticFile];
    id v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:0];
    id v20 = 0;
    char v17 = [(__CFData *)XMPData writeToURL:v16 options:0 error:&v20];
    id v18 = v20;
    if ((v17 & 1) == 0)
    {
      id v19 = PLCameraGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v23 = v16;
        __int16 v24 = 2112;
        id v25 = v18;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to persist diagnostics to URL %{public}@ with error:%@", buf, 0x16u);
      }
    }
  }
}

- (id)initForUseCase:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PLDeferredPhotoFinalizer;
  uint64_t v4 = [(PLDeferredPhotoFinalizer *)&v18 init];
  if (v4)
  {
    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifierToPendingRecords = v4->_identifierToPendingRecords;
    v4->_identifierToPendingRecords = v5;

    if (MEMORY[0x19F38C0C0]())
    {
      finalizer = v4->_finalizer;
      v4->_finalizer = 0;
    }
    else
    {
      BOOL v8 = objc_alloc_init(PLCaptureDeferredPhotoProcessor);
      finalizer = v4->_finalizer;
      v4->_finalizer = v8;
    }

    if (!v4->_finalizer)
    {
      int v9 = PLDeferredProcessingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)char v17 = 0;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to get a shared photo processor", v17, 2u);
      }
    }
    v4->_identifierToPendingRecordsLock._os_unfair_lock_opaque = 0;
    id v10 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E4F74898]);
    imageConversionServiceClient = v4->_imageConversionServiceClient;
    v4->_imageConversionServiceClient = v10;

    v4->_useCase = a3;
    uint64_t v12 = pl_dispatch_queue_create_with_qos_and_fallback_qos();
    finalizerQueueUI = v4->_finalizerQueueUI;
    v4->_finalizerQueueUI = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.photos.backend.deferredPhotoFinalizerQueue.Unspecified", 0);
    finalizerQueueUnspecified = v4->_finalizerQueueUnspecified;
    v4->_finalizerQueueUnspecified = (OS_dispatch_queue *)v14;
  }
  return v4;
}

+ (BOOL)errorIsRecoverable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F8C500]];

  id v6 = (void *)MEMORY[0x1E4F28A50];
  uint64_t v7 = v3;
  if (v5)
  {
    BOOL v8 = [v3 userInfo];
    uint64_t v7 = [v8 objectForKeyedSubscript:*v6];
  }
  int v9 = [v7 domain];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F15AC0]];

  if (v10)
  {
    id v11 = [v7 userInfo];
    uint64_t v12 = [v11 objectForKeyedSubscript:*v6];

    unint64_t v13 = [v12 code];
    BOOL v15 = v13 == -16825 || v13 >> 1 == 0x7FFFFFFFFFFFDF25;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

@end