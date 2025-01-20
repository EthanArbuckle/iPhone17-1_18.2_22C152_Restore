@interface TRIFileLock
+ ($A5A652246548B43F8BC05201A1C72A70)acquireLockOnPath:(id)a3 fileLockMode:(id)a4 blocking:(BOOL)a5 andRunBlock:(id)a6;
+ (int)_lockingFlagsFromFileLockMode:(id)a3;
@end

@implementation TRIFileLock

+ ($A5A652246548B43F8BC05201A1C72A70)acquireLockOnPath:(id)a3 fileLockMode:(id)a4 blocking:(BOOL)a5 andRunBlock:(id)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (void (**)(id, uint8_t *))a6;
  v12 = (void *)MEMORY[0x19F3AD060]();
  v13 = [v10 stringByAppendingString:@".lock"];
  int v14 = [a1 _lockingFlagsFromFileLockMode:a4.var0];
  if (v7) {
    int v15 = v14;
  }
  else {
    int v15 = v14 | 4;
  }
  if (a4.var0 == 1)
  {
    v17 = (void *)MEMORY[0x1E4F28CB8];
    v18 = [v13 stringByDeletingLastPathComponent];
    LODWORD(v17) = [v17 triIdempotentCreateDirectoryOrFaultWithPath:v18];

    if (!v17) {
      goto LABEL_18;
    }
    int v16 = open((const char *)[v13 fileSystemRepresentation], v15 | 0x200, 432);
  }
  else
  {
    if (a4.var0)
    {
LABEL_11:
      if (*__error() == 2)
      {
        v21.var0 = 1;
        goto LABEL_19;
      }
      if (*__error() == 35)
      {
        v21.var0 = 2;
        goto LABEL_19;
      }
      v22 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = __error();
        v25 = strerror(*v24);
        int v26 = *__error();
        *(_DWORD *)buf = 138412802;
        id v28 = v10;
        __int16 v29 = 2080;
        v30 = v25;
        __int16 v31 = 1024;
        int v32 = v26;
        _os_log_error_impl(&dword_19D909000, v22, OS_LOG_TYPE_ERROR, "Failed to open lock on path %@: %s (%d)", buf, 0x1Cu);
      }

LABEL_18:
      v21.var0 = 3;
      goto LABEL_19;
    }
    int v16 = open((const char *)[v13 fileSystemRepresentation], v15);
  }
  int v19 = v16;
  if (v16 < 0) {
    goto LABEL_11;
  }
  v20 = (void *)MEMORY[0x19F3AD060]();
  *(_DWORD *)buf = v19;
  v11[2](v11, buf);
  close(v19);
  v21.var0 = 0;
LABEL_19:

  return v21;
}

+ (int)_lockingFlagsFromFileLockMode:(id)a3
{
  if (a3.var0) {
    return 32;
  }
  else {
    return 16;
  }
}

@end