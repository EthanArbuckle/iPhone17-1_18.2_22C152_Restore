@interface PXGEntityManager
- ($738B17BD11CC339B30296C0EA03CEC2B)createEntity;
- (BOOL)_hasObserversForComponent:(id)a3;
- (OS_dispatch_queue)queue;
- (PXGEffectComponent)effectComponent;
- (PXGEntityManager)init;
- (PXGEntityManager)initWithQueue:(id)a3;
- (PXGLoadingStatusComponent)loadingStatus;
- (id)componentForClass:(Class)a3;
- (id)componentsForComponentClasses:(id)a3;
- (id)description;
- (int64_t)capacity;
- (void)_configureComponent:(id)a3;
- (void)_notifyChangesForComponent:(id)a3;
- (void)cleanupUnusedObjects;
- (void)componentDidPerformChanges:(id)a3;
- (void)componentWillPerformChanges:(id)a3;
- (void)createEntitiesWithCount:(int64_t)a3 addingToArray:(id *)a4;
- (void)destroyEntities:(id *)a3 count:(int64_t)a4;
- (void)destroyEntity:(id)a3;
- (void)registerObserver:(id)a3 forComponents:(id)a4;
- (void)setCapacity:(int64_t)a3;
@end

@implementation PXGEntityManager

- (void)_configureComponent:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXGEntityManager *)self capacity];
  v6 = [v4 dataStore];
  [v6 setCapacity:v5];

  int64_t v7 = [(PXGEntityManager *)self capacity];
  id v8 = [v4 previousDataStore];

  [v8 setCapacity:v7];
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (void)componentDidPerformChanges:(id)a3
{
  id v10 = a3;
  --self->_componentsPerformingChangesCount;
  BOOL v4 = [(PXGEntityManager *)self _hasObserversForComponent:v10];
  int64_t v5 = [v10 previousDataStore];
  v6 = [v10 dataStore];
  if (v4)
  {
    char v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      id v8 = [v10 previousDataStore];
      v9 = [v10 dataStore];
      [v8 setContentsFrom:v9];

      [(PXGEntityManager *)self _notifyChangesForComponent:v10];
    }
  }
  else
  {
    [v5 setContentsFrom:v6];
  }
}

- (BOOL)_hasObserversForComponent:(id)a3
{
  v3 = [(NSMapTable *)self->_observersByComponent objectForKey:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)componentForClass:(Class)a3
{
  int64_t v5 = -[NSMapTable objectForKey:](self->_componentByClass, "objectForKey:");
  if (!v5)
  {
    int64_t v5 = [(objc_class *)a3 createWithDefaultDataStore];
    [v5 setObserver:self];
    [(PXGEntityManager *)self _configureComponent:v5];
    [(NSMapTable *)self->_componentByClass setObject:v5 forKey:a3];
    [(NSMutableArray *)self->_components addObject:v5];
  }

  return v5;
}

- (void)createEntitiesWithCount:(int64_t)a3 addingToArray:(id *)a4
{
  if (self->_componentsPerformingChangesCount)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXGEntityManager.m", 77, @"Creating entity while changing components, this is not supported." object file lineNumber description];
  }
  uint64_t v7 = [(NSMutableIndexSet *)self->_reusableEntityIDs count];
  [(PXGEntityManager *)self setCapacity:((a3 - v7) & ~((a3 - v7) >> 63)) + [(PXGEntityManager *)self capacity]];
  id v8 = self->_reusableEntityIDs;
  if (a3 >= 1)
  {
    v12 = v8;
    do
    {
      uint64_t v9 = [(NSMutableIndexSet *)v12 firstIndex];
      [(NSMutableIndexSet *)v12 removeIndex:v9];
      id v8 = v12;
      a4->var0 = v9;
      ++a4;
      --a3;
    }
    while (a3);
  }
}

- (void)setCapacity:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int64_t capacity = self->_capacity;
  if (capacity != a3)
  {
    if (capacity >= a3)
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PXGEntityManager.m", 60, @"Invalid parameter not satisfying: %@", @"capacity > _capacity" object file lineNumber description];

      int64_t capacity = self->_capacity;
    }
    self->_int64_t capacity = a3;
    -[NSMutableIndexSet addIndexesInRange:](self->_reusableEntityIDs, "addIndexesInRange:", capacity, a3 - capacity);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = self->_components;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [(PXGEntityManager *)self _configureComponent:*(void *)(*((void *)&v13 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (PXGEffectComponent)effectComponent
{
  uint64_t v3 = objc_opt_class();

  return (PXGEffectComponent *)[(PXGEntityManager *)self componentForClass:v3];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PXGLoadingStatusComponent)loadingStatus
{
  uint64_t v3 = objc_opt_class();

  return (PXGLoadingStatusComponent *)[(PXGEntityManager *)self componentForClass:v3];
}

- (void)componentWillPerformChanges:(id)a3
{
}

- (void)destroyEntities:(id *)a3 count:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a4)
  {
    int64_t v4 = a4;
    if (self->_componentsPerformingChangesCount)
    {
      long long v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"PXGEntityManager.m", 99, @"Destroying entity while changing components, this is not supported." object file lineNumber description];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = self->_components;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11++), "willDestroyEntities:count:", a3, v4, (void)v15);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    if (v4 >= 1)
    {
      do
      {
        unsigned int var0 = a3->var0;
        ++a3;
        -[NSMutableIndexSet addIndex:](self->_reusableEntityIDs, "addIndex:", var0, (void)v15);
        --v4;
      }
      while (v4);
    }
  }
}

- (void)cleanupUnusedObjects
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_components;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cleanupUnusedObjects", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (PXGEntityManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGEntityManager;
  uint64_t v6 = [(PXGEntityManager *)&v17 init];
  long long v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    observersByComponent = v7->_observersByComponent;
    v7->_observersByComponent = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    componentByClass = v7->_componentByClass;
    v7->_componentByClass = (NSMapTable *)v10;

    uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    components = v7->_components;
    v7->_components = v12;

    long long v14 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    reusableEntityIDs = v7->_reusableEntityIDs;
    v7->_reusableEntityIDs = v14;

    [(PXGEntityManager *)v7 setCapacity:2];
    [(NSMutableIndexSet *)v7->_reusableEntityIDs removeIndex:0];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reusableEntityIDs, 0);
  objc_storeStrong((id *)&self->_componentByDataStore, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_componentByClass, 0);

  objc_storeStrong((id *)&self->_observersByComponent, 0);
}

- (void)registerObserver:(id)a3 forComponents:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v13 = [(NSMapTable *)self->_observersByComponent objectForKey:v12];
        if (!v13)
        {
          long long v13 = [MEMORY[0x263F088B0] weakObjectsHashTable];
          [(NSMapTable *)self->_observersByComponent setObject:v13 forKey:v12];
        }
        [v13 addObject:v6];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_notifyChangesForComponent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_observersByComponent objectForKey:v4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) entityManager:self componentDidChange:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)componentsForComponentClasses:(id)a3
{
  uint64_t v3 = PFMap();

  return v3;
}

uint64_t __50__PXGEntityManager_componentsForComponentClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) componentForClass:a2];
}

- (void)destroyEntity:(id)a3
{
  unsigned int var0 = a3.var0;
  [(PXGEntityManager *)self destroyEntities:&var0 count:1];
}

- ($738B17BD11CC339B30296C0EA03CEC2B)createEntity
{
  v3.unsigned int var0 = 0;
  [(PXGEntityManager *)self createEntitiesWithCount:1 addingToArray:&v3];
  return v3;
}

- (id)description
{
  $738B17BD11CC339B30296C0EA03CEC2B v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [(PXGEntityManager *)self capacity];
  uint64_t v7 = [(NSMutableIndexSet *)self->_reusableEntityIDs px_shortDescription];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p, capacity:%ld, reusable:%@>", v5, self, v6, v7];

  return v8;
}

- (PXGEntityManager)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGEntityManager.m", 47, @"%s is not available as initializer", "-[PXGEntityManager init]");

  abort();
}

@end