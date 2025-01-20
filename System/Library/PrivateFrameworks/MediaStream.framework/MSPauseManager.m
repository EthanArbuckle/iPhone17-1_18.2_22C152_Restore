@interface MSPauseManager
+ (id)sharedManager;
- (BOOL)isPaused;
- (MSPauseManager)init;
- (MSPauseManagerDelegate)delegate;
- (void)_addPauseUUID:(id)a3;
- (void)_removeTimerUUID:(id)a3;
- (void)_timerDidFire:(id)a3;
- (void)dealloc;
- (void)pingPauseUUID:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MSPauseManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_UUIDToTimerMap, 0);
}

- (void)setDelegate:(id)a3
{
}

- (MSPauseManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSPauseManagerDelegate *)WeakRetained;
}

- (void)_timerDidFire:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = [a3 userInfo];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Pause timer UUID %{public}@ expired.", buf, 0xCu);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__MSPauseManager__timerDidFire___block_invoke;
  v6[3] = &unk_1E6CFCE40;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __32__MSPauseManager__timerDidFire___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeTimerUUID:*(void *)(a1 + 40)];
}

- (void)_removeTimerUUID:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(NSMutableDictionary *)self->_UUIDToTimerMap count];
  id v5 = [(NSMutableDictionary *)self->_UUIDToTimerMap objectForKey:v12];
  v6 = v5;
  if (v5)
  {
    [v5 invalidate];
    [(NSMutableDictionary *)self->_UUIDToTimerMap removeObjectForKey:v12];
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_UUIDToTimerMap count];
  if (v4) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 pauseManagerDidUnpause:self];
    }
  }
}

- (void)pingPauseUUID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [NSString MSMakeUUID];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_error_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Pause manager received an invalid UUID. Making up a new one: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138543362;
    id v11 = v5;
    _os_log_debug_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Pause timer ping for UUID %{public}@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_UUIDToTimerMap count];
  [(MSPauseManager *)self _addPauseUUID:v5];
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 pauseManagerDidPause:self];
    }
  }
}

- (void)_addPauseUUID:(id)a3
{
  UUIDToTimerMap = self->_UUIDToTimerMap;
  id v5 = a3;
  id v10 = [(NSMutableDictionary *)UUIDToTimerMap objectForKey:v5];
  if (v10) {
    [v10 invalidate];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CB00]);
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:30.0];
  char v8 = (void *)[v6 initWithFireDate:v7 interval:self target:sel__timerDidFire_ selector:v5 userInfo:0 repeats:0.0];

  [(NSMutableDictionary *)self->_UUIDToTimerMap setObject:v8 forKey:v5];
  id v9 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v9 addTimer:v8 forMode:*MEMORY[0x1E4F1C3A0]];
}

- (BOOL)isPaused
{
  return [(NSMutableDictionary *)self->_UUIDToTimerMap count] != 0;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(NSMutableDictionary *)self->_UUIDToTimerMap allValues];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MSPauseManager;
  [(MSPauseManager *)&v8 dealloc];
}

- (MSPauseManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSPauseManager;
  v2 = [(MSPauseManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    UUIDToTimerMap = v2->_UUIDToTimerMap;
    v2->_UUIDToTimerMap = v3;
  }
  return v2;
}

+ (id)sharedManager
{
  v2 = (void *)sharedManager_manager;
  if (!sharedManager_manager)
  {
    v3 = objc_alloc_init(MSPauseManager);
    uint64_t v4 = (void *)sharedManager_manager;
    sharedManager_manager = (uint64_t)v3;

    v2 = (void *)sharedManager_manager;
  }

  return v2;
}

@end