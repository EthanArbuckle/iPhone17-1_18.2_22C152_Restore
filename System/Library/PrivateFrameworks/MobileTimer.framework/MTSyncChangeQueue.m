@interface MTSyncChangeQueue
- (BOOL)hasPendingChanges;
- (MTSyncChangeQueue)initWithChangeStore:(id)a3;
- (MTSyncChangeStore)changeStore;
- (NAScheduler)serializer;
- (NSMutableArray)changeQueue;
- (OS_dispatch_group)changesLoaded;
- (OS_dispatch_queue)serialQueue;
- (id)_resolveChange:(id)a3;
- (id)_resolveChange:(id)a3 resolutionHandler:(id)a4;
- (id)pendingChanges;
- (id)resolveChange:(id)a3;
- (void)_enqueueAction:(id)a3;
- (void)_enqueueChange:(id)a3 changeCompareBlock:(id)a4;
- (void)dequeueChanges:(id)a3;
- (void)enqueueChange:(id)a3;
- (void)loadChanges;
- (void)performBlockOnceChangesAreLoaded:(id)a3 async:(BOOL)a4;
- (void)persistChanges;
- (void)removePendingChanges;
- (void)setChangeQueue:(id)a3;
- (void)setChangeStore:(id)a3;
- (void)setChangesLoaded:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSerializer:(id)a3;
@end

@implementation MTSyncChangeQueue

- (MTSyncChangeQueue)initWithChangeStore:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MTSyncChangeQueue;
  id v6 = [(MTSyncChangeQueue *)&v17 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)+[MTScheduler defaultPriority], -1);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MTSyncChangeQueue.serial", v7);
    v9 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v8;

    uint64_t v10 = [MEMORY[0x1E4F7A0F0] schedulerWithDispatchQueue:*((void *)v6 + 1)];
    v11 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v10;

    objc_storeStrong((id *)v6 + 4, a3);
    uint64_t v12 = objc_opt_new();
    v13 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v12;

    dispatch_group_t v14 = dispatch_group_create();
    v15 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v14;

    dispatch_group_enter(*((dispatch_group_t *)v6 + 3));
  }

  return (MTSyncChangeQueue *)v6;
}

- (void)loadChanges
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    dispatch_queue_t v8 = self;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_INFO, "%{public}@ loading changes", buf, 0xCu);
  }

  v4 = [(MTSyncChangeStore *)self->_changeStore loadChanges];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__MTSyncChangeQueue_loadChanges__block_invoke;
  v6[3] = &unk_1E5917BE8;
  v6[4] = self;
  id v5 = (id)[v4 addSuccessBlock:v6];
}

void __32__MTSyncChangeQueue_loadChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__MTSyncChangeQueue_loadChanges__block_invoke_2;
  v7[3] = &unk_1E5915000;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 performBlock:v7];
}

void __32__MTSyncChangeQueue_loadChanges__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) count];
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "%{public}@ loaded %lu changes", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) addObjectsFromArray:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
}

- (void)performBlockOnceChangesAreLoaded:(id)a3 async:(BOOL)a4
{
  changesLoaded = self->_changesLoaded;
  if (a4)
  {
    dispatch_group_notify(changesLoaded, (dispatch_queue_t)self->_serialQueue, a3);
  }
  else
  {
    id v6 = a3;
    dispatch_group_wait(changesLoaded, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_sync((dispatch_queue_t)self->_serialQueue, v6);
  }
}

- (void)persistChanges
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__MTSyncChangeQueue_persistChanges__block_invoke;
  v2[3] = &unk_1E59150A8;
  v2[4] = self;
  [(MTSyncChangeQueue *)self performBlockOnceChangesAreLoaded:v2 async:1];
}

void __35__MTSyncChangeQueue_persistChanges__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  id v3 = (id)[*(id *)(v1 + 40) copy];
  [v2 persistChanges:v3];
}

- (void)enqueueChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MTSyncChangeQueue_enqueueChange___block_invoke;
  v6[3] = &unk_1E5915000;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(MTSyncChangeQueue *)self performBlockOnceChangesAreLoaded:v6 async:1];
}

uint64_t __35__MTSyncChangeQueue_enqueueChange___block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  if ([*(id *)(a1 + 32) syncType])
  {
    id v3 = MTLogForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __35__MTSyncChangeQueue_enqueueChange___block_invoke_cold_1(a1, v2, v3);
    }
  }
  else
  {
    [*(id *)(a1 + 40) _enqueueAction:*(void *)(a1 + 32)];
  }
  return [*(id *)(a1 + 40) persistChanges];
}

- (void)_enqueueAction:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ enqueuing action %{public}@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__MTSyncChangeQueue__enqueueAction___block_invoke;
  v7[3] = &unk_1E59184F8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(MTSyncChangeQueue *)self _enqueueChange:v6 changeCompareBlock:v7];
}

uint64_t __36__MTSyncChangeQueue__enqueueAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 syncType]
    && ([*(id *)(a1 + 32) syncIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v3 syncIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 isEqualToString:v5],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    id v8 = MTLogForCategory(6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%{public}@ jumping over pending change %{public}@", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = 4;
  }

  return v7;
}

- (void)_enqueueChange:(id)a3 changeCompareBlock:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  char v6 = (uint64_t (**)(id, void))a4;
  uint64_t v7 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = [(NSMutableArray *)self->_changeQueue reverseObjectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (!v9)
  {

LABEL_27:
    objc_msgSend(v7, "addObject:", v33, v31);
    goto LABEL_28;
  }
  uint64_t v11 = v9;
  unint64_t v12 = 0;
  uint64_t v13 = *(void *)v39;
  char v14 = 1;
  *(void *)&long long v10 = 138543874;
  long long v31 = v10;
  do
  {
    uint64_t v15 = v8;
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v39 != v13) {
        objc_enumerationMutation(v15);
      }
      objc_super v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
      if (v14)
      {
        unint64_t v12 = v6[2](v6, *(void *)(*((void *)&v38 + 1) + 8 * v16));
        char v14 = 1;
        switch(v12)
        {
          case 0uLL:
            v18 = [MEMORY[0x1E4F28B00] currentHandler];
            [v18 handleFailureInMethod:a2 object:self file:@"MTSyncChangeQueue.m" lineNumber:150 description:@"Undetermined enqueue result returned"];

            unint64_t v12 = 0;
            char v14 = 1;
            break;
          case 1uLL:
            [v7 addObject:v33];
            [v7 addObject:v17];
            char v14 = 0;
            unint64_t v12 = 1;
            break;
          case 2uLL:
            [v7 addObject:v17];
            char v14 = 1;
            unint64_t v12 = 2;
            break;
          case 3uLL:
            v19 = [v17 merge:v33];
            if (v19)
            {
              v20 = v7;
              v21 = v19;
            }
            else
            {
              v22 = MTLogForCategory(6);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v31;
                v44 = self;
                __int16 v45 = 2114;
                id v46 = v33;
                __int16 v47 = 2114;
                v48 = v17;
                _os_log_error_impl(&dword_19CC95000, v22, OS_LOG_TYPE_ERROR, "%{public}@ unable to merge %{public}@ into %{public}@", buf, 0x20u);
              }

              v20 = v7;
              v21 = v17;
            }
            objc_msgSend(v20, "addObject:", v21, v31);

            char v14 = 0;
            unint64_t v12 = 3;
            break;
          case 5uLL:
            [v7 addObject:v17];
            char v14 = 0;
            unint64_t v12 = 5;
            break;
          case 6uLL:
            char v14 = 0;
            unint64_t v12 = 6;
            break;
          default:
            break;
        }
      }
      else
      {
        [v7 addObject:*(void *)(*((void *)&v38 + 1) + 8 * v16)];
        char v14 = 0;
      }
      ++v16;
    }
    while (v11 != v16);
    id v8 = v15;
    uint64_t v23 = [v15 countByEnumeratingWithState:&v38 objects:v49 count:16];
    uint64_t v11 = v23;
  }
  while (v23);

  if (v12 <= 4 && ((1 << v12) & 0x15) != 0) {
    goto LABEL_27;
  }
LABEL_28:
  v24 = (NSMutableArray *)objc_opt_new();
  changeQueue = self->_changeQueue;
  self->_changeQueue = v24;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v26 = [v7 reverseObjectEnumerator];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(v26);
        }
        -[NSMutableArray addObject:](self->_changeQueue, "addObject:", *(void *)(*((void *)&v34 + 1) + 8 * i), v31);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v28);
  }
}

- (void)dequeueChanges:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__MTSyncChangeQueue_dequeueChanges___block_invoke;
  v6[3] = &unk_1E5915000;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MTSyncChangeQueue *)self performBlockOnceChangesAreLoaded:v6 async:1];
}

uint64_t __36__MTSyncChangeQueue_dequeueChanges___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(6);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ dequeing changes %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectsInArray:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) persistChanges];
}

- (BOOL)hasPendingChanges
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MTSyncChangeQueue_hasPendingChanges__block_invoke;
  v4[3] = &unk_1E5915340;
  v4[4] = self;
  v4[5] = &v5;
  [(MTSyncChangeQueue *)self performBlockOnceChangesAreLoaded:v4 async:0];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__MTSyncChangeQueue_hasPendingChanges__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (id)pendingChanges
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__17;
  uint64_t v9 = __Block_byref_object_dispose__17;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__MTSyncChangeQueue_pendingChanges__block_invoke;
  v4[3] = &unk_1E5915340;
  v4[4] = self;
  v4[5] = &v5;
  [(MTSyncChangeQueue *)self performBlockOnceChangesAreLoaded:v4 async:0];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __35__MTSyncChangeQueue_pendingChanges__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)removePendingChanges
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__MTSyncChangeQueue_removePendingChanges__block_invoke;
  v2[3] = &unk_1E59150A8;
  v2[4] = self;
  [(MTSyncChangeQueue *)self performBlockOnceChangesAreLoaded:v2 async:1];
}

uint64_t __41__MTSyncChangeQueue_removePendingChanges__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 persistChanges];
}

- (id)resolveChange:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__17;
  uint64_t v15 = __Block_byref_object_dispose__17;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__MTSyncChangeQueue_resolveChange___block_invoke;
  v8[3] = &unk_1E59150F8;
  id v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(MTSyncChangeQueue *)self performBlockOnceChangesAreLoaded:v8 async:0];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __35__MTSyncChangeQueue_resolveChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _resolveChange:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1 + 32);
  return [v5 persistChanges];
}

- (id)_resolveChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MTLogForCategory(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_INFO, "%{public}@ resolving incoming change %{public}@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__MTSyncChangeQueue__resolveChange___block_invoke;
  v8[3] = &unk_1E5918520;
  v8[4] = self;
  id v6 = [(MTSyncChangeQueue *)self _resolveChange:v4 resolutionHandler:v8];

  return v6;
}

uint64_t __36__MTSyncChangeQueue__resolveChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 conflicts:v5])
  {
    uint64_t v7 = MTLogForCategory(6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v16 = 138543874;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      id v19 = v5;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ incoming change %{public}@ conflicts with pending change %{public}@", (uint8_t *)&v16, 0x20u);
    }

    id v9 = [v6 preferred:v5];
    id v10 = MTLogForCategory(6);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9 == v5)
    {
      if (v11)
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v16 = 138543618;
        uint64_t v17 = v14;
        __int16 v18 = 2114;
        id v19 = v6;
        _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ dropping conflicting pending change %{public}@", (uint8_t *)&v16, 0x16u);
      }
      uint64_t v13 = 4;
    }
    else
    {
      if (v11)
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v16 = 138543618;
        uint64_t v17 = v12;
        __int16 v18 = 2114;
        id v19 = v5;
        _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ dropping conflicting incoming change %{public}@", (uint8_t *)&v16, 0x16u);
      }
      uint64_t v13 = 5;
    }
  }
  else
  {
    uint64_t v13 = 2;
  }

  return v13;
}

- (id)_resolveChange:(id)a3 resolutionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (uint64_t (**)(id, id, void))a4;
  uint64_t v8 = objc_opt_new();
  id v9 = v6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = self;
  BOOL v11 = self->_changeQueue;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  uint64_t v22 = v9;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (!v9)
        {
LABEL_10:
          objc_msgSend(v8, "addObject:", v16, v22);
          continue;
        }
        uint64_t v17 = v7[2](v7, v9, *(void *)(*((void *)&v24 + 1) + 8 * i));
        switch(v17)
        {
          case 5:
            [v8 addObject:v16];

            id v9 = 0;
            break;
          case 4:
            continue;
          case 2:
            goto LABEL_10;
          default:
            __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
            [v18 handleFailureInMethod:a2 object:v10 file:@"MTSyncChangeQueue.m" lineNumber:262 description:@"Invalid conflict result returned"];

            break;
        }
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  uint64_t v19 = [v8 mutableCopy];
  changeQueue = v10->_changeQueue;
  v10->_changeQueue = (NSMutableArray *)v19;

  return v9;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (OS_dispatch_group)changesLoaded
{
  return self->_changesLoaded;
}

- (void)setChangesLoaded:(id)a3
{
}

- (MTSyncChangeStore)changeStore
{
  return self->_changeStore;
}

- (void)setChangeStore:(id)a3
{
}

- (NSMutableArray)changeQueue
{
  return self->_changeQueue;
}

- (void)setChangeQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeQueue, 0);
  objc_storeStrong((id *)&self->_changeStore, 0);
  objc_storeStrong((id *)&self->_changesLoaded, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __35__MTSyncChangeQueue_enqueueChange___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *a2;
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ unsupported change type %{public}@", (uint8_t *)&v5, 0x16u);
}

@end