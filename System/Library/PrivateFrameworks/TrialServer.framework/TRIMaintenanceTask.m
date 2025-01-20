@interface TRIMaintenanceTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)task;
- (BOOL)_cleanupLocalTempStorageWithPaths:(id)a3;
- (BOOL)_cleanupTreatmentWithTreatmentId:(id)a3 paths:(id)a4;
- (BOOL)_cleanupUnusedContentWithContext:(id)a3 nextTasks:(id)a4;
- (BOOL)wasDeferred;
- (TRIMaintenanceTask)init;
- (TRIMaintenanceTask)initWithCoder:(id)a3;
- (id)_asPersistedTask;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)retryCount;
- (int)taskType;
- (void)_handleExpiredBMLTsWithBMLTDatabase:(id)a3 nextTasks:(id)a4;
- (void)_handleExpiredExperimentsWithExperimentDatabase:(id)a3 nextTasks:(id)a4;
- (void)_handleOrphanedNamespacesWithNamespaceDatabase:(id)a3 nextTasks:(id)a4;
- (void)_synchronizePushService:(id)a3 usingRolloutDatabase:(id)a4 experimentDatabase:(id)a5;
- (void)addDimension:(id)a3;
- (void)addMetric:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeTelemetry:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRIMaintenanceTask

+ (id)task
{
  v2 = objc_opt_new();
  [v2 setRetryCount:0];
  return v2;
}

- (TRIMaintenanceTask)init
{
  v16.receiver = self;
  v16.super_class = (Class)TRIMaintenanceTask;
  v2 = [(TRIMaintenanceTask *)&v16 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    channelCleanupQueue = v2->_channelCleanupQueue;
    v2->_channelCleanupQueue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new();
    v10 = (void *)v9[1];
    v9[1] = 0;

    v11 = (void *)v9[2];
    v9[2] = 0;

    v12 = (void *)v9[3];
    v9[3] = 0;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v9];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v13;

    v2->_isFlatbufferReadEnabled = _os_feature_enabled_impl();
    v2->_isFlatbufferWriteEnabled = _os_feature_enabled_impl();
    v2->_isFlatbufferTreatmentReadEnabled = _os_feature_enabled_impl();
    v2->_isFlatbufferTreatmentWriteEnabled = _os_feature_enabled_impl();
  }
  return v2;
}

- (int)taskType
{
  return 7;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  dispatch_queue_t v7 = [(TRIBaseTask *)self stateProvider];
  v8 = [v7 activeActivityDescriptorGrantingCapability:24];

  v9 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:v6 earliestRetryDate:0];
  if (v8)
  {
    v10 = [v8 shouldDefer];
    int v11 = v10[2]();

    if (v11)
    {
      v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Deferral requested before any maintenance task.";
LABEL_61:
        _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
        goto LABEL_62;
      }
      goto LABEL_62;
    }
    v15 = [v5 experimentDatabase];
    [(TRIMaintenanceTask *)self _handleExpiredExperimentsWithExperimentDatabase:v15 nextTasks:v6];

    objc_super v16 = [v8 shouldDefer];
    int v17 = v16[2]();

    if (v17)
    {
      v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Deferral requested before handling expired BMLTs.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
  }
  else
  {
    v14 = [v5 experimentDatabase];
    [(TRIMaintenanceTask *)self _handleExpiredExperimentsWithExperimentDatabase:v14 nextTasks:v6];
  }
  v18 = [v5 bmltDatabase];
  [(TRIMaintenanceTask *)self _handleExpiredBMLTsWithBMLTDatabase:v18 nextTasks:v6];

  if (v8)
  {
    v19 = [v8 shouldDefer];
    int v20 = v19[2]();

    if (v20)
    {
      v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Deferral requested before handling orphaned namespaces.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    v22 = [v5 namespaceDatabase];
    [(TRIMaintenanceTask *)self _handleOrphanedNamespacesWithNamespaceDatabase:v22 nextTasks:v6];

    v23 = [v8 shouldDefer];
    int v24 = v23[2]();

    if (v24)
    {
      v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Deferral requested before any cleaning unused content.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
  }
  else
  {
    v21 = [v5 namespaceDatabase];
    [(TRIMaintenanceTask *)self _handleOrphanedNamespacesWithNamespaceDatabase:v21 nextTasks:v6];
  }
  BOOL v25 = [(TRIMaintenanceTask *)self _cleanupUnusedContentWithContext:v5 nextTasks:v6];
  v26 = [v5 paths];
  BOOL v27 = [(TRIMaintenanceTask *)self _cleanupLocalTempStorageWithPaths:v26];

  if (v8)
  {
    v28 = [v8 shouldDefer];
    int v29 = v28[2]();

    if (v29)
    {
      v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Deferral requested before push service sync.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
    v33 = [v5 pushServiceMuxer];
    v34 = [v5 rolloutDatabase];
    v35 = [v5 experimentDatabase];
    [(TRIMaintenanceTask *)self _synchronizePushService:v33 usingRolloutDatabase:v34 experimentDatabase:v35];

    v36 = [v8 shouldDefer];
    LODWORD(v34) = v36[2]();

    if (v34)
    {
      v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Deferral requested before expiring old history records.";
        goto LABEL_61;
      }
      goto LABEL_62;
    }
  }
  else
  {
    v30 = [v5 pushServiceMuxer];
    v31 = [v5 rolloutDatabase];
    v32 = [v5 experimentDatabase];
    [(TRIMaintenanceTask *)self _synchronizePushService:v30 usingRolloutDatabase:v31 experimentDatabase:v32];
  }
  BOOL v71 = v27;
  BOOL v37 = v25;
  v38 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1814400.0];
  uint64_t v72 = 0;
  v39 = [v5 experimentHistoryDatabase];
  int v40 = [v39 expireRecordsOlderThanDate:v38 deletedCount:&v72];

  if (v40)
  {
    v41 = TRILogCategory_Server();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v74 = v72;
      _os_log_impl(&dword_1DA291000, v41, OS_LOG_TYPE_DEFAULT, "Expired %tu records from experiment history.", buf, 0xCu);
    }
  }
  if (v8
    && ([v8 shouldDefer],
        v42 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        int v43 = v42[2](),
        v42,
        v43))
  {
    v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v13 = "Deferral requested before expiring old rollout history records.";
      goto LABEL_61;
    }
  }
  else
  {
    v44 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1814400.0];
    uint64_t v72 = 0;
    v45 = [v5 rolloutHistoryDatabase];
    int v46 = [v45 expireRecordsOlderThanDate:v44 deletedCount:&v72];

    if (v46)
    {
      v47 = TRILogCategory_Server();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v74 = v72;
        _os_log_impl(&dword_1DA291000, v47, OS_LOG_TYPE_DEFAULT, "Expired %tu records from rollout history.", buf, 0xCu);
      }
    }
    if (v8
      && ([v8 shouldDefer],
          v48 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
          int v49 = v48[2](),
          v48,
          v49))
    {
      v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Deferral requested before expiring old ML runtime evaluation history records.";
        goto LABEL_61;
      }
    }
    else
    {
      v50 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1814400.0];
      uint64_t v72 = 0;
      v51 = [v5 evaluationHistoryDatabase];
      int v52 = [v51 expireRecordsOlderThanDate:v50 deletedCount:&v72];

      if (v52)
      {
        v53 = TRILogCategory_Server();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v74 = v72;
          _os_log_impl(&dword_1DA291000, v53, OS_LOG_TYPE_DEFAULT, "Expired %tu records from MLRuntime evaluation history.", buf, 0xCu);
        }
      }
      if (!v8
        || ([v8 shouldDefer],
            v54 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
            int v55 = v54[2](),
            v54,
            !v55))
      {
        v56 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1814400.0];
        uint64_t v72 = 0;
        v57 = [v5 bmltHistoryDatabase];
        int v58 = [v57 expireRecordsOlderThanDate:v56 deletedCount:&v72];

        if (v58)
        {
          v59 = TRILogCategory_Server();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v74 = v72;
            _os_log_impl(&dword_1DA291000, v59, OS_LOG_TYPE_DEFAULT, "Expired %tu records from BMLT history.", buf, 0xCu);
          }
        }
        if (v8)
        {
          v60 = [v8 shouldDefer];
          int v61 = v60[2]();

          v62 = &off_1E6BB7000;
          if (v61)
          {
            v12 = TRILogCategory_Server();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v13 = "Deferral requested before compacting database.";
              goto LABEL_61;
            }
            goto LABEL_62;
          }
          v64 = [v5 underlyingDatabase];
          [v64 vacuum];

          v65 = [v8 shouldDefer];
          int v66 = v65[2]();

          if (v66)
          {
            v12 = TRILogCategory_Server();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v13 = "Deferral requested before reporting storage telemetry.";
              goto LABEL_61;
            }
            goto LABEL_62;
          }
        }
        else
        {
          v63 = [v5 underlyingDatabase];
          [v63 vacuum];

          v62 = &off_1E6BB7000;
        }
        v69 = [[TRIActiveExperimentsMetricRecorder alloc] initWithServerContext:v5];
        [(TRIActiveExperimentsMetricRecorder *)v69 recordMetric];
        if (v37 && v71) {
          uint64_t v70 = 2;
        }
        else {
          uint64_t v70 = 3;
        }
        id v67 = [v62[209] resultWithRunStatus:v70 reportResultToServer:1 nextTasks:v6 earliestRetryDate:0];

        goto LABEL_63;
      }
      v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Deferral requested before expiring old BMLT history records.";
        goto LABEL_61;
      }
    }
  }
LABEL_62:

  self->wasDeferred = 1;
  id v67 = v9;
LABEL_63:

  return v67;
}

- (void)_handleExpiredExperimentsWithExperimentDatabase:(id)a3 nextTasks:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __80__TRIMaintenanceTask__handleExpiredExperimentsWithExperimentDatabase_nextTasks___block_invoke;
  v15 = &unk_1E6BB8AE0;
  id v8 = v7;
  id v16 = v8;
  int v17 = &v18;
  [v6 enumerateExperimentRecordsWithBlock:&v12];
  v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(TRIBaseTask *)self taskName];
    int v11 = *((_DWORD *)v19 + 6);
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    __int16 v24 = 1024;
    int v25 = v11;
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled deactivation of %u experiments", buf, 0x12u);
  }
  _Block_object_dispose(&v18, 8);
}

void __80__TRIMaintenanceTask__handleExpiredExperimentsWithExperimentDatabase_nextTasks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isExpiredExperiment])
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 experimentDeployment];
      id v6 = [v5 experimentId];
      id v7 = [v3 treatmentId];
      int v12 = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "scheduling deactivation of experiment %{public}@ with treatment %@", (uint8_t *)&v12, 0x16u);
    }
    id v8 = [v3 experimentDeployment];
    v9 = [v8 experimentId];
    v10 = [v3 experimentDeployment];
    int v11 = +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v9, [v10 deploymentId], 0, 2, 0);

    [*(id *)(a1 + 32) addObject:v11];
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (void)_handleExpiredBMLTsWithBMLTDatabase:(id)a3 nextTasks:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  __int16 v14 = __68__TRIMaintenanceTask__handleExpiredBMLTsWithBMLTDatabase_nextTasks___block_invoke;
  v15 = &unk_1E6BB8BB0;
  id v8 = v7;
  id v16 = v8;
  int v17 = &v18;
  [v6 enumerateActiveTasksWithBlock:&v12];
  v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(TRIBaseTask *)self taskName];
    int v11 = *((_DWORD *)v19 + 6);
    *(_DWORD *)buf = 138543618;
    v23 = v10;
    __int16 v24 = 1024;
    int v25 = v11;
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduled deactivation of %u BMLTs", buf, 0x12u);
  }
  _Block_object_dispose(&v18, 8);
}

void __68__TRIMaintenanceTask__handleExpiredBMLTsWithBMLTDatabase_nextTasks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isExpired])
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 bmltDeployment];
      id v6 = [v5 backgroundMLTaskId];
      id v7 = [v3 activeFactorPackSetId];
      int v10 = 138543618;
      int v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "scheduling deactivation of BMLT %{public}@ with active factor pack set ID %@", (uint8_t *)&v10, 0x16u);
    }
    id v8 = [v3 bmltDeployment];
    v9 = +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:v8 triggerEvent:4];

    [*(id *)(a1 + 32) addObject:v9];
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (BOOL)_cleanupTreatmentWithTreatmentId:(id)a3 paths:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Removing treatment %@.", (uint8_t *)&v16, 0xCu);
  }

  v9 = [[TRIClientTreatmentStorage alloc] initWithPaths:v7];
  BOOL v10 = [(TRIClientTreatmentStorage *)v9 removeTreatmentWithTreatmentId:v6];
  if (!v10)
  {
    int v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Could not remove treatment %@.", (uint8_t *)&v16, 0xCu);
    }
  }
  if (self->_isFlatbufferTreatmentWriteEnabled)
  {
    __int16 v12 = [[TRIFBClientTreatmentStorage alloc] initWithPaths:v7];
    BOOL v13 = [(TRIFBClientTreatmentStorage *)v12 removeTreatmentWithTreatmentId:v6];
    if (!v13)
    {
      uint64_t v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Could not remove treatment from flatbuffer storage:%@.", (uint8_t *)&v16, 0xCu);
      }
    }
    if (self->_isFlatbufferTreatmentReadEnabled) {
      BOOL v10 = v13;
    }
  }
  return v10;
}

- (BOOL)_cleanupUnusedContentWithContext:(id)a3 nextTasks:(id)a4
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v144 = a4;
  id v7 = [TRINamespaceResolverStorage alloc];
  id v8 = [v6 paths];
  v9 = [(TRINamespaceResolverStorage *)v7 initWithPaths:v8];

  int v186 = 0;
  BOOL v10 = [(TRINamespaceResolverStorage *)v9 removeUnreferencedRolloutDeploymentsWithServerContext:v6 removedCount:&v186];
  if (v10)
  {
    int v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v189 = v186;
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced rollout deployment dirs.", buf, 8u);
    }
  }
  int v186 = 0;
  BOOL v12 = [(TRINamespaceResolverStorage *)v9 removeUnreferencedBMLTDeploymentsWithServerContext:v6 removedCount:&v186];
  v146 = v6;
  if (v12)
  {
    BOOL v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v189 = v186;
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced BMLT deployment metadata dirs.", buf, 8u);
    }
  }
  int v14 = v10 && v12;
  int v186 = 0;
  BOOL v15 = [(TRINamespaceResolverStorage *)v9 removeUnreferencedExperimentDeploymentsWithServerContext:v6 removedCount:&v186];
  if (v15)
  {
    int v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v189 = v186;
      _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced experiment deployment metadata dirs.", buf, 8u);
    }
  }
  int v17 = v14 & v15;
  int v186 = 0;
  BOOL v18 = [(TRINamespaceResolverStorage *)v9 removeUnneededPromotionsWithRemovedCount:&v186 removeAll:0];
  if (v18)
  {
    v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v189 = v186;
      _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "Removed %u unneeded promotion dirs.", buf, 8u);
    }
  }
  int v20 = v17 & v18;

  int v21 = [TRIFactorPackSetStorage alloc];
  v22 = [v6 paths];
  v23 = [(TRIFactorPackSetStorage *)v21 initWithPaths:v22];

  int v186 = 0;
  BOOL v24 = [(TRIFactorPackSetStorage *)v23 removeUnreferencedFactorPackSetsWithServerContext:v6 removedCount:&v186];
  if (v24)
  {
    int v25 = TRILogCategory_Server();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v189 = v186;
      _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced factor pack sets.", buf, 8u);
    }
  }
  int v26 = v20 & v24;

  BOOL v27 = [TRIFactorPackStorage alloc];
  v28 = [v6 paths];
  int v29 = [(TRIFactorPackStorage *)v27 initWithPaths:v28];

  int v186 = 0;
  BOOL v30 = [(TRIFactorPackStorage *)v29 removeUnreferencedFactorPacksWithRemovedCount:&v186];
  if (v30)
  {
    v31 = TRILogCategory_Server();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v189 = v186;
      _os_log_impl(&dword_1DA291000, v31, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced factor packs.", buf, 8u);
    }
  }
  int v32 = v26 & v30;
  if (self->_isFlatbufferWriteEnabled)
  {
    v33 = [TRIFBFactorPackStorage alloc];
    v34 = [v6 paths];
    v35 = [(TRIFBFactorPackStorage *)v33 initWithPaths:v34];

    int v185 = 0;
    int v36 = [(TRIFBFactorPackStorage *)v35 removeUnreferencedFactorLevelsWithRemovedCount:&v185];
    BOOL v37 = TRILogCategory_Server();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v189 = v36;
      *(_WORD *)&v189[4] = 1024;
      *(_DWORD *)&v189[6] = v185;
      _os_log_impl(&dword_1DA291000, v37, OS_LOG_TYPE_DEFAULT, "Removing unreferenced factor levels with flatbuffer storage was %d with removed count as: %u", buf, 0xEu);
    }

    if ((v36 & 1) == 0)
    {
      v38 = TRILogCategory_Server();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v38, OS_LOG_TYPE_ERROR, "Unable to remove unreferenced factor levels from factor levels storage", buf, 2u);
      }
    }
    if (v186 != v185)
    {
      v39 = TRILogCategory_Server();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v189 = v186;
        *(_WORD *)&v189[4] = 1024;
        *(_DWORD *)&v189[6] = v185;
        _os_log_impl(&dword_1DA291000, v39, OS_LOG_TYPE_INFO, "Counts for removed unreferenced factor levels dont match, pb:%d fp:%d", buf, 0xEu);
      }
    }
    if (self->_isFlatbufferReadEnabled) {
      int v40 = v36;
    }
    else {
      int v40 = 1;
    }
    v32 &= v40;
  }
  v41 = [TRINamespaceDescriptorSetStorage alloc];
  v42 = [v6 paths];
  int v43 = [(TRINamespaceDescriptorSetStorage *)v41 initWithPaths:v42];

  int v186 = 0;
  BOOL v44 = [(TRINamespaceDescriptorSetStorage *)v43 removeUnreferencedNamespaceDescriptorSetsWithServerContext:v6 removedCount:&v186];
  if (v44)
  {
    v45 = TRILogCategory_Server();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v189 = v186;
      _os_log_impl(&dword_1DA291000, v45, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced namespace descriptor sets.", buf, 8u);
    }
  }
  int v46 = [TRIClientTreatmentStorage alloc];
  v47 = [v6 paths];
  v48 = [(TRIClientTreatmentStorage *)v46 initWithPaths:v47];

  int v186 = 0;
  BOOL v49 = [(TRIClientTreatmentStorage *)v48 removeUnreferencedTreatmentsWithRemovedCount:&v186];
  if (v49)
  {
    v50 = TRILogCategory_Server();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v189 = v186;
      _os_log_impl(&dword_1DA291000, v50, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced treatments.", buf, 8u);
    }
  }
  if (self->_isFlatbufferTreatmentWriteEnabled)
  {
    v51 = [TRIFBClientTreatmentStorage alloc];
    int v52 = [v6 paths];
    v53 = [(TRIFBClientTreatmentStorage *)v51 initWithPaths:v52];

    int v185 = 0;
    BOOL v54 = [(TRIFBClientTreatmentStorage *)v53 removeUnreferencedTreatmentsWithRemovedCount:&v185];
    if (v54)
    {
      int v55 = TRILogCategory_Server();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v189 = v185;
        _os_log_impl(&dword_1DA291000, v55, OS_LOG_TYPE_DEFAULT, "Removed %u unreferenced treatments from flatbuffers.", buf, 8u);
      }
    }
    if (v186 != v185)
    {
      v56 = TRILogCategory_Server();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v189 = v185;
        *(_WORD *)&v189[4] = 1024;
        *(_DWORD *)&v189[6] = v186;
        _os_log_impl(&dword_1DA291000, v56, OS_LOG_TYPE_INFO, "Counts for removal of unreferenced treatments from flatbuffers:%u and protobuf:%u do not match", buf, 0xEu);
      }
    }
    if (self->_isFlatbufferTreatmentReadEnabled) {
      BOOL v49 = v54;
    }
  }
  v57 = objc_opt_new();
  int v58 = [v6 contentTracker];
  v183[0] = MEMORY[0x1E4F143A8];
  v183[1] = 3221225472;
  v183[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke;
  v183[3] = &unk_1E6BB8BD8;
  id v59 = v57;
  id v184 = v59;
  int v60 = v44 & v49 & [v58 enumerateTrackedItemsWithBlock:v183] & v32;

  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  obuint64_t j = v59;
  uint64_t v150 = [obj countByEnumeratingWithState:&v179 objects:v191 count:16];
  if (v150)
  {
    SEL v143 = a2;
    unint64_t v61 = 0x1E6BB6000uLL;
    uint64_t v62 = *(void *)v180;
    v63 = v146;
    uint64_t v147 = *(void *)v180;
    do
    {
      for (uint64_t i = 0; i != v150; ++i)
      {
        if (*(void *)v180 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v65 = *(void *)(*((void *)&v179 + 1) + 8 * i);
        int v66 = (void *)MEMORY[0x1E016E7F0]();
        id v67 = [*(id *)(v61 + 3744) decodeContentIdentifier:v65];
        v68 = v67;
        int v69 = v60 & (v67 != 0);
        if (v67)
        {
          switch([v67 type])
          {
            case 0u:
              uint64_t v70 = [v68 experiment];
              if (!v70)
              {
                v95 = [MEMORY[0x1E4F28B00] currentHandler];
                [v95 handleFailureInMethod:v143, self, @"TRIMaintenanceTask.m", 554, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];

                v63 = v146;
              }
              BOOL v71 = [v63 experimentDatabase];
              uint64_t v72 = [v71 experimentRecordWithExperimentDeployment:v70];

              if (v72)
              {
                if ([v72 status] != 4 || objc_msgSend(v72, "isExpiredExperiment"))
                {
                  v73 = [v146 contentTracker];
                  [v73 clearRefsWithContentIdentifier:v65];

                  uint64_t v62 = v147;
                  uint64_t v74 = [v146 experimentDatabase];
                  uint64_t v75 = [v74 removeExperimentRecordWithExperimentDeployment:v70];

                  if (!v75) {
                    int v69 = 0;
                  }
                }
                v76 = [v146 limitedCarryManager];
                [v76 removeProfileForExperiment:v70];
              }
              else
              {
                v76 = TRILogCategory_Server();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                {
                  v93 = [v70 experimentId];
                  int v94 = [v70 deploymentId];
                  *(_DWORD *)buf = 138543618;
                  *(void *)v189 = v93;
                  *(_WORD *)&v189[8] = 1024;
                  int v190 = v94;
                  _os_log_error_impl(&dword_1DA291000, v76, OS_LOG_TYPE_ERROR, "Could not find experiment record for experiment deployment with experiment id: %{public}@ & deployment id:  %d", buf, 0x12u);
                }
              }

              v63 = v146;
              break;
            case 1u:
              uint64_t v70 = [v68 treatment];
              if (!v70)
              {
                v97 = [MEMORY[0x1E4F28B00] currentHandler];
                [v97 handleFailureInMethod:v143, self, @"TRIMaintenanceTask.m", 598, @"Invalid parameter not satisfying: %@", @"desc" object file lineNumber description];

                v63 = v146;
              }
              v80 = [v70 container];
              v81 = [v63 paths];
              if (v80)
              {
                v82 = [v70 container];
                uint64_t v83 = [v81 pathsForContainer:v82 asClientProcess:0];

                v81 = (void *)v83;
              }

              if (v81)
              {
                v84 = [v70 treatmentId];
                BOOL v85 = [(TRIMaintenanceTask *)self _cleanupTreatmentWithTreatmentId:v84 paths:v81];

                if (!v85)
                {
                  int v86 = 0;
                  v63 = v146;
                  goto LABEL_99;
                }
              }
              else
              {
                v89 = TRILogCategory_Server();
                if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                {
                  v90 = [v70 container];
                  v91 = [v90 identifier];
                  *(_DWORD *)buf = 138543362;
                  *(void *)v189 = v91;
                  _os_log_impl(&dword_1DA291000, v89, OS_LOG_TYPE_DEFAULT, "Not removing treatment from missing app container: %{public}@", buf, 0xCu);
                }
              }
              v63 = v146;
              v92 = [v146 contentTracker];
              [v92 clearRefsWithContentIdentifier:v65];

              int v86 = 1;
LABEL_99:
              uint64_t v62 = v147;
              v69 &= v86;

              unint64_t v61 = 0x1E6BB6000;
              break;
            case 2u:
              uint64_t v70 = [v68 rollout];
              if (!v70)
              {
                v96 = [MEMORY[0x1E4F28B00] currentHandler];
                [v96 handleFailureInMethod:v143, self, @"TRIMaintenanceTask.m", 618, @"Invalid parameter not satisfying: %@", @"rolloutDeployment" object file lineNumber description];
              }
              v77 = [v63 contentTracker];
              [v77 clearRefsWithContentIdentifier:v65];

              v78 = [v63 rolloutDatabase];
              uint64_t v79 = [v78 removeRecordWithDeployment:v70 usingRefCounting:1];
              goto LABEL_89;
            case 4u:
              uint64_t v70 = [v68 bmlt];
              if (!v70)
              {
                v98 = [MEMORY[0x1E4F28B00] currentHandler];
                [v98 handleFailureInMethod:v143, self, @"TRIMaintenanceTask.m", 637, @"Invalid parameter not satisfying: %@", @"bmltDeployment" object file lineNumber description];
              }
              v87 = [v63 contentTracker];
              [v87 clearRefsWithContentIdentifier:v65];

              v78 = [v63 bmltDatabase];
              uint64_t v79 = [v78 removeRecordWithDeployment:v70];
LABEL_89:
              uint64_t v88 = v79;

              if (!v88) {
                int v69 = 0;
              }
              unint64_t v61 = 0x1E6BB6000;
              uint64_t v62 = v147;
              break;
            default:
              goto LABEL_101;
          }
        }
        else
        {
          uint64_t v70 = [v63 contentTracker];
          [v70 clearRefsWithContentIdentifier:v65];
        }

LABEL_101:
        int v60 = v69 != 0;
      }
      uint64_t v150 = [obj countByEnumeratingWithState:&v179 objects:v191 count:16];
    }
    while (v150);
  }
  else
  {
    v63 = v6;
  }

  v99 = [TRIAssetStoreDatabase alloc];
  v100 = [v63 paths];
  v151 = [(TRIAssetStoreDatabase *)v99 initWithPaths:v100 storageManagement:0];

  id v101 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v177[0] = MEMORY[0x1E4F143A8];
  v177[1] = 3221225472;
  v177[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_73;
  v177[3] = &unk_1E6BB7D18;
  id v102 = v101;
  id v178 = v102;
  [(TRIAssetStoreDatabase *)v151 enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock:v177];
  id v103 = objc_alloc(MEMORY[0x1E4FB00C8]);
  v104 = [v63 paths];
  v105 = (void *)[v103 initWithPaths:v104 factorsState:0];

  id v106 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v107 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v108 = [v63 rolloutDatabase];
  v172[0] = MEMORY[0x1E4F143A8];
  v172[1] = 3221225472;
  v172[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_2;
  v172[3] = &unk_1E6BB8C28;
  id v109 = v105;
  id v173 = v109;
  v110 = v63;
  id v111 = v102;
  id v174 = v111;
  id v175 = v107;
  id v112 = v106;
  id v176 = v112;
  id v113 = v107;
  [v108 enumerateActiveRecordsWithVisibility:1 usingTransaction:0 block:v172];

  id v114 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v115 = [v110 bmltDatabase];
  v167[0] = MEMORY[0x1E4F143A8];
  v167[1] = 3221225472;
  v167[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_79;
  v167[3] = &unk_1E6BB8C50;
  id v168 = v109;
  id v169 = v111;
  id v170 = v114;
  id v171 = v112;
  id v116 = v112;
  id v117 = v114;
  id v148 = v111;
  id v118 = v109;
  [v115 enumerateTaskRecordsWithBlock:v167];

  v119 = [TRIFactorPackSetStorage alloc];
  v120 = [v110 paths];
  v121 = [(TRIFactorPackSetStorage *)v119 initWithPaths:v120];

  v164[0] = MEMORY[0x1E4F143A8];
  v164[1] = 3221225472;
  v164[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_81;
  v164[3] = &unk_1E6BB8C78;
  id v122 = v144;
  id v165 = v122;
  v123 = v121;
  v166 = v123;
  [v113 enumerateObjectsUsingBlock:v164];
  v161[0] = MEMORY[0x1E4F143A8];
  v161[1] = 3221225472;
  v161[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_85;
  v161[3] = &unk_1E6BB8CA0;
  id v124 = v122;
  id v162 = v124;
  v163 = v123;
  v125 = v123;
  [v117 enumerateObjectsUsingBlock:v161];
  v126 = [TRIFactorPackStorage alloc];
  v127 = [v110 paths];
  v128 = [(TRIFactorPackStorage *)v126 initWithPaths:v127];

  v159[0] = MEMORY[0x1E4F143A8];
  v159[1] = 3221225472;
  v159[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_87;
  v159[3] = &unk_1E6BB8670;
  v160 = v128;
  v129 = v128;
  [v116 enumerateKeysAndObjectsUsingBlock:v159];

  v130 = objc_opt_new();
  v131 = [v110 paths];
  [v130 addObject:v131];

  v132 = [v110 namespaceDatabase];
  v156[0] = MEMORY[0x1E4F143A8];
  v156[1] = 3221225472;
  v156[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_89;
  v156[3] = &unk_1E6BB8CC8;
  id v133 = v110;
  id v157 = v133;
  id v134 = v130;
  id v158 = v134;
  int v135 = v60 & [v132 enumerateDynamicNamespaceRecordsWithBlock:v156];

  long long v154 = 0u;
  long long v155 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  id v136 = v134;
  uint64_t v137 = [v136 countByEnumeratingWithState:&v152 objects:v187 count:16];
  if (v137)
  {
    uint64_t v138 = v137;
    uint64_t v139 = *(void *)v153;
    do
    {
      for (uint64_t j = 0; j != v138; ++j)
      {
        if (*(void *)v153 != v139) {
          objc_enumerationMutation(v136);
        }
        v141 = [[TRIAssetStore alloc] initWithPaths:*(void *)(*((void *)&v152 + 1) + 8 * j)];
        v135 &= [(TRIAssetStore *)v141 collectGarbageOlderThanNumScans:2 deletedAssetSize:0];
      }
      uint64_t v138 = [v136 countByEnumeratingWithState:&v152 objects:v187 count:16];
    }
    while (v138);
  }

  return v135;
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 str];
      int v10 = 138543618;
      uint64_t v11 = (uint64_t)v7;
      __int16 v12 = 2048;
      uint64_t v13 = a3;
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: refCount %lld", (uint8_t *)&v10, 0x16u);
    }
    if (a3 <= 0)
    {
      if (a3 < 0)
      {
        notify_post("com.apple.trial.MaintenanceFoundNegativeRefcount");
        id v8 = TRILogCategory_Server();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = [v5 str];
          int v10 = 134218242;
          uint64_t v11 = a3;
          __int16 v12 = 2114;
          uint64_t v13 = (uint64_t)v9;
          _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "refCount went negative (%lld) for content identifier %{public}@", (uint8_t *)&v10, 0x16u);
        }
      }
      [*(id *)(a1 + 32) addObject:v5];
    }
  }
}

uint64_t __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_73(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = a2;
  obuint64_t j = [v18 namespaces];
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 32) factorPackIdForRolloutWithNamespaceName:v7];
        if (v8)
        {
          v9 = *(void **)(a1 + 40);
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_3;
          v20[3] = &unk_1E6BB8C00;
          id v10 = v8;
          id v21 = v10;
          uint64_t v11 = objc_msgSend(v9, "_pas_filteredSetWithTest:", v20);
          uint64_t v12 = [v11 count];

          if (v12)
          {
            uint64_t v13 = TRILogCategory_Server();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              uint64_t v14 = [v18 deployment];
              BOOL v15 = [v14 rolloutId];
              int v16 = [v18 deployment];
              int v17 = [v16 deploymentId];
              *(_DWORD *)buf = 138543618;
              BOOL v27 = v15;
              __int16 v28 = 1024;
              int v29 = v17;
              _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Rollout %{public}@.%d contains maRefs file without DB reference.", buf, 0x12u);
            }
            [*(id *)(a1 + 48) addObject:v18];
            [*(id *)(a1 + 56) setValue:v10 forKey:v7];

            goto LABEL_15;
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

uint64_t __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 containsString:*(void *)(a1 + 32)];
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 artifact];
  uint64_t v5 = [v4 backgroundTask];
  int v6 = [v5 hasSelectedNamespace];

  if (v6)
  {
    uint64_t v7 = [v3 artifact];
    id v8 = [v7 backgroundTask];
    v9 = [v8 selectedNamespace];

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v9 name];
    uint64_t v12 = [v10 factorPackIdForBmltWithNamespaceName:v11];

    if (v12)
    {
      uint64_t v13 = *(void **)(a1 + 40);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_2_80;
      v23[3] = &unk_1E6BB8C00;
      id v14 = v12;
      id v24 = v14;
      BOOL v15 = objc_msgSend(v13, "_pas_filteredSetWithTest:", v23);
      if ([v15 count])
      {
        int v16 = TRILogCategory_Server();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v19 = [v3 bmltDeployment];
          int v20 = [v19 backgroundMLTaskId];
          id v21 = [v3 bmltDeployment];
          int v22 = [v21 deploymentId];
          *(_DWORD *)buf = 138543618;
          int v26 = v20;
          __int16 v27 = 1024;
          int v28 = v22;
          _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "BMLT %{public}@.%d contains maRefs file without DB reference.", buf, 0x12u);
        }
        [*(id *)(a1 + 48) addObject:v3];
        int v17 = *(void **)(a1 + 56);
        id v18 = [v9 name];
        [v17 setValue:v14 forKey:v18];
      }
    }
  }
}

uint64_t __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_2_80(uint64_t a1, void *a2)
{
  return [a2 containsString:*(void *)(a1 + 32)];
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_81(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 deployment];
  int v6 = [v5 rolloutId];
  uint64_t v7 = +[TRIDisenrollRolloutTask taskWithRolloutId:v6 triggerEvent:3];
  [v4 addObject:v7];

  id v8 = [v3 activeFactorPackSetId];

  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    id v10 = [v3 activeFactorPackSetId];
    uint64_t v11 = [v9 pathForFactorPackSetWithId:v10];

    uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v17 = 0;
    char v13 = [v12 removeItemAtPath:v11 error:&v17];
    id v14 = v17;

    if ((v13 & 1) == 0)
    {
      BOOL v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = [v3 activeFactorPackSetId];
        *(_DWORD *)buf = 138543874;
        v19 = v16;
        __int16 v20 = 2114;
        id v21 = v11;
        __int16 v22 = 2114;
        id v23 = v14;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Unable to cleanup factor pack set %{public}@ at %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_85(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 bmltDeployment];
  int v6 = +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:v5 triggerEvent:3];
  [v4 addObject:v6];

  uint64_t v7 = [v3 activeFactorPackSetId];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    v9 = [v3 activeFactorPackSetId];
    id v10 = [v8 pathForFactorPackSetWithId:v9];

    uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v16 = 0;
    char v12 = [v11 removeItemAtPath:v10 error:&v16];
    id v13 = v16;

    if ((v12 & 1) == 0)
    {
      id v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        BOOL v15 = [v3 activeFactorPackSetId];
        *(_DWORD *)buf = 138543874;
        id v18 = v15;
        __int16 v19 = 2114;
        __int16 v20 = v10;
        __int16 v21 = 2114;
        id v22 = v13;
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Unable to cleanup factor pack set %{public}@ at %{public}@: %{public}@", buf, 0x20u);
      }
    }
  }
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TRIValidateFactorPackId();
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) pathForFactorPackWithId:v4 namespaceName:v3];
    uint64_t v6 = [*(id *)(a1 + 32) legacyPathForFactorPackWithId:v4 namespaceName:v3];
    uint64_t v7 = (void *)v6;
    if (v5)
    {
      id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v16 = 0;
      char v9 = [v8 removeItemAtPath:v5 error:&v16];
      id v10 = v16;

      if ((v9 & 1) == 0)
      {
        uint64_t v11 = TRILogCategory_Server();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v18 = v4;
          __int16 v19 = 2114;
          __int16 v20 = v5;
          __int16 v21 = 2114;
          id v22 = v10;
          _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Unable to cleanup factor pack %{public}@ at %{public}@: %{public}@", buf, 0x20u);
        }
      }
      if (!v7) {
        goto LABEL_14;
      }
    }
    else
    {
      id v10 = 0;
      if (!v6)
      {
LABEL_14:

        goto LABEL_15;
      }
    }

    char v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v15 = 0;
    char v13 = [v12 removeItemAtPath:v7 error:&v15];
    id v10 = v15;

    if ((v13 & 1) == 0)
    {
      id v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v18 = v4;
        __int16 v19 = 2114;
        __int16 v20 = v7;
        __int16 v21 = 2114;
        id v22 = v10;
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Unable to cleanup legacy factor pack %{public}@ at %{public}@: %{public}@", buf, 0x20u);
      }
    }
    goto LABEL_14;
  }
LABEL_15:
}

void __65__TRIMaintenanceTask__cleanupUnusedContentWithContext_nextTasks___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) paths];
  uint64_t v5 = [v3 appContainer];
  uint64_t v6 = [v4 pathsForContainer:v5 asClientProcess:0];

  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v3 appContainer];
      char v9 = [v8 identifier];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Not GC'ing AssetStore in missing app container: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_handleOrphanedNamespacesWithNamespaceDatabase:(id)a3 nextTasks:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __79__TRIMaintenanceTask__handleOrphanedNamespacesWithNamespaceDatabase_nextTasks___block_invoke;
  v29[3] = &unk_1E6BB8CF0;
  id v6 = v5;
  id v30 = v6;
  [v4 enumerateDynamicNamespaceRecordsWithBlock:v29];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        char v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v14 = [v13 name];
        uint64_t v15 = [v4 removeDynamicNamespaceRecordWithNamespaceName:v14];

        id v16 = TRILogCategory_Server();
        id v17 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v13 name];
            __int16 v19 = [v13 appContainer];
            __int16 v20 = [v19 identifier];
            *(_DWORD *)buf = 138543618;
            int v32 = v18;
            __int16 v33 = 2114;
            v34 = v20;
            _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "removed dynamic namespace %{public}@ registered to app container %{public}@", buf, 0x16u);
          }
          ++v10;
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            __int16 v21 = [v13 name];
            *(_DWORD *)buf = 138543362;
            int v32 = v21;
            _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Unable to deregister namespace %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v9);
  }
  else
  {
    int v10 = 0;
  }

  id v22 = TRILogCategory_Server();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [(TRIBaseTask *)self taskName];
    *(_DWORD *)buf = 138543618;
    int v32 = v23;
    __int16 v33 = 1024;
    LODWORD(v34) = v10;
    _os_log_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ deregistered %u dynamic namespaces", buf, 0x12u);
  }
}

void __79__TRIMaintenanceTask__handleOrphanedNamespacesWithNamespaceDatabase_nextTasks___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 appContainer];
  id v4 = v3;
  if (v3 && [v3 fetchStatus] == 2) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (BOOL)_cleanupLocalTempStorageWithPaths:(id)a3
{
  id v3 = [a3 localTempDir];
  BOOL v4 = +[TRITempDirScopeGuard ifUnreferencedCleanupPath:v3];

  return v4;
}

- (void)_synchronizePushService:(id)a3 usingRolloutDatabase:(id)a4 experimentDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke;
  v25[3] = &unk_1E6BB8D18;
  id v12 = v11;
  id v26 = v12;
  [v10 enumerateActiveRecordsWithVisibility:1 usingTransaction:0 block:v25];

  char v13 = objc_opt_new();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke_2;
  v23[3] = &unk_1E6BB8D40;
  id v14 = v13;
  id v24 = v14;
  [v9 enumerateActiveExperimentRecordsWithVisibility:1 block:v23];

  channelCleanupQueue = self->_channelCleanupQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke_3;
  block[3] = &unk_1E6BB8D68;
  id v20 = v8;
  id v21 = v12;
  id v22 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v8;
  dispatch_async(channelCleanupQueue, block);
}

void __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 deployment];
  [v2 addObject:v3];
}

void __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 experimentDeployment];
  id v3 = [v4 experimentId];
  [v2 addObject:v3];
}

uint64_t __86__TRIMaintenanceTask__synchronizePushService_usingRolloutDatabase_experimentDatabase___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) ensureSubscriptionsExistOnlyForRolloutDeployments:*(void *)(a1 + 40) experimentIds:*(void *)(a1 + 48) maxChannelsAllowed:75];
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__TRIMaintenanceTask_addMetric___block_invoke;
  v7[3] = &unk_1E6BB8D90;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __32__TRIMaintenanceTask_addMetric___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[1];
  if (!v3)
  {
    id v5 = a2;
    uint64_t v6 = objc_opt_new();
    id v7 = (void *)a2[1];
    a2[1] = v6;

    id v3 = (void *)a2[1];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  return [v3 addObject:v8];
}

- (void)addDimension:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__TRIMaintenanceTask_addDimension___block_invoke;
  v7[3] = &unk_1E6BB8D90;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __35__TRIMaintenanceTask_addDimension___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[2];
  if (!v3)
  {
    id v5 = a2;
    uint64_t v6 = objc_opt_new();
    id v7 = (void *)a2[2];
    a2[2] = v6;

    id v3 = (void *)a2[2];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  return [v3 addObject:v8];
}

- (void)mergeTelemetry:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__TRIMaintenanceTask_mergeTelemetry___block_invoke;
  v7[3] = &unk_1E6BB8D90;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __37__TRIMaintenanceTask_mergeTelemetry___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = (void *)v6[3];
  if (v3)
  {
    [v3 mergeFrom:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) copy];
    id v5 = (void *)v6[3];
    v6[3] = v4;
  }
}

- (id)metrics
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__TRIMaintenanceTask_metrics__block_invoke;
  v5[3] = &unk_1E6BB8DB8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void *__29__TRIMaintenanceTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a2 + 8);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [result copy];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)dimensions
{
  id v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  uint64_t v4 = objc_opt_new();
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__TRIMaintenanceTask_dimensions__block_invoke;
  v8[3] = &unk_1E6BB8D90;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];

  return v6;
}

uint64_t __32__TRIMaintenanceTask_dimensions__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 16)) {
    return objc_msgSend(*(id *)(result + 32), "addObjectsFromArray:");
  }
  return result;
}

- (id)trialSystemTelemetry
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = objc_alloc_init(MEMORY[0x1E4FB0648]);
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__TRIMaintenanceTask_trialSystemTelemetry__block_invoke;
  v6[3] = &unk_1E6BB8DB8;
  v6[4] = &v7;
  [(_PASLock *)lock runWithLockAcquired:v6];
  uint64_t v4 = (void *)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __42__TRIMaintenanceTask_trialSystemTelemetry__block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 24)) {
    return objc_msgSend(*(id *)(*(void *)(*(void *)(result + 32) + 8) + 40), "mergeFrom:");
  }
  return result;
}

- (id)_asPersistedTask
{
  v2 = objc_opt_new();
  return v2;
}

- (id)serialize
{
  uint64_t v4 = [(TRIMaintenanceTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIMaintenanceTask.m", 922, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v3 = +[TRIPBMessage parseFromData:a3 error:&v9];
  id v4 = v9;
  if (v3)
  {
    id v5 = objc_opt_new();
    if ([v3 hasRetryCount]) {
      uint64_t v6 = [v3 retryCount];
    }
    else {
      uint64_t v6 = 0;
    }
    [v5 setRetryCount:v6];
  }
  else
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v4;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIMaintenancePersistedTask: %{public}@", buf, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIMaintenanceTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIMaintenanceTask;
  id v5 = [(TRIMaintenanceTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
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
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIMaintenanceTask.m", 941, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIMaintenanceTask *)self serialize];
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
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_channelCleanupQueue, 0);
}

@end