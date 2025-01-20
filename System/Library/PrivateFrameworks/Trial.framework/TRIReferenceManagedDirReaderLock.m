@interface TRIReferenceManagedDirReaderLock
- (TRIReferenceManagedDirReaderLock)initWithDir:(id)a3;
- (void)dealloc;
- (void)unlock;
@end

@implementation TRIReferenceManagedDirReaderLock

- (TRIReferenceManagedDirReaderLock)initWithDir:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRIReferenceManagedDirReaderLock.m", 39, @"Invalid parameter not satisfying: %@", @"dir" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)TRIReferenceManagedDirReaderLock;
  v7 = [(TRIReferenceManagedDirReaderLock *)&v28 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_14;
  }
  p_dir = &v7->_dir;
  objc_storeStrong((id *)&v7->_dir, a3);
  int v10 = open([(NSString *)v8->_dir fileSystemRepresentation], 0x100000);
  if (v10 < 0)
  {
    v13 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = *p_dir;
      v24 = __error();
      v25 = strerror(*v24);
      int v26 = *__error();
      *(_DWORD *)buf = 138412802;
      v30 = v23;
      __int16 v31 = 2080;
      v32 = v25;
      __int16 v33 = 1024;
      int v34 = v26;
      _os_log_error_impl(&dword_19D909000, v13, OS_LOG_TYPE_ERROR, "Unable to open managed-directory \"%@\" to acquire lock: %s (%d)", buf, 0x1Cu);
    }

    goto LABEL_12;
  }
  int v11 = v10;
  if (!flock(v10, 5))
  {
    v15 = (_DWORD *)objc_opt_new();
    v15[2] = v11;
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v15];
    lock = v8->_lock;
    v8->_lock = (_PASLock *)v16;

LABEL_14:
    v14 = v8;
    goto LABEL_15;
  }
  v12 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v19 = *p_dir;
    v20 = __error();
    v21 = strerror(*v20);
    int v22 = *__error();
    *(_DWORD *)buf = 138412802;
    v30 = v19;
    __int16 v31 = 2080;
    v32 = v21;
    __int16 v33 = 1024;
    int v34 = v22;
    _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "Unable to acquire shared lock on managed-directory \"%@\": %s (%d)", buf, 0x1Cu);
  }

  close(v11);
LABEL_12:
  v14 = 0;
LABEL_15:

  return v14;
}

- (void)unlock
{
}

void __42__TRIReferenceManagedDirReaderLock_unlock__block_invoke(uint64_t a1, int *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = a2[2];
  if ((v2 & 0x80000000) == 0)
  {
    v4 = a2;
    if (flock(v2, 8))
    {
      v5 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = __error();
        v7 = strerror(*v6);
        int v8 = *__error();
        int v9 = 136315394;
        int v10 = v7;
        __int16 v11 = 1024;
        int v12 = v8;
        _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "Unable to unlock managed-directory: %s (%d)", (uint8_t *)&v9, 0x12u);
      }
    }
    close(a2[2]);
    a2[2] = -1;
  }
}

- (void)dealloc
{
  [(TRIReferenceManagedDirReaderLock *)self unlock];
  v3.receiver = self;
  v3.super_class = (Class)TRIReferenceManagedDirReaderLock;
  [(TRIReferenceManagedDirReaderLock *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_dir, 0);
}

@end