@interface TRIFetchRolloutNotificationListTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttribution:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasDeferred;
- (NSArray)tags;
- (NSString)description;
- (TRIFetchRolloutNotificationListTask)initWithCoder:(id)a3;
- (TRIFetchRolloutNotificationListTask)initWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttribution:(id)a5;
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
- (void)_processRolloutArtifact:(id)a3 context:(id)a4 taskQueue:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setRetryCount:(int)a3;
- (void)setWasDeferred:(BOOL)a3;
@end

@implementation TRIFetchRolloutNotificationListTask

- (int)taskType
{
  return 23;
}

- (NSArray)tags
{
  v3 = objc_opt_new();
  +[TRITaskUtils addAttribution:self->_taskAttribution toTaskTags:v3];
  return (NSArray *)v3;
}

+ (id)taskWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttribution:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[TRIFetchRolloutNotificationListTask alloc] initWithStartingFetchDateOverride:v9 namespaceNames:v8 taskAttribution:v7];

  return v10;
}

- (TRIFetchRolloutNotificationListTask)initWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttribution:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TRIFetchRolloutNotificationListTask;
  v12 = [(TRIFetchRolloutNotificationListTask *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startingFetchDateOverride, a3);
    objc_storeStrong((id *)&v13->_namespaceNames, a4);
    objc_storeStrong((id *)&v13->_taskAttribution, a5);
    uint64_t v14 = objc_opt_new();
    nextTasks = v13->_nextTasks;
    v13->_nextTasks = (NSMutableArray *)v14;
  }
  return v13;
}

- (void)_addNextTask:(id)a3
{
}

- (int64_t)nextTaskCount
{
  return [(NSMutableArray *)self->_nextTasks count];
}

- (void)_processRolloutArtifact:(id)a3 context:(id)a4 taskQueue:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 rollout];
  if ([v9 hasRampId])
  {
    id v10 = [v7 rollout];
    id v11 = [v10 rampId];
    v12 = TRIValidateRampId();
  }
  else
  {
    v12 = 0;
  }

  v13 = [TRIRolloutRecord alloc];
  uint64_t v14 = [v7 deployment];
  v15 = [v7 namespaceNames];
  v16 = [v7 rollout];
  LOBYTE(v25) = [v16 hasShadowEvaluation];
  objc_super v17 = [(TRIRolloutRecord *)v13 initWithDeployment:v14 rampId:v12 activeFactorPackSetId:0 activeTargetingRuleIndex:0 targetedFactorPackSetId:0 targetedTargetingRuleIndex:0 status:0 namespaces:v15 isShadow:v25 artifact:v7];

  v18 = [v8 rolloutDatabase];

  char v19 = [v18 addNewRolloutWithRecord:v17];
  if (v19)
  {
    v20 = [v7 deployment];
    v21 = +[TRIRolloutTargetingTask taskWithRolloutDeployment:v20 includeDependencies:0 taskAttribution:self->_taskAttribution triggerEvent:0];
    [(TRIFetchRolloutNotificationListTask *)self _addNextTask:v21];
  }
  else
  {
    v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v7 deployment];
      v24 = [v23 shortDesc];
      *(_DWORD *)buf = 138543362;
      v27 = v24;
      _os_log_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEFAULT, "Skipping RolloutNotification for rollout %{public}@ which is already present in the database.", buf, 0xCu);
    }
  }
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v46 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  v43 = (void *)os_transaction_create();
  id v8 = [v6 keyValueStore];
  id v9 = +[TRIFetchDateManager managerWithKeyValueStore:v8];

  id v10 = [v6 namespaceDatabase];
  id v11 = [v6 paths];
  v12 = [v11 namespaceDescriptorsDefaultDir];
  v47 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v10 defaultDescriptorDirectoryPath:v12];

  uint64_t v13 = [(TRITaskAttributing *)v7->_taskAttribution triCloudKitContainer];
  uint64_t v14 = [(TRITaskAttributing *)v7->_taskAttribution teamIdentifier];
  v15 = [(TRITaskAttributing *)v7->_taskAttribution applicationBundleIdentifier];
  v45 = +[TRICKNativeArtifactProvider providerForContainer:v13 teamId:v14 bundleId:v15 dateProvider:v9 namespaceDescriptorProvider:v47 serverContext:v6];

  v16 = [(TRITaskAttributing *)v7->_taskAttribution networkOptions];
  if ([v16 allowsCellularAccess])
  {
    objc_super v17 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"allows_cellular_download", objc_msgSend(v16, "allowsCellularAccess"));
    [(TRIFetchRolloutNotificationListTask *)v7 _addMetric:v17];
  }
  if (![v16 discretionaryBehavior]) {
    goto LABEL_6;
  }
  v18 = [(TRIBaseTask *)v7 stateProvider];
  char v19 = objc_msgSend(v18, "activeActivityGrantingCapability:", objc_msgSend(v16, "requiredCapability"));

  if (v19)
  {
    [v16 setActivity:v19];

LABEL_6:
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    v44 = [[TRIFetchOptions alloc] initWithDownloadOptions:v16 cacheDeleteAvailableSpaceClass:&unk_1F347B9F0];
    *(void *)v75 = 0;
    v76 = v75;
    uint64_t v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__29;
    v79 = __Block_byref_object_dispose__29;
    id v80 = 0;
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2020000000;
    int v74 = 0;
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__29;
    v69 = __Block_byref_object_dispose__29;
    id v70 = 0;
    v21 = TRILogCategory_Server();
    os_signpost_id_t v22 = os_signpost_id_generate(v21);

    v23 = TRILogCategory_Server();
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA291000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "FetchRolloutNotificationsDateAscending", (const char *)&unk_1DA433847, buf, 2u);
    }

    v42 = v9;
    *(void *)buf = 0;
    v62 = buf;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = 0;
    startingFetchDateOverride = v7->_startingFetchDateOverride;
    namespaceNames = v7->_namespaceNames;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __69__TRIFetchRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke;
    v53[3] = &unk_1E6BBBEC0;
    v58 = &v65;
    v59 = v75;
    v57 = &v71;
    v53[4] = v7;
    id v27 = v6;
    id v54 = v27;
    id v55 = v46;
    v60 = buf;
    uint64_t v28 = v20;
    v56 = v28;
    [v45 fetchRolloutNotificationsDateAscendingWithOptions:v44 lastFetchDateOverride:startingFetchDateOverride namespaceNames:namespaceNames completion:v53];
    dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
    v29 = TRILogCategory_Server();
    v30 = v29;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)v52 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA291000, v30, OS_SIGNPOST_INTERVAL_END, v22, "FetchRolloutNotificationsDateAscending", (const char *)&unk_1DA433847, v52, 2u);
    }

    if (v66[5])
    {
      v7->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      v31 = TRIFetchErrorParseToMetrics((void *)v66[5]);
      if ([v31 count])
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v81 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v49 != v34) {
                objc_enumerationMutation(v32);
              }
              -[TRIFetchRolloutNotificationListTask _addMetric:](v7, "_addMetric:", *(void *)(*((void *)&v48 + 1) + 8 * i), v42);
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v81 count:16];
          }
          while (v33);
        }

        id v9 = v42;
      }
    }
    uint64_t v36 = *((unsigned int *)v72 + 6);
    if (v36 == 2)
    {
      v37 = [v27 xpcActivityManager];
      [v37 postponeCellularActivity];

      uint64_t v36 = *((unsigned int *)v72 + 6);
    }
    v38 = (void *)[(NSMutableArray *)v7->_nextTasks copy];
    v39 = +[TRITaskRunResult resultWithRunStatus:v36 reportResultToServer:1 nextTasks:v38 earliestRetryDate:*((void *)v76 + 5)];

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v65, 8);

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(v75, 8);

    goto LABEL_29;
  }
  v40 = TRILogCategory_Server();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v75 = 0;
    _os_log_impl(&dword_1DA291000, v40, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", v75, 2u);
  }

  uint64_t v28 = [(NSMutableArray *)v7->_nextTasks copy];
  v39 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:v28 earliestRetryDate:0];
LABEL_29:

  objc_sync_exit(v7);
  return v39;
}

void __69__TRIFetchRolloutNotificationListTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2 <= 1)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    goto LABEL_3;
  }
  if (a2 == 2)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v10)
    {
      *(_DWORD *)(v12 + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a4);
      goto LABEL_7;
    }
LABEL_3:
    *(_DWORD *)(v12 + 24) = 3;
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a5);
LABEL_8:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
    goto LABEL_9;
  }
  if (v9)
  {
    [*(id *)(a1 + 32) _processRolloutArtifact:v9 context:*(void *)(a1 + 40) taskQueue:*(void *)(a1 + 48)];
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  }
  if (a2 != 3)
  {
    if (a2 == 4)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
      {
        uint64_t v13 = TRILogCategory_Server();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Fetch status success but 0 results fetched.", (uint8_t *)&v16, 2u);
        }
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
    }
    goto LABEL_8;
  }
  uint64_t v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    int v16 = 134217984;
    uint64_t v17 = v15;
    _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Fetched %ld results, with more results pending.", (uint8_t *)&v16, 0xCu);
  }

LABEL_9:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TRIFetchRolloutNotificationListTask;
  if ([(TRIBaseTask *)&v18 isEqual:v4])
  {
    v5 = (id *)v4;
    id v6 = self->_startingFetchDateOverride;
    id v7 = (NSDate *)v5[6];
    if (v6 == v7)
    {
    }
    else
    {
      id v8 = v7;
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9)
      {

        goto LABEL_23;
      }
      BOOL v11 = [(NSDate *)v6 isEqualToDate:v7];

      if (!v11) {
        goto LABEL_23;
      }
    }
    if ([(TRITaskAttributing *)self->_taskAttribution isEqual:v5[8]])
    {
      uint64_t v12 = self->_namespaceNames;
      uint64_t v13 = (NSSet *)v5[7];
      if (v12 == v13)
      {

LABEL_22:
        BOOL v10 = 1;
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v14 = v13;
      if (v12) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15)
      {
      }
      else
      {
        BOOL v16 = [(NSSet *)v12 isEqualToSet:v13];

        if (v16) {
          goto LABEL_22;
        }
      }
    }
LABEL_23:
    BOOL v10 = 0;
    goto LABEL_24;
  }
  BOOL v10 = 0;
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)TRIFetchRolloutNotificationListTask;
  unint64_t v3 = [(TRIBaseTask *)&v8 hash];
  startingFetchDateOverride = self->_startingFetchDateOverride;
  if (startingFetchDateOverride) {
    uint64_t v5 = [(NSDate *)startingFetchDateOverride hash];
  }
  else {
    uint64_t v5 = 0;
  }
  namespaceNames = self->_namespaceNames;
  if (namespaceNames) {
    namespaceNames = (NSSet *)[(NSSet *)namespaceNames hash];
  }
  return [(TRITaskAttributing *)self->_taskAttribution hash]
       + 37 * ((void)namespaceNames + 1369 * v3 + 37 * v5);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%@,%@>", objc_opt_class(), self->_startingFetchDateOverride, self->_namespaceNames];
}

- (void)_addMetric:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  metrics = v4->_metrics;
  if (!metrics)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = v4->_metrics;
    v4->_metrics = (NSMutableArray *)v6;

    metrics = v4->_metrics;
  }
  [(NSMutableArray *)metrics addObject:v8];
  objc_sync_exit(v4);
}

- (void)_addDimension:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  dimensions = v4->_dimensions;
  if (!dimensions)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = v4->_dimensions;
    v4->_dimensions = (NSMutableArray *)v6;

    dimensions = v4->_dimensions;
  }
  [(NSMutableArray *)dimensions addObject:v8];
  objc_sync_exit(v4);
}

- (id)metrics
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = (void *)[(NSMutableArray *)v2->_metrics copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)dimensions
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = (void *)[(NSMutableArray *)v2->_dimensions copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)trialSystemTelemetry
{
  return +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:self->_taskAttribution];
}

- (id)_asPersistedTask
{
  unint64_t v3 = objc_opt_new();
  id v4 = [(TRITaskAttributing *)self->_taskAttribution asPersistedTaskAttribution];
  [v3 setTaskAttribution:v4];

  if (self->_startingFetchDateOverride)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB05F0]) initWithDate:self->_startingFetchDateOverride];
    [v3 setEarliestTimestamp:v5];
  }
  if ([(NSSet *)self->_namespaceNames count])
  {
    uint64_t v6 = [(NSSet *)self->_namespaceNames allObjects];
    id v7 = (void *)[v6 mutableCopy];
    [v3 setNamespacesArray:v7];
  }
  objc_msgSend(v3, "setRetryCount:", -[TRIFetchRolloutNotificationListTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  id v4 = [(TRIFetchRolloutNotificationListTask *)self _asPersistedTask];
  uint64_t v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    BOOL v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIFetchRolloutNotificationListTask.m", 318, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  id v4 = +[TRIPBMessage parseFromData:a3 error:&v18];
  id v5 = v18;
  if (!v4)
  {
    id v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v5;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIFetchRolloutNotificationListPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (([v4 hasTaskAttribution] & 1) == 0)
  {
    id v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412290;
      id v20 = v17;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: taskAttribution", buf, 0xCu);
    }
LABEL_10:
    BOOL v10 = 0;
    goto LABEL_23;
  }
  uint64_t v6 = [v4 taskAttribution];
  id v7 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v6];

  if (v7)
  {
    if ([v4 hasEarliestTimestamp])
    {
      id v8 = [v4 earliestTimestamp];
      BOOL v9 = [v8 date];
    }
    else
    {
      BOOL v9 = 0;
    }
    if (objc_msgSend(v4, "namespacesArray_Count"))
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v12 = [v4 namespacesArray];
      uint64_t v13 = (void *)[v11 initWithArray:v12];
    }
    else
    {
      uint64_t v13 = 0;
    }
    BOOL v10 = (void *)[objc_alloc((Class)a1) initWithStartingFetchDateOverride:v9 namespaceNames:v13 taskAttribution:v7];
    if ([v4 hasRetryCount]) {
      uint64_t v14 = [v4 retryCount];
    }
    else {
      uint64_t v14 = 0;
    }
    [v10 setRetryCount:v14];
  }
  else
  {
    BOOL v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    BOOL v10 = 0;
  }

LABEL_23:
  return v10;
}

- (unint64_t)requiredCapabilities
{
  unint64_t v3 = [(TRITaskAttributing *)self->_taskAttribution networkOptions];
  unint64_t v4 = [v3 requiredCapability];

  if ([(TRIFetchRolloutNotificationListTask *)self retryCount]) {
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

- (TRIFetchRolloutNotificationListTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchRolloutNotificationListTask;
  id v5 = [(TRIFetchRolloutNotificationListTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRIFetchRolloutNotificationListTask.m", 363, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIFetchRolloutNotificationListTask *)self serialize];
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
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_namespaceNames, 0);
  objc_storeStrong((id *)&self->_startingFetchDateOverride, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end