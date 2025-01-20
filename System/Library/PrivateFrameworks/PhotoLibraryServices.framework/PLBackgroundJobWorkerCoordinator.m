@interface PLBackgroundJobWorkerCoordinator
- (BOOL)shouldDeferActivity;
- (PLBackgroundJobWorkerCoordinator)initWithWorkerClassesAsStrings:(id)a3;
- (PLBackgroundJobWorkerCoordinator)initWithWorkerClassesAsStrings:(id)a3 workerMode:(signed __int16)a4 statusCenter:(id)a5;
- (PLBackgroundJobWorkerCoordinator)initWithWorkerCoordinatorWorkerMode:(signed __int16)a3 statusCenter:(id)a4;
- (PLBackgroundJobWorkerCoordinatorDelegate)delegate;
- (id)_workersForBundle:(id)a3;
- (id)pendingJobsForBundle:(id)a3;
- (void)_handleAllWorkersCompleted;
- (void)_processNextWorkerInLibraryBundle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopAllBackgorundJobs;
- (void)submitBundleForProcessing:(id)a3 withCriteria:(id)a4;
@end

@implementation PLBackgroundJobWorkerCoordinator

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedCriteriaForPendingWorkers, 0);
  objc_storeStrong((id *)&self->_currentWorker, 0);
  objc_storeStrong((id *)&self->_pendingWorkers, 0);
  objc_storeStrong((id *)&self->_workerClassesAsStrings, 0);
  objc_destroyWeak((id *)&self->_statusCenter);
}

- (void)setDelegate:(id)a3
{
}

- (PLBackgroundJobWorkerCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLBackgroundJobWorkerCoordinatorDelegate *)WeakRetained;
}

- (void)_handleAllWorkersCompleted
{
  qos_class_t v3 = qos_class_self();
  v4 = dispatch_get_global_queue(v3, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PLBackgroundJobWorkerCoordinator__handleAllWorkersCompleted__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __62__PLBackgroundJobWorkerCoordinator__handleAllWorkersCompleted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v4 workerCoordinatorDidFinishAllSubmittedJobsOnBundle:*(void *)(a1 + 32)];
  }
}

- (void)_processNextWorkerInLibraryBundle:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(NSMutableArray *)self->_pendingWorkers firstObject];
  currentWorker = self->_currentWorker;
  self->_currentWorker = v6;

  v8 = [(PLBackgroundJobWorkerCriteriaTuple *)self->_currentWorker worker];
  v35 = [(PLBackgroundJobWorkerCriteriaTuple *)self->_currentWorker criteria];
  uint64_t v9 = [(NSMutableArray *)self->_pendingWorkers count];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
  [v8 setStatusCenter:WeakRetained];

  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    v11 = [v5 libraryServicesManager];
    v12 = [v11 databaseContext];

    id v13 = [v8 photoLibraryWithDatabaseContext:v12];
    if (!v13)
    {
      if (MEMORY[0x19F38C0C0]()) {
        id v13 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLBackgroundJobWorkerCoordinator _processNextWorkerInLibraryBundle:]", v5);
      }
      else {
        id v13 = 0;
      }
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke;
    v44[3] = &unk_1E586FB38;
    v44[4] = self;
    SEL v46 = a2;
    id v33 = v12;
    id v45 = v33;
    v14 = (void (**)(void, void, void))MEMORY[0x19F38D650](v44);
    if (!v13)
    {
      v17 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [v8 workerName];
        int workerMode = self->_workerMode;
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v52) = workerMode;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "_processNextWorkerInLibraryBundle: library is nil for worker %{public}@ bundle %@. workerCoordinatorMode: %d", buf, 0x1Cu);
      }
      ((void (**)(void, void *, uint64_t))v14)[2](v14, v8, 1);
      [(PLBackgroundJobWorkerCoordinator *)self _processNextWorkerInLibraryBundle:v5];
      goto LABEL_26;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__79458;
    v53 = __Block_byref_object_dispose__79459;
    id v54 = 0;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke_117;
    v40[3] = &unk_1E5875340;
    v43 = buf;
    id v15 = v8;
    id v41 = v15;
    id v16 = v13;
    id v42 = v16;
    uint64_t v31 = MEMORY[0x19F38D650](v40);
    if ([(id)objc_opt_class() usesMultipleLibrariesConcurrently])
    {
      +[PLManagedObjectContext _pl_megamoc_runWithPerformWarningsSuppressed:v31];
    }
    else
    {
      v20 = +[PLConcurrencyLimiter sharedLimiter];
      [v20 sync:v31 identifyingBlock:0 library:v16];
    }
    v34 = objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "workItemsNeedingProcessing", v31);
    uint64_t v21 = [v34 count];
    if (v21)
    {
      if (!v35
        || ([*(id *)(*(void *)&buf[8] + 40) criteria],
            v22 = objc_claimAutoreleasedReturnValue(),
            char v23 = [v35 isEqual:v22],
            v22,
            (v23 & 1) != 0))
      {
        v24 = PLBackgroundJobServiceGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = self->_workerMode;
          *(_DWORD *)v47 = 138412546;
          id v48 = v15;
          __int16 v49 = 1024;
          int v50 = v25;
          _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Starting worker %@. workerCoordinatorMode: %d", v47, 0x12u);
        }

        objc_initWeak((id *)v47, v15);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke_121;
        v36[3] = &unk_1E586FB60;
        objc_copyWeak(&v39, (id *)v47);
        v36[4] = self;
        v38 = v14;
        id v37 = v5;
        [v15 startWorkInLibrary:v16 withWorkItemsNeedingProcessing:v34 withCompletion:v36];

        objc_destroyWeak(&v39);
        objc_destroyWeak((id *)v47);
        goto LABEL_25;
      }
      v26 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v29 = [v15 workerDetailedName];
        int v30 = self->_workerMode;
        *(_DWORD *)v47 = 138412546;
        id v48 = v29;
        __int16 v49 = 1024;
        int v50 = v30;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "Worker %@ reports it has work to do... but the criteria it needs does not match our running criteria; removing"
          " it from pending workers queue. workerCoordinatorMode: %d",
          v47,
          0x12u);
      }
    }
    else
    {
      v26 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = [v15 workerDetailedName];
        int v28 = self->_workerMode;
        *(_DWORD *)v47 = 138412546;
        id v48 = v27;
        __int16 v49 = 1024;
        int v50 = v28;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "Worker %@ reports it has no work to do; removing it from pending workers queue. workerCoordinatorMode: %d",
          v47,
          0x12u);
      }
    }

    ((void (**)(void, id, BOOL))v14)[2](v14, v15, v21 == 0);
    [(PLBackgroundJobWorkerCoordinator *)self _processNextWorkerInLibraryBundle:v5];
LABEL_25:

    _Block_object_dispose(buf, 8);
LABEL_26:

    goto LABEL_27;
  }
  [(PLBackgroundJobWorkerCoordinator *)self _handleAllWorkersCompleted];
LABEL_27:
}

void __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke(void *a1, void *a2, int a3)
{
  id v15 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 48));
  id v5 = [*(id *)(a1[4] + 40) worker];

  if (v5 != v15)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a1[6], a1[4], @"PLBackgroundJobWorkerCoordinator.m", 339, @"Invalid parameter not satisfying: %@", @"worker == _currentWorker.worker" object file lineNumber description];
  }
  v6 = [*(id *)(a1[4] + 40) worker];
  int v7 = [v6 shouldDeferActivity];

  if (v7) {
    atomic_store(1u, (unsigned __int8 *)(a1[4] + 52));
  }
  [*(id *)(a1[4] + 32) removeObject:*(void *)(a1[4] + 40)];
  if (a3)
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = *(void **)(v8 + 56);
    v10 = [*(id *)(v8 + 40) worker];
    v11 = [v10 workerDetailedName];
    [v9 removeObjectForKey:v11];
  }
  uint64_t v12 = a1[4];
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 48));
  [v15 workerDidFinishWithDatabaseContext:a1[5]];
}

void __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke_117(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workItemsNeedingProcessingInLibrary:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __70__PLBackgroundJobWorkerCoordinator__processNextWorkerInLibraryBundle___block_invoke_121(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(__int16 *)(*(void *)(a1 + 32) + 16);
    int v5 = 138412546;
    id v6 = WeakRetained;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Worker %@ finished. workerCoordinatorMode: %d", (uint8_t *)&v5, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) _processNextWorkerInLibraryBundle:*(void *)(a1 + 40)];
}

- (void)stopAllBackgorundJobs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(NSMutableArray *)self->_pendingWorkers count];
    int workerMode = self->_workerMode;
    int v9 = 134218240;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    int v12 = workerMode;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Clearing %tu workers from _pendingWorkers queue. workerCoordinatorMode: %d", (uint8_t *)&v9, 0x12u);
  }

  uint64_t v7 = [(NSMutableArray *)self->_pendingWorkers count];
  [(NSMutableArray *)self->_pendingWorkers removeAllObjects];
  [(NSMutableDictionary *)self->_cachedCriteriaForPendingWorkers removeAllObjects];
  int v8 = [(PLBackgroundJobWorkerCriteriaTuple *)self->_currentWorker worker];
  os_unfair_lock_unlock(p_lock);
  if (v7) {
    [v8 stopAllWork];
  }
}

- (void)submitBundleForProcessing:(id)a3 withCriteria:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PLBackgroundJobWorkerCoordinator *)self _workersForBundle:v6];
  os_unfair_lock_lock(&self->_lock);
  atomic_store(0, (unsigned __int8 *)&self->_shouldDeferActivity);
  int v19 = [(NSMutableArray *)self->_pendingWorkers count];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [[PLBackgroundJobWorkerCriteriaTuple alloc] initWithWorker:*(void *)(*((void *)&v20 + 1) + 8 * v13) withCriteria:v7];
        [(NSMutableArray *)self->_pendingWorkers addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v11);
  }

  id v15 = self->_currentWorker;
  int v16 = [(NSMutableArray *)self->_pendingWorkers count];
  v17 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int workerMode = self->_workerMode;
    *(_DWORD *)buf = 67109376;
    int v25 = v16 - v19;
    __int16 v26 = 1024;
    int v27 = workerMode;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Added %d workers to the pending workers queue. workerCoordinatorMode: %d", buf, 0xEu);
  }

  os_unfair_lock_unlock(&self->_lock);
  if (!v15) {
    [(PLBackgroundJobWorkerCoordinator *)self _processNextWorkerInLibraryBundle:v6];
  }
}

- (id)pendingJobsForBundle:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 pathManager];
  id v6 = [v5 libraryURL];
  id v7 = [v6 absoluteString];

  int v8 = [v4 libraryServicesManager];
  id v9 = [v8 databaseContext];
  uint64_t v10 = [v9 newShortLivedLibraryWithName:"-[PLBackgroundJobWorkerCoordinator pendingJobsForBundle:]"];

  if (!v10
    && (!MEMORY[0x19F38C0C0]()
     || (uint64_t v10 = +[PLDatabaseContext newShortLivedLibraryWithName:bundle:](PLDatabaseContext, "newShortLivedLibraryWithName:bundle:", "-[PLBackgroundJobWorkerCoordinator pendingJobsForBundle:]", v4)) == 0))
  {
    uint64_t v10 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v66 = (uint64_t)v4;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "pendingJobsForBundle: library is nil for bundle %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  uint64_t v11 = [v10 globalValues];
  char v12 = [v11 libraryCreateOptions];

  if ((v12 & 0x40) != 0)
  {
    id v15 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v66 = (uint64_t)v4;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "pendingJobsForBundle: library create options indicate no background jobs for bundle %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (PLIsAssetsd())
  {
    if (PLIsConfiguredForUnitTesting())
    {
      uint64_t v13 = [v4 libraryServicesManager];
      uint64_t v14 = [v13 wellKnownPhotoLibraryIdentifier];

      if ((unint64_t)(v14 - 1) <= 2)
      {
        id v15 = PLBackgroundJobServiceGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = [v4 libraryServicesManager];
          *(_DWORD *)buf = 134217984;
          uint64_t v66 = [v16 wellKnownPhotoLibraryIdentifier];
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "pendingJobsForBundle: ignoring background jobs during unit testing for well-known library %td", buf, 0xCu);
        }
LABEL_14:

LABEL_15:
        v17 = 0;
        goto LABEL_45;
      }
    }
  }
  id v18 = objc_alloc(MEMORY[0x1E4F28E78]);
  int v19 = [v4 libraryServicesManager];
  [v19 wellKnownPhotoLibraryIdentifier];
  long long v20 = PLStringFromWellKnownPhotoLibraryIdentifier();
  v60 = (void *)[v18 initWithFormat:@"Workers that reported pending jobs on well known library identifier %@:\n", v20];

  long long v21 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v66 = (uint64_t)v7;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEBUG, "Checking all workers of library %@ for pending jobs", buf, 0xCu);
  }
  id v54 = v7;

  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v55 = v4;
  long long v23 = [(PLBackgroundJobWorkerCoordinator *)self _workersForBundle:v4];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v62;
    v56 = v10;
    v57 = v23;
    while (2)
    {
      uint64_t v27 = 0;
      uint64_t v59 = v25;
      do
      {
        if (*(void *)v62 != v26) {
          objc_enumerationMutation(v23);
        }
        int v28 = *(void **)(*((void *)&v61 + 1) + 8 * v27);
        cachedCriteriaForPendingWorkers = self->_cachedCriteriaForPendingWorkers;
        int v30 = [v28 workerDetailedName];
        uint64_t v31 = [(NSMutableDictionary *)cachedCriteriaForPendingWorkers objectForKeyedSubscript:v30];

        if (v31)
        {
          v32 = self->_cachedCriteriaForPendingWorkers;
          id v33 = [v28 workerDetailedName];
          v34 = [(NSMutableDictionary *)v32 objectForKeyedSubscript:v33];

          [v22 addObject:v34];
          v35 = [v28 workerName];
          v36 = [v34 name];
          [v60 appendFormat:@"\t W: %@ C: %@ Cache hit: YES\n", v35, v36];
        }
        else
        {
          os_unfair_lock_unlock(lock);
          v34 = [v28 pendingJobsInLibrary:v10];
          os_unfair_lock_lock(lock);
          id v37 = [v34 workItemsNeedingProcessing];
          uint64_t v38 = [v37 count];

          if (v38)
          {
            id v39 = [v28 workerName];
            v40 = [v34 criteria];
            id v41 = [v40 name];
            [v60 appendFormat:@"\t W: %@ C: %@ Cache hit: NO\n", v39, v41];

            id v42 = [v34 criteria];
            [v22 addObject:v42];

            v43 = self->_cachedCriteriaForPendingWorkers;
            v44 = [v34 criteria];
            id v45 = [v28 workerDetailedName];
            [(NSMutableDictionary *)v43 setObject:v44 forKey:v45];

            id WeakRetained = objc_loadWeakRetained((id *)&self->_statusCenter);
            [WeakRetained recordWorkerHasPendingJobs:v28];

            if ([(id)objc_opt_class() avoidCheckingOtherWorkersIfThisWorkerHasPendingWork])
            {
              v47 = PLBackgroundJobServiceGetLog();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                id v48 = [v28 workerName];
                *(_DWORD *)buf = 138543362;
                uint64_t v66 = (uint64_t)v48;
                _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_DEFAULT, "Ignoring all other workers in the pending jobs queue since worker %{public}@ returned YES for avoidCheckingOtherWorkersIfThisWorkerHasPendingWork and has pending work to do", buf, 0xCu);
              }
              uint64_t v10 = v56;
              long long v23 = v57;
              goto LABEL_35;
            }
            uint64_t v10 = v56;
            long long v23 = v57;
          }
          uint64_t v25 = v59;
        }

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }
LABEL_35:

  os_unfair_lock_unlock(lock);
  __int16 v49 = PLBackgroundJobServiceGetLog();
  id v7 = v54;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v50 = [v22 count];
    v51 = @"YES";
    if (!v50) {
      v51 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v66 = (uint64_t)v54;
    __int16 v67 = 2112;
    v68 = v51;
    _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEBUG, "Checked workers of library %@ for pending jobs. Result: %@", buf, 0x16u);
  }

  if ([v22 count])
  {
    v52 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v66 = (uint64_t)v60;
      _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    v17 = (void *)[v22 copy];
  }
  else
  {
    v17 = 0;
  }
  id v4 = v55;

LABEL_45:
  return v17;
}

- (id)_workersForBundle:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [v4 libraryServicesManager];
  id v7 = [v6 readyForAnalysis];
  char v8 = [v7 isReadyForAnalysis];

  id v9 = [v4 libraryServicesManager];
  uint64_t v10 = [v9 wellKnownPhotoLibraryIdentifier];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = self->_workerClassesAsStrings;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        int v16 = NSClassFromString(*(NSString **)(*((void *)&v20 + 1) + 8 * i));
        if (-[objc_class supportsWellKnownPhotoLibraryIdentifier:](v16, "supportsWellKnownPhotoLibraryIdentifier:", v10, (void)v20)&& ((v8 & 1) != 0|| [(objc_class *)v16 allowWorkerToRunDuringCPLInitialSync]))
        {
          v17 = (void *)[[v16 alloc] initWithLibraryBundle:v4];
          [v5 addObject:v17];
        }
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  id v18 = (void *)[v5 copy];
  return v18;
}

- (BOOL)shouldDeferActivity
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldDeferActivity);
  return v2 & 1;
}

- (PLBackgroundJobWorkerCoordinator)initWithWorkerClassesAsStrings:(id)a3 workerMode:(signed __int16)a4 statusCenter:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PLBackgroundJobWorkerCoordinator;
  uint64_t v11 = [(PLBackgroundJobWorkerCoordinator *)&v18 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_statusCenter, v10);
    v12->_int workerMode = a4;
    objc_storeStrong((id *)&v12->_workerClassesAsStrings, a3);
    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingWorkers = v12->_pendingWorkers;
    v12->_pendingWorkers = v13;

    id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedCriteriaForPendingWorkers = v12->_cachedCriteriaForPendingWorkers;
    v12->_cachedCriteriaForPendingWorkers = v15;
  }
  return v12;
}

- (PLBackgroundJobWorkerCoordinator)initWithWorkerClassesAsStrings:(id)a3
{
  return [(PLBackgroundJobWorkerCoordinator *)self initWithWorkerClassesAsStrings:a3 workerMode:0 statusCenter:0];
}

- (PLBackgroundJobWorkerCoordinator)initWithWorkerCoordinatorWorkerMode:(signed __int16)a3 statusCenter:(id)a4
{
  uint64_t v4 = a3;
  v69[5] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_10;
    }
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    v69[0] = v10;
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    v69[1] = v12;
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    v69[2] = v14;
    id v15 = (objc_class *)objc_opt_class();
    int v16 = NSStringFromClass(v15);
    v69[3] = v16;
    v17 = (objc_class *)objc_opt_class();
    objc_super v18 = NSStringFromClass(v17);
    v69[4] = v18;
    int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:5];
    [v8 addObjectsFromArray:v19];
  }
  else
  {
    id v63 = v7;
    long long v64 = self;
    long long v20 = (objc_class *)objc_opt_class();
    long long v62 = NSStringFromClass(v20);
    v68[0] = v62;
    long long v21 = (objc_class *)objc_opt_class();
    long long v61 = NSStringFromClass(v21);
    v68[1] = v61;
    long long v22 = (objc_class *)objc_opt_class();
    v60 = NSStringFromClass(v22);
    v68[2] = v60;
    long long v23 = (objc_class *)objc_opt_class();
    uint64_t v59 = NSStringFromClass(v23);
    v68[3] = v59;
    uint64_t v24 = (objc_class *)objc_opt_class();
    v58 = NSStringFromClass(v24);
    v68[4] = v58;
    uint64_t v25 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v25);
    v68[5] = v26;
    uint64_t v27 = (objc_class *)objc_opt_class();
    int v28 = NSStringFromClass(v27);
    v68[6] = v28;
    uint64_t v29 = (objc_class *)objc_opt_class();
    int v30 = NSStringFromClass(v29);
    v68[7] = v30;
    uint64_t v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    v68[8] = v32;
    id v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    v68[9] = v34;
    v35 = (objc_class *)objc_opt_class();
    v36 = NSStringFromClass(v35);
    v68[10] = v36;
    id v37 = (objc_class *)objc_opt_class();
    uint64_t v38 = NSStringFromClass(v37);
    v68[11] = v38;
    id v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    v68[12] = v40;
    id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:13];
    [v8 addObjectsFromArray:v41];

    if (_os_feature_enabled_impl())
    {
      id v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      __int16 v67 = v43;
      v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
      [v8 addObjectsFromArray:v44];
    }
    if (_os_feature_enabled_impl())
    {
      id v45 = (objc_class *)objc_opt_class();
      SEL v46 = NSStringFromClass(v45);
      [v8 addObject:v46];

      v47 = (objc_class *)objc_opt_class();
      id v48 = NSStringFromClass(v47);
      [v8 addObject:v48];

      __int16 v49 = (objc_class *)objc_opt_class();
      uint64_t v50 = NSStringFromClass(v49);
      [v8 addObject:v50];
    }
    v51 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v51);
    [v8 addObject:v10];
    uint64_t v4 = 0;
    id v7 = v63;
    self = v64;
  }

LABEL_10:
  v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobileslideshow"];
  v53 = [v52 objectForKey:@"PLBackgroundJobServiceBlockedWorkersUserDefaultsKey"];
  if ([v53 count])
  {
    [v8 removeObjectsInArray:v53];
    id v54 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v66 = v53;
      _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEFAULT, "Blocked workers: %@ Use plphotosctl backgroundjob reset-disable-worker", buf, 0xCu);
    }
  }
  id v55 = objc_msgSend(v8, "copy", v58);
  v56 = [(PLBackgroundJobWorkerCoordinator *)self initWithWorkerClassesAsStrings:v55 workerMode:v4 statusCenter:v7];

  return v56;
}

@end