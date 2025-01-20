@interface TRIFetchExperimentTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithExperimentDeployment:(id)a3 taskAttributing:(id)a4;
- (BOOL)wasDeferred;
- (NSString)description;
- (TRIFetchExperimentTask)initWithCoder:(id)a3;
- (TRIFetchExperimentTask)initWithExperimentDeployment:(id)a3 taskAttributing:(id)a4;
- (id)_asPersistedTask;
- (id)_nextTasksForRunStatus:(int)a3;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)retryCount;
- (int)taskType;
- (unint64_t)requiredCapabilities;
- (void)encodeWithCoder:(id)a3;
- (void)runDequeueHandlerUsingContext:(id)a3;
- (void)runEnqueueHandlerUsingContext:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRIFetchExperimentTask

- (int)taskType
{
  return 4;
}

+ (id)taskWithExperimentDeployment:(id)a3 taskAttributing:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[TRIFetchExperimentTask alloc] initWithExperimentDeployment:v6 taskAttributing:v5];

  return v7;
}

- (TRIFetchExperimentTask)initWithExperimentDeployment:(id)a3 taskAttributing:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIFetchExperimentTask.m", 62, @"Invalid parameter not satisfying: %@", @"experimentDeployment" object file lineNumber description];
  }
  if ([v7 hasDeploymentId])
  {
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIFetchExperimentTask.m", 63, @"Invalid parameter not satisfying: %@", @"experimentDeployment.hasDeploymentId" object file lineNumber description];

    if (v8) {
      goto LABEL_5;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"TRIFetchExperimentTask.m", 64, @"Invalid parameter not satisfying: %@", @"taskAttributing" object file lineNumber description];

LABEL_5:
  v16.receiver = self;
  v16.super_class = (Class)TRIFetchExperimentTask;
  v9 = [(TRIExperimentBaseTask *)&v16 initWithExperiment:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_taskAttributing, a4);
    trialSystemTelemetry = v10->_trialSystemTelemetry;
    v10->_trialSystemTelemetry = 0;
  }
  return v10;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  id v4 = a3;
  id v5 = [(TRIExperimentBaseTask *)self experiment];
  id v7 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v5];

  id v6 = [v4 contentTracker];

  [v6 addRefWithContentIdentifier:v7];
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TRIExperimentBaseTask *)self experiment];
  id v6 = +[TRIContentTracker contentIdentifierForExperimentArtifactWithDeployment:v5];

  id v7 = [v4 contentTracker];

  LOBYTE(v4) = [v7 dropRefWithContentIdentifier:v6];
  if ((v4 & 1) == 0)
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(TRIExperimentBaseTask *)self experiment];
      v10 = [v9 shortDesc];
      int v11 = 138543362;
      v12 = v10;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for experiment %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)_nextTasksForRunStatus:(int)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    id v4 = [(TRIExperimentBaseTask *)self experiment];
    id v5 = [v4 experimentId];
    id v6 = [(TRIExperimentBaseTask *)self experiment];
    id v7 = +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v5, [v6 deploymentId], 0, 3, self->_taskAttributing);
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v55 = a4;
  if (!+[TRIUserAdjustableSettings getExperimentOptOut:v6])
  {
    v9 = self;
    objc_sync_enter(v9);
    v49 = (void *)os_transaction_create();
    v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = objc_opt_class();
      v42 = [(TRIExperimentBaseTask *)v9 experiment];
      v43 = [v42 shortDesc];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v41;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v43;
      _os_log_debug_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEBUG, "starting %@ with experiment %{public}@", buf, 0x16u);
    }
    int v11 = [v6 experimentDatabase];
    v12 = [(TRIExperimentBaseTask *)v9 experiment];
    uint64_t v13 = [v11 experimentRecordWithExperimentDeployment:v12];

    if (v13)
    {
      if ([v13 type] == 3) {
        [(TRIExperimentBaseTask *)v9 logAsRollout:1];
      }
      v52 = [v13 artifact];
    }
    else
    {
      v52 = 0;
    }
    v14 = [v6 keyValueStore];
    v54 = +[TRIFetchDateManager managerWithKeyValueStore:v14];

    v15 = [v6 namespaceDatabase];
    objc_super v16 = [v6 paths];
    v17 = [v16 namespaceDescriptorsDefaultDir];
    v53 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v15 defaultDescriptorDirectoryPath:v17];

    uint64_t v18 = [(TRITaskAttributing *)v9->_taskAttributing triCloudKitContainer];
    v19 = [(TRITaskAttributing *)v9->_taskAttributing teamIdentifier];
    v20 = [(TRITaskAttributing *)v9->_taskAttributing applicationBundleIdentifier];
    v51 = +[TRICKNativeArtifactProvider providerForContainer:v18 teamId:v19 bundleId:v20 dateProvider:v54 namespaceDescriptorProvider:v53 serverContext:v6];

    v21 = [(TRITaskAttributing *)v9->_taskAttributing networkOptions];
    if ([v21 allowsCellularAccess])
    {
      v22 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"allows_cellular_download", objc_msgSend(v21, "allowsCellularAccess"));
      [(TRIExperimentBaseTask *)v9 addMetric:v22];
    }
    if ([v21 discretionaryBehavior])
    {
      v23 = [(TRIBaseTask *)v9 stateProvider];
      v24 = objc_msgSend(v23, "activeActivityGrantingCapability:", objc_msgSend(v21, "requiredCapability"));

      if (!v24)
      {
        v39 = TRILogCategory_Server();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA291000, v39, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
        }

        id v8 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
        goto LABEL_35;
      }
      [v21 setActivity:v24];
    }
    v50 = [[TRIFetchOptions alloc] initWithDownloadOptions:v21 cacheDeleteAvailableSpaceClass:&unk_1F347BB28];
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    uint64_t v81 = 0;
    v82 = &v81;
    uint64_t v83 = 0x2020000000;
    int v84 = 2;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v93 = __Block_byref_object_copy__45;
    v94 = __Block_byref_object_dispose__45;
    id v95 = 0;
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__45;
    v79 = __Block_byref_object_dispose__45;
    id v80 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__45;
    v73 = __Block_byref_object_dispose__45;
    id v74 = 0;
    v26 = [(TRIExperimentBaseTask *)v9 experiment];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __56__TRIFetchExperimentTask_runUsingContext_withTaskQueue___block_invoke;
    v60[3] = &unk_1E6BBD968;
    v65 = &v81;
    v66 = buf;
    v67 = &v75;
    v68 = &v69;
    id v61 = v52;
    v62 = v9;
    id v63 = v6;
    v27 = v25;
    v64 = v27;
    [v51 fetchExperimentWithExperimentDeployment:v26 options:v50 completion:v60];

    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    v28 = TRILogCategory_Server();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v44 = objc_opt_class();
      v45 = [(TRIExperimentBaseTask *)v9 experiment];
      v46 = [v45 shortDesc];
      uint64_t v47 = *((int *)v82 + 6);
      if (v47 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *((int *)v82 + 6), v49);
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = off_1E6BBD988[v47];
      }
      *(_DWORD *)v86 = 138412802;
      uint64_t v87 = v44;
      __int16 v88 = 2114;
      v89 = v46;
      __int16 v90 = 2114;
      v91 = v48;
      _os_log_debug_impl(&dword_1DA291000, v28, OS_LOG_TYPE_DEBUG, "finished %@ with experiment %{public}@ - %{public}@", v86, 0x20u);
    }
    trialSystemTelemetry = v9->_trialSystemTelemetry;
    if (!trialSystemTelemetry)
    {
      uint64_t v30 = objc_opt_new();
      v31 = v9->_trialSystemTelemetry;
      v9->_trialSystemTelemetry = (TRITrialSystemTelemetry *)v30;

      trialSystemTelemetry = v9->_trialSystemTelemetry;
    }
    [(TRITrialSystemTelemetry *)trialSystemTelemetry setClientDeploymentEnv:v70[5]];
    if (v76[5])
    {
      v9->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      v32 = TRIFetchErrorParseToMetrics((void *)v76[5]);
      if ([v32 count])
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v85 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v57 != v35) {
                objc_enumerationMutation(v33);
              }
              [(TRIExperimentBaseTask *)v9 addMetric:*(void *)(*((void *)&v56 + 1) + 8 * i)];
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v85 count:16];
          }
          while (v34);
        }
      }
    }
    uint64_t v37 = *((unsigned int *)v82 + 6);
    v38 = [(TRIFetchExperimentTask *)v9 _nextTasksForRunStatus:v37];
    id v8 = +[TRITaskRunResult resultWithRunStatus:v37 reportResultToServer:0 nextTasks:v38 earliestRetryDate:0];

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v75, 8);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v81, 8);

LABEL_35:
    objc_sync_exit(v9);

    goto LABEL_36;
  }
  id v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Skipping TRIFetchExperimentTask due to user opt-out of experiments", buf, 2u);
  }

  id v8 = +[TRITaskRunResult resultWithRunStatus:4 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
LABEL_36:

  return v8;
}

void __56__TRIFetchExperimentTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2 != 4)
  {
    uint64_t v34 = TRILogCategory_Server();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v68 = v11;
      _os_log_impl(&dword_1DA291000, v34, OS_LOG_TYPE_DEFAULT, "error: %{public}@", buf, 0xCu);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a4);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a5);
    goto LABEL_34;
  }
  if (!v9)
  {
    if (*(void *)(a1 + 32))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
      uint64_t v35 = TRIDeploymentEnvironment_EnumDescriptor();
      uint64_t v36 = objc_msgSend(v35, "textFormatNameForValue:", objc_msgSend(*(id *)(a1 + 32), "deploymentEnvironment"));
      uint64_t v37 = *(void *)(*(void *)(a1 + 88) + 8);
      v38 = *(void **)(v37 + 40);
      *(void *)(v37 + 40) = v36;

      if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
      {
        uint64_t v39 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", (int)objc_msgSend(*(id *)(a1 + 32), "deploymentEnvironment"));
        uint64_t v40 = *(void *)(*(void *)(a1 + 88) + 8);
        uint64_t v41 = *(void **)(v40 + 40);
        *(void *)(v40 + 40) = v39;
      }
      goto LABEL_34;
    }
    v42 = TRILogCategory_Server();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [*(id *)(a1 + 40) experiment];
      uint64_t v44 = [v43 shortDesc];
      *(_DWORD *)buf = 138543362;
      id v68 = v44;
      _os_log_impl(&dword_1DA291000, v42, OS_LOG_TYPE_DEFAULT, "no experiment artifact received for %{public}@", buf, 0xCu);
      goto LABEL_30;
    }
    goto LABEL_33;
  }
  v12 = TRIDeploymentEnvironment_EnumDescriptor();
  uint64_t v13 = objc_msgSend(v12, "textFormatNameForValue:", objc_msgSend(v9, "deploymentEnvironment"));
  uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    uint64_t v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", (int)objc_msgSend(v9, "deploymentEnvironment"));
    uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
  v19 = [v9 experimentId];

  if (!v19)
  {
    v42 = TRILogCategory_Server();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = [*(id *)(a1 + 40) experiment];
      uint64_t v44 = [v43 shortDesc];
      *(_DWORD *)buf = 138543362;
      id v68 = v44;
      v45 = "artifact experiment id is nil in result for %{public}@";
      v46 = v42;
      uint32_t v47 = 12;
LABEL_27:
      _os_log_error_impl(&dword_1DA291000, v46, OS_LOG_TYPE_ERROR, v45, buf, v47);
LABEL_30:
    }
LABEL_33:

    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 3;
    goto LABEL_34;
  }
  v20 = [*(id *)(a1 + 40) experiment];
  v21 = [v9 experimentDeployment];
  char v22 = [v20 isEqualToDeployment:v21];

  if ((v22 & 1) == 0)
  {
    v42 = TRILogCategory_Server();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = [*(id *)(a1 + 40) experiment];
      uint64_t v44 = [v9 experimentDeployment];
      *(_DWORD *)buf = 138543618;
      id v68 = v43;
      __int16 v69 = 2114;
      v70 = v44;
      v45 = "mismatch in experiment deployment: %{public}@ != %{public}@";
      v46 = v42;
      uint32_t v47 = 22;
      goto LABEL_27;
    }
    goto LABEL_33;
  }
  v23 = [*(id *)(a1 + 48) experimentDatabase];
  char v24 = [v9 hasNamespacesAvailableForExperimentWithDatabase:v23];

  if ((v24 & 1) == 0)
  {
    v42 = TRILogCategory_Server();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v55 = [v9 experimentDeployment];
      long long v56 = [v55 shortDesc];
      long long v57 = TRICloudKitSupport_NotificationType_EnumDescriptor();
      long long v58 = objc_msgSend(v57, "textFormatNameForValue:", objc_msgSend(v9, "experimentType"));
      *(_DWORD *)buf = 138543618;
      id v68 = v56;
      __int16 v69 = 2112;
      v70 = v58;
      _os_log_error_impl(&dword_1DA291000, v42, OS_LOG_TYPE_ERROR, "No namespace available for deployment %{public}@ of type %@", buf, 0x16u);
    }
    goto LABEL_33;
  }
  dispatch_semaphore_t v25 = [*(id *)(a1 + 48) namespaceDatabase];
  v26 = [[TRIUserCovariates alloc] initWithContext:*(void *)(a1 + 48)];
  [v9 namespaces];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [v27 countByEnumeratingWithState:&v62 objects:v66 count:16];
  v29 = v27;
  if (v28)
  {
    uint64_t v30 = v28;
    id v61 = v26;
    uint64_t v31 = *(void *)v63;
LABEL_10:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v63 != v31) {
        objc_enumerationMutation(v27);
      }
      id v33 = [v25 dynamicNamespaceRecordWithNamespaceName:*(void *)(*((void *)&v62 + 1) + 8 * v32)];

      if (v33) {
        break;
      }
      if (v30 == ++v32)
      {
        uint64_t v30 = [v27 countByEnumeratingWithState:&v62 objects:v66 count:16];
        if (v30) {
          goto LABEL_10;
        }
        v29 = v27;
        v26 = v61;
        goto LABEL_37;
      }
    }
    v29 = [*(id *)(*(void *)(a1 + 40) + 40) applicationBundleIdentifier];

    v26 = v61;
    if (!v29) {
      goto LABEL_38;
    }
    v48 = [MEMORY[0x1E4FB0650] dimensionWithName:@"client_app_bundle_id" value:v29];
    [*(id *)(a1 + 40) addDimension:v48];
    v49 = [(TRIUserCovariates *)v61 tri_shortVersionStringForBundleId:v29];
    v50 = [MEMORY[0x1E4FB0650] dimensionWithName:@"client_app_version" value:v49];
    [*(id *)(a1 + 40) addDimension:v50];

    v26 = v61;
  }
LABEL_37:

LABEL_38:
  v51 = [*(id *)(a1 + 48) experimentDatabase];
  v52 = [*(id *)(a1 + 48) paths];
  char v53 = [v9 saveWithDatabase:v51 paths:v52];

  if ((v53 & 1) == 0)
  {
    v54 = TRILogCategory_Server();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      long long v59 = [*(id *)(a1 + 40) experiment];
      v60 = [v59 shortDesc];
      *(_DWORD *)buf = 138543362;
      id v68 = v60;
      _os_log_error_impl(&dword_1DA291000, v54, OS_LOG_TYPE_ERROR, "could not save experiment %{public}@", buf, 0xCu);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }

LABEL_34:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (id)_asPersistedTask
{
  v3 = objc_opt_new();
  id v4 = [(TRIExperimentBaseTask *)self experiment];
  id v5 = [v4 experimentId];
  [v3 setExperimentId:v5];

  id v6 = [(TRIExperimentBaseTask *)self experiment];
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  id v7 = [(TRITaskAttributing *)self->_taskAttributing asPersistedTaskAttribution];
  [v3 setTaskAttribution:v7];

  objc_msgSend(v3, "setRetryCount:", -[TRIFetchExperimentTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  id v4 = [(TRIFetchExperimentTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIFetchExperimentTask.m", 270, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v27 = 0;
  v3 = +[TRIPBMessage parseFromData:a3 error:&v27];
  id v4 = v27;
  if (!v3)
  {
    id v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_25:
      v12 = 0;
      goto LABEL_26;
    }
    *(_DWORD *)buf = 138543362;
    id v29 = v4;
    uint64_t v14 = "Unable to parse buffer as TRIFetchExperimentPersistedTask: %{public}@";
    v15 = v8;
    uint32_t v16 = 12;
LABEL_12:
    _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_25;
  }
  if (([v3 hasExperimentId] & 1) == 0)
  {
    uint64_t v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      char v24 = (objc_class *)objc_opt_class();
      dispatch_semaphore_t v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138412290;
      id v29 = v25;
      _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: experimentId", buf, 0xCu);
    }
    id v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    uint64_t v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412290;
    id v29 = v19;
    v20 = "Cannot decode message of type %@ with missing field: experimentId";
    goto LABEL_23;
  }
  id v5 = [v3 experimentId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    id v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    v21 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138412290;
    id v29 = v19;
    v20 = "Cannot decode message of type %@ with field of length 0: experimentId";
LABEL_23:
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

    goto LABEL_25;
  }
  if (([v3 hasDeploymentId] & 1) == 0)
  {
    id v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    char v22 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138412290;
    id v29 = v19;
    v20 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_23;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    id v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    v23 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138412290;
    id v29 = v19;
    v20 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_23;
  }
  if ([v3 deploymentId] == -1)
  {
    id v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = "TRIFetchExperimentPersistedTask encodes unspecified deploymentId.";
    v15 = v8;
    uint32_t v16 = 2;
    goto LABEL_12;
  }
  id v7 = [v3 taskAttribution];
  id v8 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v7];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4FB00F8]);
    id v10 = [v3 experimentId];
    id v11 = objc_msgSend(v9, "initWithExperimentId:deploymentId:", v10, objc_msgSend(v3, "deploymentId"));

    v12 = [(id)objc_opt_class() taskWithExperimentDeployment:v11 taskAttributing:v8];
    if ([v3 hasRetryCount]) {
      uint64_t v13 = [v3 retryCount];
    }
    else {
      uint64_t v13 = 0;
    }
    [v12 setRetryCount:v13];
  }
  else
  {
    id v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    v12 = 0;
  }

LABEL_26:
  return v12;
}

- (unint64_t)requiredCapabilities
{
  v3 = [(TRITaskAttributing *)self->_taskAttributing networkOptions];
  unint64_t v4 = [v3 requiredCapability];

  if ([(TRIFetchExperimentTask *)self retryCount]) {
    return v4 | 4;
  }
  else {
    return v4;
  }
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TRIExperimentBaseTask *)self experiment];
  uint64_t v6 = [v5 shortDesc];
  id v7 = [v3 stringWithFormat:@"<%@:%@,r:%d>", v4, v6, -[TRIFetchExperimentTask retryCount](self, "retryCount")];

  return (NSString *)v7;
}

- (id)metrics
{
  v4.receiver = self;
  v4.super_class = (Class)TRIFetchExperimentTask;
  v2 = [(TRIExperimentBaseTask *)&v4 metrics];
  return v2;
}

- (id)dimensions
{
  v4.receiver = self;
  v4.super_class = (Class)TRIFetchExperimentTask;
  v2 = [(TRIExperimentBaseTask *)&v4 dimensions];
  return v2;
}

- (id)trialSystemTelemetry
{
  v7.receiver = self;
  v7.super_class = (Class)TRIFetchExperimentTask;
  v3 = [(TRIExperimentBaseTask *)&v7 trialSystemTelemetry];
  if (!v3) {
    v3 = objc_opt_new();
  }
  objc_super v4 = [(TRITaskAttributing *)self->_taskAttributing teamIdentifier];
  [v3 setClientTeamId:v4];

  if (self->_trialSystemTelemetry) {
    objc_msgSend(v3, "mergeFrom:");
  }
  if (([v3 hasContainerOriginFields] & 1) == 0)
  {
    id v5 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:self->_taskAttributing];
    [v3 mergeFrom:v5];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchExperimentTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchExperimentTask;
  id v5 = [(TRIFetchExperimentTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRIFetchExperimentTask.m", 349, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIFetchExperimentTask *)self serialize];
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
  objc_storeStrong((id *)&self->_trialSystemTelemetry, 0);
  objc_storeStrong((id *)&self->_taskAttributing, 0);
}

@end