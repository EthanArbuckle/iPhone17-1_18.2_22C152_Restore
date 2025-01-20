@interface WBSFileLockFactoryPOSIX
- (id)coordinationLockURL:(id)a3;
- (id)lockURL:(id)a3 error:(id *)a4;
@end

@implementation WBSFileLockFactoryPOSIX

- (id)coordinationLockURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 scheme];
  char v5 = [v4 isEqualToString:@"file"];

  if (v5)
  {
    v6 = [v3 path];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F1CB10];
      v9 = [v3 absoluteString];
      v10 = [v9 stringByAppendingString:@"-lock"];
      v11 = [v8 URLWithString:v10];

      goto LABEL_7;
    }
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WBSFileLockFactoryPOSIX coordinationLockURL:]((uint64_t)v3, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)lockURL:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 scheme];
  char v8 = [v7 isEqualToString:@"file"];

  if ((v8 & 1) == 0)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    }
    uint64_t v14 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[WBSFileLockFactoryPOSIX coordinationLockURL:]((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);
    }
    goto LABEL_14;
  }
  id v9 = [(WBSFileLockFactoryPOSIX *)self coordinationLockURL:v6];
  v10 = (const char *)[v9 fileSystemRepresentation];

  if (!v10)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    }
    v21 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[WBSFileLockFactoryPOSIX lockURL:error:]((uint64_t)v6, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_14;
  }
  uint64_t v11 = open(v10, 512, 438);
  if (v11 != -1)
  {
    uint64_t v12 = v11;
    if (flock(v11, 6) != -1)
    {
      uint64_t v13 = [[WBSFileLockPOSIX alloc] initWithFileDescriptor:v12];
      goto LABEL_15;
    }
    uint64_t v34 = *__error();
    close(v12);
    v35 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = v35;
      int v37 = *__error();
      *(_DWORD *)buf = 136380931;
      v39 = v10;
      __int16 v40 = 1024;
      int v41 = v37;
      _os_log_impl(&dword_1A6B5F000, v36, OS_LOG_TYPE_INFO, "Failed to acquire coordination lock at %{private}s: %{errno}d", buf, 0x12u);
    }
    if (a4)
    {
      v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28798];
      uint64_t v31 = v34;
      goto LABEL_26;
    }
LABEL_14:
    uint64_t v13 = 0;
    goto LABEL_15;
  }
  int v29 = *__error();
  v30 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136380931;
    v39 = v10;
    __int16 v40 = 1024;
    int v41 = v29;
    _os_log_impl(&dword_1A6B5F000, v30, OS_LOG_TYPE_INFO, "Failed to open coordination lock at %{private}s: %{errno}d", buf, 0x12u);
  }
  if (!a4) {
    goto LABEL_14;
  }
  uint64_t v31 = v29;
  v32 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v33 = *MEMORY[0x1E4F28798];
LABEL_26:
  [v32 errorWithDomain:v33 code:v31 userInfo:0];
  uint64_t v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v13;
}

- (void)coordinationLockURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lockURL:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end