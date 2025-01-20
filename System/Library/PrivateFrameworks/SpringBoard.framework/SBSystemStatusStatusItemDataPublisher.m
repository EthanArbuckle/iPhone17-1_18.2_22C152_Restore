@interface SBSystemStatusStatusItemDataPublisher
+ (id)_sharedCalloutQueue;
+ (id)_sharedPublishingQueue;
- (BOOL)_queue_isEnabled;
- (BOOL)isStatusItemEnabled;
- (NSString)statusItemIdentifier;
- (SBSystemStatusStatusItemDataPublisher)initWithStatusItemIdentifier:(id)a3;
- (SBSystemStatusStatusItemDataPublisher)initWithStatusItemIdentifier:(id)a3 statusItemsPublisher:(id)a4;
- (STUserInteractionHandlingStatusDomainPublisher)statusItemsPublisher;
- (void)_queue_didCompleteOperation:(id)a3;
- (void)_queue_enqueueOperation:(id)a3;
- (void)_queue_startNextOperationIfPossible;
- (void)_queue_startOperation:(id)a3;
- (void)invalidate;
- (void)setStatusItemEnabled:(BOOL)a3 withCompletion:(id)a4;
@end

@implementation SBSystemStatusStatusItemDataPublisher

- (SBSystemStatusStatusItemDataPublisher)initWithStatusItemIdentifier:(id)a3
{
  v5 = (void *)SBApp;
  id v6 = a3;
  v7 = [v5 systemStatusServer];
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBSystemStatusStatusItemDataPublisher.m", 47, @"don't initialize %@ before the server handle exists!", objc_opt_class() object file lineNumber description];
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FA9528]) initWithServerHandle:v7];
  v9 = [(SBSystemStatusStatusItemDataPublisher *)self initWithStatusItemIdentifier:v6 statusItemsPublisher:v8];

  return v9;
}

- (SBSystemStatusStatusItemDataPublisher)initWithStatusItemIdentifier:(id)a3 statusItemsPublisher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBSystemStatusStatusItemDataPublisher;
  v8 = [(SBSystemStatusStatusItemDataPublisher *)&v24 init];
  if (v8)
  {
    uint64_t v9 = [(id)objc_opt_class() _sharedPublishingQueue];
    publishingQueue = v8->_publishingQueue;
    v8->_publishingQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [(id)objc_opt_class() _sharedCalloutQueue];
    calloutQueue = v8->_calloutQueue;
    v8->_calloutQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [v6 copy];
    statusItemIdentifier = v8->_statusItemIdentifier;
    v8->_statusItemIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v8->_statusItemsPublisher, a4);
    v15 = (void *)MEMORY[0x1E4FA9310];
    v16 = [MEMORY[0x1E4F4F6A8] tokenForCurrentProcess];
    v17 = v16;
    if (v16) {
      [v16 realToken];
    }
    else {
      memset(v23, 0, sizeof(v23));
    }
    uint64_t v18 = [v15 attributionWithAuditToken:v23];
    attribution = v8->_attribution;
    v8->_attribution = (STActivityAttribution *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA70] orderedSet];
    queuedOperations = v8->_queuedOperations;
    v8->_queuedOperations = (NSMutableOrderedSet *)v20;
  }
  return v8;
}

- (void)invalidate
{
}

- (void)setStatusItemEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [[_SBSystemStatusStatusItemDataProviderOperation alloc] initWithEnabling:v4 completion:v6];

  v8 = SBLogStatusBarish();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ([(_SBSystemStatusStatusItemDataProviderOperation *)v7 isEnabling]) {
      uint64_t v9 = @"add";
    }
    else {
      uint64_t v9 = @"remove";
    }
    v10 = STStatusItemIdentifierDescription();
    *(_DWORD *)buf = 138412546;
    v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBSystemStatusStatusItemDataPublisher will %@ attribution for %{public}@", buf, 0x16u);
  }
  publishingQueue = self->_publishingQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__SBSystemStatusStatusItemDataPublisher_setStatusItemEnabled_withCompletion___block_invoke;
  v13[3] = &unk_1E6AF5290;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  dispatch_async(publishingQueue, v13);
}

uint64_t __77__SBSystemStatusStatusItemDataPublisher_setStatusItemEnabled_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_enqueueOperation:", *(void *)(a1 + 40));
}

- (BOOL)isStatusItemEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  publishingQueue = self->_publishingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__SBSystemStatusStatusItemDataPublisher_isStatusItemEnabled__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(publishingQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__SBSystemStatusStatusItemDataPublisher_isStatusItemEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_isEnabled");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)_sharedPublishingQueue
{
  if (_sharedPublishingQueue_onceToken != -1) {
    dispatch_once(&_sharedPublishingQueue_onceToken, &__block_literal_global_112);
  }
  v2 = (void *)_sharedPublishingQueue_sPublishingQueue;
  return v2;
}

void __63__SBSystemStatusStatusItemDataPublisher__sharedPublishingQueue__block_invoke()
{
  uint64_t Serial = BSDispatchQueueCreateSerial();
  v1 = (void *)_sharedPublishingQueue_sPublishingQueue;
  _sharedPublishingQueue_sPublishingQueue = Serial;
}

+ (id)_sharedCalloutQueue
{
  if (_sharedCalloutQueue_onceToken != -1) {
    dispatch_once(&_sharedCalloutQueue_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)_sharedCalloutQueue_sCalloutQueue;
  return v2;
}

void __60__SBSystemStatusStatusItemDataPublisher__sharedCalloutQueue__block_invoke()
{
  uint64_t Serial = BSDispatchQueueCreateSerial();
  v1 = (void *)_sharedCalloutQueue_sCalloutQueue;
  _sharedCalloutQueue_sCalloutQueue = Serial;
}

- (void)_queue_enqueueOperation:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert();
  [(NSMutableOrderedSet *)self->_queuedOperations addObject:v4];

  [(SBSystemStatusStatusItemDataPublisher *)self _queue_startNextOperationIfPossible];
}

- (void)_queue_didCompleteOperation:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssert();
  int v5 = [(_SBSystemStatusStatusItemDataProviderOperation *)self->_currentOperation isEqual:v4];

  if (v5)
  {
    currentOperation = self->_currentOperation;
    self->_currentOperation = 0;

    [(SBSystemStatusStatusItemDataPublisher *)self _queue_startNextOperationIfPossible];
  }
}

- (void)_queue_startNextOperationIfPossible
{
  BSDispatchQueueAssert();
  if (!self->_currentOperation)
  {
    id v3 = [(NSMutableOrderedSet *)self->_queuedOperations firstObject];
    objc_storeStrong((id *)&self->_currentOperation, v3);
    if (v3)
    {
      [(NSMutableOrderedSet *)self->_queuedOperations removeObject:v3];
      [(SBSystemStatusStatusItemDataPublisher *)self _queue_startOperation:v3];
    }
  }
}

- (BOOL)_queue_isEnabled
{
  return self->_queue_attribution != 0;
}

- (void)_queue_startOperation:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BSDispatchQueueAssert();
  if (!v5)
  {
    objc_super v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBSystemStatusStatusItemDataPublisher.m", 145, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];
  }
  int v6 = [v5 isEnabling];
  objc_initWeak(&location, self);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke;
  v35[3] = &unk_1E6AFED20;
  objc_copyWeak(&v37, &location);
  id v7 = v5;
  id v36 = v7;
  uint64_t v8 = (void (**)(void, void))MEMORY[0x1D948C7A0](v35);
  if (v6 == [(SBSystemStatusStatusItemDataPublisher *)self _queue_isEnabled])
  {
    v15 = SBLogStatusBarish();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = STStatusItemIdentifierDescription();
      __int16 v17 = (void *)v16;
      uint64_t v18 = @"removing";
      if (v6) {
        uint64_t v18 = @"adding";
      }
      *(_DWORD *)buf = 138412546;
      v40 = v18;
      __int16 v41 = 2114;
      uint64_t v42 = v16;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "SBSystemStatusStatusItemDataPublisher skipped operation %@ attribution for %{public}@", buf, 0x16u);
    }
    ((void (**)(void, id))v8)[2](v8, v7);
  }
  else
  {
    char v9 = SBLogStatusBarish();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = STStatusItemIdentifierDescription();
      uint64_t v11 = (void *)v10;
      v12 = @"removing";
      if (v6) {
        v12 = @"adding";
      }
      *(_DWORD *)buf = 138412546;
      v40 = v12;
      __int16 v41 = 2114;
      uint64_t v42 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBSystemStatusStatusItemDataPublisher starting operation %@ attribution for %{public}@", buf, 0x16u);
    }
    if ([v7 isEnabling])
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FA9530]) initWithStatusItemIdentifier:self->_statusItemIdentifier activityAttribution:self->_attribution];
      v14 = 0;
    }
    else
    {
      v14 = self->_queue_attribution;
      uint64_t v13 = 0;
    }
    uint64_t v19 = [(SBSystemStatusStatusItemDataPublisher *)self statusItemsPublisher];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke_38;
    v32[3] = &unk_1E6AFED48;
    uint64_t v20 = v14;
    v33 = v20;
    id v21 = v13;
    id v34 = v21;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke_2;
    v25[3] = &unk_1E6AFED70;
    objc_copyWeak(&v30, &location);
    v22 = v20;
    v26 = v22;
    id v23 = v21;
    id v27 = v23;
    char v31 = v6;
    v29 = v8;
    id v28 = v7;
    [v19 updateVolatileDataWithBlock:v32 completion:v25];

    objc_destroyWeak(&v30);
  }

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = [v5 completion];
    if (v4) {
      dispatch_async(WeakRetained[3], v4);
    }
    [(dispatch_queue_t *)WeakRetained _queue_didCompleteOperation:*(void *)(a1 + 32)];
  }
}

void __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke_38(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "removeAttribution:");
    id v3 = v4;
  }
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v4, "addAttribution:");
    id v3 = v4;
  }
}

void __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[2];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke_3;
    v6[3] = &unk_1E6AFED70;
    objc_copyWeak(&v11, v2);
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    char v12 = *(unsigned char *)(a1 + 72);
    id v10 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 48);
    dispatch_async(v5, v6);

    objc_destroyWeak(&v11);
  }
}

void __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    int v3 = [*(id *)(a1 + 32) isEqual:WeakRetained[6]];
    int v4 = v3;
    if (*(void *)(a1 + 40))
    {
      if (WeakRetained[6])
      {
        id v5 = SBLogStatusBarish();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke_3_cold_2();
        }
        goto LABEL_12;
      }
    }
    else if ((v3 & 1) == 0)
    {
      id v11 = SBLogStatusBarish();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke_3_cold_1();
      }

      id v8 = *(void **)(a1 + 40);
      if (!v8) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    id v5 = SBLogStatusBarish();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 72)) {
        int v6 = @"add";
      }
      else {
        int v6 = @"remove";
      }
      id v7 = STStatusItemIdentifierDescription();
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      v15 = v7;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBSystemStatusStatusItemDataPublisher did %@ attribution for %{public}@", (uint8_t *)&v12, 0x16u);
    }
LABEL_12:

    id v8 = *(void **)(a1 + 40);
    if (!v8)
    {
      if (!v4) {
        goto LABEL_15;
      }
      id v9 = 0;
LABEL_14:
      id v10 = (void *)WeakRetained[6];
      WeakRetained[6] = v9;

LABEL_15:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_16;
    }
LABEL_13:
    id v9 = v8;
    goto LABEL_14;
  }
LABEL_16:
}

- (NSString)statusItemIdentifier
{
  return self->_statusItemIdentifier;
}

- (STUserInteractionHandlingStatusDomainPublisher)statusItemsPublisher
{
  return self->_statusItemsPublisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusItemsPublisher, 0);
  objc_storeStrong((id *)&self->_statusItemIdentifier, 0);
  objc_storeStrong((id *)&self->_queue_attribution, 0);
  objc_storeStrong((id *)&self->_queuedOperations, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_publishingQueue, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

void __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke_3_cold_1()
{
  v0 = STStatusItemIdentifierDescription();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v1, v2, "SBSystemStatusStatusItemDataPublisher attempted to remove attribution for %{public}@ but it didn't match what we had!", v3, v4, v5, v6, 2u);
}

void __63__SBSystemStatusStatusItemDataPublisher__queue_startOperation___block_invoke_3_cold_2()
{
  v0 = STStatusItemIdentifierDescription();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v1, v2, "SBSystemStatusStatusItemDataPublisher attempting to add attribution for %{public}@ when we already have one!", v3, v4, v5, v6, 2u);
}

@end