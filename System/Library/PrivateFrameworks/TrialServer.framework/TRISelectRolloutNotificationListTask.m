@interface TRISelectRolloutNotificationListTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithNamespaceNames:(id)a3 taskAttribution:(id)a4;
- ($A5A652246548B43F8BC05201A1C72A70)_processRolloutArtifact:(id)a3 rolloutsProcessed:(id)a4 remainingNamespaces:(id)a5 targeter:(id)a6 context:(id)a7 taskQueue:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasDeferred;
- (NSArray)tags;
- (NSSet)namespaceNames;
- (NSString)description;
- (TRISelectRolloutNotificationListTask)initWithCoder:(id)a3;
- (TRISelectRolloutNotificationListTask)initWithNamespaceNames:(id)a3 taskAttribution:(id)a4;
- (id)_asPersistedTask;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)retryCount;
- (int)taskType;
- (int64_t)nextTaskCount;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)_addDimension:(id)a3;
- (void)_addMetric:(id)a3;
- (void)_addNextTask:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRISelectRolloutNotificationListTask

- (int)taskType
{
  return 25;
}

- (NSArray)tags
{
  v3 = objc_opt_new();
  +[TRITaskUtils addAttribution:self->_taskAttribution toTaskTags:v3];
  return (NSArray *)v3;
}

+ (id)taskWithNamespaceNames:(id)a3 taskAttribution:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[TRISelectRolloutNotificationListTask alloc] initWithNamespaceNames:v6 taskAttribution:v5];

  return v7;
}

- (TRISelectRolloutNotificationListTask)initWithNamespaceNames:(id)a3 taskAttribution:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TRISelectRolloutNotificationListTask;
  v9 = [(TRISelectRolloutNotificationListTask *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_namespaceNames, a3);
    objc_storeStrong((id *)&v10->_taskAttribution, a4);
    uint64_t v11 = objc_opt_new();
    nextTasks = v10->_nextTasks;
    v10->_nextTasks = (NSMutableArray *)v11;

    id v13 = objc_alloc(MEMORY[0x1E4F93B70]);
    v14 = objc_opt_new();
    uint64_t v15 = [v13 initWithGuardedData:v14];
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v15;
  }
  return v10;
}

- (void)_addNextTask:(id)a3
{
}

- (int64_t)nextTaskCount
{
  return [(NSMutableArray *)self->_nextTasks count];
}

- ($A5A652246548B43F8BC05201A1C72A70)_processRolloutArtifact:(id)a3 rolloutsProcessed:(id)a4 remainingNamespaces:(id)a5 targeter:(id)a6 context:(id)a7 taskQueue:(id)a8
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v106 = a8;
  context = (void *)MEMORY[0x1E016E7F0]();
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __129__TRISelectRolloutNotificationListTask__processRolloutArtifact_rolloutsProcessed_remainingNamespaces_targeter_context_taskQueue___block_invoke;
  v122[3] = &unk_1E6BBD0C0;
  id v19 = v16;
  id v123 = v19;
  v20 = (uint64_t (**)(void))MEMORY[0x1E016EA80](v122);
  v107 = v14;
  v21 = [v14 deployment];
  v22 = [v21 rolloutId];
  LODWORD(a7) = [v15 containsObject:v22];

  if (a7)
  {
    v23 = TRILogCategory_Server();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = [v21 shortDesc];
      [v21 rolloutId];
      id v25 = v15;
      v26 = v21;
      v27 = v20;
      id v28 = v19;
      v30 = id v29 = v17;
      v31 = _NamespaceNamesForArtifact(v107);
      *(_DWORD *)buf = 138543874;
      v127 = v24;
      __int16 v128 = 2114;
      v129 = v30;
      __int16 v130 = 2114;
      v131 = v31;
      _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_INFO, "Ignoring rollout deployment %{public}@ because rolloutId %{public}@ has already been processed for namespaces %{public}@.", buf, 0x20u);

      id v17 = v29;
      id v19 = v28;
      v20 = v27;
      v21 = v26;
      id v15 = v25;
    }
    v32.var0 = v20[2](v20);
    goto LABEL_61;
  }
  v103 = v18;
  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = __129__TRISelectRolloutNotificationListTask__processRolloutArtifact_rolloutsProcessed_remainingNamespaces_targeter_context_taskQueue___block_invoke_30;
  v119[3] = &unk_1E6BBD0E8;
  id v33 = v15;
  id v120 = v15;
  id v34 = v19;
  id v121 = v34;
  v35 = (void *)MEMORY[0x1E016EA80](v119);
  id v117 = 0;
  id v118 = 0;
  id v116 = 0;
  v36 = [v107 rollout];
  int v37 = [v17 targetRollout:v36 factorPackSetId:&v118 relatedRampDeployment:&v117 error:&v116];

  if (v37 != 3)
  {
    if (v37 != 2)
    {
      id v101 = v33;
      id v102 = v17;
      if (!(_BYTE)v37)
      {
        v98 = v20;
        v100 = v35;
        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        v38 = [(TRISelectRolloutNotificationListTask *)self metrics];
        uint64_t v39 = [v38 countByEnumeratingWithState:&v112 objects:v125 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v113;
          while (2)
          {
            id v42 = v19;
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v113 != v41) {
                objc_enumerationMutation(v38);
              }
              v44 = [*(id *)(*((void *)&v112 + 1) + 8 * i) name];
              char v45 = [@"targeting_error" isEqual:v44];

              if (v45)
              {
                id v19 = v42;
                goto LABEL_40;
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v112 objects:v125 count:16];
            id v19 = v42;
            if (v40) {
              continue;
            }
            break;
          }
        }

        v46 = [v116 userInfo];
        uint64_t v47 = [v46 objectForKeyedSubscript:@"logMessage"];
        v48 = (void *)v47;
        v49 = @"unknown";
        if (v47) {
          v49 = (__CFString *)v47;
        }
        v50 = v49;

        v38 = [MEMORY[0x1E4FB05A8] metricWithName:@"targeting_error" categoricalValue:v50];

        [(TRISelectRolloutNotificationListTask *)self _addMetric:v38];
LABEL_40:

        v20 = v98;
        v32.var0 = v98[2](v98);
        id v17 = v102;
        id v18 = v103;
LABEL_59:
        v35 = v100;
        goto LABEL_60;
      }
      v56 = (void (**)(void, void *, void *))v35;
      id v99 = v19;
      goto LABEL_26;
    }
LABEL_51:
    v32.var0 = v20[2](v20);
    id v18 = v103;
    goto LABEL_60;
  }
  id v102 = v17;
  v51 = TRILogCategory_Server();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = [v21 shortDesc];
    *(_DWORD *)buf = 138543362;
    v127 = v52;
    _os_log_impl(&dword_1DA291000, v51, OS_LOG_TYPE_DEFAULT, "Rollout deployment %{public}@ will not be applied because it represents an already-active ramp. Prior deployment will be reprocessed.", buf, 0xCu);
  }
  v53 = [v103 rolloutDatabase];
  id v54 = v117;
  if (!v54)
  {
    v95 = [MEMORY[0x1E4F28B00] currentHandler];
    [v95 handleFailureInMethod:a2, self, @"TRISelectRolloutNotificationListTask.m", 171, @"Expression was unexpectedly nil/false: %@", @"relatedRampDeployment" object file lineNumber description];
  }
  v55 = [v53 recordWithDeployment:v54 usingTransaction:0];

  if (!v55)
  {
    v87 = TRILogCategory_Server();
    id v17 = v102;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v93 = [v117 shortDesc];
      v94 = _NamespaceNamesForArtifact(v107);
      *(_DWORD *)buf = 138543618;
      v127 = v93;
      __int16 v128 = 2114;
      v129 = v94;
      _os_log_error_impl(&dword_1DA291000, v87, OS_LOG_TYPE_ERROR, "Unexpected failure to find related ramp deployment %{public}@ for namespaces %{public}@.", buf, 0x16u);

      id v17 = v102;
    }

    goto LABEL_51;
  }
  v56 = (void (**)(void, void *, void *))v35;
  id v99 = v19;
  id v101 = v33;
  uint64_t v57 = [v55 artifact];

  id v58 = v117;
  v21 = v58;
  v107 = (void *)v57;
LABEL_26:
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  v59 = [v107 namespaceNames];
  uint64_t v60 = [v59 countByEnumeratingWithState:&v108 objects:v124 count:16];
  if (!v60) {
    goto LABEL_34;
  }
  uint64_t v61 = v60;
  uint64_t v62 = *(void *)v109;
  while (2)
  {
    for (uint64_t j = 0; j != v61; ++j)
    {
      if (*(void *)v109 != v62) {
        objc_enumerationMutation(v59);
      }
      if ([v34 containsObject:*(void *)(*((void *)&v108 + 1) + 8 * j)])
      {

        v68 = [v21 rolloutId];
        v69 = [v107 namespaceNames];
        v70 = v56;
        v56[2](v56, v68, v69);

        v71 = [TRIRolloutRecord alloc];
        v72 = [v107 rollout];
        int v73 = [v72 hasRampId];
        v100 = v70;
        if (v73)
        {
          v97 = [v107 rollout];
          id v19 = [v97 rampId];
          v74 = TRIValidateRampId();
        }
        else
        {
          v74 = 0;
        }
        v75 = [v107 namespaceNames];
        v76 = [v107 rollout];
        LOBYTE(v96) = [v76 hasShadowEvaluation];
        v77 = [(TRIRolloutRecord *)v71 initWithDeployment:v21 rampId:v74 activeFactorPackSetId:0 activeTargetingRuleIndex:0 targetedFactorPackSetId:0 targetedTargetingRuleIndex:0 status:0 namespaces:v75 isShadow:v96 artifact:v107];

        if (v73)
        {
        }
        v78 = [v103 rolloutDatabase];
        [v78 addNewRolloutWithRecord:v77];

        v79 = [v103 rolloutDatabase];
        v80 = [v79 recordWithDeployment:v21 usingTransaction:0];

        if (!v80)
        {
          v88 = TRILogCategory_Server();
          id v17 = v102;
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
          {
            v89 = [v21 shortDesc];
            v90 = _NamespaceNamesForArtifact(v107);
            *(_DWORD *)buf = 138543618;
            v127 = v89;
            __int16 v128 = 2114;
            v129 = v90;
            _os_log_error_impl(&dword_1DA291000, v88, OS_LOG_TYPE_ERROR, "Unexpected failure to find rollout deployment %{public}@ for namespaces %{public}@.", buf, 0x16u);
          }
          goto LABEL_58;
        }
        v81 = [v80 activeFactorPackSetId];

        v82 = TRILogCategory_Server();
        BOOL v83 = os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
        id v17 = v102;
        if (v81)
        {
          if (v83)
          {
            v84 = [v21 shortDesc];
            v85 = _NamespaceNamesForArtifact(v107);
            *(_DWORD *)buf = 138543618;
            v127 = v84;
            __int16 v128 = 2114;
            v129 = v85;
            v86 = "Rollout deployment %{public}@ was selected, but is already active. Scheduling re-activation for namespaces %{public}@";
LABEL_56:
            _os_log_impl(&dword_1DA291000, v82, OS_LOG_TYPE_DEFAULT, v86, buf, 0x16u);
          }
        }
        else if (v83)
        {
          v84 = [v21 shortDesc];
          v85 = _NamespaceNamesForArtifact(v107);
          *(_DWORD *)buf = 138543618;
          v127 = v84;
          __int16 v128 = 2114;
          v129 = v85;
          v86 = "Rollout deployment %{public}@ is selected and not yet active; scheduling activation for namespaces %{public}@.";
          goto LABEL_56;
        }

        v91 = [v21 rolloutId];
        [v106 cancelTasksWithTag:v91];

        v88 = +[TRIRolloutTargetingTask taskWithRolloutDeployment:v21 includeDependencies:0 taskAttribution:self->_taskAttribution triggerEvent:0];
        [(TRISelectRolloutNotificationListTask *)self _addNextTask:v88];
LABEL_58:

        v32.var0 = v20[2](v20);
        id v33 = v101;
        id v18 = v103;
        id v19 = v99;
        goto LABEL_59;
      }
    }
    uint64_t v61 = [v59 countByEnumeratingWithState:&v108 objects:v124 count:16];
    if (v61) {
      continue;
    }
    break;
  }
LABEL_34:

  v64 = [v21 rolloutId];
  v65 = [v107 namespaceNames];
  v35 = v56;
  v56[2](v56, v64, v65);

  v66 = TRILogCategory_Server();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v67 = [v21 shortDesc];
    *(_DWORD *)buf = 138543362;
    v127 = v67;
    _os_log_impl(&dword_1DA291000, v66, OS_LOG_TYPE_DEFAULT, "Ignoring rollout deployment %{public}@ because it does not impact unhandled namespaces.", buf, 0xCu);
  }
  v32.var0 = v20[2](v20);
  id v33 = v101;
  id v17 = v102;
  id v18 = v103;
  id v19 = v99;
LABEL_60:

  id v15 = v33;
LABEL_61:

  return v32;
}

BOOL __129__TRISelectRolloutNotificationListTask__processRolloutArtifact_rolloutsProcessed_remainingNamespaces_targeter_context_taskQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) count] != 0;
}

void __129__TRISelectRolloutNotificationListTask__processRolloutArtifact_rolloutsProcessed_remainingNamespaces_targeter_context_taskQueue___block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) addObject:a2];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v70 = a4;
  context = (void *)MEMORY[0x1E016E7F0]();
  v68 = (void *)os_transaction_create();
  uint64_t v7 = [v6 keyValueStore];
  v72 = +[TRIFetchDateManager managerWithKeyValueStore:v7];

  uint64_t v8 = [v6 namespaceDatabase];
  uint64_t v9 = [v6 paths];
  uint64_t v10 = [v9 namespaceDescriptorsDefaultDir];
  int v73 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v8 defaultDescriptorDirectoryPath:v10];

  uint64_t v11 = [(TRITaskAttributing *)self->_taskAttribution triCloudKitContainer];
  long long v12 = [(TRITaskAttributing *)self->_taskAttribution teamIdentifier];
  long long v13 = [(TRITaskAttributing *)self->_taskAttribution applicationBundleIdentifier];
  v69 = +[TRICKNativeArtifactProvider providerForContainer:v11 teamId:v12 bundleId:v13 dateProvider:v72 namespaceDescriptorProvider:v73 serverContext:v6];

  long long v14 = [(TRITaskAttributing *)self->_taskAttribution networkOptions];
  if ([v14 allowsCellularAccess])
  {
    id v15 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"allows_cellular_download", objc_msgSend(v14, "allowsCellularAccess"));
    [(TRISelectRolloutNotificationListTask *)self _addMetric:v15];
  }
  if (![v14 discretionaryBehavior]) {
    goto LABEL_6;
  }
  uint64_t v16 = [v14 requiredCapability];
  id v17 = [(TRIBaseTask *)self stateProvider];
  id v18 = [v17 activeActivityGrantingCapability:v16];

  if (v18)
  {
    [v14 setActivity:v18];

LABEL_6:
    id v19 = [TRIRolloutTargeter alloc];
    v20 = [v6 rolloutDatabase];
    v21 = [TRISystemCovariates alloc];
    uint64_t v22 = [v6 paths];
    v23 = [(TRISystemCovariates *)v21 initWithPaths:v22];
    v24 = [[TRIUserCovariates alloc] initWithContext:v6];
    v71 = [(TRIRolloutTargeter *)v19 initWithDatabase:v20 systemCovariateProvider:v23 userCovariateProvider:v24];

    id v25 = objc_opt_new();
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __70__TRISelectRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke;
    v102[3] = &unk_1E6BBD110;
    id v26 = v25;
    id v103 = v26;
    [v73 enumerateDefaultDescriptorsWithBlock:v102];
    v27 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
    LOBYTE(v22) = [v27 count] == 0;

    if ((v22 & 1) == 0)
    {
      id v28 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
      [v26 intersectSet:v28];
    }
    if ([v26 count])
    {
      id v29 = (void *)MEMORY[0x1E016E7F0]();
      v30 = [v26 allObjects];
      unint64_t v31 = [v26 count];
      if (v31 >= 3) {
        uint64_t v32 = 3;
      }
      else {
        uint64_t v32 = v31;
      }
      id v33 = objc_msgSend(v30, "subarrayWithRange:", 0, v32);

      id v34 = [v33 componentsJoinedByString:@", "];
      v35 = TRILogCategory_Server();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = [v26 count];
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v34;
        _os_log_impl(&dword_1DA291000, v35, OS_LOG_TYPE_DEFAULT, "Selecting best rollout deployments for %tu namespaces: [%{public}@, ...].", buf, 0x16u);
      }

      int v37 = objc_opt_new();
      dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v106 = __Block_byref_object_copy__39;
      v107 = __Block_byref_object_dispose__39;
      id v108 = 0;
      uint64_t v98 = 0;
      id v99 = &v98;
      uint64_t v100 = 0x2020000000;
      int v101 = 0;
      uint64_t v92 = 0;
      v93 = &v92;
      uint64_t v94 = 0x3032000000;
      v95 = __Block_byref_object_copy__39;
      uint64_t v96 = __Block_byref_object_dispose__39;
      id v97 = 0;
      v91[0] = 0;
      v91[1] = v91;
      v91[2] = 0x2020000000;
      v91[3] = 0;
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __70__TRISelectRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke_61;
      v79[3] = &unk_1E6BBD138;
      v87 = &v98;
      v88 = &v92;
      v89 = buf;
      id v80 = v26;
      v81 = self;
      id v63 = v37;
      id v82 = v63;
      BOOL v83 = v71;
      id v84 = v6;
      id v85 = v70;
      v90 = v91;
      uint64_t v39 = v38;
      v86 = v39;
      v66 = (void *)MEMORY[0x1E016EA80](v79);
      v65 = [[TRIFetchOptions alloc] initWithDownloadOptions:v14 cacheDeleteAvailableSpaceClass:&unk_1F347BAB0];
      uint64_t v40 = TRILogCategory_Server();
      os_signpost_id_t v41 = os_signpost_id_generate(v40);

      id v42 = TRILogCategory_Server();
      v43 = v42;
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        *(_WORD *)v78 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DA291000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "FetchRolloutNotificationsDateDescending", (const char *)&unk_1DA433847, v78, 2u);
      }

      [v69 fetchRolloutNotificationsDateDescendingWithOptions:v65 completion:v66];
      dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);
      v44 = TRILogCategory_Server();
      char v45 = v44;
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)v78 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DA291000, v45, OS_SIGNPOST_INTERVAL_END, v41, "FetchRolloutNotificationsDateDescending", (const char *)&unk_1DA433847, v78, 2u);
      }

      if (v93[5])
      {
        self->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:v63];
        v46 = TRIFetchErrorParseToMetrics((void *)v93[5]);
        if ([v46 count])
        {
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id v47 = v46;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v74 objects:v104 count:16];
          if (v48)
          {
            uint64_t v49 = *(void *)v75;
            do
            {
              for (uint64_t i = 0; i != v48; ++i)
              {
                if (*(void *)v75 != v49) {
                  objc_enumerationMutation(v47);
                }
                [(TRISelectRolloutNotificationListTask *)self _addMetric:*(void *)(*((void *)&v74 + 1) + 8 * i)];
              }
              uint64_t v48 = [v47 countByEnumeratingWithState:&v74 objects:v104 count:16];
            }
            while (v48);
          }
        }
      }
      v51 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
      if (v51)
      {
        v52 = (void *)MEMORY[0x1E4FB00D0];
        v53 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
        id v54 = [v53 allObjects];
        v55 = [v52 immediateDownloadNotificationKeyForNamespaceNames:v54];
      }
      else
      {
        v55 = 0;
      }

      if (*((_DWORD *)v99 + 6) == 2)
      {
        uint64_t v59 = 2;
      }
      else
      {
        [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:v55 withCloudKitError:v93[5]];
        uint64_t v59 = *((unsigned int *)v99 + 6);
      }
      uint64_t v60 = (void *)[(NSMutableArray *)self->_nextTasks copy];
      uint64_t v57 = +[TRITaskRunResult resultWithRunStatus:v59 reportResultToServer:1 nextTasks:v60 earliestRetryDate:*(void *)(*(void *)&buf[8] + 40)];

      _Block_object_dispose(v91, 8);
      _Block_object_dispose(&v92, 8);

      _Block_object_dispose(&v98, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      v56 = TRILogCategory_Server();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        uint64_t v62 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v62;
        _os_log_error_impl(&dword_1DA291000, v56, OS_LOG_TYPE_ERROR, "Request to select best rollout deployments specified unregistered namespaces: %{public}@", buf, 0xCu);
      }
      uint64_t v57 = +[TRITaskRunResult resultWithRunStatus:2 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
    }

    goto LABEL_45;
  }
  id v58 = TRILogCategory_Server();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v58, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
  }

  v71 = (TRIRolloutTargeter *)[(NSMutableArray *)self->_nextTasks copy];
  uint64_t v57 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:v71 earliestRetryDate:0];
LABEL_45:

  return v57;
}

void __70__TRISelectRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 namespaceName];
  [v2 addObject:v3];
}

void __70__TRISelectRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke_61(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5, unsigned char *a6)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a2 <= 1)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
    goto LABEL_3;
  }
  if (a2 == 2)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
    if (v12)
    {
      *(_DWORD *)(v14 + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), a4);
      goto LABEL_7;
    }
LABEL_3:
    *(_DWORD *)(v14 + 24) = 3;
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), a5);
LABEL_8:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));
    goto LABEL_9;
  }
  if (v11)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = objc_msgSend(v11, "namespaceNames", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (!v16)
    {
LABEL_19:

      goto LABEL_9;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
LABEL_13:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v25 != v18) {
        objc_enumerationMutation(v15);
      }
      if ([*(id *)(a1 + 32) containsObject:*(void *)(*((void *)&v24 + 1) + 8 * v19)]) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v17) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }

    char v20 = [*(id *)(a1 + 40) _processRolloutArtifact:v11 rolloutsProcessed:*(void *)(a1 + 48) remainingNamespaces:*(void *)(a1 + 32) targeter:*(void *)(a1 + 56) context:*(void *)(a1 + 64) taskQueue:*(void *)(a1 + 72)];
    ++*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
    if (v20) {
      goto LABEL_21;
    }
    if (a6) {
      *a6 = 1;
    }
    if (a2 - 3 >= 2) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_21:
  if (a2 != 3)
  {
    if (a2 != 4) {
      goto LABEL_8;
    }
LABEL_30:
    if (!*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24))
    {
      v23 = TRILogCategory_Server();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_DEFAULT, "Fetch status success but 0 results fetched.", buf, 2u);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 2;
    goto LABEL_8;
  }
  v21 = TRILogCategory_Server();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = v22;
    _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "Fetched %ld results, with more results pending.", buf, 0xCu);
  }

LABEL_9:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRISelectRolloutNotificationListTask;
  if ([(TRIBaseTask *)&v12 isEqual:v4])
  {
    id v5 = v4;
    if ([(TRITaskAttributing *)self->_taskAttribution isEqual:v5[4]])
    {
      id v6 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
      uint64_t v7 = [v5 namespaceNames];
      if (v6 == v7)
      {

        goto LABEL_10;
      }
      uint64_t v8 = v7;
      if (v6 && v7)
      {
        char v9 = [v6 isEqualToSet:v7];

        if ((v9 & 1) == 0) {
          goto LABEL_12;
        }
LABEL_10:
        BOOL v10 = 1;
LABEL_13:

        goto LABEL_14;
      }
    }
LABEL_12:
    BOOL v10 = 0;
    goto LABEL_13;
  }
  BOOL v10 = 0;
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)TRISelectRolloutNotificationListTask;
  unint64_t v3 = [(TRIBaseTask *)&v8 hash];
  id v4 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
  if (v4)
  {
    id v5 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
    uint64_t v6 = [v5 hash];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return [(TRITaskAttributing *)self->_taskAttribution hash] + 37 * (v6 + 37 * v3);
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%@>", v4, v5];

  return (NSString *)v6;
}

- (void)_addMetric:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__TRISelectRolloutNotificationListTask__addMetric___block_invoke;
  v7[3] = &unk_1E6BBD160;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __51__TRISelectRolloutNotificationListTask__addMetric___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = (void *)a2[1];
  if (!v3)
  {
    id v5 = a2;
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)a2[1];
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
  v7[2] = __54__TRISelectRolloutNotificationListTask__addDimension___block_invoke;
  v7[3] = &unk_1E6BBD160;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __54__TRISelectRolloutNotificationListTask__addDimension___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = (void *)a2[2];
  if (!v3)
  {
    id v5 = a2;
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)a2[2];
    a2[2] = v6;

    unint64_t v3 = (void *)a2[2];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  return [v3 addObject:v8];
}

- (id)metrics
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__39;
  BOOL v10 = __Block_byref_object_dispose__39;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__TRISelectRolloutNotificationListTask_metrics__block_invoke;
  v5[3] = &unk_1E6BBD188;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __47__TRISelectRolloutNotificationListTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 8) copy];
  return MEMORY[0x1F41817F8]();
}

- (id)dimensions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__39;
  BOOL v10 = __Block_byref_object_dispose__39;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__TRISelectRolloutNotificationListTask_dimensions__block_invoke;
  v5[3] = &unk_1E6BBD188;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __50__TRISelectRolloutNotificationListTask_dimensions__block_invoke(uint64_t a1, uint64_t a2)
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

  id v5 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(TRISelectRolloutNotificationListTask *)self namespaceNames];
    uint64_t v8 = [v7 allObjects];
    char v9 = (void *)[v8 mutableCopy];
    [v3 setNamespacesArray:v9];
  }
  objc_msgSend(v3, "setRetryCount:", -[TRISelectRolloutNotificationListTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  id v4 = [(TRISelectRolloutNotificationListTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    char v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRISelectRolloutNotificationListTask.m", 547, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  id v4 = +[TRIPBMessage parseFromData:a3 error:&v16];
  id v5 = v16;
  if (!v4)
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v5;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRISelectRolloutNotificationListPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (([v4 hasTaskAttribution] & 1) == 0)
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138412290;
      id v18 = v15;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: taskAttribution", buf, 0xCu);
    }
LABEL_10:
    id v11 = 0;
    goto LABEL_20;
  }
  uint64_t v6 = [v4 taskAttribution];
  uint64_t v7 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v6];

  if (v7)
  {
    if (objc_msgSend(v4, "namespacesArray_Count"))
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      char v9 = [v4 namespacesArray];
      BOOL v10 = [v8 initWithArray:v9];
    }
    else
    {
      BOOL v10 = 0;
    }
    id v11 = (void *)[objc_alloc((Class)a1) initWithNamespaceNames:v10 taskAttribution:v7];
    if ([v4 hasRetryCount]) {
      uint64_t v12 = [v4 retryCount];
    }
    else {
      uint64_t v12 = 0;
    }
    [v11 setRetryCount:v12];
  }
  else
  {
    BOOL v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    id v11 = 0;
  }

LABEL_20:
  return v11;
}

- (unint64_t)requiredCapabilities
{
  id v3 = [(TRITaskAttributing *)self->_taskAttribution networkOptions];
  unint64_t v4 = [v3 requiredCapability];

  if ([(TRISelectRolloutNotificationListTask *)self retryCount]) {
    return v4 | 4;
  }
  else {
    return v4;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISelectRolloutNotificationListTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISelectRolloutNotificationListTask;
  id v5 = [(TRISelectRolloutNotificationListTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRISelectRolloutNotificationListTask.m", 587, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRISelectRolloutNotificationListTask *)self serialize];
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

- (NSSet)namespaceNames
{
  return self->_namespaceNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceNames, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
}

@end