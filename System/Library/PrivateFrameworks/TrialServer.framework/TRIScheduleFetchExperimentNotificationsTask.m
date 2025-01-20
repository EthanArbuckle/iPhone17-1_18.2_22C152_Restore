@interface TRIScheduleFetchExperimentNotificationsTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithRollbacksOnly:(BOOL)a3 downloadOptions:(id)a4;
- (BOOL)isEqual:(id)a3;
- (TRIScheduleFetchExperimentNotificationsTask)initWithCoder:(id)a3;
- (TRIScheduleFetchExperimentNotificationsTask)initWithRollbacksOnly:(BOOL)a3 downloadOptions:(id)a4;
- (id)_asPersistedTask;
- (id)nextTasksForRunStatus:(int)a3;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (int)taskType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIScheduleFetchExperimentNotificationsTask

- (int)taskType
{
  return 16;
}

- (TRIScheduleFetchExperimentNotificationsTask)initWithRollbacksOnly:(BOOL)a3 downloadOptions:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TRIScheduleFetchExperimentNotificationsTask;
  v8 = [(TRIScheduleFetchExperimentNotificationsTask *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_rollbacksOnly = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

+ (id)taskWithRollbacksOnly:(BOOL)a3 downloadOptions:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = [[TRIScheduleFetchExperimentNotificationsTask alloc] initWithRollbacksOnly:v4 downloadOptions:v5];

  return v6;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [[TRITaskAttributionInternalInsecure alloc] initWithTeamIdentifier:0 triCloudKitContainer:1 applicationBundleIdentifier:@"com.apple.triald" networkOptions:self->_options];
  v46 = v6;
  if (+[TRIUserAdjustableSettings getExperimentOptOut:v6])
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Skipping scheduling of experiment notification fetch task due to user opt-out of experiments", buf, 2u);
    }

    v9 = (NSMutableArray *)objc_opt_new();
    nextTasks = self->_nextTasks;
    self->_nextTasks = v9;

    if (!self->_rollbacksOnly)
    {
      objc_super v11 = self->_nextTasks;
      v12 = +[TRISelectRolloutNotificationListTask taskWithNamespaceNames:0 taskAttribution:v7];
      [(NSMutableArray *)v11 addObject:v12];
    }
    v13 = +[TRITaskRunResult resultWithRunStatus:2 reportResultToServer:1 nextTasks:self->_nextTasks earliestRetryDate:0];
  }
  else
  {
    v14 = (NSMutableArray *)objc_opt_new();
    v15 = self->_nextTasks;
    self->_nextTasks = v14;

    v16 = self->_nextTasks;
    v17 = +[TRIFetchMultipleExperimentNotificationsTask taskWithStartingFetchDateOverride:0 namespaceNames:0 taskAttributing:v7 rollbacksOnly:self->_rollbacksOnly limitedCarryOnly:0];
    [(NSMutableArray *)v16 addObject:v17];

    if (!self->_rollbacksOnly)
    {
      v18 = self->_nextTasks;
      v19 = +[TRISelectRolloutNotificationListTask taskWithNamespaceNames:0 taskAttribution:v7];
      [(NSMutableArray *)v18 addObject:v19];
    }
    v20 = objc_opt_new();
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __77__TRIScheduleFetchExperimentNotificationsTask_runUsingContext_withTaskQueue___block_invoke;
    v51[3] = &unk_1E6BB8258;
    id v21 = v20;
    id v52 = v21;
    v53 = self;
    v22 = (void *)MEMORY[0x1E016EA80](v51);
    v23 = [v46 namespaceDatabase];
    char v24 = [v23 enumerateAppContainerIdsForContainer:2 block:v22];

    if (v24)
    {
      SEL v41 = a2;
      v42 = v22;
      id v43 = v21;
      v44 = v7;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = [v21 allValues];
      uint64_t v25 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v48;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v48 != v27) {
              objc_enumerationMutation(obj);
            }
            v29 = *(void **)(*((void *)&v47 + 1) + 8 * v28);
            v30 = [v46 namespaceDatabase];
            v31 = [v29 teamIdentifier];
            if (!v31)
            {
              v37 = [MEMORY[0x1E4F28B00] currentHandler];
              [v37 handleFailureInMethod:v41, self, @"TRIScheduleFetchExperimentNotificationsTask.m", 104, @"Expression was unexpectedly nil/false: %@", @"taskAttributing.teamIdentifier" object file lineNumber description];
            }
            int v32 = [v30 hasUnfetchedNamespaceForTeamId:v31];

            if (self->_rollbacksOnly || v32)
            {
              v34 = [MEMORY[0x1E4F1C9C8] distantPast];
              BOOL rollbacksOnly = self->_rollbacksOnly;
            }
            else
            {
              BOOL rollbacksOnly = 0;
              v34 = 0;
            }
            v35 = self->_nextTasks;
            v36 = +[TRIFetchMultipleExperimentNotificationsTask taskWithStartingFetchDateOverride:v34 namespaceNames:0 taskAttributing:v29 rollbacksOnly:rollbacksOnly limitedCarryOnly:0];
            [(NSMutableArray *)v35 addObject:v36];

            ++v28;
          }
          while (v26 != v28);
          uint64_t v26 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
        }
        while (v26);
      }

      v38 = (void *)[(NSMutableArray *)self->_nextTasks copy];
      v13 = +[TRITaskRunResult resultWithRunStatus:2 reportResultToServer:1 nextTasks:v38 earliestRetryDate:0];
      id v21 = v43;
      id v7 = v44;
      v22 = v42;
    }
    else
    {
      v39 = TRILogCategory_Server();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "failed to schedule fetching experiments for all containers", buf, 2u);
      }

      v38 = (void *)[(NSMutableArray *)self->_nextTasks copy];
      v13 = +[TRITaskRunResult resultWithRunStatus:3 reportResultToServer:1 nextTasks:v38 earliestRetryDate:0];
    }
  }
  return v13;
}

void __77__TRIScheduleFetchExperimentNotificationsTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v12 = a2;
  id v7 = a3;
  v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  v9 = v8;
  if (!v8
    || ([v8 applicationBundleIdentifier],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        a4 == 2)
    && !v10)
  {
    objc_super v11 = [[TRITaskAttributionInternalInsecure alloc] initWithTeamIdentifier:v7 triCloudKitContainer:2 applicationBundleIdentifier:v12 networkOptions:*(void *)(*(void *)(a1 + 40) + 40)];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v7];
  }
}

- (id)nextTasksForRunStatus:(int)a3
{
  return self->_nextTasks;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TRIScheduleFetchExperimentNotificationsTask;
  if ([(TRIBaseTask *)&v7 isEqual:v4] && self->_rollbacksOnly == *((unsigned __int8 *)v4 + 24)) {
    char v5 = [(TRIDownloadOptions *)self->_options isEqual:v4[5]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)TRIScheduleFetchExperimentNotificationsTask;
  return self->_rollbacksOnly + 37 * [(TRIBaseTask *)&v3 hash];
}

- (id)_asPersistedTask
{
  objc_super v3 = objc_opt_new();
  [v3 setRollbacksOnly:self->_rollbacksOnly];
  BOOL v4 = [(TRIDownloadOptions *)self->_options serializeToPersistedBehavior];
  [v3 setNetworkBehavior:v4];

  return v3;
}

- (id)serialize
{
  BOOL v4 = [(TRIScheduleFetchExperimentNotificationsTask *)self _asPersistedTask];
  char v5 = [v4 data];

  if (!v5)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIScheduleFetchExperimentNotificationsTask.m", 160, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  objc_super v3 = +[TRIPBMessage parseFromData:a3 error:&v11];
  id v4 = v11;
  if (!v3)
  {
    char v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v4;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIScheduleFetchExperimentNotificationsPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (([v3 hasRollbacksOnly] & 1) == 0)
  {
    char v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412290;
      id v13 = v10;
      _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: rollbacksOnly", buf, 0xCu);
    }
LABEL_11:
    objc_super v7 = 0;
    goto LABEL_15;
  }
  if ([v3 hasNetworkBehavior])
  {
    char v5 = [v3 networkBehavior];
    if (v5)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB00D8]) initFromPersistedBehavior:v5];
      if (v6) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    char v5 = 0;
  }
  id v6 = [MEMORY[0x1E4FB00D8] inexpensiveOptions];
LABEL_14:
  objc_super v7 = +[TRIScheduleFetchExperimentNotificationsTask taskWithRollbacksOnly:downloadOptions:](TRIScheduleFetchExperimentNotificationsTask, "taskWithRollbacksOnly:downloadOptions:", [v3 rollbacksOnly], v6);

LABEL_15:
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIScheduleFetchExperimentNotificationsTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIScheduleFetchExperimentNotificationsTask;
  char v5 = [(TRIScheduleFetchExperimentNotificationsTask *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
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
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIScheduleFetchExperimentNotificationsTask.m", 186, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  char v5 = [(TRIScheduleFetchExperimentNotificationsTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_nextTasks, 0);
}

@end