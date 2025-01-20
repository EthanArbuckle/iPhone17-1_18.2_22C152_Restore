@interface TRITempDirScopeGuard
+ (BOOL)ifUnreferencedCleanupPath:(id)a3;
+ (id)refCountsLock;
- (BOOL)dispose;
- (NSString)canonicalPath;
- (NSString)path;
- (TRITempDirScopeGuard)initWithPath:(id)a3;
- (void)dealloc;
@end

@implementation TRITempDirScopeGuard

+ (id)refCountsLock
{
  if (qword_1EA8D8218 != -1) {
    dispatch_once(&qword_1EA8D8218, &__block_literal_global_26);
  }
  v2 = (void *)_MergedGlobals_43;
  return v2;
}

void __37__TRITempDirScopeGuard_refCountsLock__block_invoke()
{
  v0 = (void *)MEMORY[0x1E016E7F0]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  v4 = (void *)_MergedGlobals_43;
  _MergedGlobals_43 = v3;
}

- (TRITempDirScopeGuard)initWithPath:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TRITempDirScopeGuard;
  v6 = [(TRITempDirScopeGuard *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v8 = [(id)objc_opt_class() refCountsLock];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__TRITempDirScopeGuard_initWithPath___block_invoke;
    v12[3] = &unk_1E6BBD820;
    id v13 = v5;
    v15 = &v16;
    v9 = v7;
    v14 = v9;
    [v8 runWithLockAcquired:v12];
    if (!*((unsigned char *)v17 + 24))
    {
      v9->_isDisposed = 1;

      _Block_object_dispose(&v16, 8);
      v10 = 0;
      goto LABEL_6;
    }

    _Block_object_dispose(&v16, 8);
  }
  v10 = v7;
LABEL_6:

  return v10;
}

void __37__TRITempDirScopeGuard_initWithPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:*(void *)(a1 + 32)] & 1) == 0)
  {
LABEL_12:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_13;
  }
  bzero(v25, 0x400uLL);
  *__error() = 0;
  v4 = realpath_DARWIN_EXTSN((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], v25);
  if (!v4)
  {
    id v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = *(char **)(a1 + 32);
      uint64_t v16 = __error();
      v17 = strerror(*v16);
      int v18 = *__error();
      int v19 = 138543874;
      objc_super v20 = v15;
      __int16 v21 = 2080;
      v22 = v17;
      __int16 v23 = 1024;
      int v24 = v18;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unable to canonicalize %{public}@: %s (%d)", (uint8_t *)&v19, 0x1Cu);
    }

    goto LABEL_12;
  }
  id v5 = v4;
  uint64_t v6 = [[NSString alloc] initWithUTF8String:v4];
  if (!v6)
  {
    v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315138;
      objc_super v20 = v5;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Canonicalized path is not Unicode: %s", (uint8_t *)&v19, 0xCu);
    }

    goto LABEL_12;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  v8 = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = v6;

  v9 = [*(id *)(a1 + 40) canonicalPath];
  v10 = [v3 objectForKeyedSubscript:v9];

  if (v10)
  {
    v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "intValue") + 1);
    v12 = [*(id *)(a1 + 40) canonicalPath];
    [v3 setObject:v11 forKeyedSubscript:v12];
  }
  else
  {
    v11 = [*(id *)(a1 + 40) canonicalPath];
    [v3 setObject:&unk_1F347BB10 forKeyedSubscript:v11];
  }

LABEL_13:
}

- (BOOL)dispose
{
  v4 = [(id)objc_opt_class() refCountsLock];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__TRITempDirScopeGuard_dispose__block_invoke;
  v6[3] = &unk_1E6BBD848;
  v6[5] = &v7;
  v6[6] = a2;
  v6[4] = self;
  [v4 runWithLockAcquired:v6];
  LOBYTE(a2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)a2;
}

void __31__TRITempDirScopeGuard_dispose__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(unsigned char **)(a1 + 32);
  if (!v4[8])
  {
    id v5 = [v4 canonicalPath];
    uint64_t v6 = [v3 objectForKeyedSubscript:v5];

    if (!v6)
    {
      int v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRITempDirScopeGuard.m", 101, @"Invalid parameter not satisfying: %@", @"prevRefCountBoxed != nil" object file lineNumber description];
    }
    int v7 = [v6 intValue];
    if (v7 > 1)
    {
      id v14 = [NSNumber numberWithInt:(v7 - 1)];
      uint64_t v16 = [*(id *)(a1 + 32) canonicalPath];
      [v3 setObject:v14 forKeyedSubscript:v16];
    }
    else
    {
      v8 = TRILogCategory_Server();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [*(id *)(a1 + 32) path];
        *(_DWORD *)buf = 138543362;
        __int16 v21 = v9;
        _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_INFO, "TRITempDirScopeGuard cleaning up: %{public}@", buf, 0xCu);
      }
      char v10 = [*(id *)(a1 + 32) canonicalPath];
      [v3 setObject:0 forKeyedSubscript:v10];

      v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      v12 = [*(id *)(a1 + 32) path];
      id v19 = 0;
      char v13 = [v11 triForceRemoveItemAtPath:v12 error:&v19];
      id v14 = v19;

      if ((v13 & 1) == 0)
      {
        v15 = TRILogCategory_Server();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v17 = [*(id *)(a1 + 32) path];
          *(_DWORD *)buf = 138543618;
          __int16 v21 = v17;
          __int16 v22 = 2114;
          id v23 = v14;
          _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "TRITempDirScopeGuard failed to clean up \"%{public}@\": %{public}@", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
}

- (void)dealloc
{
  [(TRITempDirScopeGuard *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)TRITempDirScopeGuard;
  [(TRITempDirScopeGuard *)&v3 dealloc];
}

+ (BOOL)ifUnreferencedCleanupPath:(id)a3
{
  id v3 = a3;
  v4 = [[TRITempDirScopeGuard alloc] initWithPath:v3];

  if (v4) {
    BOOL v5 = [(TRITempDirScopeGuard *)v4 dispose];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)canonicalPath
{
  return self->_canonicalPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalPath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end