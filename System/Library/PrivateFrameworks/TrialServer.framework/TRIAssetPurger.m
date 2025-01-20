@interface TRIAssetPurger
- (TRIAssetPurger)initWithPaths:(id)a3 assetStore:(id)a4 purgeableNamespacesProvider:(id)a5 purgeableFactorPacksEnumerator:(id)a6 purgeableExperimentAndRolloutProvider:(id)a7 taskQueue:(id)a8 loggingClient:(id)a9;
- (unint64_t)purgeAssetsForPurgeabilityLevel:(int)a3 requestedPurgeAmount:(int64_t)a4;
- (unint64_t)purgeableAssetSizeForPurgeabilityLevel:(int)a3;
- (void)_enumeratePurgeCandidatesForPurgeableConstructs:(id)a3 block:(id)a4;
- (void)_logDeactivationsMetricWithConcludedInTime:(BOOL)a3;
- (void)_logPurgedAssetWithFactorNames:(id)a3 namespaceName:(id)a4 purgeabilityLevel:(int)a5;
@end

@implementation TRIAssetPurger

- (TRIAssetPurger)initWithPaths:(id)a3 assetStore:(id)a4 purgeableNamespacesProvider:(id)a5 purgeableFactorPacksEnumerator:(id)a6 purgeableExperimentAndRolloutProvider:(id)a7 taskQueue:(id)a8 loggingClient:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)TRIAssetPurger;
  v18 = [(TRIAssetPurger *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_paths, a3);
    objc_storeStrong((id *)&v19->_assetStore, a4);
    objc_storeStrong((id *)&v19->_purgeableNamespacesProvider, a5);
    objc_storeStrong((id *)&v19->_purgeableFactorPacksEnumerator, a6);
    objc_storeStrong((id *)&v19->_purgeableExperimentAndRolloutProvider, a7);
    objc_storeStrong((id *)&v19->_taskQueue, a8);
    objc_storeStrong((id *)&v19->_loggingClient, a9);
  }

  return v19;
}

- (unint64_t)purgeableAssetSizeForPurgeabilityLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = objc_opt_new();
  v6 = [[TRIPurgeableConstructs alloc] initWithPurgeabilityLevel:v3 purgeableNamespacesProvider:self->_purgeableNamespacesProvider paths:self->_paths];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke;
  v32[3] = &unk_1E6BB80C8;
  id v7 = v5;
  id v33 = v7;
  v8 = (void *)MEMORY[0x1E016EA80](v32);
  [(TRIAssetPurger *)self _enumeratePurgeCandidatesForPurgeableConstructs:v6 block:v8];
  v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Looking for regular purgeable factors.", buf, 2u);
  }

  purgeableExperimentAndRolloutProvider = self->_purgeableExperimentAndRolloutProvider;
  v11 = [(TRIPurgeableConstructs *)v6 namespaceNamesPurgeableAtNamespaceLevel];
  v12 = [(TRIPurgeableConstructs *)v6 eagerPurgeableFactorsByNamespaceName];
  v13 = [(TRIPurgeableConstructs *)v6 cacheDeleteableFactorsByNamespaceName];
  v14 = [(TRIPurgeableExperimentAndRolloutProviding *)purgeableExperimentAndRolloutProvider purgeableExperimentAssetsFromNamespaces:v11 eagerFactors:v12 overriddenFactors:v13];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke_101;
  v29[3] = &unk_1E6BB80F0;
  id v15 = v7;
  id v30 = v15;
  [v14 enumerateKeysAndObjectsUsingBlock:v29];

  id v16 = self->_purgeableExperimentAndRolloutProvider;
  id v17 = [(TRIPurgeableConstructs *)v6 namespaceNamesPurgeableAtNamespaceLevel];
  v18 = [(TRIPurgeableConstructs *)v6 eagerPurgeableFactorsByNamespaceName];
  v19 = [(TRIPurgeableConstructs *)v6 cacheDeleteableFactorsByNamespaceName];
  v20 = [(TRIPurgeableExperimentAndRolloutProviding *)v16 purgeableRolloutAssetsFromNamespaces:v17 eagerFactors:v18 overriddenFactors:v19];

  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  objc_super v26 = __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke_2;
  v27 = &unk_1E6BB80F0;
  id v28 = v15;
  id v21 = v15;
  [v20 enumerateKeysAndObjectsUsingBlock:&v24];

  unint64_t v22 = -[TRIAssetStore removableAssetsSizeOlderThanNumScans:includedCacheDeletableAssetIds:](self->_assetStore, "removableAssetsSizeOlderThanNumScans:includedCacheDeletableAssetIds:", 0, v21, v24, v25, v26, v27);
  return v22;
}

void __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v4 objectForKeyedSubscript:v9];
        v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
        if (v11)
        {
          [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v9];
        }
        else
        {
          v12 = objc_opt_new();
          [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v9];
        }
        v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
        [v13 unionSet:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

void __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:v10];
  if (v7)
  {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v10];
  }
  else
  {
    v8 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v10];
  }
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
  [v9 unionSet:v6];
}

void __57__TRIAssetPurger_purgeableAssetSizeForPurgeabilityLevel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:v10];
  if (v7)
  {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v10];
  }
  else
  {
    v8 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v10];
  }
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
  [v9 unionSet:v6];
}

- (unint64_t)purgeAssetsForPurgeabilityLevel:(int)a3 requestedPurgeAmount:(int64_t)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v78 = 0;
  if (a4)
  {
    uint64_t v5 = *(void *)&a3;
    if (a3 == 2) {
      char v7 = 1;
    }
    else {
      char v7 = 2;
    }
    uint64_t v74 = 0;
    [(TRIAssetStore *)self->_assetStore collectGarbageOlderThanNumScans:0 deletedAssetSize:&v74];
    unint64_t v8 = v76[3] + v74;
    v76[3] = v8;
    if (v8 < a4)
    {
      v58 = [[TRIPurgeableConstructs alloc] initWithPurgeabilityLevel:v5 purgeableNamespacesProvider:self->_purgeableNamespacesProvider paths:self->_paths];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __71__TRIAssetPurger_purgeAssetsForPurgeabilityLevel_requestedPurgeAmount___block_invoke;
      v71[3] = &unk_1E6BB8118;
      char v73 = v7;
      v71[4] = self;
      v71[5] = &v75;
      v71[6] = a4;
      int v72 = v5;
      v57 = (void *)MEMORY[0x1E016EA80](v71);
      [(TRIAssetPurger *)self _enumeratePurgeCandidatesForPurgeableConstructs:v58 block:v57];
      if (v76[3] >= (unint64_t)a4)
      {
        v44 = TRILogCategory_Server();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = v76[3];
          *(_DWORD *)buf = 134218240;
          uint64_t v82 = v45;
          __int16 v83 = 2048;
          int64_t v84 = a4;
          _os_log_impl(&dword_1DA291000, v44, OS_LOG_TYPE_DEFAULT, "Found %llu bytes to purge. Cache delete only requested %llu so no need to look for regular assets to purge.", buf, 0x16u);
        }

        unint64_t v8 = v76[3];
        goto LABEL_47;
      }
      purgeableExperimentAndRolloutProvider = self->_purgeableExperimentAndRolloutProvider;
      id v10 = [(TRIPurgeableConstructs *)v58 namespaceNamesPurgeableAtNamespaceLevel];
      v11 = [(TRIPurgeableConstructs *)v58 eagerPurgeableFactorsByNamespaceName];
      v12 = [(TRIPurgeableConstructs *)v58 cacheDeleteableFactorsByNamespaceName];
      v56 = [(TRIPurgeableExperimentAndRolloutProviding *)purgeableExperimentAndRolloutProvider purgeableExperimentsFromNamespaces:v10 eagerFactors:v11 overriddenFactors:v12];

      v13 = self->_purgeableExperimentAndRolloutProvider;
      long long v14 = [(TRIPurgeableConstructs *)v58 namespaceNamesPurgeableAtNamespaceLevel];
      long long v15 = [(TRIPurgeableConstructs *)v58 eagerPurgeableFactorsByNamespaceName];
      long long v16 = [(TRIPurgeableConstructs *)v58 cacheDeleteableFactorsByNamespaceName];
      v55 = [(TRIPurgeableExperimentAndRolloutProviding *)v13 purgeableRolloutsFromNamespaces:v14 eagerFactors:v15 overriddenFactors:v16];

      long long v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v56 count];
        uint64_t v19 = [v55 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v82 = v18;
        __int16 v83 = 2048;
        int64_t v84 = v19;
        _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Found %lu experiments and %lu rollouts to deactivate in response to cache delete request.", buf, 0x16u);
      }

      if ([v56 count] || objc_msgSend(v55, "count"))
      {
        id v20 = +[TRISequenceTask task];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v68 = 0u;
        long long v67 = 0u;
        id v21 = v56;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v80 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v68 != v23) {
                objc_enumerationMutation(v21);
              }
              uint64_t v25 = *(void **)(*((void *)&v67 + 1) + 8 * i);
              objc_super v26 = [v25 experimentId];
              v27 = +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v26, [v25 deploymentId], 1, 24, 0);

              [v20 addTaskToEndOfSequence:v27];
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v67 objects:v80 count:16];
          }
          while (v22);
        }

        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v28 = v55;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v63 objects:v79 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v64;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v64 != v30) {
                objc_enumerationMutation(v28);
              }
              v32 = +[TRIDisenrollRolloutTask taskWithRolloutId:*(void *)(*((void *)&v63 + 1) + 8 * j) triggerEvent:1];
              [v20 addTaskToEndOfSequence:v32];
            }
            uint64_t v29 = [v28 countByEnumeratingWithState:&v63 objects:v79 count:16];
          }
          while (v29);
        }

        id v33 = +[TRIMaintenanceTask task];
        [v20 addTaskToEndOfSequence:v33];

        dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
        if (qword_1EA8D7EE0 != -1) {
          dispatch_once(&qword_1EA8D7EE0, &__block_literal_global_0);
        }
        v35 = (id)_MergedGlobals_30;
        int out_token = 0;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __71__TRIAssetPurger_purgeAssetsForPurgeabilityLevel_requestedPurgeAmount___block_invoke_2;
        handler[3] = &unk_1E6BB8160;
        v36 = v34;
        v61 = v36;
        notify_register_dispatch("com.apple.trial.TaskQueueComplete", &out_token, v35, handler);
        taskQueue = self->_taskQueue;
        v38 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
        char v39 = [(TRITaskQueuing *)taskQueue addTask:v20 options:v38];

        if (v39 == 2)
        {
          v40 = TRILogCategory_Server();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1DA291000, v40, OS_LOG_TYPE_ERROR, "Failed to queue cache delete deactivation tasks.", buf, 2u);
          }
        }
        v41 = self->_taskQueue;
        id v42 = [[TRIRunningXPCActivityDescriptor alloc] initForImmediateWorkWithCapabilities:0];
        [(TRITaskQueuing *)v41 resumeWithXPCActivityDescriptor:v42 executeWhenSuspended:0];

        if ([MEMORY[0x1E4F93B18] waitForSemaphore:v36 timeoutSeconds:30.0])
        {
          v43 = TRILogCategory_Server();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA291000, v43, OS_LOG_TYPE_DEFAULT, "Timeout while waiting for cache delete deactivation tasks to be completed.", buf, 2u);
          }

          [(TRIAssetPurger *)self _logDeactivationsMetricWithConcludedInTime:0];
        }
        else
        {
          v46 = TRILogCategory_Server();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA291000, v46, OS_LOG_TYPE_DEFAULT, "Cache delete deactivation tasks completed successfuly. Starting garbage collection to remove newly unreferenced assets.", buf, 2u);
          }

          uint64_t v59 = 0;
          [(TRIAssetStore *)self->_assetStore collectGarbageOlderThanNumScans:0 deletedAssetSize:&v59];
          v47 = TRILogCategory_Server();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v82 = v59;
            _os_log_impl(&dword_1DA291000, v47, OS_LOG_TYPE_DEFAULT, "Cache delete update: Purged %llu bytes from regular factors.", buf, 0xCu);
          }

          [(TRIAssetPurger *)self _logDeactivationsMetricWithConcludedInTime:1];
          v76[3] += v59;
        }
      }
      else
      {
        if (v5 != 2) {
          goto LABEL_46;
        }
        v49 = TRILogCategory_Server();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA291000, v49, OS_LOG_TYPE_DEFAULT, "Queuing maintenance task with no experiments or rollouts to deactivate.", buf, 2u);
        }

        v50 = self->_taskQueue;
        v51 = objc_opt_new();
        v52 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
        LOBYTE(v50) = [(TRITaskQueuing *)v50 addTask:v51 options:v52];

        if (v50 == 2)
        {
          v53 = TRILogCategory_Server();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1DA291000, v53, OS_LOG_TYPE_ERROR, "Failed to queue maintenance task.", buf, 2u);
          }
        }
        v54 = self->_taskQueue;
        id v20 = [[TRIRunningXPCActivityDescriptor alloc] initForImmediateWorkWithCapabilities:0];
        [(TRITaskQueuing *)v54 resumeWithXPCActivityDescriptor:v20 executeWhenSuspended:0];
      }

LABEL_46:
      unint64_t v8 = v76[3];

LABEL_47:
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  _Block_object_dispose(&v75, 8);
  return v8;
}

void __71__TRIAssetPurger_purgeAssetsForPurgeabilityLevel_requestedPurgeAmount___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  char v7 = [v6 factorPackId];
  unint64_t v8 = @"factor pack";
  if (!v7) {
    unint64_t v8 = @"treatment";
  }
  uint64_t v9 = v8;

  id v10 = [v6 factorPackId];
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    v12 = [v6 treatmentId];
  }
  v13 = v12;

  long long v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    long long v15 = [v6 namespaceName];
    long long v16 = [v6 purgeableAssetFactorNames];
    *(_DWORD *)buf = 138413058;
    long long v66 = v9;
    __int16 v67 = 2114;
    long long v68 = v13;
    __int16 v69 = 2114;
    long long v70 = v15;
    __int16 v71 = 2048;
    uint64_t v72 = [v16 count];
    _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Found purgeable %@ %{public}@ for namespace %{public}@ with %lu purgeable factors", buf, 0x2Au);
  }
  long long v17 = [v6 purgeableAssetFactorNames];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v19 = [v6 factorPackId];

    if (v19)
    {
      long long v63 = v13;
      id v20 = [[TRIFactorPackStorage alloc] initWithPaths:*(void *)(*(void *)(a1 + 32) + 8)];
      id v21 = [v6 factorPackId];
      uint64_t v22 = [v6 namespaceName];
      uint64_t v23 = [v6 purgeableAssetFactorNames];
      int v24 = [(TRIFactorPackStorage *)v20 updateSavedFactorPackWithId:v21 namespaceName:v22 deletingAssetsWithFactorNames:v23 inUseAssetBehavior:*(unsigned __int8 *)(a1 + 60)];

      if (_os_feature_enabled_impl())
      {
        v62 = v9;
        uint64_t v25 = [v6 factorPackId];
        objc_super v26 = [v6 namespaceName];
        v27 = [(TRIFactorPackStorage *)v20 pathForFactorPackWithId:v25 namespaceName:v26];

        id v28 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v29 = [v27 stringByAppendingPathComponent:@"factorPack.fb"];
        if ([v28 fileExistsAtPath:v29])
        {
          v60 = v27;
          v61 = a4;
          uint64_t v30 = [[TRIFBFactorPackStorage alloc] initWithPaths:*(void *)(*(void *)(a1 + 32) + 8)];
          v31 = [v6 factorPackId];
          v32 = [v6 namespaceName];
          id v33 = [v6 purgeableAssetFactorNames];
          uint64_t v59 = v30;
          LOBYTE(v30) = [(TRIFBFactorPackStorage *)v30 updateSavedFactorLevelsWithFactorPackId:v31 namespaceName:v32 deletingAssetsWithFactorNames:v33 inUseAssetBehavior:*(unsigned __int8 *)(a1 + 60)];

          if ((v30 & 1) == 0)
          {
            dispatch_semaphore_t v34 = TRILogCategory_Server();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v58 = [v6 factorPackId];
              *(_DWORD *)buf = 138412290;
              long long v66 = v58;
              _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "Flatbuffer Factor Storage: Not able to delete assets in FactorPack %@", buf, 0xCu);
            }
          }

          v27 = v60;
          a4 = v61;
        }

        uint64_t v9 = v62;
      }
      v35 = a4;

      v13 = v63;
    }
    else
    {
      v35 = a4;
      int v24 = 1;
    }
    v36 = [v6 treatmentId];

    if (v36)
    {
      v37 = [[TRIClientTreatmentStorage alloc] initWithPaths:*(void *)(*(void *)(a1 + 32) + 8)];
      v38 = [v6 treatmentId];
      char v39 = [v6 purgeableAssetFactorNames];
      v40 = [v6 namespaceName];
      v41 = [(TRIClientTreatmentStorage *)v37 updateSavedTreatmentWithTreatmentId:v38 deletingAssetsWithFactorNames:v39 forNamespaceName:v40 forRollouts:0 inUseAssetDeletionBehavior:*(unsigned __int8 *)(a1 + 60)];
      if (!v41) {
        LOBYTE(v24) = 0;
      }

      if (v24) {
        goto LABEL_24;
      }
    }
    else if (v24)
    {
LABEL_24:
      id v42 = TRILogCategory_Server();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = [v6 purgeableAssetFactorNames];
        uint64_t v44 = [v43 count];
        *(_DWORD *)buf = 134218498;
        long long v66 = (__CFString *)v44;
        __int16 v67 = 2112;
        long long v68 = v9;
        __int16 v69 = 2114;
        long long v70 = v13;
        _os_log_impl(&dword_1DA291000, v42, OS_LOG_TYPE_DEFAULT, "Successfully removed %lu factors from %@ %{public}@", buf, 0x20u);
      }
      uint64_t v45 = (void *)MEMORY[0x1E4FB01E8];
      v46 = [v6 namespaceName];
      [v45 notifyUpdateForNamespaceName:v46];

      uint64_t v64 = 0;
      [*(id *)(*(void *)(a1 + 32) + 48) collectGarbageOlderThanNumScans:0 deletedAssetSize:&v64];
      uint64_t v47 = v64;
      if (!v64)
      {
        v48 = TRILogCategory_Server();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DA291000, v48, OS_LOG_TYPE_ERROR, "Running garbage collection after removing factors from factor pack did not result in any purged assets", buf, 2u);
        }

        uint64_t v47 = v64;
      }
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v47;
      v49 = TRILogCategory_Server();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = *(__CFString **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        *(_DWORD *)buf = 134217984;
        long long v66 = v50;
        _os_log_impl(&dword_1DA291000, v49, OS_LOG_TYPE_DEFAULT, "Cache delete update: Purged %llu bytes so far", buf, 0xCu);
      }

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= *(void *)(a1 + 48))
      {
        v51 = TRILogCategory_Server();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = *(__CFString **)(a1 + 48);
          v53 = *(__CFString **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          *(_DWORD *)buf = 134218240;
          long long v66 = v53;
          __int16 v67 = 2048;
          long long v68 = v52;
          _os_log_impl(&dword_1DA291000, v51, OS_LOG_TYPE_DEFAULT, "Found %llu bytes to purge. Cache delete only requested %llu so no need to continue purging.", buf, 0x16u);
        }

        unsigned char *v35 = 1;
      }
      v54 = *(void **)(a1 + 32);
      v55 = [v6 purgeableAssetFactorNames];
      v56 = [v6 namespaceName];
      [v54 _logPurgedAssetWithFactorNames:v55 namespaceName:v56 purgeabilityLevel:*(unsigned int *)(a1 + 56)];

      goto LABEL_41;
    }
    v57 = TRILogCategory_Server();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v66 = v9;
      __int16 v67 = 2112;
      long long v68 = v13;
      _os_log_impl(&dword_1DA291000, v57, OS_LOG_TYPE_DEFAULT, "Not able to delete assets in %@ %@, moving on to next object", buf, 0x16u);
    }
  }
LABEL_41:
}

void __71__TRIAssetPurger_purgeAssetsForPurgeabilityLevel_requestedPurgeAmount___block_invoke_123()
{
  v0 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.trial.status" qosClass:17];
  v2 = (void *)_MergedGlobals_30;
  _MergedGlobals_30 = v1;
}

intptr_t __71__TRIAssetPurger_purgeAssetsForPurgeabilityLevel_requestedPurgeAmount___block_invoke_2(uint64_t a1)
{
  v2 = TRILogCategory_Server();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DA291000, v2, OS_LOG_TYPE_DEFAULT, "Task queue completion notification received for cache delete deactivation tasks.", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_logPurgedAssetWithFactorNames:(id)a3 namespaceName:(id)a4 purgeabilityLevel:(int)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v22 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v12 = objc_opt_new();
        v13 = [v12 ensureOnDemandFactorFields];
        [v13 setFactorName:v11];
        [v13 setNamespaceName:v22];
        long long v14 = [v12 ensureAssetPurgeFields];
        objc_msgSend(v14, "setPurgeabilityLevel:", objc_msgSend(MEMORY[0x1E4FB0628], "assetPurgeFieldsPurgeabilityLevelFromPurgeabilityLevel:", a5));
        long long v15 = [MEMORY[0x1E4FB05A8] metricWithName:@"on_demand_assets_purged"];
        long long v16 = [(TRIClient *)self->_loggingClient logger];
        long long v17 = [(TRIClient *)self->_loggingClient trackingId];
        v27 = v15;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
        [v16 logWithTrackingId:v17 metrics:v18 dimensions:0 trialSystemTelemetry:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }
}

- (void)_logDeactivationsMetricWithConcludedInTime:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4FB05A8] metricWithName:@"cache_delete_deactivations_concluded_in_time" integerValue:a3];
  uint64_t v5 = [(TRIClient *)self->_loggingClient logger];
  id v6 = [(TRIClient *)self->_loggingClient trackingId];
  v8[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 logWithTrackingId:v6 metrics:v7 dimensions:0 trialSystemTelemetry:0];
}

- (void)_enumeratePurgeCandidatesForPurgeableConstructs:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke;
  v26[3] = &unk_1E6BB8188;
  id v27 = v7;
  id v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x1E016EA80](v26);
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = [v6 eagerPurgeableFactorsByNamespaceName];
  v12 = [v11 allKeys];
  v13 = [v10 setWithArray:v12];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke_2;
  v24[3] = &unk_1E6BB81B0;
  id v14 = v6;
  id v25 = v14;
  long long v15 = (void *)MEMORY[0x1E016EA80](v24);
  [(TRIPurgeableOnDemandFactorsEnumerating *)self->_purgeableFactorPacksEnumerator enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames:v13 purgeableFactorFilterBlock:v15 block:v9];
  [(TRIPurgeableOnDemandFactorsEnumerating *)self->_purgeableFactorPacksEnumerator enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames:v13 purgeableFactorFilterBlock:v15 block:v9];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke_3;
  v22[3] = &unk_1E6BB81B0;
  id v23 = v14;
  id v16 = v14;
  long long v17 = (void *)MEMORY[0x1E016EA80](v22);
  purgeableFactorPacksEnumerator = self->_purgeableFactorPacksEnumerator;
  uint64_t v19 = [v16 namespaceNamesPurgeableAtNamespaceLevel];
  [(TRIPurgeableOnDemandFactorsEnumerating *)purgeableFactorPacksEnumerator enumerateRolloutOnDemandFactorsPurgeCandidatesFromNamespaceNames:v19 purgeableFactorFilterBlock:v17 block:v9];

  uint64_t v20 = self->_purgeableFactorPacksEnumerator;
  id v21 = [v16 namespaceNamesPurgeableAtNamespaceLevel];
  [(TRIPurgeableOnDemandFactorsEnumerating *)v20 enumerateExperimentOnDemandFactorsPurgeCandidatesFromNamespaceNames:v21 purgeableFactorFilterBlock:v17 block:v9];
}

uint64_t __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 eagerPurgeableFactorsByNamespaceName];
  id v8 = [v7 objectForKeyedSubscript:v5];

  uint64_t v9 = [v8 containsObject:v6];
  return v9;
}

uint64_t __72__TRIAssetPurger__enumeratePurgeCandidatesForPurgeableConstructs_block___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 cacheDeleteableFactorsByNamespaceName];
  id v8 = [v7 objectForKeyedSubscript:v5];

  LODWORD(v5) = [v8 containsObject:v6];
  return v5 ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingClient, 0);
  objc_storeStrong((id *)&self->_assetStore, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_purgeableExperimentAndRolloutProvider, 0);
  objc_storeStrong((id *)&self->_purgeableFactorPacksEnumerator, 0);
  objc_storeStrong((id *)&self->_purgeableNamespacesProvider, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end