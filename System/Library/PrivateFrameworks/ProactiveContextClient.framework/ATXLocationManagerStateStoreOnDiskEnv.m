@interface ATXLocationManagerStateStoreOnDiskEnv
- (BOOL)isLocked;
- (int)openFileAtPath:(id)a3 dataProtectionClass:(int)a4;
- (void)callOnNextUnlock:(id)a3;
- (void)dealloc;
@end

@implementation ATXLocationManagerStateStoreOnDiskEnv

- (void)dealloc
{
  if (self->_stateChangeRegistration) {
    objc_msgSend(MEMORY[0x1E4F93B10], "unregisterForLockStateChangeNotifications:");
  }
  v3.receiver = self;
  v3.super_class = (Class)ATXLocationManagerStateStoreOnDiskEnv;
  [(ATXLocationManagerStateStoreOnDiskEnv *)&v3 dealloc];
}

- (BOOL)isLocked
{
  return [MEMORY[0x1E4F93B10] isUnlocked] ^ 1;
}

- (int)openFileAtPath:(id)a3 dataProtectionClass:(int)a4
{
  id v5 = a3;
  int v6 = open_dprotected_np((const char *)[v5 UTF8String], 514, a4, 0, 384);
  if (v6 < 0 && *__error() != 1)
  {
    v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXLocationManagerStateStoreOnDiskEnv openFileAtPath:dataProtectionClass:]((uint64_t)v5, v7);
    }
  }
  return v6;
}

- (void)callOnNextUnlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ATXLocationManagerStateStore.m", 193, @"Invalid parameter not satisfying: %@", @"callback" object file lineNumber description];
  }
  if (self->_stateChangeRegistration) {
    objc_msgSend(MEMORY[0x1E4F93B10], "unregisterForLockStateChangeNotifications:");
  }
  uint64_t v15 = 0;
  v16 = (id *)&v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  int v6 = (void *)MEMORY[0x1E4F93B10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__ATXLocationManagerStateStoreOnDiskEnv_callOnNextUnlock___block_invoke;
  v12[3] = &unk_1E6BE6D98;
  id v7 = v5;
  id v13 = v7;
  v14 = &v15;
  v8 = [v6 registerForLockStateChangeNotifications:v12];
  id stateChangeRegistration = self->_stateChangeRegistration;
  self->_id stateChangeRegistration = v8;

  v10 = objc_opt_class();
  objc_sync_enter(v10);
  objc_storeStrong(v16 + 5, self->_stateChangeRegistration);
  objc_sync_exit(v10);

  _Block_object_dispose(&v15, 8);
}

void __58__ATXLocationManagerStateStoreOnDiskEnv_callOnNextUnlock___block_invoke(uint64_t a1, int a2)
{
  if (!a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    objc_opt_class();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    [MEMORY[0x1E4F93B10] unregisterForLockStateChangeNotifications:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    objc_sync_exit(obj);
  }
}

- (void).cxx_destruct
{
}

- (void)openFileAtPath:(uint64_t)a1 dataProtectionClass:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  id v5 = __error();
  int v6 = strerror(*v5);
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 2080;
  v12 = v6;
  _os_log_fault_impl(&dword_1DAFF9000, a2, OS_LOG_TYPE_FAULT, "failed to open '%@': [%i] %s", (uint8_t *)&v7, 0x1Cu);
}

@end