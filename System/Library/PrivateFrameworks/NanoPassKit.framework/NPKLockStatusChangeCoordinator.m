@interface NPKLockStatusChangeCoordinator
+ (id)descriptionOfLockStatusChangeEvent:(unint64_t)a3;
- (BOOL)_hasLockBlocksToPerform;
- (BOOL)_hasUnlockBlocksToPerform;
- (BOOL)_isLockedForLockState:(int)a3;
- (BOOL)_isUnlockedForLockState:(int)a3;
- (BOOL)hasBlocksToPerform;
- (BOOL)wipeBlocksAfterPerform;
- (NPKLockStatusChangeCoordinator)initWithQueue:(id)a3;
- (NPKLockStatusChangeCoordinatorDelegate)delegate;
- (NSMutableArray)blocksToPerformAfterDeviceLock;
- (NSMutableArray)blocksToPerformAfterDeviceUnlock;
- (OS_dispatch_queue)queue;
- (int)_lockState;
- (int)notifyLockStatesToken;
- (void)_handleLockStateChange;
- (void)_performLockWork;
- (void)_performUnlockWork;
- (void)_performWorkForEvent:(unint64_t)a3 withBlocks:(id)a4;
- (void)_registerForLockStatusChanges;
- (void)dealloc;
- (void)performBlocksIfPossible;
- (void)performSubjectToEvent:(unint64_t)a3 blockToPerform:(id)a4;
- (void)setBlocksToPerformAfterDeviceLock:(id)a3;
- (void)setBlocksToPerformAfterDeviceUnlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotifyLockStatesToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)setWipeBlocksAfterPerform:(BOOL)a3;
@end

@implementation NPKLockStatusChangeCoordinator

- (NPKLockStatusChangeCoordinator)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKLockStatusChangeCoordinator;
  v6 = [(NPKLockStatusChangeCoordinator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    [(NPKLockStatusChangeCoordinator *)v7 _registerForLockStatusChanges];
    v7->_wipeBlocksAfterPerform = 1;
  }

  return v7;
}

- (void)dealloc
{
  if (notify_is_valid_token([(NPKLockStatusChangeCoordinator *)self notifyLockStatesToken]))
  {
    notify_cancel([(NPKLockStatusChangeCoordinator *)self notifyLockStatesToken]);
    [(NPKLockStatusChangeCoordinator *)self setNotifyLockStatesToken:0xFFFFFFFFLL];
  }
  v3.receiver = self;
  v3.super_class = (Class)NPKLockStatusChangeCoordinator;
  [(NPKLockStatusChangeCoordinator *)&v3 dealloc];
}

- (NSMutableArray)blocksToPerformAfterDeviceUnlock
{
  blocksToPerformAfterDeviceUnlock = self->_blocksToPerformAfterDeviceUnlock;
  if (!blocksToPerformAfterDeviceUnlock)
  {
    v4 = [MEMORY[0x263EFF980] array];
    id v5 = self->_blocksToPerformAfterDeviceUnlock;
    self->_blocksToPerformAfterDeviceUnlock = v4;

    blocksToPerformAfterDeviceUnlock = self->_blocksToPerformAfterDeviceUnlock;
  }
  return blocksToPerformAfterDeviceUnlock;
}

- (NSMutableArray)blocksToPerformAfterDeviceLock
{
  blocksToPerformAfterDeviceLock = self->_blocksToPerformAfterDeviceLock;
  if (!blocksToPerformAfterDeviceLock)
  {
    v4 = [MEMORY[0x263EFF980] array];
    id v5 = self->_blocksToPerformAfterDeviceLock;
    self->_blocksToPerformAfterDeviceLock = v4;

    blocksToPerformAfterDeviceLock = self->_blocksToPerformAfterDeviceLock;
  }
  return blocksToPerformAfterDeviceLock;
}

- (void)performSubjectToEvent:(unint64_t)a3 blockToPerform:(id)a4
{
  id v10 = a4;
  v6 = [(NPKLockStatusChangeCoordinator *)self queue];
  dispatch_assert_queue_V2(v6);

  if (a3 == 1)
  {
    uint64_t v7 = [(NPKLockStatusChangeCoordinator *)self blocksToPerformAfterDeviceLock];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    uint64_t v7 = [(NPKLockStatusChangeCoordinator *)self blocksToPerformAfterDeviceUnlock];
  }
  v8 = (void *)v7;
  objc_super v9 = (void *)MEMORY[0x223C37380](v10);
  [v8 addObject:v9];

LABEL_6:
}

- (BOOL)hasBlocksToPerform
{
  BOOL v3 = [(NPKLockStatusChangeCoordinator *)self _hasUnlockBlocksToPerform];
  return v3 | [(NPKLockStatusChangeCoordinator *)self _hasLockBlocksToPerform];
}

- (void)performBlocksIfPossible
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Requested perform blocks if possible.", buf, 0xCu);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__NPKLockStatusChangeCoordinator_performBlocksIfPossible__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __57__NPKLockStatusChangeCoordinator_performBlocksIfPossible__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleLockStateChange];
}

- (void)setWipeBlocksAfterPerform:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__NPKLockStatusChangeCoordinator_setWipeBlocksAfterPerform___block_invoke;
  v4[3] = &unk_2644D2938;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __60__NPKLockStatusChangeCoordinator_setWipeBlocksAfterPerform___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)wipeBlocksAfterPerform
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__NPKLockStatusChangeCoordinator_wipeBlocksAfterPerform__block_invoke;
  v5[3] = &unk_2644D2960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__NPKLockStatusChangeCoordinator_wipeBlocksAfterPerform__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

+ (id)descriptionOfLockStatusChangeEvent:(unint64_t)a3
{
  if (a3) {
    return @"NPKLockStatusChangeEventLock";
  }
  else {
    return @"NPKLockStatusChangeEventUnlock";
  }
}

- (BOOL)_hasUnlockBlocksToPerform
{
  v2 = [(NPKLockStatusChangeCoordinator *)self blocksToPerformAfterDeviceUnlock];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_hasLockBlocksToPerform
{
  v2 = [(NPKLockStatusChangeCoordinator *)self blocksToPerformAfterDeviceLock];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_isUnlockedForLockState:(int)a3
{
  return a3 == 0;
}

- (BOOL)_isLockedForLockState:(int)a3
{
  return (a3 - 1) < 2;
}

- (int)_lockState
{
  v6[1] = *MEMORY[0x263EF8340];
  BOOL v5 = @"ExtendedDeviceLockState";
  v6[0] = MEMORY[0x263EFFA88];
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  int v3 = MKBGetDeviceLockState();

  return v3;
}

- (void)_registerForLockStatusChanges
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_notifyLockStatesToken = &self->_notifyLockStatesToken;
  if (!notify_is_valid_token(self->_notifyLockStatesToken))
  {
    BOOL v4 = pk_General_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      uint64_t v6 = pk_General_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = (objc_class *)objc_opt_class();
        uint64_t v8 = NSStringFromClass(v7);
        *(_DWORD *)buf = 138543362;
        v13 = v8;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Registering for lock state notifications", buf, 0xCu);
      }
    }
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __63__NPKLockStatusChangeCoordinator__registerForLockStatusChanges__block_invoke;
    handler[3] = &unk_2644D2870;
    objc_copyWeak(&v11, (id *)buf);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", p_notifyLockStatesToken, queue, handler);
    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __63__NPKLockStatusChangeCoordinator__registerForLockStatusChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleLockStateChange];
    id WeakRetained = v2;
  }
}

- (void)_handleLockStateChange
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v23 = 138543362;
      v24 = v7;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Handling lock state change", (uint8_t *)&v23, 0xCu);
    }
  }
  uint64_t v8 = [(NPKLockStatusChangeCoordinator *)self _lockState];
  if ([(NPKLockStatusChangeCoordinator *)self _isUnlockedForLockState:v8])
  {
    char v9 = pk_General_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      id v11 = pk_General_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        int v23 = 138543362;
        v24 = v13;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Device is unlocked", (uint8_t *)&v23, 0xCu);
      }
    }
    [(NPKLockStatusChangeCoordinator *)self _performUnlockWork];
  }
  else
  {
    BOOL v14 = [(NPKLockStatusChangeCoordinator *)self _isLockedForLockState:v8];
    v15 = pk_General_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      if (v16)
      {
        v17 = pk_General_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (objc_class *)objc_opt_class();
          v19 = NSStringFromClass(v18);
          int v23 = 138543362;
          v24 = v19;
          _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Device is locked", (uint8_t *)&v23, 0xCu);
        }
      }
      [(NPKLockStatusChangeCoordinator *)self _performLockWork];
    }
    else if (v16)
    {
      v20 = pk_General_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        int v23 = 138543618;
        v24 = v22;
        __int16 v25 = 1024;
        int v26 = v8;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Unhandled lock state with value %i", (uint8_t *)&v23, 0x12u);
      }
    }
  }
}

- (void)_performUnlockWork
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(NPKLockStatusChangeCoordinator *)self _hasUnlockBlocksToPerform])
  {
    int v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      BOOL v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = (objc_class *)objc_opt_class();
        uint64_t v7 = NSStringFromClass(v6);
        uint64_t v8 = [(NPKLockStatusChangeCoordinator *)self blocksToPerformAfterDeviceUnlock];
        int v10 = 138543618;
        id v11 = v7;
        __int16 v12 = 2048;
        uint64_t v13 = [v8 count];
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Performing work in response to device unlock - %lu block(s) to execute", (uint8_t *)&v10, 0x16u);
      }
    }
    char v9 = [(NPKLockStatusChangeCoordinator *)self blocksToPerformAfterDeviceUnlock];
    [(NPKLockStatusChangeCoordinator *)self _performWorkForEvent:0 withBlocks:v9];

    if (self->_wipeBlocksAfterPerform) {
      [(NPKLockStatusChangeCoordinator *)self setBlocksToPerformAfterDeviceUnlock:0];
    }
  }
}

- (void)_performLockWork
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(NPKLockStatusChangeCoordinator *)self _hasLockBlocksToPerform])
  {
    int v3 = pk_General_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      BOOL v5 = pk_General_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = (objc_class *)objc_opt_class();
        uint64_t v7 = NSStringFromClass(v6);
        uint64_t v8 = [(NPKLockStatusChangeCoordinator *)self blocksToPerformAfterDeviceLock];
        int v10 = 138543618;
        id v11 = v7;
        __int16 v12 = 2048;
        uint64_t v13 = [v8 count];
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Performing work in response to device lock - %lu block(s) to execute", (uint8_t *)&v10, 0x16u);
      }
    }
    char v9 = [(NPKLockStatusChangeCoordinator *)self blocksToPerformAfterDeviceLock];
    [(NPKLockStatusChangeCoordinator *)self _performWorkForEvent:1 withBlocks:v9];

    if (self->_wipeBlocksAfterPerform) {
      [(NPKLockStatusChangeCoordinator *)self setBlocksToPerformAfterDeviceLock:0];
    }
  }
}

- (void)_performWorkForEvent:(unint64_t)a3 withBlocks:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NPKLockStatusChangeCoordinator *)self delegate];
  [v7 lockStatusChangeCoordinator:self willBeginPerformingBlocksForLockStatusEvent:a3];

  [v6 enumerateObjectsUsingBlock:&__block_literal_global];
  id v8 = [(NPKLockStatusChangeCoordinator *)self delegate];
  [v8 lockStatusChangeCoordinator:self didFinishPerformingBlocksForLockStatusEvent:a3];
}

uint64_t __66__NPKLockStatusChangeCoordinator__performWorkForEvent_withBlocks___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (NPKLockStatusChangeCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPKLockStatusChangeCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setBlocksToPerformAfterDeviceUnlock:(id)a3
{
}

- (void)setBlocksToPerformAfterDeviceLock:(id)a3
{
}

- (int)notifyLockStatesToken
{
  return self->_notifyLockStatesToken;
}

- (void)setNotifyLockStatesToken:(int)a3
{
  self->_notifyLockStatesToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocksToPerformAfterDeviceLock, 0);
  objc_storeStrong((id *)&self->_blocksToPerformAfterDeviceUnlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end