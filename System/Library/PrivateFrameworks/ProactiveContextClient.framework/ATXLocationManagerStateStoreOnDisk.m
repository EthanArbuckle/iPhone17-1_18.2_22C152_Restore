@interface ATXLocationManagerStateStoreOnDisk
- (ATXLocationManagerStateStoreOnDisk)initWithLocationParameters:(id)a3;
- (ATXLocationManagerStateStoreOnDisk)initWithPath:(id)a3 environment:(id)a4 locationParameters:(id)a5;
- (BOOL)_tryToOpen;
- (double)cacheExpirationInterval;
- (id)loadNowOrCallLater:(id)a3;
- (void)_deviceDidUnlock;
- (void)clear;
- (void)dealloc;
- (void)setCacheExpirationInterval:(double)a3;
- (void)write:(id)a3;
@end

@implementation ATXLocationManagerStateStoreOnDisk

- (ATXLocationManagerStateStoreOnDisk)initWithPath:(id)a3 environment:(id)a4 locationParameters:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ATXLocationManagerStateStore.m", 34, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"ATXLocationManagerStateStore.m", 35, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)ATXLocationManagerStateStoreOnDisk;
  v13 = [(ATXLocationManagerStateStoreOnDisk *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_path, a3);
    objc_storeStrong((id *)&v14->_env, a4);
    v14->_fd = -1;
    v14->_cacheExpirationInterval = (double)(int)[v12 previousLOIExpirationTime];
  }

  return v14;
}

- (ATXLocationManagerStateStoreOnDisk)initWithLocationParameters:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4B650];
  id v5 = a3;
  v6 = [v4 appPredictionDirectoryFile:@"ATXLocationManagerState"];
  v7 = [MEMORY[0x1E4F28F80] processInfo];
  v8 = [v7 processName];
  v9 = [v8 lowercaseString];
  int v10 = [v9 isEqualToString:@"contextstored"];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F5B420] knowledgeDirectory];
    uint64_t v12 = [v11 stringByAppendingPathComponent:@"ATXLocationManagerState"];

    v6 = (void *)v12;
  }
  v13 = [v6 stringByAppendingString:@"-unrestricted"];

  v14 = objc_opt_new();
  v15 = [(ATXLocationManagerStateStoreOnDisk *)self initWithPath:v13 environment:v14 locationParameters:v5];

  return v15;
}

- (void)dealloc
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }
  v4.receiver = self;
  v4.super_class = (Class)ATXLocationManagerStateStoreOnDisk;
  [(ATXLocationManagerStateStoreOnDisk *)&v4 dealloc];
}

- (BOOL)_tryToOpen
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_fd < 0)
  {
    int v4 = [(ATXLocationManagerStateStoreOnDiskEnv *)v2->_env openFileAtPath:v2->_path dataProtectionClass:3];
    v2->_int fd = v4;
    BOOL v3 = v4 >= 0;
  }
  else
  {
    BOOL v3 = 1;
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)loadNowOrCallLater:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(ATXLocationManagerStateStoreOnDisk *)v5 _tryToOpen])
  {
    v6 = (void *)MEMORY[0x1E0187360]();
    id location = 0;
    [(ATXLocationManagerStateStoreOnDisk *)v5 cacheExpirationInterval];
    ATXCacheFileRead();
  }
  else
  {
    int v7 = ![(ATXLocationManagerStateStoreOnDiskEnv *)v5->_env isLocked];
    if (!v4) {
      LOBYTE(v7) = 1;
    }
    if ((v7 & 1) == 0 && !v5->_deferredLoadCallback)
    {
      v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v9 = [v8 fileExistsAtPath:v5->_path];

      if (v9)
      {
        objc_initWeak(&location, v5);
        uint64_t v10 = MEMORY[0x1E0187570](v4);
        id deferredLoadCallback = v5->_deferredLoadCallback;
        v5->_id deferredLoadCallback = (id)v10;

        env = v5->_env;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __57__ATXLocationManagerStateStoreOnDisk_loadNowOrCallLater___block_invoke;
        v14[3] = &unk_1E6BE68A8;
        objc_copyWeak(&v15, &location);
        [(ATXLocationManagerStateStoreOnDiskEnv *)env callOnNextUnlock:v14];
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
  }
  objc_sync_exit(v5);

  return 0;
}

void __57__ATXLocationManagerStateStoreOnDisk_loadNowOrCallLater___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deviceDidUnlock];
}

- (void)_deviceDidUnlock
{
  v2 = self;
  objc_sync_enter(v2);
  id v5 = [(ATXLocationManagerStateStoreOnDisk *)v2 loadNowOrCallLater:0];
  BOOL v3 = (void (**)(void, void))MEMORY[0x1E0187570](v2->_deferredLoadCallback);
  id deferredLoadCallback = v2->_deferredLoadCallback;
  v2->_id deferredLoadCallback = 0;

  objc_sync_exit(v2);
  if (v3) {
    ((void (**)(void, id))v3)[2](v3, v5);
  }
}

- (void)write:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(ATXLocationManagerStateStoreOnDisk *)v5 _tryToOpen])
  {
    v6 = (void *)MEMORY[0x1E0187360]();
    id v12 = 0;
    int v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v12];
    id v8 = v12;
    if (v7)
    {
      v13[0] = v7;
      int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      char v10 = ATXCacheFileWriteChunks();

      if (v10)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ATXLocationManagerStateStoreOnDisk write:](v11);
      }
    }
    else
    {
      id v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[ATXLocationManagerStateStoreOnDisk write:]((uint64_t)v8, v11);
      }
    }

    goto LABEL_9;
  }
LABEL_10:
  objc_sync_exit(v5);
}

- (void)clear
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtPath:obj->_path error:0];

  int fd = obj->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    obj->_int fd = -1;
  }
  objc_sync_exit(obj);
}

- (double)cacheExpirationInterval
{
  return self->_cacheExpirationInterval;
}

- (void)setCacheExpirationInterval:(double)a3
{
  self->_cacheExpirationInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredLoadCallback, 0);
  objc_storeStrong((id *)&self->_env, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (void)loadNowOrCallLater:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_FAULT, "Error deserializing: %@", (uint8_t *)&v2, 0xCu);
}

- (void)write:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_FAULT, "Error serializing: %@", (uint8_t *)&v2, 0xCu);
}

- (void)write:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_ERROR, "Error writing location manager file", v1, 2u);
}

@end