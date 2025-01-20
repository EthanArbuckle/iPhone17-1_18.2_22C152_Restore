@interface TRIRecurrentScheduleFetchRollbacksTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)taskWithAttribution:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)tags;
- (TRIRecurrentScheduleFetchRollbacksTask)initWithCoder:(id)a3;
- (TRIRecurrentScheduleFetchRollbacksTask)initWithTaskAttribution:(id)a3 isRepeatedInstance:(BOOL)a4;
- (id)_asPersistedTask;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (int)taskType;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIRecurrentScheduleFetchRollbacksTask

+ (id)taskWithAttribution:(id)a3
{
  id v3 = a3;
  v4 = [[TRIRecurrentScheduleFetchRollbacksTask alloc] initWithTaskAttribution:v3 isRepeatedInstance:0];

  return v4;
}

- (TRIRecurrentScheduleFetchRollbacksTask)initWithTaskAttribution:(id)a3 isRepeatedInstance:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRIRecurrentScheduleFetchRollbacksTask;
  v8 = [(TRIRecurrentScheduleFetchRollbacksTask *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_taskAttribution, a3);
    v9->_isRepeatedInstance = a4;
  }

  return v9;
}

- (NSArray)tags
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v9.receiver = self;
  v9.super_class = (Class)TRIRecurrentScheduleFetchRollbacksTask;
  uint64_t v4 = [(TRIBaseTask *)&v9 tags];
  v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  id v7 = (void *)[v3 initWithArray:v6];

  [v7 addObject:@"ScheduleFetchRollbacks"];
  +[TRITaskUtils addAttribution:self->_taskAttribution toTaskTags:v7];
  return (NSArray *)v7;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "TRIRecurrentScheduleFetchRollbacksTask is deprecated. Completing task without completing any work", v7, 2u);
  }

  v5 = +[TRITaskRunResult resultWithRunStatus:2 reportResultToServer:0 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TRIRecurrentScheduleFetchRollbacksTask *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)TRIRecurrentScheduleFetchRollbacksTask;
    if ([(TRIBaseTask *)&v14 isEqual:v4])
    {
      taskAttribution = self->_taskAttribution;
      uint64_t v6 = v4;
      id v7 = [(TRITaskAttributing *)taskAttribution asPersistedTaskAttribution];
      v8 = [v7 data];
      objc_super v9 = v6->_taskAttribution;

      v10 = [(TRITaskAttributing *)v9 asPersistedTaskAttribution];
      objc_super v11 = [v10 data];
      char v12 = [v8 isEqual:v11];
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)TRIRecurrentScheduleFetchRollbacksTask;
  uint64_t v3 = 37 * [(TRIBaseTask *)&v8 hash];
  uint64_t v4 = v3 + (int)[(TRITaskAttributing *)self->_taskAttribution triCloudKitContainer];
  v5 = [(TRITaskAttributing *)self->_taskAttribution teamIdentifier];
  unint64_t v6 = [v5 hash] + 37 * v4;

  return v6;
}

- (int)taskType
{
  return 18;
}

- (id)_asPersistedTask
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(TRITaskAttributing *)self->_taskAttribution asPersistedTaskAttribution];
  [v3 setTaskAttribution:v4];

  [v3 setIsRepeatedInstance:self->_isRepeatedInstance];
  return v3;
}

- (id)serialize
{
  uint64_t v4 = [(TRIRecurrentScheduleFetchRollbacksTask *)self _asPersistedTask];
  v5 = [v4 data];

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIRecurrentScheduleFetchRollbacksTask.m", 113, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  uint64_t v3 = +[TRIPBMessage parseFromData:a3 error:&v14];
  id v4 = v14;
  if (!v3)
  {
    unint64_t v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIRecurrentScheduleFetchRollbacksPersistedTask: %{public}@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (([v3 hasTaskAttribution] & 1) == 0)
  {
    unint64_t v6 = TRILogCategory_Server();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    objc_super v8 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138412290;
    id v16 = v9;
    v10 = "Cannot decode message of type %@ with missing field: taskAttribution";
LABEL_12:
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);

    goto LABEL_16;
  }
  if (([v3 hasIsRepeatedInstance] & 1) == 0)
  {
    unint64_t v6 = TRILogCategory_Server();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    objc_super v11 = (objc_class *)objc_opt_class();
    objc_super v9 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138412290;
    id v16 = v9;
    v10 = "Cannot decode message of type %@ with missing field: isRepeatedInstance";
    goto LABEL_12;
  }
  v5 = [v3 taskAttribution];
  unint64_t v6 = +[TRITaskAttributionInternalInsecure taskAttributionFromPersistedTask:v5];

  if (v6)
  {
    id v7 = -[TRIRecurrentScheduleFetchRollbacksTask initWithTaskAttribution:isRepeatedInstance:]([TRIRecurrentScheduleFetchRollbacksTask alloc], "initWithTaskAttribution:isRepeatedInstance:", v6, [v3 isRepeatedInstance]);
    goto LABEL_17;
  }
  char v12 = TRILogCategory_Server();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "failed to construct TRITaskAttributionInternalInsecure object", buf, 2u);
  }

  unint64_t v6 = 0;
LABEL_16:
  id v7 = 0;
LABEL_17:

  return v7;
}

- (unint64_t)requiredCapabilities
{
  v2 = [(TRITaskAttributing *)self->_taskAttribution networkOptions];
  unint64_t v3 = [v2 requiredCapability];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIRecurrentScheduleFetchRollbacksTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIRecurrentScheduleFetchRollbacksTask;
  v5 = [(TRIRecurrentScheduleFetchRollbacksTask *)&v9 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pb"];
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
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIRecurrentScheduleFetchRollbacksTask.m", 148, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  v5 = [(TRIRecurrentScheduleFetchRollbacksTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

- (void).cxx_destruct
{
}

@end