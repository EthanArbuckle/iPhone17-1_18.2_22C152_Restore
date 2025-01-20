@interface PBFApplicationStateMonitor
- (NSOrderedSet)applicationStateStack;
- (PBFApplicationStateContext)currentApplicationContext;
- (PBFApplicationStateMonitor)init;
- (PBFApplicationStateNode)rootNode;
- (void)_fireStateTrackingObserverSelector:(SEL)a3 block:(id)a4;
- (void)_updateApplicationContextIfNeeded;
- (void)addMonitorObserver:(id)a3;
- (void)invalidate;
- (void)pushState:(id)a3;
- (void)removeMonitorObserver:(id)a3;
- (void)setCurrentApplicationContext:(id)a3;
- (void)state:(id)a3 didUpdateComponents:(id)a4;
- (void)stateWasInvalidated:(id)a3;
@end

@implementation PBFApplicationStateMonitor

- (PBFApplicationStateMonitor)init
{
  v16.receiver = self;
  v16.super_class = (Class)PBFApplicationStateMonitor;
  v2 = [(PBFApplicationStateMonitor *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    invalidationFlag = v2->_invalidationFlag;
    v2->_invalidationFlag = (BSAtomicFlag *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    stateTrackingObservers = v2->_stateTrackingObservers;
    v2->_stateTrackingObservers = (NSHashTable *)v5;

    v7 = [[PBFApplicationStateNode alloc] initWithDescription:@"Application Node"];
    rootNode = v2->_rootNode;
    v2->_rootNode = v7;

    v9 = [(PBFApplicationStateNode *)v2->_rootNode stateDescription];
    v10 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v11 = +[PBFApplicationStateContext contextWithForegroundStateDescription:v9 posterUUIDs:v10];
    currentApplicationContext = v2->_currentApplicationContext;
    v2->_currentApplicationContext = (PBFApplicationStateContext *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA70] orderedSetWithObject:v2->_rootNode];
    applicationStateStack = v2->_applicationStateStack;
    v2->_applicationStateStack = (NSMutableOrderedSet *)v13;
  }
  return v2;
}

- (NSOrderedSet)applicationStateStack
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    uint64_t v3 = objc_opt_new();
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    uint64_t v3 = (void *)[(NSMutableOrderedSet *)v4->_applicationStateStack copy];
    objc_sync_exit(v4);
  }
  return (NSOrderedSet *)v3;
}

- (PBFApplicationStateContext)currentApplicationContext
{
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v4 = self;
    objc_sync_enter(v4);
    uint64_t v3 = v4->_currentApplicationContext;
    objc_sync_exit(v4);
  }
  return v3;
}

- (void)setCurrentApplicationContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    v6 = self;
    objc_sync_enter(v6);
    if ([(PBFApplicationStateContext *)v6->_currentApplicationContext isEqual:v5])
    {
      objc_sync_exit(v6);
    }
    else
    {
      objc_storeStrong((id *)&v6->_currentApplicationContext, a3);
      objc_sync_exit(v6);

      v7 = PBFLogApplicationState();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v11 = v5;
        _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "Updating currentApplicationContext: %{public}@", buf, 0xCu);
      }

      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __59__PBFApplicationStateMonitor_setCurrentApplicationContext___block_invoke;
      v8[3] = &unk_1E6984948;
      v8[4] = v6;
      id v9 = v5;
      [(PBFApplicationStateMonitor *)v6 _fireStateTrackingObserverSelector:sel_applicationStateMonitor_contextDidUpdate_ block:v8];
    }
  }
}

uint64_t __59__PBFApplicationStateMonitor_setCurrentApplicationContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applicationStateMonitor:*(void *)(a1 + 32) contextDidUpdate:*(void *)(a1 + 40)];
}

- (void)pushState:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(BSAtomicFlag *)self->_invalidationFlag getFlag];
  if (v4 && (v5 & 1) == 0)
  {
    v6 = self;
    objc_sync_enter(v6);
    if ([(NSMutableOrderedSet *)v6->_applicationStateStack containsObject:v4])
    {
      objc_sync_exit(v6);
    }
    else
    {
      v7 = PBFLogApplicationState();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [(NSMutableOrderedSet *)v6->_applicationStateStack lastObject];
        id v9 = [v8 stateDescription];
        *(_DWORD *)buf = 138543618;
        id v13 = v4;
        __int16 v14 = 2114;
        v15 = v9;
        _os_log_impl(&dword_1D31CE000, v7, OS_LOG_TYPE_DEFAULT, "Pushing state %{public}@ foreground; moving %{public}@ background",
          buf,
          0x16u);
      }
      [v4 addStateObserver:v6];
      [(NSMutableOrderedSet *)v6->_applicationStateStack addObject:v4];
      [(PBFApplicationStateMonitor *)v6 _updateApplicationContextIfNeeded];
      objc_sync_exit(v6);

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40__PBFApplicationStateMonitor_pushState___block_invoke;
      v10[3] = &unk_1E6984948;
      v10[4] = v6;
      id v11 = v4;
      [(PBFApplicationStateMonitor *)v6 _fireStateTrackingObserverSelector:sel_applicationStateMonitor_didPushNewState_ block:v10];
    }
  }
}

uint64_t __40__PBFApplicationStateMonitor_pushState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applicationStateMonitor:*(void *)(a1 + 32) didPushNewState:*(void *)(a1 + 40)];
}

- (void)addMonitorObserver:(id)a3
{
  id v5 = a3;
  if (v5 && ([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    id v4 = self;
    objc_sync_enter(v4);
    [(NSHashTable *)v4->_stateTrackingObservers addObject:v5];
    objc_sync_exit(v4);
  }
}

- (void)removeMonitorObserver:(id)a3
{
  id v5 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    id v4 = self;
    objc_sync_enter(v4);
    [(NSHashTable *)v4->_stateTrackingObservers removeObject:v5];
    objc_sync_exit(v4);
  }
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    uint64_t v3 = self;
    objc_sync_enter(v3);
    [(NSHashTable *)v3->_stateTrackingObservers removeAllObjects];
    stateTrackingObservers = v3->_stateTrackingObservers;
    v3->_stateTrackingObservers = 0;

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = (void *)[(NSMutableOrderedSet *)v3->_applicationStateStack copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v8++) cancel];
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(NSMutableOrderedSet *)v3->_applicationStateStack removeAllObjects];
    applicationStateStack = v3->_applicationStateStack;
    v3->_applicationStateStack = 0;

    objc_sync_exit(v3);
  }
}

- (void)state:(id)a3 didUpdateComponents:(id)a4
{
  id v5 = a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    [(PBFApplicationStateMonitor *)self _updateApplicationContextIfNeeded];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__PBFApplicationStateMonitor_state_didUpdateComponents___block_invoke;
    v6[3] = &unk_1E6984948;
    v6[4] = self;
    id v7 = v5;
    [(PBFApplicationStateMonitor *)self _fireStateTrackingObserverSelector:sel_applicationStateMonitor_stateDidUpdate_ block:v6];
  }
}

uint64_t __56__PBFApplicationStateMonitor_state_didUpdateComponents___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applicationStateMonitor:*(void *)(a1 + 32) stateDidUpdate:*(void *)(a1 + 40)];
}

- (void)stateWasInvalidated:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (PBFApplicationStateNode *)a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0 && self->_rootNode != v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    if ([(NSMutableOrderedSet *)v5->_applicationStateStack containsObject:v4])
    {
      [(NSMutableOrderedSet *)v5->_applicationStateStack removeObject:v4];
      uint64_t v6 = PBFLogApplicationState();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(NSMutableOrderedSet *)v5->_applicationStateStack lastObject];
        uint64_t v8 = [v7 stateDescription];
        *(_DWORD *)buf = 138543618;
        long long v12 = v4;
        __int16 v13 = 2114;
        __int16 v14 = v8;
        _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating state %{public}@ foreground; moving %{public}@ background",
          buf,
          0x16u);
      }
      [(PBFApplicationStateMonitor *)v5 _updateApplicationContextIfNeeded];
      objc_sync_exit(v5);

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__PBFApplicationStateMonitor_stateWasInvalidated___block_invoke;
      v9[3] = &unk_1E6984948;
      v9[4] = v5;
      long long v10 = v4;
      [(PBFApplicationStateMonitor *)v5 _fireStateTrackingObserverSelector:sel_applicationStateMonitor_didPopState_ block:v9];
    }
    else
    {
      objc_sync_exit(v5);
    }
  }
}

uint64_t __50__PBFApplicationStateMonitor_stateWasInvalidated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applicationStateMonitor:*(void *)(a1 + 32) didPopState:*(void *)(a1 + 40)];
}

- (void)_updateApplicationContextIfNeeded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    uint64_t v3 = [(PBFApplicationStateMonitor *)self applicationStateStack];
    id v4 = [v3 lastObject];

    id v5 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = objc_msgSend(v4, "components", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) posterUUID];
          objc_msgSend(v5, "bs_safeAddObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    long long v12 = [v4 stateDescription];
    __int16 v13 = +[PBFApplicationStateContext contextWithForegroundStateDescription:v12 posterUUIDs:v5];

    [(PBFApplicationStateMonitor *)self setCurrentApplicationContext:v13];
  }
}

- (void)_fireStateTrackingObserverSelector:(SEL)a3 block:(id)a4
{
  id v7 = a4;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    uint64_t v8 = self;
    objc_sync_enter(v8);
    uint64_t v9 = [(NSHashTable *)v8->_stateTrackingObservers allObjects];
    objc_sync_exit(v8);

    if ([v9 count])
    {
      uint64_t v10 = NSStringFromSelector(a2);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __71__PBFApplicationStateMonitor__fireStateTrackingObserverSelector_block___block_invoke;
      v11[3] = &unk_1E6984970;
      id v12 = v9;
      SEL v14 = a3;
      id v13 = v7;
      PBFDispatchAsyncWithString(v10, QOS_CLASS_USER_INITIATED, v11);
    }
  }
}

void __71__PBFApplicationStateMonitor__fireStateTrackingObserverSelector_block___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_opt_respondsToSelector()) {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (PBFApplicationStateNode)rootNode
{
  return (PBFApplicationStateNode *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_storeStrong((id *)&self->_currentApplicationContext, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_stateTrackingObservers, 0);
  objc_storeStrong((id *)&self->_applicationStateStack, 0);
}

@end