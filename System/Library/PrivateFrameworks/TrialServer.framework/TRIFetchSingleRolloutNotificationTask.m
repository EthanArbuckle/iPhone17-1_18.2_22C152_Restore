@interface TRIFetchSingleRolloutNotificationTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithDeployment:(id)a3 taskAttributing:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasDeferred;
- (NSArray)tags;
- (NSString)description;
- (TRIFetchSingleRolloutNotificationTask)initWithCoder:(id)a3;
- (TRIFetchSingleRolloutNotificationTask)initWithDeployment:(id)a3 taskAttributing:(id)a4;
- (id)_asPersistedTask;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)retryCount;
- (int)taskType;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)encodeWithCoder:(id)a3;
- (void)runDequeueHandlerUsingContext:(id)a3;
- (void)runEnqueueHandlerUsingContext:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRIFetchSingleRolloutNotificationTask

- (int)taskType
{
  return 19;
}

- (NSArray)tags
{
  v3 = [(TRIRolloutTaskSupport *)self->_support tags];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v5 = (void *)[v3 mutableCopy];

  +[TRITaskUtils addAttribution:self->_taskAttributing toTaskTags:v5];
  return (NSArray *)v5;
}

- (TRIFetchSingleRolloutNotificationTask)initWithDeployment:(id)a3 taskAttributing:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIFetchSingleRolloutNotificationTask.m", 65, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIFetchSingleRolloutNotificationTask.m", 66, @"Invalid parameter not satisfying: %@", @"taskAttributing" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)TRIFetchSingleRolloutNotificationTask;
  v11 = [(TRIFetchSingleRolloutNotificationTask *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_deployment, a3);
    objc_storeStrong((id *)&v12->_taskAttributing, a4);
    v13 = [[TRIRolloutTaskSupport alloc] initWithRolloutDeployment:v8];
    support = v12->_support;
    v12->_support = v13;

    v15 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v10];
    [(TRIRolloutTaskSupport *)v12->_support mergeTelemetry:v15];
  }
  return v12;
}

+ (id)taskWithDeployment:(id)a3 taskAttributing:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithDeployment:v7 taskAttributing:v6];

  return v8;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  deployment = self->_deployment;
  id v4 = a3;
  id v6 = +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:deployment];
  v5 = [v4 contentTracker];

  [v5 addRefWithContentIdentifier:v6];
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  deployment = self->_deployment;
  id v5 = a3;
  id v6 = +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:deployment];
  id v7 = [v5 contentTracker];

  LOBYTE(v5) = [v7 dropRefWithContentIdentifier:v6];
  if ((v5 & 1) == 0)
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(TRIRolloutDeployment *)self->_deployment shortDesc];
      int v10 = 138543362;
      v11 = v9;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for rollout %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = os_transaction_create();
  int v10 = TRILogCategory_Server();
  v60 = v7;
  v61 = (void *)v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v52 = (id)objc_opt_class();
    v53 = [(TRIRolloutDeployment *)v8->_deployment shortDesc];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v52;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v53;
    _os_log_debug_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEBUG, "starting %{public}@ with rollout %{public}@", buf, 0x16u);
  }
  v11 = [v6 rolloutDatabase];
  uint64_t v12 = [v11 recordWithDeployment:v8->_deployment usingTransaction:0];

  if (!v12)
  {
    v17 = [v6 keyValueStore];
    v18 = +[TRIFetchDateManager managerWithKeyValueStore:v17];

    objc_super v19 = [v6 namespaceDatabase];
    v20 = [v6 paths];
    v21 = [v20 namespaceDescriptorsDefaultDir];
    v22 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v19 defaultDescriptorDirectoryPath:v21];

    uint64_t v23 = [(TRITaskAttributing *)v8->_taskAttributing triCloudKitContainer];
    v24 = [(TRITaskAttributing *)v8->_taskAttributing teamIdentifier];
    v25 = [(TRITaskAttributing *)v8->_taskAttributing applicationBundleIdentifier];
    uint64_t v12 = +[TRICKNativeArtifactProvider providerForContainer:v23 teamId:v24 bundleId:v25 dateProvider:v18 namespaceDescriptorProvider:v22 serverContext:v6];

    v26 = [(TRITaskAttributing *)v8->_taskAttributing networkOptions];
    if ([v26 allowsCellularAccess])
    {
      support = v8->_support;
      v28 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"allows_cellular_download", objc_msgSend(v26, "allowsCellularAccess"));
      [(TRIRolloutTaskSupport *)support addMetric:v28];
    }
    if ([v26 discretionaryBehavior])
    {
      v29 = [(TRIBaseTask *)v8 stateProvider];
      v30 = objc_msgSend(v29, "activeActivityGrantingCapability:", objc_msgSend(v26, "requiredCapability"));

      if (!v30)
      {
        v50 = TRILogCategory_Server();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA291000, v50, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
        }

        v16 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
        goto LABEL_34;
      }
      [v26 setActivity:v30];
    }
    v59 = [[TRIFetchOptions alloc] initWithDownloadOptions:v26 cacheDeleteAvailableSpaceClass:&unk_1F347B678];
    dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    int v81 = 2;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v90 = __Block_byref_object_copy__16;
    v91 = __Block_byref_object_dispose__16;
    id v92 = 0;
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__16;
    v76 = __Block_byref_object_dispose__16;
    id v77 = 0;
    v32 = TRILogCategory_Server();
    os_signpost_id_t v33 = os_signpost_id_generate(v32);

    v34 = TRILogCategory_Server();
    v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      v36 = [(TRIRolloutDeployment *)v8->_deployment rolloutId];
      int v37 = [(TRIRolloutDeployment *)v8->_deployment deploymentId];
      *(_DWORD *)v83 = 138543618;
      id v84 = v36;
      __int16 v85 = 1024;
      LODWORD(v86) = v37;
      _os_signpost_emit_with_name_impl(&dword_1DA291000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "FetchRolloutNotificationWithDeployment", "r: %{public}@, d: %d", v83, 0x12u);
    }
    deployment = v8->_deployment;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __71__TRIFetchSingleRolloutNotificationTask_runUsingContext_withTaskQueue___block_invoke;
    v66[3] = &unk_1E6BBA230;
    v66[4] = v8;
    v69 = &v78;
    v70 = buf;
    v71 = &v72;
    id v67 = v6;
    v39 = v31;
    v68 = v39;
    [v12 fetchRolloutNotificationWithDeployment:deployment options:v59 completion:v66];
    dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
    v40 = TRILogCategory_Server();
    v41 = v40;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      v42 = [(TRIRolloutDeployment *)v8->_deployment rolloutId];
      int v43 = [(TRIRolloutDeployment *)v8->_deployment deploymentId];
      *(_DWORD *)v83 = 138543618;
      id v84 = v42;
      __int16 v85 = 1024;
      LODWORD(v86) = v43;
      _os_signpost_emit_with_name_impl(&dword_1DA291000, v41, OS_SIGNPOST_INTERVAL_END, v33, "FetchRolloutNotificationWithDeployment", "r: %{public}@, d: %d", v83, 0x12u);
    }
    v44 = TRILogCategory_Server();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      id v54 = (id)objc_opt_class();
      v55 = [(TRIRolloutDeployment *)v8->_deployment shortDesc];
      uint64_t v56 = *((int *)v79 + 6);
      if (v56 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *((int *)v79 + 6));
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v57 = off_1E6BBA250[v56];
      }
      *(_DWORD *)v83 = 138543874;
      id v84 = v54;
      __int16 v85 = 2114;
      v86 = v55;
      __int16 v87 = 2114;
      v88 = v57;
      _os_log_debug_impl(&dword_1DA291000, v44, OS_LOG_TYPE_DEBUG, "Finished %{public}@ with rollout %{public}@: %{public}@", v83, 0x20u);
    }
    if (v73[5])
    {
      v8->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      v45 = TRIFetchErrorParseToMetrics((void *)v73[5]);
      if ([v45 count])
      {
        v58 = v39;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v46 = v45;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v62 objects:v82 count:16];
        if (v47)
        {
          uint64_t v48 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v47; ++i)
            {
              if (*(void *)v63 != v48) {
                objc_enumerationMutation(v46);
              }
              [(TRIRolloutTaskSupport *)v8->_support addMetric:*(void *)(*((void *)&v62 + 1) + 8 * i)];
            }
            uint64_t v47 = [v46 countByEnumeratingWithState:&v62 objects:v82 count:16];
          }
          while (v47);
        }

        v39 = v58;
      }
    }
    v16 = +[TRITaskRunResult resultWithRunStatus:*((unsigned int *)v79 + 6) reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:*(void *)(*(void *)&buf[8] + 40)];

    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v78, 8);
LABEL_34:

    goto LABEL_35;
  }
  v13 = TRILogCategory_Server();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(TRIRolloutDeployment *)v8->_deployment shortDesc];
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v14;
    _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Skipping CloudKit fetch of rollout notification for %{public}@: already present.", buf, 0xCu);
  }
  v15 = [TRITaskRunResult alloc];
  v16 = [(TRITaskRunResult *)v15 initWithRunStatus:2 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
LABEL_35:

  objc_sync_exit(v8);
  return v16;
}

void __71__TRIFetchSingleRolloutNotificationTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2 == 4)
  {
    if (v9)
    {
      uint64_t v12 = [v9 rollout];
      if ([v12 hasRampId])
      {
        v13 = [v9 rollout];
        v14 = [v13 rampId];
        v15 = TRIValidateRampId();

        if (!v15 || !*(void *)(*(void *)(a1 + 32) + 40)) {
          goto LABEL_15;
        }
        uint64_t v12 = objc_opt_new();
        v16 = [v12 ensureRolloutFields];
        [v16 setClientRampId:v15];

        [*(id *)(*(void *)(a1 + 32) + 40) mergeTelemetry:v12];
      }
      else
      {
        v15 = 0;
      }

LABEL_15:
      v21 = [TRIRolloutRecord alloc];
      uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 24);
      uint64_t v23 = [v9 namespaceNames];
      v24 = [v9 rollout];
      LOBYTE(v29) = [v24 hasShadowEvaluation];
      v25 = [(TRIRolloutRecord *)v21 initWithDeployment:v22 rampId:v15 activeFactorPackSetId:0 activeTargetingRuleIndex:0 targetedFactorPackSetId:0 targetedTargetingRuleIndex:0 status:0 namespaces:v23 isShadow:v29 artifact:v9];

      v26 = [*(id *)(a1 + 40) rolloutDatabase];
      LOBYTE(v23) = [v26 addNewRolloutWithRecord:v25];

      if ((v23 & 1) == 0)
      {
        v27 = TRILogCategory_Server();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = [*(id *)(*(void *)(a1 + 32) + 24) shortDesc];
          *(_DWORD *)buf = 138543362;
          dispatch_semaphore_t v31 = v28;
          _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Unexpected conflict when saving rollout to database: %{public}@", buf, 0xCu);
        }
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 3;
      }

      goto LABEL_20;
    }
    objc_super v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [*(id *)(*(void *)(a1 + 32) + 24) shortDesc];
      *(_DWORD *)buf = 138543362;
      dispatch_semaphore_t v31 = v20;
      _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "No valid and compatible rollout artifact was received for %{public}@.", buf, 0xCu);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 3;
  }
  else
  {
    v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [*(id *)(*(void *)(a1 + 32) + 24) shortDesc];
      *(_DWORD *)buf = 138543618;
      dispatch_semaphore_t v31 = v18;
      __int16 v32 = 2114;
      id v33 = v11;
      _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Unable to fetch rollout notification %{public}@: %{public}@", buf, 0x16u);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a5);
  }
LABEL_20:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIFetchSingleRolloutNotificationTask *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TRIFetchSingleRolloutNotificationTask;
    if ([(TRIBaseTask *)&v8 isEqual:v4]
      && [(TRIFetchSingleRolloutNotificationTask *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      if ([(TRIRolloutDeployment *)self->_deployment isEqualToDeployment:v5->_deployment])char v6 = [(TRITaskAttributing *)self->_taskAttributing isEqual:v5->_taskAttributing]; {
      else
      }
        char v6 = 0;
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)TRIFetchSingleRolloutNotificationTask;
  unint64_t v3 = [(TRIBaseTask *)&v6 hash];
  uint64_t v4 = [(TRIRolloutDeployment *)self->_deployment hash] + 37 * v3;
  return [(TRITaskAttributing *)self->_taskAttributing hash] + 37 * v4;
}

- (id)dimensions
{
  return [(TRIRolloutTaskSupport *)self->_support dimensions];
}

- (id)metrics
{
  return [(TRIRolloutTaskSupport *)self->_support metrics];
}

- (id)trialSystemTelemetry
{
  return [(TRIRolloutTaskSupport *)self->_support trialSystemTelemetry];
}

- (id)_asPersistedTask
{
  unint64_t v3 = objc_opt_new();
  uint64_t v4 = [(TRIRolloutDeployment *)self->_deployment rolloutId];
  [v3 setRolloutId:v4];

  objc_msgSend(v3, "setDeploymentId:", -[TRIRolloutDeployment deploymentId](self->_deployment, "deploymentId"));
  id v5 = [(TRITaskAttributing *)self->_taskAttributing asPersistedTaskAttribution];
  [v3 setTaskAttribution:v5];

  objc_msgSend(v3, "setRetryCount:", -[TRIFetchSingleRolloutNotificationTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  uint64_t v4 = [(TRIFetchSingleRolloutNotificationTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIFetchSingleRolloutNotificationTask.m", 278, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v24 = 0;
  unint64_t v3 = +[TRIPBMessage parseFromData:a3 error:&v24];
  id v4 = v24;
  if (!v3)
  {
    objc_super v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v4;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIFetchSingleRolloutNotificationPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_24;
  }
  if (([v3 hasRolloutId] & 1) == 0)
  {
    v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138412290;
      id v26 = v23;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", buf, 0xCu);
    }
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138412290;
    id v26 = v15;
    v16 = "Cannot decode message of type %@ with missing field: rolloutId";
    goto LABEL_23;
  }
  id v5 = [v3 rolloutId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    v17 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v17);
    *(_DWORD *)buf = 138412290;
    id v26 = v15;
    v16 = "Cannot decode message of type %@ with field of length 0: rolloutId";
LABEL_23:
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);

    goto LABEL_24;
  }
  if (([v3 hasDeploymentId] & 1) == 0)
  {
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    v18 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412290;
    id v26 = v15;
    v16 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_23;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    objc_super v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    objc_super v19 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138412290;
    id v26 = v15;
    v16 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_23;
  }
  if (([v3 hasRetryCount] & 1) == 0)
  {
    objc_super v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138412290;
      id v26 = v15;
      v16 = "Cannot decode message of type %@ with missing field: retryCount";
      goto LABEL_23;
    }
LABEL_24:
    uint64_t v12 = 0;
    goto LABEL_25;
  }
  id v7 = [v3 taskAttribution];
  objc_super v8 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v7];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4FB0228]);
    id v10 = [v3 rolloutId];
    id v11 = objc_msgSend(v9, "initWithRolloutId:deploymentId:", v10, objc_msgSend(v3, "deploymentId"));

    uint64_t v12 = [(id)objc_opt_class() taskWithDeployment:v11 taskAttributing:v8];
    objc_msgSend(v12, "setRetryCount:", objc_msgSend(v3, "retryCount"));
  }
  else
  {
    id v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    uint64_t v12 = 0;
  }

LABEL_25:
  return v12;
}

- (unint64_t)requiredCapabilities
{
  unint64_t v3 = [(TRITaskAttributing *)self->_taskAttributing networkOptions];
  unint64_t v4 = [v3 requiredCapability];

  if ([(TRIFetchSingleRolloutNotificationTask *)self retryCount]) {
    return v4 | 4;
  }
  else {
    return v4;
  }
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TRIRolloutDeployment *)self->_deployment shortDesc];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%@,r:%d>", v4, v5, -[TRIFetchSingleRolloutNotificationTask retryCount](self, "retryCount")];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchSingleRolloutNotificationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchSingleRolloutNotificationTask;
  id v5 = [(TRIFetchSingleRolloutNotificationTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      id v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
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
    [v6 handleFailureInMethod:a2, self, @"TRIFetchSingleRolloutNotificationTask.m", 322, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIFetchSingleRolloutNotificationTask *)self serialize];
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
  objc_storeStrong((id *)&self->_support, 0);
  objc_storeStrong((id *)&self->_taskAttributing, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
}

@end