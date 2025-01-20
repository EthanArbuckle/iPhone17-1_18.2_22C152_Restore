@interface NSData(RemoteManagement)
- (uint64_t)rm_atomicWriteToURL:()RemoteManagement error:;
@end

@implementation NSData(RemoteManagement)

- (uint64_t)rm_atomicWriteToURL:()RemoteManagement error:
{
  id v6 = a3;
  unsigned __int8 v38 = 0;
  v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8 isDirectory:&v38];
  int v10 = v38;

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    id v12 = [v6 URLByDeletingLastPathComponent];
    v13 = NSString;
    v14 = [MEMORY[0x263F08C38] UUID];
    uint64_t v15 = [v14 UUIDString];
    v16 = [(id)v15 substringToIndex:8];
    v17 = [v6 lastPathComponent];
    v18 = [v13 stringWithFormat:@".temp-%@-%@", v16, v17];

    v19 = [v12 URLByAppendingPathComponent:v18];
    id v37 = 0;
    LOBYTE(v15) = [a1 writeToURL:v19 options:0 error:&v37];
    id v20 = v37;
    if (v15)
    {
      v21 = [MEMORY[0x263F08850] defaultManager];
      id v36 = v20;
      char v22 = [v21 replaceItemAtURL:v6 withItemAtURL:v19 backupItemName:0 options:1 resultingItemURL:0 error:&v36];
      id v23 = v36;

      v24 = +[RMLog nsdata_rm];
      v25 = v24;
      if (v22)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[NSData(RemoteManagement) rm_atomicWriteToURL:error:]();
        }

        uint64_t v26 = 1;
        id v20 = v23;
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[NSData(RemoteManagement) rm_atomicWriteToURL:error:].cold.4();
        }

        if (a4 && v23) {
          *a4 = v23;
        }
        v31 = [MEMORY[0x263F08850] defaultManager];
        id v35 = v23;
        char v32 = [v31 removeItemAtURL:v19 error:&v35];
        id v20 = v35;

        if ((v32 & 1) == 0)
        {
          v33 = +[RMLog nsdata_rm];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[NSData(RemoteManagement) rm_atomicWriteToURL:error:]();
          }
        }
        uint64_t v26 = 0;
      }
    }
    else
    {
      v30 = +[RMLog nsdata_rm];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[NSData(RemoteManagement) rm_atomicWriteToURL:error:].cold.5();
      }

      uint64_t v26 = 0;
      if (a4 && v20)
      {
        id v20 = v20;
        uint64_t v26 = 0;
        *a4 = v20;
      }
    }

    goto LABEL_33;
  }
  v27 = +[RMLog nsdata_rm];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    -[NSData(RemoteManagement) rm_atomicWriteToURL:error:]();
  }

  if (a4)
  {
    v29 = +[RMErrorUtilities createInternalError];
    id v12 = v29;
    if (v29)
    {
      id v12 = v29;
      uint64_t v26 = 0;
      *a4 = v12;
    }
    else
    {
      uint64_t v26 = 0;
    }
LABEL_33:

    goto LABEL_34;
  }
  uint64_t v26 = 0;
LABEL_34:

  return v26;
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to write temporary file since a directory is present: %{public}@", v2, v3, v4, v5, v6);
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_224784000, v0, OS_LOG_TYPE_DEBUG, "Wrote file atomically in-place: %{public}@", v1, 0xCu);
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to remove temporary file: %{public}@", v2, v3, v4, v5, v6);
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to replace original file: %{public}@", v2, v3, v4, v5, v6);
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224784000, v0, v1, "Failed to write temporary file: %{public}@", v2, v3, v4, v5, v6);
}

@end