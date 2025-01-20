@interface TRIFetchMultipleExperimentNotificationsTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttributing:(id)a5 rollbacksOnly:(BOOL)a6 limitedCarryOnly:(BOOL)a7;
- (BOOL)_checkIfAnyTreatmentPresent:(id)a3 usingContext:(id)a4;
- (BOOL)_processExperiment:(id)a3 taskContext:(id)a4 taskQueue:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasDeferred;
- (NSArray)tags;
- (NSString)description;
- (NSString)taskName;
- (TRIFetchMultipleExperimentNotificationsTask)initWithCoder:(id)a3;
- (TRIFetchMultipleExperimentNotificationsTask)initWithStartingFetchDateOverride:(id)a3 container:(int)a4 team:(id)a5 rollbacksOnly:(BOOL)a6 withNamespaceNames:(id)a7;
- (TRIFetchMultipleExperimentNotificationsTask)initWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttributing:(id)a5 rollbacksOnly:(BOOL)a6 limitedCarryOnly:(BOOL)a7;
- (id)_asPersistedTask;
- (id)_getNextTaskForExperiment:(id)a3 taskContext:(id)a4 taskQueue:(id)a5;
- (id)_nameForNotificationType:(int)a3;
- (id)_updateExperimentEndDateWithArtifact:(id)a3 context:(id)a4 database:(id)a5 scheduleDeactivationTask:(BOOL)a6 scheduleDeactivationNow:(BOOL)a7;
- (id)dimensions;
- (id)metrics;
- (id)nextTasks;
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
- (void)updateStatusForNamespacesWithContext:(id)a3;
@end

@implementation TRIFetchMultipleExperimentNotificationsTask

- (int)taskType
{
  return 5;
}

- (NSString)taskName
{
  return (NSString *)@"TRIFetchExperimentsTask";
}

- (NSArray)tags
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
  uint64_t v4 = [(TRIBaseTask *)&v9 tags];
  v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  v7 = (void *)[v3 initWithArray:v6];

  if (self->_rollbacksOnly) {
    [v7 addObject:@"rollbacksOnly"];
  }
  +[TRITaskUtils addAttribution:self->_taskAttributing toTaskTags:v7];
  return (NSArray *)v7;
}

+ (id)taskWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttributing:(id)a5 rollbacksOnly:(BOOL)a6 limitedCarryOnly:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[TRIFetchMultipleExperimentNotificationsTask alloc] initWithStartingFetchDateOverride:v13 namespaceNames:v12 taskAttributing:v11 rollbacksOnly:v8 limitedCarryOnly:v7];

  return v14;
}

- (TRIFetchMultipleExperimentNotificationsTask)initWithStartingFetchDateOverride:(id)a3 namespaceNames:(id)a4 taskAttributing:(id)a5 rollbacksOnly:(BOOL)a6 limitedCarryOnly:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
  v16 = [(TRIFetchMultipleExperimentNotificationsTask *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_startingFetchDateOverride, a3);
    v17->_rollbacksOnly = a6;
    v17->_limitedCarryOnly = a7;
    objc_storeStrong((id *)&v17->_taskAttributing, a5);
    uint64_t v18 = objc_opt_new();
    nextTasks = v17->_nextTasks;
    v17->_nextTasks = (NSMutableArray *)v18;

    objc_storeStrong((id *)&v17->_namespaceNames, a4);
  }

  return v17;
}

- (TRIFetchMultipleExperimentNotificationsTask)initWithStartingFetchDateOverride:(id)a3 container:(int)a4 team:(id)a5 rollbacksOnly:(BOOL)a6 withNamespaceNames:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
  id v13 = [(TRIFetchMultipleExperimentNotificationsTask *)&v18 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startingFetchDateOverride, a3);
    v14->_rollbacksOnly = a6;
    objc_storeStrong((id *)&v14->_namespaceNames, a7);
    uint64_t v15 = objc_opt_new();
    nextTasks = v14->_nextTasks;
    v14->_nextTasks = (NSMutableArray *)v15;
  }
  return v14;
}

- (void)_addNextTask:(id)a3
{
}

- (int64_t)nextTaskCount
{
  return [(NSMutableArray *)self->_nextTasks count];
}

- (id)nextTasks
{
  return self->_nextTasks;
}

- (id)_getNextTaskForExperiment:(id)a3 taskContext:(id)a4 taskQueue:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 experimentDeployment];

  if (!v12)
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"TRIFetchMultipleExperimentNotificationsTask.m", 158, @"Invalid parameter not satisfying: %@", @"artifact.experimentDeployment" object file lineNumber description];
  }
  id v13 = [v9 experimentId];

  if (!v13)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"TRIFetchMultipleExperimentNotificationsTask.m", 159, @"Invalid parameter not satisfying: %@", @"artifact.experimentId" object file lineNumber description];
  }
  id v14 = [v10 experimentDatabase];
  uint64_t v15 = 0;
  switch([v9 experimentType])
  {
    case 0u:
      objc_super v18 = TRILogCategory_Server();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      v19 = [v9 experimentId];
      *(_DWORD *)buf = 138543362;
      v58 = v19;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "unknown experiment type for experiment id: %{public}@", buf, 0xCu);
      goto LABEL_27;
    case 1u:
    case 3u:
      v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v9 experimentId];
        *(_DWORD *)buf = 138543362;
        v58 = v17;
        _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "submit targeting task for experiment id: %{public}@", buf, 0xCu);
      }
      objc_super v18 = [v9 experimentDeployment];
      uint64_t v15 = +[TRITargetingTask taskWithExperiment:v18 includeDependencies:0 taskAttribution:self->_taskAttributing];
      goto LABEL_29;
    case 2u:
      v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v21 = [v9 experimentDeployment];
        v22 = [v21 experimentId];
        *(_DWORD *)buf = 138543362;
        v58 = v22;
        _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "rolling back experiment id: %{public}@", buf, 0xCu);
      }
      v23 = [v9 experimentId];
      [v11 cancelTasksWithTag:v23];

      v24 = [v9 experimentDeployment];
      v25 = [v24 taskTag];
      [v11 cancelTasksWithTag:v25];

      v26 = [v9 experimentId];
      uint64_t v15 = +[TRIDeactivateTreatmentTask taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:](TRIDeactivateTreatmentTask, "taskWithExperimentId:deploymentId:failOnUnrecognizedExperiment:triggerEvent:taskAttribution:", v26, [v9 deploymentId], 0, 4, self->_taskAttributing);

      nextTasks = self->_nextTasks;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __95__TRIFetchMultipleExperimentNotificationsTask__getNextTaskForExperiment_taskContext_taskQueue___block_invoke;
      v55[3] = &unk_1E6BBB278;
      v56 = v9;
      v28 = [(NSMutableArray *)nextTasks _pas_filteredArrayWithTest:v55];
      v29 = (NSMutableArray *)[v28 mutableCopy];
      v30 = self->_nextTasks;
      self->_nextTasks = v29;

      objc_super v18 = v56;
      goto LABEL_29;
    case 5u:
      v31 = [v9 experiment];
      char v32 = [v31 hasEndDate];

      if ((v32 & 1) == 0)
      {
        objc_super v18 = TRILogCategory_Server();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = [v9 experimentDeployment];
          v42 = [v19 experimentId];
          *(_DWORD *)buf = 138543362;
          v58 = v42;
          _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Experiment update notification missing endate. ID: %{public}@", buf, 0xCu);
          goto LABEL_26;
        }
LABEL_28:
        uint64_t v15 = 0;
        goto LABEL_29;
      }
      if (![v9 experimentState])
      {
        objc_super v18 = TRILogCategory_Server();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = [v9 experimentDeployment];
          v42 = [v19 experimentId];
          *(_DWORD *)buf = 138543362;
          v58 = v42;
          _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_INFO, "Update notification marked inactive, ignoring. ID: %{public}@", buf, 0xCu);
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        goto LABEL_28;
      }
      v33 = [v9 experimentDeployment];
      objc_super v18 = [v14 experimentRecordWithExperimentDeployment:v33];

      if (v18)
      {
        v34 = [v9 experiment];
        v35 = [v34 endDate];
        v36 = [v35 date];

        v37 = [MEMORY[0x1E4F1C9C8] date];
        v38 = v37;
        if (v36 && [v37 compare:v36] == 1)
        {
          v39 = TRILogCategory_Server();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v54 = [v9 experimentDeployment];
            v40 = [v54 experimentId];
            *(_DWORD *)buf = 138543362;
            v58 = v40;
            _os_log_impl(&dword_1DA291000, v39, OS_LOG_TYPE_INFO, "Experiment update end date occurs in the past, will schedule task for now if relevant. ID: %{public}@", buf, 0xCu);
          }
          uint64_t v41 = 1;
        }
        else
        {
          uint64_t v41 = 0;
        }
        switch([v18 status])
        {
          case 0:
          case 2:
          case 4:
            id v44 = [(TRIFetchMultipleExperimentNotificationsTask *)self _updateExperimentEndDateWithArtifact:v9 context:v10 database:v14 scheduleDeactivationTask:0 scheduleDeactivationNow:0];
            goto LABEL_46;
          case 1:
            uint64_t v15 = [(TRIFetchMultipleExperimentNotificationsTask *)self _updateExperimentEndDateWithArtifact:v9 context:v10 database:v14 scheduleDeactivationTask:1 scheduleDeactivationNow:v41];
            goto LABEL_47;
          case 3:
            v45 = TRILogCategory_Server();
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
              goto LABEL_45;
            }
            v46 = [v9 experimentDeployment];
            v47 = [v46 experimentId];
            uint64_t v49 = [v18 status];
            *(_DWORD *)buf = 138543618;
            v58 = v47;
            __int16 v59 = 2048;
            uint64_t v60 = v49;
            _os_log_impl(&dword_1DA291000, v45, OS_LOG_TYPE_INFO, "Experiment update for an experiment in finished state, ignoring. ID: %{public}@, state:%ld", buf, 0x16u);
            break;
          default:
            v45 = TRILogCategory_Server();
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
              goto LABEL_45;
            }
            v46 = [v9 experimentDeployment];
            v47 = [v46 experimentId];
            uint64_t v48 = [v18 status];
            *(_DWORD *)buf = 138543618;
            v58 = v47;
            __int16 v59 = 2048;
            uint64_t v60 = v48;
            _os_log_error_impl(&dword_1DA291000, v45, OS_LOG_TYPE_ERROR, "Experiment update for an experiment in unknown experiment state, ignoring. ID: %{public}@, state:%ld", buf, 0x16u);
            break;
        }

LABEL_45:
LABEL_46:
        uint64_t v15 = 0;
LABEL_47:
      }
      else
      {
        v36 = TRILogCategory_Server();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v50 = [v9 experimentDeployment];
          v51 = [v50 experimentId];
          *(_DWORD *)buf = 138543362;
          v58 = v51;
          _os_log_error_impl(&dword_1DA291000, v36, OS_LOG_TYPE_ERROR, "Missing existing experiment for an experiment update, ignoring. ID: %{public}@", buf, 0xCu);
        }
        uint64_t v15 = 0;
      }

LABEL_29:
LABEL_30:

      return v15;
    default:
      goto LABEL_30;
  }
}

uint64_t __95__TRIFetchMultipleExperimentNotificationsTask__getNextTaskForExperiment_taskContext_taskQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 experiment],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 32) experimentDeployment],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 isEqualToDeployment:v5],
        v5,
        v4,
        v6))
  {
    BOOL v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [*(id *)(a1 + 32) experimentId];
      int v11 = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Clearing out targeting task due to found rollback for %{public}@", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (id)_nameForNotificationType:(int)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = @"experiment";
  }
  else
  {
    uint64_t v3 = *(void *)&a3;
    if (a3 == 3)
    {
      uint64_t v4 = @"rollout";
    }
    else
    {
      v5 = TRICloudKitSupport_NotificationType_EnumDescriptor();
      uint64_t v4 = [v5 enumNameForValue:v3];
    }
  }
  return v4;
}

- (BOOL)_processExperiment:(id)a3 taskContext:(id)a4 taskQueue:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 experimentDatabase];
  int v11 = [v8 namespaceDatabase];
  id v12 = [v8 paths];
  uint64_t v13 = [v7 experimentDeployment];
  id v14 = 0;
  if ([v7 hasDeploymentId])
  {
    if (v13)
    {
      uint64_t v15 = [v10 experimentRecordWithExperimentDeployment:v13];
      id v14 = v15;
      if (v15)
      {
        if ([v15 isManuallyTargeted])
        {
          v16 = TRILogCategory_Server();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v60 = v13;
            _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Found existing manually targeted experiment record for %{public}@. Not processing this experiment notification", buf, 0xCu);
          }
          BOOL v17 = 0;
          goto LABEL_42;
        }
      }
    }
  }
  v52 = v14;
  id v53 = v9;
  int v18 = [v7 experimentType];
  int v19 = [v7 experimentType];
  v20 = [v7 encodedExperimentDefinition];
  if (v20)
  {
    [v7 encodedExperimentDefinition];
    int v48 = v18;
    int v21 = v19;
    id v22 = v7;
    id v23 = v8;
    v24 = v13;
    v25 = v12;
    v27 = v26 = v10;
    BOOL v28 = [v27 length] != 0;

    id v10 = v26;
    id v12 = v25;
    uint64_t v13 = v24;
    id v8 = v23;
    id v7 = v22;
    int v19 = v21;
    int v18 = v48;
  }
  else
  {
    BOOL v28 = 0;
  }

  v29 = [v7 experimentId];
  id v9 = v53;
  if (!v29) {
    goto LABEL_37;
  }
  if (v18 == 2) {
    BOOL v28 = 1;
  }

  if (!v28)
  {
    if (v19 == 5) {
      goto LABEL_21;
    }
LABEL_37:
    v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v30 = -[TRIFetchMultipleExperimentNotificationsTask _nameForNotificationType:](self, "_nameForNotificationType:", [v7 experimentType]);
      *(_DWORD *)buf = 138543362;
      uint64_t v60 = v30;
      _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "empty %{public}@", buf, 0xCu);
      goto LABEL_39;
    }
LABEL_40:
    BOOL v17 = 0;
LABEL_41:
    id v14 = v52;
    goto LABEL_42;
  }
  if (v18 != 2 && v19 != 5 && ([v7 saveWithDatabase:v10 paths:v12] & 1) == 0)
  {
    v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v30 = -[TRIFetchMultipleExperimentNotificationsTask _nameForNotificationType:](self, "_nameForNotificationType:", [v7 experimentType]);
      v31 = [v7 experimentId];
      *(_DWORD *)buf = 138543618;
      uint64_t v60 = v30;
      __int16 v61 = 2114;
      v62 = v31;
      _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Unable to save %{public}@ with id %{public}@.", buf, 0x16u);

      id v9 = v53;
LABEL_39:

      goto LABEL_40;
    }
    goto LABEL_40;
  }
LABEL_21:
  if (![v7 deploymentEnvironment]
    || (objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "experimentType")),
        char v32 = objc_claimAutoreleasedReturnValue(),
        char v33 = [&unk_1F347B3A8 containsObject:v32],
        v32,
        (v33 & 1) != 0))
  {
    v34 = [v7 namespaces];

    id v9 = v53;
    if (v34)
    {
      v47 = v12;
      uint64_t v49 = v10;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v35 = [v7 namespaces];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v55 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v54 + 1) + 8 * i);
            uint64_t v41 = [v11 dynamicNamespaceRecordWithNamespaceName:v40];

            if (v41) {
              [v11 setFetched:1 forDynamicNamespaceName:v40];
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v37);
      }

      id v9 = v53;
      id v12 = v47;
      id v10 = v49;
    }
    v16 = [(TRIFetchMultipleExperimentNotificationsTask *)self _getNextTaskForExperiment:v7 taskContext:v8 taskQueue:v9];
    if (v16) {
      [(TRIFetchMultipleExperimentNotificationsTask *)self _addNextTask:v16];
    }
    BOOL v17 = 1;
    goto LABEL_41;
  }
  v16 = TRILogCategory_Server();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v43 = TRICloudKitSupport_NotificationType_EnumDescriptor();
    objc_msgSend(v43, "textFormatNameForValue:", objc_msgSend(v7, "experimentType"));
    id v44 = v50 = v10;
    v45 = TRIDeploymentEnvironment_EnumDescriptor();
    v46 = objc_msgSend(v45, "textFormatNameForValue:", objc_msgSend(v7, "deploymentEnvironment"));
    *(_DWORD *)buf = 138412546;
    uint64_t v60 = v44;
    __int16 v61 = 2112;
    v62 = v46;
    _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Ignoring unsupported notification of type %@ for deploymentEnvironment %@.", buf, 0x16u);

    id v10 = v50;
  }
  BOOL v17 = 0;
  id v14 = v52;
  id v9 = v53;
LABEL_42:

  return v17;
}

- (id)_updateExperimentEndDateWithArtifact:(id)a3 context:(id)a4 database:(id)a5 scheduleDeactivationTask:(BOOL)a6 scheduleDeactivationNow:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v27 = 0;
  BOOL v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__20;
  v31 = __Block_byref_object_dispose__20;
  id v32 = 0;
  uint64_t v15 = [v13 experimentDatabase];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __150__TRIFetchMultipleExperimentNotificationsTask__updateExperimentEndDateWithArtifact_context_database_scheduleDeactivationTask_scheduleDeactivationNow___block_invoke;
  v20[3] = &unk_1E6BBB2A0;
  id v16 = v12;
  id v21 = v16;
  id v17 = v14;
  BOOL v25 = a6;
  id v23 = self;
  v24 = &v27;
  BOOL v26 = a7;
  id v22 = v17;
  [v15 writeTransactionWithFailableBlock:v20];

  id v18 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v18;
}

uint64_t __150__TRIFetchMultipleExperimentNotificationsTask__updateExperimentEndDateWithArtifact_context_database_scheduleDeactivationTask_scheduleDeactivationNow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) experimentDeployment];
  if (!v4
    || (v5 = (void *)v4,
        [*(id *)(a1 + 32) experimentId],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    id v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to update experiment end date due to missing information, ignoring.", (uint8_t *)&v29, 2u);
    }
    goto LABEL_13;
  }
  id v7 = *(void **)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) experiment];
  id v9 = [v8 endDate];
  id v10 = [v9 date];
  int v11 = [*(id *)(a1 + 32) experimentDeployment];
  char v12 = [v7 updateEndDate:v10 forExperimentDeployment:v11 usingTransaction:v3];

  id v13 = TRILogCategory_Server();
  id v14 = v13;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [*(id *)(a1 + 32) experimentDeployment];
      BOOL v28 = [v27 experimentId];
      int v29 = 138543362;
      v30 = v28;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to update experiment end date, ignoring. ID: %{public}@", (uint8_t *)&v29, 0xCu);
    }
LABEL_13:
    id v21 = (unsigned __int8 *)MEMORY[0x1E4F93BF0];
    goto LABEL_14;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) experimentDeployment];
    uint64_t v15 = [v8 experimentId];
    id v10 = [*(id *)(a1 + 32) experiment];
    id v16 = [v10 endDate];
    id v17 = [v16 date];
    int v29 = 138543618;
    v30 = v15;
    __int16 v31 = 2114;
    id v32 = v17;
    _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Updated experiment end date for experiment id: %{public}@ . New End Date: %{public}@", (uint8_t *)&v29, 0x16u);
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    id v21 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
    goto LABEL_15;
  }
  id v14 = [*(id *)(a1 + 32) experimentId];
  uint64_t v18 = [*(id *)(a1 + 32) deploymentId];
  int v19 = *(unsigned __int8 *)(a1 + 65);
  if (*(unsigned char *)(a1 + 65))
  {
    v20 = 0;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) experiment];
    id v10 = [v8 endDate];
    v20 = [v10 date];
  }
  uint64_t v24 = +[TRIDeactivateTreatmentTask taskWithExperimentId:v14 deploymentId:v18 startTime:v20 failOnUnrecognizedExperiment:0 triggerEvent:25 taskAttribution:*(void *)(*(void *)(a1 + 48) + 64)];
  uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;

  if (!v19)
  {
  }
  id v21 = (unsigned __int8 *)MEMORY[0x1E4F93BE8];
LABEL_14:

LABEL_15:
  uint64_t v22 = *v21;

  return v22;
}

- (void)updateStatusForNamespacesWithContext:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v6 = self->_namespaceNames;
  uint64_t v29 = [(NSSet *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v31;
    *(void *)&long long v7 = 138543362;
    long long v26 = v7;
    uint64_t v27 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v6);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        id v10 = objc_msgSend(v4, "namespaceDatabase", v26);
        uint64_t v11 = [v10 dynamicNamespaceRecordWithNamespaceName:v9];

        if (v11)
        {
          char v12 = [(id)v11 appContainer];
          id v13 = [v4 paths];
          if (v12)
          {
            id v14 = [(id)v11 appContainer];
            uint64_t v15 = [v13 pathsForContainer:v14 asClientProcess:0];

            id v13 = (void *)v15;
          }

          if (!v13)
          {
LABEL_13:
            id v16 = TRILogCategory_Server();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_25;
            }
            v20 = [(id)v11 appContainer];
            id v21 = [v20 identifier];
            *(_DWORD *)buf = v26;
            v35 = v21;
            _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "updateStatusForNamespacesWithContext skipping missing app container: %{public}@", buf, 0xCu);

            goto LABEL_24;
          }
        }
        else
        {
          id v13 = [v4 paths];
          if (!v13) {
            goto LABEL_13;
          }
        }
        id v16 = [objc_alloc(MEMORY[0x1E4FB01E0]) initWithPaths:v13];
        id v17 = [v16 statusForNamespaceWithName:v9];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = [v17 copyWithReplacementLastFetchAttempt:v5];

          v20 = [(id)v19 copyWithReplacementLastFetchWasSuccess:1];
        }
        else
        {
          uint64_t v22 = v5;
          id v23 = (void *)MEMORY[0x1E4FB01A0];
          uint64_t v24 = [v13 namespaceDescriptorsDefaultDir];
          uint64_t v19 = [v23 loadWithNamespaceName:v9 fromDirectory:v24];

          if (!(v11 | v19))
          {
            v20 = TRILogCategory_Server();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v26;
              v35 = v9;
              _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "expected namespace to be registered, but could not find descriptor: %{public}@", buf, 0xCu);
            }
            v5 = v22;
            int v6 = v27;
            goto LABEL_24;
          }
          if (v19) {
            uint64_t v25 = [(id)v19 downloadNCV];
          }
          else {
            uint64_t v25 = [(id)v11 compatibilityVersion];
          }
          v5 = v22;
          v20 = [objc_alloc(MEMORY[0x1E4FB01D8]) initWithNamespaceName:v9 compatibilityVersion:v25 lastFetchAttempt:v22 lastFetchWasSuccess:1];
          int v6 = v27;
        }

        [v16 saveStatus:v20];
LABEL_24:

LABEL_25:
        ++v8;
      }
      while (v29 != v8);
      uint64_t v29 = [(NSSet *)v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v29);
  }
}

- (BOOL)_checkIfAnyTreatmentPresent:(id)a3 usingContext:(id)a4
{
  v5 = (void *)MEMORY[0x1E4FB01B0];
  id v6 = a3;
  long long v7 = [a4 paths];
  uint64_t v8 = [v5 factorProviderWithPaths:v7 namespaceName:v6];

  if (_os_feature_enabled_impl()) {
    uint64_t v9 = 55;
  }
  else {
    uint64_t v9 = 23;
  }
  char v10 = [v8 hasAnyTreatmentInLayers:v9];

  return v10;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!+[TRIUserAdjustableSettings getExperimentOptOut:v6])
  {
    char v10 = self;
    objc_sync_enter(v10);
    uint64_t v11 = (void *)os_transaction_create();
    char v12 = [v6 keyValueStore];
    v62 = +[TRIFetchDateManager managerWithKeyValueStore:v12];

    id v13 = [v6 namespaceDatabase];
    id v14 = [v6 paths];
    uint64_t v15 = [v14 namespaceDescriptorsDefaultDir];
    __int16 v61 = +[TRINamespaceDescriptorProvider providerWithNamespaceDatabase:v13 defaultDescriptorDirectoryPath:v15];

    uint64_t v16 = [(TRITaskAttributing *)v10->_taskAttributing triCloudKitContainer];
    id v17 = [(TRITaskAttributing *)v10->_taskAttributing teamIdentifier];
    uint64_t v18 = [(TRITaskAttributing *)v10->_taskAttributing applicationBundleIdentifier];
    long long v57 = +[TRICKNativeArtifactProvider providerForContainer:v16 teamId:v17 bundleId:v18 dateProvider:v62 namespaceDescriptorProvider:v61 serverContext:v6];

    uint64_t v63 = [(TRITaskAttributing *)v10->_taskAttributing networkOptions];
    uint64_t v19 = v57;
    if ([v63 allowsCellularAccess])
    {
      v20 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"allows_cellular_download", objc_msgSend(v63, "allowsCellularAccess"));
      [(TRIFetchMultipleExperimentNotificationsTask *)v10 _addMetric:v20];
    }
    if ([v63 discretionaryBehavior])
    {
      id v21 = [(TRIBaseTask *)v10 stateProvider];
      uint64_t v22 = objc_msgSend(v21, "activeActivityGrantingCapability:", objc_msgSend(v63, "requiredCapability"));

      if (!v22)
      {
        v43 = TRILogCategory_Server();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA291000, v43, OS_LOG_TYPE_DEFAULT, "no xpc activity designated for discretionary operation, failing with retry", buf, 2u);
        }

        id v44 = (TRIFetchOptions *)[(NSMutableArray *)v10->_nextTasks copy];
        uint64_t v9 = +[TRITaskRunResult resultWithRunStatus:1 reportResultToServer:1 nextTasks:v44 earliestRetryDate:0];
        goto LABEL_60;
      }
      [v63 setActivity:v22];
    }
    __int16 v59 = [[TRIFetchOptions alloc] initWithDownloadOptions:v63 cacheDeleteAvailableSpaceClass:&unk_1F347B9A8];
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    v99 = buf;
    uint64_t v100 = 0x3032000000;
    v101 = __Block_byref_object_copy__20;
    v102 = __Block_byref_object_dispose__20;
    id v103 = 0;
    uint64_t v94 = 0;
    v95 = &v94;
    uint64_t v96 = 0x2020000000;
    int v97 = 0;
    uint64_t v90 = 0;
    v91 = &v90;
    uint64_t v92 = 0x2020000000;
    uint64_t v93 = 0;
    uint64_t v84 = 0;
    v85 = &v84;
    uint64_t v86 = 0x3032000000;
    v87 = __Block_byref_object_copy__20;
    v88 = __Block_byref_object_dispose__20;
    id v89 = 0;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __77__TRIFetchMultipleExperimentNotificationsTask_runUsingContext_withTaskQueue___block_invoke;
    v76[3] = &unk_1E6BBB2C8;
    v81 = &v84;
    v82 = buf;
    v80 = &v94;
    v76[4] = v10;
    id v24 = v6;
    id v77 = v24;
    id v78 = v7;
    v83 = &v90;
    dispatch_semaphore_t dsema = v23;
    dispatch_semaphore_t v79 = dsema;
    uint64_t v60 = (void *)MEMORY[0x1E016EA80](v76);
    long long v56 = [v24 xpcActivityManager];
    uint64_t v25 = [v24 limitedCarryManager];

    if (v25)
    {
      if (!v10->_rollbacksOnly)
      {
        long long v26 = [v24 limitedCarryManager];
        [v57 fetchExperimentNotificationsForLimitedCarryExperimentWithManager:v26 options:v59 rollbacksOnly:0 completion:v60];

        dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
      }
      uint64_t v27 = [v24 limitedCarryManager];
      [v57 fetchExperimentNotificationsForLimitedCarryExperimentWithManager:v27 options:v59 rollbacksOnly:1 completion:v60];

      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
      if (v10->_limitedCarryOnly)
      {
        uint64_t v28 = *((unsigned int *)v95 + 6);
        if (v28 == 2)
        {
          [v56 postponeCellularActivity];
          uint64_t v28 = *((unsigned int *)v95 + 6);
        }
        uint64_t v29 = (void *)[(NSMutableArray *)v10->_nextTasks copy];
        uint64_t v30 = +[TRITaskRunResult resultWithRunStatus:v28 reportResultToServer:1 nextTasks:v29 earliestRetryDate:*((void *)v99 + 5)];
        goto LABEL_59;
      }
    }
    else
    {
      long long v31 = TRILogCategory_Server();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v52 = [v24 limitedCarryManager];
        *(_DWORD *)v107 = 138543362;
        v108 = v52;
        _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Unable to fetch limited carry experiments as limitedCarryManager is: %{public}@", v107, 0xCu);
      }
    }
    [v57 fetchExperimentNotificationsWithNamespaceNames:v10->_namespaceNames rollbacksOnly:v10->_rollbacksOnly lastFetchDateOverride:v10->_startingFetchDateOverride options:v59 completion:v60];
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    if (v85[5])
    {
      v10->wasDeferred = +[TRICKNativeArtifactProvider isActivityDeferralError:](TRICKNativeArtifactProvider, "isActivityDeferralError:");
      long long v32 = TRIFetchErrorParseToMetrics((void *)v85[5]);
      if ([v32 count])
      {
        long long v54 = v11;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v72 objects:v106 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v73 != v35) {
                objc_enumerationMutation(v33);
              }
              [(TRIFetchMultipleExperimentNotificationsTask *)v10 _addMetric:*(void *)(*((void *)&v72 + 1) + 8 * i)];
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v72 objects:v106 count:16];
          }
          while (v34);
        }

        uint64_t v11 = v54;
        uint64_t v19 = v57;
      }
    }
    int v37 = *((_DWORD *)v95 + 6);
    if (v37 == 3)
    {
      namespaceNames = v10->_namespaceNames;
      if (!namespaceNames)
      {
LABEL_58:
        uint64_t v50 = *((unsigned int *)v95 + 6);
        uint64_t v29 = (void *)[(NSMutableArray *)v10->_nextTasks copy];
        uint64_t v30 = +[TRITaskRunResult resultWithRunStatus:v50 reportResultToServer:1 nextTasks:v29 earliestRetryDate:*((void *)v99 + 5)];
LABEL_59:
        uint64_t v9 = (void *)v30;

        _Block_object_dispose(&v84, 8);
        _Block_object_dispose(&v90, 8);
        _Block_object_dispose(&v94, 8);
        _Block_object_dispose(buf, 8);

        id v44 = v59;
LABEL_60:

        objc_sync_exit(v10);
        goto LABEL_61;
      }
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v38 = namespaceNames;
      uint64_t v46 = [(NSSet *)v38 countByEnumeratingWithState:&v64 objects:v104 count:16];
      if (!v46)
      {
LABEL_57:

        goto LABEL_58;
      }
      id v53 = v7;
      long long v55 = v11;
      uint64_t v47 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v65 != v47) {
            objc_enumerationMutation(v38);
          }
          uint64_t v49 = *(void *)(*((void *)&v64 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E4FB01E0], "updateStatusFetchSuccess:forNamespaceName:withContext:", 0, v49, v24, v53);
          [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:v49 withError:0];
        }
        uint64_t v46 = [(NSSet *)v38 countByEnumeratingWithState:&v64 objects:v104 count:16];
      }
      while (v46);
    }
    else
    {
      if (v37 != 2) {
        goto LABEL_58;
      }
      [v56 postponeCellularActivity];
      [(TRIFetchMultipleExperimentNotificationsTask *)v10 updateStatusForNamespacesWithContext:v24];
      if (v91[3]) {
        goto LABEL_58;
      }
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v38 = v10->_namespaceNames;
      uint64_t v39 = [(NSSet *)v38 countByEnumeratingWithState:&v68 objects:v105 count:16];
      if (!v39) {
        goto LABEL_57;
      }
      id v53 = v7;
      long long v55 = v11;
      uint64_t v40 = *(void *)v69;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v69 != v40) {
            objc_enumerationMutation(v38);
          }
          uint64_t v42 = *(void *)(*((void *)&v68 + 1) + 8 * k);
          if (-[TRIFetchMultipleExperimentNotificationsTask _checkIfAnyTreatmentPresent:usingContext:](v10, "_checkIfAnyTreatmentPresent:usingContext:", v42, v24, v53))
          {
            [MEMORY[0x1E4FB00D0] notifyDownloadCompletedForKey:v42];
          }
          else
          {
            [MEMORY[0x1E4FB01E0] updateStatusFetchSuccess:0 forNamespaceName:v42 withContext:v24];
            [MEMORY[0x1E4FB00D0] notifyDownloadFailedForKey:v42 withError:0];
          }
        }
        uint64_t v39 = [(NSSet *)v38 countByEnumeratingWithState:&v68 objects:v105 count:16];
      }
      while (v39);
    }
    id v7 = v53;
    uint64_t v11 = v55;
    uint64_t v19 = v57;
    goto LABEL_57;
  }
  uint64_t v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Skipping scheduled fetch of experiment notifications due to user opt-out of experiments", buf, 2u);
  }

  uint64_t v9 = +[TRITaskRunResult resultWithRunStatus:4 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
LABEL_61:

  return v9;
}

void __77__TRIFetchMultipleExperimentNotificationsTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2 == 2)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v10)
    {
      *(_DWORD *)(v12 + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a4);
LABEL_7:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a5);
      goto LABEL_8;
    }
LABEL_6:
    *(_DWORD *)(v12 + 24) = 3;
    goto LABEL_7;
  }
  if (!a2)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    goto LABEL_6;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(a1 + 32) _processExperiment:*(void *)(*((void *)&v19 + 1) + 8 * v16) taskContext:*(void *)(a1 + 40) taskQueue:*(void *)(a1 + 48)];
        ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
  if (a2 == 4 && v9)
  {
    if (![v9 count])
    {
      id v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Fetch status success but 0 results fetched.", v18, 2u);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
    if (a2 == 3) {
      goto LABEL_9;
    }
  }
LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
LABEL_9:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIFetchMultipleExperimentNotificationsTask *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
    if ([(TRIBaseTask *)&v14 isEqual:v4])
    {
      v5 = v4;
      if (![(TRITaskAttributing *)self->_taskAttributing isEqual:v5->_taskAttributing]) {
        goto LABEL_19;
      }
      startingFetchDateOverride = self->_startingFetchDateOverride;
      if ((unint64_t)startingFetchDateOverride | (unint64_t)v5->_startingFetchDateOverride)
      {
        if (!-[NSDate isEqual:](startingFetchDateOverride, "isEqual:")) {
          goto LABEL_19;
        }
      }
      id v7 = self->_namespaceNames;
      uint64_t v8 = v5->_namespaceNames;
      if (v7 == v8)
      {
      }
      else
      {
        id v9 = v8;
        if (v7) {
          BOOL v10 = v8 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {

          goto LABEL_19;
        }
        BOOL v12 = [(NSSet *)v7 isEqualToSet:v8];

        if (!v12) {
          goto LABEL_19;
        }
      }
      if (self->_rollbacksOnly == v5->_rollbacksOnly)
      {
        BOOL v11 = self->_limitedCarryOnly == v5->_limitedCarryOnly;
LABEL_20:

        goto LABEL_21;
      }
LABEL_19:
      BOOL v11 = 0;
      goto LABEL_20;
    }
    BOOL v11 = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
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
  return self->_limitedCarryOnly + 37 * (self->_rollbacksOnly + 37 * ((void)namespaceNames + 1369 * v3 + 37 * v5));
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%@>", objc_opt_class(), self->_startingFetchDateOverride];
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
  return +[TRITelemetryFactory containerOriginTelemetryForTaskAttribution:self->_taskAttributing];
}

- (id)_asPersistedTask
{
  unint64_t v3 = objc_opt_new();
  id v4 = [(TRITaskAttributing *)self->_taskAttributing asPersistedTaskAttribution];
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
  [v3 setRollbacksOnly:self->_rollbacksOnly];
  [v3 setLimitedCarryOnly:self->_limitedCarryOnly];
  objc_msgSend(v3, "setRetryCount:", -[TRIFetchMultipleExperimentNotificationsTask retryCount](self, "retryCount"));
  return v3;
}

- (id)serialize
{
  id v4 = [(TRIFetchMultipleExperimentNotificationsTask *)self _asPersistedTask];
  uint64_t v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIFetchMultipleExperimentNotificationsTask.m", 694, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v23 = 0;
  id v4 = +[TRIPBMessage parseFromData:a3 error:&v23];
  id v5 = v23;
  if (!v4)
  {
    id v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v5;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIFetchExperimentNotificationsPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (([v4 hasRollbacksOnly] & 1) == 0)
  {
    id v7 = TRILogCategory_Server();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      uint64_t v13 = 0;
      goto LABEL_13;
    }
    BOOL v10 = (objc_class *)objc_opt_class();
    BOOL v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138412290;
    id v25 = v11;
    BOOL v12 = "Cannot decode message of type %@ with missing field: rollbacksOnly";
LABEL_32:
    _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);

    goto LABEL_12;
  }
  if (([v4 hasTaskAttribution] & 1) == 0)
  {
    id v7 = TRILogCategory_Server();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    long long v22 = (objc_class *)objc_opt_class();
    BOOL v11 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138412290;
    id v25 = v11;
    BOOL v12 = "Cannot decode message of type %@ with missing field: taskAttribution";
    goto LABEL_32;
  }
  uint64_t v6 = [v4 taskAttribution];
  id v7 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v6];

  if (v7)
  {
    if ([v4 hasEarliestTimestamp])
    {
      id v8 = [v4 earliestTimestamp];
      id v9 = [v8 date];
    }
    else
    {
      id v9 = 0;
    }
    if (objc_msgSend(v4, "namespacesArray_Count"))
    {
      id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v16 = [v4 namespacesArray];
      id v17 = (void *)[v15 initWithArray:v16];
    }
    else
    {
      id v17 = 0;
    }
    id v18 = objc_alloc((Class)a1);
    uint64_t v19 = [v4 rollbacksOnly];
    if ([v4 limitedCarryOnly]) {
      uint64_t v20 = [v4 limitedCarryOnly];
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v13 = (void *)[v18 initWithStartingFetchDateOverride:v9 namespaceNames:v17 taskAttributing:v7 rollbacksOnly:v19 limitedCarryOnly:v20];
    if ([v4 hasRetryCount]) {
      uint64_t v21 = [v4 retryCount];
    }
    else {
      uint64_t v21 = 0;
    }
    [v13 setRetryCount:v21];
  }
  else
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "invalid de-serialized TRITaskAttribution pb message", buf, 2u);
    }
    uint64_t v13 = 0;
  }

LABEL_13:
  return v13;
}

- (unint64_t)requiredCapabilities
{
  if (self->_rollbacksOnly)
  {
    unint64_t v3 = 2;
  }
  else
  {
    id v4 = [(TRITaskAttributing *)self->_taskAttributing networkOptions];
    unint64_t v3 = [v4 requiredCapability];
  }
  if ([(TRIFetchMultipleExperimentNotificationsTask *)self retryCount]) {
    return v3 | 4;
  }
  else {
    return v3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFetchMultipleExperimentNotificationsTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIFetchMultipleExperimentNotificationsTask;
  id v5 = [(TRIFetchMultipleExperimentNotificationsTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRIFetchMultipleExperimentNotificationsTask.m", 743, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIFetchMultipleExperimentNotificationsTask *)self serialize];
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
  objc_storeStrong((id *)&self->_namespaceNames, 0);
  objc_storeStrong((id *)&self->_taskAttributing, 0);
  objc_storeStrong((id *)&self->_startingFetchDateOverride, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end