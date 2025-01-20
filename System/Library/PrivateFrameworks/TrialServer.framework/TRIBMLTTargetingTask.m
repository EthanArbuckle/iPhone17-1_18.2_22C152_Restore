@interface TRIBMLTTargetingTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithBMLTDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6;
+ (id)taskWithBMLTDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6 bmltBatchNotificationIdentifier:(id)a7;
- (BOOL)_targetBMLTDeployment:(id)a3 appendingTelemetryToSupport:(id)a4 backgroundMLTaskDatabase:(id)a5 backgroundMLTaskHistoryDatabase:(id)a6 targeter:(id)a7 reportTelemetryToServer:(BOOL *)a8 factorPackSetIdToActivate:(id *)a9 wasEnrolled:(BOOL *)a10 shouldDisenroll:(BOOL *)a11 error:(id *)a12;
- (BOOL)isEqual:(id)a3;
- (NSArray)dependencies;
- (NSArray)tags;
- (NSString)description;
- (TRIBMLTDeployment)bmltDeployment;
- (TRIBMLTTargetingTask)initWithBMLTDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6 bmltBatchNotificationIdentifier:(id)a7;
- (TRIBMLTTargetingTask)initWithCoder:(id)a3;
- (id)_asPersistedTask;
- (id)_categoricalValueForTriggerEvent:(unint64_t)a3;
- (id)_taskResultWithStatus:(int)a3 wasEnrolled:(BOOL)a4 reportResults:(BOOL)a5 nextTasks:(id)a6 bmltHistoryDatabase:(id)a7;
- (id)dimensions;
- (id)metrics;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (id)trialSystemTelemetry;
- (int)taskType;
- (unint64_t)hash;
- (void)_allocationTelemetryWithEvent:(unsigned __int8)a3 factorPackSetId:(id)a4 bmltRecord:(id)a5 context:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)runDequeueHandlerUsingContext:(id)a3;
- (void)runEnqueueHandlerUsingContext:(id)a3;
@end

@implementation TRIBMLTTargetingTask

- (int)taskType
{
  return 30;
}

- (TRIBMLTTargetingTask)initWithBMLTDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6 bmltBatchNotificationIdentifier:(id)a7
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  if (!v14)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 79, @"Invalid parameter not satisfying: %@", @"bmltDeployment" object file lineNumber description];
  }
  if ([v14 deploymentId] == -1)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 80, @"Invalid parameter not satisfying: %@", @"bmltDeployment.deploymentId != kTRIUnspecifiedDeploymentId" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)TRIBMLTTargetingTask;
  v17 = [(TRIBMLTTargetingTask *)&v33 init];
  if (v17)
  {
    v18 = [[TRIBMLTTaskSupport alloc] initWithBMLTDeployment:v14];
    support = v17->_support;
    v17->_support = v18;

    v17->_includeDependencies = a4;
    objc_storeStrong((id *)&v17->_taskAttribution, a5);
    v17->_triggerEvent = a6;
    objc_storeStrong((id *)&v17->_deployment, a3);
    objc_storeStrong((id *)&v17->_bmltBatchNotificationIdentifier, a7);
    v20 = objc_opt_new();
    v21 = [v14 backgroundMLTaskId];
    v22 = [v20 ensureBMLTFields];
    [v22 setClientBmltId:v21];

    v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "deploymentId"));
    v24 = [v23 stringValue];
    [v20 setClientDeploymentId:v24];

    v25 = +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:v15];
    v26 = v17->_support;
    v27 = (void *)MEMORY[0x1E4FB05A8];
    v28 = [(TRIBMLTTargetingTask *)v17 _categoricalValueForTriggerEvent:v17->_triggerEvent];
    v29 = [v27 metricWithName:@"trigger_event" categoricalValue:v28];
    [(TRIBMLTTaskSupport *)v26 addMetric:v29];

    [(TRIBMLTTaskSupport *)v17->_support mergeTelemetry:v20];
    [(TRIBMLTTaskSupport *)v17->_support mergeTelemetry:v25];
  }
  return v17;
}

+ (id)taskWithBMLTDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [TRIBMLTTargetingTask alloc];
  v12 = NSString;
  v13 = objc_opt_new();
  id v14 = [v13 UUIDString];
  id v15 = [v12 stringWithFormat:@"com.apple.triald.BMLTNotification.%@", v14];
  id v16 = [(TRIBMLTTargetingTask *)v11 initWithBMLTDeployment:v10 includeDependencies:v7 taskAttribution:v9 triggerEvent:a6 bmltBatchNotificationIdentifier:v15];

  return v16;
}

+ (id)taskWithBMLTDeployment:(id)a3 includeDependencies:(BOOL)a4 taskAttribution:(id)a5 triggerEvent:(unint64_t)a6 bmltBatchNotificationIdentifier:(id)a7
{
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a5;
  id v13 = a3;
  id v14 = [[TRIBMLTTargetingTask alloc] initWithBMLTDeployment:v13 includeDependencies:v9 taskAttribution:v12 triggerEvent:a6 bmltBatchNotificationIdentifier:v11];

  return v14;
}

- (TRIBMLTDeployment)bmltDeployment
{
  return [(TRIBMLTTaskSupport *)self->_support bmltDeployment];
}

- (NSArray)tags
{
  return (NSArray *)[(TRIBMLTTaskSupport *)self->_support tags];
}

- (NSArray)dependencies
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_includeDependencies)
  {
    v3 = [(TRIBMLTTargetingTask *)self bmltDeployment];
    v4 = +[TRIFetchBMLTNotificationsTask taskWithDeployment:v3 taskAttribution:self->_taskAttribution bmltBatchNotificationIdentifier:self->_bmltBatchNotificationIdentifier];
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
  v5 = [(TRIBMLTTargetingTask *)self bmltDeployment];
  id v7 = +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:v5];

  v6 = [v4 contentTracker];

  [v6 addRefWithContentIdentifier:v7];
}

- (void)runDequeueHandlerUsingContext:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TRIBMLTTargetingTask *)self bmltDeployment];
  v6 = +[TRIContentTracker contentIdentifierForBMLTArtifactWithDeployment:v5];

  id v7 = [v4 contentTracker];

  LOBYTE(v4) = [v7 dropRefWithContentIdentifier:v6];
  if ((v4 & 1) == 0)
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = [(TRIBMLTTargetingTask *)self bmltDeployment];
      id v10 = [v9 shortDesc];
      int v11 = 138543362;
      id v12 = v10;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to drop reference on artifact for BMLT %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)_taskResultWithStatus:(int)a3 wasEnrolled:(BOOL)a4 reportResults:(BOOL)a5 nextTasks:(id)a6 bmltHistoryDatabase:(id)a7
{
  BOOL v7 = a5;
  if (a6) {
    id v8 = a6;
  }
  else {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }
  return +[TRITaskRunResult resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:](TRITaskRunResult, "resultWithRunStatus:reportResultToServer:nextTasks:earliestRetryDate:", *(void *)&a3, v7, v8, 0, a7);
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v72 = [MEMORY[0x1E4F28B00] currentHandler];
    [v72 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 168, @"Invalid parameter not satisfying: %@", @"context != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v73 = [MEMORY[0x1E4F28B00] currentHandler];
  [v73 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 169, @"Invalid parameter not satisfying: %@", @"taskQueue != nil" object file lineNumber description];

LABEL_3:
  context = (void *)MEMORY[0x1E016E7F0]();
  id v10 = [TRISystemCovariates alloc];
  int v11 = [v7 paths];
  uint64_t v12 = [(TRISystemCovariates *)v10 initWithPaths:v11];

  uint64_t v13 = [[TRIUserCovariates alloc] initWithContext:v7];
  id v14 = [TRIBMLTTargeter alloc];
  id v15 = [v7 bmltDatabase];
  v77 = v13;
  v78 = (void *)v12;
  id v16 = [(TRIBMLTTargeter *)v14 initWithDatabase:v15 systemCovariateProvider:v12 userCovariateProvider:v13];

  id v83 = 0;
  v17 = [v7 bmltDatabase];
  v18 = [(TRIBMLTTargetingTask *)self bmltDeployment];
  v19 = [v17 taskRecordWithTaskDeployment:v18];

  if (!v19)
  {
    v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(TRIBMLTTargetingTask *)self bmltDeployment];
      v22 = [v21 shortDesc];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "Warning: unable to find TRIBackgroundMLTaskRecord for deployment %{public}@; issuing incomplete telemetry.",
        buf,
        0xCu);
    }
  }
  v76 = v9;
  *(void *)buf = 0;
  unsigned __int8 v82 = 1;
  unsigned __int8 v81 = 0;
  char v80 = 0;
  v23 = (void *)MEMORY[0x1E016E7F0]();
  v24 = [(TRIBMLTTargetingTask *)self bmltDeployment];
  support = self->_support;
  v26 = [v7 bmltDatabase];
  v27 = [v7 bmltHistoryDatabase];
  BOOL v28 = [(TRIBMLTTargetingTask *)self _targetBMLTDeployment:v24 appendingTelemetryToSupport:support backgroundMLTaskDatabase:v26 backgroundMLTaskHistoryDatabase:v27 targeter:v16 reportTelemetryToServer:&v82 factorPackSetIdToActivate:buf wasEnrolled:&v81 shouldDisenroll:&v80 error:&v83];

  if (v83)
  {
    id v74 = v83;
    v29 = [v74 userInfo];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"logMessage"];
    v31 = (void *)v30;
    v32 = @"unknown";
    if (v30) {
      v32 = (__CFString *)v30;
    }
    BOOL v33 = v28;
    id v34 = v7;
    v35 = v23;
    v36 = v19;
    v37 = v16;
    v38 = v32;

    v39 = self->_support;
    v40 = [MEMORY[0x1E4FB05A8] metricWithName:@"targeting_error" categoricalValue:v38];

    id v16 = v37;
    v19 = v36;
    v23 = v35;
    id v7 = v34;
    BOOL v28 = v33;
    [(TRIBMLTTaskSupport *)v39 addMetric:v40];
  }
  if (!v28)
  {
    bmltBatchNotificationIdentifier = self->_bmltBatchNotificationIdentifier;
    if (bmltBatchNotificationIdentifier) {
      notify_post([(NSString *)bmltBatchNotificationIdentifier UTF8String]);
    }
    v53 = [*(id *)buf ident];
    [(TRIBMLTTargetingTask *)self _allocationTelemetryWithEvent:2 factorPackSetId:v53 bmltRecord:v19 context:v7];

    uint64_t v54 = v81;
    v46 = [v7 bmltHistoryDatabase];
    v55 = self;
    uint64_t v56 = 3;
    uint64_t v57 = v54;
    uint64_t v58 = 1;
    goto LABEL_17;
  }
  if (v80)
  {
    v41 = [(TRIBMLTTargetingTask *)self bmltDeployment];
    v42 = [v41 backgroundMLTaskId];
    v86 = self;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
    [v76 cancelTasksWithTag:v42 excludingTasks:v43];

    v44 = [(TRIBMLTTargetingTask *)self bmltDeployment];
    v45 = +[TRIDeactivateBMLTDeploymentTask taskWithBMLTDeployment:v44 triggerEvent:2 bmltBatchNotificationIdentifier:self->_bmltBatchNotificationIdentifier];
    v85 = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];

    v47 = [*(id *)buf ident];
    [(TRIBMLTTargetingTask *)self _allocationTelemetryWithEvent:3 factorPackSetId:v47 bmltRecord:v19 context:v7];

    uint64_t v48 = v81;
    uint64_t v49 = v82;
    v50 = [v7 bmltHistoryDatabase];
    v51 = [(TRIBMLTTargetingTask *)self _taskResultWithStatus:2 wasEnrolled:v48 reportResults:v49 nextTasks:v46 bmltHistoryDatabase:v50];

    goto LABEL_18;
  }
  if (!*(void *)buf)
  {
    v70 = self->_bmltBatchNotificationIdentifier;
    if (v70) {
      notify_post([(NSString *)v70 UTF8String]);
    }
    uint64_t v71 = v81;
    v46 = [v7 bmltHistoryDatabase];
    v55 = self;
    uint64_t v56 = 2;
    uint64_t v57 = v71;
    uint64_t v58 = 0;
LABEL_17:
    v51 = [(TRIBMLTTargetingTask *)v55 _taskResultWithStatus:v56 wasEnrolled:v57 reportResults:v58 nextTasks:0 bmltHistoryDatabase:v46];
    goto LABEL_18;
  }
  v60 = [(TRIBMLTTargetingTask *)self bmltDeployment];
  v61 = [*(id *)buf ident];
  v46 = +[TRIActivateTargetedBMLTDeploymentTask taskWithBMLTDeployment:v60 factorPackSetId:v61 taskAttribution:self->_taskAttribution bmltBatchNotificationIdentifier:self->_bmltBatchNotificationIdentifier];

  v62 = [v19 artifact];
  v75 = [v62 earliestStartDateForActivationIfInFuture];

  [v46 setStartTime:v75];
  v84 = v46;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
  v64 = [*(id *)buf ident];
  [(TRIBMLTTargetingTask *)self _allocationTelemetryWithEvent:3 factorPackSetId:v64 bmltRecord:v19 context:v7];

  uint64_t v65 = v81;
  uint64_t v66 = v82;
  [v7 bmltHistoryDatabase];
  v67 = v19;
  v69 = v68 = v16;
  v51 = [(TRIBMLTTargetingTask *)self _taskResultWithStatus:2 wasEnrolled:v65 reportResults:v66 nextTasks:v63 bmltHistoryDatabase:v69];

  id v16 = v68;
  v19 = v67;

LABEL_18:

  return v51;
}

- (BOOL)_targetBMLTDeployment:(id)a3 appendingTelemetryToSupport:(id)a4 backgroundMLTaskDatabase:(id)a5 backgroundMLTaskHistoryDatabase:(id)a6 targeter:(id)a7 reportTelemetryToServer:(BOOL *)a8 factorPackSetIdToActivate:(id *)a9 wasEnrolled:(BOOL *)a10 shouldDisenroll:(BOOL *)a11 error:(id *)a12
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  if (v18)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    v77 = [MEMORY[0x1E4F28B00] currentHandler];
    [v77 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 295, @"Invalid parameter not satisfying: %@", @"deployment != nil" object file lineNumber description];

    if (v19)
    {
LABEL_3:
      if (v20) {
        goto LABEL_4;
      }
LABEL_73:
      v79 = [MEMORY[0x1E4F28B00] currentHandler];
      [v79 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 297, @"Invalid parameter not satisfying: %@", @"bmltDatabase != nil" object file lineNumber description];

      if (v21) {
        goto LABEL_5;
      }
      goto LABEL_74;
    }
  }
  v78 = [MEMORY[0x1E4F28B00] currentHandler];
  [v78 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 296, @"Invalid parameter not satisfying: %@", @"support != nil" object file lineNumber description];

  if (!v20) {
    goto LABEL_73;
  }
LABEL_4:
  if (v21) {
    goto LABEL_5;
  }
LABEL_74:
  char v80 = [MEMORY[0x1E4F28B00] currentHandler];
  [v80 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 298, @"Invalid parameter not satisfying: %@", @"bmltHistoryDatabase != nil" object file lineNumber description];

LABEL_5:
  v92 = v21;
  if (!v22)
  {
    unsigned __int8 v81 = [MEMORY[0x1E4F28B00] currentHandler];
    [v81 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 299, @"Invalid parameter not satisfying: %@", @"targeter != nil" object file lineNumber description];
  }
  if (!a8)
  {
    unsigned __int8 v82 = [MEMORY[0x1E4F28B00] currentHandler];
    [v82 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 300, @"Invalid parameter not satisfying: %@", @"reportTelemetryToServer != nil" object file lineNumber description];
  }
  *a8 = 1;
  if (!a9)
  {
    id v83 = [MEMORY[0x1E4F28B00] currentHandler];
    [v83 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 302, @"Invalid parameter not satisfying: %@", @"factorPackSetIdToActivate != nil" object file lineNumber description];
  }
  id v23 = *a9;
  *a9 = 0;

  if (!a10)
  {
    v84 = [MEMORY[0x1E4F28B00] currentHandler];
    [v84 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 304, @"Invalid parameter not satisfying: %@", @"wasEnrolled != NULL" object file lineNumber description];
  }
  *a10 = 0;
  if (!a11)
  {
    v85 = [MEMORY[0x1E4F28B00] currentHandler];
    [v85 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 306, @"Invalid parameter not satisfying: %@", @"shouldDisenroll != NULL" object file lineNumber description];
  }
  *a11 = 0;
  if (!a12)
  {
    v86 = [MEMORY[0x1E4F28B00] currentHandler];
    [v86 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 308, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  v24 = [v20 taskRecordWithTaskDeployment:v18];
  v25 = v24;
  if (!v24)
  {
    id v34 = +[TRIBMLTTargeter targetingErrorWithDeployment:v18 errorType:@"BMLT artifact not found"];
    id v35 = *a12;
    *a12 = v34;

    BOOL v30 = 0;
    goto LABEL_70;
  }
  id v90 = v20;
  v26 = self;
  [v24 artifact];
  v27 = v91 = v22;
  uint64_t v28 = [v27 backgroundTask];

  id v22 = v91;
  v93 = 0;
  v89 = (void *)v28;
  int v29 = [v91 targetBMLT:v28 factorPackSetId:&v93 error:a12];
  BOOL v30 = 0;
  switch(v29)
  {
    case 0:
      goto LABEL_69;
    case 1:
      *a10 = 1;
      v31 = v93;
      if (!v93)
      {
        v87 = [MEMORY[0x1E4F28B00] currentHandler];
        [v87 handleFailureInMethod:a2, v26, @"TRIBMLTTargetingTask.m", 326, @"Invalid parameter not satisfying: %@", @"assignedFactorPackSetId" object file lineNumber description];

        v31 = v93;
      }
      v32 = [(__CFString *)v31 ident];
      if ([v32 isEqualToString:@"empty-fp-set"])
      {
        BOOL v33 = @"empty";
      }
      else
      {
        BOOL v33 = [(__CFString *)v93 ident];
      }
      v40 = v33;

      v41 = objc_opt_new();
      v42 = [v41 ensureBMLTFields];
      [v42 setClientBmltFactorPackSetId:v40];

      if (([(__CFString *)v93 targetingRuleIndex] & 0x80000000) == 0)
      {
        uint64_t v43 = [(__CFString *)v93 targetingRuleIndex];
        v44 = [v41 ensureBMLTFields];
        [v44 setClientBmltTargetingRuleGroupOrdinal:v43];
      }
      [v19 mergeTelemetry:v41];

      id v22 = v91;
      goto LABEL_32;
    case 2:
      v36 = v93;
      v93 = 0;

      if ([v25 status] == 1) {
        *a11 = 1;
      }
      *a8 = 0;
      v37 = objc_opt_new();
      v38 = [v37 ensureBMLTFields];
      [v38 setClientBmltFactorPackSetId:@"no-op"];

      [v19 mergeTelemetry:v37];
      goto LABEL_65;
    case 3:
      BOOL v30 = 1;
      *a11 = 1;
      v37 = objc_opt_new();
      v39 = [v37 ensureBMLTFields];
      [v39 setClientBmltFactorPackSetId:@"disenroll"];

      [v19 mergeTelemetry:v37];
      goto LABEL_68;
    default:
LABEL_32:
      v45 = [v25 activeFactorPackSetId];
      if (v45)
      {

LABEL_35:
        v47 = @"(Retargeting) ";
        goto LABEL_36;
      }
      v46 = [v25 targetedFactorPackSetId];

      if (v46) {
        goto LABEL_35;
      }
      v47 = &stru_1F3455898;
LABEL_36:
      if (v93)
      {
        uint64_t v48 = TRILogCategory_Server();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_42;
        }
        uint64_t v49 = v93;
        v50 = [v18 shortDesc];
        *(_DWORD *)buf = 138543874;
        v95 = v47;
        __int16 v96 = 2114;
        v97 = v49;
        id v22 = v91;
        __int16 v98 = 2114;
        v99 = v50;
        v51 = "%{public}@Enrolling in factor pack set id %{public}@ for BMLT %{public}@";
        v52 = v48;
        uint32_t v53 = 32;
      }
      else
      {
        *a8 = 0;
        uint64_t v48 = TRILogCategory_Server();
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_42;
        }
        v50 = [v18 shortDesc];
        *(_DWORD *)buf = 138543618;
        v95 = v47;
        __int16 v96 = 2114;
        v97 = v50;
        v51 = "%{public}@Targeting resulted in the default treatment (non-enrollment) for BMLT %{public}@";
        v52 = v48;
        uint32_t v53 = 22;
      }
      _os_log_impl(&dword_1DA291000, v52, OS_LOG_TYPE_DEFAULT, v51, buf, v53);

LABEL_42:
      if (!v93)
      {
        BOOL v30 = 1;
        goto LABEL_69;
      }
      uint64_t v54 = [v25 targetedFactorPackSetId];

      if (v54)
      {
        v55 = [(__CFString *)v93 ident];
        uint64_t v56 = [v25 targetedFactorPackSetId];
        int v57 = [v55 isEqualToString:v56];

        uint64_t v58 = TRILogCategory_Server();
        BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
        v60 = v90;
        if (v57)
        {
          if (v59)
          {
            *(_WORD *)buf = 0;
            v61 = "Retargeting resulted in no change to the targetedFactorPackSetId.";
LABEL_52:
            _os_log_impl(&dword_1DA291000, v58, OS_LOG_TYPE_DEFAULT, v61, buf, 2u);
            goto LABEL_53;
          }
          goto LABEL_53;
        }
        if (v59)
        {
          v67 = [v25 targetedFactorPackSetId];
          *(_DWORD *)buf = 138543618;
          v95 = v67;
          __int16 v96 = 2114;
          v97 = v93;
          v68 = "Retargeting resulted in targetedFactorPackSetId change: %{public}@ --> %{public}@";
LABEL_59:
          _os_log_impl(&dword_1DA291000, v58, OS_LOG_TYPE_DEFAULT, v68, buf, 0x16u);
        }
      }
      else
      {
        v62 = [v25 activeFactorPackSetId];

        v60 = v90;
        if (!v62) {
          goto LABEL_62;
        }
        v63 = [(__CFString *)v93 ident];
        v64 = [v25 activeFactorPackSetId];
        int v65 = [v63 isEqualToString:v64];

        uint64_t v58 = TRILogCategory_Server();
        BOOL v66 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
        if (v65)
        {
          if (v66)
          {
            *(_WORD *)buf = 0;
            v61 = "Retargeting resulted in no change to the activeFactorPackSetId. Still attempting activation";
            goto LABEL_52;
          }
LABEL_53:

          *a8 = 0;
          goto LABEL_61;
        }
        if (v66)
        {
          v69 = v93;
          v67 = [v25 activeFactorPackSetId];
          *(_DWORD *)buf = 138543618;
          v95 = v69;
          __int16 v96 = 2114;
          v97 = v67;
          v68 = "Retargeting result: targeted %{public}@, previously active: %{public}@";
          goto LABEL_59;
        }
      }

LABEL_61:
      id v22 = v91;
LABEL_62:
      v70 = [(__CFString *)v93 ident];
      if (([(__CFString *)v93 targetingRuleIndex] & 0x80000000) != 0)
      {
        char v74 = [v60 targetTaskDeployment:v18 toFactorPackSetId:v70 targetingRuleIndex:0 usingTransaction:0];

        if (v74) {
          goto LABEL_64;
        }
LABEL_67:
        v75 = +[TRIBMLTTargeter targetingErrorWithDeployment:v18 errorType:@"failed update database"];
        BOOL v30 = 0;
        v37 = *a12;
        *a12 = v75;
        goto LABEL_68;
      }
      uint64_t v71 = objc_msgSend(NSNumber, "numberWithInt:", -[__CFString targetingRuleIndex](v93, "targetingRuleIndex"));
      char v72 = [v60 targetTaskDeployment:v18 toFactorPackSetId:v70 targetingRuleIndex:v71 usingTransaction:0];

      if ((v72 & 1) == 0) {
        goto LABEL_67;
      }
LABEL_64:
      v73 = v93;
      v37 = *a9;
      *a9 = v73;
LABEL_65:
      BOOL v30 = 1;
LABEL_68:

LABEL_69:
      id v20 = v90;
LABEL_70:

      return v30;
  }
}

- (id)_categoricalValueForTriggerEvent:(unint64_t)a3
{
  if (a3) {
    return @"bmlt-retargeting";
  }
  else {
    return @"bmlt-routine-fetch";
  }
}

- (void)_allocationTelemetryWithEvent:(unsigned __int8)a3 factorPackSetId:(id)a4 bmltRecord:(id)a5 context:(id)a6
{
  uint64_t v8 = a3;
  deployment = self->_deployment;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [(TRIBMLTDeployment *)deployment backgroundMLTaskId];
  +[TRILighthouseBitacoraHandler emitBMLTEventWithBMLTId:v14 deploymentId:[(TRIBMLTDeployment *)self->_deployment deploymentId] eventType:0 succeeded:v8 == 3];

  id v15 = [(TRIBMLTDeployment *)self->_deployment backgroundMLTaskId];
  +[TRITaskUtils updateBMLTHistoryDatabaseWithAllocationStatus:v8 forBMLT:v15 deployment:[(TRIBMLTDeployment *)self->_deployment deploymentId] fps:v13 bmltRecord:v12 context:v11];
}

- (id)metrics
{
  return [(TRIBMLTTaskSupport *)self->_support metrics];
}

- (id)dimensions
{
  return [(TRIBMLTTaskSupport *)self->_support dimensions];
}

- (id)trialSystemTelemetry
{
  return [(TRIBMLTTaskSupport *)self->_support trialSystemTelemetry];
}

- (id)_asPersistedTask
{
  v3 = objc_opt_new();
  id v4 = [(TRIBMLTTargetingTask *)self bmltDeployment];
  v5 = [v4 backgroundMLTaskId];
  [v3 setBackgroundMlTaskId:v5];

  v6 = [(TRIBMLTTargetingTask *)self bmltDeployment];
  objc_msgSend(v3, "setDeploymentId:", objc_msgSend(v6, "deploymentId"));

  [v3 setIncludeDependencies:self->_includeDependencies];
  id v7 = [(TRITaskAttributing *)self->_taskAttribution asPersistedTaskAttribution];
  [v3 setTaskAttribution:v7];

  unint64_t triggerEvent = self->_triggerEvent;
  if (triggerEvent)
  {
    if (triggerEvent != 1) {
      goto LABEL_6;
    }
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 1;
  }
  [v3 setTriggerEvent:v9];
LABEL_6:
  if (self->_bmltBatchNotificationIdentifier) {
    objc_msgSend(v3, "setBmltBatchNotificationId:");
  }
  return v3;
}

- (id)serialize
{
  id v4 = [(TRIBMLTTargetingTask *)self _asPersistedTask];
  v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 511, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v28 = 0;
  v3 = +[TRIPBMessage parseFromData:a3 error:&v28];
  id v4 = v28;
  if (!v3)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v4;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIBMLTTargetingPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_25;
  }
  if (([v3 hasBackgroundMlTaskId] & 1) == 0)
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138412290;
      id v30 = v21;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: backgroundMlTaskId", buf, 0xCu);
    }
    uint64_t v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138412290;
    id v30 = v12;
    id v13 = "Cannot decode message of type %@ with missing field: backgroundMlTaskId";
    goto LABEL_24;
  }
  v5 = [v3 backgroundMlTaskId];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    id v14 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138412290;
    id v30 = v12;
    id v13 = "Cannot decode message of type %@ with field of length 0: backgroundMlTaskId";
LABEL_24:
    _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);

    goto LABEL_25;
  }
  if (([v3 hasDeploymentId] & 1) == 0)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    id v15 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138412290;
    id v30 = v12;
    id v13 = "Cannot decode message of type %@ with missing field: deploymentId";
    goto LABEL_24;
  }
  if (([v3 hasIncludeDependencies] & 1) == 0)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    id v16 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138412290;
    id v30 = v12;
    id v13 = "Cannot decode message of type %@ with missing field: includeDependencies";
    goto LABEL_24;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412290;
      id v30 = v12;
      id v13 = "Cannot decode message of type %@ with missing field: taskAttribution";
      goto LABEL_24;
    }
LABEL_25:
    id v18 = 0;
    goto LABEL_26;
  }
  id v7 = [v3 taskAttribution];
  uint64_t v8 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v7];

  if (v8)
  {
    if ([v3 hasTriggerEvent]) {
      BOOL v9 = [v3 triggerEvent] == 2;
    }
    else {
      BOOL v9 = 0;
    }
    id v23 = objc_alloc(MEMORY[0x1E4FB0078]);
    v24 = [v3 backgroundMlTaskId];
    id v22 = objc_msgSend(v23, "initWithBackgroundMLTaskId:deploymentId:", v24, objc_msgSend(v3, "deploymentId"));

    v25 = objc_opt_class();
    uint64_t v26 = [v3 includeDependencies];
    if ([v3 hasBmltBatchNotificationId])
    {
      v27 = [v3 bmltBatchNotificationId];
      id v18 = [v25 taskWithBMLTDeployment:v22 includeDependencies:v26 taskAttribution:v8 triggerEvent:v9 bmltBatchNotificationIdentifier:v27];
    }
    else
    {
      id v18 = [v25 taskWithBMLTDeployment:v22 includeDependencies:v26 taskAttribution:v8 triggerEvent:v9 bmltBatchNotificationIdentifier:0];
    }
  }
  else
  {
    id v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    id v18 = 0;
  }

LABEL_26:
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TRIBMLTTargetingTask;
  if ([(TRIBaseTask *)&v10 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = [(TRIBMLTTargetingTask *)self bmltDeployment];
    id v7 = [v5 bmltDeployment];

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
  v7.super_class = (Class)TRIBMLTTargetingTask;
  unint64_t v3 = [(TRIBaseTask *)&v7 hash];
  id v4 = [(TRIBMLTTargetingTask *)self bmltDeployment];
  unint64_t v5 = [v4 hash] + 37 * v3;

  return v5;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(TRIBMLTTargetingTask *)self bmltDeployment];
  uint64_t v6 = [v5 shortDesc];
  objc_super v7 = (void *)[v3 initWithFormat:@"<%@:%@>", v4, v6];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIBMLTTargetingTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIBMLTTargetingTask;
  unint64_t v5 = [(TRIBMLTTargetingTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRIBMLTTargetingTask.m", 586, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  unint64_t v5 = [(TRIBMLTTargetingTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmltBatchNotificationIdentifier, 0);
  objc_storeStrong((id *)&self->_deployment, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
  objc_storeStrong((id *)&self->_support, 0);
}

@end