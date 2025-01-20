@interface PLBackgroundJobFeatureAvailabilityWorker
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (double)minimumSecondsBetweenJobs;
+ (id)_criteriaToUse;
- (BOOL)_featureAvailabilityIsStale:(id)a3 inLibrary:(id)a4;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
@end

@implementation PLBackgroundJobFeatureAvailabilityWorker

+ (id)_criteriaToUse
{
  return +[PLBackgroundJobCriteria criteriaForDiscretionaryResourceWorker];
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

+ (double)minimumSecondsBetweenJobs
{
  return 43200.0;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v8 = PLBackendGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "PLBackgroundJobFeatureAvailabilityWorker - starting feature availability computation", buf, 2u);
  }

  v9 = [v6 libraryServicesManager];
  v10 = [v9 availabilityComputer];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PLBackgroundJobFeatureAvailabilityWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v13[3] = &unk_1E586B688;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v10 computeAvailabilityForPhotoLibrary:v12 shouldPersist:1 completionHandler:v13];
}

void __83__PLBackgroundJobFeatureAvailabilityWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isSuccess])
  {
    v4 = [*(id *)(a1 + 32) globalValues];
    v5 = v4;
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [v3 error];
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "PLBackgroundJobFeatureAvailabilityWorker - failed to compute availability, error: %@", (uint8_t *)&v14, 0xCu);
    }
    v4 = [*(id *)(a1 + 32) globalValues];
    v5 = v4;
    uint64_t v6 = MEMORY[0x1E4F1CC38];
  }
  [v4 setFeatureAvailabilityJobDidFail:v6];

  v9 = [MEMORY[0x1E4F1C9C8] date];
  v10 = [*(id *)(a1 + 32) globalValues];
  [v10 setTimeOfLastFeatureAvailabilityJob:v9];

  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [v3 error];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  v13 = PLBackendGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "PLBackgroundJobFeatureAvailabilityWorker - finished feature availability computation", (uint8_t *)&v14, 2u);
  }
}

- (BOOL)_featureAvailabilityIsStale:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 processingSnapshot];
  int v8 = [v7 hasConsistentMediaAnalysisImageVersion];

  if (v8)
  {
    v9 = [v5 processingSnapshot];
    v10 = [v9 dateComputed];

    if (v10)
    {
      uint64_t v11 = [v6 globalValues];
      id v12 = [v11 searchIndexRebuildStartDate];
      if (v12
        && ([v11 searchIndexRebuildStartDate],
            v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = [v10 compare:v13],
            v13,
            v14 == -1))
      {
        BOOL v20 = 1;
      }
      else
      {
        id v15 = [v11 searchIndexRebuildEndDate];
        if (v15
          && ([v11 searchIndexRebuildEndDate],
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              uint64_t v17 = [v10 compare:v16],
              v16,
              v17 == -1))
        {
          BOOL v20 = 1;
        }
        else
        {
          v18 = [v11 dateOfLastExternalAvailabilitySignal];
          if (v18)
          {
            v19 = [v11 dateOfLastExternalAvailabilitySignal];
            BOOL v20 = [v10 compare:v19] == -1;
          }
          else
          {
            BOOL v20 = 0;
          }
        }
      }
    }
    else
    {
      v21 = PLBackendGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "PLBackgroundJobFeatureAvailabilityWorker - Processing snapshot is missing dateComputed", v23, 2u);
      }

      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 globalValues];
  id v6 = [v5 timeOfLastFeatureAvailabilityJob];
  uint64_t v7 = [v5 featureAvailabilityJobDidFail];
  if (!v7)
  {
    BOOL v11 = v6 != 0;
LABEL_9:
    BOOL v20 = [v4 globalValues];
    id v12 = [v20 featureAvailability];

    if (v12 && v11)
    {
      v21 = [[PLFeatureAvailability alloc] initWithDictionary:v12];
      if (![(PLBackgroundJobFeatureAvailabilityWorker *)self _featureAvailabilityIsStale:v21 inLibrary:v4])
      {
        v22 = [MEMORY[0x1E4F1C9C8] now];
        [v22 timeIntervalSinceDate:v6];
        double v24 = v23;
        [(id)objc_opt_class() minimumSecondsBetweenJobs];
        if (v24 < v25)
        {
          v31 = PLBackendGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            double v35 = v24;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_INFO, "PLBackgroundJobFeatureAvailabilityWorker - Job ran recently (%f seconds ago), no need to run again", buf, 0xCu);
          }

          v29 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
          goto LABEL_20;
        }
      }
    }
    v21 = +[PLBackgroundJobCriteria criteriaForFeatureAvailabilityWorker];
    v26 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    uint64_t v32 = MEMORY[0x1E4F1CC08];
    v27 = (void *)MEMORY[0x1E4F1C978];
    v28 = &v32;
LABEL_19:
    v22 = objc_msgSend(v27, "arrayWithObjects:count:", v28, 1, v32, v33);
    v29 = [(PLBackgroundJobWorkerPendingWorkItems *)v26 initWithCriteria:v21 workItemsNeedingProcessing:v22];
LABEL_20:
    v19 = v29;

    goto LABEL_21;
  }
  int v8 = (void *)v7;
  v9 = [v5 featureAvailabilityJobDidFail];
  int v10 = [v9 BOOLValue];

  BOOL v11 = v6 != 0;
  if (!v10 || !v6) {
    goto LABEL_9;
  }
  id v12 = [MEMORY[0x1E4F1C9C8] now];
  [v12 timeIntervalSinceDate:v6];
  double v14 = v13;
  [(id)objc_opt_class() minimumSecondsBetweenJobs];
  double v16 = v15;
  uint64_t v17 = PLBackendGetLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v14 >= v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 134217984;
      double v35 = v14;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "PLBackgroundJobFeatureAvailabilityWorker - Previous job failed (%f seconds ago), trying again", buf, 0xCu);
    }

    v21 = +[PLBackgroundJobCriteria criteriaForFeatureAvailabilityWorker];
    v26 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    uint64_t v33 = MEMORY[0x1E4F1CC08];
    v27 = (void *)MEMORY[0x1E4F1C978];
    v28 = &v33;
    goto LABEL_19;
  }
  if (v18)
  {
    *(_DWORD *)buf = 134217984;
    double v35 = v14;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "PLBackgroundJobFeatureAvailabilityWorker - Previous job failed (%f seconds ago), throttling to avoid failure loop", buf, 0xCu);
  }

  v19 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
LABEL_21:

  return v19;
}

@end