@interface SBSSystemNotesPresentationHandle
- (SBSSystemNotesPresentationConfiguration)requestedConfiguration;
- (SBSSystemNotesPresentationHandle)initWithConfiguration:(id)a3;
- (SBSSystemNotesPresentationHandle)initWithConfiguration:(id)a3 client:(id)a4;
- (int64_t)presentationMode;
- (void)_invalidateWithError:(id)a3 locally:(BOOL)a4;
- (void)activate;
- (void)addObserver:(id)a3;
- (void)configuration:(id)a3 didChangeToPresentationMode:(id)a4;
- (void)configuration:(id)a3 didInvalidateWithError:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
@end

@implementation SBSSystemNotesPresentationHandle

- (SBSSystemNotesPresentationHandle)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SBSSystemNotesPresentationClientToServerProxy);
  v6 = [(SBSSystemNotesPresentationHandle *)self initWithConfiguration:v4 client:v5];

  return v6;
}

- (SBSSystemNotesPresentationHandle)initWithConfiguration:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBSSystemNotesPresentationHandle;
  v8 = [(SBSSystemNotesPresentationHandle *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    *(_OWORD *)&v8->_lock_state = xmmword_18FC48E80;
    uint64_t v10 = [v6 copy];
    configuration = v9->_configuration;
    v9->_configuration = (SBSSystemNotesPresentationConfiguration *)v10;

    objc_storeStrong((id *)&v9->_handleClient, a4);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    calloutSerialQueue = v9->_calloutSerialQueue;
    v9->_calloutSerialQueue = (OS_dispatch_queue *)Serial;

    [(SBSSystemNotesPresentationClientToServerProxy *)v9->_handleClient setDelegate:v9];
  }

  return v9;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_state == 1) {
    [(SBSSystemNotesPresentationHandle *)self invalidate];
  }
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)SBSSystemNotesPresentationHandle;
  [(SBSSystemNotesPresentationHandle *)&v4 dealloc];
}

- (void)activate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_state)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBSSystemNotesPresentationHandle.m" lineNumber:66 description:@"attempting to activate a SBSSystemNotesPresentationHandle multiple times"];
  }
  self->_lock_state = 1;
  os_unfair_lock_unlock(p_lock);
  handleClient = self->_handleClient;
  configuration = self->_configuration;
  [(SBSSystemNotesPresentationClientToServerProxy *)handleClient activateConfiguration:configuration];
}

- (void)invalidate
{
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_observers = self->_lock_observers;
  if (!lock_observers)
  {
    v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v6 = self->_lock_observers;
    self->_lock_observers = v5;

    lock_observers = self->_lock_observers;
  }
  [(NSHashTable *)lock_observers addObject:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  if (![(NSHashTable *)self->_lock_observers count])
  {
    lock_observers = self->_lock_observers;
    self->_lock_observers = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)presentationMode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_presentationMode = self->_lock_presentationMode;
  os_unfair_lock_unlock(p_lock);
  return lock_presentationMode;
}

- (SBSSystemNotesPresentationConfiguration)requestedConfiguration
{
  v2 = (void *)[(SBSSystemNotesPresentationConfiguration *)self->_configuration copy];
  return (SBSSystemNotesPresentationConfiguration *)v2;
}

- (void)configuration:(id)a3 didInvalidateWithError:(id)a4
{
}

- (void)configuration:(id)a3 didChangeToPresentationMode:(id)a4
{
  int64_t v5 = [a4 integerValue];
  os_unfair_lock_lock(&self->_lock);
  self->_int64_t lock_presentationMode = v5;
  os_unfair_lock_unlock(&self->_lock);
  calloutSerialQueue = self->_calloutSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SBSSystemNotesPresentationHandle_configuration_didChangeToPresentationMode___block_invoke;
  v7[3] = &unk_1E566B460;
  v7[4] = self;
  v7[5] = v5;
  dispatch_async(calloutSerialQueue, v7);
}

void __78__SBSSystemNotesPresentationHandle_configuration_didChangeToPresentationMode___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 systemNotesPresentationHandle:*(void *)(a1 + 32) didChangePresentationMode:*(void *)(a1 + 40) completion:v9];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_invalidateWithError:(id)a3 locally:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!v4 && !self->_lock_state)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBSSystemNotesPresentationHandle.m" lineNumber:137 description:@"server called back with invalidation but we're only in Initialized state"];
  }
  int64_t lock_state = self->_lock_state;
  self->_int64_t lock_state = 2;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_state != 2)
  {
    long long v9 = SBLogSystemNotes();
    long long v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SBSSystemNotesPresentationHandle _invalidateWithError:locally:]((uint64_t)self, (uint64_t)v7, v10);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = self;
      _os_log_impl(&dword_18FBC5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating", buf, 0xCu);
    }

    if (v4) {
      [(SBSSystemNotesPresentationClientToServerProxy *)self->_handleClient invalidate];
    }
    calloutSerialQueue = self->_calloutSerialQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__SBSSystemNotesPresentationHandle__invalidateWithError_locally___block_invoke;
    v13[3] = &unk_1E566BB08;
    v13[4] = self;
    id v14 = v7;
    dispatch_async(calloutSerialQueue, v13);
  }
}

void __65__SBSSystemNotesPresentationHandle__invalidateWithError_locally___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 systemNotesPresentationHandle:didInvalidateWithError:v9];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_calloutSerialQueue, 0);
  objc_storeStrong((id *)&self->_handleClient, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

- (void)_invalidateWithError:(os_log_t)log locally:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18FBC5000, log, OS_LOG_TYPE_ERROR, "%{public}@ invalidating with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end