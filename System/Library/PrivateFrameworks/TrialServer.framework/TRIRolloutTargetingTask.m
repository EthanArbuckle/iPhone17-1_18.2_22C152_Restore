@interface TRIRolloutTargetingTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithRolloutDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)dependencies;
- (NSArray)tags;
- (NSString)description;
- (TRIRolloutDeployment)rolloutDeployment;
- (TRIRolloutTargetingTask)initWithCoder:(id)a3;
- (TRIRolloutTargetingTask)initWithRolloutDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6;
- (id)_asPersistedTask;
- (id)_categoricalValueForTriggerEvent:(unint64_t)a3;
- (id)_runTaskUsingContext:(id)a3 withTaskQueue:(id)a4 rolloutTargeter:(id)a5 error:(id *)a6;
- (id)_systemCovariatesWithPaths:(id)a3;
- (id)_taskResultWithStatus:(int)a3 reportResults:(BOOL)a4 nextTasks:(id)a5;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)taskType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)runDequeueHandlerUsingContext:(id)a3;
- (void)runEnqueueHandlerUsingContext:(id)a3;
@end

@implementation TRIRolloutTargetingTask

- (int)taskType
{
  return 22;
}

- (TRIRolloutTargetingTask)initWithRolloutDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRIRolloutTargetingTask.m", 72, @"Invalid parameter not satisfying: %@", @"rolloutDeployment" object file lineNumber description];
  }
  if ([v11 deploymentId] == -1)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"TRIRolloutTargetingTask.m", 73, @"Invalid parameter not satisfying: %@", @"rolloutDeployment.deploymentId != kTRIUnspecifiedDeploymentId" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)TRIRolloutTargetingTask;
  v13 = [(TRIRolloutTargetingTask *)&v29 init];
  if (v13)
  {
    v14 = [[TRIRolloutTaskSupport alloc] initWithRolloutDeployment:v11];
    support = v13->_support;
    v13->_support = v14;

    v13->_includeDependencies = a4;
    objc_storeStrong((id *)&v13->_taskAttribution, a5);
    v13->_triggerEvent = a6;
    v16 = objc_opt_new();
    v17 = [v11 rolloutId];
    v18 = [v16 ensureRolloutFields];
    [v18 setClientRolloutId:v17];

    v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "deploymentId"));
    v20 = [v19 stringValue];
    [v16 setClientDeploymentId:v20];

    v21 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v12];
    v22 = v13->_support;
    v23 = (void *)MEMORY[0x1E4FB05A8];
    v24 = [(TRIRolloutTargetingTask *)v13 _categoricalValueForTriggerEvent:v13->_triggerEvent];
    v25 = [v23 metricWithName:@"trigger_event" categoricalValue:v24];
    [(TRIRolloutTaskSupport *)v22 addMetric:v25];

    [(TRIRolloutTaskSupport *)v13->_support mergeTelemetry:v16];
    [(TRIRolloutTaskSupport *)v13->_support mergeTelemetry:v21];
  }
  return v13;
}

+ (id)taskWithRolloutDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [[TRIRolloutTargetingTask alloc] initWithRolloutDeployment:v10 includeDependencies:v7 taskAttribution:v9 triggerEvent:a6];

  return v11;
}

- (TRIRolloutDeployment)rolloutDeployment
{
  return [(TRIRolloutTaskSupport *)self->_support rolloutDeployment];
}

- (NSArray)tags
{
  return (NSArray *)[(TRIRolloutTaskSupport *)self->_support tags];
}

- (NSArray)dependencies
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_includeDependencies)
  {
    v3 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
    v4 = +[TRIFetchSingleRolloutNotificationTask taskWithDeployment:v3 taskAttributing:self->_taskAttribution];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)runEnqueueHandlerUsingContext:(id)a3
{
  id v4 = a3;
  v5 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  id v7 = +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:v5];

  v6 = [v4 contentTracker];

  [v6 addRefWithContentIdentifier:v7];
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  v6 = +[TRIContentTracker contentIdentifierForRolloutArtifactWithDeployment:v5];

  id v7 = [v4 contentTracker];

  LOBYTE(v4) = [v7 dropRefWithContentIdentifier:v6];
  if ((v4 & 1) == 0)
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
      id v10 = [v9 shortDesc];
      int v11 = 138543362;
      id v12 = v10;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for rollout %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)_systemCovariatesWithPaths:(id)a3
{
  id v3 = a3;
  id v4 = [[TRISystemCovariates alloc] initWithPaths:v3];

  return v4;
}

- (id)_runTaskUsingContext:(id)a3 withTaskQueue:(id)a4 rolloutTargeter:(id)a5 error:(id *)a6
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2, self, @"TRIRolloutTargetingTask.m", 138, @"Invalid parameter not satisfying: %@", @"context != nil" object file lineNumber description];
  }
  v71 = v12;
  if (v12)
  {
    if (v13) {
      goto LABEL_5;
    }
LABEL_30:
    v66 = [MEMORY[0x1E4F28B00] currentHandler];
    [v66 handleFailureInMethod:a2, self, @"TRIRolloutTargetingTask.m", 140, @"Invalid parameter not satisfying: %@", @"targeter != nil" object file lineNumber description];

    if (a6) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
  v65 = [MEMORY[0x1E4F28B00] currentHandler];
  [v65 handleFailureInMethod:a2, self, @"TRIRolloutTargetingTask.m", 139, @"Invalid parameter not satisfying: %@", @"taskQueue != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_30;
  }
LABEL_5:
  if (a6) {
    goto LABEL_6;
  }
LABEL_31:
  v67 = [MEMORY[0x1E4F28B00] currentHandler];
  [v67 handleFailureInMethod:a2, self, @"TRIRolloutTargetingTask.m", 141, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];

LABEL_6:
  v14 = [v11 rolloutDatabase];
  v15 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  v16 = [v14 recordWithDeployment:v15 usingTransaction:0];

  if (v16)
  {
    v17 = [v16 rampId];

    if (v17)
    {
      v18 = objc_opt_new();
      v19 = [v16 rampId];
      v20 = [v18 ensureRolloutFields];
      [v20 setClientRampId:v19];

      [(TRIRolloutTaskSupport *)self->_support mergeTelemetry:v18];
    }
  }
  else
  {
    v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
      v23 = [v22 shortDesc];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "Warning: unable to find TRIRolloutRecord for deployment %{public}@; issuing incomplete telemetry.",
        (uint8_t *)&buf,
        0xCu);
    }
  }
  id v77 = 0;
  unsigned __int8 v76 = 1;
  char v75 = 0;
  v24 = [TRIRolloutTargetingOperation alloc];
  v25 = [v11 rolloutDatabase];
  v26 = [(TRIRolloutTargetingOperation *)v24 initWithRolloutTargeter:v13 rolloutDatabase:v25 context:v11];

  v27 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  BOOL v28 = [(TRIRolloutTargetingOperation *)v26 targetRolloutDeployment:v27 appendingTelemetryToSupport:self->_support reportTelemetryToServer:&v76 factorPackSetIdToActivate:&v77 shouldDisenroll:&v75 error:a6];

  if (!v28)
  {
    v37 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
    v38 = [v37 rolloutId];
    v39 = [v16 rampId];
    v40 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
    uint64_t v41 = [v40 deploymentId];
    LOBYTE(v68) = 0;
    +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:5 forRollout:v38 ramp:v39 deployment:v41 fps:v77 namespaces:0 telemetryMetric:0 rolloutRecord:v16 isBecomingObsolete:v68 context:v11];

    uint64_t v42 = [(TRIRolloutTargetingTask *)self _taskResultWithStatus:3 reportResults:1 nextTasks:0];
LABEL_16:
    v36 = (void *)v42;
    goto LABEL_17;
  }
  if (v75)
  {
    objc_super v29 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
    v30 = [v29 rolloutId];
    v86[0] = self;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:1];
    [v71 cancelTasksWithTag:v30 excludingTasks:v31];

    v32 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
    v33 = [v32 rolloutId];
    v34 = +[TRIDisenrollRolloutTask taskWithRolloutId:v33 triggerEvent:2];
    v85 = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];

    v36 = [(TRIRolloutTargetingTask *)self _taskResultWithStatus:2 reportResults:v76 nextTasks:v35];

    goto LABEL_17;
  }
  if (!v77)
  {
    uint64_t v42 = [(TRIRolloutTargetingTask *)self _taskResultWithStatus:2 reportResults:0 nextTasks:0];
    goto LABEL_16;
  }
  if (self->_triggerEvent != 2)
  {
    v44 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
    v45 = [v44 rolloutId];
    v84 = self;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
    [v71 cancelTasksWithTag:v45 excludingTasks:v46];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__52;
  v82 = __Block_byref_object_dispose__52;
  id v83 = (id)objc_opt_new();
  v47 = [(TRITaskAttributing *)self->_taskAttribution networkOptions];
  int v48 = [v47 allowsCellularAccess];

  if (v48)
  {
    v49 = (void *)MEMORY[0x1E016E7F0]();
    v50 = [v11 rolloutDatabase];
    v51 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
    v52 = [v50 recordWithDeployment:v51 usingTransaction:0];

    if (v52)
    {
      v53 = [v52 artifact];
      v54 = [v53 rollout];

      v55 = [v54 selectedNamespaceArray];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __84__TRIRolloutTargetingTask__runTaskUsingContext_withTaskQueue_rolloutTargeter_error___block_invoke;
      v72[3] = &unk_1E6BBDFC0;
      id v73 = v11;
      p_long long buf = &buf;
      [v55 enumerateObjectsUsingBlock:v72];
    }
  }
  v56 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  v57 = [v77 ident];
  v58 = +[TRIActivateTargetedRolloutDeploymentTask taskWithDeployment:v56 factorPackSetId:v57 taskAttribution:self->_taskAttribution capabilityModifier:*(void *)(*((void *)&buf + 1) + 40)];
  v78 = v58;
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];

  v70 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  v59 = [v70 rolloutId];
  v60 = [v16 rampId];
  v61 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  uint64_t v62 = [v61 deploymentId];
  v63 = [v77 ident];
  LOBYTE(v68) = 0;
  +[TRITaskUtils updateRolloutHistoryDatabaseWithAllocationStatus:1 forRollout:v59 ramp:v60 deployment:v62 fps:v63 namespaces:0 telemetryMetric:0 rolloutRecord:v16 isBecomingObsolete:v68 context:v11];

  v36 = [(TRIRolloutTargetingTask *)self _taskResultWithStatus:2 reportResults:v76 nextTasks:v69];

  _Block_object_dispose(&buf, 8);
LABEL_17:

  return v36;
}

void __84__TRIRolloutTargetingTask__runTaskUsingContext_withTaskQueue_rolloutTargeter_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = (void *)MEMORY[0x1E4FB01A0];
  v8 = [v6 name];
  id v9 = [*(id *)(a1 + 32) paths];
  id v10 = [v9 namespaceDescriptorsDefaultDir];
  id v11 = [v7 loadWithNamespaceName:v8 fromDirectory:v10];

  if (([v11 expensiveNetworkingAllowed] & 1) == 0)
  {
    id v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v6 name];
      int v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Changing TRIFetchFactorPackSetTask to require inexpensive networking since %@ does not support expensive networking", (uint8_t *)&v17, 0xCu);
    }
    v14 = [[TRITaskCapabilityModifier alloc] initWithAdd:1 remove:2];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
  }
}

- (id)_taskResultWithStatus:(int)a3 reportResults:(BOOL)a4 nextTasks:(id)a5
{
  if (!a5) {
    a5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return +[TRITaskRunResult resultWithRunStatus:*(void *)&a3 reportResultToServer:a4 nextTasks:a5 earliestRetryDate:0];
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E016E7F0]();
  id v9 = [v6 paths];
  id v10 = [(TRIRolloutTargetingTask *)self _systemCovariatesWithPaths:v9];

  id v11 = [[TRIUserCovariates alloc] initWithContext:v6];
  id v12 = [TRIRolloutTargeter alloc];
  id v13 = [v6 rolloutDatabase];
  v14 = [(TRIRolloutTargeter *)v12 initWithDatabase:v13 systemCovariateProvider:v10 userCovariateProvider:v11];

  id v17 = 0;
  uint64_t v15 = [(TRIRolloutTargetingTask *)self _runTaskUsingContext:v6 withTaskQueue:v7 rolloutTargeter:v14 error:&v17];

  return v15;
}

- (id)_categoricalValueForTriggerEvent:(unint64_t)a3
{
  if (a3 == 1) {
    return @"hotfix";
  }
  else {
    return @"routine-fetch";
  }
}

- (id)metrics
{
  return [(TRIRolloutTaskSupport *)self->_support metrics];
}

- (id)dimensions
{
  return [(TRIRolloutTaskSupport *)self->_support dimensions];
}

- (id)trialSystemTelemetry
{
  return [(TRIRolloutTaskSupport *)self->_support trialSystemTelemetry];
}

- (id)_asPersistedTask
{
  id v3 = objc_opt_new();
  id v4 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  v5 = [v4 rolloutId];
  [v3 setRolloutId:v5];

  id v6 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  [v3 setIncludeDependencies:self->_includeDependencies];
  id v7 = [(TRITaskAttributing *)self->_taskAttribution asPersistedTaskAttribution];
  [v3 setTaskAttribution:v7];

  unint64_t triggerEvent = self->_triggerEvent;
  if (triggerEvent <= 2) {
    [v3 setTriggerEvent:(triggerEvent + 1)];
  }
  return v3;
}

- (id)serialize
{
  id v4 = [(TRIRolloutTargetingTask *)self _asPersistedTask];
  v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIRolloutTargetingTask.m", 311, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v26 = 0;
  id v3 = +[TRIPBMessage parseFromData:a3 error:&v26];
  id v4 = v26;
  if (!v3)
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v28 = v4;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIRolloutTargetingPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_27;
  }
  if (([v3 hasRolloutId] & 1) == 0)
  {
    id v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)long long buf = 138412290;
      id v28 = v22;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rolloutId", buf, 0xCu);
    }
    v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    *(_DWORD *)long long buf = 138412290;
    id v28 = v13;
    v14 = "Cannot decode message of type %@ with missing field: rolloutId";
    goto LABEL_26;
  }
  v5 = [v3 rolloutId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v15);
    *(_DWORD *)long long buf = 138412290;
    id v28 = v13;
    v14 = "Cannot decode message of type %@ with field of length 0: rolloutId";
LABEL_26:
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);

    goto LABEL_27;
  }
  if (([v3 hasDeploymentId] & 1) == 0)
  {
    v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    v16 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v16);
    *(_DWORD *)long long buf = 138412290;
    id v28 = v13;
    v14 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_26;
  }
  if (([v3 hasIncludeDependencies] & 1) == 0)
  {
    v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    id v17 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v17);
    *(_DWORD *)long long buf = 138412290;
    id v28 = v13;
    v14 = "Cannot decode message of type %@ with missing field: includeDependencies";
    goto LABEL_26;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v18);
      *(_DWORD *)long long buf = 138412290;
      id v28 = v13;
      v14 = "Cannot decode message of type %@ with missing field: taskAttribution";
      goto LABEL_26;
    }
LABEL_27:
    uint64_t v19 = 0;
    goto LABEL_28;
  }
  id v7 = [v3 taskAttribution];
  v8 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v7];

  if (v8)
  {
    if ([v3 hasTriggerEvent])
    {
      int v9 = [v3 triggerEvent];
      if (v9 == 3) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = v9 == 2;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v24 = objc_alloc(MEMORY[0x1E4FB0228]);
    v25 = [v3 rolloutId];
    v23 = objc_msgSend(v24, "initWithRolloutId:deploymentId:", v25, objc_msgSend(v3, "deploymentId"));

    uint64_t v19 = objc_msgSend((id)objc_opt_class(), "taskWithRolloutDeployment:includeDependencies:taskAttribution:triggerEvent:", v23, objc_msgSend(v3, "includeDependencies"), v8, v10);
  }
  else
  {
    v23 = TRILogCategory_Server();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    uint64_t v19 = 0;
  }

LABEL_28:
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TRIRolloutTargetingTask;
  if ([(TRIBaseTask *)&v10 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
    id v7 = [v5 rolloutDeployment];

    char v8 = [v6 isEqualToDeployment:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)TRIRolloutTargetingTask;
  unint64_t v3 = [(TRIBaseTask *)&v7 hash];
  id v4 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  unint64_t v5 = [v4 hash] + 37 * v3;

  return v5;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(TRIRolloutTargetingTask *)self rolloutDeployment];
  uint64_t v6 = [v5 shortDesc];
  objc_super v7 = (void *)[v3 initWithFormat:@"<%@:%@>", v4, v6];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRolloutTargetingTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRolloutTargetingTask;
  unint64_t v5 = [(TRIRolloutTargetingTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRIRolloutTargetingTask.m", 388, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  unint64_t v5 = [(TRIRolloutTargetingTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_support, 0);
}

@end