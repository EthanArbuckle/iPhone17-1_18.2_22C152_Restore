@interface PKAsyncOperationState
- (BOOL)isCanceled;
- (PKAsyncOperationState)init;
- (id)_init;
- (void)_cancel;
- (void)_invalidate;
- (void)addCancelAction:(id)a3;
- (void)performAction:(id)a3;
@end

@implementation PKAsyncOperationState

- (void).cxx_destruct
{
}

- (void)_invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    cancelActions = self->_cancelActions;
    self->_cancelActions = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKAsyncOperationState;
  id result = [(PKAsyncOperationState *)&v3 init];
  if (result)
  {
    *((_DWORD *)result + 6) = 0;
    *((_DWORD *)result + 2) = 0;
  }
  return result;
}

- (void)_cancel
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_canceled)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_canceled = 1;
    v4 = self->_cancelActions;
    cancelActions = self->_cancelActions;
    self->_cancelActions = 0;

    os_unfair_lock_unlock(p_lock);
    if (v4)
    {
      p_actionLock = &self->_actionLock;
      os_unfair_lock_lock(p_actionLock);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v7 = v4;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * i));
          }
          uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }

      os_unfair_lock_unlock(p_actionLock);
    }
  }
}

- (PKAsyncOperationState)init
{
  return 0;
}

- (void)performAction:(id)a3
{
  if (a3)
  {
    p_actionLock = &self->_actionLock;
    v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_actionLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_actionLock);
  }
}

- (void)addCancelAction:(id)a3
{
  v4 = (void (**)(void))a3;
  if (v4)
  {
    aBlock = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_canceled || self->_invalidated)
    {
      os_unfair_lock_unlock(&self->_lock);
      os_unfair_lock_lock(&self->_actionLock);
      aBlock[2]();
      os_unfair_lock_unlock(&self->_actionLock);
    }
    else
    {
      cancelActions = self->_cancelActions;
      if (!cancelActions)
      {
        v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v8 = self->_cancelActions;
        self->_cancelActions = v7;

        cancelActions = self->_cancelActions;
      }
      uint64_t v9 = _Block_copy(aBlock);
      [(NSMutableArray *)cancelActions addObject:v9];

      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (BOOL)isCanceled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_canceled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

@end