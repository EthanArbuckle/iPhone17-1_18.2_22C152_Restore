@interface TRIConfigurationTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
- (TRIConfigurationTask)initWithCoder:(id)a3;
- (id)_asPersistedTask;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (int)taskType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIConfigurationTask

- (int)taskType
{
  return 13;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  v4 = (objc_class *)MEMORY[0x1E4FB0258];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 paths];

  v8 = (void *)[v6 initWithPaths:v7];
  v9 = [v8 createPersistentDeviceIdentifier];
  if (v9) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 3;
  }
  v11 = +[TRITaskRunResult resultWithRunStatus:v10 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];

  return v11;
}

- (id)_asPersistedTask
{
  v2 = objc_opt_new();
  return v2;
}

- (id)serialize
{
  v4 = [(TRIConfigurationTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRIConfigurationTask.m", 45, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
  }
  return v5;
}

+ (id)parseFromData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v3 = +[TRIPBMessage parseFromData:a3 error:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = objc_opt_new();
  }
  else
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRIConfigurationPersistedTask: %{public}@", buf, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIConfigurationTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIConfigurationTask;
  id v5 = [(TRIConfigurationTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRIConfigurationTask.m", 63, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRIConfigurationTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

@end