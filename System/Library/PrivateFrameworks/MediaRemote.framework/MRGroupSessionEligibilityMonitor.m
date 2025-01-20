@interface MRGroupSessionEligibilityMonitor
- (MRGroupSessionEligibilityMonitor)init;
- (MRGroupSessionEligibilityStatus)status;
- (NSHashTable)observers;
- (os_unfair_lock_s)lock;
- (void)addObserver:(id)a3;
- (void)registerNotifications;
- (void)removeObserver:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setObservers:(id)a3;
- (void)updateStatus:(id)a3;
@end

@implementation MRGroupSessionEligibilityMonitor

- (MRGroupSessionEligibilityStatus)status
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_status;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(MRGroupSessionEligibilityMonitor *)self observers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (MRGroupSessionEligibilityMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)MRGroupSessionEligibilityMonitor;
  v2 = [(MRGroupSessionEligibilityMonitor *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    id v5 = +[MRGroupSessionRequestManager sharedManager];
    uint64_t v6 = [v5 eligibilityStatus];
    status = v2->_status;
    v2->_status = (MRGroupSessionEligibilityStatus *)v6;

    [(MRGroupSessionEligibilityMonitor *)v2 registerNotifications];
  }
  return v2;
}

- (void)registerNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_updateStatus_ name:@"MRGroupSessionEligibilityDidChangeNotification" object:0];
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(MRGroupSessionEligibilityMonitor *)self observers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)updateStatus:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"MRGroupSessionEligibilityStatusUserInfoKey"];

  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = self->_status;
  objc_storeStrong((id *)&self->_status, v5);
  v7 = [(MRGroupSessionEligibilityMonitor *)self observers];
  v8 = [v7 allObjects];

  os_unfair_lock_unlock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          [v14 groupSessionMonitor:self statusDidChangeFrom:v6 to:v5];
        }
        else if (objc_opt_respondsToSelector())
        {
          objc_msgSend(v14, "groupSessionMonitor:statusDidChange:", self, v5, (void)v15);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)setObservers:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

@end