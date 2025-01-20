@interface PXMemoriesSeenHelper
+ (id)defaultHelper;
- (OS_dispatch_queue)workQueue;
- (PXMemoriesSeenHelper)init;
- (void)_clearPendingNotificationForMemory:(id)a3;
- (void)clearAnyPendingNotificationsFromMemories:(id)a3;
- (void)clearAnyPendingStateFromMemories:(id)a3;
@end

@implementation PXMemoriesSeenHelper

- (void).cxx_destruct
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)_clearPendingNotificationForMemory:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 photoLibrary];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__PXMemoriesSeenHelper__clearPendingNotificationForMemory___block_invoke;
  v18[3] = &unk_1E5DD36F8;
  id v5 = v3;
  id v19 = v5;
  id v17 = 0;
  int v6 = [v4 performChangesAndWait:v18 error:&v17];
  id v7 = v17;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E4F56658];
    uint64_t v9 = *MEMORY[0x1E4F56548];
    v23[0] = v5;
    uint64_t v10 = *MEMORY[0x1E4F56560];
    v22[0] = v9;
    v22[1] = v10;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v23[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    [v8 sendEvent:@"com.apple.photos.CPAnalytics.memoryNotificationSeen" withPayload:v13];
  }
  else
  {
    v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Error while updating memory notification state: %@", buf, 0xCu);
    }
  }

  v14 = [v4 assetsdClient];
  v15 = [v14 notificationClient];
  v16 = [v5 uuid];
  [v15 asyncNotifyInterestingMemoryNotificationViewedForColletionID:v16];
}

void __59__PXMemoriesSeenHelper__clearPendingNotificationForMemory___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39170] changeRequestForMemory:*(void *)(a1 + 32)];
  [v1 setNotificationState:2];
}

- (void)clearAnyPendingStateFromMemories:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  id v5 = v3;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
      if ([v9 pendingState] == 1) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        id v5 = v3;
        goto LABEL_12;
      }
    }
    id v5 = [v9 photoLibrary];

    if (!v5) {
      goto LABEL_13;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PXMemoriesSeenHelper_clearAnyPendingStateFromMemories___block_invoke;
    v10[3] = &unk_1E5DD36F8;
    id v11 = v3;
    [v5 performChanges:v10 completionHandler:&__block_literal_global_195_167411];
  }
LABEL_12:

LABEL_13:
}

void __57__PXMemoriesSeenHelper_clearAnyPendingStateFromMemories___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "pendingState", (void)v8) == 1)
        {
          uint64_t v7 = [MEMORY[0x1E4F39170] changeRequestForMemory:v6];
          [v7 setPendingState:0];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void __57__PXMemoriesSeenHelper_clearAnyPendingStateFromMemories___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Error while marking memories as pending: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)clearAnyPendingNotificationsFromMemories:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        workQueue = self->_workQueue;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __65__PXMemoriesSeenHelper_clearAnyPendingNotificationsFromMemories___block_invoke;
        v11[3] = &unk_1E5DD32A8;
        v11[4] = v9;
        v11[5] = self;
        dispatch_async(workQueue, v11);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

uint64_t __65__PXMemoriesSeenHelper_clearAnyPendingNotificationsFromMemories___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) notificationState];
  if (result == 1)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 _clearPendingNotificationForMemory:v4];
  }
  return result;
}

- (PXMemoriesSeenHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXMemoriesSeenHelper;
  uint64_t v2 = [(PXMemoriesSeenHelper *)&v8 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photos.MemoriesSeenHelper", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)defaultHelper
{
  if (defaultHelper_onceToken != -1) {
    dispatch_once(&defaultHelper_onceToken, &__block_literal_global_167420);
  }
  uint64_t v2 = (void *)defaultHelper_defaultHelper;
  return v2;
}

void __37__PXMemoriesSeenHelper_defaultHelper__block_invoke()
{
  v0 = objc_alloc_init(PXMemoriesSeenHelper);
  id v1 = (void *)defaultHelper_defaultHelper;
  defaultHelper_defaultHelper = (uint64_t)v0;
}

@end