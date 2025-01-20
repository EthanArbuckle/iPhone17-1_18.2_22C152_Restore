@interface SBDoNotDisturbStateMonitor
+ (SBDoNotDisturbStateMonitor)sharedInstance;
- (DNDState)state;
- (SBDoNotDisturbStateMonitor)init;
- (void)_noteNewDNDState:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
@end

@implementation SBDoNotDisturbStateMonitor

+ (SBDoNotDisturbStateMonitor)sharedInstance
{
  if (sharedInstance_onceToken_52 != -1) {
    dispatch_once(&sharedInstance_onceToken_52, &__block_literal_global_358);
  }
  v2 = (void *)sharedInstance_monitor_0;
  return (SBDoNotDisturbStateMonitor *)v2;
}

void __44__SBDoNotDisturbStateMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBDoNotDisturbStateMonitor);
  v1 = (void *)sharedInstance_monitor_0;
  sharedInstance_monitor_0 = (uint64_t)v0;
}

- (SBDoNotDisturbStateMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)SBDoNotDisturbStateMonitor;
  v2 = [(SBDoNotDisturbStateMonitor *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v4;

    uint64_t v6 = [MEMORY[0x1E4F5F760] serviceForClientIdentifier:@"com.apple.springboard.dndstatemonitor"];
    stateService = v3->_stateService;
    v3->_stateService = (DNDStateService *)v6;

    [(DNDStateService *)v3->_stateService addStateUpdateListener:v3 withCompletionHandler:0];
    v8 = v3->_stateService;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__SBDoNotDisturbStateMonitor_init__block_invoke;
    v10[3] = &unk_1E6B0B6F8;
    v11 = v3;
    [(DNDStateService *)v8 queryCurrentStateWithCompletionHandler:v10];
  }
  return v3;
}

uint64_t __34__SBDoNotDisturbStateMonitor_init__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _noteNewDNDState:a2];
  }
  return result;
}

- (DNDState)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_state;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  objc_msgSend(a4, "state", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBDoNotDisturbStateMonitor *)self _noteNewDNDState:v5];
}

- (void)_noteNewDNDState:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_lock_state, v4);
  id v5 = (void *)[(NSHashTable *)self->_lock_observers copy];
  os_unfair_lock_unlock(&self->_lock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBDoNotDisturbStateMonitor__noteNewDNDState___block_invoke;
  block[3] = &unk_1E6AF4E00;
  id v9 = v5;
  v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__SBDoNotDisturbStateMonitor__noteNewDNDState___block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "doNotDisturbStateMonitor:didUpdateToState:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateService, 0);
  objc_storeStrong((id *)&self->_lock_state, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

@end