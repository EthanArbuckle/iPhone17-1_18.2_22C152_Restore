@interface MSDSessionTaskManager
- (MSDSessionTaskManager)init;
- (NSMapTable)sharedStore;
- (id)getSessionTask:(id)a3;
- (id)getTaskInState:(int)a3;
- (os_unfair_lock_s)sharedStoreLock;
- (void)addSessionTask:(id)a3;
- (void)cancelAndRemoveAllSessionTask;
- (void)removeSessionTask:(id)a3;
- (void)setSharedStore:(id)a3;
- (void)setSharedStoreLock:(os_unfair_lock_s)a3;
@end

@implementation MSDSessionTaskManager

- (MSDSessionTaskManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDSessionTaskManager;
  v2 = [(MSDSessionTaskManager *)&v6 init];
  if (v2)
  {
    v3 = +[NSMapTable strongToStrongObjectsMapTable];
    [(MSDSessionTaskManager *)v2 setSharedStore:v3];

    [(MSDSessionTaskManager *)v2 setSharedStoreLock:0];
    v4 = v2;
  }

  return v2;
}

- (id)getSessionTask:(id)a3
{
  p_sharedStoreLock = &self->_sharedStoreLock;
  id v5 = a3;
  os_unfair_lock_lock(p_sharedStoreLock);
  objc_super v6 = [(MSDSessionTaskManager *)self sharedStore];
  v7 = [v6 objectForKey:v5];

  os_unfair_lock_unlock(p_sharedStoreLock);

  return v7;
}

- (void)addSessionTask:(id)a3
{
  p_sharedStoreLock = &self->_sharedStoreLock;
  id v5 = a3;
  os_unfair_lock_lock(p_sharedStoreLock);
  objc_super v6 = [(MSDSessionTaskManager *)self sharedStore];
  v7 = [v5 task];
  [v6 setObject:v5 forKey:v7];

  os_unfair_lock_unlock(p_sharedStoreLock);
}

- (void)removeSessionTask:(id)a3
{
  p_sharedStoreLock = &self->_sharedStoreLock;
  id v5 = a3;
  os_unfair_lock_lock(p_sharedStoreLock);
  objc_super v6 = [(MSDSessionTaskManager *)self sharedStore];
  v7 = [v5 task];

  [v6 removeObjectForKey:v7];

  os_unfair_lock_unlock(p_sharedStoreLock);
}

- (void)cancelAndRemoveAllSessionTask
{
  p_sharedStoreLock = &self->_sharedStoreLock;
  os_unfair_lock_lock(&self->_sharedStoreLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(MSDSessionTaskManager *)self sharedStore];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        v10 = [(MSDSessionTaskManager *)self sharedStore];
        v11 = [v10 objectForKey:v9];

        if (![v11 state])
        {
          v12 = [v11 task];
          [v12 cancel];
        }
        v13 = [(MSDSessionTaskManager *)self sharedStore];
        [v13 removeObjectForKey:v9];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_sharedStoreLock);
}

- (id)getTaskInState:(int)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  os_unfair_lock_lock(&self->_sharedStoreLock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(MSDSessionTaskManager *)self sharedStore];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [(MSDSessionTaskManager *)self sharedStore];
        v13 = [v12 objectForKey:v11];

        if ([v13 state] == a3) {
          [v5 addObject:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_sharedStoreLock);

  return v5;
}

- (NSMapTable)sharedStore
{
  return (NSMapTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharedStore:(id)a3
{
}

- (os_unfair_lock_s)sharedStoreLock
{
  return self->_sharedStoreLock;
}

- (void)setSharedStoreLock:(os_unfair_lock_s)a3
{
  self->_sharedStoreLock = a3;
}

- (void).cxx_destruct
{
}

@end