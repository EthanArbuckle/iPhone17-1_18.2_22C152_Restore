@interface PLBackgroundJobLockedResourceWorker
+ (BOOL)_isRecoveringFromTransferForAsset:(id)a3 pathManager:(id)a4 mainMarkerURLIfExists:(id *)a5 lockedMarkerURLIfExists:(id *)a6;
+ (BOOL)_removeFilesForAsset:(id)a3 inBundleScope:(unsigned __int16)a4 pathManager:(id)a5;
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (void)_accessFileForAsset:(id)a3 cplResourceType:(unint64_t)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6 resourceType:(unsigned int)a7 utiString:(id)a8 bundleScope:(unsigned __int16)a9 pathManager:(id)a10 mode:(unsigned __int8)a11 handler:(id)a12;
+ (void)recoverFromInterruptedJobWithLibrary:(id)a3;
- (BOOL)_cloneResource:(id)a3 asset:(id)a4 destinationBundleScope:(unsigned __int16)a5 pathManager:(id)a6 sourceURL:(id *)a7 destinationURL:(id *)a8 error:(id *)a9;
- (BOOL)_cloneResourceWithCPLResourceType:(unint64_t)a3 version:(unsigned int)a4 recipeID:(unsigned int)a5 resourceType:(unsigned int)a6 utiString:(id)a7 asset:(id)a8 destinationBundleScope:(unsigned __int16)a9 pathManager:(id)a10 sourceURL:(id *)a11 destinationURL:(id *)a12 error:(id *)a13;
- (BOOL)_eraseTableThumbnailAtIndex:(int64_t)a3 managedObjectContext:(id)a4 pathManager:(id)a5;
- (BOOL)isInterruptible;
- (PLBackgroundJobLockedResourceWorker)initWithLibraryBundle:(id)a3;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
@end

@implementation PLBackgroundJobLockedResourceWorker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_thumbnailManager, 0);
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  v151[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v73 = a4;
  v75 = (void (**)(id, void *))a5;
  v72 = v7;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v150 = *MEMORY[0x1E4F28228];
    v151[0] = @"LockingHiddenMoveResources fetaure not enabled";
    id v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:&v150 count:1];
    v33 = [v32 errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:v74];
    v75[2](v75, v33);

    goto LABEL_64;
  }
  id v8 = v7;
  uint64_t v134 = 0;
  v135 = &v134;
  uint64_t v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__37440;
  v138 = __Block_byref_object_dispose__37441;
  id v139 = 0;
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x3032000000;
  v131 = __Block_byref_object_copy__37440;
  v132 = __Block_byref_object_dispose__37441;
  id v133 = 0;
  uint64_t v122 = 0;
  v123 = &v122;
  uint64_t v124 = 0x3032000000;
  v125 = __Block_byref_object_copy__37440;
  v126 = __Block_byref_object_dispose__37441;
  id v127 = 0;
  uint64_t v116 = 0;
  v117 = &v116;
  uint64_t v118 = 0x3032000000;
  v119 = __Block_byref_object_copy__37440;
  v120 = __Block_byref_object_dispose__37441;
  id v121 = 0;
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__37440;
  v114 = __Block_byref_object_dispose__37441;
  id v115 = 0;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x2020000000;
  uint64_t v109 = 0;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __78__PLBackgroundJobLockedResourceWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v94[3] = &unk_1E58693D0;
  id v95 = v73;
  id v74 = v8;
  id v96 = v74;
  v97 = self;
  v100 = &v134;
  v101 = &v106;
  v102 = &v116;
  v103 = &v122;
  v104 = &v110;
  v105 = &v128;
  id v70 = v9;
  id v98 = v70;
  id v71 = v10;
  id v99 = v71;
  id v69 = v95;
  [v95 performBlockAndWait:v94];
  if (v107[3] != 2)
  {
    v34 = PLBackendGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = [(PLBackgroundJobWorker *)self workerName];
      v36 = (__CFString *)v123[5];
      *(_DWORD *)buf = 138543874;
      uint64_t v141 = (uint64_t)v35;
      __int16 v142 = 2114;
      v143 = v36;
      __int16 v144 = 2112;
      id v145 = v71;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "%{public}@ failed to transition hidden or trashed asset %{public}@, cleaning up cloned URLs: %@", buf, 0x20u);
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v37 = v71;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v84 objects:v148 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v85;
      char v40 = 1;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v85 != v39) {
            objc_enumerationMutation(v37);
          }
          v42 = *(__CFString **)(*((void *)&v84 + 1) + 8 * i);
          v43 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v83 = 0;
          char v44 = [v43 removeItemAtURL:v42 error:&v83];
          id v45 = v83;

          if ((v44 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
          {
            v46 = PLBackendGetLog();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              v47 = [(PLBackgroundJobWorker *)self workerName];
              *(_DWORD *)buf = 138543874;
              uint64_t v141 = (uint64_t)v47;
              __int16 v142 = 2112;
              v143 = v42;
              __int16 v144 = 2112;
              id v145 = v45;
              _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove destination resource URL: %@, error: %@", buf, 0x20u);
            }
            char v40 = 0;
          }
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v84 objects:v148 count:16];
      }
      while (v38);
    }
    else
    {
      char v40 = 1;
    }

    v48 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v49 = v117[5];
    id v82 = 0;
    char v50 = [v48 removeItemAtURL:v49 error:&v82];
    id v51 = v82;

    if ((v50 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      v52 = PLBackendGetLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = [(PLBackgroundJobWorker *)self workerName];
        v54 = (__CFString *)v117[5];
        *(_DWORD *)buf = 138543874;
        uint64_t v141 = (uint64_t)v53;
        __int16 v142 = 2112;
        v143 = v54;
        __int16 v144 = 2112;
        id v145 = v51;
        _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove source marker file URL: %@, error: %@", buf, 0x20u);
      }
    }
    if (v40)
    {
      v55 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v56 = v111[5];
      id v81 = 0;
      char v57 = [v55 removeItemAtURL:v56 error:&v81];
      id v58 = v81;

      if ((v57 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
      {
        v59 = PLBackendGetLog();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          v60 = [(PLBackgroundJobWorker *)self workerName];
          v61 = (__CFString *)v111[5];
          *(_DWORD *)buf = 138543874;
          uint64_t v141 = (uint64_t)v60;
          __int16 v142 = 2112;
          v143 = v61;
          __int16 v144 = 2112;
          id v145 = v58;
          _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove destination marker file URL: %@, error: %@", buf, 0x20u);
        }
      }
    }
    uint64_t v24 = v107[3];
    goto LABEL_55;
  }
  v11 = PLBackendGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [(PLBackgroundJobWorker *)self workerName];
    v13 = (__CFString *)v123[5];
    *(_DWORD *)buf = 138543874;
    uint64_t v141 = (uint64_t)v12;
    __int16 v142 = 2114;
    v143 = v13;
    __int16 v144 = 2112;
    id v145 = v70;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ cleaning source resources for hidden or trashed asset %{public}@ after move: %@", buf, 0x20u);
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v14 = v70;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v90 objects:v149 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v91;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v91 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(__CFString **)(*((void *)&v90 + 1) + 8 * j);
        v19 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v89 = 0;
        char v20 = [v19 removeItemAtURL:v18 error:&v89];
        id v21 = v89;

        if ((v20 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
        {
          v22 = PLBackendGetLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = [(PLBackgroundJobWorker *)self workerName];
            *(_DWORD *)buf = 138543874;
            uint64_t v141 = (uint64_t)v23;
            __int16 v142 = 2112;
            v143 = v18;
            __int16 v144 = 2112;
            id v145 = v21;
            _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove source resource URL: %@, error: %@", buf, 0x20u);
          }
          v107[3] = 6;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v90 objects:v149 count:16];
    }
    while (v15);
  }

  uint64_t v24 = v107[3];
  if (v24 != 2) {
    goto LABEL_55;
  }
  v25 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v26 = v117[5];
  id v88 = 0;
  char v27 = [v25 removeItemAtURL:v26 error:&v88];
  id v28 = v88;

  if ((v27 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
  {
    v29 = PLBackendGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = [(PLBackgroundJobWorker *)self workerName];
      v31 = (__CFString *)v117[5];
      *(_DWORD *)buf = 138543874;
      uint64_t v141 = (uint64_t)v30;
      __int16 v142 = 2112;
      v143 = v31;
      __int16 v144 = 2112;
      id v145 = v28;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove source marker file URL: %@, error: %@", buf, 0x20u);
    }
    v107[3] = 6;
  }

  uint64_t v24 = v107[3];
  if (v24 != 2)
  {
LABEL_55:
    if (v24 == 5)
    {
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __78__PLBackgroundJobLockedResourceWorker_performWorkOnItem_inLibrary_completion___block_invoke_102;
      v77[3] = &unk_1E5873A50;
      id v78 = v69;
      id v79 = v74;
      v80 = self;
      [v78 performTransactionAndWait:v77];
    }
    goto LABEL_57;
  }
  v107[3] = 4;
LABEL_57:
  if (v129[5]) {
    +[PLClientServerTransaction removeTransactionFromUserInfo:self->_userInfo];
  }
  v62 = [v69 globalValues];
  [v62 setLockedResourceTransitionAssetUUID:0];
  v63 = PLBackendGetLog();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v64 = [(PLBackgroundJobWorker *)self workerName];
    v65 = (void *)v64;
    v66 = @"N";
    v67 = (void *)v107[3];
    if (v67 == (void *)4) {
      v66 = @"Y";
    }
    uint64_t v68 = v135[5];
    *(_DWORD *)buf = 138544130;
    uint64_t v141 = v64;
    __int16 v142 = 2114;
    v143 = v66;
    __int16 v144 = 2048;
    id v145 = v67;
    __int16 v146 = 2112;
    uint64_t v147 = v68;
    _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ finished with success: %{public}@, final state: %tu, error: %@", buf, 0x2Au);
  }
  v75[2](v75, (void *)v135[5]);

  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);

  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(&v122, 8);

  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v134, 8);

LABEL_64:
}

void __78__PLBackgroundJobLockedResourceWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v137 = 0;
  v4 = [v2 existingObjectWithID:v3 error:&v137];
  id v5 = v137;
  id v121 = v137;

  if (!v4)
  {
    v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 48) workerName];
      *(_DWORD *)buf = 138543618;
      id v139 = v7;
      __int16 v140 = 2112;
      id v141 = v121;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "%{public}@ failed fetch request, error: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v5);
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 3;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  unint64_t v9 = 0x1E4F28000uLL;
  if (!v8)
  {
    uint64_t v10 = [v4 bundleScope];
    v11 = [*(id *)(a1 + 32) pathManager];
    uint64_t v12 = +[PLLockedResourceTransferRecovery dontImportMarkerFileURLForAsset:v4 bundleScope:v10 pathManager:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    id v136 = 0;
    char v17 = [v15 removeItemAtURL:v16 error:&v136];
    id v18 = v136;
    id v19 = v136;

    if ((v17 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      char v20 = PLBackendGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = [*(id *)(a1 + 48) workerName];
        v22 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) path];
        *(_DWORD *)buf = 138543874;
        id v139 = v21;
        __int16 v140 = 2112;
        id v141 = v22;
        __int16 v142 = 2112;
        id v143 = v19;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "%{public}@ found dirty marker file in source bundle scope at path: '%@', failed to remove with error: %@", buf, 0x20u);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v18);
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 5;
    }

    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    if (v8)
    {
      unsigned int v124 = 5;
      unint64_t v9 = 0x1E4F28000uLL;
      goto LABEL_23;
    }
    uint64_t v23 = [v4 uuid];
    uint64_t v24 = *(void *)(*(void *)(a1 + 96) + 8);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    unsigned int v124 = [v4 expectedBundleScopeBasedOnAssetLockingProperties];
    unint64_t v9 = 0x1E4F28000uLL;
    if (v124 == [v4 bundleScope])
    {
      uint64_t v26 = PLBackendGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        char v27 = [*(id *)(a1 + 48) workerName];
        id v28 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        id v139 = v27;
        __int16 v140 = 2114;
        id v141 = v28;
        v29 = "%{public}@ no work required for asset %{public}@, bundle scope matches locked resource state";
        v30 = v26;
        uint32_t v31 = 22;
LABEL_20:
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
      }
    }
    else
    {
      if (![v4 deferredProcessingNeeded])
      {
        uint64_t v34 = 1;
        goto LABEL_22;
      }
      uint64_t v26 = PLBackendGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        char v27 = [*(id *)(a1 + 48) workerName];
        v32 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
        int v33 = [v4 deferredProcessingNeeded];
        *(_DWORD *)buf = 138543874;
        id v139 = v27;
        __int16 v140 = 2114;
        id v141 = v32;
        __int16 v142 = 1024;
        LODWORD(v143) = v33;
        v29 = "%{public}@ asset %{public}@ requires deferred processing (%hu), skipping";
        v30 = v26;
        uint32_t v31 = 28;
        goto LABEL_20;
      }
    }

    uint64_t v34 = 3;
LABEL_22:
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v34;
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    goto LABEL_23;
  }
  unsigned int v124 = 5;
LABEL_23:
  if (v8 == 1)
  {
    v35 = [*(id *)(a1 + 32) pathManager];
    uint64_t v36 = +[PLLockedResourceTransferRecovery dontImportMarkerFileURLForAsset:v4 bundleScope:v124 pathManager:v35];
    uint64_t v37 = *(void *)(*(void *)(a1 + 104) + 8);
    uint64_t v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;

    uint64_t v39 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v40 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) path];
    int v41 = [v39 fileExistsAtPath:v40];

    if (v41)
    {
      v42 = PLBackendGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = [*(id *)(a1 + 48) workerName];
        char v44 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) path];
        *(_DWORD *)buf = 138543618;
        id v139 = v43;
        __int16 v140 = 2112;
        id v141 = v44;
        _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "%{public}@ destination marker file already exists, bailing out, path: '%@'", buf, 0x16u);
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 5;
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != 1) {
    goto LABEL_82;
  }
  id v45 = PLBackendGetLog();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = [*(id *)(a1 + 48) workerName];
    v47 = [v4 uuid];
    *(_DWORD *)buf = 138543618;
    id v139 = v46;
    __int16 v140 = 2114;
    id v141 = v47;
    _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ cloning resources for hidden or trashed asset %{public}@", buf, 0x16u);
  }
  v123 = v4;

  v48 = [*(id *)(a1 + 32) globalValues];
  [v48 setLockedResourceTransitionAssetUUID:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
  uint64_t v49 = [MEMORY[0x1E4F1CAD0] setWithObject:@"PLTransactionScopeLockedResources"];
  char v50 = [*(id *)(a1 + 32) pathManager];
  uint64_t v51 = +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v49, v50, "-[PLBackgroundJobLockedResourceWorker performWorkOnItem:inLibrary:completion:]_block_invoke");
  uint64_t v52 = *(void *)(*(void *)(a1 + 112) + 8);
  v53 = *(void **)(v52 + 40);
  *(void *)(v52 + 40) = v51;

  +[PLClientServerTransaction addTransaction:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) toUserInfo:*(void *)(*(void *)(a1 + 48) + 112)];
  v54 = PLBackendGetLog();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    v55 = [*(id *)(a1 + 48) workerName];
    uint64_t v56 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) transactionToken];
    *(_DWORD *)buf = 138543618;
    id v139 = v55;
    __int16 v140 = 2112;
    id v141 = v56;
    _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEBUG, "%{public}@ started client server transaction with token: %@", buf, 0x16u);
  }
  char v57 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) URLByDeletingLastPathComponent];
  id v58 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v135 = 0;
  int v59 = [v58 createDirectoryAtURL:v57 withIntermediateDirectories:1 attributes:0 error:&v135];
  id v60 = v135;
  id v61 = v135;

  if (!v59)
  {
    id v70 = PLBackendGetLog();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      id v71 = [*(id *)(a1 + 48) workerName];
      [v57 path];
      id v73 = v72 = v48;
      *(_DWORD *)buf = 138543874;
      id v139 = v71;
      __int16 v140 = 2112;
      id v141 = v73;
      __int16 v142 = 2112;
      id v143 = v61;
      _os_log_impl(&dword_19B3C7000, v70, OS_LOG_TYPE_ERROR, "%{public}@ failed to create marker file directory: '%@', %@", buf, 0x20u);

      v48 = v72;
      unint64_t v9 = 0x1E4F28000;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v60);
    goto LABEL_44;
  }
  v62 = [MEMORY[0x1E4F28CB8] defaultManager];
  v63 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) path];
  char v64 = [v62 createFileAtPath:v63 contents:0 attributes:0];

  v65 = PLBackendGetLog();
  v66 = v65;
  if ((v64 & 1) == 0)
  {
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      id v74 = [*(id *)(a1 + 48) workerName];
      v75 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) path];
      *(_DWORD *)buf = 138543618;
      id v139 = v74;
      __int16 v140 = 2112;
      id v141 = v75;
      _os_log_impl(&dword_19B3C7000, v66, OS_LOG_TYPE_ERROR, "%{public}@ failed to create marker file: '%@'", buf, 0x16u);
    }
LABEL_44:
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 5;
    goto LABEL_45;
  }
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    v67 = [*(id *)(a1 + 48) workerName];
    uint64_t v68 = [v123 uuid];
    id v69 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) path];
    *(_DWORD *)buf = 138543874;
    id v139 = v67;
    __int16 v140 = 2114;
    id v141 = v68;
    __int16 v142 = 2112;
    id v143 = v69;
    _os_log_impl(&dword_19B3C7000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ wrote marker file for asset %{public}@, at path: '%@'", buf, 0x20u);
  }
LABEL_45:

  v4 = v123;
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 1)
  {
    int v76 = [v123 thumbnailIndex];
    if (v76 != -1 && v124 == 4)
    {
      uint64_t v77 = v76;
      id v78 = *(void **)(a1 + 48);
      id v79 = [*(id *)(a1 + 32) managedObjectContext];
      v80 = [*(id *)(a1 + 32) pathManager];
      [v78 _eraseTableThumbnailAtIndex:v77 managedObjectContext:v79 pathManager:v80];
    }
    id v81 = [*(id *)(v9 + 3256) defaultManager];
    id v82 = [v123 fileURLForThumbnailFile];
    id v134 = 0;
    char v83 = [v81 removeItemAtURL:v82 error:&v134];
    id v84 = v134;

    if ((v83 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      long long v85 = PLBackendGetLog();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        long long v86 = [*(id *)(a1 + 48) workerName];
        long long v87 = [v123 fileURLForThumbnailFile];
        id v88 = [v87 path];
        *(_DWORD *)buf = 138543874;
        id v139 = v86;
        __int16 v140 = 2112;
        id v141 = v88;
        __int16 v142 = 2112;
        id v143 = v84;
        _os_log_impl(&dword_19B3C7000, v85, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove file at path: '%@', error: %@", buf, 0x20u);
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 5;
    }

    [v123 allFileBackedResources];
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v89 = [obj countByEnumeratingWithState:&v130 objects:v146 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v131;
      while (2)
      {
        for (uint64_t i = 0; i != v90; ++i)
        {
          if (*(void *)v131 != v91) {
            objc_enumerationMutation(obj);
          }
          uint64_t v93 = *(void *)(*((void *)&v130 + 1) + 8 * i);
          v94 = *(void **)(a1 + 48);
          id v95 = [*(id *)(a1 + 32) pathManager];
          id v128 = 0;
          id v129 = 0;
          id v127 = 0;
          LOBYTE(v93) = [v94 _cloneResource:v93 asset:v4 destinationBundleScope:v124 pathManager:v95 sourceURL:&v129 destinationURL:&v128 error:&v127];
          id v96 = v129;
          id v97 = v128;
          id v98 = v127;

          if ((v93 & 1) == 0)
          {
            id v99 = PLBackendGetLog();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              v100 = [*(id *)(a1 + 48) workerName];
              *(_DWORD *)buf = 138543618;
              id v139 = v100;
              __int16 v140 = 2112;
              id v141 = v98;
              _os_log_impl(&dword_19B3C7000, v99, OS_LOG_TYPE_ERROR, "%{public}@ failed to clone resource with error: %@", buf, 0x16u);
            }
            uint64_t v101 = *(void *)(*(void *)(a1 + 72) + 8);
            v102 = *(void **)(v101 + 40);
            *(void *)(v101 + 40) = v98;
            id v103 = v98;

            *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 5;
            v4 = v123;
            goto LABEL_70;
          }
          if (v96) {
            [*(id *)(a1 + 56) addObject:v96];
          }
          if (v97) {
            [*(id *)(a1 + 64) addObject:v97];
          }

          v4 = v123;
        }
        uint64_t v90 = [obj countByEnumeratingWithState:&v130 objects:v146 count:16];
        if (v90) {
          continue;
        }
        break;
      }
    }
LABEL_70:

    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 1)
    {
      v104 = (void *)MEMORY[0x1E4F8B908];
      uint64_t v105 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      uint64_t v106 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      v107 = [*(id *)(a1 + 32) pathManager];
      uint64_t v108 = [v107 capabilities];
      id v126 = 0;
      LOBYTE(v104) = [v104 secureMoveItemAtURL:v105 toURL:v106 capabilities:v108 error:&v126];
      id v109 = v126;
      id v110 = v126;

      if ((v104 & 1) == 0)
      {
        v111 = PLBackendGetLog();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
        {
          uint64_t v112 = [*(id *)(a1 + 48) workerName];
          v113 = [v4 uuid];
          v114 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) path];
          *(_DWORD *)buf = 138544130;
          id v139 = v112;
          __int16 v140 = 2114;
          id v141 = v113;
          __int16 v142 = 2112;
          id v143 = v114;
          __int16 v144 = 2112;
          id v145 = v110;
          _os_log_impl(&dword_19B3C7000, v111, OS_LOG_TYPE_ERROR, "%{public}@ move marker file for asset: %{public}@, path: '%@', error: %@", buf, 0x2Au);

          v4 = v123;
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v109);
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 5;
      }

      if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 1)
      {
        uint64_t v115 = *(void *)(a1 + 32);
        id v125 = 0;
        BOOL v116 = +[PLLockedResourceTransferRecovery updateAssetPropertiesAndSaveForAsset:v4 moveToDestinationScope:v124 library:v115 error:&v125];
        id v117 = v125;
        if (v116)
        {
          uint64_t v118 = 2;
        }
        else
        {
          v119 = PLBackendGetLog();
          if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
          {
            v120 = [*(id *)(a1 + 48) workerName];
            *(_DWORD *)buf = 138543618;
            id v139 = v120;
            __int16 v140 = 2112;
            id v141 = v117;
            _os_log_impl(&dword_19B3C7000, v119, OS_LOG_TYPE_ERROR, "%{public}@ failed to update asset with error: %@", buf, 0x16u);
          }
          uint64_t v118 = 5;
        }
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v118;
      }
    }
  }
LABEL_82:
}

void __78__PLBackgroundJobLockedResourceWorker_performWorkOnItem_inLibrary_completion___block_invoke_102(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  v4 = [v2 existingObjectWithID:v3 error:&v8];
  id v5 = v8;

  if (v4)
  {
    [v4 setDeferredProcessingNeeded:11];
  }
  else
  {
    v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 48) workerName];
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "%{public}@ failed fetch request, error: %@", buf, 0x16u);
    }
  }
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__37440;
    id v19 = __Block_byref_object_dispose__37441;
    id v20 = 0;
    id v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = [(PLBackgroundJobWorker *)self workerName];
      *(_DWORD *)buf = 138543618;
      v22 = v6;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ running on library: %@", buf, 0x16u);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__PLBackgroundJobLockedResourceWorker_workItemsNeedingProcessingInLibrary___block_invoke;
    v11[3] = &unk_1E5875340;
    id v12 = v4;
    uint64_t v13 = self;
    id v14 = &v15;
    [v12 performBlockAndWait:v11];
    id v7 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    id v8 = +[PLBackgroundJobCriteria criteriaForUrgentResourceWorker];
    unint64_t v9 = [(PLBackgroundJobWorkerPendingWorkItems *)v7 initWithCriteria:v8 workItemsNeedingProcessing:v16[5]];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    unint64_t v9 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
  }

  return v9;
}

void __75__PLBackgroundJobLockedResourceWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  v52[3] = *MEMORY[0x1E4F143B8];
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = (void *)MEMORY[0x1E4F28BA0];
  v2 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES", @"hidden");
  v52[0] = v2;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"trashedState", 1);
  v52[1] = v3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"trashedState", 2);
  v52[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
  v6 = [v1 orPredicateWithSubpredicates:v5];

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"bundleScope", 0);
  id v8 = (void *)MEMORY[0x1E4F28BA0];
  v51[0] = v6;
  v51[1] = v7;
  v43 = (void *)v7;
  unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  uint64_t v10 = [v8 andPredicateWithSubpredicates:v9];

  __int16 v11 = (void *)MEMORY[0x1E4F28BA0];
  id v12 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v6];
  v50[0] = v12;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"bundleScope", 4);
  v50[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  uint64_t v15 = [v11 andPredicateWithSubpredicates:v14];

  uint64_t v16 = (void *)MEMORY[0x1E4F28BA0];
  v42 = (void *)v10;
  v49[0] = v10;
  v49[1] = v15;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  id v18 = [v16 orPredicateWithSubpredicates:v17];

  [v40 addObject:v18];
  id v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d && %K == %d", @"deferredProcessingNeeded", 0, @"videoDeferredProcessingNeeded", 0);
  [v40 addObject:v19];
  if ([*(id *)(a1 + 32) isCloudPhotoLibraryEnabled])
  {
    id v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"cloudLocalState", 0);
    [v40 addObject:v20];
  }
  id v21 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForAssetsAllowingLockedResourceTransfer"), 0);
  [v40 addObject:v21];
  v22 = (void *)MEMORY[0x1E4F1C0D0];
  __int16 v23 = +[PLManagedAsset entityName];
  id v24 = [v22 fetchRequestWithEntityName:v23];

  uint64_t v25 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v40];
  [v24 setPredicate:v25];

  [v24 setFetchLimit:100];
  [v24 setResultType:1];
  uint64_t v26 = PLBackendGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    char v27 = [*(id *)(a1 + 40) workerName];
    id v28 = [v24 predicate];
    *(_DWORD *)buf = 138543618;
    v46 = v27;
    __int16 v47 = 2112;
    uint64_t v48 = (uint64_t)v28;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "%{public}@ fetching work items with predicate: %@", buf, 0x16u);
  }
  v29 = [*(id *)(a1 + 32) managedObjectContext];
  id v44 = 0;
  uint64_t v30 = [v29 executeFetchRequest:v24 error:&v44];
  id v31 = v44;
  uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
  int v33 = *(void **)(v32 + 40);
  *(void *)(v32 + 40) = v30;

  uint64_t v34 = PLBackendGetLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v35 = [*(id *)(a1 + 40) workerName];
    uint64_t v36 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    *(_DWORD *)buf = 138543618;
    v46 = v35;
    __int16 v47 = 2048;
    uint64_t v48 = v36;
    _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEBUG, "%{public}@ found %td results", buf, 0x16u);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v37 = PLBackendGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      [*(id *)(a1 + 40) workerName];
      v39 = uint64_t v38 = v15;
      *(_DWORD *)buf = 138543618;
      v46 = v39;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v31;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "%{public}@ failed fetch request, error: %@", buf, 0x16u);

      uint64_t v15 = v38;
    }
  }
}

- (BOOL)isInterruptible
{
  return 0;
}

- (BOOL)_cloneResource:(id)a3 asset:(id)a4 destinationBundleScope:(unsigned __int16)a5 pathManager:(id)a6 sourceURL:(id *)a7 destinationURL:(id *)a8 error:(id *)a9
{
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v14 cplType];
  uint64_t v16 = [v14 version];
  uint64_t v17 = [v14 recipeID];
  uint64_t v18 = [v14 resourceType];
  id v19 = [v14 uniformTypeIdentifier];

  id v20 = [v19 identifier];
  LOWORD(v22) = a5;
  LOBYTE(v18) = [(PLBackgroundJobLockedResourceWorker *)self _cloneResourceWithCPLResourceType:v15 version:v16 recipeID:v17 resourceType:v18 utiString:v20 asset:v13 destinationBundleScope:v22 pathManager:v12 sourceURL:a7 destinationURL:a8 error:a9];

  return v18;
}

- (BOOL)_cloneResourceWithCPLResourceType:(unint64_t)a3 version:(unsigned int)a4 recipeID:(unsigned int)a5 resourceType:(unsigned int)a6 utiString:(id)a7 asset:(id)a8 destinationBundleScope:(unsigned __int16)a9 pathManager:(id)a10 sourceURL:(id *)a11 destinationURL:(id *)a12 error:(id *)a13
{
  uint64_t v14 = *(void *)&a5;
  uint64_t v15 = *(void *)&a4;
  id v19 = a7;
  id v20 = a8;
  id v31 = a10;
  if ([v20 bundleScope] != 4 && objc_msgSend(v20, "bundleScope"))
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLBackgroundJobLockedResourceWorker.m", 103, @"Invalid parameter not satisfying: %@", @"asset.bundleScope == PLBundleScopeLocked || asset.bundleScope == PLBundleScopeMain" object file lineNumber description];
  }
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  char v69 = 1;
  uint64_t v60 = 0;
  id v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__37440;
  char v64 = __Block_byref_object_dispose__37441;
  id v65 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  char v57 = __Block_byref_object_copy__37440;
  id v58 = __Block_byref_object_dispose__37441;
  id v59 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy__37440;
  uint64_t v52 = __Block_byref_object_dispose__37441;
  id v53 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  v47[3] = 0;
  id v21 = objc_opt_class();
  __int16 v22 = [v20 bundleScope];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __185__PLBackgroundJobLockedResourceWorker__cloneResourceWithCPLResourceType_version_recipeID_resourceType_utiString_asset_destinationBundleScope_pathManager_sourceURL_destinationURL_error___block_invoke;
  v33[3] = &unk_1E58693A8;
  uint64_t v37 = &v66;
  uint64_t v38 = &v60;
  v33[4] = self;
  id v23 = v20;
  id v34 = v23;
  unint64_t v42 = a3;
  int v43 = v15;
  int v44 = v14;
  unsigned int v45 = a6;
  id v24 = v19;
  id v35 = v24;
  unsigned __int16 v46 = a9;
  id v25 = v31;
  id v36 = v25;
  uint64_t v39 = &v54;
  id v40 = &v48;
  int v41 = v47;
  LOBYTE(v30) = 1;
  LOWORD(v29) = v22;
  [v21 _accessFileForAsset:v23 cplResourceType:a3 version:v15 recipeID:v14 resourceType:a6 utiString:v24 bundleScope:v29 pathManager:v25 mode:v30 handler:v33];
  if (!*((unsigned char *)v67 + 24) && a13) {
    *a13 = (id) v61[5];
  }
  if (a11) {
    *a11 = (id) v55[5];
  }
  if (a12) {
    *a12 = (id) v49[5];
  }
  char v26 = *((unsigned char *)v67 + 24);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  _Block_object_dispose(&v66, 8);
  return v26;
}

void __185__PLBackgroundJobLockedResourceWorker__cloneResourceWithCPLResourceType_version_recipeID_resourceType_utiString_asset_destinationBundleScope_pathManager_sourceURL_destinationURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v20 = *(void *)(a1 + 104);
    id v21 = (void *)v7;
    uint64_t v8 = *(unsigned int *)(a1 + 116);
    unsigned int v19 = *(_DWORD *)(a1 + 112);
    uint64_t v9 = *(unsigned int *)(a1 + 120);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    __int16 v12 = *(_WORD *)(a1 + 124);
    uint64_t v13 = *(void *)(a1 + 56);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __185__PLBackgroundJobLockedResourceWorker__cloneResourceWithCPLResourceType_version_recipeID_resourceType_utiString_asset_destinationBundleScope_pathManager_sourceURL_destinationURL_error___block_invoke_2;
    v22[3] = &unk_1E5869380;
    long long v26 = *(_OWORD *)(a1 + 64);
    id v14 = v5;
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(a1 + 40);
    id v23 = v14;
    uint64_t v24 = v15;
    id v25 = v16;
    long long v27 = *(_OWORD *)(a1 + 80);
    uint64_t v28 = *(void *)(a1 + 96);
    LOBYTE(v18) = 2;
    LOWORD(v17) = v12;
    [v21 _accessFileForAsset:v10 cplResourceType:v20 version:v19 recipeID:v8 resourceType:v9 utiString:v11 bundleScope:v17 pathManager:v13 mode:v18 handler:v22];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  }
}

void __185__PLBackgroundJobLockedResourceWorker__cloneResourceWithCPLResourceType_version_recipeID_resourceType_utiString_asset_destinationBundleScope_pathManager_sourceURL_destinationURL_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if ([v5 isEqual:*(void *)(a1 + 32)])
    {
      uint64_t v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = [*(id *)(a1 + 40) workerName];
        uint64_t v9 = [*(id *)(a1 + 48) uuid];
        uint64_t v10 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v54 = v8;
        __int16 v55 = 2114;
        id v56 = v9;
        __int16 v57 = 2112;
        id v58 = v10;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "%{public}@ source and destination URLs are equal for asset: %{public}@ at URL: %@", buf, 0x20u);
      }
      goto LABEL_34;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 32));
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      id v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v54 = v13;
      __int16 v55 = 2112;
      id v56 = v14;
      __int16 v57 = 2112;
      id v58 = v5;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to copy resource from URL: %@ to URL: %@", buf, 0x20u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v16 = [v5 URLByDeletingLastPathComponent];
    id v52 = 0;
    int v17 = [v15 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v52];
    uint64_t v18 = v52;

    if (v17)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v51 = v18;
      int v20 = [MEMORY[0x1E4F8B908] copyItemAtURL:v19 toURL:v5 error:&v51];
      uint64_t v7 = v51;

      if (v20)
      {
LABEL_10:
        uint64_t v21 = *(void *)(*(void *)(a1 + 80) + 8);
        __int16 v22 = v5;
LABEL_20:
        id v31 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v22;
LABEL_21:

        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          char v48 = 0;
          uint64_t v47 = -1;
          uint64_t v32 = [*(id *)(a1 + 32) path];
          id v46 = 0;
          BOOL v33 = +[PLCacheDeleteSupport isPurgeableFile:v32 outIsPhotoType:&v48 outUrgencyLevel:&v47 error:&v46];
          id v34 = v46;

          if (v33)
          {
            if (!v48)
            {
              id v35 = PLBackendGetLog();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                id v36 = [*(id *)(a1 + 40) workerName];
                uint64_t v37 = [*(id *)(a1 + 48) uuid];
                uint64_t v38 = *(void **)(a1 + 32);
                *(_DWORD *)buf = 138543874;
                uint64_t v54 = v36;
                __int16 v55 = 2114;
                id v56 = v37;
                __int16 v57 = 2112;
                id v58 = v38;
                _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "%{public}@ found non-photos purgeable file belonging to asset: %{public}@ at URL: %@", buf, 0x20u);
              }
            }
            uint64_t v39 = *(void *)(*(void *)(a1 + 88) + 8) + 24;
            id v45 = v34;
            BOOL v40 = +[PLCacheDeleteSupport markPurgeableForFileAtURL:v5 withUrgency:v47 outInode:v39 error:&v45];
            id v41 = v45;

            if (v40) {
              goto LABEL_33;
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
            uint64_t v42 = *(void *)(*(void *)(a1 + 64) + 8);
            id v43 = v41;
          }
          else
          {
            if (!v34)
            {
              id v41 = 0;
              goto LABEL_33;
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
            uint64_t v42 = *(void *)(*(void *)(a1 + 64) + 8);
            id v43 = v34;
          }
          id v41 = v43;
          int v44 = *(void **)(v42 + 40);
          *(void *)(v42 + 40) = v43;

LABEL_33:
        }
LABEL_34:

        goto LABEL_35;
      }
      if (!PLIsErrorOrUnderlyingErrorFileExists())
      {
        if (PLIsErrorFileNotFound()) {
          goto LABEL_34;
        }
        goto LABEL_19;
      }
      id v23 = PLBackendGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = (objc_class *)objc_opt_class();
        id v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 138543618;
        uint64_t v54 = v25;
        __int16 v55 = 2112;
        id v56 = v5;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "%{public}@ file already exists, removing item and trying again, at URL: %@", buf, 0x16u);
      }
      long long v26 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v50 = v7;
      int v27 = [v26 removeItemAtURL:v5 error:&v50];
      uint64_t v18 = v50;

      if (v27)
      {
        uint64_t v28 = *(void *)(a1 + 32);
        uint64_t v49 = v18;
        int v29 = [MEMORY[0x1E4F8B908] copyItemAtURL:v28 toURL:v5 error:&v49];
        uint64_t v7 = v49;

        if (v29) {
          goto LABEL_10;
        }
LABEL_19:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
        __int16 v22 = v7;
        uint64_t v7 = v22;
        goto LABEL_20;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = v18;
    id v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v7;
    goto LABEL_21;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
LABEL_35:
}

- (BOOL)_eraseTableThumbnailAtIndex:(int64_t)a3 managedObjectContext:(id)a4 pathManager:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (!self->_thumbnailManager)
  {
    uint64_t v9 = [PLThumbnailManager alloc];
    uint64_t v10 = [v7 persistentStoreCoordinator];
    uint64_t v11 = [v10 persistentStores];
    __int16 v12 = [v11 firstObject];
    uint64_t v13 = [(PLThumbnailManager *)v9 initWithPhotoLibraryPathManager:v8 storeFromMigration:v12];
    thumbnailManager = self->_thumbnailManager;
    self->_thumbnailManager = v13;
  }
  uint64_t v28 = v7;
  char v15 = 1;
  uint64_t v16 = +[PLThumbnailManagerCore thumbnailFormatIDsForConfigPhase:withPathManager:](PLThumbnailManager, "thumbnailFormatIDsForConfigPhase:withPathManager:", 1, v8, v8);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    char v15 = 1;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (unsigned __int16)[*(id *)(*((void *)&v30 + 1) + 8 * i) intValue];
        __int16 v22 = [MEMORY[0x1E4F8B938] formatWithID:v21];
        if ([v22 isTable])
        {
          id v23 = [(PLThumbnailManager *)self->_thumbnailManager imageTableForFormat:v21];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v23 deleteEntryAtIndex:a3] & 1) == 0)
          {
            uint64_t v24 = PLBackendGetLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              id v25 = [(PLBackgroundJobWorker *)self workerName];
              *(_DWORD *)buf = 134218242;
              int64_t v35 = a3;
              __int16 v36 = 2114;
              uint64_t v37 = v25;
              _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Failed to overwrite thumbnail table at index: %td for %{public}@", buf, 0x16u);
            }
            char v15 = 0;
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v18);
  }

  return v15 & 1;
}

- (PLBackgroundJobLockedResourceWorker)initWithLibraryBundle:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLBackgroundJobLockedResourceWorker;
  uint64_t v3 = [(PLBackgroundJobWorker *)&v7 initWithLibraryBundle:a3];
  if (v3)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userInfo = v3->_userInfo;
    v3->_userInfo = v4;
  }
  return v3;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return ((unint64_t)a3 < 4) & (3u >> (a3 & 0xF));
}

+ (void)recoverFromInterruptedJobWithLibrary:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 globalValues];
  id v6 = [v5 lockedResourceTransitionAssetUUID];

  objc_super v7 = PLBackendGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker attempting to recover from interrupted job for asset: %{public}@", buf, 0xCu);
  }

  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__PLBackgroundJobLockedResourceWorker_recoverFromInterruptedJobWithLibrary___block_invoke;
    v9[3] = &unk_1E5875E40;
    uint64_t v10 = v6;
    id v11 = v4;
    id v12 = a1;
    [v11 performBlockAndWait:v9];

    id v8 = v10;
  }
  else
  {
    id v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "LockedResourceWorker recover was called, but no recovery asset uuid found in global values", buf, 2u);
    }
  }
}

void __76__PLBackgroundJobLockedResourceWorker_recoverFromInterruptedJobWithLibrary___block_invoke(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLManagedAsset entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uuid", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v70 = 0;
  objc_super v7 = [v6 executeFetchRequest:v4 error:&v70];
  id v8 = v70;

  if (!v7)
  {
    uint64_t v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v72 = v20;
      __int16 v73 = 2112;
      id v74 = v8;
      uint64_t v21 = "LockedResourceWorker failed to fetch asset %{public}@, error: %@";
      __int16 v22 = v19;
      uint32_t v23 = 22;
LABEL_12:
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    }
LABEL_13:
    id v25 = 0;
    unint64_t v13 = 0;
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  if (![v7 count])
  {
    uint64_t v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v72 = v24;
      uint64_t v21 = "LockedResourceWorker failed to find asset with UUID %{public}@";
      __int16 v22 = v19;
      uint32_t v23 = 12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v9 = [v7 firstObject];
  if ([v9 bundleScope] && objc_msgSend(v9, "bundleScope") != 4)
  {
    uint64_t v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = *(NSObject **)(a1 + 32);
      int v43 = [v9 bundleScope];
      *(_DWORD *)buf = 138543618;
      v72 = v42;
      __int16 v73 = 1024;
      LODWORD(v74) = v43;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "LockedResourceWorker asked to repair asset (%{public}@) with invalid bundle scope: %hu", buf, 0x12u);
    }
    id v25 = 0;
    unint64_t v13 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = *(void **)(a1 + 48);
  id v11 = [*(id *)(a1 + 40) pathManager];
  id v68 = 0;
  id v69 = 0;
  int v12 = [v10 _isRecoveringFromTransferForAsset:v9 pathManager:v11 mainMarkerURLIfExists:&v69 lockedMarkerURLIfExists:&v68];
  unint64_t v13 = (unint64_t)v69;
  unint64_t v14 = (unint64_t)v68;

  uint64_t v15 = PLBackendGetLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v16) {
      goto LABEL_19;
    }
    uint64_t v17 = *(NSObject **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v72 = v17;
    uint64_t v18 = "LockedResourceWorker fixing interrupted transfer for asset: %{public}@";
  }
  else
  {
    if (!v16) {
      goto LABEL_19;
    }
    uint64_t v28 = *(NSObject **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v72 = v28;
    uint64_t v18 = "LockedResourceWorker did not find marker file for asset: %{public}@";
  }
  _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
LABEL_19:

  if (v13 && v14)
  {
    uint64_t v60 = v4;
    id v61 = v8;
    v63 = v14;
    int v29 = PLBackendGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      long long v30 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v72 = v30;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker found main and locked marker files for interrupted transfer asset: %{public}@", buf, 0xCu);
    }

    int v31 = [v9 bundleScope];
    long long v32 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v33 = v32;
    unint64_t v34 = v13;
    if (v31) {
      int64_t v35 = v13;
    }
    else {
      int64_t v35 = v63;
    }
    id v67 = 0;
    int v36 = [v32 removeItemAtURL:v35 error:&v67];
    uint64_t v19 = v67;

    if (!v36)
    {
      id v46 = PLBackendGetLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v72 = v35;
        __int16 v73 = 2112;
        id v74 = v19;
        _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed to remove marker file URL: %@, error: %@", buf, 0x16u);
      }

      id v8 = v61;
      id v25 = v63;
      id v4 = v60;
      goto LABEL_14;
    }
    if (v31)
    {
      unint64_t v34 = 0;
      unint64_t v14 = (unint64_t)v63;
    }
    else
    {
      unint64_t v14 = 0;
    }

    id v8 = v61;
    unint64_t v13 = v34;
    id v4 = v60;
  }
  if (!(v13 | v14))
  {
    id v25 = 0;
LABEL_40:
    int v44 = PLBackendGetLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      id v45 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v72 = v45;
      _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker successfully repaired interrupted transfer asset: %{public}@", buf, 0xCu);
    }

    long long v26 = [*(id *)(a1 + 40) globalValues];
    [v26 setLockedResourceTransitionAssetUUID:0];
    goto LABEL_43;
  }
  uint64_t v37 = PLBackendGetLog();
  BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
  char v64 = v14;
  if (v13)
  {
    if (v38)
    {
      uint64_t v39 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v72 = v39;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker found main marker file for interrupted transfer asset: %{public}@", buf, 0xCu);
    }
    uint64_t v40 = 0;
    uint64_t v41 = 4;
  }
  else
  {
    if (v38)
    {
      uint64_t v47 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v72 = v47;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker found locked marker file for interrupted transfer asset: %{public}@", buf, 0xCu);
    }
    uint64_t v41 = 0;
    uint64_t v40 = 4;
  }

  if ([v9 bundleScope] != v41)
  {
    uint64_t v48 = *(void *)(a1 + 40);
    id v66 = 0;
    BOOL v49 = +[PLLockedResourceTransferRecovery updateAssetPropertiesAndSaveForAsset:v9 moveToDestinationScope:v41 library:v48 error:&v66];
    uint64_t v50 = v66;
    uint64_t v19 = v50;
    if (!v49)
    {
      id v58 = PLBackendGetLog();
      id v25 = v64;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v19;
        _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed to update asset with error: %@", buf, 0xCu);
      }

      goto LABEL_14;
    }
  }
  uint64_t v62 = v8;
  uint64_t v51 = *(void **)(a1 + 48);
  id v52 = [*(id *)(a1 + 40) pathManager];
  LOBYTE(v51) = [v51 _removeFilesForAsset:v9 inBundleScope:v40 pathManager:v52];

  if (v51)
  {
    id v25 = v64;
    if (v13) {
      id v53 = (void *)v13;
    }
    else {
      id v53 = v64;
    }
    uint64_t v19 = v53;
    uint64_t v54 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v65 = 0;
    char v55 = [v54 removeItemAtURL:v19 error:&v65];
    id v56 = v65;

    if (v55)
    {

      id v8 = v62;
      goto LABEL_40;
    }
    uint64_t v59 = PLBackendGetLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v72 = v19;
      __int16 v73 = 2112;
      id v74 = v56;
      _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed to remove marker file URL: %@, error: %@", buf, 0x16u);
    }

    id v8 = v62;
    id v25 = v64;
  }
  else
  {
    uint64_t v19 = PLBackendGetLog();
    id v25 = v64;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v57 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v72 = v57;
      __int16 v73 = 1024;
      LODWORD(v74) = v40;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed to remove all resource files for asset: %{public}@, bundle scope: %hu", buf, 0x12u);
    }
    id v8 = v62;
  }
LABEL_14:

  long long v26 = PLBackendGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    int v27 = *(NSObject **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v72 = v27;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed repair interrupted transfer asset: %{public}@", buf, 0xCu);
  }
LABEL_43:
}

+ (BOOL)_removeFilesForAsset:(id)a3 inBundleScope:(unsigned __int16)a4 pathManager:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  [v7 allFileBackedResources];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v27;
    char v23 = 1;
    *(void *)&long long v10 = 138412802;
    long long v22 = v10;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        unint64_t v14 = +[PLLockedResourceTransferRecovery destinationURLForResource:asset:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "destinationURLForResource:asset:bundleScope:pathManager:", *(void *)(*((void *)&v26 + 1) + 8 * i), v7, v6, v8, v22);
        uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v25 = 0;
        char v16 = [v15 removeItemAtURL:v14 error:&v25];
        id v17 = v25;

        if (v16)
        {
          uint64_t v18 = PLBackendGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [v7 uuid];
            *(_DWORD *)buf = 138543618;
            int v31 = v19;
            __int16 v32 = 2112;
            long long v33 = v14;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "LockedResourceWorker successfully cleaned up orphan file for asset: %{public}@, url: %@", buf, 0x16u);
          }
        }
        else
        {
          if (PLIsErrorFileNotFound()) {
            goto LABEL_14;
          }
          uint64_t v18 = PLBackendGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            int v20 = [v7 uuid];
            *(_DWORD *)buf = v22;
            int v31 = v14;
            __int16 v32 = 2114;
            long long v33 = v20;
            __int16 v34 = 2112;
            id v35 = v17;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "LockedResourceWorker failed to remove file at URL: %@, for asset: %{public}@, error: %@", buf, 0x20u);
          }
          char v23 = 0;
        }

LABEL_14:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (!v11) {
        goto LABEL_18;
      }
    }
  }
  char v23 = 1;
LABEL_18:

  return v23 & 1;
}

+ (BOOL)_isRecoveringFromTransferForAsset:(id)a3 pathManager:(id)a4 mainMarkerURLIfExists:(id *)a5 lockedMarkerURLIfExists:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = +[PLLockedResourceTransferRecovery dontImportMarkerFileURLForAsset:v10 bundleScope:0 pathManager:v9];
  uint64_t v12 = +[PLLockedResourceTransferRecovery dontImportMarkerFileURLForAsset:v10 bundleScope:4 pathManager:v9];

  unint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v14 = [(id)v11 path];
  char v15 = [v13 fileExistsAtPath:v14];

  if ((v15 & 1) == 0)
  {

    uint64_t v11 = 0;
  }
  char v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v17 = [(id)v12 path];
  char v18 = [v16 fileExistsAtPath:v17];

  if ((v18 & 1) == 0)
  {

    uint64_t v12 = 0;
  }
  if (a5) {
    *a5 = (id) v11;
  }
  if (a6) {
    *a6 = (id) v12;
  }

  return (v11 | v12) != 0;
}

+ (void)_accessFileForAsset:(id)a3 cplResourceType:(unint64_t)a4 version:(unsigned int)a5 recipeID:(unsigned int)a6 resourceType:(unsigned int)a7 utiString:(id)a8 bundleScope:(unsigned __int16)a9 pathManager:(id)a10 mode:(unsigned __int8)a11 handler:(id)a12
{
  uint64_t v13 = *(void *)&a7;
  uint64_t v14 = *(void *)&a6;
  uint64_t v15 = *(void *)&a5;
  v40[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a8;
  id v19 = a10;
  id v20 = a12;
  if ([v19 shouldUseFileIdentifierForBundleScope:a9])
  {
    int v36 = v19;
    uint64_t v21 = v14;
    uint64_t v22 = v13;
    char v23 = v20;
    id v24 = v18;
    id v25 = objc_alloc(MEMORY[0x1E4F8B978]);
    long long v26 = [v17 uuid];
    long long v27 = [v17 originalFilename];
    long long v28 = v25;
    id v18 = v24;
    id v20 = v23;
    uint64_t v29 = v21;
    id v19 = v36;
    long long v30 = (void *)[v28 initWithAssetUuid:v26 bundleScope:a9 uti:v18 resourceVersion:v15 resourceType:v22 recipeID:v29 originalFilename:v27];

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __152__PLBackgroundJobLockedResourceWorker__accessFileForAsset_cplResourceType_version_recipeID_resourceType_utiString_bundleScope_pathManager_mode_handler___block_invoke;
    v37[3] = &unk_1E5870C80;
    id v38 = v23;
    [v36 obtainAccessAndWaitWithFileWithIdentifier:v30 mode:a11 toURLWithHandler:v37];
    int v31 = v38;
  }
  else
  {
    LOWORD(v35) = a9;
    int v31 = +[PLLockedResourceTransferRecovery dcimFileURLForAsset:v17 cplResourceType:a4 version:v15 recipeID:v14 resourceType:v13 utiString:v18 bundleScope:v35 pathManager:v19];
    if (v31)
    {
      long long v30 = 0;
    }
    else
    {
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v33 = *MEMORY[0x1E4F8C500];
      uint64_t v39 = *MEMORY[0x1E4F28228];
      v40[0] = @"nil dcim url";
      __int16 v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
      long long v30 = (void *)[v32 initWithDomain:v33 code:46309 userInfo:v34];
    }
    (*((void (**)(id, void *, void *))v20 + 2))(v20, v31, v30);
  }
}

uint64_t __152__PLBackgroundJobLockedResourceWorker__accessFileForAsset_cplResourceType_version_recipeID_resourceType_utiString_bundleScope_pathManager_mode_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end