@interface ISUniqueOperationManager
+ (id)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (ISUniqueOperationManager)init;
- (id)_activeContext;
- (id)_contextForOperation:(id)a3;
- (id)lockWithIdentifier:(id)a3;
- (id)predecessorForKey:(id)a3 operation:(id)a4;
- (void)checkInOperation:(id)a3;
- (void)checkOutOperation:(id)a3;
- (void)dealloc;
- (void)setPredecessorIfNeeded:(id)a3 forKey:(id)a4;
- (void)uniqueOperationFinished:(id)a3 forKey:(id)a4;
@end

@implementation ISUniqueOperationManager

- (ISUniqueOperationManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)ISUniqueOperationManager;
  v2 = [(ISUniqueOperationManager *)&v4 init];
  if (v2)
  {
    v2->_contexts = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISUniqueOperationManager;
  [(ISUniqueOperationManager *)&v3 dealloc];
}

+ (void)setSharedInstance:(id)a3
{
  pthread_mutex_lock(&__SharedInstanceLock_0);
  if ((id)__SharedInstance_0 != a3)
  {

    __SharedInstance_0 = (uint64_t)a3;
  }

  pthread_mutex_unlock(&__SharedInstanceLock_0);
}

+ (id)sharedInstance
{
  pthread_mutex_lock(&__SharedInstanceLock_0);
  id v3 = (id)__SharedInstance_0;
  if (!__SharedInstance_0)
  {
    id v3 = objc_alloc_init((Class)a1);
    __SharedInstance_0 = (uint64_t)v3;
  }
  id v4 = v3;
  pthread_mutex_unlock(&__SharedInstanceLock_0);
  return v4;
}

- (void)checkInOperation:(id)a3
{
  [(NSLock *)self->_lock lock];
  objc_msgSend(-[ISUniqueOperationManager _activeContext](self, "_activeContext"), "addOperation:", a3);
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)checkOutOperation:(id)a3
{
  [(NSLock *)self->_lock lock];
  v5 = [(ISUniqueOperationManager *)self _contextForOperation:a3];
  if (v5)
  {
    v6 = v5;
    [(ISUniqueOperationContext *)v5 removeOperation:a3];
    if (![(ISUniqueOperationContext *)v6 countOfOperations])
    {
      if (self->_activeContext == v6)
      {

        self->_activeContext = 0;
      }
      [(NSMutableArray *)self->_contexts removeObject:v6];
    }
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (id)lockWithIdentifier:(id)a3
{
  [(NSLock *)self->_lock lock];
  lockPool = self->_lockPool;
  if (!lockPool)
  {
    lockPool = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_lockPool = lockPool;
  }
  id v6 = (id)[(NSMutableDictionary *)lockPool objectForKey:a3];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08958]);
    [v6 setName:a3];
    [(NSMutableDictionary *)self->_lockPool setObject:v6 forKey:a3];
    id v7 = v6;
  }
  [(NSLock *)self->_lock unlock];
  return v6;
}

- (id)predecessorForKey:(id)a3 operation:(id)a4
{
  [(NSLock *)self->_lock lock];
  id v7 = (id)objc_msgSend(-[ISUniqueOperationManager _contextForOperation:](self, "_contextForOperation:", a4), "uniqueOperationForKey:", a3);
  [(NSLock *)self->_lock unlock];
  return v7;
}

- (void)setPredecessorIfNeeded:(id)a3 forKey:(id)a4
{
  [(NSLock *)self->_lock lock];
  id v7 = [(ISUniqueOperationManager *)self _contextForOperation:a3];
  if (![v7 uniqueOperationForKey:a4]) {
    [v7 setUniqueOperation:a3 forKey:a4];
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)uniqueOperationFinished:(id)a3 forKey:(id)a4
{
  [(NSLock *)self->_lock lock];
  id v7 = [(ISUniqueOperationManager *)self _contextForOperation:a3];
  if ((id)[v7 uniqueOperationForKey:a4] == a3) {
    [v7 setUniqueOperation:0 forKey:a4];
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (id)_activeContext
{
  id result = self->_activeContext;
  if (!result)
  {
    id v4 = objc_alloc_init(ISUniqueOperationContext);
    self->_activeContext = v4;
    [(NSMutableArray *)self->_contexts addObject:v4];
    return self->_activeContext;
  }
  return result;
}

- (id)_contextForOperation:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  contexts = self->_contexts;
  uint64_t v5 = [(NSMutableArray *)contexts countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(contexts);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 containsOperation:a3]) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)contexts countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

@end