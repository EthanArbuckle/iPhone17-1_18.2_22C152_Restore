@interface TRIDeactivateBMLTDeploymentTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithBMLTDeployment:(id)a3 triggerEvent:(unint64_t)a4;
+ (id)taskWithBMLTDeployment:(id)a3 triggerEvent:(unint64_t)a4 bmltBatchNotificationIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)tags;
- (NSString)description;
- (TRIDeactivateBMLTDeploymentTask)initWithBMLTDeployment:(id)a3 triggerEvent:(unint64_t)a4 bmltBatchNotificationIdentifier:(id)a5;
- (TRIDeactivateBMLTDeploymentTask)initWithCoder:(id)a3;
- (id)_asPersistedTask;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)taskType;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)_deactivationTelemetryWithSuccess:(BOOL)a3 bmltRecord:(id)a4 deactivatedFactorPackSetId:(id)a5 serverContext:(id)a6;
- (void)addMetric:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeTelemetry:(id)a3;
@end

@implementation TRIDeactivateBMLTDeploymentTask

- (TRIDeactivateBMLTDeploymentTask)initWithBMLTDeployment:(id)a3 triggerEvent:(unint64_t)a4 bmltBatchNotificationIdentifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRIDeactivateBMLTDeploymentTask.m", 87, @"Invalid parameter not satisfying: %@", @"bmltDeployment" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)TRIDeactivateBMLTDeploymentTask;
  v12 = [(TRIDeactivateBMLTDeploymentTask *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bmltDeployment, a3);
    v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (a4 - 1 > 5) {
        v21 = @"unknown";
      }
      else {
        v21 = off_1E6BBE810[a4 - 1];
      }
      *(_DWORD *)buf = 138412290;
      v25 = v21;
      _os_log_debug_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEBUG, "Initializing TRIDeactivateBMLTDeploymentTask with trigger event: %@", buf, 0xCu);
    }

    v13->_triggerEvent = a4;
    objc_storeStrong((id *)&v13->_bmltBatchNotificationIdentifier, a5);
    v15 = objc_opt_new();
    v16 = (void *)v15[1];
    v15[1] = 0;

    v17 = (void *)v15[2];
    v15[2] = 0;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v15];
    lock = v13->_lock;
    v13->_lock = (_PASLock *)v18;
  }
  return v13;
}

+ (id)taskWithBMLTDeployment:(id)a3 triggerEvent:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithBMLTDeployment:v6 triggerEvent:a4 bmltBatchNotificationIdentifier:0];

  return v7;
}

+ (id)taskWithBMLTDeployment:(id)a3 triggerEvent:(unint64_t)a4 bmltBatchNotificationIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithBMLTDeployment:v9 triggerEvent:a4 bmltBatchNotificationIdentifier:v8];

  return v10;
}

- (int)taskType
{
  return 32;
}

- (NSArray)tags
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(TRIBMLTDeployment *)self->_bmltDeployment taskTag];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__61;
  v47 = __Block_byref_object_dispose__61;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__61;
  v41 = __Block_byref_object_dispose__61;
  id v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__61;
  v35 = __Block_byref_object_dispose__61;
  id v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __65__TRIDeactivateBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke;
  v20 = &unk_1E6BBE778;
  v21 = self;
  objc_super v23 = &v27;
  id v8 = v6;
  id v22 = v8;
  v24 = &v37;
  v25 = &v43;
  uint64_t v26 = &v31;
  id v9 = (void *)MEMORY[0x1E016EA80](&v17);
  id v10 = objc_msgSend(v8, "bmltDatabase", v17, v18, v19, v20, v21);
  [v10 writeTransactionWithFailableBlock:v9];

  bmltBatchNotificationIdentifier = self->_bmltBatchNotificationIdentifier;
  if (bmltBatchNotificationIdentifier) {
    notify_post([(NSString *)bmltBatchNotificationIdentifier UTF8String]);
  }
  if (*((unsigned char *)v28 + 24))
  {
    [MEMORY[0x1E4FB01E8] notifyUpdateForNamespaceName:v32[5]];
    BOOL v12 = *((unsigned char *)v28 + 24) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  [(TRIDeactivateBMLTDeploymentTask *)self _deactivationTelemetryWithSuccess:v12 bmltRecord:v44[5] deactivatedFactorPackSetId:v38[5] serverContext:v8];
  v13 = [TRITaskRunResult alloc];
  if (*((unsigned char *)v28 + 24)) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 3;
  }
  v15 = [(TRITaskRunResult *)v13 initWithRunStatus:v14 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v15;
}

uint64_t __65__TRIDeactivateBMLTDeploymentTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  v5 = [*(id *)(a1 + 40) bmltDatabase];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 deactivateTaskDeployment:v4 deactivatedFactorPackSetId:*(void *)(*(void *)(a1 + 56) + 8) + 40 usingTransaction:v3];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = [*(id *)(a1 + 40) bmltDatabase];
    uint64_t v7 = [v6 taskRecordWithTaskDeployment:v4];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (v4)
    {
      if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) status] == 1)
      {
        id v10 = +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:v4];
        id v11 = [*(id *)(a1 + 40) contentTracker];
        char v12 = [v11 dropRefWithContentIdentifier:v10];

        if ((v12 & 1) == 0)
        {
          v13 = TRILogCategory_Server();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v46 = [v4 backgroundMLTaskId];
            int v47 = [v4 deploymentId];
            id v48 = (objc_class *)objc_opt_class();
            v49 = NSStringFromClass(v48);
            *(_DWORD *)buf = 138543874;
            v52 = v46;
            __int16 v53 = 1024;
            int v54 = v47;
            __int16 v55 = 2114;
            v56 = v49;
            _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unable to decrement ref for BMLT deployment: (r: %{public}@, d: %d) in %{public}@", buf, 0x1Cu);
          }
        }
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v14 = [*(id *)(a1 + 40) activationEventDatabase];
        v15 = [v4 backgroundMLTaskId];
        v16 = objc_msgSend(v14, "activationEventRecordWithParentId:factorPackSetId:deploymentId:", v15, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), objc_msgSend(v4, "deploymentId"));

        if (v16)
        {
          uint64_t v17 = objc_opt_new();
          uint64_t v18 = [v16 osBuild];
          [v17 setPrevOsBuild:v18];

          v19 = [v16 regionCode];
          [v17 setPrevRegionCode:v19];

          v20 = [v16 languageCode];
          [v17 setPrevLanguageCode:v20];

          v21 = NSString;
          id v22 = [v16 languageCode];
          objc_super v23 = [v16 regionCode];
          if (v23)
          {
            v24 = [v16 regionCode];
            v25 = [v21 stringWithFormat:@"%@-%@", v22, v24];
          }
          else
          {
            v25 = [v21 stringWithFormat:@"%@-%@", v22, &stru_1F3455898];
          }

          [v17 setPrevBcp47DeviceLocale:v25];
          uint64_t v27 = [v16 carrierBundleIdentifier];
          [v17 setPrevCarrierBundleIdentifier:v27];

          v28 = [v16 carrierCountryIsoCode];
          [v17 setPrevCarrierCountryIsoCode:v28];

          [*(id *)(a1 + 32) mergeTelemetry:v17];
          uint64_t v29 = [*(id *)(a1 + 40) activationEventDatabase];
          char v30 = [v4 backgroundMLTaskId];
          uint64_t v31 = objc_msgSend(v29, "deleteRecordWithParentId:factorPackSetId:deploymentId:", v30, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), objc_msgSend(v4, "deploymentId"));

          if (!v31)
          {
            v32 = TRILogCategory_Server();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v50 = [v4 backgroundMLTaskId];
              *(_DWORD *)buf = 138543362;
              v52 = v50;
              _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Unable to clear record for deactivated BMLT: %{public}@", buf, 0xCu);
            }
          }
        }
      }
    }
    uint64_t v33 = [TRINamespaceResolverStorage alloc];
    v34 = [*(id *)(a1 + 40) paths];
    v35 = [(TRINamespaceResolverStorage *)v33 initWithPaths:v34];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [(TRINamespaceResolverStorage *)v35 overwriteActiveFactorProvidersUsingTransaction:v3 fromContext:*(void *)(a1 + 40)];
    id v36 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      uint64_t v37 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    }
    else {
      uint64_t v37 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
    }
    if (v4)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        v38 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        uint64_t v37 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
        if (v38)
        {
          uint64_t v39 = [v38 artifact];
          v40 = [v39 backgroundTask];
          v41 = [v40 selectedNamespace];
          uint64_t v42 = [v41 name];
          uint64_t v43 = *(void *)(*(void *)(a1 + 72) + 8);
          v44 = *(void **)(v43 + 40);
          *(void *)(v43 + 40) = v42;

          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
            uint64_t v37 = v36;
          }
        }
      }
    }
    uint64_t v26 = *v37;
  }
  else
  {
    uint64_t v26 = *MEMORY[0x1E4F93BF0];
  }

  return v26;
}

- (void)_deactivationTelemetryWithSuccess:(BOOL)a3 bmltRecord:(id)a4 deactivatedFactorPackSetId:(id)a5 serverContext:(id)a6
{
  BOOL v8 = a3;
  id v10 = (void *)MEMORY[0x1E4FB05A8];
  unint64_t v11 = self->_triggerEvent - 1;
  if (v11 > 5) {
    char v12 = @"unknown";
  }
  else {
    char v12 = off_1E6BBE810[v11];
  }
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = [v10 metricWithName:@"trigger_event" categoricalValue:v12];
  [(TRIDeactivateBMLTDeploymentTask *)self addMetric:v16];

  uint64_t v17 = [(TRIBMLTDeployment *)self->_bmltDeployment backgroundMLTaskId];
  +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:v17 deploymentId:[(TRIBMLTDeployment *)self->_bmltDeployment deploymentId] eventType:2 succeeded:v8];

  id v20 = [(TRIBMLTDeployment *)self->_bmltDeployment backgroundMLTaskId];
  uint64_t v18 = [(TRIBMLTDeployment *)self->_bmltDeployment deploymentId];
  if (v8) {
    uint64_t v19 = 10;
  }
  else {
    uint64_t v19 = 9;
  }
  +[TRITaskUtils updateBMLTHistoryDatabaseWithAllocationStatus:v19 forBMLT:v20 deployment:v18 fps:v14 bmltRecord:v15 context:v13];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIDeactivateBMLTDeploymentTask *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TRIDeactivateBMLTDeploymentTask;
    if ([(TRIBaseTask *)&v7 isEqual:v4]
      && [(TRIDeactivateBMLTDeploymentTask *)v4 isMemberOfClass:objc_opt_class()])
    {
      char v5 = [(TRIBMLTDeployment *)self->_bmltDeployment isEqualToDeployment:v4->_bmltDeployment];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)TRIDeactivateBMLTDeploymentTask;
  unint64_t v3 = [(TRIBaseTask *)&v5 hash];
  return [(TRIBMLTDeployment *)self->_bmltDeployment hash] + 37 * v3;
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__TRIDeactivateBMLTDeploymentTask_addMetric___block_invoke;
  v7[3] = &unk_1E6BBE7A0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __45__TRIDeactivateBMLTDeploymentTask_addMetric___block_invoke(uint64_t a1, void *a2)
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
  v7[2] = __50__TRIDeactivateBMLTDeploymentTask_mergeTelemetry___block_invoke;
  v7[3] = &unk_1E6BBE7A0;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __50__TRIDeactivateBMLTDeploymentTask_mergeTelemetry___block_invoke(uint64_t a1, void *a2)
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
  id v9 = __Block_byref_object_copy__61;
  id v10 = __Block_byref_object_dispose__61;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __42__TRIDeactivateBMLTDeploymentTask_metrics__block_invoke;
  v5[3] = &unk_1E6BBE7C8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void *__42__TRIDeactivateBMLTDeploymentTask_metrics__block_invoke(uint64_t a1, uint64_t a2)
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
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__61;
  char v12 = __Block_byref_object_dispose__61;
  id v13 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__TRIDeactivateBMLTDeploymentTask_trialSystemTelemetry__block_invoke;
  v7[3] = &unk_1E6BBE7F0;
  void v7[4] = self;
  v7[5] = &v8;
  [(_PASLock *)lock runWithLockAcquired:v7];
  objc_super v5 = (void *)[(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __55__TRIDeactivateBMLTDeploymentTask_trialSystemTelemetry__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = (void *)v11[2];
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

  id v9 = [*(id *)(*(void *)(a1 + 32) + 24) backgroundMLTaskId];
  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) ensureBMLTFields];
  [v10 setClientBmltId:v9];
}

- (id)dimensions
{
  return 0;
}

- (id)_asPersistedTask
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(TRIBMLTDeployment *)self->_bmltDeployment backgroundMLTaskId];
  [v3 setBackgroundMlTaskId:v4];

  objc_msgSend(v3, "setDeploymentId:", -[TRIBMLTDeployment deploymentId](self->_bmltDeployment, "deploymentId"));
  unint64_t triggerEvent = self->_triggerEvent;
  if (triggerEvent <= 6) {
    [v3 setTriggerEvent:(triggerEvent + 1)];
  }
  if (self->_bmltBatchNotificationIdentifier) {
    objc_msgSend(v3, "setBmltBatchNotificationId:");
  }
  return v3;
}

- (id)serialize
{
  uint64_t v4 = [(TRIDeactivateBMLTDeploymentTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIDeactivateBMLTDeploymentTask.m", 348, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v24 = 0;
  uint64_t v4 = +[TRIPBMessage parseFromData:a3 error:&v24];
  id v5 = v24;
  if (!v4)
  {
    char v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v5;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIDeactivateBMLTDeploymentPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_21;
  }
  if (([v4 hasBackgroundMlTaskId] & 1) == 0)
  {
    id v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v22 = (objc_class *)objc_opt_class();
      objc_super v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138412290;
      id v26 = v23;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: backgroundMlTaskId", buf, 0xCu);
    }
    char v12 = TRILogCategory_Server();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138412290;
    id v26 = v17;
    uint64_t v18 = "Cannot decode message of type %@ with missing field: backgroundMlTaskId";
    goto LABEL_20;
  }
  uint64_t v6 = [v4 backgroundMlTaskId];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    if ([v4 hasDeploymentId])
    {
      uint64_t v8 = [v4 triggerEvent] - 2;
      if (v8 < 6) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v10 = (void *)MEMORY[0x1E4FB0078];
      id v11 = [v4 backgroundMlTaskId];
      char v12 = objc_msgSend(v10, "deploymentWithBackgroundMLTaskId:deploymentId:", v11, objc_msgSend(v4, "deploymentId"));

      if ([v4 hasBmltBatchNotificationId])
      {
        id v13 = [v4 bmltBatchNotificationId];
        id v14 = [a1 taskWithBMLTDeployment:v12 triggerEvent:v9 bmltBatchNotificationIdentifier:v13];
      }
      else
      {
        id v14 = [a1 taskWithBMLTDeployment:v12 triggerEvent:v9 bmltBatchNotificationIdentifier:0];
      }
      goto LABEL_22;
    }
    char v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v20 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138412290;
      id v26 = v17;
      uint64_t v18 = "Cannot decode message of type %@ with missing field: deploymentId";
      goto LABEL_20;
    }
  }
  else
  {
    char v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      uint64_t v17 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412290;
      id v26 = v17;
      uint64_t v18 = "Cannot decode message of type %@ with field of length 0: backgroundMlTaskId";
LABEL_20:
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
    }
  }
LABEL_21:
  id v14 = 0;
LABEL_22:

  return v14;
}

- (unint64_t)requiredCapabilities
{
  return 0;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TRIBMLTDeployment *)self->_bmltDeployment shortDesc];
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%@>", v4, v5];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIDeactivateBMLTDeploymentTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIDeactivateBMLTDeploymentTask;
  id v5 = [(TRIDeactivateBMLTDeploymentTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRIDeactivateBMLTDeploymentTask.m", 407, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIDeactivateBMLTDeploymentTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_bmltBatchNotificationIdentifier, 0);
  objc_storeStrong((id *)&self->_bmltDeployment, 0);
}

@end