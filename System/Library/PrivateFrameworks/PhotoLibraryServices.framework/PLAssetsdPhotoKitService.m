@interface PLAssetsdPhotoKitService
- (BOOL)syncManager:(id)a3 shouldContinueWithLibrary:(id)a4;
- (PLAssetsdPhotoKitService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4;
- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 reply:(id)a5;
- (id)analyzeLibraryForFeature:(unint64_t)a3 reply:(id)a4;
- (id)clientBundleID;
- (id)clientDescription;
- (id)clientDisplayName;
- (id)persistentStoreCoordinator;
- (id)resetStateForMediaProcessingTaskID:(unint64_t)a3 assetUUIDs:(id)a4 resetOptions:(unint64_t)a5 reply:(id)a6;
- (unint64_t)libraryRole;
- (void)_processUniversalSearchJITForAsset:(id)a3 cssiUniqueIdentifier:(id)a4 bundleID:(id)a5 processingTypes:(unint64_t)a6 completion:(id)a7;
- (void)applyChangesRequest:(id)a3 reply:(id)a4;
- (void)cancelReservedCloudIdentifiersWithEntityName:(id)a3 reply:(id)a4;
- (void)commitRequest:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 batchHandler:(id)a7 completionHandler:(id)a8;
- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 itemHandler:(id)a7 completionHandler:(id)a8;
- (void)getUUIDsForAssetObjectURIs:(id)a3 filterPredicate:(id)a4 reply:(id)a5;
- (void)processUniversalSearchJITForAssetUUID:(id)a3 processingTypes:(unint64_t)a4 reply:(id)a5;
- (void)processUniversalSearchJITForCoreSpotlightUniqueIdentifier:(id)a3 bundleID:(id)a4 processingTypes:(unint64_t)a5 reply:(id)a6;
- (void)reserveCloudIdentifiersWithEntityName:(id)a3 count:(unint64_t)a4 reply:(id)a5;
- (void)reservedCloudIdentifiersWithEntityName:(id)a3 reply:(id)a4;
- (void)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 reply:(id)a4;
@end

@implementation PLAssetsdPhotoKitService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraTaskConstraintCoordinator, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

- (BOOL)syncManager:(id)a3 shouldContinueWithLibrary:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2, self, @"PLAssetsdPhotoKitService.m", 510, @"Invalid parameter not satisfying: %@", @"\"this code path is not expected\" && NO" object file lineNumber description];

  return 1;
}

- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 itemHandler:(id)a7 completionHandler:(id)a8
{
  v10 = (void *)MEMORY[0x1E4F28B00];
  v11 = (void (**)(id, id))a8;
  v12 = [v10 currentHandler];
  [v12 handleFailureInMethod:a2, self, @"PLAssetsdPhotoKitService.m", 504, @"Invalid parameter not satisfying: %@", @"\"this code path is not expected\" && NO" object file lineNumber description];

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:0];
  v11[2](v11, v13);
}

- (void)executeQueryForSyncManager:(id)a3 type:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 batchHandler:(id)a7 completionHandler:(id)a8
{
  v10 = (void *)MEMORY[0x1E4F28B00];
  v11 = (void (**)(id, id))a8;
  v12 = [v10 currentHandler];
  [v12 handleFailureInMethod:a2, self, @"PLAssetsdPhotoKitService.m", 498, @"Invalid parameter not satisfying: %@", @"\"this code path is not expected\" && NO" object file lineNumber description];

  id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:0];
  v11[2](v11, v13);
}

- (void)commitRequest:(id)a3 reply:(id)a4
{
}

- (unint64_t)libraryRole
{
  return 0;
}

- (id)clientDisplayName
{
  return [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerDisplayName];
}

- (id)clientBundleID
{
  return [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
}

- (id)clientDescription
{
  return [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization description];
}

- (id)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)_processUniversalSearchJITForAsset:(id)a3 cssiUniqueIdentifier:(id)a4 bundleID:(id)a5 processingTypes:(unint64_t)a6 completion:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  qos_class_t v17 = qos_class_self();
  v18 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = PLStringFromQoSClass();
    *(_DWORD *)buf = 138412290;
    id v38 = v19;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "US JIT Processing: request QoS is %@", buf, 0xCu);
  }
  v20 = [v13 uuid];
  if (a6)
  {
    v21 = [v13 firstPersistedResourceMatching:&__block_literal_global_68352];
    if (v21
      || ([v13 firstPersistedResourceMatching:&__block_literal_global_73],
          (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_3;
      v27[3] = &unk_1E586DEB0;
      SEL v32 = a2;
      id v28 = v20;
      v29 = self;
      id v31 = v16;
      unint64_t v33 = a6;
      id v30 = v14;
      qos_class_t v34 = v17;
      [v21 makeResourceLocallyAvailableWithCompletion:v27];

      v22 = v28;
    }
    else
    {
      v21 = [NSString stringWithFormat:@"US JIT Processing: Unable to find target resource for asset %@", v20];
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F8C500];
      uint64_t v35 = *MEMORY[0x1E4F28228];
      v36 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      v26 = [v24 errorWithDomain:v25 code:47017 userInfo:v22];
      (*((void (**)(id, void *))v16 + 2))(v16, v26);
    }
  }
  else
  {
    v23 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      id v38 = v14;
      __int16 v39 = 2114;
      id v40 = v15;
      __int16 v41 = 2114;
      v42 = v20;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_INFO, "US JIT Processing: (ingest only) item %{public}@ from %{public}@ succeeded for asset %{public}@", buf, 0x20u);
    }

    (*((void (**)(id, void))v16 + 2))(v16, 0);
  }
}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_87;
    v21[3] = &unk_1E586DE10;
    uint64_t v26 = *(void *)(a1 + 72);
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    id v22 = v6;
    uint64_t v23 = v7;
    id v24 = v8;
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    id v25 = v9;
    uint64_t v27 = v10;
    v11 = (void (**)(void))MEMORY[0x19F38D650](v21);
    if (qos_class_self() == *(_DWORD *)(a1 + 80))
    {
      v11[2](v11);
    }
    else
    {
      id v14 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        qos_class_self();
        id v15 = PLStringFromQoSClass();
        id v16 = PLStringFromQoSClass();
        *(_DWORD *)buf = 138412546;
        v29 = v15;
        __int16 v30 = 2112;
        id v31 = v16;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "US JIT Processing: after making resource locally available, QoS is %@, changing to %@ before issuing MAD request", buf, 0x16u);
      }
      qos_class_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v18 = dispatch_queue_attr_make_with_qos_class(v17, *(dispatch_qos_class_t *)(a1 + 80), 0);
      v19 = dispatch_queue_create("MAD QoS correction queue", v18);

      dispatch_async(v19, v11);
    }
  }
  else
  {
    v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "US JIT Processing: failed to make medium resource locally available for asset %{public}@ : %@", buf, 0x16u);
    }

    if (!v5)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"PLAssetsdPhotoKitService.m", 379, @"Invalid parameter not satisfying: %@", @"availabilityError" object file lineNumber description];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_87(uint64_t a1)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v2 = *(void *)(a1 + 64);
  v41[0] = *(void *)(a1 + 32);
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  v4 = [*(id *)(a1 + 40) libraryServicesManager];
  id v5 = [v4 libraryURL];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_2_90;
  v28[3] = &unk_1E586DE38;
  v28[4] = &v29;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_92;
  v21[3] = &unk_1E5871678;
  uint64_t v26 = &v29;
  id v22 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v23 = v6;
  uint64_t v24 = v7;
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 72);
  id v25 = v8;
  uint64_t v27 = v9;
  int64_t v10 = +[PLMediaAnalysisServiceRequestAdapter requestProcessingTypes:v2 forAssetsWithLocalIdentifiers:v3 fromPhotoLibraryWithURL:v5 progressHandler:v28 completionHandler:v21];
  v30[3] = v10;

  if (v30[3])
  {
    v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = v30[3];
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      uint64_t v36 = v12;
      __int16 v37 = 2114;
      uint64_t v38 = v13;
      __int16 v39 = 2114;
      uint64_t v40 = v14;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "US JIT Processing: Dispatched MediaAnalysis request %td for item %{public}@ assetUUID %{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v15 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v16;
      __int16 v37 = 2114;
      uint64_t v38 = v17;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "US JIT Processing: Failed to dispatch MediaAnalysis request for item %{public}@ assetUUID %{public}@", buf, 0x16u);
    }

    uint64_t v18 = *(void *)(a1 + 56);
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28228];
    qos_class_t v34 = @"Unable to dispatch MediaAnalysis request";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v20 = [v19 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v11];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v20);
  }
  _Block_object_dispose(&v29, 8);
}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_2_90(uint64_t a1, double a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v6 = 134218240;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    double v9 = a2;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "US JIT Processing: MediaAnalysis request %td progress %f", (uint8_t *)&v6, 0x16u);
  }
}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_92(uint64_t a1, void *a2)
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLPhotoKitGetLog();
  uint64_t v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v52 = v10;
      __int16 v53 = 2114;
      uint64_t v54 = v11;
      __int16 v55 = 2114;
      uint64_t v56 = v12;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "US JIT Processing: MediaAnalysis request %td succeeded for item %{public}@ asset %{public}@", buf, 0x20u);
    }

    int v13 = _os_feature_enabled_impl();
    uint64_t v14 = [*(id *)(a1 + 48) libraryServicesManager];
    id v15 = v14;
    if (v13)
    {
      id v9 = [v14 searchIndexingEngine];

      uint64_t v16 = PLPhotoKitGetLog();
      uint64_t v17 = v16;
      if (v9)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v52 = v18;
          __int16 v53 = 2114;
          uint64_t v54 = v19;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "US JIT Processing: Donating to CoreSpotlight item %{public}@ asset %{public}@", buf, 0x16u);
        }

        v63[0] = *(void *)(a1 + 40);
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_95;
        v47[3] = &unk_1E586DE60;
        v21 = &v48;
        id v48 = *(id *)(a1 + 32);
        id v22 = &v49;
        id v49 = *(id *)(a1 + 40);
        id v50 = *(id *)(a1 + 56);
        [v9 indexAssetsWithUUIDs:v20 partialUpdateMask:3 completion:v47];

        id v23 = v50;
LABEL_17:

        goto LABEL_18;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = *(void *)(a1 + 32);
        uint64_t v33 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v52 = v32;
        __int16 v53 = 2114;
        uint64_t v54 = v33;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "US JIT Processing: No search indexing engine! Indexing failed for item %{public}@ asset %{public}@", buf, 0x16u);
      }

      qos_class_t v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F8C500];
      uint64_t v61 = *MEMORY[0x1E4F28228];
      v62 = @"No search index manager";
      uint64_t v36 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v37 = &v62;
      uint64_t v38 = &v61;
    }
    else
    {
      id v9 = [v14 searchIndexManager];

      uint64_t v24 = PLPhotoKitGetLog();
      id v25 = v24;
      if (v9)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = *(void *)(a1 + 32);
          uint64_t v27 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v52 = v26;
          __int16 v53 = 2114;
          uint64_t v54 = v27;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "US JIT Processing: Donating to CoreSpotlight item %{public}@ asset %{public}@", buf, 0x16u);
        }

        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_99;
        v42[3] = &unk_1E586DE88;
        v21 = &v43;
        uint64_t v28 = *(void *)(a1 + 40);
        id v43 = *(id *)(a1 + 32);
        id v22 = (id *)v44;
        id v29 = *(id *)(a1 + 40);
        uint64_t v46 = *(void *)(a1 + 72);
        uint64_t v30 = *(void *)(a1 + 48);
        uint64_t v31 = *(void **)(a1 + 56);
        v44[0] = v29;
        v44[1] = v30;
        id v45 = v31;
        [v9 indexSingleAssetWithUUID:v28 completion:v42];
        id v23 = v45;
        goto LABEL_17;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = *(void *)(a1 + 32);
        uint64_t v40 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v52 = v39;
        __int16 v53 = 2114;
        uint64_t v54 = v40;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "US JIT Processing: No search index manager! Indexing failed for item %{public}@ asset %{public}@", buf, 0x16u);
      }

      qos_class_t v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F8C500];
      uint64_t v59 = *MEMORY[0x1E4F28228];
      v60 = @"No search index manager";
      uint64_t v36 = (void *)MEMORY[0x1E4F1C9E8];
      __int16 v37 = &v60;
      uint64_t v38 = &v59;
    }
    __int16 v41 = [v36 dictionaryWithObjects:v37 forKeys:v38 count:1];
    id v9 = [v34 errorWithDomain:v35 code:41008 userInfo:v41];

    if (!v9) {
      goto LABEL_19;
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    uint64_t v52 = v6;
    __int16 v53 = 2114;
    uint64_t v54 = v7;
    __int16 v55 = 2114;
    uint64_t v56 = v8;
    __int16 v57 = 2112;
    id v58 = v3;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "US JIT Processing: MediaAnalysis request %td failed for item %{public}@ asset %{public}@: %@", buf, 0x2Au);
  }

  id v9 = v3;
LABEL_5:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_18:

LABEL_19:
}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_95(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 isSuccess];
  uint64_t v5 = PLPhotoKitGetLog();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      int v14 = 138543618;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "US JIT Processing: Donation of CoreSpotlight item %{public}@ asset %{public}@ succeeded", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[5];
    uint64_t v11 = [v3 error];
    int v14 = 138543874;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "US JIT Processing: Failed to donate to CoreSpotlight item %{public}@ asset %{public}@: %@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v12 = a1[6];
  int v13 = [v3 error];
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
}

void __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_99(void *a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    uint64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      uint64_t v10 = "US JIT Processing: Donation of CoreSpotlight item %{public}@ asset %{public}@ succeeded";
      uint64_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 22;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v11, v12, v10, buf, v13);
    }
  }
  else
  {
    if (!v5)
    {
      __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a1[8], a1[6], @"PLAssetsdPhotoKitService.m", 422, @"Invalid parameter not satisfying: %@", @"indexError != nil" object file lineNumber description];
    }
    uint64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = a1[4];
      uint64_t v15 = a1[5];
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v6;
      uint64_t v10 = "US JIT Processing: Failed to donate to CoreSpotlight item %{public}@ asset %{public}@: %@";
      uint64_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
      goto LABEL_8;
    }
  }

  (*(void (**)(void))(a1[7] + 16))();
}

uint64_t __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

BOOL __120__PLAssetsdPhotoKitService__processUniversalSearchJITForAsset_cssiUniqueIdentifier_bundleID_processingTypes_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recipeID] == 65741;
}

- (id)resetStateForMediaProcessingTaskID:(unint64_t)a3 assetUUIDs:(id)a4 resetOptions:(unint64_t)a5 reply:(id)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  os_log_type_t v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint32_t v13 = [v12 databaseContext];
  uint64_t v14 = (void *)[v13 newShortLivedLibraryWithName:"-[PLAssetsdPhotoKitService resetStateForMediaProcessingTaskID:assetUUIDs:resetOptions:reply:]"];

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __93__PLAssetsdPhotoKitService_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_reply___block_invoke;
    v24[3] = &unk_1E586DE10;
    id v16 = v15;
    id v25 = v16;
    unint64_t v29 = a3;
    id v26 = v10;
    unint64_t v30 = a5;
    id v27 = v14;
    id v28 = v11;
    [v27 performTransaction:v24];
    uint64_t v17 = v28;
    id v18 = v16;

    __int16 v19 = v25;
    uint64_t v20 = v18;
  }
  else
  {
    __int16 v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F8C500];
    uint64_t v31 = *MEMORY[0x1E4F28228];
    v32[0] = @"No photo library available for resetting media processing state";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    __int16 v19 = [v21 errorWithDomain:v22 code:46502 userInfo:v18];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v19);
    uint64_t v20 = 0;
  }

  return v20;
}

void __93__PLAssetsdPhotoKitService_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_reply___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  int v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v7 = 0;
  PLResetStateForMediaProcessingTaskID(v2, v4, v3, v5, (uint64_t)&v7);
  id v6 = v7;
  [*(id *)(a1 + 32) resignCurrent];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)analyzeLibraryForFeature:(unint64_t)a3 reply:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v8 = [v7 databaseContext];
  uint64_t v9 = (void *)[v8 newShortLivedLibraryWithName:"-[PLAssetsdPhotoKitService analyzeLibraryForFeature:reply:]"];

  if (v9)
  {
    id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v11 = [v10 analysisCoordinator];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__PLAssetsdPhotoKitService_analyzeLibraryForFeature_reply___block_invoke;
    v17[3] = &unk_1E586F0F0;
    id v18 = v6;
    os_log_type_t v12 = [v11 analyzeLibraryForFeature:a3 withCompletionHandler:v17];
    uint32_t v13 = v18;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F8C500];
    uint64_t v19 = *MEMORY[0x1E4F28228];
    v20[0] = @"FAILURE";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint32_t v13 = [v14 errorWithDomain:v15 code:46502 userInfo:v11];
    (*((void (**)(id, void *))v6 + 2))(v6, v13);
    os_log_type_t v12 = 0;
  }

  return v12;
}

void __59__PLAssetsdPhotoKitService_analyzeLibraryForFeature_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 error];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 reply:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v11 = [v10 databaseContext];
  os_log_type_t v12 = (void *)[v11 newShortLivedLibraryWithName:"-[PLAssetsdPhotoKitService analyzeAssets:forFeature:reply:]"];

  if (v12)
  {
    uint32_t v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    uint64_t v14 = [v13 analysisCoordinator];

    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    unint64_t v30 = __Block_byref_object_copy__68402;
    uint64_t v31 = __Block_byref_object_dispose__68403;
    id v32 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __59__PLAssetsdPhotoKitService_analyzeAssets_forFeature_reply___block_invoke;
    v20[3] = &unk_1E5873D48;
    id v21 = v8;
    id v22 = v12;
    id v25 = &v27;
    id v15 = v14;
    id v23 = v15;
    unint64_t v26 = a4;
    id v24 = v9;
    [v22 performBlockAndWait:v20];
    id v16 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28228];
    v34[0] = @"FAILURE";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v18 = [v17 errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v15];
    (*((void (**)(id, void *))v9 + 2))(v9, v18);

    id v16 = 0;
  }

  return v16;
}

void __59__PLAssetsdPhotoKitService_analyzeAssets_forFeature_reply___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLManagedAsset assetsWithUUIDs:*(void *)(a1 + 32) options:0 inLibrary:*(void *)(a1 + 40)];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v17 + 1) + 8 * v8) objectID];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  uint64_t v10 = *(void *)(a1 + 72);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__PLAssetsdPhotoKitService_analyzeAssets_forFeature_reply___block_invoke_2;
  v15[3] = &unk_1E586F0F0;
  id v11 = *(void **)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  uint64_t v12 = [v11 analyzeAssets:v3 forFeature:v10 withCompletionHandler:v15];
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void __59__PLAssetsdPhotoKitService_analyzeAssets_forFeature_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 error];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)processUniversalSearchJITForAssetUUID:(id)a3 processingTypes:(unint64_t)a4 reply:(id)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v33 = 0;
  qos_class_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  unint64_t v30 = __Block_byref_object_copy__68402;
  uint64_t v31 = __Block_byref_object_dispose__68403;
  id v32 = 0;
  uint64_t v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v11 = [v10 databaseContext];
  uint64_t v12 = (void *)[v11 newShortLivedLibraryWithName:"Universal Search JIT Processing"];

  if (v12)
  {
    *((unsigned char *)v34 + 24) = 1;
    goto LABEL_4;
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v41 = *MEMORY[0x1E4F28228];
  v42[0] = @"Unable to create short-lived library";
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
  uint64_t v15 = [v13 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v14];
  id v16 = (void *)v28[5];
  void v28[5] = v15;

  if (*((unsigned char *)v34 + 24))
  {
LABEL_4:
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__PLAssetsdPhotoKitService_processUniversalSearchJITForAssetUUID_processingTypes_reply___block_invoke;
    v19[3] = &unk_1E586DDE8;
    id v20 = v8;
    id v24 = &v33;
    id v25 = &v27;
    id v21 = v12;
    uint64_t v22 = self;
    unint64_t v26 = a4;
    id v23 = v9;
    [v21 performBlockAndWait:v19];

    if (*((unsigned char *)v34 + 24)) {
      goto LABEL_8;
    }
  }
  long long v17 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = v28[5];
    *(_DWORD *)buf = 138543618;
    id v38 = v8;
    __int16 v39 = 2112;
    uint64_t v40 = v18;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "US JIT Processing: failed for asset %{public}@: %@", buf, 0x16u);
  }

  (*((void (**)(id, uint64_t))v9 + 2))(v9, v28[5]);
LABEL_8:

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

void __88__PLAssetsdPhotoKitService_processUniversalSearchJITForAssetUUID_processingTypes_reply___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLManagedAsset assetWithUUID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "US JIT Processing: asset %{public}@ found", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 80);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__PLAssetsdPhotoKitService_processUniversalSearchJITForAssetUUID_processingTypes_reply___block_invoke_61;
    v14[3] = &unk_1E5874D70;
    uint64_t v6 = *(void **)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    [v6 _processUniversalSearchJITForAsset:v2 cssiUniqueIdentifier:0 bundleID:0 processingTypes:v5 completion:v14];
    uint64_t v7 = v15;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v7 = [NSString stringWithFormat:@"US JIT Processing: Unable to find asset with uuid %@", *(void *)(a1 + 32)];
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F8C500];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = v7;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v11 = [v8 errorWithDomain:v9 code:41004 userInfo:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

uint64_t __88__PLAssetsdPhotoKitService_processUniversalSearchJITForAssetUUID_processingTypes_reply___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processUniversalSearchJITForCoreSpotlightUniqueIdentifier:(id)a3 bundleID:(id)a4 processingTypes:(unint64_t)a5 reply:(id)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v54 = 0u;
  *(_OWORD *)sel = 0u;
  long long v53 = 0u;
  int v13 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v53) = v13;
  if (v13)
  {
    uint64_t v14 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: processUniversalSearchJITForCoreSpotlightUniqueIdentifier:bundleID:processingTypes:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v15 = (void *)*((void *)&v53 + 1);
    *((void *)&v53 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v54 + 8));
  }
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  *(void *)&long long v64 = 0;
  *((void *)&v64 + 1) = &v64;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__68402;
  v67 = __Block_byref_object_dispose__68403;
  id v68 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__68402;
  void v47[4] = __Block_byref_object_dispose__68403;
  id v48 = 0;
  id v16 = [PLSyndicationSyncEngine alloc];
  uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EEBEF648];
  uint64_t v18 = -[PLSyndicationSyncEngine initWithQueryTypes:savedAssetTypeMask:delegate:](v16, "initWithQueryTypes:savedAssetTypeMask:delegate:", v17, [MEMORY[0x1E4F8BA10] maskForSyndicationSyncWorkerInSyndicationLibrary], self);

  long long v19 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v20 = [v19 databaseContext];
  id v21 = (void *)[v20 newShortLivedLibraryWithName:"Universal Search JIT Processing"];

  if (v21)
  {
    *((unsigned char *)v50 + 24) = 1;
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v62 = *MEMORY[0x1E4F28228];
    v63 = @"Unable to create short-lived library";
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    uint64_t v24 = [v22 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v23];
    id v25 = *(void **)(*((void *)&v64 + 1) + 40);
    *(void *)(*((void *)&v64 + 1) + 40) = v24;

    if (!*((unsigned char *)v50 + 24))
    {
LABEL_12:
      unint64_t v30 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(*((void *)&v64 + 1) + 40);
        *(_DWORD *)buf = 138543874;
        id v57 = v10;
        __int16 v58 = 2114;
        id v59 = v11;
        __int16 v60 = 2112;
        uint64_t v61 = v31;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "US JIT Processing: failed for item %{public}@ from %{public}@: %@", buf, 0x20u);
      }

      (*((void (**)(id, void, void))v12 + 2))(v12, 0, *(void *)(*((void *)&v64 + 1) + 40));
      goto LABEL_15;
    }
  }
  unint64_t v26 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v57 = v10;
    __int16 v58 = 2114;
    id v59 = v11;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_INFO, "US JIT Processing: sync searchable item %{public}@ from %{public}@", buf, 0x16u);
  }

  id v46 = 0;
  BOOL v27 = [(PLSyndicationSyncEngine *)v18 syncSyndicationItemWithUniqueIdentifier:v10 bundleID:v11 queryType:1 library:v21 error:&v46];
  id v28 = v46;
  id v29 = v46;
  *((unsigned char *)v50 + 24) = v27;
  if (!v27) {
    objc_storeStrong((id *)(*((void *)&v64 + 1) + 40), v28);
  }

  if (!*((unsigned char *)v50 + 24)) {
    goto LABEL_12;
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __117__PLAssetsdPhotoKitService_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_reply___block_invoke;
  v36[3] = &unk_1E586DDC0;
  id v37 = v10;
  id v38 = v21;
  v42 = &v49;
  id v43 = &v64;
  v44 = v47;
  id v39 = v11;
  uint64_t v40 = self;
  unint64_t v45 = a5;
  id v41 = v12;
  [v38 performBlockAndWait:v36];

  if (!*((unsigned char *)v50 + 24)) {
    goto LABEL_12;
  }
LABEL_15:

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v49, 8);
  if ((_BYTE)v53) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v54 + 8));
  }
  if ((void)v54)
  {
    id v32 = PLRequestGetLog();
    uint64_t v33 = v32;
    os_signpost_id_t v34 = v54;
    if ((unint64_t)(v54 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(sel[1]);
      LODWORD(v64) = 136446210;
      *(void *)((char *)&v64 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v33, OS_SIGNPOST_INTERVAL_END, v34, "##### %s %@ entitled:%d", "%{public}s", (uint8_t *)&v64, 0xCu);
    }
  }
}

void __117__PLAssetsdPhotoKitService_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_reply___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLManagedAsset assetWithSyndicationIdentifier:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 uuid];
    uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v8;
      __int16 v27 = 2114;
      uint64_t v28 = v9;
      __int16 v29 = 2114;
      uint64_t v30 = v10;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "US JIT Processing: asset %{public}@ found for searchable item %{public}@ from %{public}@ ", buf, 0x20u);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 48);
    id v12 = *(void **)(a1 + 56);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __117__PLAssetsdPhotoKitService_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_reply___block_invoke_55;
    v22[3] = &unk_1E586DD98;
    uint64_t v14 = *(void *)(a1 + 96);
    uint64_t v24 = *(void *)(a1 + 88);
    id v23 = *(id *)(a1 + 64);
    [v12 _processUniversalSearchJITForAsset:v3 cssiUniqueIdentifier:v11 bundleID:v13 processingTypes:v14 completion:v22];
    id v15 = v23;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    id v15 = [NSString stringWithFormat:@"US JIT Processing: Unable to find asset with syndication identifier %@", *(void *)(a1 + 32)];
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F8C500];
    uint64_t v31 = *MEMORY[0x1E4F28228];
    v32[0] = v15;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    uint64_t v19 = [v16 errorWithDomain:v17 code:41004 userInfo:v18];
    uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
}

void __117__PLAssetsdPhotoKitService_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_reply___block_invoke_55(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getUUIDsForAssetObjectURIs:(id)a3 filterPredicate:(id)a4 reply:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void, id))a5;
  long long v34 = 0u;
  *(_OWORD *)sel = 0u;
  long long v33 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v33) = v11;
  if (v11)
  {
    id v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getUUIDsForAssetObjectURIs:filterPredicate:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v13 = (void *)*((void *)&v33 + 1);
    *((void *)&v33 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__68402;
  id v39 = __Block_byref_object_dispose__68403;
  id v40 = 0;
  uint64_t v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v15 = [v14 databaseContext];
  id v16 = (void *)[v15 newShortLivedLibraryWithName:"-[PLAssetsdPhotoKitService getUUIDsForAssetObjectURIs:filterPredicate:reply:]"];

  uint64_t v17 = [v16 managedObjectContext];
  uint64_t v18 = [v17 persistentStoreCoordinator];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __77__PLAssetsdPhotoKitService_getUUIDsForAssetObjectURIs_filterPredicate_reply___block_invoke;
  v31[3] = &unk_1E5876088;
  id v19 = v18;
  id v32 = v19;
  uint64_t v20 = objc_msgSend(v8, "_pl_map:", v31);
  id v30 = 0;
  id v21 = +[PLManagedAsset assetUUIDsByObjectIDs:v20 withFilterPredicate:v9 context:v17 error:&v30];
  id v22 = v30;
  if (v21)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v24 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v23;

    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __77__PLAssetsdPhotoKitService_getUUIDsForAssetObjectURIs_filterPredicate_reply___block_invoke_2;
    v29[3] = &unk_1E586DD70;
    v29[4] = &buf;
    [v21 enumerateKeysAndObjectsUsingBlock:v29];
  }
  v10[2](v10, *(void *)(*((void *)&buf + 1) + 40), v22);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v33) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  }
  if ((void)v34)
  {
    id v25 = PLRequestGetLog();
    uint64_t v26 = v25;
    os_signpost_id_t v27 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "##### %s %@ entitled:%d", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

uint64_t __77__PLAssetsdPhotoKitService_getUUIDsForAssetObjectURIs_filterPredicate_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) managedObjectIDForURIRepresentation:a2];
}

void __77__PLAssetsdPhotoKitService_getUUIDsForAssetObjectURIs_filterPredicate_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 URIRepresentation];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKey:v6];
}

- (void)cancelReservedCloudIdentifiersWithEntityName:(id)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, id))a4;
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v21) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: cancelReservedCloudIdentifiersWithEntityName:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  int v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v12 = [v11 cloudIdentifierReservationSupport];

  uint64_t v13 = [(PLAssetsdPhotoKitService *)self clientBundleID];
  id v20 = 0;
  uint64_t v14 = [v12 cancelReservedCloudIdentifiersWithEntityName:v6 clientBundleIdentifier:v13 error:&v20];
  id v15 = v20;

  v7[2](v7, v14, v15);
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    id v16 = PLRequestGetLog();
    uint64_t v17 = v16;
    os_signpost_id_t v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "##### %s %@ entitled:%d", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)reservedCloudIdentifiersWithEntityName:(id)a3 reply:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v21) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: reservedCloudIdentifiersWithEntityName:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  int v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v12 = [v11 cloudIdentifierReservationSupport];

  uint64_t v13 = [(PLAssetsdPhotoKitService *)self clientBundleID];
  id v20 = 0;
  uint64_t v14 = [v12 reservedCloudIdentifierUUIDsWithEntityName:v6 clientBundleIdentifier:v13 error:&v20];
  id v15 = v20;

  v7[2](v7, v14, v15);
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    id v16 = PLRequestGetLog();
    uint64_t v17 = v16;
    os_signpost_id_t v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "##### %s %@ entitled:%d", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)reserveCloudIdentifiersWithEntityName:(id)a3 count:(unint64_t)a4 reply:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a5;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v10 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v10;
  if (v10)
  {
    int v11 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: reserveCloudIdentifiersWithEntityName:count:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v12 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v14 = [v13 cloudIdentifierReservationSupport];

  id v15 = [(PLAssetsdPhotoKitService *)self clientBundleID];
  id v22 = 0;
  id v16 = [v14 reserveCloudIdentifierUUIDsWithEntityName:v8 count:a4 clientBundleIdentifier:v15 error:&v22];
  id v17 = v22;

  v9[2](v9, v16, v17);
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    os_signpost_id_t v18 = PLRequestGetLog();
    id v19 = v18;
    os_signpost_id_t v20 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "##### %s %@ entitled:%d", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v22) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resolveLocalIdentifiersForCloudIdentifiers:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v10 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  int v11 = +[PLCloudPhotoLibraryError createErrorWithType:15 withDebugMessage:@"iCloud Photo Library not enabled"];
  id v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v13 = [v12 isCloudPhotoLibraryEnabled];

  if (v13)
  {
    uint64_t v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v15 = [v14 cloudPhotoLibraryManager];

    if (v15)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __77__PLAssetsdPhotoKitService_resolveLocalIdentifiersForCloudIdentifiers_reply___block_invoke;
      v20[3] = &unk_1E5874D98;
      id v21 = v7;
      [v15 resolveLocalIdentifiersForCloudIdentifiers:v6 completionHandler:v20];
    }
    else
    {
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
  else
  {
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    id v16 = PLRequestGetLog();
    id v17 = v16;
    os_signpost_id_t v18 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "##### %s %@ entitled:%d", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __77__PLAssetsdPhotoKitService_resolveLocalIdentifiersForCloudIdentifiers_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)applyChangesRequest:(id)a3 reply:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  +[PLFileDescriptorFuse checkFileDescriptorFuse];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v14 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v14) = v8;
  if (v8)
  {
    *((void *)&v14 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: applyChangesRequest:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  objc_msgSend(v6, "decodeWithService:clientAuthorization:", self, self->_connectionAuthorization, (void)v14);
  if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientInLimitedLibraryMode])
  {
    [v6 discardUnsupportedLimitedLibraryChangeRequests];
  }
  id v9 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    BOOL v10 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization photoKitEntitled];
    *(_DWORD *)long long buf = 136315650;
    id v19 = "-[PLAssetsdPhotoKitService applyChangesRequest:reply:]";
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 1024;
    BOOL v23 = v10;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "##### %s %@ entitled:%d", buf, 0x1Cu);
  }

  [(PLAssetsdPhotoKitService *)self commitRequest:v6 reply:v7];
  if (v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if ((void)v16)
  {
    int v11 = PLRequestGetLog();
    id v12 = v11;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v16, "##### %s %@ entitled:%d", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)dealloc
{
  [(PLCameraCaptureTaskConstraintCoordinator *)self->_cameraTaskConstraintCoordinator invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PLAssetsdPhotoKitService;
  [(PLAssetsdPhotoKitService *)&v3 dealloc];
}

- (PLAssetsdPhotoKitService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLAssetsdPhotoKitService;
  int v8 = [(PLAbstractLibraryServicesManagerService *)&v16 initWithLibraryServicesManager:v6];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connectionAuthorization, a4);
    uint64_t v10 = [v6 persistentStoreCoordinator];
    persistentStoreCoordinator = v9->_persistentStoreCoordinator;
    v9->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v10;

    if (PLPlatformCameraCaptureSupported())
    {
      id v12 = [NSString stringWithFormat:@"PhotoKitService: %@", v7];
      int v13 = [[PLCameraCaptureTaskConstraintCoordinator alloc] initWithTaskContstraintRole:2 name:v12];
      cameraTaskConstraintCoordinator = v9->_cameraTaskConstraintCoordinator;
      v9->_cameraTaskConstraintCoordinator = v13;
    }
  }

  return v9;
}

@end