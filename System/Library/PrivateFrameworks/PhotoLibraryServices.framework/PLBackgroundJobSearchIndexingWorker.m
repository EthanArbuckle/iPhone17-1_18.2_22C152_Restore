@interface PLBackgroundJobSearchIndexingWorker
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (id)_criteriaToUse;
- (BOOL)_supportsIndexRebuild;
- (BOOL)isInterruptible;
- (PLBackgroundJobSearchIndexingWorker)initWithLibraryBundle:(id)a3;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (signed)_jobType;
- (void)_performWorkOnItem:(id)a3 completion:(id)a4;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)stopWorkingOnItem:(id)a3;
@end

@implementation PLBackgroundJobSearchIndexingWorker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_incrementalUpdateProgress, 0);
  objc_storeStrong((id *)&self->_lock_library, 0);
}

- (signed)_jobType
{
  v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)_supportsIndexRebuild
{
  return 0;
}

- (void)stopWorkingOnItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLSearchBackendIndexStatusGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "Request received to stop work item: %@", buf, 0xCu);
  }

  uint64_t v12 = MEMORY[0x1E4F143A8];
  v13 = self;
  v6 = PLSafeResultWithUnfairLock();
  v7 = [v6 libraryServicesManager];
  v8 = [v7 searchIndexingEngine];
  [v8 pauseSearchIndexRebuildWithSourceName:@"Background Job"];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  v11 = self;
  v9 = PLSafeResultWithUnfairLock();
  objc_msgSend(v9, "cancel", v10, 3221225472, __57__PLBackgroundJobSearchIndexingWorker_stopWorkingOnItem___block_invoke_2, &unk_1E5870538, v11, v12, 3221225472, __57__PLBackgroundJobSearchIndexingWorker_stopWorkingOnItem___block_invoke, &unk_1E5870538, v13);
}

id __57__PLBackgroundJobSearchIndexingWorker_stopWorkingOnItem___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 112);
}

id __57__PLBackgroundJobSearchIndexingWorker_stopWorkingOnItem___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 120);
}

- (BOOL)isInterruptible
{
  return 1;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLBackgroundJobSearchIndexingWorker.m", 177, @"Invalid parameter not satisfying: %@", @"_item" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PLBackgroundJobSearchIndexingWorker.m", 178, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLBackgroundJobSearchIndexingWorker.m", 179, @"Invalid parameter not satisfying: %@", @"[_item isKindOfClass:[PLSearchIndexPendingWorkItem class]]" object file lineNumber description];
  }
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __78__PLBackgroundJobSearchIndexingWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v23 = &unk_1E5875E18;
  v24 = self;
  id v25 = v10;
  id v12 = v10;
  id v13 = v9;
  PLSafeRunWithUnfairLock();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__PLBackgroundJobSearchIndexingWorker_performWorkOnItem_inLibrary_completion___block_invoke_2;
  v18[3] = &unk_1E58734E8;
  v18[4] = self;
  id v19 = v11;
  id v14 = v11;
  [(PLBackgroundJobSearchIndexingWorker *)self _performWorkOnItem:v13 completion:v18];
}

void __78__PLBackgroundJobSearchIndexingWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
}

void __78__PLBackgroundJobSearchIndexingWorker_performWorkOnItem_inLibrary_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  PLSafeRunWithUnfairLock();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78__PLBackgroundJobSearchIndexingWorker_performWorkOnItem_inLibrary_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 112);
  *(void *)(v1 + 112) = 0;
}

- (void)_performWorkOnItem:(id)a3 completion:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__34586;
  v59[4] = __Block_byref_object_dispose__34587;
  id v60 = 0;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  id v9 = [v8 stringByAppendingString:@".donateCompletion"];
  id v10 = (const char *)[v9 UTF8String];
  qos_class_t v11 = qos_class_self();
  id v12 = dispatch_queue_attr_make_with_qos_class(0, v11, 0);
  dispatch_queue_t v13 = dispatch_queue_create(v10, v12);

  id v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  uint64_t v54 = MEMORY[0x1E4F143A8];
  uint64_t v55 = 3221225472;
  v56 = __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke;
  v57 = &unk_1E5870538;
  v58 = self;
  id v15 = PLSafeResultWithUnfairLock();
  dispatch_queue_t v34 = v13;
  PLPhotosSearchGetLog();
  uint64_t v16 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  v18 = v16;
  id v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PLSearchIndexBackgroundWorkerPerformWorkOnItem", "", buf, 2u);
  }
  os_signpost_id_t v33 = v17;

  if ([v35 rebuildInProgress])
  {
    id v20 = [v15 libraryServicesManager];
    uint64_t v21 = [v20 searchIndexingEngine];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_76;
    v51[3] = &unk_1E5868CB0;
    v52[1] = v59;
    v52[0] = v14;
    [v21 resumeSearchIndexRebuildIfNeededForLibrary:v15 calledBy:@"Background Job" completion:v51];
    v22 = (id *)v52;
  }
  else
  {
    v23 = v15;
    v24 = [v15 libraryServicesManager];
    id v25 = [v24 searchIndexingEngine];
    uint64_t v26 = [v35 jobType];
    uint64_t v27 = [v35 jobFlags];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_2;
    v49[3] = &unk_1E5868CD8;
    v50[1] = v59;
    v50[0] = v14;
    v28 = [v25 processBatchOfJobsWithType:v26 flags:v27 library:v23 completion:v49];

    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    v45 = __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_3;
    v46 = &unk_1E5875E18;
    v47 = self;
    id v20 = v28;
    id v48 = v20;
    PLSafeRunWithUnfairLock();
    v22 = (id *)v50;

    id v15 = v23;
  }

  v29 = +[PLConcurrencyLimiter sharedLimiter];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3254779904;
  v36[2] = __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_4;
  v36[3] = &unk_1EEB2C0C0;
  v30 = v19;
  v41 = v30;
  os_signpost_id_t v42 = v33;
  id v31 = v35;
  id v37 = v31;
  v38 = self;
  id v32 = v6;
  id v39 = v32;
  v40 = v59;
  [v29 groupNotify:v14 queue:v34 block:v36];

  _Block_object_dispose(v59, 8);
}

id __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 112);
}

void __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_76(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_3(uint64_t a1)
{
}

void __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(id *)(a1 + 64);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    int v5 = [*(id *)(a1 + 32) jobType];
    uint64_t v6 = [*(id *)(a1 + 32) jobFlags];
    int v7 = [*(id *)(a1 + 32) rebuildInProgress];
    *(_DWORD *)buf = 67109632;
    int v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    __int16 v14 = 1024;
    int v15 = v7;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PLSearchIndexBackgroundWorkerPerformWorkOnItem", "JobType: %hd, JobFlags: %lld, RebuildInProgress: %d", buf, 0x18u);
  }

  PLSafeRunWithUnfairLock();
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) error];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

void __69__PLBackgroundJobSearchIndexingWorker__performWorkOnItem_completion___block_invoke_80(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 120);
  *(void *)(v1 + 120) = 0;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PLBackgroundJobSearchIndexingWorker.m", 84, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  PLPhotosSearchGetLog();
  uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v8 = v6;
  id v9 = v8;
  unint64_t v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PLSearchIndexBackgroundWorkerWorkItemsNeedingProcessing", "", (uint8_t *)&buf, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    if ([(PLBackgroundJobSearchIndexingWorker *)self _supportsIndexRebuild]
      && ([v5 libraryServicesManager],
          int v11 = objc_claimAutoreleasedReturnValue(),
          [v11 searchIndexingEngine],
          __int16 v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 hasRebuildWorkToDoForLibrary:v5],
          v12,
          v11,
          v13))
    {
      __int16 v14 = v9;
      int v15 = v14;
      if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        uint64_t v16 = [v5 libraryServicesManager];
        uint64_t v17 = [v16 wellKnownPhotoLibraryIdentifier];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v17;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v7, "PLSearchIndexBackgroundWorkerWorkItemsNeedingProcessing", "WellKnownPhotoLibraryIdentifier: %tu, HasRebuildWorkToDoForLibrary", (uint8_t *)&buf, 0xCu);
      }
      v18 = [PLBackgroundJobWorkerPendingWorkItems alloc];
      id v19 = [(id)objc_opt_class() _criteriaToUse];
      id v20 = +[PLSearchIndexPendingWorkItem rebuildInProgressPendingWorkItem];
      v45[0] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
      v22 = [(PLBackgroundJobWorkerPendingWorkItems *)v18 initWithCriteria:v19 workItemsNeedingProcessing:v21];
    }
    else
    {
      if ([(PLBackgroundJobSearchIndexingWorker *)self _supportsIndexRebuild]) {
        +[PLSpotlightReindexing drainSpotlightReindexIdentifiersIfNeededForLibrary:v5];
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v41 = 0x3032000000;
      os_signpost_id_t v42 = __Block_byref_object_copy__34586;
      uint64_t v43 = __Block_byref_object_dispose__34587;
      id v44 = 0;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __75__PLBackgroundJobSearchIndexingWorker_workItemsNeedingProcessingInLibrary___block_invoke;
      v32[3] = &unk_1E5875340;
      id v23 = v5;
      id v33 = v23;
      dispatch_queue_t v34 = self;
      p_long long buf = &buf;
      [v23 performBlockAndWait:v32];
      v24 = v9;
      id v25 = v24;
      if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        uint64_t v26 = [v23 libraryServicesManager];
        uint64_t v27 = [v26 wellKnownPhotoLibraryIdentifier];
        v28 = [*(id *)(*((void *)&buf + 1) + 40) workItemsNeedingProcessing];
        uint64_t v29 = [v28 count];
        *(_DWORD *)v36 = 134218240;
        uint64_t v37 = v27;
        __int16 v38 = 2048;
        uint64_t v39 = v29;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v25, OS_SIGNPOST_INTERVAL_END, v7, "PLSearchIndexBackgroundWorkerWorkItemsNeedingProcessing", "WellKnownPhotoLibraryIdentifier: %tu, PendingWorkItems: %tu", v36, 0x16u);
      }
      v22 = (PLBackgroundJobWorkerPendingWorkItems *)*(id *)(*((void *)&buf + 1) + 40);

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    v22 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
  }

  return v22;
}

void __75__PLBackgroundJobSearchIndexingWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = +[PLBackgroundJobWorkItem nextSearchIndexWorkItemJobFlagsInManagedObjectContext:jobType:](PLBackgroundJobWorkItem, "nextSearchIndexWorkItemJobFlagsInManagedObjectContext:jobType:", v2, [*(id *)(a1 + 40) _jobType]);

  if ([v3 isFailure])
  {
    os_signpost_id_t v4 = PLSearchBackendIndexWorkerGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 40) workerName];
      uint64_t v6 = [v3 error];
      *(_DWORD *)long long buf = 138543618;
      v50 = v5;
      __int16 v51 = 2112;
      v52 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "%{public}@ unable to fetch work items needing processing, error: %@", buf, 0x16u);
    }
    os_signpost_id_t v7 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    unint64_t v10 = [v3 result];
    uint64_t v11 = [v10 unsignedIntegerValue];

    if (v11)
    {
      __int16 v12 = [v3 result];
      int v13 = PLSearchBackendIndexWorkerGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = [*(id *)(a1 + 40) workerName];
        int v15 = PLBackgroundJobWorkerSearchJobFlagsDescription([v12 integerValue]);
        *(_DWORD *)long long buf = 138543618;
        v50 = v14;
        __int16 v51 = 2114;
        v52 = v15;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ found search jobs needing processing with flags %{public}@", buf, 0x16u);
      }
      uint64_t v16 = [PLBackgroundJobWorkerPendingWorkItems alloc];
      uint64_t v17 = [(id)objc_opt_class() _criteriaToUse];
      v18 = +[PLSearchIndexPendingWorkItem pendingWorkItemWithType:flags:](PLSearchIndexPendingWorkItem, "pendingWorkItemWithType:flags:", [*(id *)(a1 + 40) _jobType], objc_msgSend(v12, "integerValue"));
      id v48 = v18;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
      uint64_t v20 = [(PLBackgroundJobWorkerPendingWorkItems *)v16 initWithCriteria:v17 workItemsNeedingProcessing:v19];
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    || ![*(id *)(a1 + 40) _supportsIndexRebuild])
  {
    v24 = v3;
  }
  else
  {
    id v23 = [*(id *)(a1 + 32) managedObjectContext];
    v24 = +[PLBackgroundJobWorkItem nextSearchIndexWorkItemJobFlagsInManagedObjectContext:v23 jobType:3];

    if ([v24 isFailure])
    {
      id v25 = PLSearchBackendIndexWorkerGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = [*(id *)(a1 + 40) workerName];
        uint64_t v27 = [v24 error];
        *(_DWORD *)long long buf = 138543618;
        v50 = v26;
        __int16 v51 = 2112;
        v52 = v27;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "%{public}@ unable to fetch search repair failure work items needing processing, error: %@", buf, 0x16u);
      }
      v28 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
      uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
      v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v31 = [v24 result];
      uint64_t v32 = [v31 unsignedIntegerValue];

      if (v32)
      {
        id v33 = [v24 result];
        dispatch_queue_t v34 = PLSearchBackendIndexWorkerGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          id v35 = [*(id *)(a1 + 40) workerName];
          v36 = PLBackgroundJobWorkerSearchJobFlagsDescription([v33 integerValue]);
          *(_DWORD *)long long buf = 138543618;
          v50 = v35;
          __int16 v51 = 2114;
          v52 = v36;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ found search repair failure jobs needing processing with flags %{public}@", buf, 0x16u);
        }
        uint64_t v37 = [PLBackgroundJobWorkerPendingWorkItems alloc];
        __int16 v38 = [(id)objc_opt_class() _criteriaToUse];
        uint64_t v39 = +[PLSearchIndexPendingWorkItem pendingWorkItemWithType:flags:](PLSearchIndexPendingWorkItem, "pendingWorkItemWithType:flags:", 3, [v33 integerValue]);
        v47 = v39;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
        uint64_t v41 = [(PLBackgroundJobWorkerPendingWorkItems *)v37 initWithCriteria:v38 workItemsNeedingProcessing:v40];
        uint64_t v42 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v43 = *(void **)(v42 + 40);
        *(void *)(v42 + 40) = v41;
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v44 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
    uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8);
    v46 = *(void **)(v45 + 40);
    *(void *)(v45 + 40) = v44;
  }
}

- (PLBackgroundJobSearchIndexingWorker)initWithLibraryBundle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLBackgroundJobSearchIndexingWorker;
  result = [(PLBackgroundJobWorker *)&v4 initWithLibraryBundle:a3];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)_criteriaToUse
{
  id v2 = a1;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  int v4 = _os_feature_enabled_impl();
  if (v4)
  {
    if (a3)
    {
      LOBYTE(v4) = a3 == 3 || a3 == 1;
    }
    else
    {
      +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:0];
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

@end