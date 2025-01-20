@interface SBSRemoteAlertHandle
+ (SBSRemoteAlertHandleClient)defaultHandleClient;
+ (id)handleWithConfiguration:(id)a3;
+ (id)lookupHandlesForDefinition:(id)a3;
+ (id)lookupHandlesForDefinition:(id)a3 creatingIfNone:(BOOL)a4;
+ (id)lookupHandlesForDefinition:(id)a3 creatingIfNone:(BOOL)a4 configurationContext:(id)a5;
+ (id)newHandleWithDefinition:(id)a3 configurationContext:(id)a4;
+ (void)setDefaultHandleClient:(id)a3;
- (BOOL)isActive;
- (BOOL)isValid;
- (NSString)handleID;
- (id)_initWithHandleID:(id)a3 handleClient:(id)a4;
- (void)_didActivate;
- (void)_didDeactivate;
- (void)_invalidateWithError:(id)a3 shouldInvalidateHandleClient:(BOOL)a4;
- (void)_receivedInvalidationWithError:(id)a3;
- (void)activateWithContext:(id)a3;
- (void)invalidate;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation SBSRemoteAlertHandle

- (id)_initWithHandleID:(id)a3 handleClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBSRemoteAlertHandle;
  v8 = [(SBSRemoteAlertHandle *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t Serial = BSDispatchQueueCreateSerial();
    calloutSerialQueue = v9->_calloutSerialQueue;
    v9->_calloutSerialQueue = (OS_dispatch_queue *)Serial;

    objc_storeWeak((id *)&v9->_handleClient, v7);
    uint64_t v12 = [v6 copy];
    handleID = v9->_handleID;
    v9->_handleID = (NSString *)v12;

    v9->_lock_valid = 1;
  }

  return v9;
}

+ (id)lookupHandlesForDefinition:(id)a3
{
  return (id)[a1 lookupHandlesForDefinition:a3 creatingIfNone:0];
}

+ (id)lookupHandlesForDefinition:(id)a3 creatingIfNone:(BOOL)a4
{
  return (id)[a1 lookupHandlesForDefinition:a3 creatingIfNone:a4 configurationContext:0];
}

+ (id)lookupHandlesForDefinition:(id)a3 creatingIfNone:(BOOL)a4 configurationContext:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v10 = (SBSRemoteAlertConfigurationContext *)a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_5;
    }
  }
  else
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"SBSRemoteAlertHandle.m", 50, @"Invalid parameter not satisfying: %@", @"definition" object file lineNumber description];

    if (v11) {
      goto LABEL_5;
    }
  }
  if (v6) {
    v11 = objc_alloc_init(SBSRemoteAlertConfigurationContext);
  }
LABEL_5:
  uint64_t v12 = [a1 defaultHandleClient];
  v13 = [v12 remoteAlertHandlesForDefinition:v9 allowsCreation:v6 configurationContext:v11];

  return v13;
}

+ (id)newHandleWithDefinition:(id)a3 configurationContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"SBSRemoteAlertHandle.m", 58, @"Invalid parameter not satisfying: %@", @"definition" object file lineNumber description];
  }
  id v9 = [a1 defaultHandleClient];
  v10 = [v9 createRemoteAlertHandleWithDefinition:v7 configurationContext:v8];

  return v10;
}

- (void)registerObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_observers = self->_lock_observers;
  if (!lock_observers)
  {
    v5 = (NSHashTable *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:1];
    BOOL v6 = self->_lock_observers;
    self->_lock_observers = v5;

    lock_observers = self->_lock_observers;
  }
  [(NSHashTable *)lock_observers addObject:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterObserver:(id)a3
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

- (void)activateWithContext:(id)a3
{
  p_handleClient = &self->_handleClient;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_handleClient);
  [WeakRetained activateRemoteAlertHandle:self withContext:v5];
}

- (BOOL)isActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_active;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
}

- (BOOL)isValid
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_valid;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_didActivate
{
  calloutSerialQueue = self->_calloutSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SBSRemoteAlertHandle__didActivate__block_invoke;
  block[3] = &unk_1E566BCE8;
  block[4] = self;
  dispatch_async(calloutSerialQueue, block);
}

void __36__SBSRemoteAlertHandle__didActivate__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 12);
  *(unsigned char *)(v2 + 12) = 1;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
  }
  else
  {
    id v5 = (void *)[*(id *)(v4 + 16) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 remoteAlertHandleDidActivate:*(void *)(a1 + 32) completion:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_didDeactivate
{
  calloutSerialQueue = self->_calloutSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SBSRemoteAlertHandle__didDeactivate__block_invoke;
  block[3] = &unk_1E566BCE8;
  block[4] = self;
  dispatch_async(calloutSerialQueue, block);
}

void __38__SBSRemoteAlertHandle__didDeactivate__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 12);
  *(unsigned char *)(v2 + 12) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = (void *)[*(id *)(v4 + 16) copy];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 remoteAlertHandleDidDeactivate:*(void *)(a1 + 32) completion:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
  }
}

- (void)_receivedInvalidationWithError:(id)a3
{
}

+ (SBSRemoteAlertHandleClient)defaultHandleClient
{
  uint64_t v2 = (void *)sDefaultHandleClient;
  if (!sDefaultHandleClient)
  {
    if (defaultHandleClient_sOnceToken != -1) {
      dispatch_once(&defaultHandleClient_sOnceToken, &__block_literal_global_29);
    }
    uint64_t v2 = (void *)sDefaultXPCHandleClient;
  }
  id v3 = v2;
  return (SBSRemoteAlertHandleClient *)v3;
}

uint64_t __43__SBSRemoteAlertHandle_defaultHandleClient__block_invoke()
{
  sDefaultXPCHandleClient = objc_alloc_init(SBSRemoteAlertHandleXPCClient);
  return MEMORY[0x1F41817F8]();
}

+ (void)setDefaultHandleClient:(id)a3
{
}

- (void)_invalidateWithError:(id)a3 shouldInvalidateHandleClient:(BOOL)a4
{
  id v6 = a3;
  calloutSerialQueue = self->_calloutSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SBSRemoteAlertHandle__invalidateWithError_shouldInvalidateHandleClient___block_invoke;
  block[3] = &unk_1E566C710;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(calloutSerialQueue, block);
}

void __74__SBSRemoteAlertHandle__invalidateWithError_shouldInvalidateHandleClient___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 12);
  int v4 = *(unsigned __int8 *)(v2 + 13);
  if (v4 | v3) {
    id v5 = (void *)[*(id *)(v2 + 16) copy];
  }
  else {
    id v5 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 12) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 13) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  if (v3)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 remoteAlertHandleDidDeactivate:*(void *)(a1 + 32)];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
  }
  if (v4)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
      [WeakRetained invalidateRemoteAlertHandle:*(void *)(a1 + 32)];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v5;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector()) {
            [v18 remoteAlertHandle:v19 didInvalidateWithError:v19];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v15);
    }
  }
}

+ (id)handleWithConfiguration:(id)a3
{
  int v3 = (void *)[a1 newHandleWithDefinition:a3 configurationContext:0];
  return v3;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleID, 0);
  objc_destroyWeak((id *)&self->_handleClient);
  objc_storeStrong((id *)&self->_calloutSerialQueue, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

@end