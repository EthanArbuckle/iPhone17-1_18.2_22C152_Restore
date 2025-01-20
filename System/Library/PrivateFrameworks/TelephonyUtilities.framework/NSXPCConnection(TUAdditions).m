@interface NSXPCConnection(TUAdditions)
- (uint64_t)tu_clientSandboxCanAccessFileURL:()TUAdditions;
@end

@implementation NSXPCConnection(TUAdditions)

- (uint64_t)tu_clientSandboxCanAccessFileURL:()TUAdditions
{
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  [a1 auditToken];
  if ([v4 isFileURL])
  {
    id v29 = 0;
    char v5 = [v4 checkResourceIsReachableAndReturnError:&v29];
    v6 = v29;
    if (v5)
    {
      id v7 = v4;
      if ([v7 fileSystemRepresentation])
      {
        if (!sandbox_check_by_audit_token())
        {
          uint64_t v27 = 1;
          goto LABEL_15;
        }
        v8 = TUDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[NSXPCConnection(TUAdditions) tu_clientSandboxCanAccessFileURL:](v8);
        }
      }
      else
      {
        v8 = TUDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[NSXPCConnection(TUAdditions) tu_clientSandboxCanAccessFileURL:]((uint64_t)v7, v8, v21, v22, v23, v24, v25, v26);
        }
      }
    }
    else
    {
      v8 = TUDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[NSXPCConnection(TUAdditions) tu_clientSandboxCanAccessFileURL:]((uint64_t)v6, v8, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  else
  {
    v6 = TUDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NSXPCConnection(TUAdditions) tu_clientSandboxCanAccessFileURL:].cold.4((uint64_t)v4, v6, v9, v10, v11, v12, v13, v14);
    }
  }
  uint64_t v27 = 0;
LABEL_15:

  return v27;
}

- (void)tu_clientSandboxCanAccessFileURL:()TUAdditions .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)tu_clientSandboxCanAccessFileURL:()TUAdditions .cold.2(NSObject *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3 = __error();
  id v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  id v7 = v4;
  _os_log_error_impl(&dword_19C496000, a1, OS_LOG_TYPE_ERROR, "Client sandbox does not have access to the given file! (Error %i: %s)", (uint8_t *)v5, 0x12u);
}

- (void)tu_clientSandboxCanAccessFileURL:()TUAdditions .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)tu_clientSandboxCanAccessFileURL:()TUAdditions .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end