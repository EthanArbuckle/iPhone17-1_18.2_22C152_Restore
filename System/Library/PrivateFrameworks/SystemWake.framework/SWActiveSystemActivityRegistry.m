@interface SWActiveSystemActivityRegistry
+ (id)sharedRegistry;
- (SWActiveSystemActivityRegistry)init;
- (id)description;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)notifyObserversWithBlock:(uint64_t)a1;
- (void)registerActiveSystemActivity:(id)a3;
- (void)removeObserver:(id)a3;
- (void)unregisterInactiveSystemActivity:(id)a3;
@end

@implementation SWActiveSystemActivityRegistry

+ (id)sharedRegistry
{
  if (qword_26AB24F88 != -1) {
    dispatch_once(&qword_26AB24F88, &__block_literal_global_259);
  }
  v2 = (void *)qword_26AB24F80;
  return v2;
}

uint64_t __48__SWActiveSystemActivityRegistry_sharedRegistry__block_invoke()
{
  qword_26AB24F80 = objc_alloc_init(SWActiveSystemActivityRegistry);
  return MEMORY[0x270F9A758]();
}

- (SWActiveSystemActivityRegistry)init
{
  v13.receiver = self;
  v13.super_class = (Class)SWActiveSystemActivityRegistry;
  v2 = [(SWActiveSystemActivityRegistry *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v4;

    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v6 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
      lock_activeSystemActivities = v3->_lock_activeSystemActivities;
      v3->_lock_activeSystemActivities = (NSHashTable *)v6;
    }
    objc_initWeak(&location, v3);
    objc_copyWeak(&v11, &location);
    uint64_t v8 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureHandler = v3->_stateCaptureHandler;
    v3->_stateCaptureHandler = (BSInvalidatable *)v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v3;
}

id __38__SWActiveSystemActivityRegistry_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained description];

  return v2;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureHandler invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SWActiveSystemActivityRegistry;
  [(SWActiveSystemActivityRegistry *)&v3 dealloc];
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__SWActiveSystemActivityRegistry_description__block_invoke;
  v11[3] = &unk_264139988;
  id v5 = v4;
  id v12 = v5;
  objc_super v13 = self;
  [v5 appendProem:self block:v11];
  if ([(NSHashTable *)self->_lock_activeSystemActivities count])
  {
    lock_activeSystemActivities = self->_lock_activeSystemActivities;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__SWActiveSystemActivityRegistry_description__block_invoke_2;
    v9[3] = &unk_2641399B0;
    id v10 = v5;
    [v10 appendCollection:lock_activeSystemActivities withName:@"activities" itemBlock:v9];
  }
  os_unfair_lock_unlock(p_lock);
  v7 = [v5 description];

  return v7;
}

id __45__SWActiveSystemActivityRegistry_description__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 32) withName:@"count"];
}

id __45__SWActiveSystemActivityRegistry_description__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2 withName:0];
}

- (void)registerActiveSystemActivity:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  unint64_t lock_activeSystemActivitiesCount = self->_lock_activeSystemActivitiesCount;
  self->_unint64_t lock_activeSystemActivitiesCount = lock_activeSystemActivitiesCount + 1;
  [(NSHashTable *)self->_lock_activeSystemActivities addObject:v5];

  os_unfair_lock_unlock(p_lock);
  if (!lock_activeSystemActivitiesCount)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__SWActiveSystemActivityRegistry_registerActiveSystemActivity___block_invoke;
    v7[3] = &unk_2641399D8;
    v7[4] = self;
    -[SWActiveSystemActivityRegistry notifyObserversWithBlock:]((uint64_t)self, v7);
  }
}

uint64_t __63__SWActiveSystemActivityRegistry_registerActiveSystemActivity___block_invoke(uint64_t a1, void *a2)
{
  return [a2 systemActivityRegistryCountDidIncrementToOne:*(void *)(a1 + 32)];
}

- (void)notifyObserversWithBlock:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v5 = [*(id *)(a1 + 24) allObjects];
    os_unfair_lock_unlock(v4);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          v3[2](v3, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)unregisterInactiveSystemActivity:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  unint64_t v6 = self->_lock_activeSystemActivitiesCount - 1;
  self->_unint64_t lock_activeSystemActivitiesCount = v6;
  [(NSHashTable *)self->_lock_activeSystemActivities removeObject:v5];

  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__SWActiveSystemActivityRegistry_unregisterInactiveSystemActivity___block_invoke;
    v7[3] = &unk_2641399D8;
    v7[4] = self;
    -[SWActiveSystemActivityRegistry notifyObserversWithBlock:]((uint64_t)self, v7);
  }
}

uint64_t __67__SWActiveSystemActivityRegistry_unregisterInactiveSystemActivity___block_invoke(uint64_t a1, void *a2)
{
  return [a2 systemActivityRegistryCountDidDecrementToZero:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (!v9)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      long long v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      v17 = @"SWSystemSleepMonitor.m";
      __int16 v18 = 1024;
      int v19 = 764;
      __int16 v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080F6BCLL);
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_observers addObject:v9];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (!v9)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544642;
      id v11 = v6;
      __int16 v12 = 2114;
      long long v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      v17 = @"SWSystemSleepMonitor.m";
      __int16 v18 = 1024;
      int v19 = 771;
      __int16 v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_210809000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21080F89CLL);
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v9];
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_activeSystemActivities, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandler, 0);
}

@end