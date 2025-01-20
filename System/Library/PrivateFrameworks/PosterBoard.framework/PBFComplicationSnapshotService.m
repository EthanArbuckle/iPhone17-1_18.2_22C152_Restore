@interface PBFComplicationSnapshotService
- (PBFComplicationSnapshotService)init;
- (id)_lock_preparedComplicationSnapshotForRequest:(id)a3;
- (id)complicationSnapshotForRequest:(id)a3;
- (id)preparedComplicationSnapshotsForRequests:(id)a3;
- (void)_fireCompletionHandlersForRequest:(id)a3 snapshot:(id)a4 error:(id)a5;
- (void)_lock_appendErrorBlock:(id)a3 forRequest:(id)a4;
- (void)_lock_appendReceivedBlock:(id)a3 forRequest:(id)a4;
- (void)_lock_trimCachedSnapshotsToRequests:(id)a3;
- (void)complicationSnapshotter:(id)a3 didFinishWithSnapshot:(id)a4 error:(id)a5;
- (void)fetchComplicationSnapshotsForRequests:(id)a3 complicationSnapshotReceivedHandler:(id)a4 errorHandler:(id)a5 completionHandler:(id)a6;
- (void)invalidate;
- (void)trimCachedSnapshotsToRequests:(id)a3;
@end

@implementation PBFComplicationSnapshotService

- (PBFComplicationSnapshotService)init
{
  v16.receiver = self;
  v16.super_class = (Class)PBFComplicationSnapshotService;
  v2 = [(PBFComplicationSnapshotService *)&v16 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setName:@"ComplicationSnapshotQueue"];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:3];
    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:25];
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lock_requestToSnapshotReceivedHandlers = v2->_lock_requestToSnapshotReceivedHandlers;
    v2->_lock_requestToSnapshotReceivedHandlers = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lock_requestToSnapshotErrorHandlers = v2->_lock_requestToSnapshotErrorHandlers;
    v2->_lock_requestToSnapshotErrorHandlers = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lock_requestToResult = v2->_lock_requestToResult;
    v2->_lock_requestToResult = (NSMapTable *)v9;

    uint64_t v11 = [MEMORY[0x1E4F924D8] sharedWorkloop];
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    invalidationFlag = v2->_invalidationFlag;
    v2->_invalidationFlag = (BSAtomicSignal *)v13;
  }
  return v2;
}

- (id)preparedComplicationSnapshotsForRequests:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    if ([(BSAtomicSignal *)self->_invalidationFlag hasBeenSignalled])
    {
      uint64_t v5 = objc_opt_new();
    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v5 = 0;
        uint64_t v9 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            v12 = [(PBFComplicationSnapshotService *)self _lock_preparedComplicationSnapshotForRequest:v11];
            if (v12)
            {
              if (!v5)
              {
                uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
              }
              [v5 setObject:v12 forKey:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }
      else
      {
        uint64_t v5 = 0;
      }

      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_lock_preparedComplicationSnapshotForRequest:(id)a3
{
  v3 = [(NSMapTable *)self->_lock_requestToResult objectForKey:a3];
  id v4 = [v3 snapshot];

  if (v4)
  {
    id v4 = [v3 snapshot];
  }

  return v4;
}

- (void)fetchComplicationSnapshotsForRequests:(id)a3 complicationSnapshotReceivedHandler:(id)a4 errorHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v10 = a4;
  id v35 = a5;
  id v11 = a6;
  v33 = v10;
  if (![(BSAtomicSignal *)self->_invalidationFlag hasBeenSignalled])
  {
    v32 = v11;
    uint64_t v13 = objc_opt_new();
    long long v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke;
    aBlock[3] = &unk_1E6981F78;
    id v56 = v10;
    long long v15 = v14;
    v55 = v15;
    long long v16 = (void (**)(void *, void, void *))_Block_copy(aBlock);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_2;
    v50[3] = &unk_1E6981FA0;
    id v31 = v13;
    id v51 = v31;
    id v53 = v35;
    dispatch_group_t group = v15;
    dispatch_group_t v52 = group;
    v36 = (void (**)(void *, void, void *))_Block_copy(v50);
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v37 = [(NSOperationQueue *)self->_operationQueue operations];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v34;
    uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
    if (!v17) {
      goto LABEL_23;
    }
    uint64_t v39 = *(void *)v47;
    while (1)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v47 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v46 + 1) + 8 * v18);
        dispatch_group_enter(group);
        v20 = -[PBFComplicationSnapshotService _lock_preparedComplicationSnapshotForRequest:](self, "_lock_preparedComplicationSnapshotForRequest:", v19, lock);
        if (v20)
        {
          v16[2](v16, v19, v20);
          goto LABEL_19;
        }
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_3;
        v45[3] = &unk_1E6981FC8;
        v45[4] = v19;
        v21 = objc_msgSend(v37, "bs_firstObjectPassingTest:", v45);
        v22 = v21;
        if (v21)
        {
          v23 = [v21 snapshotter];
          v24 = [(PBFComplicationSnapshotter *)v23 snapshotError];
          int v25 = [v22 isFinished];
          if (v24)
          {
            v36[2](v36, v19, v24);
          }
          else
          {
            if (!v25)
            {
              [(PBFComplicationSnapshotService *)self _lock_appendReceivedBlock:v16 forRequest:v19];
              [(PBFComplicationSnapshotService *)self _lock_appendErrorBlock:v36 forRequest:v19];
              goto LABEL_18;
            }
            v27 = [(PBFComplicationSnapshotter *)v23 snapshot];
            v16[2](v16, v19, v27);
          }
        }
        else
        {
          v23 = [[PBFComplicationSnapshotter alloc] initWithComplicationSnapshotRequest:v19];
          id location = 0;
          v26 = [[PBFComplicationSnapshotterOperation alloc] initWithRequest:v19 snapshotter:v23];
          objc_storeWeak(&location, v26);
          [(PBFComplicationSnapshotService *)self _lock_appendReceivedBlock:v16 forRequest:v19];
          [(PBFComplicationSnapshotService *)self _lock_appendErrorBlock:v36 forRequest:v19];
          [(PBFComplicationSnapshotter *)v23 addObserver:self];
          [(NSOperationQueue *)self->_operationQueue addOperation:v26];

          objc_destroyWeak(&location);
        }
LABEL_18:

LABEL_19:
        ++v18;
      }
      while (v17 != v18);
      uint64_t v28 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
      uint64_t v17 = v28;
      if (!v28)
      {
LABEL_23:

        os_unfair_lock_unlock(lock);
        dispatch_group_leave(group);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_4;
        block[3] = &unk_1E6981220;
        id v42 = v31;
        id v43 = v32;
        id v29 = v31;
        dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

        id v11 = v32;
        goto LABEL_24;
      }
    }
  }
  if (v11)
  {
    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    (*((void (**)(id, void *))v11 + 2))(v11, v12);
  }
LABEL_24:
}

void __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v3);
}

void __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  [*(id *)(a1 + 32) addObject:v5];
  objc_sync_exit(v6);

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 request];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 40))
  {
    id v2 = *(id *)(a1 + 32);
    objc_sync_enter(v2);
    if ([*(id *)(a1 + 32) count])
    {
      v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F28750];
      uint64_t v4 = (void *)[*(id *)(a1 + 32) copy];
      v8[0] = v4;
      id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      id v6 = objc_msgSend(v3, "pbf_generalErrorWithCode:userInfo:", 10, v5);
    }
    else
    {
      id v6 = [*(id *)(a1 + 32) firstObject];
    }
    objc_sync_exit(v2);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)complicationSnapshotForRequest:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMapTable *)self->_lock_requestToResult objectForKey:v5];

  os_unfair_lock_unlock(p_lock);
  uint64_t v7 = [v6 snapshot];

  return v7;
}

- (void)trimCachedSnapshotsToRequests:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(PBFComplicationSnapshotService *)self _lock_trimCachedSnapshotsToRequests:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_fireCompletionHandlersForRequest:(id)a3 snapshot:(id)a4 error:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v35 = a4;
  id v34 = a5;
  id v10 = v9;
  NSClassFromString(&cfstr_Pbfcomplicatio_1.isa);
  if (!v10)
  {
    id v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotService _fireCompletionHandlersForRequest:snapshot:error:](a2);
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D320D13CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFComplicationSnapshotRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFComplicationSnapshotService _fireCompletionHandlersForRequest:snapshot:error:](a2);
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D320D1A0);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v12 = [(NSMapTable *)self->_lock_requestToSnapshotErrorHandlers objectForKey:v10];
  uint64_t v13 = v12;
  if (v34 && [v12 count])
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v14 = (void *)[v13 copy];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v49 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __83__PBFComplicationSnapshotService__fireCompletionHandlersForRequest_snapshot_error___block_invoke;
          block[3] = &unk_1E6981090;
          uint64_t v47 = v19;
          id v45 = v10;
          id v46 = v34;
          dispatch_async(callbackQueue, block);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v16);
    }

    p_os_unfair_lock_t lock = &self->_lock;
  }
  [v13 removeAllObjects];
  [(NSMapTable *)self->_lock_requestToSnapshotErrorHandlers removeObjectForKey:v10];
  v21 = [(NSMapTable *)self->_lock_requestToSnapshotReceivedHandlers objectForKey:v10];
  v22 = v21;
  if (v35 && [v21 count])
  {
    v33 = p_lock;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v23 = (void *)[v22 copy];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * j);
          id v29 = self->_callbackQueue;
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __83__PBFComplicationSnapshotService__fireCompletionHandlersForRequest_snapshot_error___block_invoke_2;
          v36[3] = &unk_1E6981090;
          uint64_t v39 = v28;
          id v37 = v10;
          id v38 = v35;
          dispatch_async(v29, v36);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v25);
    }

    p_os_unfair_lock_t lock = v33;
  }
  [v22 removeAllObjects];
  [(NSMapTable *)self->_lock_requestToSnapshotReceivedHandlers removeObjectForKey:v10];
  v30 = [[_PBFComplicationSnapshotResult alloc] initWithSnapshot:v35 error:v34];
  [(NSMapTable *)self->_lock_requestToResult setObject:v30 forKey:v10];
  os_unfair_lock_unlock(p_lock);
}

uint64_t __83__PBFComplicationSnapshotService__fireCompletionHandlersForRequest_snapshot_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __83__PBFComplicationSnapshotService__fireCompletionHandlersForRequest_snapshot_error___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)complicationSnapshotter:(id)a3 didFinishWithSnapshot:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 request];
  [(PBFComplicationSnapshotService *)self _fireCompletionHandlersForRequest:v10 snapshot:v9 error:v8];
}

- (void)_lock_appendReceivedBlock:(id)a3 forRequest:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    uint64_t v7 = [(NSMapTable *)self->_lock_requestToSnapshotReceivedHandlers objectForKey:v6];
    if (!v7)
    {
      uint64_t v7 = objc_opt_new();
      [(NSMapTable *)self->_lock_requestToSnapshotReceivedHandlers setObject:v7 forKey:v6];
    }
    id v8 = (void *)[v9 copy];
    [v7 addObject:v8];
  }
}

- (void)_lock_appendErrorBlock:(id)a3 forRequest:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    uint64_t v7 = [(NSMapTable *)self->_lock_requestToSnapshotErrorHandlers objectForKey:v6];
    if (!v7)
    {
      uint64_t v7 = objc_opt_new();
      [(NSMapTable *)self->_lock_requestToSnapshotErrorHandlers setObject:v7 forKey:v6];
    }
    id v8 = (void *)[v9 copy];
    [v7 addObject:v8];
  }
}

- (void)_lock_trimCachedSnapshotsToRequests:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v5 = [(NSOperationQueue *)self->_operationQueue operations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v11 = [v10 request];
        char v12 = [v4 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = [v10 snapshotter];
          [v13 invalidate];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v7);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v14 = (void *)[(NSMapTable *)self->_lock_requestToResult copy];
  uint64_t v15 = [v14 keyEnumerator];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        if (([v4 containsObject:v20] & 1) == 0) {
          [(NSMapTable *)self->_lock_requestToResult removeObjectForKey:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v17);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v21 = (void *)[(NSMapTable *)self->_lock_requestToSnapshotReceivedHandlers copy];
  v22 = [v21 keyEnumerator];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v39 + 1) + 8 * k);
        if (([v4 containsObject:v27] & 1) == 0) {
          [(NSMapTable *)self->_lock_requestToSnapshotReceivedHandlers removeObjectForKey:v27];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v24);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v28 = (void *)[(NSMapTable *)self->_lock_requestToSnapshotErrorHandlers copy];
  id v29 = [v28 keyEnumerator];

  uint64_t v30 = [v29 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v35 + 1) + 8 * m);
        if (([v4 containsObject:v34] & 1) == 0) {
          [(NSMapTable *)self->_lock_requestToSnapshotErrorHandlers removeObjectForKey:v34];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v31);
  }
}

- (void)invalidate
{
  id v2 = self;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([(BSAtomicSignal *)self->_invalidationFlag signal])
  {
    os_unfair_lock_t lock = &v2->_lock;
    os_unfair_lock_lock(&v2->_lock);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [(NSMapTable *)v2->_lock_requestToSnapshotErrorHandlers keyEnumerator];
    uint64_t v24 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    v3 = 0;
    if (v24)
    {
      uint64_t v22 = *(void *)v36;
      uint64_t v23 = v2;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = v4;
          uint64_t v5 = *(void *)(*((void *)&v35 + 1) + 8 * v4);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v6 = -[NSMapTable objectForKey:](v2->_lock_requestToSnapshotErrorHandlers, "objectForKey:", v5, lock);
          uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v32;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v32 != v9) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * v10);
                if (!v3) {
                  v3 = objc_opt_new();
                }
                aBlock[0] = MEMORY[0x1E4F143A8];
                aBlock[1] = 3221225472;
                aBlock[2] = __44__PBFComplicationSnapshotService_invalidate__block_invoke;
                aBlock[3] = &unk_1E6981220;
                void aBlock[4] = v5;
                aBlock[5] = v11;
                char v12 = _Block_copy(aBlock);
                [v3 addObject:v12];

                ++v10;
              }
              while (v8 != v10);
              uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
            }
            while (v8);
          }

          uint64_t v4 = v25 + 1;
          id v2 = v23;
        }
        while (v25 + 1 != v24);
        uint64_t v24 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v24);
    }

    uint64_t v13 = [(NSOperationQueue *)v2->_operationQueue operations];
    [v13 enumerateObjectsUsingBlock:&__block_literal_global_2];

    long long v14 = [MEMORY[0x1E4F1CAD0] set];
    [(PBFComplicationSnapshotService *)v2 _lock_trimCachedSnapshotsToRequests:v14];

    os_unfair_lock_unlock(lock);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v3;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          dispatch_async((dispatch_queue_t)v2->_callbackQueue, *(dispatch_block_t *)(*((void *)&v26 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v39 count:16];
      }
      while (v17);
    }
  }
}

void __44__PBFComplicationSnapshotService_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);
}

void __44__PBFComplicationSnapshotService_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 snapshotter];
  [v2 invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_lock_requestToResult, 0);
  objc_storeStrong((id *)&self->_lock_requestToSnapshotErrorHandlers, 0);
  objc_storeStrong((id *)&self->_lock_requestToSnapshotReceivedHandlers, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)_fireCompletionHandlersForRequest:(const char *)a1 snapshot:error:.cold.1(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end