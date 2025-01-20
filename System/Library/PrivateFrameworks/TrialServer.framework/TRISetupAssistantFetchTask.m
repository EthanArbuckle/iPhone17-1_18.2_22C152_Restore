@interface TRISetupAssistantFetchTask
+ (BOOL)supportsSecureCoding;
+ (id)parseFromData:(id)a3;
+ (id)task;
- (TRISetupAssistantFetchTask)initWithCoder:(id)a3;
- (id)_asPersistedTask;
- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4;
- (id)serialize;
- (int)taskType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRISetupAssistantFetchTask

- (int)taskType
{
  return 24;
}

+ (id)task
{
  v2 = objc_opt_new();
  return v2;
}

- (id)runUsingContext:(id)a3 withTaskQueue:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)MEMORY[0x1E4FB01A0];
  v9 = [v5 paths];
  v10 = [v9 namespaceDescriptorsDefaultDir];
  v11 = [v8 descriptorsForDirectory:v10 filterBlock:&__block_literal_global_29];

  uint64_t v12 = [v11 count];
  v13 = TRILogCategory_Server();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    id v42 = v5;
    if (v14)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v49 = [v11 count];
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "TRISetupAssistantFetchTask: found %lu descriptors with enableFetchDuringSetupAssistant enabled", buf, 0xCu);
    }
    v43 = v7;
    id v41 = v6;

    v15 = objc_opt_new();
    v16 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v17 = v11;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      v20 = 0;
      uint64_t v21 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(v17);
          }
          v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (![(__CFString *)v20 length])
          {
            uint64_t v24 = [v23 resourceAttributionIdentifier];

            v20 = (__CFString *)v24;
          }
          v25 = [v23 namespaceName];
          [v16 addObject:v25];

          v26 = [v23 namespaceName];
          [v15 addObject:v26];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

    if (![(__CFString *)v20 length])
    {

      v20 = @"com.apple.triald";
    }
    id v5 = v42;
    v7 = v43;
    if (+[TRISetupAssistantFetchUtils removeNamespaceNamesWithRolloutForServerContext:v42 namespaceNames:v16])
    {
      if ([v16 count])
      {
        [v15 minusSet:v16];
        if ([v15 count])
        {
          v28 = TRILogCategory_Server();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = [v15 allObjects];
            v30 = [v16 allObjects];
            *(_DWORD *)buf = 138412546;
            uint64_t v49 = (uint64_t)v29;
            __int16 v50 = 2114;
            v51 = v30;
            _os_log_impl(&dword_1DA291000, v28, OS_LOG_TYPE_DEFAULT, "TRISetupAssistantFetchTask: ncv-compatible rollout v2 are present for namespace names: %@ and are NOT present for  namespace names: %{public}@", buf, 0x16u);
          }
        }
        v31 = (void *)[objc_alloc(MEMORY[0x1E4FB00D8]) initWithAllowsCellular:0 discretionaryBehavior:0];
        v32 = [[TRITaskAttributionInternalInsecure alloc] initWithTeamIdentifier:0 triCloudKitContainer:1 applicationBundleIdentifier:v20 networkOptions:v31];
        v33 = TRILogCategory_Server();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v49 = (uint64_t)v16;
          __int16 v50 = 2112;
          v51 = v32;
          _os_log_impl(&dword_1DA291000, v33, OS_LOG_TYPE_DEFAULT, "TRISetupAssistantFetchTask: submitting TRISelectRolloutNotificationListTask with the following namespace names: %{public}@ and task attributing: %@", buf, 0x16u);
        }

        v34 = +[TRISelectRolloutNotificationListTask taskWithNamespaceNames:v16 taskAttribution:v32];
        [v43 addObject:v34];

        v35 = (void *)[v43 copy];
        v27 = +[TRITaskRunResult resultWithRunStatus:2 reportResultToServer:1 nextTasks:v35 earliestRetryDate:0];

        v7 = v43;
        goto LABEL_36;
      }
      v39 = TRILogCategory_Server();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA291000, v39, OS_LOG_TYPE_DEFAULT, "TRISetupAssistantFetchTask: download is not needed, ncv-compatible rollouts v2 are all present on the device for namespaces names with enableFetchDuringSetupAssistant flag enabled", buf, 2u);
      }

      uint64_t v37 = MEMORY[0x1E4F1CBF0];
      uint64_t v38 = 2;
    }
    else
    {
      v36 = TRILogCategory_Server();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v36, OS_LOG_TYPE_ERROR, "The rollout database query failed.", buf, 2u);
      }

      uint64_t v37 = MEMORY[0x1E4F1CBF0];
      uint64_t v38 = 3;
    }
    v27 = +[TRITaskRunResult resultWithRunStatus:v38 reportResultToServer:1 nextTasks:v37 earliestRetryDate:0];
LABEL_36:

    id v6 = v41;
    goto LABEL_37;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "TRISetupAssistantFetchTask: did not find descriptors with enableFetchDuringSetupAssistant enabled", buf, 2u);
  }

  v27 = +[TRITaskRunResult resultWithRunStatus:2 reportResultToServer:1 nextTasks:MEMORY[0x1E4F1CBF0] earliestRetryDate:0];
LABEL_37:

  return v27;
}

uint64_t __60__TRISetupAssistantFetchTask_runUsingContext_withTaskQueue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enableFetchDuringSetupAssistant];
}

- (id)_asPersistedTask
{
  v2 = objc_opt_new();
  return v2;
}

- (id)serialize
{
  v4 = [(TRISetupAssistantFetchTask *)self _asPersistedTask];
  id v5 = [v4 data];

  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"TRISetupAssistantFetchTask.m", 136, @"Unexpected failure to serialize %@", v9 object file lineNumber description];
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
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Unable to parse buffer as TRISetupAssistantFetchTask: %{public}@", buf, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRISetupAssistantFetchTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISetupAssistantFetchTask;
  id v5 = [(TRISetupAssistantFetchTask *)&v9 init];
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
    [v6 handleFailureInMethod:a2, self, @"TRISetupAssistantFetchTask.m", 154, @"Don't use NSSecureCoding to persist tasks to disk, use -[TRITask serialize]." object file lineNumber description];
  }
  id v5 = [(TRISetupAssistantFetchTask *)self serialize];
  [v7 encodeObject:v5 forKey:@"pb"];
}

@end