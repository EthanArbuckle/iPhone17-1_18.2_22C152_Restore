@interface REObserverStore
- (NSArray)allObservers;
- (REObserverStore)init;
- (REObserverStore)initWithFunctionsOptions:(unint64_t)a3;
- (unint64_t)count;
- (void)addObserver:(id)a3;
- (void)enumerateObserversWithBlock:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation REObserverStore

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (REObserverStore)init
{
  return [(REObserverStore *)self initWithFunctionsOptions:517];
}

- (REObserverStore)initWithFunctionsOptions:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)REObserverStore;
  v4 = [(REObserverStore *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    uint64_t v6 = [MEMORY[0x263F088B0] hashTableWithOptions:a3];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;
  }
  return v5;
}

- (NSArray)allObservers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSHashTable *)self->_observers count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)enumerateObserversWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v4 = (void (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    char v16 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(REObserverStore *)self allObservers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x223C31460]();
        v4[2](v4, v10, &v16);
        if (v16) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end