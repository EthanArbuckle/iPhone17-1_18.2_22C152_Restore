@interface _PASXPCServer
+ (id)description;
+ (void)registerForService:(id)a3 delegate:(id)a4;
- (_PASXPCServer)initWithXPCListeners:(id)a3 logHandle:(id)a4;
- (void)registerXPCListeners;
@end

@implementation _PASXPCServer

- (void).cxx_destruct
{
}

- (void)registerXPCListeners
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_XPCListeners;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "serviceName", (void)v10);
        v9 = [v7 delegate];
        +[_PASXPCServer registerForService:v8 delegate:v9];
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (_PASXPCServer)initWithXPCListeners:(id)a3 logHandle:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PASXPCServer;
  v7 = [(_PASXPCServer *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_XPCListeners, a3);
  }

  return v8;
}

+ (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = NSStringFromClass((Class)a1);
  [v3 appendFormat:@"%@ registrations:\n", v4];

  id obj = a1;
  objc_sync_enter(obj);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(id)listeners allKeys];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = [(id)listeners objectForKeyedSubscript:v10];
        long long v12 = [v11 second];
        [v3 appendFormat:@"  %@ => %@\n", v10, v12];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  objc_sync_exit(obj);

  return v3;
}

+ (void)registerForService:(id)a3 delegate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"_PASXPCServer.m", 28, @"Invalid parameter not satisfying: %@", @"serviceName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"_PASXPCServer.m", 29, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  id v10 = a1;
  objc_sync_enter(v10);
  long long v11 = (void *)listeners;
  if (!listeners)
  {
    uint64_t v12 = objc_opt_new();
    long long v13 = (void *)listeners;
    listeners = v12;

    long long v11 = (void *)listeners;
  }
  v14 = [v11 objectForKeyedSubscript:v7];

  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_fault_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "SPI misuse: re-registering for XPC service '%@'", buf, 0xCu);
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
    objc_sync_exit(v10);
  }
  else
  {
    long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v7];
    [v15 setDelegate:v9];
    long long v16 = [[_PASTuple2 alloc] initWithFirst:v15 second:v9];
    [(id)listeners setObject:v16 forKeyedSubscript:v7];

    objc_sync_exit(v10);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = (id)objc_opt_class();
      id v17 = v23;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Registered for XPC service '%@' with delegate of class %@", buf, 0x16u);
    }
    [v15 resume];
    id v10 = v15;
  }
}

@end