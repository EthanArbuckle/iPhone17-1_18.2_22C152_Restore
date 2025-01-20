@interface TRIRetargetAllTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)task;
+ (id)taskWithTaskAttribution:(id)a3;
- (NSArray)nextTasks;
- (TRIRetargetAllTask)initWithCoder:(id)a3;
- (TRIRetargetAllTask)initWithTaskAttribution:(id)a3;
- (id)_asPersistedTask;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (int)taskType;
- (void)encodeWithCoder:(id)a3;
- (void)setNextTasks:(id)a3;
@end

@implementation TRIRetargetAllTask

- (int)taskType
{
  return 11;
}

+ (id)taskWithTaskAttribution:(id)a3
{
  id v3 = a3;
  v4 = [[TRIRetargetAllTask alloc] initWithTaskAttribution:v3];

  return v4;
}

- (TRIRetargetAllTask)initWithTaskAttribution:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TRIRetargetAllTask;
  v6 = [(TRIRetargetAllTask *)&v14 init];
  v7 = v6;
  if (v6)
  {
    p_taskAttribution = (void **)&v6->_taskAttribution;
    objc_storeStrong((id *)&v6->_taskAttribution, a3);
    if (!*p_taskAttribution)
    {
      v9 = [TRITaskAttributionInternalInsecure alloc];
      v10 = [MEMORY[0x1E4FB00D8] inexpensiveOptions];
      uint64_t v11 = [(TRITaskAttributionInternalInsecure *)v9 initWithTeamIdentifier:0 triCloudKitContainer:1 applicationBundleIdentifier:@"com.apple.triald" networkOptions:v10];
      v12 = *p_taskAttribution;
      *p_taskAttribution = (void *)v11;
    }
  }

  return v7;
}

+ (id)task
{
  v2 = [[TRIRetargetAllTask alloc] initWithTaskAttribution:0];
  return v2;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  v7 = objc_opt_new();
  v8 = (void *)MEMORY[0x1E016E7F0]();
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F347BAC8, &unk_1F347BAE0, &unk_1F347BAF8, 0);
  v10 = [v6 experimentDatabase];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke;
  v29[3] = &unk_1E6BB9310;
  v29[4] = self;
  id v11 = v7;
  id v30 = v11;
  int v12 = [v10 enumerateExperimentRecordsMatchingStatuses:v9 block:v29];
  v13 = [v6 rolloutDatabase];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke_27;
  v27[3] = &unk_1E6BBD7D0;
  v27[4] = self;
  id v14 = v11;
  id v28 = v14;
  uint64_t v15 = 3;
  int v16 = [v13 enumerateActiveRecordsWithVisibility:3 usingTransaction:0 block:v27];
  v17 = [v6 bmltDatabase];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke_2;
  v25[3] = &unk_1E6BBD7F8;
  v25[4] = self;
  id v18 = v14;
  id v26 = v18;
  int v19 = [v17 enumerateActiveTasksWithBlock:v25];
  if (v12 && v16 && v19)
  {
    [(TRIRetargetAllTask *)self setNextTasks:v18];
    uint64_t v15 = 2;
  }
  [MEMORY[0x1E4FB0258] updateSystemInfoUsingContext:v6];
  v20 = [(TRIRetargetAllTask *)self nextTasks];
  v21 = (void *)[v20 copy];
  v22 = +[TRITaskRunResult resultWithRunStatus:v15 reportResultToServer:1 nextTasks:v21 earliestRetryDate:0];

  return v22;
}

void __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isManuallyTargeted])
  {
    v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 experimentDeployment];
      id v6 = [v5 shortDesc];
      int v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Retargeting is being suppressed for manually-targeted experiment: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (([v3 isShadow] & 1) == 0)
  {
    v7 = [v3 experimentDeployment];
    v8 = +[TRITargetingTask taskWithExperiment:v7 includeDependencies:0 taskAttribution:*(void *)(*(void *)(a1 + 32) + 24)];

    [*(id *)(a1 + 40) addObject:v8];
  }
}

void __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke_27(uint64_t a1, void *a2)
{
  id v3 = [a2 deployment];
  id v4 = +[TRIRolloutTargetingTask taskWithRolloutDeployment:v3 includeDependencies:0 taskAttribution:*(void *)(*(void *)(a1 + 32) + 24) triggerEvent:2];

  [*(id *)(a1 + 40) addObject:v4];
}

void __52__TRIRetargetAllTask_runUsingContext_withTaskQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 bmltDeployment];
  id v4 = +[TRIBMLTTargetingTask taskWithBMLTDeployment:v3 includeDependencies:0 taskAttribution:*(void *)(*(void *)(a1 + 32) + 24) triggerEvent:1];

  [*(id *)(a1 + 40) addObject:v4];
}

- (id)_asPersistedTask
{
  id v3 = objc_opt_new();
  id v4 = [(TRITaskAttributing *)self->_taskAttribution asPersistedTaskAttribution];
  [v3 setTaskAttribution:v4];

  return v3;
}

- (id)serialize
{
  id v4 = [(TRIRetargetAllTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIRetargetAllTask.m", 136, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  id v4 = +[TRIPBMessage parseFromData:a3 error:&v13];
  id v5 = v13;
  if (!v4)
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v5;
      v8 = "Unable to parse buffer as TRIRetargetAllPersistedTask: %{public}@";
      int v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_14;
    }
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  if ([v4 hasTaskAttribution])
  {
    id v6 = [v4 taskAttribution];
    v7 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v6];

    if (!v7)
    {
      v7 = TRILogCategory_Server();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v8 = "invalid de-serialized TRITaskAttribution pb message";
        int v9 = v7;
        uint32_t v10 = 2;
LABEL_14:
        _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = 0;
  }
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithTaskAttribution:v7];
LABEL_10:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRetargetAllTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRetargetAllTask;
  id v5 = [(TRIRetargetAllTask *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
    if (v6)
    {
      v7 = [(id)objc_opt_class() parseFromData:v6];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
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
    [v6 handleFailureInMethod:a2, self, @"TRIRetargetAllTask.m", 164, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIRetargetAllTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (NSArray)nextTasks
{
  return self->_nextTasks;
}

- (void)setNextTasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextTasks, 0);
  objc_storeStrong((id *)&self->_taskAttribution, 0);
}

@end