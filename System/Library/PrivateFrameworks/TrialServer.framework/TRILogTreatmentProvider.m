@interface TRILogTreatmentProvider
+ (BOOL)deleteFileAtPath:(id)a3;
+ (id)providerWithProjectId:(int)a3 paths:(id)a4;
- (BOOL)addTreatment:(id)a3;
- (BOOL)saveTreatments:(id)a3;
- (void)removeTreatment:(id)a3;
- (void)updatePersistedLogNamespace:(id)a3;
@end

@implementation TRILogTreatmentProvider

+ (id)providerWithProjectId:(int)a3 paths:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  int IsValidValue = TRIProject_ProjectId_IsValidValue();
  v7 = 0;
  if (v4 && IsValidValue) {
    v7 = [(TRILogTreatmentReader *)[TRILogTreatmentProvider alloc] initWithProjectId:v4 paths:v5];
  }

  return v7;
}

+ (BOOL)deleteFileAtPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (![v4 fileExistsAtPath:v3]
    || ((v12 = 0, int v5 = [v4 removeItemAtPath:v3 error:&v12], v6 = v12, v5)
      ? (BOOL v7 = v6 == 0)
      : (BOOL v7 = 0),
        v7))
  {
    BOOL v10 = 1;
  }
  else
  {
    v8 = v6;
    v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = v3;
      __int16 v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "failed to remove file %{public}@ -- %{public}@", buf, 0x16u);
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)saveTreatments:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(TRILogTreatmentReader *)self path];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = 0;
  BOOL v7 = [v6 triCreateDirectoryForPath:v5 isDirectory:0 error:&v20];
  v8 = v20;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    if (![v4 count])
    {
      BOOL v11 = +[TRILogTreatmentProvider deleteFileAtPath:v5];
      goto LABEL_20;
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4FB0550]);
    [v12 setTreatments:v4];
    [v12 setMetrics:0];
    [v12 setSubject:0];
    [v12 setSystemDimensions:0];
    [v12 setUserDimensions:0];
    v13 = [v12 data];
    if ([v13 length])
    {
      id v19 = 0;
      BOOL v11 = 1;
      int v14 = [v13 writeToFile:v5 options:1 error:&v19];
      __int16 v15 = v19;
      v16 = v15;
      if (v14 && !v15) {
        goto LABEL_19;
      }
      uint64_t v17 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v22 = v5;
        __int16 v23 = 2114;
        v24 = v16;
        _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "failed to write treatments to file %{public}@ -- %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v16 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v22 = 0;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "failed to serialize treatments -- %{public}@", buf, 0xCu);
      }
    }

    BOOL v11 = 0;
LABEL_19:

    goto LABEL_20;
  }
  BOOL v10 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v5;
    __int16 v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "failed to create directory for file %{public}@ -- %{public}@", buf, 0x16u);
  }

  BOOL v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)addTreatment:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18 = self;
  int v5 = [(TRILogTreatmentReader *)self treatments];
  if (!v5) {
    int v5 = objc_opt_new();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      uint64_t v11 = 0;
      unint64_t v12 = v8 + v9;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = [*(id *)(*((void *)&v19 + 1) + 8 * v11) treatmentId];
        int v14 = [v4 treatmentId];
        char v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          unint64_t v12 = v9 + v11;
          goto LABEL_14;
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      unint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
LABEL_14:

  if (v12 >= [v6 count]) {
    [v6 addObject:v4];
  }
  else {
    [v6 setObject:v4 atIndexedSubscript:v12];
  }
  BOOL v16 = [(TRILogTreatmentProvider *)v18 saveTreatments:v6];

  return v16;
}

- (void)removeTreatment:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(TRILogTreatmentReader *)self treatments];
  id v6 = v5;
  if (v5)
  {
    uint64_t v17 = self;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        uint64_t v12 = 0;
        unint64_t v13 = v9 + v10;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v7);
          }
          int v14 = [*(id *)(*((void *)&v18 + 1) + 8 * v12) treatmentId];
          char v15 = [v14 isEqualToString:v4];

          if (v15)
          {
            unint64_t v13 = v10 + v12;
            goto LABEL_16;
          }
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        unint64_t v10 = v13;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v13 = 0;
    }
LABEL_16:

    if (v13 < [v7 count])
    {
      [v7 removeObjectAtIndex:v13];
      [(TRILogTreatmentProvider *)v17 saveTreatments:v7];
    }
  }
  else
  {
    BOOL v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "asked to remove treatment %@ from logging but no existing treatments", buf, 0xCu);
    }
  }
}

- (void)updatePersistedLogNamespace:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(TRILogTreatmentReader *)self fetchRolloutLogNamespaces];
  id v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v11), "name", (void)v20);
        unint64_t v13 = [v4 name];
        char v14 = [v12 isEqualToString:v13];

        if ((v14 & 1) == 0) {
          [v6 addNamespace:v4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v9);
  }

  [v6 addNamespace:v4];
  char v15 = [v6 data];
  BOOL v16 = [(TRILogTreatmentReader *)self namespaceLoggingTreatmentPath];
  char v17 = [v15 writeToFile:v16 atomically:1];

  if ((v17 & 1) == 0)
  {
    long long v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = [(TRILogTreatmentReader *)self namespaceLoggingTreatmentPath];
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v19;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "failed writing rolloutcounts to %@", buf, 0xCu);
    }
  }
}

@end