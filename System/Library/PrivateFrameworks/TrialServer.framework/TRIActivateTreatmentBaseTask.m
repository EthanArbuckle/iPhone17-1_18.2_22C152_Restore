@interface TRIActivateTreatmentBaseTask
- (BOOL)_experimentRecord:(id)a3 hasConflictWithExperimentsInDatabase:(id)a4 conflictEndTime:(id *)a5;
- (BOOL)_writeNamespaceDescriptorsWithPaths:(id)a3 toTreatmentLayer:(unint64_t)a4 forExperiment:(id)a5 treatmentURLs:(id)a6 context:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresTreatmentInstallation;
- (BOOL)updateLoggingWithExperimentRecord:(id)a3 paths:(id)a4 trackingId:(id)a5 newLogTreatmentAddedOut:(id *)a6;
- (NSDate)endTime;
- (TRIActivateTreatmentBaseTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 requiresTreatmentInstallation:(BOOL)a6;
- (id)_nextTasksForRunStatus:(int)a3;
- (id)runTaskUsingContext:(id)a3;
- (id)runTaskUsingContext:(id)a3 experiment:(id)a4;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)startTime;
- (unint64_t)hash;
- (void)runDequeueHandlerUsingContext:(id)a3;
- (void)runEnqueueHandlerUsingContext:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation TRIActivateTreatmentBaseTask

- (TRIActivateTreatmentBaseTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 requiresTreatmentInstallation:(BOOL)a6
{
  v8.receiver = self;
  v8.super_class = (Class)TRIActivateTreatmentBaseTask;
  result = [(TRITreatmentBaseTask *)&v8 initWithExperiment:a3 treatmentId:a4 taskAttributing:a5];
  if (result) {
    result->_requiresTreatmentInstallation = a6;
  }
  return result;
}

- (id)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  id v4 = a3;
  v5 = [(TRIExperimentBaseTask *)self experiment];
  v6 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v5];

  v7 = [v4 contentTracker];
  [v7 addRefWithContentIdentifier:v6];

  id v11 = [(TRIExperimentBaseTask *)self containerForFirstNamespaceInExperimentWithContext:v4];
  objc_super v8 = [(TRITreatmentBaseTask *)self treatmentId];
  v9 = +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:v8 container:v11];

  v10 = [v4 contentTracker];

  [v10 addRefWithContentIdentifier:v9];
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TRIExperimentBaseTask *)self containerForFirstNamespaceInExperimentWithContext:v4];
  v6 = [(TRITreatmentBaseTask *)self treatmentId];
  v7 = +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:v6 container:v5];

  objc_super v8 = [v4 contentTracker];
  char v9 = [v8 dropRefWithContentIdentifier:v7];

  if ((v9 & 1) == 0)
  {
    v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16 = [(TRITreatmentBaseTask *)self treatmentId];
      int v19 = 138412290;
      v20 = v16;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for treatment %@.", (uint8_t *)&v19, 0xCu);
    }
  }

  id v11 = [(TRIExperimentBaseTask *)self experiment];
  v12 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v11];

  v13 = [v4 contentTracker];
  char v14 = [v13 dropRefWithContentIdentifier:v12];

  if ((v14 & 1) == 0)
  {
    v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = [(TRIExperimentBaseTask *)self experiment];
      v18 = [v17 shortDesc];
      int v19 = 138543362;
      v20 = v18;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for experiment %{public}@.", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (BOOL)_experimentRecord:(id)a3 hasConflictWithExperimentsInDatabase:(id)a4 conflictEndTime:(id *)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 namespaces];
  v12 = objc_opt_new();
  v13 = objc_msgSend(v11, "_pas_leftFoldWithInitialObject:accumulate:", v12, &__block_literal_global_33);

  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__56;
  v66 = __Block_byref_object_dispose__56;
  id v67 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__56;
  v60 = __Block_byref_object_dispose__56;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__56;
  v54 = __Block_byref_object_dispose__56;
  id v55 = 0;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __103__TRIActivateTreatmentBaseTask__experimentRecord_hasConflictWithExperimentsInDatabase_conflictEndTime___block_invoke_24;
  v41[3] = &unk_1E6BBE530;
  id v14 = v9;
  id v42 = v14;
  v45 = &v62;
  id v15 = v13;
  v46 = &v68;
  v47 = &v56;
  v48 = &v50;
  SEL v49 = a2;
  id v43 = v15;
  v44 = self;
  v16 = (void *)MEMORY[0x1E016EA80](v41);
  v17 = (void *)MEMORY[0x1E016E7F0]();
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F347BBD0, &unk_1F347BBE8, 0);
  if (([v14 isShadow] & 1) == 0
    && [v14 type] != 3
    && ([v10 enumerateExperimentRecordsMatchingStatuses:v18 block:v16] & 1) == 0)
  {
    v28 = TRILogCategory_Server();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v32 = [v14 experimentDeployment];
      v33 = [v32 shortDesc];
      *(_DWORD *)buf = 138543362;
      v73 = v33;
      _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "unable to check if treatment can be activated for %{public}@", buf, 0xCu);
    }
    id v27 = [MEMORY[0x1E4F1C9C8] now];
    goto LABEL_19;
  }
  if (*((unsigned char *)v69 + 24))
  {
    if (!v57[5])
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a2 object:self file:@"TRIActivateTreatmentBaseTask.m" lineNumber:184 description:@"detected a conflict but experiment id is nil"];
    }
    if (!v51[5])
    {
      id v22 = *a5;
      *a5 = 0;

      v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v37 = [v14 treatmentId];
        v39 = [v14 experimentDeployment];
        v23 = [v39 shortDesc];
        v24 = [(id)v63[5] firstObject];
        v25 = [v24 name];
        v26 = (void *)v57[5];
        *(_DWORD *)buf = 138413058;
        v73 = v37;
        __int16 v74 = 2114;
        v75 = v23;
        __int16 v76 = 2114;
        v77 = v25;
        __int16 v78 = 2114;
        v79 = v26;
        _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for %{public}@: namespace %{public}@ is currently used in experiment %{public}@ which has no end date", buf, 0x2Au);
      }
      goto LABEL_20;
    }
    int v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v38 = [v14 treatmentId];
      v40 = [v14 experimentDeployment];
      v35 = [v40 shortDesc];
      v36 = [(id)v63[5] firstObject];
      v30 = [v36 name];
      v31 = [(id)v57[5] shortDesc];
      *(_DWORD *)buf = 138413058;
      v73 = v38;
      __int16 v74 = 2114;
      v75 = v35;
      __int16 v76 = 2114;
      v77 = v30;
      __int16 v78 = 2112;
      v79 = v31;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for experiment %{public}@: namespace %{public}@ is currently used in experiment %@", buf, 0x2Au);
    }
    if ([v14 type] == 1)
    {
      v20 = *a5;
      *a5 = 0;
LABEL_20:

      BOOL v21 = 1;
      goto LABEL_21;
    }
    id v27 = (id)v51[5];
LABEL_19:
    v20 = *a5;
    *a5 = v27;
    goto LABEL_20;
  }
  BOOL v21 = 0;
LABEL_21:

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  return v21;
}

id __103__TRIActivateTreatmentBaseTask__experimentRecord_hasConflictWithExperimentsInDatabase_conflictEndTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 name];
  [v4 addObject:v5];

  return v4;
}

void __103__TRIActivateTreatmentBaseTask__experimentRecord_hasConflictWithExperimentsInDatabase_conflictEndTime___block_invoke_24(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [v5 experimentDeployment];
  v7 = [v6 experimentId];
  objc_super v8 = [*(id *)(a1 + 32) experimentDeployment];
  id v9 = [v8 experimentId];
  char v10 = [v7 isEqualToString:v9];

  if ((v10 & 1) == 0 && ([v5 isShadow] & 1) == 0)
  {
    id v11 = [v5 namespaces];

    if (v11)
    {
      v12 = [v5 namespaces];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __103__TRIActivateTreatmentBaseTask__experimentRecord_hasConflictWithExperimentsInDatabase_conflictEndTime___block_invoke_25;
      v40[3] = &unk_1E6BBCC80;
      v41 = *(id *)(a1 + 40);
      uint64_t v13 = objc_msgSend(v12, "_pas_filteredArrayWithTest:", v40);
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count]
        && [v5 type] != 3
        && [v5 type] == 1
        && [v5 status] == 1)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        v16 = [v5 endDate];

        if (v16)
        {
          v17 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          if (!v17
            || ([v5 endDate],
                v18 = objc_claimAutoreleasedReturnValue(),
                uint64_t v19 = [v17 compare:v18],
                v18,
                v19 == -1))
          {
            uint64_t v24 = [v5 experimentDeployment];
            uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
            v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = v24;

            uint64_t v27 = [v5 endDate];
            uint64_t v28 = *(void *)(*(void *)(a1 + 80) + 8);
            v29 = *(void **)(v28 + 40);
            *(void *)(v28 + 40) = v27;
          }
          else if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
          {
            v20 = [MEMORY[0x1E4F28B00] currentHandler];
            [v20 handleFailureInMethod:*(void *)(a1 + 88) object:*(void *)(a1 + 48) file:@"TRIActivateTreatmentBaseTask.m" lineNumber:159 description:@"expected end date of conflicting experiment to be non-nil here"];
          }
        }
        else
        {
          v30 = TRILogCategory_Server();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v36 = [v5 experimentDeployment];
            v37 = [v36 shortDesc];
            v38 = [*(id *)(a1 + 32) experimentDeployment];
            v39 = [v38 shortDesc];
            *(_DWORD *)buf = 138412546;
            id v43 = v37;
            __int16 v44 = 2112;
            v45 = v39;
            _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "active experiment %@ has no end date, which prevents treatment for %@ from getting activated", buf, 0x16u);
          }
          uint64_t v31 = [v5 experimentDeployment];
          uint64_t v32 = *(void *)(*(void *)(a1 + 72) + 8);
          v33 = *(void **)(v32 + 40);
          *(void *)(v32 + 40) = v31;

          uint64_t v34 = *(void *)(*(void *)(a1 + 80) + 8);
          v35 = *(void **)(v34 + 40);
          *(void *)(v34 + 40) = 0;

          *a3 = 1;
        }
      }
      BOOL v21 = v41;
    }
    else
    {
      BOOL v21 = TRILogCategory_Server();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v5 experimentDeployment];
        v23 = [v22 shortDesc];
        *(_DWORD *)buf = 138543362;
        id v43 = v23;
        _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "experiment record for %{public}@ is missing namespaces", buf, 0xCu);
      }
    }
  }
}

uint64_t __103__TRIActivateTreatmentBaseTask__experimentRecord_hasConflictWithExperimentsInDatabase_conflictEndTime___block_invoke_25(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 name];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)_writeNamespaceDescriptorsWithPaths:(id)a3 toTreatmentLayer:(unint64_t)a4 forExperiment:(id)a5 treatmentURLs:(id)a6 context:(id)a7
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v83 = a7;
  uint64_t v80 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v14 = [v11 namespaces];
  v77 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count"));

  id v15 = (void *)MEMORY[0x1E4F1CA48];
  v16 = [v11 namespaces];
  v17 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v18 = [v11 namespaces];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v93 objects:v105 count:16];
  BOOL v21 = v19 == 0;
  uint64_t v85 = v19;
  if (v19)
  {
    id obj = v18;
    BOOL v73 = v19 == 0;
    __int16 v74 = v11;
    uint64_t v22 = *(void *)v94;
    int v84 = 1;
    *(void *)&long long v20 = 138543618;
    long long v70 = v20;
    id v76 = v10;
    id v78 = v12;
    uint64_t v79 = *(void *)v94;
    while (2)
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v94 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v93 + 1) + 8 * v23);
        uint64_t v25 = objc_msgSend(v24, "name", v70);

        if (v25)
        {
          v26 = v12;
          id v27 = v10;
          id v28 = v10;
          v29 = [v83 namespaceDatabase];
          v30 = [v24 name];
          uint64_t v31 = [v29 dynamicNamespaceRecordWithNamespaceName:v30];

          v88 = v31;
          if (v31
            && ([v31 appContainer],
                uint64_t v32 = objc_claimAutoreleasedReturnValue(),
                v32,
                v32))
          {
            v33 = [v31 appContainer];
            uint64_t v34 = [v28 pathsForContainer:v33 asClientProcess:0];

            id v28 = (id)v34;
            id v10 = v27;
            if (!v34)
            {
              uint64_t v58 = TRILogCategory_Server();
              BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
              id v12 = v26;
              if (v59)
              {
                uint64_t v68 = [v88 appContainer];
                v69 = [v68 identifier];
                *(_DWORD *)buf = 138543362;
                v100 = v69;
                _os_log_error_impl(&dword_1DA291000, v58, OS_LOG_TYPE_ERROR, "Can't write descriptor for dynamic namespace to missing container: %{public}@", buf, 0xCu);
              }
              goto LABEL_45;
            }
          }
          else
          {
            id v10 = v27;
          }
          v86 = v28;
          [v28 namespaceDescriptorsPathForLayer:a4];
          v87 = id v12 = v26;
          if (!v87)
          {
            v57 = [MEMORY[0x1E4F28B00] currentHandler];
            [v57 handleFailureInMethod:a2 object:self file:@"TRIActivateTreatmentBaseTask.m" lineNumber:240 description:@"namespace descriptor directory is NIL"];
          }
          v35 = [v24 name];
          v36 = [v26 objectForKey:v35];

          if (v36)
          {
            v37 = [v36 triPathAsOwner:0];
            if (v37)
            {
              v38 = v37;
              if ([v37 isAbsolutePath])
              {
                v39 = v38;
              }
              else
              {
                v41 = [v28 containerDir];
                if (v41)
                {
                  v75 = NSString;
                  id v42 = [v28 containerDir];
                  v98[0] = v42;
                  v98[1] = v38;
                  id v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
                  v39 = [v75 pathWithComponents:v43];

                  id v12 = v78;
                }
                else
                {
                  v39 = v38;
                }
              }
              if ([v80 fileExistsAtPath:v39])
              {
                if (v88)
                {
                  __int16 v44 = [v88 appContainer];
                  uint64_t v45 = [v88 cloudKitContainer];
                }
                else
                {
                  __int16 v44 = 0;
                  uint64_t v45 = 1;
                }
                v47 = objc_opt_new();
                [v47 setFactorsURL:v36];
                [v47 setAppContainer:v44];
                [v47 setCloudKitContainerId:v45];
                id v48 = objc_alloc(MEMORY[0x1E4FB01A0]);
                SEL v49 = [v24 name];
                uint64_t v50 = objc_msgSend(v48, "initWithNamespaceName:downloadNCV:optionalParams:", v49, objc_msgSend(v24, "compatibilityVersion"), v47);

                [v77 addObject:v50];
                [v17 addObject:v87];
                v84 &= [v50 saveToDirectory:v87];

                int v40 = 1;
                id v10 = v76;
                id v12 = v78;
              }
              else
              {
                uint64_t v46 = TRILogCategory_Server();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  v54 = [v74 experimentDeployment];
                  id v55 = [v54 shortDesc];
                  uint64_t v56 = [v24 name];
                  *(_DWORD *)buf = v70;
                  v100 = v55;
                  __int16 v101 = 2114;
                  v102 = v56;
                  _os_log_error_impl(&dword_1DA291000, v46, OS_LOG_TYPE_ERROR, "treatment file does not exist for experiment %{public}@ on namespace %{public}@", buf, 0x16u);

                  id v12 = v78;
                }

                int v40 = 0;
                int v84 = 0;
              }
              uint64_t v22 = v79;
            }
            else
            {
              v38 = TRILogCategory_Server();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                v51 = [v74 experimentDeployment];
                uint64_t v52 = [v51 shortDesc];
                v53 = [v24 name];
                *(_DWORD *)buf = 138412802;
                v100 = v36;
                __int16 v101 = 2114;
                v102 = v52;
                __int16 v103 = 2114;
                v104 = v53;
                _os_log_error_impl(&dword_1DA291000, v38, OS_LOG_TYPE_ERROR, "can't resolve factorsPath for URL %@ from experiment %{public}@ on namespace %{public}@", buf, 0x20u);

                id v12 = v78;
                uint64_t v22 = v79;
              }
              int v40 = 0;
              int v84 = 0;
            }
          }
          else
          {
            int v40 = 1;
          }

          if (!v40) {
            goto LABEL_40;
          }
        }
        else
        {
          int v84 = 0;
        }
        ++v23;
      }
      while (v85 != v23);
      uint64_t v85 = [obj countByEnumeratingWithState:&v93 objects:v105 count:16];
      if (v85) {
        continue;
      }
      break;
    }
LABEL_40:

    if (v84)
    {
      BOOL v21 = 1;
      id v11 = v74;
      goto LABEL_55;
    }
LABEL_45:
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v18 = v77;
    uint64_t v60 = [v18 countByEnumeratingWithState:&v89 objects:v97 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = 0;
      uint64_t v63 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v90 != v63) {
            objc_enumerationMutation(v18);
          }
          v65 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          v66 = [v17 objectAtIndexedSubscript:v62 + i];
          [v65 removeFromDirectory:v66];
        }
        uint64_t v61 = [v18 countByEnumeratingWithState:&v89 objects:v97 count:16];
        v62 += i;
      }
      while (v61);
      id v10 = v76;
    }
    id v11 = v74;
    BOOL v21 = v73;
  }

LABEL_55:
  return v21;
}

- (BOOL)updateLoggingWithExperimentRecord:(id)a3 paths:(id)a4 trackingId:(id)a5 newLogTreatmentAddedOut:(id *)a6
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v74 = a4;
  id v9 = [v8 artifact];
  id v10 = [v9 experiment];
  uint64_t v11 = [v10 projectId];

  id v12 = objc_opt_new();
  uint64_t v13 = [(TRIExperimentBaseTask *)self experiment];
  uint64_t v14 = [v13 experimentId];
  [v12 setExperimentId:v14];

  id v15 = [(TRITreatmentBaseTask *)self treatmentId];
  [v12 setTreatmentId:v15];

  v16 = [(TRIExperimentBaseTask *)self experiment];
  objc_msgSend(v12, "setDeploymentId:", objc_msgSend(v16, "deploymentId"));

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v17 = [v8 namespaces];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v92 objects:v103 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v93 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = (void *)MEMORY[0x1E4FB05B8];
        uint64_t v23 = [*(id *)(*((void *)&v92 + 1) + 8 * i) name];
        objc_msgSend(v12, "addNamespaceId:", objc_msgSend(v22, "namespaceIdFromName:", v23));
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v92 objects:v103 count:16];
    }
    while (v19);
  }
  id v72 = v12;

  uint64_t v24 = v74;
  uint64_t v25 = +[TRILogTreatmentProvider providerWithProjectId:v11 paths:v74];
  uint64_t v68 = v8;
  v26 = [v8 namespaces];
  id v27 = objc_msgSend(v26, "_pas_mappedArrayWithTransform:", &__block_literal_global_57);

  v66 = v25;
  id v28 = [v25 fetchRolloutLogNamespaces];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = v27;
  uint64_t v73 = [obj countByEnumeratingWithState:&v88 objects:v102 count:16];
  if (v73)
  {
    uint64_t v70 = *(void *)v89;
    char v71 = v28;
    do
    {
      for (uint64_t j = 0; j != v73; ++j)
      {
        if (*(void *)v89 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void *)(*((void *)&v88 + 1) + 8 * j);
        uint64_t v31 = objc_opt_new();
        uint64_t v32 = (void *)MEMORY[0x1E4FB01A0];
        v33 = [v24 namespaceDescriptorsDefaultDir];
        uint64_t v78 = v30;
        uint64_t v34 = [v32 loadWithNamespaceName:v30 fromDirectory:v33];

        id v76 = (void *)v34;
        if (v34)
        {
          v77 = [MEMORY[0x1E4FB01A8] factorProviderWithNamespaceDescriptor:v34 paths:v24 faultOnMissingFactors:0 shouldLockFactorDirectory:0];
          v35 = [v77 factorLevels];
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v84 objects:v101 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v85;
            do
            {
              for (uint64_t k = 0; k != v37; ++k)
              {
                if (*(void *)v85 != v38) {
                  objc_enumerationMutation(v35);
                }
                int v40 = *(void **)(*((void *)&v84 + 1) + 8 * k);
                v41 = [v40 factor];
                if ([v41 hasName])
                {
                  id v42 = [v41 name];
                  uint64_t v43 = [v42 length];

                  if (v43)
                  {
                    __int16 v44 = [v41 name];
                    [v31 setObject:v40 forKeyedSubscript:v44];
                  }
                }
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v84 objects:v101 count:16];
            }
            while (v37);
          }

          uint64_t v24 = v74;
        }
        else
        {
          v77 = 0;
        }
        v75 = [MEMORY[0x1E4FB01A8] factorProviderWithNamespaceName:v78 paths:v24 treatmentLayer:2 faultOnMissingFactors:0 shouldLockFactorDirectory:1];
        uint64_t v45 = [v75 factorLevels];
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        uint64_t v46 = [v45 countByEnumeratingWithState:&v80 objects:v100 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v81;
          do
          {
            for (uint64_t m = 0; m != v47; ++m)
            {
              if (*(void *)v81 != v48) {
                objc_enumerationMutation(v45);
              }
              uint64_t v50 = *(void **)(*((void *)&v80 + 1) + 8 * m);
              v51 = [v50 factor];
              if ([v51 hasName])
              {
                uint64_t v52 = [v51 name];
                uint64_t v53 = [v52 length];

                if (v53)
                {
                  v54 = [v51 name];
                  [v31 setObject:v50 forKeyedSubscript:v54];
                }
              }
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v80 objects:v100 count:16];
          }
          while (v47);
        }
        id v55 = [v31 allValues];
        uint64_t v56 = [v55 sortedArrayUsingComparator:&__block_literal_global_62];

        v57 = [MEMORY[0x1E4FB0560] hashForFactorLevels:v56];
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __107__TRIActivateTreatmentBaseTask_updateLoggingWithExperimentRecord_paths_trackingId_newLogTreatmentAddedOut___block_invoke_3;
        v79[3] = &unk_1E6BBE558;
        v79[4] = v78;
        id v28 = v71;
        uint64_t v58 = [v71 indexOfObjectPassingTest:v79];
        if (v58 == 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v59 = 0;
        }
        else
        {
          BOOL v59 = [v71 objectAtIndexedSubscript:v58];
        }
        uint64_t v24 = v74;
        id v60 = objc_alloc_init(MEMORY[0x1E4FB0588]);
        [v60 setName:v78];
        if (v57)
        {
          [v60 setHashData:v57];
          [v60 setHashIncludesDefaults:v77 != 0];
          uint64_t v61 = TRILogCategory_Server();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v97 = v78;
            __int16 v98 = 2112;
            v99 = v57;
            _os_log_impl(&dword_1DA291000, v61, OS_LOG_TYPE_DEFAULT, "updated namespace %{public}@ with hash %@", buf, 0x16u);
          }
        }
        uint64_t v62 = [v59 latestRolloutId];
        [v60 setLatestRolloutId:v62];

        objc_msgSend(v60, "setRolloutCount:", objc_msgSend(v59, "rolloutCount"));
        [v72 addNamespace:v60];
      }
      uint64_t v73 = [obj countByEnumeratingWithState:&v88 objects:v102 count:16];
    }
    while (v73);
  }

  if (a6) {
    objc_storeStrong(a6, v72);
  }
  char v63 = [v66 addTreatment:v72];
  if ((v63 & 1) == 0)
  {
    uint64_t v64 = [v72 treatmentId];
    [v66 removeTreatment:v64];
  }
  return v63;
}

uint64_t __107__TRIActivateTreatmentBaseTask_updateLoggingWithExperimentRecord_paths_trackingId_newLogTreatmentAddedOut___block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

uint64_t __107__TRIActivateTreatmentBaseTask_updateLoggingWithExperimentRecord_paths_trackingId_newLogTreatmentAddedOut___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 factor];
  v6 = [v5 name];
  v7 = [v4 factor];

  id v8 = [v7 name];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

uint64_t __107__TRIActivateTreatmentBaseTask_updateLoggingWithExperimentRecord_paths_trackingId_newLogTreatmentAddedOut___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)runTaskUsingContext:(id)a3 experiment:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"TRIActivateTreatmentBaseTask.m" lineNumber:376 description:@"method not implemented"];

  uint64_t v7 = MEMORY[0x1E4F1CBF0];
  return +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:v7 earliestRetryDate:0];
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E016E7F0]();
  id v10 = (void *)os_transaction_create();
  if (([(TRIActivateTreatmentBaseTask *)self conformsToProtocol:&unk_1F3481788] & 1) == 0)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v20 = (objc_class *)objc_opt_class();
    BOOL v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, self, @"TRIActivateTreatmentBaseTask.m", 387, @"TRIActivateTreatmentBaseTask subclass of type %@ is not a TRITask", v21 object file lineNumber description];
  }
  uint64_t v11 = [(TRIExperimentBaseTask *)self experiment];
  id v12 = [v11 taskTag];
  v23[0] = self;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v8 cancelTasksWithTag:v12 excludingTasks:v13];

  uint64_t v14 = [(TRIExperimentBaseTask *)self experiment];
  id v15 = [v14 experimentId];
  uint64_t v22 = self;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v8 cancelTasksWithTag:v15 excludingTasks:v16];

  v17 = [(TRIActivateTreatmentBaseTask *)self runTaskUsingContext:v7];

  return v17;
}

- (id)_nextTasksForRunStatus:(int)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    uint64_t v4 = [(TRIExperimentBaseTask *)self experiment];
    id v5 = [v4 experimentId];
    v6 = [(TRIExperimentBaseTask *)self experiment];
    id v7 = +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v5, [v6 deploymentId], 0, 23, 0);
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

- (id)runTaskUsingContext:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 experimentDatabase];
  v6 = [(TRIExperimentBaseTask *)self experiment];
  id v7 = [v5 experimentRecordWithExperimentDeployment:v6];

  if (!v7)
  {
    id v28 = TRILogCategory_Server();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "failed to retrieve experiment record from database", buf, 2u);
    }

    id v7 = [(TRIActivateTreatmentBaseTask *)self _nextTasksForRunStatus:1];
    uint64_t v29 = 1;
    uint64_t v30 = v7;
    goto LABEL_26;
  }
  if ([v7 type] == 3) {
    [(TRIExperimentBaseTask *)self logAsRollout:1];
  }
  id v8 = objc_opt_new();
  uint64_t v9 = TRIDeploymentEnvironment_EnumDescriptor();
  id v10 = objc_msgSend(v9, "textFormatNameForValue:", objc_msgSend(v7, "deploymentEnvironment"));

  if (!v10) {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", (int)objc_msgSend(v7, "deploymentEnvironment"));
  }
  [v8 setClientDeploymentEnv:v10];
  [(TRIExperimentBaseTask *)self mergeTelemetry:v8];

  uint64_t v11 = [v7 treatmentId];
  if (!v11) {
    goto LABEL_8;
  }
  id v12 = (void *)v11;
  uint64_t v13 = [(TRITreatmentBaseTask *)self treatmentId];
  uint64_t v14 = [v7 treatmentId];
  char v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
LABEL_8:
    v16 = [v7 treatmentId];

    if (v16)
    {
      v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v46 = [v7 experimentDeployment];
        uint64_t v47 = [v46 shortDesc];
        uint64_t v48 = [v7 treatmentId];
        SEL v49 = [(TRITreatmentBaseTask *)self treatmentId];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v47;
        __int16 v59 = 2112;
        id v60 = v48;
        __int16 v61 = 2112;
        uint64_t v62 = v49;
        _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "experiment %{public}@ already has treatment %@ assigned.  Overwriting with treatment %@", buf, 0x20u);
      }
    }
    uint64_t v18 = [v4 experimentDatabase];
    uint64_t v19 = [(TRITreatmentBaseTask *)self treatmentId];
    uint64_t v20 = [v7 experimentDeployment];
    int v21 = [v18 setTreatmentId:v19 forExperimentDeployment:v20 usingTransaction:0];

    if (!v21)
    {
      uint64_t v30 = (void *)MEMORY[0x1E4F1CBF0];
      uint64_t v29 = 1;
LABEL_26:
      v35 = +[TRITaskRunResult resultWithRunStatus:v29 reportResultToServer:1 nextTasks:v30 earliestRetryDate:0];
      goto LABEL_27;
    }
    uint64_t v22 = [(TRITreatmentBaseTask *)self treatmentId];
    uint64_t v23 = [v7 copyWithReplacementTreatmentId:v22];

    id v7 = (void *)v23;
  }
  uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
  [v24 timeIntervalSince1970];
  double v26 = v25;

  id v27 = [(TRIActivateTreatmentBaseTask *)self endTime];
  if (v27) {
    [(TRIActivateTreatmentBaseTask *)self endTime];
  }
  else {
  uint64_t v31 = [v7 endDate];
  }
  [v31 timeIntervalSince1970];
  double v33 = v32;

  if (v33 > 0.0 && v33 <= v26)
  {
    uint64_t v34 = TRILogCategory_Server();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = [(TRITreatmentBaseTask *)self treatmentId];
      v51 = [(TRIExperimentBaseTask *)self experiment];
      uint64_t v52 = [v51 shortDesc];
      uint64_t v53 = [v7 endDate];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v50;
      __int16 v59 = 2114;
      id v60 = v52;
      __int16 v61 = 2112;
      uint64_t v62 = v53;
      _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for experiment %{public}@: end time %@ is in the past", buf, 0x20u);
    }
    uint64_t v30 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v29 = 3;
    goto LABEL_26;
  }
  uint64_t v37 = [v7 startDate];
  [v37 timeIntervalSince1970];
  double v39 = v38;

  if (v39 <= 0.0 || v39 <= v26)
  {
    *(void *)buf = 0;
    id v42 = [v4 experimentDatabase];
    BOOL v43 = [(TRIActivateTreatmentBaseTask *)self _experimentRecord:v7 hasConflictWithExperimentsInDatabase:v42 conflictEndTime:buf];

    if (v43)
    {
      if (*(void *)buf) {
        uint64_t v44 = 1;
      }
      else {
        uint64_t v44 = 3;
      }
      uint64_t v45 = [(TRIActivateTreatmentBaseTask *)self _nextTasksForRunStatus:v44];
      v35 = +[TRITaskRunResult resultWithRunStatus:v44 reportResultToServer:1 nextTasks:v45 earliestRetryDate:*(void *)buf];
    }
    else
    {
      v35 = [(TRIActivateTreatmentBaseTask *)self runTaskUsingContext:v4 experiment:v7];
    }
  }
  else
  {
    int v40 = TRILogCategory_Server();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v54 = [(TRITreatmentBaseTask *)self treatmentId];
      id v55 = [(TRIExperimentBaseTask *)self experiment];
      uint64_t v56 = [v55 shortDesc];
      v57 = [v7 startDate];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v54;
      __int16 v59 = 2114;
      id v60 = v56;
      __int16 v61 = 2112;
      uint64_t v62 = v57;
      _os_log_error_impl(&dword_1DA291000, v40, OS_LOG_TYPE_ERROR, "cannot activate treatment %@ for experiment %{public}@: start time %@ is in the future", buf, 0x20u);
    }
    v41 = [v7 startDate];
    v35 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:v41];
  }
LABEL_27:

  return v35;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)TRIActivateTreatmentBaseTask;
  return self->_requiresTreatmentInstallation + 37 * [(TRITreatmentBaseTask *)&v3 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIActivateTreatmentBaseTask *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRIActivateTreatmentBaseTask;
    unsigned int v5 = [(TRITreatmentBaseTask *)&v8 isEqual:v4];
    BOOL v6 = 0;
    if (v4 && v5)
    {
      objc_opt_class();
      BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
        && self->_requiresTreatmentInstallation == v4->_requiresTreatmentInstallation;
    }
  }

  return v6;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (BOOL)requiresTreatmentInstallation
{
  return self->_requiresTreatmentInstallation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end