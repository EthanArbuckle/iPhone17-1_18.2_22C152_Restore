@interface TRIDisenrollRolloutTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithRolloutId:(id)a3;
+ (id)taskWithRolloutId:(id)a3 triggerEvent:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)tags;
- (NSString)description;
- (TRIDisenrollRolloutTask)initWithCoder:(id)a3;
- (TRIDisenrollRolloutTask)initWithRolloutId:(id)a3 triggerEvent:(unint64_t)a4;
- (id)_asPersistedTask;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)taskType;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)addMetric:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeTelemetry:(id)a3;
@end

@implementation TRIDisenrollRolloutTask

- (TRIDisenrollRolloutTask)initWithRolloutId:(id)a3 triggerEvent:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIDisenrollRolloutTask.m", 77, @"Invalid parameter not satisfying: %@", @"rolloutId" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)TRIDisenrollRolloutTask;
  v9 = [(TRIDisenrollRolloutTask *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rolloutId, a3);
    v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if (a4 - 1 > 2) {
        v18 = @"unknown";
      }
      else {
        v18 = off_1E6BBB4D0[a4 - 1];
      }
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_debug_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEBUG, "Initiating TRIDisenrollRolloutTask with trigger event: %@", buf, 0xCu);
    }

    v10->_triggerEvent = a4;
    v12 = objc_opt_new();
    v13 = (void *)v12[1];
    v12[1] = 0;

    v14 = (void *)v12[2];
    v12[2] = 0;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v12];
    lock = v10->_lock;
    v10->_lock = (_PASLock *)v15;
  }
  return v10;
}

+ (id)taskWithRolloutId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithRolloutId:v4 triggerEvent:0];

  return v5;
}

+ (id)taskWithRolloutId:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithRolloutId:v6 triggerEvent:a4];

  return v7;
}

- (int)taskType
{
  return 26;
}

- (NSArray)tags
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_rolloutId;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__23;
  v83 = __Block_byref_object_dispose__23;
  id v84 = 0;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__23;
  v73 = __Block_byref_object_dispose__23;
  id v74 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__23;
  v67 = __Block_byref_object_dispose__23;
  id v68 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__23;
  v61 = __Block_byref_object_dispose__23;
  id v62 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__23;
  v55 = __Block_byref_object_dispose__23;
  id v56 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__23;
  v49 = __Block_byref_object_dispose__23;
  id v50 = (id)objc_opt_new();
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __57__TRIDisenrollRolloutTask_runUsingContext_withTaskQueue___block_invoke;
  v35[3] = &unk_1E6BBB410;
  v38 = &v75;
  id v8 = v6;
  id v36 = v8;
  v37 = self;
  v39 = &v51;
  v40 = &v57;
  v41 = &v69;
  v42 = &v45;
  v43 = &v63;
  v44 = &v79;
  v9 = (void *)MEMORY[0x1E016EA80](v35);
  v10 = [v8 rolloutDatabase];
  [v10 writeTransactionWithFailableBlock:v9];

  if (*((unsigned char *)v76 + 24))
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = (id)v80[5];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v85 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v11);
          }
          [MEMORY[0x1E4FB01E8] notifyUpdateForNamespaceName:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v85 count:16];
      }
      while (v12);
    }
  }
  unint64_t v15 = self->_triggerEvent - 1;
  if (v15 > 2) {
    v16 = @"unknown";
  }
  else {
    v16 = off_1E6BBB4D0[v15];
  }
  v17 = [MEMORY[0x1E4FB05A8] metricWithName:@"trigger_event" categoricalValue:v16];
  [(TRIDisenrollRolloutTask *)self addMetric:v17];

  if (*((unsigned char *)v76 + 24)) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 3;
  }
  uint64_t v19 = v64[5];
  if (*((unsigned char *)v76 + 24))
  {
    if (!v19) {
      goto LABEL_22;
    }
    objc_super v20 = (void *)v46[5];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __57__TRIDisenrollRolloutTask_runUsingContext_withTaskQueue___block_invoke_50;
    v28[3] = &unk_1E6BBB438;
    v30 = &v63;
    id v29 = v8;
    [v20 enumerateKeysAndObjectsUsingBlock:v28];
    v21 = v29;
  }
  else
  {
    if (!v19) {
      goto LABEL_22;
    }
    v21 = [(id)v52[5] rolloutId];
    uint64_t v22 = v70[5];
    uint64_t v23 = [(id)v52[5] deploymentId];
    LOBYTE(v27) = 0;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:8 forRollout:v21 ramp:v22 deployment:v23 fps:v58[5] namespaces:0 telemetryMetric:0 rolloutRecord:v64[5] isBecomingObsolete:v27 context:v8];
  }

LABEL_22:
  v24 = [TRITaskRunResult alloc];
  v25 = [(TRITaskRunResult *)v24 initWithRunStatus:v18 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

  return v25;
}

uint64_t __57__TRIDisenrollRolloutTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) rolloutDatabase];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 deactivateDeploymentsWithRolloutId:*(void *)(*(void *)(a1 + 40) + 24) deactivatedDeployment:*(void *)(*(void *)(a1 + 56) + 8) + 40 deactivatedFactorPackSetId:*(void *)(*(void *)(a1 + 64) + 8) + 40 deactivatedRampId:*(void *)(*(void *)(a1 + 72) + 8) + 40 deactivationStateTransitions:*(void *)(*(void *)(*(void *)(a1 + 80) + 8)+ 40) usingTransaction:v3];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      v5 = +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:"contentIdentifierForRolloutArtifactWithDeployment:"];
      id v6 = [*(id *)(a1 + 32) contentTracker];
      char v7 = [v6 dropRefWithContentIdentifier:v5];

      if ((v7 & 1) == 0)
      {
        id v8 = TRILogCategory_Server();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v41 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) rolloutId];
          int v42 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) deploymentId];
          v43 = (objc_class *)objc_opt_class();
          v44 = NSStringFromClass(v43);
          *(_DWORD *)buf = 138543874;
          uint64_t v47 = v41;
          __int16 v48 = 1024;
          int v49 = v42;
          __int16 v50 = 2114;
          uint64_t v51 = v44;
          _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Unable to decrement ref for rollout deployment: (r: %{public}@, d: %d) in %{public}@", buf, 0x1Cu);
        }
      }

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
        && *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        v9 = [*(id *)(a1 + 32) activationEventDatabase];
        v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) rolloutId];
        id v11 = objc_msgSend(v9, "activationEventRecordWithParentId:factorPackSetId:deploymentId:", v10, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "deploymentId"));

        if (v11)
        {
          uint64_t v12 = objc_opt_new();
          uint64_t v13 = [v11 osBuild];
          [v12 setPrevOsBuild:v13];

          v14 = [v11 regionCode];
          [v12 setPrevRegionCode:v14];

          unint64_t v15 = [v11 languageCode];
          [v12 setPrevLanguageCode:v15];

          v16 = NSString;
          v17 = [v11 languageCode];
          uint64_t v18 = [v11 regionCode];
          if (v18)
          {
            uint64_t v19 = [v11 regionCode];
            objc_super v20 = [v16 stringWithFormat:@"%@-%@", v17, v19];
          }
          else
          {
            objc_super v20 = [v16 stringWithFormat:@"%@-%@", v17, &stru_1F3455898];
          }

          [v12 setPrevBcp47DeviceLocale:v20];
          uint64_t v22 = [v11 carrierBundleIdentifier];
          [v12 setPrevCarrierBundleIdentifier:v22];

          uint64_t v23 = [v11 carrierCountryIsoCode];
          [v12 setPrevCarrierCountryIsoCode:v23];

          [*(id *)(a1 + 40) mergeTelemetry:v12];
          v24 = [*(id *)(a1 + 32) activationEventDatabase];
          v25 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) rolloutId];
          uint64_t v26 = objc_msgSend(v24, "deleteRecordWithParentId:factorPackSetId:deploymentId:", v25, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "deploymentId"));

          if (!v26)
          {
            uint64_t v27 = TRILogCategory_Server();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              uint64_t v45 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) rolloutId];
              *(_DWORD *)buf = 138543362;
              uint64_t v47 = v45;
              _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Unable to clear record for dis-enrolled rollout: %{public}@", buf, 0xCu);
            }
          }
        }
      }
    }
    v28 = [TRINamespaceResolverStorage alloc];
    id v29 = [*(id *)(a1 + 32) paths];
    v30 = [(TRINamespaceResolverStorage *)v28 initWithPaths:v29];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [(TRINamespaceResolverStorage *)v30 overwriteActiveFactorProvidersUsingTransaction:v3 fromContext:*(void *)(a1 + 32)];
    long long v31 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        long long v32 = [*(id *)(a1 + 32) rolloutDatabase];
        uint64_t v33 = [v32 recordWithDeployment:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) usingTransaction:v3];
        uint64_t v34 = *(void *)(*(void *)(a1 + 88) + 8);
        v35 = *(void **)(v34 + 40);
        *(void *)(v34 + 40) = v33;

        id v36 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        if (v36)
        {
          uint64_t v37 = [v36 namespaces];
          uint64_t v38 = *(void *)(*(void *)(a1 + 96) + 8);
          v39 = *(void **)(v38 + 40);
          *(void *)(v38 + 40) = v37;
        }
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        long long v31 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
      }
    }
    uint64_t v21 = *v31;
  }
  else
  {
    uint64_t v21 = *MEMORY[0x1E4F93BF0];
  }

  return v21;
}

void __57__TRIDisenrollRolloutTask_runUsingContext_withTaskQueue___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v15 = a3;
  id v5 = a2;
  int v6 = [v15 isEqualToString:@"obsoleted-unknown-previous-state"];
  char v7 = [v5 deployment];
  id v8 = [v7 rolloutId];
  v9 = [v5 rampId];
  v10 = [v5 deployment];
  uint64_t v11 = [v10 deploymentId];
  if (v6)
  {
    uint64_t v12 = [v5 targetedFactorPackSetId];
    uint64_t v13 = [v5 namespaces];

    LOBYTE(v14) = 1;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:4 forRollout:v8 ramp:v9 deployment:v11 fps:v12 namespaces:v13 telemetryMetric:0 rolloutRecord:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isBecomingObsolete:v14 context:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v12 = [v5 activeFactorPackSetId];
    uint64_t v13 = [v5 namespaces];

    LOBYTE(v14) = 0;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:4 forRollout:v8 ramp:v9 deployment:v11 fps:v12 namespaces:v13 telemetryMetric:v15 rolloutRecord:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isBecomingObsolete:v14 context:*(void *)(a1 + 32)];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIDisenrollRolloutTask *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TRIDisenrollRolloutTask;
    BOOL v5 = [(TRIBaseTask *)&v7 isEqual:v4]
      && [(TRIDisenrollRolloutTask *)v4 isMemberOfClass:objc_opt_class()]
      && [(NSString *)self->_rolloutId isEqualToString:v4->_rolloutId];
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)TRIDisenrollRolloutTask;
  unint64_t v3 = [(TRIBaseTask *)&v5 hash];
  return [(NSString *)self->_rolloutId hash] + 37 * v3;
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__TRIDisenrollRolloutTask_addMetric___block_invoke;
  v7[3] = &unk_1E6BBB460;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __37__TRIDisenrollRolloutTask_addMetric___block_invoke(uint64_t a1, void *a2)
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

- (void)mergeTelemetry:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__TRIDisenrollRolloutTask_mergeTelemetry___block_invoke;
  v7[3] = &unk_1E6BBB460;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __42__TRIDisenrollRolloutTask_mergeTelemetry___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  unint64_t v3 = (void *)v6[2];
  if (v3)
  {
    [v3 mergeFrom:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) copy];
    objc_super v5 = (void *)v6[2];
    v6[2] = v4;
  }
}

- (id)metrics
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__TRIDisenrollRolloutTask_metrics__block_invoke;
  v5[3] = &unk_1E6BBB488;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void *__34__TRIDisenrollRolloutTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a2 + 8);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [result copy];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)trialSystemTelemetry
{
  id v3 = (void *)MEMORY[0x1E016E7F0](self, a2);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__23;
  uint64_t v12 = __Block_byref_object_dispose__23;
  id v13 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__TRIDisenrollRolloutTask_trialSystemTelemetry__block_invoke;
  v7[3] = &unk_1E6BBB4B0;
  void v7[4] = self;
  v7[5] = &v8;
  [(_PASLock *)lock runWithLockAcquired:v7];
  objc_super v5 = (void *)[(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __47__TRIDisenrollRolloutTask_trialSystemTelemetry__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = a2;
  id v3 = (void *)v12[2];
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = v3;
    uint64_t v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FB0648]);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }

  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 24);
  id v11 = [*(id *)(*(void *)(v9 + 8) + 40) ensureRolloutFields];
  [v11 setClientRolloutId:v10];
}

- (id)dimensions
{
  return 0;
}

- (id)_asPersistedTask
{
  id v3 = objc_opt_new();
  [v3 setRolloutId:self->_rolloutId];
  unint64_t triggerEvent = self->_triggerEvent;
  if (triggerEvent <= 3) {
    [v3 setTriggerEvent:(triggerEvent + 1)];
  }
  return v3;
}

- (id)serialize
{
  uint64_t v4 = [(TRIDisenrollRolloutTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIDisenrollRolloutTask.m", 309, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  uint64_t v4 = +[TRIPBMessage parseFromData:a3 error:&v20];
  id v5 = v20;
  if (!v4)
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v5;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIDisenrollRolloutPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  if (([v4 hasRolloutId] & 1) == 0)
  {
    uint64_t v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412290;
      id v22 = v18;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", buf, 0xCu);
    }
    uint64_t v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138412290;
    id v22 = v14;
    id v15 = "Cannot decode message of type %@ with missing field: rolloutId";
    goto LABEL_20;
  }
  uint64_t v6 = [v4 rolloutId];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [v4 triggerEvent] - 2;
    if (v8 < 3) {
      uint64_t v9 = v8 + 1;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = [v4 rolloutId];
    id v11 = [a1 taskWithRolloutId:v10 triggerEvent:v9];
    goto LABEL_16;
  }
  uint64_t v10 = TRILogCategory_Server();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v19);
    *(_DWORD *)buf = 138412290;
    id v22 = v14;
    id v15 = "Cannot decode message of type %@ with field of length 0: rolloutId";
LABEL_20:
    _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
  }
LABEL_15:
  id v11 = 0;
LABEL_16:

  return v11;
}

- (unint64_t)requiredCapabilities
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%@>", objc_opt_class(), self->_rolloutId];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIDisenrollRolloutTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIDisenrollRolloutTask;
  id v5 = [(TRIDisenrollRolloutTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRIDisenrollRolloutTask.m", 353, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIDisenrollRolloutTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_rolloutId, 0);
}

@end