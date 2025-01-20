@interface VCDaemonDatabaseProvider
- (BOOL)isShortcutsAppInstalled;
- (OS_dispatch_queue)queue;
- (VCDaemonDatabaseProvider)init;
- (WFDatabase)database;
- (id)databaseWithError:(id *)a3;
- (void)migrateVoiceShortcutsToShortcutsInDatabase:(id)a3;
@end

@implementation VCDaemonDatabaseProvider

void __46__VCDaemonDatabaseProvider_databaseWithError___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[1];
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
    return;
  }
  if (([v2 isShortcutsAppInstalled] & 1) == 0)
  {
    v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[VCDaemonDatabaseProvider databaseWithError:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Not initializing the database because Shortcuts app is not installed, returning nil", buf, 0xCu);
    }

    v5 = (void *)MEMORY[0x1E4F28C58];
    v6 = @"Shortcuts app is not installed";
    goto LABEL_11;
  }
  if (WFProcessIsRunningInUserSetup())
  {
    v4 = getWFGeneralLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[VCDaemonDatabaseProvider databaseWithError:]_block_invoke";
    }

    v5 = (void *)MEMORY[0x1E4F28C58];
    v6 = @"Shortcuts daemon is running under the macOS Installer user";
LABEL_11:
    v8 = WFLocalizedString(v6);
    uint64_t v9 = objc_msgSend(v5, "vc_voiceShortcutErrorWithCode:reason:", 1004, @"%@", v8);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    return;
  }
  id v12 = objc_alloc(MEMORY[0x1E4FB71A8]);
  v13 = objc_msgSend(MEMORY[0x1E4F1C190], "wf_shortcutsConfiguration");
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v14 + 40);
  uint64_t v15 = [v12 initWithStoreDescription:v13 runMigrationsIfNecessary:1 useLockFile:1 error:&obj];
  objc_storeStrong((id *)(v14 + 40), obj);
  uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v18)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), v18);
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    id v25 = *(id *)(v19 + 40);
    char v20 = WFRecoverDatabaseContentsIfNeeded();
    objc_storeStrong((id *)(v19 + 40), v25);
    if ((v20 & 1) == 0)
    {
      v21 = getWFGeneralLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136315394;
        v28 = "-[VCDaemonDatabaseProvider databaseWithError:]_block_invoke";
        __int16 v29 = 2114;
        uint64_t v30 = v22;
        _os_log_impl(&dword_1C7D7E000, v21, OS_LOG_TYPE_FAULT, "%s Failed to run migrations in database: %{public}@", buf, 0x16u);
      }
    }
    [MEMORY[0x1E4FB71A8] setDefaultDatabase:*(void *)(*(void *)(a1 + 32) + 8)];
    [*(id *)(a1 + 32) migrateVoiceShortcutsToShortcutsInDatabase:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  else
  {
    v23 = getWFGeneralLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      v28 = "-[VCDaemonDatabaseProvider databaseWithError:]_block_invoke";
      __int16 v29 = 2114;
      uint64_t v30 = v24;
      _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_ERROR, "%s Failed to initialize database: %{public}@", buf, 0x16u);
    }
  }
}

- (id)databaseWithError:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4934;
  uint64_t v19 = __Block_byref_object_dispose__4935;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__4934;
  v13 = __Block_byref_object_dispose__4935;
  id v14 = 0;
  v5 = [(VCDaemonDatabaseProvider *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCDaemonDatabaseProvider_databaseWithError___block_invoke;
  block[3] = &unk_1E6540F30;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(v5, block);

  if (a3) {
    *a3 = (id) v16[5];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (BOOL)isShortcutsAppInstalled
{
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  v3 = (void *)[v2 initWithBundleIdentifier:*MEMORY[0x1E4FB4BE8] allowPlaceholder:0 error:0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)migrateVoiceShortcutsToShortcutsInDatabase:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = VCOSTransactionWithName(@"WFDaemonDatabaseProvider.migrateVoiceShortcutsToShortcutsInDatabase");
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB70B0]) initWithDatabase:v3];

  id v9 = 0;
  char v6 = [v5 migrateWithError:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[VCDaemonDatabaseProvider migrateVoiceShortcutsToShortcutsInDatabase:]";
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to migrate shortcuts from CoreData: %{public}@", buf, 0x16u);
    }
  }
}

- (WFDatabase)database
{
  return (WFDatabase *)[(VCDaemonDatabaseProvider *)self databaseWithError:0];
}

- (VCDaemonDatabaseProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)VCDaemonDatabaseProvider;
  id v2 = [(VCDaemonDatabaseProvider *)&v9 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.shortcuts.VCDaemonDatabaseProvider", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    id v7 = v2;
  }

  return v2;
}

@end