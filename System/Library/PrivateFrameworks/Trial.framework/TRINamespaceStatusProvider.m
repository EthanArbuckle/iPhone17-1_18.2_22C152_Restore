@interface TRINamespaceStatusProvider
- (BOOL)deleteStatusForNamespaceWithName:(id)a3;
- (BOOL)saveNamespaceStatus:(id)a3 toURL:(id)a4;
- (BOOL)saveStatus:(id)a3;
- (BOOL)updateStatusForNamespaceWithName:(id)a3 usingBlock:(id)a4;
- (TRINamespaceStatusProvider)initWithPaths:(id)a3;
- (id)loadNamespaceStatusFromURL:(id)a3;
- (id)statusForNamespaceWithName:(id)a3;
- (id)urlForStatusWithNamespaceName:(id)a3;
@end

@implementation TRINamespaceStatusProvider

- (TRINamespaceStatusProvider)initWithPaths:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRINamespaceStatusProvider;
  v6 = [(TRINamespaceStatusProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_paths, a3);
  }

  return v7;
}

- (id)urlForStatusWithNamespaceName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRINamespaceStatusProvider.m", 87, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v6 = [[TRITreatmentInfo alloc] initWithPaths:self->_paths];
  v7 = [(TRITreatmentInfo *)v6 baseUrlForTreatmentsWithNamespaceName:v5];
  v8 = [v7 URLByAppendingPathComponent:@"namespace-status.pb"];

  if (!v8)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRINamespaceStatusProvider.m", 91, @"URL for namespace status is nil for %@", v5 object file lineNumber description];
  }
  return v8;
}

- (id)statusForNamespaceWithName:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TRINamespaceStatusProvider *)self urlForStatusWithNamespaceName:v4];
  v6 = [(TRINamespaceStatusProvider *)self loadNamespaceStatusFromURL:v5];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 namespaceName];
    char v9 = [v4 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      v10 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = [v7 namespaceName];
        int v13 = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        v16 = v12;
        _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "status has mismatched namespace name: %@ != %@", (uint8_t *)&v13, 0x16u);
      }
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)saveStatus:(id)a3
{
  id v5 = a3;
  v6 = [v5 namespaceName];

  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRINamespaceStatusProvider.m", 107, @"Invalid parameter not satisfying: %@", @"status.namespaceName" object file lineNumber description];
  }
  v7 = [v5 namespaceName];
  v8 = [(TRINamespaceStatusProvider *)self urlForStatusWithNamespaceName:v7];

  BOOL v9 = [(TRINamespaceStatusProvider *)self saveNamespaceStatus:v5 toURL:v8];
  return v9;
}

- (BOOL)updateStatusForNamespaceWithName:(id)a3 usingBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  uint64_t v8 = [(TRINamespaceStatusProvider *)self statusForNamespaceWithName:v6];
  uint64_t v9 = v7[2](v7, v8);

  if (!(v8 | v9))
  {
    BOOL v10 = 1;
    goto LABEL_11;
  }
  if (!v9)
  {
    BOOL v13 = [(TRINamespaceStatusProvider *)self deleteStatusForNamespaceWithName:v6];
    goto LABEL_7;
  }
  v11 = [(id)v9 namespaceName];
  char v12 = [v6 isEqualToString:v11];

  if (v12)
  {
    BOOL v13 = [(TRINamespaceStatusProvider *)self saveStatus:v9];
LABEL_7:
    BOOL v10 = v13;
    goto LABEL_11;
  }
  id v14 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v16 = [(id)v9 namespaceName];
    int v17 = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_error_impl(&dword_19D909000, v14, OS_LOG_TYPE_ERROR, "status has mismatched namespace name: %@ != %@", (uint8_t *)&v17, 0x16u);
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)deleteStatusForNamespaceWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRINamespaceStatusProvider.m", 131, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  id v6 = [(TRINamespaceStatusProvider *)self urlForStatusWithNamespaceName:v5];
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = 0;
  char v8 = [v7 removeItemAtURL:v6 error:&v13];
  id v9 = v13;

  if ((v8 & 1) == 0)
  {
    BOOL v10 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "failed to remove status file for namespace %@ -- %@", buf, 0x16u);
    }
  }
  return v8;
}

- (id)loadNamespaceStatusFromURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v8 = 0;
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:1 error:&v8];
  if (v5)
  {
    id v6 = +[TRINamespaceStatus statusFromData:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)saveNamespaceStatus:(id)a3 toURL:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x19F3AD060]();
  BOOL v10 = [v7 asData];
  if (!v10)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [v7 namespaceName];
    [v21 handleFailureInMethod:a2, self, @"TRINamespaceStatusProvider.m", 156, @"failed to serialize status for namespace: %@", v22 object file lineNumber description];
  }
  v11 = [v8 URLByDeletingLastPathComponent];
  if (!v11)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRINamespaceStatusProvider.m", 159, @"Invalid parameter not satisfying: %@", @"parentUrl" object file lineNumber description];
  }
  char v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v25 = 0;
  int v13 = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v14 = v25;

  if (!v13
    || (id v24 = v14,
        BOOL v15 = 1,
        char v16 = [v10 writeToURL:v8 options:1 error:&v24],
        id v17 = v24,
        v14,
        id v14 = v17,
        (v16 & 1) == 0))
  {
    uint64_t v18 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = [v7 namespaceName];
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      __int16 v28 = 2112;
      id v29 = v14;
      _os_log_error_impl(&dword_19D909000, v18, OS_LOG_TYPE_ERROR, "failed to write status for namespace %@ -- %@", buf, 0x16u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
}

@end