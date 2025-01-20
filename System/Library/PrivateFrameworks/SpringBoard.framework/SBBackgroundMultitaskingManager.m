@interface SBBackgroundMultitaskingManager
+ (id)sharedInstance;
- (SBBackgroundMultitaskingManager)init;
- (id)_createBackgroundFetchTaskForAppInfo:(id)a3;
- (void)_appProcessStateDidChange:(id)a3;
- (void)_backgroundTaskFinished:(id)a3 forAppInfo:(id)a4;
@end

@implementation SBBackgroundMultitaskingManager

- (void)_appProcessStateDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = [a3 object];
  v5 = [v4 processState];
  if ([v5 visibility] == 2)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock_appToBackgroundTasks = self->_lock_appToBackgroundTasks;
    v8 = [v4 info];
    v9 = [v8 processIdentity];
    v10 = [(NSMutableDictionary *)lock_appToBackgroundTasks objectForKey:v9];
    v11 = (void *)[v10 copy];

    os_unfair_lock_unlock(p_lock);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          -[SBBackgroundFetchTask finishWithResult:](*(void *)(*((void *)&v17 + 1) + 8 * v16++), 5uLL);
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_57 != -1) {
    dispatch_once(&sharedInstance_onceToken_57, &__block_literal_global_408);
  }
  v2 = (void *)sharedInstance___sharedInstance_29;
  return v2;
}

uint64_t __49__SBBackgroundMultitaskingManager_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBBackgroundMultitaskingManager);
  v1 = (void *)sharedInstance___sharedInstance_29;
  sharedInstance___sharedInstance_29 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBBackgroundMultitaskingManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBBackgroundMultitaskingManager;
  v2 = [(SBBackgroundMultitaskingManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lock_appToBackgroundTasks = v3->_lock_appToBackgroundTasks;
    v3->_lock_appToBackgroundTasks = v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__appProcessStateDidChange_ name:@"SBApplicationProcessStateDidChange" object:0];
  }
  return v3;
}

- (void)_backgroundTaskFinished:(id)a3 forAppInfo:(id)a4
{
  id v13 = a4;
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_appToBackgroundTasks = self->_lock_appToBackgroundTasks;
  v9 = [v13 processIdentity];
  v10 = [(NSMutableDictionary *)lock_appToBackgroundTasks objectForKey:v9];

  [v10 removeObjectIdenticalTo:v7];
  if (![v10 count])
  {
    v11 = self->_lock_appToBackgroundTasks;
    id v12 = [v13 processIdentity];
    [(NSMutableDictionary *)v11 removeObjectForKey:v12];
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_createBackgroundFetchTaskForAppInfo:(id)a3
{
  id v4 = a3;
  v5 = [SBBackgroundFetchTask alloc];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  long long v17 = __72__SBBackgroundMultitaskingManager__createBackgroundFetchTaskForAppInfo___block_invoke;
  long long v18 = &unk_1E6B0E2B0;
  long long v19 = self;
  id v6 = v4;
  id v20 = v6;
  id v7 = -[SBBackgroundFetchTask initForAppInfo:withCompletion:]((id *)&v5->super.isa, v6, &v15);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_appToBackgroundTasks = self->_lock_appToBackgroundTasks;
  v10 = objc_msgSend(v6, "processIdentity", v15, v16, v17, v18, v19);
  id v11 = [(NSMutableDictionary *)lock_appToBackgroundTasks objectForKey:v10];

  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = self->_lock_appToBackgroundTasks;
    id v13 = [v6 processIdentity];
    [(NSMutableDictionary *)v12 setObject:v11 forKey:v13];
  }
  [v11 addObject:v7];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

uint64_t __72__SBBackgroundMultitaskingManager__createBackgroundFetchTaskForAppInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _backgroundTaskFinished:a2 forAppInfo:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

@end