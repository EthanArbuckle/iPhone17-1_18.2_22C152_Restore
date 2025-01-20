@interface ICCloudKitSyncer
- (ICCloudKitSyncerDelegate)delegate;
- (void)saveUnsyncedObjects;
- (void)saveUnsyncedObjectsWithRetryCount:(unint64_t)a3 completionBlock:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ICCloudKitSyncer

- (void)saveUnsyncedObjectsWithRetryCount:(unint64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudKitSyncer saveUnsyncedObjectsWithRetryCount:completionBlock:](a3, v7);
  }

  objc_initWeak(&location, self);
  v8 = +[ICCloudContext sharedContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke;
  v10[3] = &unk_1E64A7100;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  id v9 = v6;
  id v11 = v9;
  [v8 processAllCloudObjectsWithCompletionHandler:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([v3 count])
  {
    uint64_t v17 = a1;
    v18 = WeakRetained;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
          id v11 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v10;
            _os_log_error_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_ERROR, "Error pushing cloud objects: %@", buf, 0xCu);
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v7);
    }

    uint64_t v12 = *(void *)(v17 + 48);
    if (v12)
    {
      id WeakRetained = v18;
      [v18 saveUnsyncedObjectsWithRetryCount:v12 - 1 completionBlock:*(void *)(v17 + 32)];
      id v3 = v19;
    }
    else
    {
      v14 = os_log_create("com.apple.notes", "Cloud");
      id WeakRetained = v18;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke_cold_2();
      }

      id v3 = v19;
      if (*(void *)(v17 + 32))
      {
        v15 = +[ICCloudContext errorFromErrors:v5];
        v16 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke_cold_1((uint64_t)v15, v16);
        }

        (*(void (**)(void))(*(void *)(v17 + 32) + 16))();
      }
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
  }
}

- (void)saveUnsyncedObjects
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Saving un-synced notes to CloudKit", v2, v3, v4, v5, v6);
}

void __39__ICCloudKitSyncer_saveUnsyncedObjects__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  [*(id *)(a1 + 40) setQualityOfService:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) setDiscretionaryNetworkBehavior:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) setEnableLongLivedOperations:*(unsigned __int8 *)(a1 + 64)];
  [*(id *)(a1 + 40) setDisableAutomaticallyRetryNetworkFailures:*(unsigned __int8 *)(a1 + 65)];
  uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __39__ICCloudKitSyncer_saveUnsyncedObjects__block_invoke_cold_1();
  }

  uint8_t v6 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 cloudKitSyncer:v4 didUpdateProgress:1.0];
  }
  if (objc_opt_respondsToSelector()) {
    [v6 cloudKitSyncer:v4 didFinishWithError:v3];
  }
}

- (ICCloudKitSyncerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICCloudKitSyncerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)saveUnsyncedObjectsWithRetryCount:(uint64_t)a1 completionBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Saving un-synced notes to CloudKit with a max retry count of %zu", (uint8_t *)&v2, 0xCu);
}

void __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Calling completion block with error: %@", (uint8_t *)&v2, 0xCu);
}

void __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "No more retries left saving unsynced notes", v2, v3, v4, v5, v6);
}

void __39__ICCloudKitSyncer_saveUnsyncedObjects__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Restored previous cloud context options", v2, v3, v4, v5, v6);
}

@end