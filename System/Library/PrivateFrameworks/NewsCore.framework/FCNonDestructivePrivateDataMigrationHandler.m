@interface FCNonDestructivePrivateDataMigrationHandler
- (BOOL)isPrivateDataSyncingEnabled;
- (FCNonDestructivePrivateDataActionProvider)privateDataActionProvider;
- (FCNonDestructivePrivateDataMigrationHandler)init;
- (FCNonDestructivePrivateDataMigrationHandler)initWithPrivateDataActionProvider:(id)a3 privateDataControllers:(id)a4 privateDataSyncingEnabled:(BOOL)a5;
- (NSArray)privateDataControllers;
- (void)handleMigrationWithPrivateDataDirectory:(id)a3;
- (void)setPrivateDataActionProvider:(id)a3;
- (void)setPrivateDataControllers:(id)a3;
- (void)setPrivateDataSyncingEnabled:(BOOL)a3;
@end

@implementation FCNonDestructivePrivateDataMigrationHandler

void __87__FCNonDestructivePrivateDataMigrationHandler_handleMigrationWithPrivateDataDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  dispatch_block_t block = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v39 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v27;
    v5 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v8 = v19;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v38 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [*(id *)(*((void *)&v22 + 1) + 8 * j) integerValue];
              if (v13 == 4)
              {
                [v7 mergeLocalStoreWithCloudWithPrivateDataDirectory:*(void *)(a1 + 40)];
              }
              else if (v13 == 3)
              {
                [v7 createLocalStore];
              }
              else if (v13 == 2 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
              {
                v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "NO");
                *(_DWORD *)buf = 136315906;
                v31 = "-[FCNonDestructivePrivateDataMigrationHandler handleMigrationWithPrivateDataDirectory:]_block_invoke";
                __int16 v32 = 2080;
                v33 = "FCNonDestructivePrivateDataMigrationHandler.m";
                __int16 v34 = 1024;
                int v35 = 68;
                __int16 v36 = 2114;
                v37 = v14;
                _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v38 count:16];
          }
          while (v10);
        }

        v15 = *(void **)(a1 + 48);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __87__FCNonDestructivePrivateDataMigrationHandler_handleMigrationWithPrivateDataDirectory___block_invoke_12;
        v21[3] = &unk_1E5B4CF38;
        v21[4] = v7;
        FCDispatchGroupWrap(v15, v21);
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v39 count:16];
    }
    while (v20);
  }

  dispatch_group_notify(*(dispatch_group_t *)(a1 + 48), MEMORY[0x1E4F14428], block);
}

uint64_t __87__FCNonDestructivePrivateDataMigrationHandler_handleMigrationWithPrivateDataDirectory___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) saveWithCompletion:a2];
}

- (FCNonDestructivePrivateDataMigrationHandler)initWithPrivateDataActionProvider:(id)a3 privateDataControllers:(id)a4 privateDataSyncingEnabled:(BOOL)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDataActionProvider");
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[FCNonDestructivePrivateDataMigrationHandler initWithPrivateDataActionProvider:privateDataControllers:private"
          "DataSyncingEnabled:]";
    __int16 v21 = 2080;
    long long v22 = "FCNonDestructivePrivateDataMigrationHandler.m";
    __int16 v23 = 1024;
    int v24 = 32;
    __int16 v25 = 2114;
    long long v26 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDataControllers");
    *(_DWORD *)buf = 136315906;
    uint64_t v20 = "-[FCNonDestructivePrivateDataMigrationHandler initWithPrivateDataActionProvider:privateDataControllers:private"
          "DataSyncingEnabled:]";
    __int16 v21 = 2080;
    long long v22 = "FCNonDestructivePrivateDataMigrationHandler.m";
    __int16 v23 = 1024;
    int v24 = 33;
    __int16 v25 = 2114;
    long long v26 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v18.receiver = self;
  v18.super_class = (Class)FCNonDestructivePrivateDataMigrationHandler;
  uint64_t v11 = [(FCNonDestructivePrivateDataMigrationHandler *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_privateDataActionProvider, a3);
    uint64_t v13 = [v10 copy];
    privateDataControllers = v12->_privateDataControllers;
    v12->_privateDataControllers = (NSArray *)v13;

    v12->_privateDataSyncingEnabled = a5;
  }

  return v12;
}

- (void)handleMigrationWithPrivateDataDirectory:(id)a3
{
  id v4 = a3;
  v5 = [(FCNonDestructivePrivateDataMigrationHandler *)self privateDataControllers];
  dispatch_group_t v6 = dispatch_group_create();
  v7 = [(FCNonDestructivePrivateDataMigrationHandler *)self privateDataActionProvider];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__FCNonDestructivePrivateDataMigrationHandler_handleMigrationWithPrivateDataDirectory___block_invoke;
  v16[3] = &unk_1E5B58278;
  id v8 = v5;
  id v17 = v8;
  id v9 = v4;
  id v18 = v9;
  id v10 = v6;
  id v19 = v10;
  [v7 consumeNonDestructiveActionsSyncWithBlock:v16];

  BOOL v11 = [(FCNonDestructivePrivateDataMigrationHandler *)self isPrivateDataSyncingEnabled];
  v12 = &selRef_enableSyncing;
  if (!v11) {
    v12 = &selRef_disableSyncing;
  }
  [v8 makeObjectsPerformSelector:*v12];
  uint64_t v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v14 = [v13 BOOLForKey:@"personalization_disable_syncing"];

  if (v14)
  {
    v15 = objc_msgSend(v8, "fc_firstObjectPassingTest:", &__block_literal_global_127);
    [v15 disableSyncing];
  }
}

- (NSArray)privateDataControllers
{
  return self->_privateDataControllers;
}

- (FCNonDestructivePrivateDataActionProvider)privateDataActionProvider
{
  return self->_privateDataActionProvider;
}

- (BOOL)isPrivateDataSyncingEnabled
{
  return self->_privateDataSyncingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataControllers, 0);
  objc_storeStrong((id *)&self->_privateDataActionProvider, 0);
}

- (FCNonDestructivePrivateDataMigrationHandler)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCNonDestructivePrivateDataMigrationHandler init]";
    __int16 v9 = 2080;
    id v10 = "FCNonDestructivePrivateDataMigrationHandler.m";
    __int16 v11 = 1024;
    int v12 = 25;
    __int16 v13 = 2114;
    int v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNonDestructivePrivateDataMigrationHandler init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

BOOL __87__FCNonDestructivePrivateDataMigrationHandler_handleMigrationWithPrivateDataDirectory___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;

  return v4 != 0;
}

- (void)setPrivateDataActionProvider:(id)a3
{
}

- (void)setPrivateDataControllers:(id)a3
{
}

- (void)setPrivateDataSyncingEnabled:(BOOL)a3
{
  self->_privateDataSyncingEnabled = a3;
}

@end