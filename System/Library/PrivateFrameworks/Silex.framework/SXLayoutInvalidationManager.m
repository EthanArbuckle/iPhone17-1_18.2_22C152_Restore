@interface SXLayoutInvalidationManager
- (BOOL)invalidationDispatched;
- (NSMutableArray)possibleInvalidations;
- (NSMutableDictionary)pendingInvalidations;
- (SXLayoutBlueprintProvider)layoutBlueprintProvider;
- (SXLayoutInvalidationManager)initWithBlueprintProvider:(id)a3;
- (SXLayoutInvalidationManagerDelegate)delegate;
- (id)invalidateComponent:(id)a3;
- (id)invalidateComponent:(id)a3 invalidation:(id)a4 priority:(unint64_t)a5;
- (id)invalidateComponent:(id)a3 state:(id)a4;
- (id)invalidateComponent:(id)a3 state:(id)a4 priority:(unint64_t)a5;
- (id)invalidateComponent:(id)a3 state:(id)a4 suggestedSize:(CGSize)a5;
- (id)invalidateComponent:(id)a3 state:(id)a4 suggestedSize:(CGSize)a5 priority:(unint64_t)a6;
- (id)invalidateComponent:(id)a3 suggestedSize:(CGSize)a4;
- (id)invalidateComponent:(id)a3 suggestedSize:(CGSize)a4 priority:(unint64_t)a5;
- (void)cancelPendingInvalidationForComponent:(id)a3;
- (void)invalidateQueuedComponents;
- (void)mightInvalidateComponent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInvalidationDispatched:(BOOL)a3;
- (void)setPendingInvalidations:(id)a3;
@end

@implementation SXLayoutInvalidationManager

- (SXLayoutInvalidationManager)initWithBlueprintProvider:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXLayoutInvalidationManager;
  v6 = [(SXLayoutInvalidationManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layoutBlueprintProvider, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    possibleInvalidations = v7->_possibleInvalidations;
    v7->_possibleInvalidations = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    pendingInvalidations = v7->_pendingInvalidations;
    v7->_pendingInvalidations = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (void)mightInvalidateComponent:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)SXInvalidationLog;
  if (os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = [v4 identifier];
    int v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_222AC5000, v6, OS_LOG_TYPE_DEFAULT, "Might invalidate component, identifier=%{public}@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = [(SXLayoutInvalidationManager *)self possibleInvalidations];
  v9 = [v4 identifier];
  [v8 addObject:v9];
}

- (void)cancelPendingInvalidationForComponent:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)SXInvalidationLog;
  if (os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = [v4 identifier];
    int v23 = 138543362;
    v24 = v7;
    _os_log_impl(&dword_222AC5000, v6, OS_LOG_TYPE_DEFAULT, "Cancel possible invalidation for component, identifier=%{public}@", (uint8_t *)&v23, 0xCu);
  }
  uint64_t v8 = [(SXLayoutInvalidationManager *)self possibleInvalidations];
  v9 = [v4 identifier];
  [v8 removeObject:v9];

  int v10 = [(SXLayoutInvalidationManager *)self pendingInvalidations];
  v11 = [v4 identifier];
  uint64_t v12 = [v10 objectForKey:v11];

  if (v12)
  {
    objc_super v13 = (void *)SXInvalidationLog;
    if (os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = [v4 identifier];
      int v23 = 138543362;
      v24 = v15;
      _os_log_impl(&dword_222AC5000, v14, OS_LOG_TYPE_DEFAULT, "Cancel pending invalidation for component, identifier=%{public}@", (uint8_t *)&v23, 0xCu);
    }
    v16 = [v12 pendingPromise];
    v17 = [v16 reject];
    v18 = [MEMORY[0x263F087E8] errorWithDomain:@"SXLayoutInvalidatorErrorDomain" code:1 userInfo:0];
    ((void (**)(void, void *))v17)[2](v17, v18);

    v19 = [(SXLayoutInvalidationManager *)self pendingInvalidations];
    v20 = [v4 identifier];
    [v19 removeObjectForKey:v20];
  }
  v21 = [(SXLayoutInvalidationManager *)self possibleInvalidations];
  uint64_t v22 = [v21 count];

  if (!v22) {
    [(SXLayoutInvalidationManager *)self invalidateQueuedComponents];
  }
}

- (id)invalidateComponent:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__SXLayoutInvalidationManager_invalidateComponent___block_invoke;
  v8[3] = &unk_2646541A0;
  id v9 = v4;
  id v5 = v4;
  v6 = [(SXLayoutInvalidationManager *)self invalidateComponent:v5 invalidation:v8 priority:0];

  return v6;
}

void __51__SXLayoutInvalidationManager_invalidateComponent___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  objc_msgSend(v3, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v4, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (id)invalidateComponent:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__SXLayoutInvalidationManager_invalidateComponent_state___block_invoke;
  v12[3] = &unk_2646541C8;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  int v10 = [(SXLayoutInvalidationManager *)self invalidateComponent:v8 invalidation:v12 priority:0];

  return v10;
}

void __57__SXLayoutInvalidationManager_invalidateComponent_state___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 invalidateState:v2 forComponentWithIdentifier:v5];
}

- (id)invalidateComponent:(id)a3 state:(id)a4 priority:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__SXLayoutInvalidationManager_invalidateComponent_state_priority___block_invoke;
  v14[3] = &unk_2646541C8;
  id v15 = v9;
  id v16 = v8;
  id v10 = v8;
  id v11 = v9;
  uint64_t v12 = [(SXLayoutInvalidationManager *)self invalidateComponent:v10 invalidation:v14 priority:a5];

  return v12;
}

void __66__SXLayoutInvalidationManager_invalidateComponent_state_priority___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 invalidateState:v2 forComponentWithIdentifier:v5];
}

- (id)invalidateComponent:(id)a3 suggestedSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__SXLayoutInvalidationManager_invalidateComponent_suggestedSize___block_invoke;
  v11[3] = &unk_2646541F0;
  id v12 = v7;
  CGFloat v13 = width;
  CGFloat v14 = height;
  id v8 = v7;
  id v9 = [(SXLayoutInvalidationManager *)self invalidateComponent:v8 invalidation:v11 priority:0];

  return v9;
}

void __65__SXLayoutInvalidationManager_invalidateComponent_suggestedSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  objc_msgSend(v4, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)invalidateComponent:(id)a3 state:(id)a4 suggestedSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v9 = a3;
  id v10 = a4;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__SXLayoutInvalidationManager_invalidateComponent_state_suggestedSize___block_invoke;
  v15[3] = &unk_264654218;
  id v16 = v10;
  id v17 = v9;
  CGFloat v18 = width;
  CGFloat v19 = height;
  id v11 = v9;
  id v12 = v10;
  CGFloat v13 = [(SXLayoutInvalidationManager *)self invalidateComponent:v11 invalidation:v15 priority:0];

  return v13;
}

void __71__SXLayoutInvalidationManager_invalidateComponent_state_suggestedSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 identifier];
  [v5 invalidateState:v3 forComponentWithIdentifier:v6];

  id v7 = [*(id *)(a1 + 40) identifier];
  objc_msgSend(v5, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)invalidateComponent:(id)a3 suggestedSize:(CGSize)a4 priority:(unint64_t)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__SXLayoutInvalidationManager_invalidateComponent_suggestedSize_priority___block_invoke;
  v13[3] = &unk_2646541F0;
  id v14 = v9;
  CGFloat v15 = width;
  CGFloat v16 = height;
  id v10 = v9;
  id v11 = [(SXLayoutInvalidationManager *)self invalidateComponent:v10 invalidation:v13 priority:a5];

  return v11;
}

void __74__SXLayoutInvalidationManager_invalidateComponent_suggestedSize_priority___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 identifier];
  objc_msgSend(v4, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)invalidateComponent:(id)a3 state:(id)a4 suggestedSize:(CGSize)a5 priority:(unint64_t)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  CGFloat v13 = (void *)SXInvalidationLog;
  if (os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    CGFloat v15 = [v11 identifier];
    v37.CGFloat width = width;
    v37.CGFloat height = height;
    CGFloat v16 = NSStringFromCGSize(v37);
    id v17 = [v12 identifier];
    *(_DWORD *)buf = 138544130;
    v28 = v15;
    __int16 v29 = 2114;
    v30 = v16;
    __int16 v31 = 2114;
    v32 = v17;
    __int16 v33 = 2048;
    unint64_t v34 = a6;
    _os_log_impl(&dword_222AC5000, v14, OS_LOG_TYPE_DEFAULT, "Queuing invalidation of component, identifier=%{public}@, suggested-size=%{public}@, state=%{public}@ priority=%lu", buf, 0x2Au);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __80__SXLayoutInvalidationManager_invalidateComponent_state_suggestedSize_priority___block_invoke;
  v22[3] = &unk_264654218;
  id v23 = v12;
  id v24 = v11;
  CGFloat v25 = width;
  CGFloat v26 = height;
  id v18 = v11;
  id v19 = v12;
  v20 = [(SXLayoutInvalidationManager *)self invalidateComponent:v18 invalidation:v22 priority:a6];

  return v20;
}

void __80__SXLayoutInvalidationManager_invalidateComponent_state_suggestedSize_priority___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 identifier];
  [v5 invalidateState:v3 forComponentWithIdentifier:v6];

  id v7 = [*(id *)(a1 + 40) identifier];
  objc_msgSend(v5, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (id)invalidateComponent:(id)a3 invalidation:(id)a4 priority:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SXLayoutInvalidationManager *)self layoutBlueprintProvider];
  id v11 = [v10 blueprint];

  if (v11)
  {
    [(SXLayoutInvalidationManager *)self cancelPendingInvalidationForComponent:v8];
    id v12 = objc_alloc_init(MEMORY[0x263F59E68]);
    CGFloat v13 = [SXPendingLayoutInvalidation alloc];
    id v14 = [v11 layoutOptions];
    CGFloat v15 = [(SXPendingLayoutInvalidation *)v13 initWithComponent:v8 pendingPromise:v12 layoutOptions:v14 invalidation:v9];

    CGFloat v16 = [(SXLayoutInvalidationManager *)self pendingInvalidations];
    id v17 = [v8 identifier];
    [v16 setObject:v15 forKey:v17];

    if (a5 == 1
      || ([(SXLayoutInvalidationManager *)self possibleInvalidations],
          id v18 = objc_claimAutoreleasedReturnValue(),
          uint64_t v19 = [v18 count],
          v18,
          !v19))
    {
      [(SXLayoutInvalidationManager *)self invalidateQueuedComponents];
    }
    else if (![(SXLayoutInvalidationManager *)self invalidationDispatched])
    {
      v20 = SXInvalidationLog;
      if (os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222AC5000, v20, OS_LOG_TYPE_DEFAULT, "Dispatching invalidation for queued components", buf, 2u);
      }
      [(SXLayoutInvalidationManager *)self setInvalidationDispatched:1];
      dispatch_time_t v21 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__SXLayoutInvalidationManager_invalidateComponent_invalidation_priority___block_invoke;
      block[3] = &unk_2646511F8;
      block[4] = self;
      dispatch_after(v21, MEMORY[0x263EF83A0], block);
    }
    uint64_t v22 = [v12 promise];
  }
  else
  {
    id v23 = objc_alloc(MEMORY[0x263F59E70]);
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"SXLayoutInvalidatorErrorDomain" code:2 userInfo:0];
    uint64_t v22 = (void *)[v23 initWithError:v12];
  }

  return v22;
}

uint64_t __73__SXLayoutInvalidationManager_invalidateComponent_invalidation_priority___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInvalidationDispatched:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 invalidateQueuedComponents];
}

- (void)invalidateQueuedComponents
{
  uint64_t v3 = [(SXLayoutInvalidationManager *)self pendingInvalidations];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(SXLayoutInvalidationManager *)self layoutBlueprintProvider];
    id v6 = [v5 blueprint];

    id v7 = [(SXLayoutInvalidationManager *)self pendingInvalidations];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__SXLayoutInvalidationManager_invalidateQueuedComponents__block_invoke;
    v11[3] = &unk_264654240;
    id v12 = v6;
    id v8 = v6;
    [v7 enumerateKeysAndObjectsUsingBlock:v11];

    id v9 = [(SXLayoutInvalidationManager *)self pendingInvalidations];
    [v9 removeAllObjects];

    id v10 = [(SXLayoutInvalidationManager *)self delegate];
    [v10 layoutInvalidationManager:self didInvalidateBlueprint:v8];
  }
}

void __57__SXLayoutInvalidationManager_invalidateQueuedComponents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 layoutOptions];
  id v8 = [*(id *)(a1 + 32) layoutOptions];
  int v9 = [v7 isEqual:v8];

  id v10 = SXInvalidationLog;
  BOOL v11 = os_log_type_enabled((os_log_t)SXInvalidationLog, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v18 = 138543362;
      id v19 = v5;
      _os_log_impl(&dword_222AC5000, v10, OS_LOG_TYPE_DEFAULT, "Invalidate component layout, identifier=%{public}@", (uint8_t *)&v18, 0xCu);
    }
    id v12 = [*(id *)(a1 + 32) componentBlueprintForComponentIdentifier:v5 includeChildren:1];
    if (v12)
    {
      CGFloat v13 = [v6 invalidation];
      id v14 = [v12 parentLayoutBlueprint];
      ((void (**)(void, void *))v13)[2](v13, v14);

      CGFloat v15 = [v6 pendingPromise];
      CGFloat v16 = [v15 resolve];
      id v17 = (void (**)(id, void *))objc_alloc_init(MEMORY[0x263F59E98]);
      v16[2](v16, v17);
    }
    else
    {
      CGFloat v15 = [MEMORY[0x263F087E8] errorWithDomain:@"SXLayoutInvalidatorErrorDomain" code:2 userInfo:0];
      CGFloat v16 = [v6 pendingPromise];
      id v17 = [v16 reject];
      v17[2](v17, v15);
    }
  }
  else
  {
    if (v11)
    {
      int v18 = 138543362;
      id v19 = v5;
      _os_log_impl(&dword_222AC5000, v10, OS_LOG_TYPE_DEFAULT, "Rejecting invalidation of component. Layout options do not match. identifier=%{public}@", (uint8_t *)&v18, 0xCu);
    }
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"SXLayoutInvalidatorErrorDomain" code:2 userInfo:0];
    CGFloat v15 = [v6 pendingPromise];
    CGFloat v16 = [v15 reject];
    ((void (**)(void, void *))v16)[2](v16, v12);
  }
}

- (SXLayoutInvalidationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXLayoutInvalidationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXLayoutBlueprintProvider)layoutBlueprintProvider
{
  return self->_layoutBlueprintProvider;
}

- (NSMutableArray)possibleInvalidations
{
  return self->_possibleInvalidations;
}

- (NSMutableDictionary)pendingInvalidations
{
  return self->_pendingInvalidations;
}

- (void)setPendingInvalidations:(id)a3
{
}

- (BOOL)invalidationDispatched
{
  return self->_invalidationDispatched;
}

- (void)setInvalidationDispatched:(BOOL)a3
{
  self->_invalidationDispatched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingInvalidations, 0);
  objc_storeStrong((id *)&self->_possibleInvalidations, 0);
  objc_storeStrong((id *)&self->_layoutBlueprintProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end