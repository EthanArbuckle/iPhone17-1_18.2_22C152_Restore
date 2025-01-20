@interface TRIFetchTreatmentTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6;
- (BOOL)_downloadAndSaveMAAssets:(id)a3 options:(id)a4 downloadNotificationKey:(id)a5 context:(id)a6 errorResult:(id *)a7 fetchError:(id *)a8;
- (BOOL)wasDeferred;
- (NSArray)dependencies;
- (NSString)description;
- (TRIFetchTreatmentTask)initWithCoder:(id)a3;
- (TRIFetchTreatmentTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6;
- (id)_asPersistedTask;
- (id)_fetchAssetsWithArtifactProvider:(id)a3 recordId:(id)a4 experimentRecord:(id)a5 assetIndexes:(id)a6 downloadOptions:(id)a7 context:(id)a8 assetURLs:(id *)a9 treatmentFetchError:(id *)a10;
- (id)_fetchTreatmentWithArtifactProvider:(id)a3 experimentRecord:(id)a4 downloadOptions:(id)a5 context:(id)a6 treatment:(id *)a7 recordId:(id *)a8 treatmentFetchError:(id *)a9;
- (id)_namespaceDescriptorForNamespaceName:(id)a3 fromExperimentRecord:(id)a4 referencingFactorsURL:(id)a5;
- (id)_nextTasksForRunStatus:(int)a3;
- (id)_nextTasksForRunStatusFailureWithDeactivationReason:(unint64_t)a3;
- (id)_saveTreatment:(id)a3 experimentRecord:(id)a4 assetURLs:(id)a5 assetMetadata:(id)a6 context:(id)a7 paths:(id)a8 downloadOptions:(id)a9;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (int)retryCount;
- (int)taskType;
- (unint64_t)requiredCapabilities;
- (unsigned)_ncvForNamespaceName:(id)a3 inExperimentRecord:(id)a4;
- (void)_addMetricForFetchTreatmentTaskError:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)runDequeueHandlerUsingContext:(id)a3;
- (void)runEnqueueHandlerUsingContext:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRIFetchTreatmentTask

- (int)taskType
{
  return 3;
}

- (TRIFetchTreatmentTask)initWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)TRIFetchTreatmentTask;
  v12 = [(TRITreatmentBaseTask *)&v15 initWithExperiment:a3 treatmentId:a4 taskAttributing:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_capabilityModifier, a6);
    v13->retryCount = 0;
  }

  return v13;
}

+ (id)taskWithExperiment:(id)a3 treatmentId:(id)a4 taskAttributing:(id)a5 capabilityModifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithExperiment:v13 treatmentId:v12 taskAttributing:v11 capabilityModifier:v10];

  return v14;
}

- (NSArray)dependencies
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(TRIExperimentBaseTask *)self experiment];
  v4 = [(TRITreatmentBaseTask *)self taskAttributing];
  v5 = +[TRIFetchExperimentTask taskWithExperimentDeployment:v3 taskAttributing:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  id v4 = a3;
  id v8 = [(TRIExperimentBaseTask *)self containerForFirstNamespaceInExperimentWithContext:v4];
  v5 = [(TRITreatmentBaseTask *)self treatmentId];
  v6 = +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:v5 container:v8];

  v7 = [v4 contentTracker];

  [v7 addRefWithContentIdentifier:v6];
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TRIExperimentBaseTask *)self containerForFirstNamespaceInExperimentWithContext:v4];
  v6 = [(TRITreatmentBaseTask *)self treatmentId];
  v7 = +[TRIContentTracker contentIdentifierForTreatmentArtifactWithTreatmentId:v6 container:v5];

  id v8 = [v4 contentTracker];

  LOBYTE(v4) = [v8 dropRefWithContentIdentifier:v7];
  if ((v4 & 1) == 0)
  {
    v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(TRITreatmentBaseTask *)self treatmentId];
      int v11 = 138412290;
      id v12 = v10;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for treatment %@.", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)_downloadAndSaveMAAssets:(id)a3 options:(id)a4 downloadNotificationKey:(id)a5 context:(id)a6 errorResult:(id *)a7 fetchError:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if ([v14 count])
  {
    id v30 = v15;
    v18 = objc_opt_new();
    v19 = [v18 ensureMobileAssetOriginFields];
    [v19 setIsMobileAsset:1];

    [(TRIExperimentBaseTask *)self mergeTelemetry:v18];
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__15;
    v41 = __Block_byref_object_dispose__15;
    v20 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatus:3];
    id v42 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:v20 earliestRetryDate:0];

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __113__TRIFetchTreatmentTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_errorResult_fetchError___block_invoke;
    v35[3] = &unk_1E6BB9EF8;
    id v22 = v21;
    id v36 = v22;
    [v14 enumerateObjectsUsingBlock:v35];
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    v24 = objc_opt_new();
    v25 = [(TRITreatmentBaseTask *)self taskAttributing];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __113__TRIFetchTreatmentTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_errorResult_fetchError___block_invoke_2;
    v31[3] = &unk_1E6BB9F20;
    v31[4] = self;
    v33 = &v37;
    v34 = a8;
    v26 = v23;
    v32 = v26;
    id v27 = (id)[v24 downloadAssets:v22 attribution:v25 aggregateProgress:0 group:0 completion:v31];

    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    if (a7) {
      objc_storeStrong(a7, (id)v38[5]);
    }
    BOOL v28 = [(id)v38[5] runStatus] == 2;

    _Block_object_dispose(&v37, 8);
    id v15 = v30;
  }
  else
  {
    BOOL v28 = 1;
  }

  return v28;
}

void __113__TRIFetchTreatmentTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_errorResult_fetchError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 metadata];
  id v4 = [v3 fullAssetId];

  [v2 setObject:v5 forKey:v4];
}

void __113__TRIFetchTreatmentTask__downloadAndSaveMAAssets_options_downloadNotificationKey_context_errorResult_fetchError___block_invoke_2(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5)
{
  id v17 = a4;
  id v9 = a5;
  if (a3) {
    [*(id *)(a1 + 32) setWasDeferred:1];
  }
  id v10 = *(void ***)(a1 + 56);
  int v11 = *v10;
  *id v10 = v9;
  id v12 = v9;

  uint64_t v13 = [TRITaskRunResult alloc];
  uint64_t v14 = [(TRITaskRunResult *)v13 initWithRunStatus:a2 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:v17];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_saveTreatment:(id)a3 experimentRecord:(id)a4 assetURLs:(id)a5 assetMetadata:(id)a6 context:(id)a7 paths:(id)a8 downloadOptions:(id)a9
{
  id v16 = a9;
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v114 = a3;
  id v119 = a4;
  id v107 = a5;
  id v108 = a6;
  id v17 = a7;
  id v120 = a8;
  id v109 = a9;
  v113 = v17;
  v118 = [v17 experimentDatabase];
  v106 = [v17 namespaceDatabase];
  v105 = [[TRIUserCovariates alloc] initWithContext:v17];
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke;
  v136[3] = &unk_1E6BB9F48;
  v136[4] = self;
  v110 = (void (**)(void, void))MEMORY[0x1E016EA80](v136);
  if (v114)
  {
    if ([v114 hasTreatmentId])
    {
      v18 = [(TRITreatmentBaseTask *)self treatmentId];
      v19 = [v114 treatmentId];
      char v20 = [v18 isEqualToString:v19];

      if (v20)
      {
        if (objc_msgSend(v114, "factorLevelArray_Count"))
        {
          v21 = objc_opt_new();
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v142 = __Block_byref_object_copy__15;
          *(void *)v143 = __Block_byref_object_dispose__15;
          *(void *)&v143[8] = 0;
          id v22 = TRILogCategory_Server();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v82 = objc_msgSend(v114, "factorLevelArray_Count");
            v83 = [(TRITreatmentBaseTask *)self treatmentId];
            v84 = [(TRIExperimentBaseTask *)self experiment];
            *(_DWORD *)v138 = 134218498;
            *(void *)&v138[4] = v82;
            *(_WORD *)&v138[12] = 2112;
            *(void *)&v138[14] = v83;
            *(_WORD *)&v138[22] = 2114;
            v139 = v84;
            _os_log_debug_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEBUG, "got %lu factors defined in treatment %@ for experiment %{public}@", v138, 0x20u);
          }
          *(void *)v138 = 0;
          *(void *)&v138[8] = v138;
          *(void *)&v138[16] = 0x2020000000;
          LOBYTE(v139) = 1;
          dispatch_semaphore_t v23 = [v114 factorLevelArray];
          v131[0] = MEMORY[0x1E4F143A8];
          v131[1] = 3221225472;
          v131[2] = __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke_300;
          v131[3] = &unk_1E6BB9F70;
          v131[4] = self;
          v134 = v138;
          id v24 = v21;
          id v132 = v24;
          id v133 = v106;
          v135 = buf;
          [v23 enumerateObjectsUsingBlock:v131];

          int v25 = *(unsigned __int8 *)(*(void *)&v138[8] + 24);
          if (*(unsigned char *)(*(void *)&v138[8] + 24))
          {
            if (*(void *)(*(void *)&buf[8] + 40))
            {
              v26 = objc_msgSend(MEMORY[0x1E4FB0650], "dimensionWithName:value:", @"client_app_bundle_id");
              [(TRIExperimentBaseTask *)self addDimension:v26];
              id v27 = [(TRIUserCovariates *)v105 tri_shortVersionStringForBundleId:*(void *)(*(void *)&buf[8] + 40)];
              BOOL v28 = [MEMORY[0x1E4FB0650] dimensionWithName:@"client_app_version" value:v27];
              [(TRIExperimentBaseTask *)self addDimension:v28];
            }
            v104 = [v24 allObjects];
          }
          else
          {
            [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:26];
            id v16 = v110[2](v110, 16);
            v104 = 0;
          }

          _Block_object_dispose(v138, 8);
          _Block_object_dispose(buf, 8);

          if (!v25) {
            goto LABEL_94;
          }
          if (v104)
          {
            if ([v104 count])
            {
              if ([v119 type] == 1)
              {
                id v36 = [(TRIExperimentBaseTask *)self experiment];
                uint64_t v37 = [v119 startDate];
                v38 = [v119 endDate];
                char v39 = [v118 namespacesAreAvailableForExperiment:v36 startDate:v37 endDate:v38 namespaces:v104];

                if ((v39 & 1) == 0)
                {
                  v81 = TRILogCategory_Server();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                  {
                    v97 = [(TRITreatmentBaseTask *)self treatmentId];
                    v98 = [(TRIExperimentBaseTask *)self experiment];
                    v99 = [v98 shortDesc];
                    v100 = [v104 componentsJoinedByString:@","];
                    v101 = [v119 startDate];
                    v102 = [v119 endDate];
                    *(_DWORD *)buf = 138413314;
                    *(void *)&buf[4] = v97;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v99;
                    *(_WORD *)&buf[22] = 2114;
                    v142 = v100;
                    *(_WORD *)v143 = 2112;
                    *(void *)&v143[2] = v101;
                    *(_WORD *)&v143[10] = 2112;
                    *(void *)&v143[12] = v102;
                    _os_log_error_impl(&dword_1DA291000, v81, OS_LOG_TYPE_ERROR, "cannot install treatment %@ of experiment %{public}@ -- namespaces %{public}@ not available for experimentation during time from %@ to %@", buf, 0x34u);
                  }
                  [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:28];
                  id v16 = v110[2](v110, 17);
                  goto LABEL_94;
                }
              }
              char v32 = 0;
LABEL_37:
              *(void *)v138 = 0;
              *(void *)&v138[8] = v138;
              *(void *)&v138[16] = 0x2810000000;
              v139 = "";
              char v140 = 1;
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3032000000;
              v142 = __Block_byref_object_copy__15;
              *(void *)v143 = __Block_byref_object_dispose__15;
              *(void *)&v143[8] = 0;
              v41 = [TRIAssetStore alloc];
              id v42 = [v109 activity];
              v43 = [(TRIAssetStore *)v41 initWithPaths:v120 monitoredActivity:v42];

              v44 = [v108 cloudKit];
              v125[0] = MEMORY[0x1E4F143A8];
              v125[1] = 3221225472;
              v125[2] = __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke_307;
              v125[3] = &unk_1E6BB9F98;
              SEL v130 = a2;
              v125[4] = self;
              id v126 = v107;
              v128 = v138;
              v45 = v43;
              v127 = v45;
              v129 = buf;
              [v44 enumerateObjectsUsingBlock:v125];

              if (*(unsigned char *)(*(void *)&v138[8] + 32))
              {
                if (*(unsigned char *)(*(void *)&v138[8] + 32) != 2)
                {
                  int v48 = 1;
                  goto LABEL_45;
                }
                [(TRIFetchTreatmentTask *)self setWasDeferred:1];
                [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:30];
                v46 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatus:1];
                id v16 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:v46 earliestRetryDate:0];
              }
              else
              {
                v46 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:*(void *)(*(void *)&buf[8] + 40) options:v109];
                if (v46)
                {
                  v47 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatus:1];
                  id v16 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:v47 earliestRetryDate:v46];
                }
                else
                {
                  id v16 = v110[2](v110, 20);
                  v46 = 0;
                }
              }

              int v48 = 0;
LABEL_45:

              _Block_object_dispose(buf, 8);
              _Block_object_dispose(v138, 8);
              if (!v48)
              {
LABEL_94:

                goto LABEL_13;
              }
              v116 = [[TRIClientTreatmentStorage alloc] initWithPaths:v120];
              v103 = [(TRIClientTreatmentStorage *)v116 saveTreatment:v114];
              if (_os_feature_enabled_impl())
              {
                v49 = [[TRIFBClientTreatmentStorage alloc] initWithPaths:v120];
                v50 = [(TRIFBClientTreatmentStorage *)v49 saveTreatment:v114];
                if (([v50 isEqual:v103] & 1) == 0)
                {
                  v51 = TRILogCategory_Server();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543618;
                    *(void *)&buf[4] = v50;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v103;
                    _os_log_error_impl(&dword_1DA291000, v51, OS_LOG_TYPE_ERROR, "Saving to fb based storage:%{public}@ did not match pb based storage:%{public}@", buf, 0x16u);
                  }
                }
                if (_os_feature_enabled_impl())
                {
                  id v52 = v50;

                  v103 = v52;
                }
              }
              if (v103)
              {
                v53 = [v119 treatmentId];
                BOOL v54 = v53 == 0;

                if (!v54
                  || ([(TRITreatmentBaseTask *)self treatmentId],
                      v55 = objc_claimAutoreleasedReturnValue(),
                      [(TRIExperimentBaseTask *)self experiment],
                      v56 = objc_claimAutoreleasedReturnValue(),
                      char v57 = [v118 setTreatmentId:v55 forExperimentDeployment:v56 usingTransaction:0], v56, v55, (v57 & 1) != 0))
                {
                  v112 = objc_opt_new();
                  if ((v32 & 1) != 0 || ![v104 count])
                  {
                    uint64_t v58 = 2;
                  }
                  else
                  {
                    long long v123 = 0u;
                    long long v124 = 0u;
                    long long v121 = 0u;
                    long long v122 = 0u;
                    id obj = v104;
                    uint64_t v117 = [obj countByEnumeratingWithState:&v121 objects:v137 count:16];
                    if (v117)
                    {
                      uint64_t v115 = *(void *)v122;
                      uint64_t v58 = 2;
                      do
                      {
                        for (uint64_t i = 0; i != v117; ++i)
                        {
                          if (*(void *)v122 != v115) {
                            objc_enumerationMutation(obj);
                          }
                          v60 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v121 + 1) + 8 * i);
                          v61 = [(TRITreatmentBaseTask *)self treatmentId];
                          v62 = [(TRIClientTreatmentStorage *)v116 urlForFactorsWithTreatmentId:v61 namespaceName:v60];

                          v63 = [(TRIExperimentBaseTask *)self experiment];
                          char v64 = [v118 setTreatmentURL:v62 forExperimentDeployment:v63 namespaceName:v60];

                          if ((v64 & 1) == 0)
                          {
                            [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:21];
                            uint64_t v58 = 3;
                          }
                          v65 = (void *)[objc_alloc(MEMORY[0x1E4FB0268]) initWithPaths:v120];
                          v66 = [(TRIExperimentBaseTask *)self experiment];
                          v67 = [v66 experimentId];
                          [v65 setExperimentId:v67];

                          v68 = [(TRIExperimentBaseTask *)self experiment];
                          objc_msgSend(v65, "setDeploymentId:", objc_msgSend(v68, "deploymentId"));

                          v69 = [(TRITreatmentBaseTask *)self treatmentId];
                          [v65 setTreatmentId:v69];

                          [v65 setNamespaceName:v60];
                          v70 = [v62 triPathAsOwner:0];
                          v71 = [v70 stringByDeletingLastPathComponent];

                          if (!v71 || ([v65 saveToDir:v71] & 1) == 0)
                          {
                            v72 = TRILogCategory_Server();
                            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                            {
                              v75 = [(TRITreatmentBaseTask *)self treatmentId];
                              v76 = [(TRIExperimentBaseTask *)self experiment];
                              *(_DWORD *)buf = 138412802;
                              *(void *)&buf[4] = v75;
                              *(_WORD *)&buf[12] = 2114;
                              *(void *)&buf[14] = v76;
                              *(_WORD *)&buf[22] = 2114;
                              v142 = v60;
                              _os_log_error_impl(&dword_1DA291000, v72, OS_LOG_TYPE_ERROR, "failed to save info for treatment %@ of experiment %{public}@ with namespace %{public}@", buf, 0x20u);
                            }
                            [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:18];
                            uint64_t v58 = 3;
                          }
                          v73 = [(TRIFetchTreatmentTask *)self _namespaceDescriptorForNamespaceName:v60 fromExperimentRecord:v119 referencingFactorsURL:v62];
                          if (v73)
                          {
                            [v112 addObject:v73];
                          }
                          else
                          {
                            v74 = TRILogCategory_Server();
                            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                            {
                              v77 = [(TRITreatmentBaseTask *)self treatmentId];
                              v78 = [(TRIExperimentBaseTask *)self experiment];
                              *(_DWORD *)buf = 138412802;
                              *(void *)&buf[4] = v77;
                              *(_WORD *)&buf[12] = 2114;
                              *(void *)&buf[14] = v78;
                              *(_WORD *)&buf[22] = 2114;
                              v142 = v60;
                              _os_log_error_impl(&dword_1DA291000, v74, OS_LOG_TYPE_ERROR, "failed to compute namespace descriptor set entry for treatment %@ of experiment %{public}@ with namespace %{public}@", buf, 0x20u);
                            }
                            [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:7];
                            uint64_t v58 = 3;
                          }
                        }
                        uint64_t v117 = [obj countByEnumeratingWithState:&v121 objects:v137 count:16];
                      }
                      while (v117);
                    }
                    else
                    {
                      uint64_t v58 = 2;
                    }
                  }
                  v91 = [[TRINamespaceDescriptorSetStorage alloc] initWithPaths:v120];
                  v92 = [(TRITreatmentBaseTask *)self treatmentId];
                  BOOL v93 = [(TRINamespaceDescriptorSetStorage *)v91 overwriteNamespaceDescriptors:v112 forTreatmentId:v92];

                  if (!v93)
                  {
                    [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:17];
                    uint64_t v58 = 3;
                  }

                  v94 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatus:v58];
                  id v16 = +[TRITaskRunResult resultWithRunStatus:v58 reportResultToServer:1 nextTasks:v94 earliestRetryDate:0];

                  goto LABEL_93;
                }
                v80 = TRILogCategory_Server();
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                {
                  v95 = [(TRITreatmentBaseTask *)self treatmentId];
                  v96 = [(TRIExperimentBaseTask *)self experiment];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v95;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v96;
                  _os_log_debug_impl(&dword_1DA291000, v80, OS_LOG_TYPE_DEBUG, "failed to save treatment id %@ to database for experiment %{public}@", buf, 0x16u);
                }
                [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:19];
                uint64_t v79 = v110[2](v110, 18);
              }
              else
              {
                [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:20];
                uint64_t v79 = v110[2](v110, 18);
              }
              id v16 = (void *)v79;
LABEL_93:

              goto LABEL_94;
            }
            char v32 = 0;
          }
          else
          {
            v104 = 0;
            char v32 = 1;
          }
        }
        else
        {
          v31 = TRILogCategory_Server();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v88 = [(TRITreatmentBaseTask *)self treatmentId];
            v89 = [(TRIExperimentBaseTask *)self experiment];
            v90 = [v89 shortDesc];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v88;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v90;
            _os_log_debug_impl(&dword_1DA291000, v31, OS_LOG_TYPE_DEBUG, "no factors defined in treatment %@ for experiment %{public}@", buf, 0x16u);
          }
          v104 = 0;
          char v32 = 1;
        }
        v40 = TRILogCategory_Server();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          v85 = [(TRITreatmentBaseTask *)self treatmentId];
          v86 = [(TRIExperimentBaseTask *)self experiment];
          v87 = [v86 shortDesc];
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v85;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v87;
          _os_log_debug_impl(&dword_1DA291000, v40, OS_LOG_TYPE_DEBUG, "no namespaces used in treatment %@ for experiment %{public}@", buf, 0x16u);
        }
        goto LABEL_37;
      }
    }
  }
  v29 = TRILogCategory_Server();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v33 = [(TRITreatmentBaseTask *)self treatmentId];
    int v34 = [v114 hasTreatmentId];
    if (v34)
    {
      v35 = [v114 treatmentId];
    }
    else
    {
      v35 = @"(unset)";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v33;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v35;
    _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Mismatched treatmentId: (exp: %@, act: %@)", buf, 0x16u);
    if (v34) {
  }
    }
  [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:27];
  id v16 = v110[2](v110, 15);
LABEL_13:

  return v16;
}

id __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 134217984;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Saving treatment failed with reason: %lu", (uint8_t *)&v8, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) _nextTasksForRunStatusFailureWithDeactivationReason:a2];
  v6 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:v5 earliestRetryDate:0];

  return v6;
}

void __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke_300(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v6 = [a2 factor];
  v7 = [v6 namespaceString];

  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v7];
    int v8 = [*(id *)(a1 + 48) dynamicNamespaceRecordWithNamespaceName:v7];
    if (v8 && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v9 = [*(id *)(a1 + 32) taskAttributing];
      uint64_t v10 = [v9 applicationBundleIdentifier];
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }
  else
  {
    uint64_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [*(id *)(a1 + 32) treatmentId];
      uint64_t v15 = [*(id *)(a1 + 32) experiment];
      int v16 = 138412546;
      id v17 = v14;
      __int16 v18 = 2114;
      v19 = v15;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "factor message does not contain namespace field in treatment %@ of experiment %{public}@", (uint8_t *)&v16, 0x16u);
    }
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void __111__TRIFetchTreatmentTask__saveTreatment_experimentRecord_assetURLs_assetMetadata_context_paths_downloadOptions___block_invoke_307(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v7 = [v6 metadata];
  int v8 = [v7 treatmentIndex];

  if (!v8)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"TRIFetchTreatmentTask.m", 256, @"Expression was unexpectedly nil/false: %@", @"ra.metadata.treatmentIndex" object file lineNumber description];
  }
  uint64_t v9 = [v8 index];

  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v11 = [NSNumber numberWithUnsignedInt:v9];
  id v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    uint64_t v13 = *(void **)(a1 + 48);
    uint64_t v14 = [v6 assetId];
    uint64_t v15 = [v6 metadata];
    uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v16 + 40);
    LOBYTE(v13) = [v13 saveAssetWithIdentifier:v14 assetURL:v12 metadata:v15 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = (_BYTE)v13;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) == 1) {
      goto LABEL_10;
    }
  }
  else
  {
    id v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = [v6 assetId];
      v19 = [*(id *)(a1 + 32) treatmentId];
      *(_DWORD *)buf = 138543874;
      dispatch_semaphore_t v23 = v18;
      __int16 v24 = 1024;
      int v25 = v9;
      __int16 v26 = 2112;
      id v27 = v19;
      _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Unexpected missing assetURL for assetId %{public}@ at ck index %d in treatment %@.", buf, 0x1Cu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = 0;
  }
  *a4 = 1;
LABEL_10:
}

- (unsigned)_ncvForNamespaceName:(id)a3 inExperimentRecord:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(a4, "namespaces", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 name];
        char v13 = [v5 isEqualToString:v12];

        if (v13)
        {
          unsigned int v14 = [v11 compatibilityVersion];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  unsigned int v14 = -1;
LABEL_11:

  return v14;
}

- (id)_namespaceDescriptorForNamespaceName:(id)a3 fromExperimentRecord:(id)a4 referencingFactorsURL:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(TRIFetchTreatmentTask *)self _ncvForNamespaceName:v8 inExperimentRecord:a4];
  if (v10 == -1)
  {
    char v13 = 0;
  }
  else
  {
    uint64_t v11 = v10;
    id v12 = objc_opt_new();
    [v12 setFactorsURL:v9];
    char v13 = (void *)[objc_alloc(MEMORY[0x1E4FB01A0]) initWithNamespaceName:v8 downloadNCV:v11 optionalParams:v12];
  }
  return v13;
}

- (id)_fetchTreatmentWithArtifactProvider:(id)a3 experimentRecord:(id)a4 downloadOptions:(id)a5 context:(id)a6 treatment:(id *)a7 recordId:(id *)a8 treatmentFetchError:(id *)a9
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v16 = a4;
  id v36 = a5;
  id v17 = a6;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  int v57 = 3;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__15;
  id v52 = __Block_byref_object_dispose__15;
  id v53 = 0;
  long long v19 = [[TRIFetchOptions alloc] initWithDownloadOptions:v36 cacheDeleteAvailableSpaceClass:&unk_1F347B660];
  uint64_t v20 = [(TRITreatmentBaseTask *)self treatmentId];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __141__TRIFetchTreatmentTask__fetchTreatmentWithArtifactProvider_experimentRecord_downloadOptions_context_treatment_recordId_treatmentFetchError___block_invoke;
  v37[3] = &unk_1E6BB9FC0;
  id v21 = v16;
  id v38 = v21;
  id v22 = v17;
  id v39 = v22;
  v40 = self;
  id v42 = &v54;
  v43 = &v48;
  v44 = a9;
  v45 = a7;
  v46 = a8;
  SEL v47 = a2;
  dispatch_semaphore_t v23 = v18;
  v41 = v23;
  id v24 = (id)[v35 fetchTreatmentWithId:v20 options:v19 completion:v37];

  [MEMORY[0x1E4F93B18] waitForSemaphore:v23];
  uint64_t v25 = *((unsigned int *)v55 + 6);
  if (v25 != 2)
  {
    if (v25 == 3)
    {
      __int16 v26 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatus:3];
      +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:v26 earliestRetryDate:v49[5]];
    }
    else
    {
      __int16 v26 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatusFailureWithDeactivationReason:3];
      +[TRITaskRunResult resultWithRunStatus:v25 reportResultToServer:1 nextTasks:v26 earliestRetryDate:v49[5]];
    uint64_t v27 = };
LABEL_13:
    uint64_t v28 = (void *)v27;

    goto LABEL_14;
  }
  if (!*a7)
  {
    v29 = TRILogCategory_Server();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v31 = [(TRITreatmentBaseTask *)self treatmentId];
      char v32 = [(TRIExperimentBaseTask *)self experiment];
      v33 = [v32 shortDesc];
      *(_DWORD *)buf = 138412546;
      v59 = v31;
      __int16 v60 = 2114;
      v61 = v33;
      _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "CloudKit fetch succeeded, but a valid treatment was not obtained for treatment %@ of experiment %{public}@.", buf, 0x16u);
    }
    [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:9];
    __int16 v26 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatusFailureWithDeactivationReason:14];
    uint64_t v27 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:v26 earliestRetryDate:0];
    goto LABEL_13;
  }
  if (!*a8)
  {
    int v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"TRIFetchTreatmentTask.m" lineNumber:503 description:@"Decoded a treatment but failed to associate a CKRecordID"];
  }
  uint64_t v28 = +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", 2, 0, MEMORY[0x1E4F1CBF0], 0, v35);
LABEL_14:

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  return v28;
}

void __141__TRIFetchTreatmentTask__fetchTreatmentWithArtifactProvider_experimentRecord_downloadOptions_context_treatment_recordId_treatmentFetchError___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __141__TRIFetchTreatmentTask__fetchTreatmentWithArtifactProvider_experimentRecord_downloadOptions_context_treatment_recordId_treatmentFetchError___block_invoke_2;
  v33[3] = &unk_1E6BB9140;
  id v34 = *(id *)(a1 + 32);
  id v35 = *(id *)(a1 + 40);
  id v16 = (void (**)(void, void))MEMORY[0x1E016EA80](v33);
  switch(a2)
  {
    case 0:
      id v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v26 = [*(id *)(a1 + 48) treatmentId];
        uint64_t v27 = [*(id *)(a1 + 48) experiment];
        uint64_t v28 = [v27 shortDesc];
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = v26;
        __int16 v38 = 2114;
        id v39 = v28;
        __int16 v40 = 2114;
        id v41 = v15;
        _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Error fetching treatment %@ of experiment %{public}@: %{public}@", buf, 0x20u);
      }
      v16[2](v16, 1);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 3;
      goto LABEL_11;
    case 1:
      dispatch_semaphore_t v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        long long v19 = [*(id *)(a1 + 48) treatmentId];
        uint64_t v20 = [*(id *)(a1 + 48) experiment];
        id v21 = [v20 shortDesc];
        *(_DWORD *)buf = 138412546;
        uint64_t v37 = v19;
        __int16 v38 = 2114;
        id v39 = v21;
        _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "Cancelled fetch of treatment %@ for experiment %{public}@", buf, 0x16u);
      }
      uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
      int v23 = 4;
      goto LABEL_14;
    case 2:
      id v24 = TRILogCategory_Server();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v29 = [*(id *)(a1 + 48) treatmentId];
        v31 = [*(id *)(a1 + 48) experiment];
        id v30 = [v31 shortDesc];
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = v29;
        __int16 v38 = 2114;
        id v39 = v30;
        __int16 v40 = 2114;
        id v41 = v15;
        _os_log_error_impl(&dword_1DA291000, v24, OS_LOG_TYPE_ERROR, "Fetching treatment %@ of experiment %{public}@: resulted in retry-able error %{public}@", buf, 0x20u);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a6);
LABEL_11:
      objc_storeStrong(*(id **)(a1 + 80), a7);
      break;
    case 3:
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:*(void *)(a1 + 104) object:*(void *)(a1 + 48) file:@"TRIFetchTreatmentTask.m" lineNumber:470 description:@"Unexpected status TRIFetchStatusMoreResultsPending"];

      break;
    case 4:
      objc_storeStrong(*(id **)(a1 + 88), a4);
      objc_storeStrong(*(id **)(a1 + 96), a3);
      uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
      int v23 = 2;
LABEL_14:
      *(_DWORD *)(v22 + 24) = v23;
      break;
    default:
      break;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __141__TRIFetchTreatmentTask__fetchTreatmentWithArtifactProvider_experimentRecord_downloadOptions_context_treatment_recordId_treatmentFetchError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(a1 + 32) namespaces];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = TRILogCategory_Server();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 name];
          *(_DWORD *)buf = 138543362;
          id v21 = v10;
          _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "notify namespace download failed: %{public}@", buf, 0xCu);
        }
        uint64_t v11 = (void *)MEMORY[0x1E4FB01E0];
        id v12 = [v8 name];
        [v11 updateStatusFetchSuccess:0 forNamespaceName:v12 withContext:*(void *)(a1 + 40)];

        id v13 = (void *)MEMORY[0x1E4FB00D0];
        id v14 = [v8 name];
        [v13 notifyDownloadFailedForKey:v14 withError:a2];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }
}

- (id)_fetchAssetsWithArtifactProvider:(id)a3 recordId:(id)a4 experimentRecord:(id)a5 assetIndexes:(id)a6 downloadOptions:(id)a7 context:(id)a8 assetURLs:(id *)a9 treatmentFetchError:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v33 = a7;
  id v20 = a8;
  id v32 = (void *)[objc_alloc(MEMORY[0x1E4FB00D8]) initWithAllowsCellular:0 discretionaryBehavior:0];
  id v21 = [[TRIFetchOptions alloc] initWithDownloadOptions:v32 cacheDeleteAvailableSpaceClass:&unk_1F347B660];
  dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2020000000;
  int v56 = 3;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__15;
  v51 = __Block_byref_object_dispose__15;
  id v52 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke;
  v45[3] = &unk_1E6BB9FE8;
  id v46 = v18;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke_345;
  v35[3] = &unk_1E6BBA010;
  id v31 = v46;
  id v36 = v31;
  id v23 = v20;
  id v37 = v23;
  __int16 v38 = self;
  __int16 v40 = &v53;
  id v41 = &v47;
  uint64_t v42 = a10;
  v43 = a9;
  id v24 = v16;
  SEL v44 = a2;
  uint64_t v25 = v22;
  id v39 = v25;
  id v26 = (id)[v24 fetchAssetsWithIndexes:v19 fromTreatmentWithRecordId:v17 options:v21 progress:v45 completion:v35];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v25];
  uint64_t v27 = *((unsigned int *)v54 + 6);
  if (v27 == 3)
  {
    uint64_t v28 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatusFailureWithDeactivationReason:19];
    +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:v28 earliestRetryDate:v48[5]];
  }
  else
  {
    uint64_t v28 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatus:*((unsigned int *)v54 + 6)];
    +[TRITaskRunResult resultWithRunStatus:v27 reportResultToServer:1 nextTasks:v28 earliestRetryDate:v48[5]];
  v29 = };

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v29;
}

void __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke(uint64_t a1, double a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [*(id *)(a1 + 32) namespaces];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        id v9 = TRILogCategory_Server();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          id v12 = [v8 name];
          *(_DWORD *)buf = 138543618;
          id v18 = v12;
          __int16 v19 = 2048;
          unint64_t v20 = (unint64_t)(a2 * 100.0);
          _os_log_debug_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEBUG, "notify namespace download progress: %{public}@, %tu%%", buf, 0x16u);
        }
        uint64_t v10 = (void *)MEMORY[0x1E4FB00D0];
        uint64_t v11 = [v8 name];
        [v10 notifyDownloadProgressForKey:v11 withProgress:(unint64_t)(a2 * 100.0)];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v5);
  }
}

void __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke_345(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke_2;
  v28[3] = &unk_1E6BB9140;
  id v29 = *(id *)(a1 + 32);
  id v30 = *(id *)(a1 + 40);
  long long v13 = (void (**)(void, void))MEMORY[0x1E016EA80](v28);
  switch(a2)
  {
    case 0:
      long long v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [*(id *)(a1 + 48) treatmentId];
        id v23 = [*(id *)(a1 + 48) experiment];
        id v24 = [v23 shortDesc];
        *(_DWORD *)buf = 138412802;
        id v32 = v22;
        __int16 v33 = 2114;
        id v34 = v24;
        __int16 v35 = 2114;
        id v36 = v12;
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Error fetching assets for treatment %@ of experiment %{public}@: %{public}@", buf, 0x20u);
      }
      v13[2](v13, 1);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 3;
      goto LABEL_11;
    case 1:
      long long v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = [*(id *)(a1 + 48) treatmentId];
        id v17 = [*(id *)(a1 + 48) experiment];
        id v18 = [v17 shortDesc];
        *(_DWORD *)buf = 138412546;
        id v32 = v16;
        __int16 v33 = 2114;
        id v34 = v18;
        _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Cancelled fetch of assets for treatment %@ of experiment %{public}@", buf, 0x16u);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 4;
      break;
    case 2:
      __int16 v19 = TRILogCategory_Server();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = [*(id *)(a1 + 48) treatmentId];
        uint64_t v27 = [*(id *)(a1 + 48) experiment];
        id v26 = [v27 shortDesc];
        *(_DWORD *)buf = 138412802;
        id v32 = v25;
        __int16 v33 = 2114;
        id v34 = v26;
        __int16 v35 = 2114;
        id v36 = v12;
        _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Fetching assets for treatment %@ of experiment %{public}@: resulted in retry-able error %{public}@", buf, 0x20u);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a4);
LABEL_11:
      objc_storeStrong(*(id **)(a1 + 80), a5);
      break;
    case 3:
      unint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:*(void *)(a1 + 96) object:*(void *)(a1 + 48) file:@"TRIFetchTreatmentTask.m" lineNumber:570 description:@"Unexpected status TRIFetchStatusMoreResultsPending"];

      break;
    case 4:
      objc_storeStrong(*(id **)(a1 + 88), a3);
      if (v10) {
        int v21 = 2;
      }
      else {
        int v21 = 3;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v21;
      break;
    default:
      break;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __151__TRIFetchTreatmentTask__fetchAssetsWithArtifactProvider_recordId_experimentRecord_assetIndexes_downloadOptions_context_assetURLs_treatmentFetchError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(a1 + 32) namespaces];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = TRILogCategory_Server();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [v8 name];
          *(_DWORD *)buf = 138543362;
          int v21 = v10;
          _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "notify namespace download failed: %{public}@", buf, 0xCu);
        }
        id v11 = (void *)MEMORY[0x1E4FB01E0];
        id v12 = [v8 name];
        [v11 updateStatusFetchSuccess:0 forNamespaceName:v12 withContext:*(void *)(a1 + 40)];

        long long v13 = (void *)MEMORY[0x1E4FB00D0];
        long long v14 = [v8 name];
        [v13 notifyDownloadFailedForKey:v14 withError:a2];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }
}

- (id)_nextTasksForRunStatusFailureWithDeactivationReason:(unint64_t)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(TRIExperimentBaseTask *)self experiment];
  uint64_t v6 = [v5 experimentId];
  uint64_t v7 = [(TRIExperimentBaseTask *)self experiment];
  uint64_t v8 = [v7 deploymentId];
  id v9 = [(TRITreatmentBaseTask *)self taskAttributing];
  id v10 = +[TRIDeactivateTreatmentTask taskWithExperimentId:v6 deploymentId:v8 failOnUnrecognizedExperiment:0 triggerEvent:a3 taskAttribution:v9];
  v13[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v11;
}

- (id)_nextTasksForRunStatus:(int)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_addMetricForFetchTreatmentTaskError:(int)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4FB05A8];
  uint64_t v5 = fetchTaskErrorAsString(a3);
  id v6 = [v4 metricWithName:@"fetchtreatmenttask_error" categoricalValue:v5];

  [(TRIExperimentBaseTask *)self addMetric:v6];
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v213 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v145 = a4;
  v152 = v7;
  uint64_t v8 = [v7 keyValueStore];
  v148 = +[TRIFetchDateManager managerWithKeyValueStore:v8];

  id v9 = [v7 experimentDatabase];
  id v10 = [(TRIExperimentBaseTask *)self experiment];
  v151 = [v9 experimentRecordWithExperimentDeployment:v10];

  if (v151)
  {
    if ([v151 type] == 3) {
      [(TRIExperimentBaseTask *)self logAsRollout:1];
    }
    v150 = [(TRIExperimentBaseTask *)self containerForFirstNamespaceInExperimentWithContext:v7];
    id v11 = [v7 paths];
    id v12 = v11;
    if (v150)
    {
      uint64_t v13 = [v11 pathsForContainer:v150 asClientProcess:0];
    }
    else
    {
      uint64_t v13 = (uint64_t)v11;
    }
    v143 = (void *)v13;
    if (!v13)
    {
      v81 = TRILogCategory_Server();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        v127 = [v150 identifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v204 = (uint64_t)v127;
        _os_log_error_impl(&dword_1DA291000, v81, OS_LOG_TYPE_ERROR, "Unable to fetch treatment into missing app container: %{public}@", buf, 0xCu);
      }
      [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:2];
      uint64_t v82 = [(TRIExperimentBaseTask *)self experiment];
      v83 = [v82 experimentId];
      v84 = [(TRITreatmentBaseTask *)self treatmentId];
      v85 = [(TRIExperimentBaseTask *)self experiment];
      +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v83, v84, [v85 deploymentId], v151, 0, v7);

      uint64_t v144 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatusFailureWithDeactivationReason:21];
      id v146 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:v144 earliestRetryDate:0];
      goto LABEL_106;
    }
    long long v19 = [v7 namespaceDatabase];
    unint64_t v20 = [v7 paths];
    int v21 = [v20 namespaceDescriptorsDefaultDir];
    uint64_t v144 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v19 defaultDescriptorDirectoryPath:v21];

    uint64_t v193 = 0;
    v194 = &v193;
    uint64_t v195 = 0x3032000000;
    v196 = __Block_byref_object_copy__15;
    v197 = __Block_byref_object_dispose__15;
    uint64_t v22 = [(TRITreatmentBaseTask *)self taskAttributing];
    id v198 = [v22 applicationBundleIdentifier];

    uint64_t v187 = 0;
    v188 = &v187;
    uint64_t v189 = 0x3032000000;
    v190 = __Block_byref_object_copy__15;
    v191 = __Block_byref_object_dispose__15;
    id v192 = 0;
    uint64_t v183 = 0;
    v184 = &v183;
    uint64_t v185 = 0x2020000000;
    char v186 = 0;
    uint64_t v23 = (void *)MEMORY[0x1E016E7F0]();
    id v24 = [v151 artifact];
    uint64_t v25 = [v24 namespaces];
    v177[0] = MEMORY[0x1E4F143A8];
    v177[1] = 3221225472;
    v177[2] = __55__TRIFetchTreatmentTask_runUsingContext_withTaskQueue___block_invoke;
    v177[3] = &unk_1E6BBA038;
    id v26 = v143;
    v180 = &v187;
    v181 = &v193;
    id v178 = v26;
    v179 = self;
    v182 = &v183;
    [v25 enumerateObjectsUsingBlock:v177];

    uint64_t v27 = [(TRITreatmentBaseTask *)self taskAttributing];
    uint64_t v28 = [v27 triCloudKitContainer];
    id v29 = [(TRITreatmentBaseTask *)self taskAttributing];
    id v30 = [v29 teamIdentifier];
    v142 = +[TRICKNativeArtifactProvider providerForContainer:v28 teamId:v30 bundleId:v194[5] dateProvider:v148 namespaceDescriptorProvider:v144 serverContext:v152];

    id v31 = [(TRITreatmentBaseTask *)self taskAttributing];
    v149 = [v31 networkOptions];

    if ([v149 allowsCellularAccess])
    {
      id v32 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"allows_cellular_download", objc_msgSend(v149, "allowsCellularAccess"));
      [(TRIExperimentBaseTask *)self addMetric:v32];
    }
    if ([v149 discretionaryBehavior])
    {
      __int16 v33 = [(TRIBaseTask *)self stateProvider];
      id v34 = [v33 activeActivityDescriptorGrantingCapability:16];
      __int16 v35 = [v34 activity];
      if (v35)
      {
        [v149 setActivity:v35];
        id v36 = [v33 activeActivityDescriptorGrantingCapability:1];

        int v37 = [v149 allowsCellularAccess];
        if (v36) {
          int v38 = 0;
        }
        else {
          int v38 = v37;
        }
        if (v38 != 1 || (id v39 = (void *)v194[5]) != 0 && [v39 length] && *((unsigned char *)v184 + 24))
        {

          goto LABEL_23;
        }
        v98 = TRILogCategory_Server();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          v128 = [(TRITreatmentBaseTask *)self treatmentId];
          v129 = [v151 experimentDeployment];
          id v147 = [v129 experimentId];
          SEL v130 = [v151 namespaces];
          v131 = [v130 firstObject];
          uint64_t v132 = [v131 name];
          id v133 = (void *)v132;
          uint64_t v134 = v194[5];
          if (*((unsigned char *)v184 + 24)) {
            v135 = @"YES";
          }
          else {
            v135 = @"NO";
          }
          *(_DWORD *)buf = 138413314;
          uint64_t v204 = (uint64_t)v128;
          __int16 v205 = 2114;
          uint64_t v206 = (uint64_t)v147;
          __int16 v207 = 2114;
          uint64_t v208 = v132;
          __int16 v209 = 2114;
          uint64_t v210 = v134;
          __int16 v211 = 2114;
          v212 = v135;
          _os_log_error_impl(&dword_1DA291000, v98, OS_LOG_TYPE_ERROR, "preventing fetch of treatment %@ on cellular for experiment %{public}@ namespace %{public}@, resourceAttributionBundleIdentifier: %{public}@ expensiveNetworkingAllowed: %{public}@", buf, 0x34u);
        }
        [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:23];
        v97 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatus:1];
        id v146 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:0 nextTasks:v97 earliestRetryDate:0];
      }
      else
      {
        v96 = TRILogCategory_Server();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA291000, v96, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
        }

        [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:3];
        v97 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatus:1];
        id v146 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:v97 earliestRetryDate:0];
      }

LABEL_105:
      _Block_object_dispose(&v183, 8);
      _Block_object_dispose(&v187, 8);

      _Block_object_dispose(&v193, 8);
LABEL_106:

      goto LABEL_107;
    }
LABEL_23:
    id v175 = 0;
    id v176 = 0;
    v174 = 0;
    id v173 = [(TRIFetchTreatmentTask *)self _fetchTreatmentWithArtifactProvider:v142 experimentRecord:v151 downloadOptions:v149 context:v152 treatment:&v175 recordId:&v176 treatmentFetchError:&v174];
    if ([v173 runStatus] != 2)
    {
      if (v174)
      {
        self->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
        v86 = TRIFetchErrorParseToMetrics(v174);
        if ([v86 count])
        {
          long long v171 = 0u;
          long long v172 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          id v87 = v86;
          uint64_t v88 = [v87 countByEnumeratingWithState:&v169 objects:v202 count:16];
          if (v88)
          {
            uint64_t v89 = *(void *)v170;
            do
            {
              for (uint64_t i = 0; i != v88; ++i)
              {
                if (*(void *)v170 != v89) {
                  objc_enumerationMutation(v87);
                }
                [(TRIExperimentBaseTask *)self addMetric:*(void *)(*((void *)&v169 + 1) + 8 * i)];
              }
              uint64_t v88 = [v87 countByEnumeratingWithState:&v169 objects:v202 count:16];
            }
            while (v88);
          }
        }
      }
      if ([v173 runStatus] == 3)
      {
        v91 = [(TRIExperimentBaseTask *)self experiment];
        v92 = [v91 experimentId];
        BOOL v93 = [(TRITreatmentBaseTask *)self treatmentId];
        v94 = [(TRIExperimentBaseTask *)self experiment];
        +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v92, v93, [v94 deploymentId], v151, 0, v152);
      }
      id v95 = v173;
      id v146 = v95;
      goto LABEL_104;
    }
    if (!v175)
    {
      v136 = [MEMORY[0x1E4F28B00] currentHandler];
      [v136 handleFailureInMethod:a2, self, @"TRIFetchTreatmentTask.m", 750, @"Invalid parameter not satisfying: %@", @"treatment" object file lineNumber description];
    }
    if (!v176)
    {
      v137 = [MEMORY[0x1E4F28B00] currentHandler];
      [v137 handleFailureInMethod:a2, self, @"TRIFetchTreatmentTask.m", 751, @"Invalid parameter not satisfying: %@", @"treatmentRecordId" object file lineNumber description];
    }
    char v140 = objc_opt_new();
    __int16 v40 = [[TRIAssetStore alloc] initWithPaths:v26];
    id v41 = v175;
    uint64_t v42 = v188[5];
    v43 = [v152 keyValueStore];
    SEL v44 = +[TRINamespaceFactorSubscriptionSettings settingsWithKeyValueStore:v43];
    v45 = +[TRIClientFactorPackUtils aliasesInNamespace:v188[5]];
    v141 = [v41 requiredAssetsForInstallationForNamespace:v42 assetStore:v40 maProvider:v140 subscriptionSettings:v44 aliasToUnaliasMap:v45];

    if (!v141)
    {
      [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:5];
      v99 = [(TRIExperimentBaseTask *)self experiment];
      v100 = [v99 experimentId];
      v101 = [(TRITreatmentBaseTask *)self treatmentId];
      v102 = [(TRIExperimentBaseTask *)self experiment];
      +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v100, v101, [v102 deploymentId], v151, 0, v152);

      v103 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatusFailureWithDeactivationReason:22];
      id v146 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:v103 earliestRetryDate:0];
LABEL_103:

      id v95 = v173;
LABEL_104:

      goto LABEL_105;
    }
    id v46 = TRILogCategory_Server();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v47 = [v141 cloudKit];
      uint64_t v48 = [v47 count];
      uint64_t v49 = [v141 mobileAsset];
      uint64_t v50 = [v49 count];
      v51 = [(TRITreatmentBaseTask *)self treatmentId];
      *(_DWORD *)buf = 134218498;
      uint64_t v204 = v48;
      __int16 v205 = 2048;
      uint64_t v206 = v50;
      __int16 v207 = 2114;
      uint64_t v208 = (uint64_t)v51;
      _os_log_impl(&dword_1DA291000, v46, OS_LOG_TYPE_DEFAULT, "Found %lu required CK assets and %lu required MA assets for treatment %{public}@", buf, 0x20u);
    }
    id v52 = objc_opt_new();
    uint64_t v53 = [v141 cloudKit];
    v166[0] = MEMORY[0x1E4F143A8];
    v166[1] = 3221225472;
    v166[2] = __55__TRIFetchTreatmentTask_runUsingContext_withTaskQueue___block_invoke_371;
    v166[3] = &unk_1E6BBA060;
    v166[4] = self;
    id v139 = v52;
    id v167 = v139;
    SEL v168 = a2;
    [v53 enumerateObjectsUsingBlock:v166];

    uint64_t v54 = TRILogCategory_Server();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v55 = [(TRITreatmentBaseTask *)self treatmentId];
      int v56 = [(TRIExperimentBaseTask *)self experiment];
      int v57 = [v56 shortDesc];
      uint64_t v58 = [v139 count];
      *(_DWORD *)buf = 138412802;
      uint64_t v204 = (uint64_t)v55;
      __int16 v205 = 2114;
      uint64_t v206 = (uint64_t)v57;
      __int16 v207 = 2048;
      uint64_t v208 = v58;
      _os_log_impl(&dword_1DA291000, v54, OS_LOG_TYPE_DEFAULT, "Treatment %@ of experiment %{public}@ references %tu assets which are required for enrollment and are not already on disk.", buf, 0x20u);
    }
    id v165 = 0;
    v59 = v174;
    v174 = 0;

    __int16 v60 = [(TRIFetchTreatmentTask *)self _fetchAssetsWithArtifactProvider:v142 recordId:v176 experimentRecord:v151 assetIndexes:v139 downloadOptions:v149 context:v152 assetURLs:&v165 treatmentFetchError:&v174];
    id v61 = v173;
    id v173 = v60;

    if ([v173 runStatus] == 2)
    {
      if (!v165)
      {
        v138 = [MEMORY[0x1E4F28B00] currentHandler];
        [v138 handleFailureInMethod:a2, self, @"TRIFetchTreatmentTask.m", 808, @"Invalid parameter not satisfying: %@", @"assetURLs" object file lineNumber description];
      }
      uint64_t v62 = v174;
      v174 = 0;

      v63 = [v141 mobileAsset];
      char v64 = [v151 namespaces];
      v65 = [v64 firstObject];
      v66 = [v65 name];
      BOOL v67 = [(TRIFetchTreatmentTask *)self _downloadAndSaveMAAssets:v63 options:v149 downloadNotificationKey:v66 context:v152 errorResult:&v173 fetchError:&v174];

      if (v67 && [v173 runStatus] == 2)
      {
        id v146 = [(TRIFetchTreatmentTask *)self _saveTreatment:v175 experimentRecord:v151 assetURLs:v165 assetMetadata:v141 context:v152 paths:v26 downloadOptions:v149];
        if ([v146 runStatus] == 2)
        {
          [v165 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_9];
          long long v155 = 0u;
          long long v156 = 0u;
          long long v153 = 0u;
          long long v154 = 0u;
          v68 = [v151 namespaces];
          uint64_t v69 = [v68 countByEnumeratingWithState:&v153 objects:v199 count:16];
          if (v69)
          {
            uint64_t v70 = *(void *)v154;
            do
            {
              for (uint64_t j = 0; j != v69; ++j)
              {
                if (*(void *)v154 != v70) {
                  objc_enumerationMutation(v68);
                }
                v72 = *(void **)(*((void *)&v153 + 1) + 8 * j);
                v73 = TRILogCategory_Server();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  v74 = [v72 name];
                  *(_DWORD *)buf = 138543362;
                  uint64_t v204 = (uint64_t)v74;
                  _os_log_impl(&dword_1DA291000, v73, OS_LOG_TYPE_DEFAULT, "notify namespace download completed: %{public}@", buf, 0xCu);
                }
                v75 = (void *)MEMORY[0x1E4FB00D0];
                v76 = [v72 name];
                [v75 notifyDownloadCompletedForKey:v76];
              }
              uint64_t v69 = [v68 countByEnumeratingWithState:&v153 objects:v199 count:16];
            }
            while (v69);
          }

          v77 = [(TRIExperimentBaseTask *)self experiment];
          v78 = [v77 experimentId];
          uint64_t v79 = [(TRITreatmentBaseTask *)self treatmentId];
          v80 = [(TRIExperimentBaseTask *)self experiment];
          +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 4, v78, v79, [v80 deploymentId], v151, 0, v152);
          goto LABEL_112;
        }
        if ([v146 runStatus] == 3)
        {
          v77 = [(TRIExperimentBaseTask *)self experiment];
          v78 = [v77 experimentId];
          uint64_t v79 = [(TRITreatmentBaseTask *)self treatmentId];
          v80 = [(TRIExperimentBaseTask *)self experiment];
          +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v78, v79, [v80 deploymentId], v151, 0, v152);
LABEL_112:
        }
LABEL_102:

        v103 = v139;
        goto LABEL_103;
      }
      if (v174)
      {
        v113 = TRIFetchErrorParseToMetrics(v174);
        if ([v113 count])
        {
          long long v159 = 0u;
          long long v160 = 0u;
          long long v157 = 0u;
          long long v158 = 0u;
          id v114 = v113;
          uint64_t v115 = [v114 countByEnumeratingWithState:&v157 objects:v200 count:16];
          if (v115)
          {
            uint64_t v116 = *(void *)v158;
            do
            {
              for (uint64_t k = 0; k != v115; ++k)
              {
                if (*(void *)v158 != v116) {
                  objc_enumerationMutation(v114);
                }
                [(TRIExperimentBaseTask *)self addMetric:*(void *)(*((void *)&v157 + 1) + 8 * k)];
              }
              uint64_t v115 = [v114 countByEnumeratingWithState:&v157 objects:v200 count:16];
            }
            while (v115);
          }
        }
      }
      v118 = TRILogCategory_Server();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v204 = (uint64_t)v174;
        _os_log_error_impl(&dword_1DA291000, v118, OS_LOG_TYPE_ERROR, "Failed to download MA treatment assets: %@", buf, 0xCu);
      }

      if ([v173 runStatus] == 3)
      {
        id v119 = [(TRIExperimentBaseTask *)self experiment];
        id v120 = [v119 experimentId];
        long long v121 = [(TRITreatmentBaseTask *)self treatmentId];
        long long v122 = [(TRIExperimentBaseTask *)self experiment];
        +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v120, v121, [v122 deploymentId], v151, 0, v152);
      }
    }
    else
    {
      if (v174)
      {
        v104 = TRIFetchErrorParseToMetrics(v174);
        if ([v104 count])
        {
          long long v163 = 0u;
          long long v164 = 0u;
          long long v161 = 0u;
          long long v162 = 0u;
          id v105 = v104;
          uint64_t v106 = [v105 countByEnumeratingWithState:&v161 objects:v201 count:16];
          if (v106)
          {
            uint64_t v107 = *(void *)v162;
            do
            {
              for (uint64_t m = 0; m != v106; ++m)
              {
                if (*(void *)v162 != v107) {
                  objc_enumerationMutation(v105);
                }
                [(TRIExperimentBaseTask *)self addMetric:*(void *)(*((void *)&v161 + 1) + 8 * m)];
              }
              uint64_t v106 = [v105 countByEnumeratingWithState:&v161 objects:v201 count:16];
            }
            while (v106);
          }
        }
      }
      if ([v173 runStatus] == 3)
      {
        id v109 = [(TRIExperimentBaseTask *)self experiment];
        v110 = [v109 experimentId];
        v111 = [(TRITreatmentBaseTask *)self treatmentId];
        v112 = [(TRIExperimentBaseTask *)self experiment];
        +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v110, v111, [v112 deploymentId], v151, 0, v152);
      }
    }
    id v146 = v173;
    goto LABEL_102;
  }
  long long v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    long long v124 = [(TRIExperimentBaseTask *)self experiment];
    v125 = [v124 shortDesc];
    id v126 = [(TRITreatmentBaseTask *)self treatmentId];
    *(_DWORD *)buf = 138543618;
    uint64_t v204 = (uint64_t)v125;
    __int16 v205 = 2112;
    uint64_t v206 = (uint64_t)v126;
    _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Unable to look up experiment %{public}@ associated with treatment %@.", buf, 0x16u);
  }
  [(TRIFetchTreatmentTask *)self _addMetricForFetchTreatmentTaskError:2];
  long long v15 = [(TRIExperimentBaseTask *)self experiment];
  long long v16 = [v15 experimentId];
  long long v17 = [(TRITreatmentBaseTask *)self treatmentId];
  long long v18 = [(TRIExperimentBaseTask *)self experiment];
  +[TRITaskUtils updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:](TRITaskUtils, "updateExperimentHistoryDatabaseWithAllocationStatus:forExperiment:treatment:deployment:experimentRecord:isBecomingObsolete:context:", 7, v16, v17, [v18 deploymentId], 0, 0, v7);

  v150 = [(TRIFetchTreatmentTask *)self _nextTasksForRunStatusFailureWithDeactivationReason:3];
  id v146 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:0 nextTasks:v150 earliestRetryDate:0];
LABEL_107:

  return v146;
}

void __55__TRIFetchTreatmentTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = (void *)MEMORY[0x1E4FB01A0];
  id v9 = [*(id *)(a1 + 32) namespaceDescriptorsDefaultDir];
  id v10 = [v8 loadWithNamespaceName:v7 fromDirectory:v9];

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v11 = [v10 resourceAttributionIdentifier];

  if (v11)
  {
    uint64_t v12 = [v10 resourceAttributionIdentifier];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    long long v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = [*(id *)(a1 + 40) treatmentId];
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v18 = 138412546;
      long long v19 = v16;
      __int16 v20 = 2114;
      uint64_t v21 = v17;
      _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_INFO, "attributing treatment fetch for %@ to %{public}@", (uint8_t *)&v18, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v10 expensiveNetworkingAllowed];
    *a4 = 1;
  }
}

void __55__TRIFetchTreatmentTask_runUsingContext_withTaskQueue___block_invoke_371(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) treatmentId];
    id v6 = [v3 assetId];
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    long long v14 = v6;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Treatment %@ requires asset %{public}@ which is not already on disk; will be downloaded.",
      buf,
      0x16u);
  }
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = [v3 metadata];
  id v9 = [v8 treatmentIndex];

  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRIFetchTreatmentTask.m", 774, @"Expression was unexpectedly nil/false: %@", @"ra.metadata.treatmentIndex" object file lineNumber description];
  }
  objc_msgSend(v7, "addIndex:", objc_msgSend(v9, "index"));
}

void __55__TRIFetchTreatmentTask_runUsingContext_withTaskQueue___block_invoke_375(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C5F8];
  id v9 = 0;
  char v5 = [v3 getResourceValue:&v10 forKey:v4 error:&v9];
  id v6 = v10;
  id v7 = v9;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v3;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "failed fetching file size for url %@ error %{public}@", buf, 0x16u);
    }
  }
}

- (id)_asPersistedTask
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(TRIExperimentBaseTask *)self experiment];
  char v5 = [v4 experimentId];
  [v3 setExperimentId:v5];

  id v6 = [(TRIExperimentBaseTask *)self experiment];
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  id v7 = [(TRITreatmentBaseTask *)self treatmentId];
  [v3 setTreatmentId:v7];

  uint64_t v8 = [(TRITreatmentBaseTask *)self taskAttributing];
  id v9 = [v8 asPersistedTaskAttribution];
  [v3 setTaskAttribution:v9];

  objc_msgSend(v3, "setRetryCount:", -[TRIFetchTreatmentTask retryCount](self, "retryCount"));
  id v10 = [(TRITaskCapabilityModifier *)self->_capabilityModifier asPersistedModifier];
  [v3 setCapabilityModifier:v10];

  return v3;
}

- (id)serialize
{
  uint64_t v4 = [(TRIFetchTreatmentTask *)self _asPersistedTask];
  char v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIFetchTreatmentTask.m", 879, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v41 = 0;
  id v3 = +[TRIPBMessage parseFromData:a3 error:&v41];
  id v4 = v41;
  if (!v3)
  {
    id v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_32:
      id v34 = 0;
      goto LABEL_33;
    }
    *(_DWORD *)buf = 138543362;
    id v43 = v4;
    long long v19 = "Unable to parse buffer as TRIFetchTreatmentPersistedTask: %{public}@";
    __int16 v20 = v10;
    uint32_t v21 = 12;
LABEL_14:
    _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_32;
  }
  if (([v3 hasExperimentId] & 1) == 0)
  {
    uint64_t v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v31 = (objc_class *)objc_opt_class();
      id v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138412290;
      id v43 = v32;
      _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);
    }
    id v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v23 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    uint64_t v25 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_31;
  }
  char v5 = [v3 experimentId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    id v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    id v26 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    uint64_t v25 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_31:
    _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);

    goto LABEL_32;
  }
  if (([v3 hasTreatmentId] & 1) == 0)
  {
    uint64_t v27 = TRILogCategory_Server();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v36 = (objc_class *)objc_opt_class();
      int v37 = NSStringFromClass(v36);
      *(_DWORD *)buf = 138412290;
      id v43 = v37;
      _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: treatmentId", buf, 0xCu);
    }
    id v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v28 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v28);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    uint64_t v25 = "Cannot decode message of type %@ with missing field: treatmentId";
    goto LABEL_31;
  }
  id v7 = [v3 treatmentId];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    id v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    id v29 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v29);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    uint64_t v25 = "Cannot decode message of type %@ with field of length 0: treatmentId";
    goto LABEL_31;
  }
  if (([v3 hasDeploymentId] & 1) == 0)
  {
    id v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    id v30 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v30);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    uint64_t v25 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_31;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    id v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    __int16 v33 = (objc_class *)objc_opt_class();
    id v24 = NSStringFromClass(v33);
    *(_DWORD *)buf = 138412290;
    id v43 = v24;
    uint64_t v25 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_31;
  }
  if ([v3 deploymentId] == -1)
  {
    id v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    *(_WORD *)buf = 0;
    long long v19 = "TRIFetchTreatmentPersistedTask encodes unspecified deploymentId.";
    __int16 v20 = v10;
    uint32_t v21 = 2;
    goto LABEL_14;
  }
  id v9 = [v3 taskAttribution];
  id v10 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v9];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4FB00F8]);
    id v12 = [v3 experimentId];
    __int16 v13 = objc_msgSend(v11, "initWithExperimentId:deploymentId:", v12, objc_msgSend(v3, "deploymentId"));

    if ([v3 hasCapabilityModifier])
    {
      id v14 = [TRITaskCapabilityModifier alloc];
      uint64_t v15 = [v3 capabilityModifier];
      uint64_t v16 = [v15 add];
      uint64_t v17 = [v3 capabilityModifier];
      int v18 = -[TRITaskCapabilityModifier initWithAdd:remove:](v14, "initWithAdd:remove:", v16, [v17 remove]);
    }
    else
    {
      int v18 = (TRITaskCapabilityModifier *)objc_opt_new();
    }
    int v38 = objc_opt_class();
    id v39 = [v3 treatmentId];
    id v34 = [v38 taskWithExperiment:v13 treatmentId:v39 taskAttributing:v10 capabilityModifier:v18];

    if ([v3 hasRetryCount]) {
      uint64_t v40 = [v3 retryCount];
    }
    else {
      uint64_t v40 = 0;
    }
    [v34 setRetryCount:v40];
  }
  else
  {
    __int16 v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    id v34 = 0;
  }

LABEL_33:
  return v34;
}

- (unint64_t)requiredCapabilities
{
  id v3 = [(TRITreatmentBaseTask *)self taskAttributing];
  id v4 = [v3 networkOptions];
  uint64_t v5 = [v4 requiredCapability];
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchTreatmentTask;
  unint64_t v6 = [(TRIBaseTask *)&v9 requiredCapabilities] | v5;
  uint64_t v7 = v6 | (4 * ([(TRIFetchTreatmentTask *)self retryCount] > 0));

  return [(TRITaskCapabilityModifier *)self->_capabilityModifier updateCapability:v7];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TRIExperimentBaseTask *)self experiment];
  unint64_t v6 = [v5 shortDesc];
  uint64_t v7 = [(TRITreatmentBaseTask *)self treatmentId];
  uint64_t v8 = [(TRITreatmentBaseTask *)self taskAttributing];
  objc_super v9 = [v8 applicationBundleIdentifier];
  id v10 = [v3 stringWithFormat:@"<%@:%@,%@,%@,r:%d>", v4, v6, v7, v9, -[TRIFetchTreatmentTask retryCount](self, "retryCount")];

  return (NSString *)v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchTreatmentTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchTreatmentTask;
  uint64_t v5 = [(TRIFetchTreatmentTask *)&v9 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      uint64_t v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFetchTreatmentTask.m", 936, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  uint64_t v5 = [(TRIFetchTreatmentTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (int)retryCount
{
  return self->retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->retryCount = a3;
}

- (BOOL)wasDeferred
{
  return self->wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->wasDeferred = a3;
}

- (void).cxx_destruct
{
}

@end