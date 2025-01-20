@interface TRIFetchBMLTNotificationsTask
+ (BOOL)supportsSecureCoding;
+ (id)categoricalValueForBMLTNotificationEvent:(unint64_t)a3;
+ (id)parseFromData:(id)a3;
+ (id)taskWithDeployment:(id)a3 taskAttribution:(id)a4 bmltBatchNotificationIdentifier:(id)a5;
+ (id)taskWithTaskAttribution:(id)a3;
- (BOOL)_processBMLTArtifact:(id)a3 bmltsProcessed:(id)a4 deactivatedBMLTs:(id)a5 targeter:(id)a6 context:(id)a7 taskQueue:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasDeferred;
- (NSArray)tags;
- (NSString)description;
- (TRIFetchBMLTNotificationsTask)initWithCoder:(id)a3;
- (TRIFetchBMLTNotificationsTask)initWithDeployment:(id)a3 taskAttribution:(id)a4 bmltBatchNotificationIdentifier:(id)a5;
- (TRIFetchBMLTNotificationsTask)initWithTaskAttribution:(id)a3;
- (id)_asPersistedTask;
- (id)dimensions;
- (id)fetchSingleDeploymentWithContext:(id)a3;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)retryCount;
- (int)taskType;
- (unint64_t)_processBMLTCatalogArtifact:(id)a3 deactivatedBMLTs:(id)a4 context:(id)a5;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)_addDimension:(id)a3;
- (void)_addMetric:(id)a3;
- (void)_mlruntimeNotifiedTelemetryWithRecords:(BOOL)a3 serverContext:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRIFetchBMLTNotificationsTask

- (int)taskType
{
  return 29;
}

- (NSArray)tags
{
  v3 = objc_opt_new();
  deployment = self->_deployment;
  if (deployment)
  {
    v5 = [(TRIBMLTDeployment *)deployment taskTag];
    [v3 addObject:v5];
  }
  +[TRITaskUtils addAttribution:self->_taskAttribution toTaskTags:v3];
  return (NSArray *)v3;
}

- (unint64_t)requiredCapabilities
{
  v3 = [(TRITaskAttributing *)self->_taskAttribution networkOptions];
  unint64_t v4 = [v3 requiredCapability];

  if ([(TRIFetchBMLTNotificationsTask *)self retryCount]) {
    return v4 | 4;
  }
  else {
    return v4;
  }
}

+ (id)taskWithTaskAttribution:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[TRIFetchBMLTNotificationsTask alloc] initWithTaskAttribution:v3];

  return v4;
}

+ (id)taskWithDeployment:(id)a3 taskAttribution:(id)a4 bmltBatchNotificationIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[TRIFetchBMLTNotificationsTask alloc] initWithDeployment:v9 taskAttribution:v8 bmltBatchNotificationIdentifier:v7];

  return v10;
}

- (TRIFetchBMLTNotificationsTask)initWithTaskAttribution:(id)a3
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TRIFetchBMLTNotificationsTask;
  id v7 = [(TRIFetchBMLTNotificationsTask *)&v21 init];
  if (v7)
  {
    if (!v6)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v7, @"TRIFetchBMLTNotificationsTask.m", 106, @"Invalid parameter not satisfying: %@", @"taskAttribution" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_taskAttribution, a3);
    uint64_t v8 = objc_opt_new();
    nextTasks = v7->_nextTasks;
    v7->_nextTasks = (NSMutableArray *)v8;

    v10 = NSString;
    v11 = objc_opt_new();
    v12 = [v11 UUIDString];
    uint64_t v13 = [v10 stringWithFormat:@"com.apple.triald.BMLTNotification.%@", v12];
    bmltBatchNotificationIdentifier = v7->_bmltBatchNotificationIdentifier;
    v7->_bmltBatchNotificationIdentifier = (NSString *)v13;

    id v15 = objc_alloc(MEMORY[0x1E4F93B70]);
    v16 = objc_opt_new();
    uint64_t v17 = [v15 initWithGuardedData:v16];
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v17;
  }
  return v7;
}

- (TRIFetchBMLTNotificationsTask)initWithDeployment:(id)a3 taskAttribution:(id)a4 bmltBatchNotificationIdentifier:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)TRIFetchBMLTNotificationsTask;
  uint64_t v13 = [(TRIFetchBMLTNotificationsTask *)&v22 init];
  if (v13)
  {
    if (!v11)
    {
      objc_super v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, v13, @"TRIFetchBMLTNotificationsTask.m", 121, @"Invalid parameter not satisfying: %@", @"taskAttribution" object file lineNumber description];
    }
    objc_storeStrong((id *)&v13->_deployment, a3);
    objc_storeStrong((id *)&v13->_taskAttribution, a4);
    uint64_t v14 = objc_opt_new();
    nextTasks = v13->_nextTasks;
    v13->_nextTasks = (NSMutableArray *)v14;

    objc_storeStrong((id *)&v13->_bmltBatchNotificationIdentifier, a5);
    id v16 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v17 = objc_opt_new();
    uint64_t v18 = [v16 initWithGuardedData:v17];
    lock = v13->_lock;
    v13->_lock = (_PASLock *)v18;
  }
  return v13;
}

- (unint64_t)_processBMLTCatalogArtifact:(id)a3 deactivatedBMLTs:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E016E7F0]();
  id v12 = objc_opt_new();
  uint64_t v13 = [v8 bmltCatalog];
  uint64_t v14 = [v13 bmltDeploymentIdArray];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __86__TRIFetchBMLTNotificationsTask__processBMLTCatalogArtifact_deactivatedBMLTs_context___block_invoke;
  v29[3] = &unk_1E6BBDA20;
  id v15 = v12;
  id v30 = v15;
  [v14 enumerateObjectsUsingBlock:v29];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  id v16 = [v10 bmltDatabase];
  uint64_t v17 = [v15 allObjects];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__TRIFetchBMLTNotificationsTask__processBMLTCatalogArtifact_deactivatedBMLTs_context___block_invoke_2;
  v21[3] = &unk_1E6BBDA48;
  id v18 = v9;
  id v22 = v18;
  v23 = self;
  v24 = &v25;
  [v16 enumerateActiveTasksNotInList:v17 usingTransaction:0 withBlock:v21];

  unint64_t v19 = v26[3];
  _Block_object_dispose(&v25, 8);

  return v19;
}

void __86__TRIFetchBMLTNotificationsTask__processBMLTCatalogArtifact_deactivatedBMLTs_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (objc_class *)MEMORY[0x1E4FB0078];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v8 = [v4 taskId];
  uint64_t v6 = objc_msgSend(v4, "id_p");

  id v7 = (void *)[v5 initWithBackgroundMLTaskId:v8 deploymentId:v6];
  [v2 addObject:v7];
}

void __86__TRIFetchBMLTNotificationsTask__processBMLTCatalogArtifact_deactivatedBMLTs_context___block_invoke_2(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 bmltDeployment];
    uint64_t v6 = [v5 shortDesc];
    int v12 = 138543362;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "_processBMLTCatalogArtifact deactivating BMLT %{public}@", (uint8_t *)&v12, 0xCu);
  }
  id v7 = (void *)a1[4];
  id v8 = [v3 bmltDeployment];
  [v7 addObject:v8];

  id v9 = *(void **)(a1[5] + 24);
  id v10 = [v3 bmltDeployment];
  id v11 = +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:v10 triggerEvent:5 bmltBatchNotificationIdentifier:*(void *)(a1[5] + 56)];
  [v9 addObject:v11];

  ++*(void *)(*(void *)(a1[6] + 8) + 24);
}

- (BOOL)_processBMLTArtifact:(id)a3 bmltsProcessed:(id)a4 deactivatedBMLTs:(id)a5 targeter:(id)a6 context:(id)a7 taskQueue:(id)a8
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v114 = a8;
  id v18 = (void *)MEMORY[0x1E016E7F0]();
  v115 = v13;
  unint64_t v19 = [v13 deployment];
  v20 = TRILogCategory_Server();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v21 = [v19 shortDesc];
    [v13 backgroundTask];
    id v22 = v16;
    v24 = id v23 = v15;
    uint64_t v25 = [v24 selectedNamespace];
    *(_DWORD *)buf = 138543874;
    v126 = v21;
    __int16 v127 = 2114;
    id v128 = v14;
    __int16 v129 = 2114;
    v130 = v25;
    _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "_processBMLTArtifact BMLT deployment %{public}@. bmltsProcessed %{public}@ for namespaces %{public}@.", buf, 0x20u);

    id v15 = v23;
    id v16 = v22;
  }
  if ([v14 containsObject:v19])
  {
    v26 = TRILogCategory_Server();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = [v19 shortDesc];
      uint64_t v28 = [v19 backgroundMLTaskId];
      [v115 backgroundTask];
      v111 = v19;
      v29 = v18;
      id v30 = v16;
      id v31 = v14;
      v33 = id v32 = v17;
      [v33 selectedNamespace];
      v35 = id v34 = v15;
      *(_DWORD *)buf = 138543874;
      v126 = v27;
      __int16 v127 = 2114;
      id v128 = v28;
      __int16 v129 = 2114;
      v130 = v35;
      _os_log_impl(&dword_1DA291000, v26, OS_LOG_TYPE_INFO, "Ignoring BMLT deployment %{public}@ because BMLT task identifier %{public}@ has already been processed for namespaces %{public}@.", buf, 0x20u);

      id v15 = v34;
      id v17 = v32;
      id v14 = v31;
      id v16 = v30;
      id v18 = v29;
      unint64_t v19 = v111;
    }
    BOOL v36 = 0;
    goto LABEL_40;
  }
  v37 = [v115 deploymentType];
  int v38 = [v37 intValue];

  if ((v38 - 2) < 2)
  {
    v54 = TRILogCategory_Server();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
LABEL_16:

LABEL_17:
      id v120 = 0;
      id v121 = 0;
      v57 = [v115 backgroundTask];
      char v58 = [v16 targetBMLT:v57 factorPackSetId:&v121 error:&v120];

      id v110 = v15;
      if (v58 == 2)
      {
        v72 = TRILogCategory_Server();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          v73 = [v115 deployment];
          v74 = [v73 shortDesc];
          *(_DWORD *)buf = 138543362;
          v126 = v74;
          _os_log_impl(&dword_1DA291000, v72, OS_LOG_TYPE_DEFAULT, "Targeting results in no-op for BMLT: %{public}@, skipping processing of record", buf, 0xCu);

LABEL_35:
        }
LABEL_38:
        BOOL v36 = 0;
LABEL_39:

        id v15 = v110;
        goto LABEL_40;
      }
      if (!v58)
      {
        v112 = v19;
        v108 = v18;
        id v106 = v14;
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        v59 = [(TRIFetchBMLTNotificationsTask *)self metrics];
        uint64_t v60 = [v59 countByEnumeratingWithState:&v116 objects:v124 count:16];
        if (v60)
        {
          uint64_t v61 = v60;
          uint64_t v62 = *(void *)v117;
          while (2)
          {
            id v63 = v17;
            for (uint64_t i = 0; i != v61; ++i)
            {
              if (*(void *)v117 != v62) {
                objc_enumerationMutation(v59);
              }
              v65 = [*(id *)(*((void *)&v116 + 1) + 8 * i) name];
              char v66 = [@"targeting_error" isEqual:v65];

              if (v66)
              {
                id v17 = v63;
                goto LABEL_37;
              }
            }
            uint64_t v61 = [v59 countByEnumeratingWithState:&v116 objects:v124 count:16];
            id v17 = v63;
            if (v61) {
              continue;
            }
            break;
          }
        }

        v67 = [v120 userInfo];
        uint64_t v68 = [v67 objectForKeyedSubscript:@"logMessage"];
        v69 = (void *)v68;
        v70 = @"unknown";
        if (v68) {
          v70 = (__CFString *)v68;
        }
        v71 = v70;

        v59 = [MEMORY[0x1E4FB05A8] metricWithName:@"targeting_error" categoricalValue:v71];

        [(TRIFetchBMLTNotificationsTask *)self _addMetric:v59];
LABEL_37:

        v72 = TRILogCategory_Server();
        id v18 = v108;
        id v14 = v106;
        unint64_t v19 = v112;
        if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        v73 = [v112 shortDesc];
        *(_DWORD *)buf = 138543362;
        v126 = v73;
        _os_log_error_impl(&dword_1DA291000, v72, OS_LOG_TYPE_ERROR, "Targeting BMLT deployment %{public}@ resulted in an error", buf, 0xCu);
        goto LABEL_35;
      }
      v75 = [v115 deployment];
      int v76 = [v15 containsObject:v75];

      if (v76)
      {
        v72 = TRILogCategory_Server();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          v73 = [v19 shortDesc];
          *(_DWORD *)buf = 138543362;
          v126 = v73;
          _os_log_impl(&dword_1DA291000, v72, OS_LOG_TYPE_DEFAULT, "Skipping activations for BMLT %{public}@ due to it not being in the catalog", buf, 0xCu);
          goto LABEL_35;
        }
        goto LABEL_38;
      }
      v109 = v18;
      v78 = [v115 deployment];
      [v14 addObject:v78];

      v79 = [v115 backgroundTask];
      if ([v79 hasEndDate])
      {
        v80 = [v115 backgroundTask];
        v81 = [v80 endDate];
        v82 = [v81 date];
      }
      else
      {
        v82 = 0;
      }

      v83 = [v17 bmltDatabase];
      v84 = [v115 backgroundTask];
      v85 = [v84 pluginId];
      [v83 addBackgroundMLTaskWithTaskDeployment:v19 pluginId:v85 status:0 endDate:v82 artifact:v115];

      v86 = [v17 bmltDatabase];
      v72 = [v86 taskRecordWithTaskDeployment:v19];

      BOOL v36 = v72 != 0;
      id v107 = v17;
      if (!v72)
      {
        v94 = TRILogCategory_Server();
        id v18 = v109;
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          v103 = [v19 shortDesc];
          v104 = [v115 backgroundTask];
          v105 = [v104 selectedNamespace];
          *(_DWORD *)buf = 138543618;
          v126 = v103;
          __int16 v127 = 2114;
          id v128 = v105;
          _os_log_error_impl(&dword_1DA291000, v94, OS_LOG_TYPE_ERROR, "Unexpected failure to find BMLT deployment %{public}@ for namespaces %{public}@.", buf, 0x16u);

          id v18 = v109;
        }
        goto LABEL_54;
      }
      v87 = [v72 activeFactorPackSetId];

      v88 = TRILogCategory_Server();
      BOOL v89 = os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT);
      id v18 = v109;
      if (v87)
      {
        if (v89)
        {
          v90 = [v19 shortDesc];
          v91 = [v115 backgroundTask];
          v92 = [v91 selectedNamespace];
          *(_DWORD *)buf = 138543618;
          v126 = v90;
          __int16 v127 = 2114;
          id v128 = v92;
          v93 = "BMLT deployment %{public}@ was selected, but is already active. Scheduling re-activation for namespaces %{public}@";
LABEL_52:
          _os_log_impl(&dword_1DA291000, v88, OS_LOG_TYPE_DEFAULT, v93, buf, 0x16u);

          id v18 = v109;
        }
      }
      else if (v89)
      {
        v90 = [v19 shortDesc];
        v91 = [v115 backgroundTask];
        v92 = [v91 selectedNamespace];
        *(_DWORD *)buf = 138543618;
        v126 = v90;
        __int16 v127 = 2114;
        id v128 = v92;
        v93 = "BMLT deployment %{public}@ is selected and not yet active; scheduling activation for namespaces %{public}@.";
        goto LABEL_52;
      }

      v95 = [v19 backgroundMLTaskId];
      [v114 cancelTasksWithTag:v95];

      nextTasks = self->_nextTasks;
      v94 = +[TRIBMLTTargetingTask taskWithBMLTDeployment:v19 includeDependencies:0 taskAttribution:self->_taskAttribution triggerEvent:0 bmltBatchNotificationIdentifier:self->_bmltBatchNotificationIdentifier];
      [(NSMutableArray *)nextTasks addObject:v94];
LABEL_54:

      id v17 = v107;
      goto LABEL_39;
    }
    v55 = [v115 deployment];
    v56 = [v55 shortDesc];
    *(_DWORD *)buf = 138543362;
    v126 = v56;
    _os_log_error_impl(&dword_1DA291000, v54, OS_LOG_TYPE_ERROR, "Found incompatible deployment type for BMLT: %{public}@", buf, 0xCu);
LABEL_57:

    goto LABEL_16;
  }
  if (!v38)
  {
    v54 = TRILogCategory_Server();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v55 = [v115 backgroundTask];
    v56 = [v55 taskId];
    [v115 backgroundTask];
    id v97 = v17;
    id v98 = v14;
    id v99 = v16;
    v101 = id v100 = v15;
    int v102 = [v101 deploymentId];
    *(_DWORD *)buf = 138543618;
    v126 = v56;
    __int16 v127 = 1026;
    LODWORD(v128) = v102;
    _os_log_error_impl(&dword_1DA291000, v54, OS_LOG_TYPE_ERROR, "Unknown notification type for BMLT: %{public}@, deployment: %{public}d", buf, 0x12u);

    id v15 = v100;
    id v16 = v99;
    id v14 = v98;
    id v17 = v97;
    goto LABEL_57;
  }
  if (v38 != 4) {
    goto LABEL_17;
  }
  v39 = TRILogCategory_Server();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = [v115 deployment];
    v41 = [v40 shortDesc];
    *(_DWORD *)buf = 138543362;
    v126 = v41;
    _os_log_impl(&dword_1DA291000, v39, OS_LOG_TYPE_DEFAULT, "Terminating BMLT due to termination notification: %{public}@", buf, 0xCu);
  }
  v42 = [v115 backgroundTask];
  v43 = [v42 taskId];
  [v114 cancelTasksWithTag:v43];

  v44 = [v115 deployment];
  v45 = [v44 taskTag];
  [v114 cancelTasksWithTag:v45];

  v46 = self->_nextTasks;
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __113__TRIFetchBMLTNotificationsTask__processBMLTArtifact_bmltsProcessed_deactivatedBMLTs_targeter_context_taskQueue___block_invoke;
  v122[3] = &unk_1E6BBB278;
  id v47 = v115;
  id v123 = v47;
  v48 = [(NSMutableArray *)v46 _pas_filteredArrayWithTest:v122];
  v49 = (NSMutableArray *)[v48 mutableCopy];
  v50 = self->_nextTasks;
  self->_nextTasks = v49;

  v51 = self->_nextTasks;
  v52 = [v47 deployment];
  v53 = +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:v52 triggerEvent:5 bmltBatchNotificationIdentifier:self->_bmltBatchNotificationIdentifier];
  [(NSMutableArray *)v51 addObject:v53];

  BOOL v36 = 1;
LABEL_40:

  return v36;
}

uint64_t __113__TRIFetchBMLTNotificationsTask__processBMLTArtifact_bmltsProcessed_deactivatedBMLTs_targeter_context_taskQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tags];
  id v4 = [*(id *)(a1 + 32) deployment];
  id v5 = [v4 taskTag];
  int v6 = [v3 containsObject:v5];

  return v6 ^ 1u;
}

- (id)fetchSingleDeploymentWithContext:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v50 = objc_opt_class();
    deployment = self->_deployment;
    id v52 = v50;
    v53 = [(TRIBMLTDeployment *)deployment shortDesc];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v50;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v53;
    _os_log_debug_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEBUG, "starting %{public}@ for single deployment with BMLT %{public}@", buf, 0x16u);
  }
  int v6 = [v4 keyValueStore];
  id v7 = +[TRIFetchDateManager managerWithKeyValueStore:v6];

  id v8 = [v4 namespaceDatabase];
  id v9 = [v4 paths];
  id v10 = [v9 namespaceDescriptorsDefaultDir];
  id v11 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v8 defaultDescriptorDirectoryPath:v10];

  uint64_t v12 = [(TRITaskAttributing *)self->_taskAttribution triCloudKitContainer];
  id v13 = [(TRITaskAttributing *)self->_taskAttribution teamIdentifier];
  id v14 = [(TRITaskAttributing *)self->_taskAttribution applicationBundleIdentifier];
  id v15 = +[TRICKNativeArtifactProvider providerForContainer:v12 teamId:v13 bundleId:v14 dateProvider:v7 namespaceDescriptorProvider:v11 serverContext:v4];

  id v16 = [(TRITaskAttributing *)self->_taskAttribution networkOptions];
  if ([v16 allowsCellularAccess])
  {
    id v17 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"allows_cellular_download", objc_msgSend(v16, "allowsCellularAccess"));
    [(TRIFetchBMLTNotificationsTask *)self _addMetric:v17];
  }
  if (![v16 discretionaryBehavior]) {
    goto LABEL_8;
  }
  id v18 = [(TRIBaseTask *)self stateProvider];
  unint64_t v19 = objc_msgSend(v18, "activeActivityGrantingCapability:", objc_msgSend(v16, "requiredCapability"));

  if (v19)
  {
    [v16 setActivity:v19];

LABEL_8:
    uint64_t v61 = [[TRIFetchOptions alloc] initWithDownloadOptions:v16 cacheDeleteAvailableSpaceClass:&unk_1F347BB40];
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    int out_token = 0;
    objc_super v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      bmltBatchNotificationIdentifier = self->_bmltBatchNotificationIdentifier;
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = bmltBatchNotificationIdentifier;
      _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "Registering BMLT (single) fetch notification %{public}@", buf, 0xCu);
    }

    id v23 = [(NSString *)self->_bmltBatchNotificationIdentifier UTF8String];
    v24 = dispatch_get_global_queue(17, 0);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __66__TRIFetchBMLTNotificationsTask_fetchSingleDeploymentWithContext___block_invoke;
    handler[3] = &unk_1E6BB9EB0;
    handler[4] = self;
    id v25 = v4;
    id v83 = v25;
    notify_register_dispatch(v23, &out_token, v24, handler);

    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    int v81 = 2;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v93 = __Block_byref_object_copy__46;
    v94 = __Block_byref_object_dispose__46;
    id v95 = 0;
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__46;
    int v76 = __Block_byref_object_dispose__46;
    id v77 = 0;
    v26 = TRILogCategory_Server();
    os_signpost_id_t v27 = os_signpost_id_generate(v26);

    uint64_t v28 = TRILogCategory_Server();
    v29 = v28;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      v59 = v15;
      id v30 = [(TRIBMLTDeployment *)self->_deployment backgroundMLTaskId];
      int v31 = [(TRIBMLTDeployment *)self->_deployment deploymentId];
      *(_DWORD *)v86 = 138543618;
      id v87 = v30;
      __int16 v88 = 1024;
      LODWORD(v89) = v31;
      _os_signpost_emit_with_name_impl(&dword_1DA291000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "FetchBMLTNotificationWithDeployment", "bmlt: %{public}@, d: %d", v86, 0x12u);

      id v15 = v59;
    }

    id v32 = self->_deployment;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __66__TRIFetchBMLTNotificationsTask_fetchSingleDeploymentWithContext___block_invoke_63;
    v66[3] = &unk_1E6BBDA70;
    v66[4] = self;
    v69 = &v78;
    v70 = buf;
    v71 = &v72;
    id v60 = v25;
    id v67 = v60;
    v33 = v20;
    uint64_t v68 = v33;
    [v15 fetchBMLTNotificationWithDeployment:v32 options:v61 completion:v66];
    dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
    id v34 = TRILogCategory_Server();
    v35 = v34;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      BOOL v36 = v15;
      v37 = [(TRIBMLTDeployment *)self->_deployment backgroundMLTaskId];
      int v38 = [(TRIBMLTDeployment *)self->_deployment deploymentId];
      *(_DWORD *)v86 = 138543618;
      id v87 = v37;
      __int16 v88 = 1024;
      LODWORD(v89) = v38;
      _os_signpost_emit_with_name_impl(&dword_1DA291000, v35, OS_SIGNPOST_INTERVAL_END, v27, "FetchBMLTNotificationWithDeployment", "bmlt: %{public}@, d: %d", v86, 0x12u);

      id v15 = v36;
    }

    v39 = TRILogCategory_Server();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v54 = v15;
      id v55 = (id)objc_opt_class();
      v56 = [(TRIBMLTDeployment *)self->_deployment shortDesc];
      uint64_t v57 = *((int *)v79 + 6);
      if (v57 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *((int *)v79 + 6));
        char v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v58 = off_1E6BBDB58[v57];
      }
      *(_DWORD *)v86 = 138543874;
      id v87 = v55;
      __int16 v88 = 2114;
      BOOL v89 = v56;
      __int16 v90 = 2114;
      v91 = v58;
      _os_log_debug_impl(&dword_1DA291000, v39, OS_LOG_TYPE_DEBUG, "Finished %{public}@ with BMLT %{public}@: %{public}@", v86, 0x20u);

      id v15 = v54;
    }

    if (v73[5])
    {
      self->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      v40 = TRIFetchErrorParseToMetrics((void *)v73[5]);
      if ([v40 count])
      {
        v41 = v15;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v42 = v40;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v85 count:16];
        if (v43)
        {
          uint64_t v44 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v43; ++i)
            {
              if (*(void *)v63 != v44) {
                objc_enumerationMutation(v42);
              }
              [(TRIFetchBMLTNotificationsTask *)self _addMetric:*(void *)(*((void *)&v62 + 1) + 8 * i)];
            }
            uint64_t v43 = [v42 countByEnumeratingWithState:&v62 objects:v85 count:16];
          }
          while (v43);
        }

        id v15 = v41;
      }
    }
    uint64_t v46 = *((unsigned int *)v79 + 6);
    if (v46 == 3)
    {
      notify_post("com.apple.trial.bmlt.activated");
      [(TRIFetchBMLTNotificationsTask *)self _mlruntimeNotifiedTelemetryWithRecords:0 serverContext:v60];
      uint64_t v46 = *((unsigned int *)v79 + 6);
    }
    id v47 = +[TRITaskRunResult resultWithRunStatus:v46 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:*(void *)(*(void *)&buf[8] + 40)];

    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v78, 8);
    goto LABEL_34;
  }
  v48 = TRILogCategory_Server();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v48, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
  }

  id v47 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
LABEL_34:

  return v47;
}

uint64_t __66__TRIFetchBMLTNotificationsTask_fetchSingleDeploymentWithContext___block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) _mlruntimeNotifiedTelemetryWithRecords:1 serverContext:*(void *)(a1 + 40)];
  notify_post("com.apple.trial.bmlt.activated");
  return notify_cancel(a2);
}

void __66__TRIFetchBMLTNotificationsTask_fetchSingleDeploymentWithContext___block_invoke_63(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2 == 4)
  {
    if (v9)
    {
      uint64_t v12 = [v9 backgroundTask];
      if ([v12 hasEndDate])
      {
        id v13 = [v9 backgroundTask];
        id v14 = [v13 endDate];
        id v15 = [v14 date];
      }
      else
      {
        id v15 = 0;
      }

      dispatch_semaphore_t v20 = [*(id *)(a1 + 40) bmltDatabase];
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 40);
      id v22 = [v9 backgroundTask];
      id v23 = [v22 pluginId];
      uint64_t v24 = [v20 addBackgroundMLTaskWithTaskDeployment:v21 pluginId:v23 status:0 endDate:v15 artifact:v9];

      if (v24 != 1)
      {
        id v25 = TRILogCategory_Server();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = [*(id *)(*(void *)(a1 + 32) + 40) shortDesc];
          int v27 = 138543362;
          uint64_t v28 = v26;
          _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Unexpected conflict when saving BMLT to database: %{public}@", (uint8_t *)&v27, 0xCu);
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 3;
      }
    }
    else
    {
      id v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 40) shortDesc];
        int v27 = 138543362;
        uint64_t v28 = v19;
        _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "No valid and compatible BMLT artifact was received for %{public}@.", (uint8_t *)&v27, 0xCu);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 3;
    }
  }
  else
  {
    id v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [*(id *)(*(void *)(a1 + 32) + 40) shortDesc];
      int v27 = 138543618;
      uint64_t v28 = v17;
      __int16 v29 = 2114;
      id v30 = v11;
      _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Unable to fetch BMLT notification %{public}@: %{public}@", (uint8_t *)&v27, 0x16u);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x1E016E7F0]();
  v75 = (void *)os_transaction_create();
  if (!self->_deployment)
  {
    id v15 = [v6 keyValueStore];
    id v9 = +[TRIFetchDateManager managerWithKeyValueStore:v15];

    id v16 = [v6 namespaceDatabase];
    id v17 = [v6 paths];
    id v18 = [v17 namespaceDescriptorsDefaultDir];
    v70 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v16 defaultDescriptorDirectoryPath:v18];

    uint64_t v19 = [(TRITaskAttributing *)self->_taskAttribution triCloudKitContainer];
    dispatch_semaphore_t v20 = [(TRITaskAttributing *)self->_taskAttribution teamIdentifier];
    uint64_t v21 = [(TRITaskAttributing *)self->_taskAttribution applicationBundleIdentifier];
    uint64_t v72 = +[TRICKNativeArtifactProvider providerForContainer:v19 teamId:v20 bundleId:v21 dateProvider:v9 namespaceDescriptorProvider:v70 serverContext:v6];

    v73 = [(TRITaskAttributing *)self->_taskAttribution networkOptions];
    id v22 = v73;
    if ([v73 allowsCellularAccess])
    {
      id v23 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"allows_cellular_download", objc_msgSend(v73, "allowsCellularAccess"));
      [(TRIFetchBMLTNotificationsTask *)self _addMetric:v23];

      id v22 = v73;
    }
    if ([v22 discretionaryBehavior])
    {
      uint64_t v24 = [v22 requiredCapability];
      id v25 = [(TRIBaseTask *)self stateProvider];
      v26 = [v25 activeActivityGrantingCapability:v24];

      if (!v26)
      {
        id v60 = TRILogCategory_Server();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1DA291000, v60, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", (uint8_t *)&buf, 2u);
        }

        id v68 = (id)[(NSMutableArray *)self->_nextTasks copy];
        id v14 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:v68 earliestRetryDate:0];
        goto LABEL_45;
      }
      [v73 setActivity:v26];
    }
    int v27 = objc_opt_new();
    id v67 = objc_opt_new();
    uint64_t v28 = [TRIBMLTTargeter alloc];
    __int16 v29 = [v6 bmltDatabase];
    id v30 = [TRISystemCovariates alloc];
    uint64_t v31 = [v6 paths];
    id v32 = [(TRISystemCovariates *)v30 initWithPaths:v31];
    v33 = [[TRIUserCovariates alloc] initWithContext:v6];
    long long v65 = [(TRIBMLTTargeter *)v28 initWithDatabase:v29 systemCovariateProvider:v32 userCovariateProvider:v33];

    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v118 = 0x3032000000;
    long long v119 = __Block_byref_object_copy__46;
    id v120 = __Block_byref_object_dispose__46;
    id v121 = 0;
    uint64_t v112 = 0;
    v113 = &v112;
    uint64_t v114 = 0x2020000000;
    int v115 = 0;
    uint64_t v106 = 0;
    id v107 = &v106;
    uint64_t v108 = 0x3032000000;
    v109 = __Block_byref_object_copy__46;
    id v110 = __Block_byref_object_dispose__46;
    id v111 = 0;
    uint64_t v102 = 0;
    v103 = &v102;
    uint64_t v104 = 0x2020000000;
    uint64_t v105 = 0;
    uint64_t v98 = 0;
    id v99 = &v98;
    uint64_t v100 = 0x2020000000;
    uint64_t v101 = 0;
    v71 = [[TRIFetchOptions alloc] initWithDownloadOptions:v73 cacheDeleteAvailableSpaceClass:&unk_1F347BB40];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke;
    v93[3] = &unk_1E6BBDA98;
    id v97 = &v98;
    v93[4] = self;
    id v35 = v27;
    id v94 = v35;
    id v36 = v6;
    id v95 = v36;
    v37 = v34;
    uint64_t v96 = v37;
    v69 = (void *)MEMORY[0x1E016EA80](v93);
    int v38 = TRILogCategory_Server();
    os_signpost_id_t v39 = os_signpost_id_generate(v38);

    v40 = TRILogCategory_Server();
    v41 = v40;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      *(_WORD *)v92 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA291000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "FetchBMLTCatalogNotification", (const char *)&unk_1DA433847, v92, 2u);
    }

    [v72 fetchBMLTCatalogNotificationWithOptions:v71 completion:v69];
    dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
    id v42 = TRILogCategory_Server();
    uint64_t v43 = v42;
    if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)v92 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA291000, v43, OS_SIGNPOST_INTERVAL_END, v39, "FetchBMLTCatalogNotification", (const char *)&unk_1DA433847, v92, 2u);
    }

    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke_70;
    v80[3] = &unk_1E6BBDAE8;
    __int16 v88 = &v106;
    p_long long buf = &buf;
    id v87 = &v112;
    v80[4] = self;
    id v64 = v67;
    id v81 = v64;
    id v68 = v35;
    id v82 = v68;
    char v66 = v65;
    id v83 = v66;
    id v44 = v36;
    id v84 = v44;
    id v85 = v7;
    __int16 v90 = &v102;
    v91 = &v98;
    v45 = v37;
    v86 = v45;
    uint64_t v46 = (void *)MEMORY[0x1E016EA80](v80);
    id v47 = TRILogCategory_Server();
    os_signpost_id_t v48 = os_signpost_id_generate(v47);

    v49 = TRILogCategory_Server();
    v50 = v49;
    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
    {
      *(_WORD *)v92 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA291000, v50, OS_SIGNPOST_INTERVAL_BEGIN, v48, "FetchBMLTNotificationsDateDescending", (const char *)&unk_1DA433847, v92, 2u);
    }

    [v72 fetchBMLTNotificationsWithOptions:v71 completion:v46];
    dispatch_semaphore_wait(v45, 0xFFFFFFFFFFFFFFFFLL);
    v51 = TRILogCategory_Server();
    id v52 = v51;
    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
    {
      *(_WORD *)v92 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA291000, v52, OS_SIGNPOST_INTERVAL_END, v48, "FetchBMLTNotificationsDateDescending", (const char *)&unk_1DA433847, v92, 2u);
    }

    if (!v103[3] && !v99[3] && *((_DWORD *)v113 + 6) == 2)
    {
      notify_post("com.apple.trial.bmlt.activated");
      [(TRIFetchBMLTNotificationsTask *)self _mlruntimeNotifiedTelemetryWithRecords:0 serverContext:v44];
    }
    if (v107[5])
    {
      self->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      v53 = TRIFetchErrorParseToMetrics((void *)v107[5]);
      if ([v53 count])
      {
        id v63 = v7;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v54 = v53;
        uint64_t v55 = [v54 countByEnumeratingWithState:&v76 objects:v116 count:16];
        if (v55)
        {
          uint64_t v56 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v55; ++i)
            {
              if (*(void *)v77 != v56) {
                objc_enumerationMutation(v54);
              }
              [(TRIFetchBMLTNotificationsTask *)self _addMetric:*(void *)(*((void *)&v76 + 1) + 8 * i)];
            }
            uint64_t v55 = [v54 countByEnumeratingWithState:&v76 objects:v116 count:16];
          }
          while (v55);
        }

        id v7 = v63;
      }
    }
    uint64_t v58 = *((unsigned int *)v113 + 6);
    v59 = (void *)[(NSMutableArray *)self->_nextTasks copy];
    id v14 = +[TRITaskRunResult resultWithRunStatus:v58 reportResultToServer:1 nextTasks:v59 earliestRetryDate:*(void *)(*((void *)&buf + 1) + 40)];

    _Block_object_dispose(&v98, 8);
    _Block_object_dispose(&v102, 8);
    _Block_object_dispose(&v106, 8);

    _Block_object_dispose(&v112, 8);
    _Block_object_dispose(&buf, 8);

LABEL_45:
    goto LABEL_46;
  }
  id v8 = [v6 bmltDatabase];
  id v9 = [v8 taskRecordWithTaskDeployment:self->_deployment];

  id v10 = TRILogCategory_Server();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(TRIBMLTDeployment *)self->_deployment shortDesc];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Skipping CloudKit fetch of BMLT notification for %{public}@: already present.", (uint8_t *)&buf, 0xCu);
    }
    id v13 = [TRITaskRunResult alloc];
    id v14 = [(TRITaskRunResult *)v13 initWithRunStatus:2 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      long long v62 = [(TRIBMLTDeployment *)self->_deployment shortDesc];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v62;
      _os_log_debug_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEBUG, "CloudKit fetch of BMLT notification for %{public}@", (uint8_t *)&buf, 0xCu);
    }
    id v14 = [(TRIFetchBMLTNotificationsTask *)self fetchSingleDeploymentWithContext:v6];
    id v9 = 0;
  }
LABEL_46:

  return v14;
}

void __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2 <= 1)
  {
    uint64_t v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v11;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "BMLT catalog fetch failed. Notifications fetching will continue but no BMLTs will be deactivated. Error %@", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_14;
  }
  if (a2 == 2)
  {
    uint64_t v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v11;
      id v13 = "BMLT catalog fetch was asked to retry. Notifications fetching will continue but no BMLTs will be deactivated. Error %@";
LABEL_13:
      _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v9) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) _processBMLTCatalogArtifact:v9 deactivatedBMLTs:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  }
  if (a2 != 3)
  {
    if (a2 != 4)
    {
LABEL_15:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
      goto LABEL_16;
    }
    uint64_t v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      int v15 = 134217984;
      id v16 = v14;
      id v13 = "BMLT catalog fetch status success with %ld BMLTs to deactivate";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
}

void __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke_70(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2 <= 1)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 3;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), a5);
LABEL_20:
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 0;
    uint64_t v36 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24)
        + *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
    if (v36)
    {
      int out_token = 0;
      dispatch_semaphore_t v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 56);
        uint64_t v22 = *(void *)(*((void *)&buf + 1) + 24);
        *(_DWORD *)id v30 = 138543618;
        uint64_t v31 = v21;
        __int16 v32 = 2048;
        uint64_t v33 = v22;
        _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "Registering BMLT bulk fetch notification %{public}@ for %lu records.", v30, 0x16u);
      }

      id v23 = (const char *)[*(id *)(*(void *)(a1 + 32) + 56) UTF8String];
      uint64_t v24 = dispatch_get_global_queue(17, 0);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke_71;
      v26[3] = &unk_1E6BBDAC0;
      uint64_t v25 = *(void *)(a1 + 32);
      p_long long buf = &buf;
      v26[4] = v25;
      id v27 = *(id *)(a1 + 64);
      notify_register_dispatch(v23, &out_token, v24, v26);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));
    _Block_object_dispose(&buf, 8);
    goto LABEL_25;
  }
  if (a2 == 2)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
    if (v10)
    {
      *(_DWORD *)(v12 + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), a4);
    }
    else
    {
      *(_DWORD *)(v12 + 24) = 3;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), a5);
    goto LABEL_20;
  }
  if (v9
    && [*(id *)(a1 + 32) _processBMLTArtifact:v9 bmltsProcessed:*(void *)(a1 + 40) deactivatedBMLTs:*(void *)(a1 + 48) targeter:*(void *)(a1 + 56) context:*(void *)(a1 + 64) taskQueue:*(void *)(a1 + 72)])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
  }
  if (a2 != 3)
  {
    if (a2 != 4) {
      goto LABEL_20;
    }
    BOOL v13 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) == 0;
    id v14 = TRILogCategory_Server();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        LOWORD(buf) = 0;
        uint64_t v17 = "BMLT fetch status success but 0 results fetched.";
        id v18 = v14;
        uint32_t v19 = 2;
        goto LABEL_18;
      }
    }
    else if (v15)
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v16;
      uint64_t v17 = "BMLT fetch status success with %ld results";
      id v18 = v14;
      uint32_t v19 = 12;
LABEL_18:
      _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&buf, v19);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 2;
    goto LABEL_20;
  }
LABEL_25:
}

void __63__TRIFetchBMLTNotificationsTask_runUsingContext_withTaskQueue___block_invoke_71(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 24) - 1;
  *(void *)(v3 + 24) = v4;
  if (!v4)
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "com.apple.trial.bmlt.activated";
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "All fetched BMLTs have been processed. Sending a %s notification.", (uint8_t *)&v10, 0xCu);
    }

    notify_post("com.apple.trial.bmlt.activated");
    [*(id *)(a1 + 32) _mlruntimeNotifiedTelemetryWithRecords:1 serverContext:*(void *)(a1 + 40)];
    notify_cancel(a2);
  }
  id v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(const char **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
    int v10 = 134218242;
    id v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "%lu BMLTs remain to be processed for notification: %@.", (uint8_t *)&v10, 0x16u);
  }
}

+ (id)categoricalValueForBMLTNotificationEvent:(unint64_t)a3
{
  if (a3) {
    return @"bmlt-fetched-without-records";
  }
  else {
    return @"bmlt-fetched-with-records";
  }
}

- (void)_mlruntimeNotifiedTelemetryWithRecords:(BOOL)a3 serverContext:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = !a3;
  id v6 = a4;
  id v7 = +[TRIFetchBMLTNotificationsTask categoricalValueForBMLTNotificationEvent:v5];
  id v8 = [MEMORY[0x1E4FB05A8] metricWithName:@"bmlt_completed_fetch" categoricalValue:v7];
  uint64_t v9 = [v6 client];
  int v10 = [v9 logger];
  id v11 = [v6 client];

  __int16 v12 = [v11 trackingId];
  v15[0] = v8;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  uint64_t v14 = [(TRIFetchBMLTNotificationsTask *)self dimensions];
  [v10 logWithTrackingId:v12 metrics:v13 dimensions:v14 trialSystemTelemetry:0];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRIFetchBMLTNotificationsTask;
  if ([(TRIBaseTask *)&v7 isEqual:v4]) {
    char v5 = [(TRITaskAttributing *)self->_taskAttribution isEqual:v4[4]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)TRIFetchBMLTNotificationsTask;
  unint64_t v3 = [(TRIBaseTask *)&v5 hash];
  return [(TRITaskAttributing *)self->_taskAttribution hash] + 37 * v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@,r:%d>", objc_opt_class(), -[TRIFetchBMLTNotificationsTask retryCount](self, "retryCount")];
}

- (void)_addMetric:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__TRIFetchBMLTNotificationsTask__addMetric___block_invoke;
  v7[3] = &unk_1E6BBDB10;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __44__TRIFetchBMLTNotificationsTask__addMetric___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = (void *)a2[1];
  if (!v3)
  {
    objc_super v5 = a2;
    uint64_t v6 = objc_opt_new();
    objc_super v7 = (void *)a2[1];
    a2[1] = v6;

    unint64_t v3 = (void *)a2[1];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  return [v3 addObject:v8];
}

- (void)_addDimension:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__TRIFetchBMLTNotificationsTask__addDimension___block_invoke;
  v7[3] = &unk_1E6BBDB10;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __47__TRIFetchBMLTNotificationsTask__addDimension___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = (void *)a2[2];
  if (!v3)
  {
    objc_super v5 = a2;
    uint64_t v6 = objc_opt_new();
    objc_super v7 = (void *)a2[2];
    a2[2] = v6;

    unint64_t v3 = (void *)a2[2];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  return [v3 addObject:v8];
}

- (id)metrics
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__46;
  int v10 = __Block_byref_object_dispose__46;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__TRIFetchBMLTNotificationsTask_metrics__block_invoke;
  v5[3] = &unk_1E6BBDB38;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __40__TRIFetchBMLTNotificationsTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 8) copy];
  return MEMORY[0x1F41817F8]();
}

- (id)dimensions
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__46;
  int v10 = __Block_byref_object_dispose__46;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__TRIFetchBMLTNotificationsTask_dimensions__block_invoke;
  v5[3] = &unk_1E6BBDB38;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __43__TRIFetchBMLTNotificationsTask_dimensions__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 16) copy];
  return MEMORY[0x1F41817F8]();
}

- (id)trialSystemTelemetry
{
  id v3 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:self->_taskAttribution];
  id v4 = [(TRITaskAttributing *)self->_taskAttribution teamIdentifier];
  [v3 setClientTeamId:v4];

  return v3;
}

- (id)_asPersistedTask
{
  id v3 = objc_opt_new();
  id v4 = [(TRITaskAttributing *)self->_taskAttribution asPersistedTaskAttribution];
  [v3 setTaskAttribution:v4];

  objc_msgSend(v3, "setRetryCount:", -[TRIFetchBMLTNotificationsTask retryCount](self, "retryCount"));
  deployment = self->_deployment;
  if (deployment)
  {
    uint64_t v6 = [(TRIBMLTDeployment *)deployment backgroundMLTaskId];
    [v3 setBackgroundMlTaskId:v6];

    objc_msgSend(v3, "setDeploymentId:", -[TRIBMLTDeployment deploymentId](self->_deployment, "deploymentId"));
  }
  if (self->_bmltBatchNotificationIdentifier) {
    objc_msgSend(v3, "setBmltBatchNotificationId:");
  }
  return v3;
}

- (id)serialize
{
  id v4 = [(TRIFetchBMLTNotificationsTask *)self _asPersistedTask];
  objc_super v5 = [v4 data];

  if (!v5)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIFetchBMLTNotificationsTask.m", 793, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  id v3 = +[TRIPBMessage parseFromData:a3 error:&v18];
  id v4 = v18;
  if (v3)
  {
    if ([v3 hasTaskAttribution])
    {
      objc_super v5 = [v3 taskAttribution];
      uint64_t v6 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v5];

      if (v6)
      {
        if ([v3 hasBackgroundMlTaskId]
          && [v3 hasDeploymentId])
        {
          objc_super v7 = (void *)MEMORY[0x1E4FB0078];
          uint64_t v8 = [v3 backgroundMlTaskId];
          uint64_t v9 = objc_msgSend(v7, "deploymentWithBackgroundMLTaskId:deploymentId:", v8, objc_msgSend(v3, "deploymentId"));

          if ([v3 hasBmltBatchNotificationId])
          {
            int v10 = [v3 bmltBatchNotificationId];
            id v11 = +[TRIFetchBMLTNotificationsTask taskWithDeployment:v9 taskAttribution:v6 bmltBatchNotificationIdentifier:v10];
          }
          else
          {
            id v11 = +[TRIFetchBMLTNotificationsTask taskWithDeployment:v9 taskAttribution:v6 bmltBatchNotificationIdentifier:0];
          }
          if ([v3 hasRetryCount]) {
            uint64_t v17 = [v3 retryCount];
          }
          else {
            uint64_t v17 = 0;
          }
          [v11 setRetryCount:v17];
        }
        else
        {
          id v11 = +[TRIFetchBMLTNotificationsTask taskWithTaskAttribution:v6];
          if ([v3 hasRetryCount]) {
            uint64_t v14 = [v3 retryCount];
          }
          else {
            uint64_t v14 = 0;
          }
          [v11 setRetryCount:v14];
        }
        goto LABEL_18;
      }
      BOOL v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
      }

      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v6 = TRILogCategory_Server();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        __int16 v12 = (objc_class *)objc_opt_class();
        uint64_t v13 = NSStringFromClass(v12);
        *(_DWORD *)long long buf = 138412290;
        id v20 = v13;
        _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: taskAttribution", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v20 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIFetchBMLTNotificationsPersistedTask: %{public}@", buf, 0xCu);
    }
  }
  id v11 = 0;
LABEL_18:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchBMLTNotificationsTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchBMLTNotificationsTask;
  objc_super v5 = [(TRIFetchBMLTNotificationsTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      objc_super v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFetchBMLTNotificationsTask.m", 833, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  objc_super v5 = [(TRIFetchBMLTNotificationsTask *)self serialize];
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
  objc_storeStrong((id *)&self->_bmltBatchNotificationIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
}

@end