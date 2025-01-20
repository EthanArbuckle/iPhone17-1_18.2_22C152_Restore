@interface PCUserDefaultsBroadcaster
+ (id)sharedInstance;
- (BOOL)hasObserversOfUserDefault:(id)a3;
- (BOOL)isWeakReferenceHashTableEmpty:(id)a3;
- (PCUserDefaultsBroadcaster)init;
- (id)observersForUserDefault:(id)a3;
- (void)addObserver:(id)a3 ofUserDefaults:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3 forUserDefault:(id)a4 fromObservers:(id)a5;
- (void)removeObserver:(id)a3 ofUserDefaults:(id)a4;
- (void)removeObserversForUserDefault:(id)a3;
@end

@implementation PCUserDefaultsBroadcaster

+ (id)sharedInstance
{
  if (sharedInstance_predicate != -1) {
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_53);
  }
  return (id)sharedInstance_sharedInstance;
}

PCUserDefaultsBroadcaster *__43__PCUserDefaultsBroadcaster_sharedInstance__block_invoke()
{
  result = objc_alloc_init(PCUserDefaultsBroadcaster);
  sharedInstance_sharedInstance = (uint64_t)result;
  return result;
}

- (PCUserDefaultsBroadcaster)init
{
  v4.receiver = self;
  v4.super_class = (Class)PCUserDefaultsBroadcaster;
  v2 = [(PCUserDefaultsBroadcaster *)&v4 init];
  if (v2) {
    v2->_userDefaultsBroadcasted = (NSMutableDictionary *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PCUserDefaultsBroadcaster;
  [(PCUserDefaultsBroadcaster *)&v3 dealloc];
}

- (void)addObserver:(id)a3 ofUserDefaults:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a4);
        }
        objc_msgSend(-[PCUserDefaultsBroadcaster observersForUserDefault:](self, "observersForUserDefault:", *(void *)(*((void *)&v10 + 1) + 8 * v9++)), "addObject:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [a4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  objc_sync_exit(self);
}

- (void)removeObserver:(id)a3 ofUserDefaults:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a4);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = [(NSMutableDictionary *)self->_userDefaultsBroadcasted objectForKey:v10];
        if (v11) {
          [(PCUserDefaultsBroadcaster *)self removeObserver:a3 forUserDefault:v10 fromObservers:v11];
        }
      }
      uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  objc_sync_exit(self);
}

- (BOOL)hasObserversOfUserDefault:(id)a3
{
  return ![(PCUserDefaultsBroadcaster *)self isWeakReferenceHashTableEmpty:[(NSMutableDictionary *)self->_userDefaultsBroadcasted objectForKey:a3]];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  uint64_t v8 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_userDefaultsBroadcasted, "objectForKey:", a3), "copy");
  objc_sync_exit(self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) userDefaultDidChange:a3];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)observersForUserDefault:(id)a3
{
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_userDefaultsBroadcasted, "objectForKey:");
  if (!v5)
  {
    v5 = (void *)[MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMutableDictionary *)self->_userDefaultsBroadcasted setObject:v5 forKey:a3];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "addObserver:forKeyPath:options:context:", self, a3, 0, 0);
  }
  return v5;
}

- (void)removeObserver:(id)a3 forUserDefault:(id)a4 fromObservers:(id)a5
{
  [a5 removeObject:a3];
  if ([(PCUserDefaultsBroadcaster *)self isWeakReferenceHashTableEmpty:a5])
  {
    [(PCUserDefaultsBroadcaster *)self removeObserversForUserDefault:a4];
  }
}

- (BOOL)isWeakReferenceHashTableEmpty:(id)a3
{
  if (!a3) {
    return 1;
  }
  if ([a3 count]) {
    return objc_msgSend((id)objc_msgSend(a3, "objectEnumerator"), "nextObject") == 0;
  }
  return 1;
}

- (void)removeObserversForUserDefault:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "removeObserver:forKeyPath:", self, a3);
  userDefaultsBroadcasted = self->_userDefaultsBroadcasted;

  [(NSMutableDictionary *)userDefaultsBroadcasted removeObjectForKey:a3];
}

@end