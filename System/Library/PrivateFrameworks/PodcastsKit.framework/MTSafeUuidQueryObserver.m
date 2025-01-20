@interface MTSafeUuidQueryObserver
- (MTSafeUuidQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4;
- (id)addResultsChangedHandler:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerWillChangeContent:(id)a3;
- (void)notifyObservers;
- (void)startObserving;
@end

@implementation MTSafeUuidQueryObserver

- (MTSafeUuidQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (NSMutableSet *)objc_opt_new();
  currentItems = self->currentItems;
  self->currentItems = v8;

  v12.receiver = self;
  v12.super_class = (Class)MTSafeUuidQueryObserver;
  v10 = [(MTBaseQueryObserver *)&v12 initWithFetchRequest:v7 managedObjectContext:v6];

  return v10;
}

- (id)addResultsChangedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  v7.receiver = self;
  v7.super_class = (Class)MTSafeUuidQueryObserver;
  v5 = [(MTBaseQueryObserver *)&v7 addResultsChangedHandler:v4];

  return v5;
}

- (void)startObserving
{
  v4.receiver = self;
  v4.super_class = (Class)MTSafeUuidQueryObserver;
  [(MTBaseQueryObserver *)&v4 startObserving];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__MTSafeUuidQueryObserver_startObserving__block_invoke;
  v3[3] = &unk_265055720;
  v3[4] = self;
  [(MTBaseQueryObserver *)self results:v3];
}

uint64_t __41__MTSafeUuidQueryObserver_startObserving__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263EFF9C0];
  objc_super v4 = [a2 valueForKey:@"uuid"];
  uint64_t v5 = [v3 setWithArray:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  objc_super v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 56);
  *(void *)(v9 + 56) = v8;

  uint64_t v11 = objc_opt_new();
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  *(void *)(v12 + 64) = v11;

  v14 = *(void **)(a1 + 32);
  return [v14 notifyObservers];
}

- (void)notifyObservers
{
  v3 = (void *)[(NSMutableSet *)self->currentItems mutableCopy];
  [v3 intersectSet:self->currentInserts];
  [(NSMutableSet *)self->currentInserts minusSet:v3];
  [(NSMutableSet *)self->currentUpdates unionSet:v3];
  [(NSMutableSet *)self->currentDeletes intersectSet:self->currentItems];
  [(NSMutableSet *)self->currentUpdates intersectSet:self->currentItems];
  [(NSMutableSet *)self->currentItems unionSet:self->currentInserts];
  [(NSMutableSet *)self->currentItems minusSet:self->currentDeletes];
  objc_super v4 = (void *)[(NSMutableSet *)self->currentInserts copy];
  uint64_t v5 = (void *)[(NSMutableSet *)self->currentDeletes copy];
  uint64_t v6 = (void *)[(NSMutableSet *)self->currentUpdates copy];
  currentInserts = self->currentInserts;
  self->currentInserts = 0;

  currentDeletes = self->currentDeletes;
  self->currentDeletes = 0;

  currentUpdates = self->currentUpdates;
  self->currentUpdates = 0;

  if ([v6 count] || objc_msgSend(v4, "count") || objc_msgSend(v5, "count"))
  {
    v10 = [(MTBaseQueryObserver *)self handlers];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__MTSafeUuidQueryObserver_notifyObservers__block_invoke;
    v11[3] = &unk_265055748;
    id v12 = v5;
    id v13 = v4;
    id v14 = v6;
    [v10 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

void __42__MTSafeUuidQueryObserver_notifyObservers__block_invoke(void *a1, int a2, void *aBlock)
{
  id v4 = _Block_copy(aBlock);
  (*((void (**)(id, void, void, void))v4 + 2))(v4, a1[4], a1[5], a1[6]);
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = (NSMutableSet *)objc_opt_new();
  currentInserts = self->currentInserts;
  self->currentInserts = v4;

  uint64_t v6 = (NSMutableSet *)objc_opt_new();
  currentDeletes = self->currentDeletes;
  self->currentDeletes = v6;

  self->currentUpdates = (NSMutableSet *)objc_opt_new();
  MEMORY[0x270F9A758]();
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v9 = a4;
  v10 = [v9 valueForKey:@"uuid"];
  if (v10)
  {
    if (a6 == 2)
    {
      uint64_t v11 = 56;
    }
    else if (a6 == 1)
    {
      uint64_t v11 = 48;
    }
    else
    {
      uint64_t v11 = 64;
    }
    [*(id *)((char *)&self->super.super.isa + v11) addObject:v10];
  }
  else
  {
    id v12 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_23F08F000, v12, OS_LOG_TYPE_DEFAULT, "MTSafeUUIDQueryObserver has no UUID for object %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->currentItems, 0);
  objc_storeStrong((id *)&self->currentUpdates, 0);
  objc_storeStrong((id *)&self->currentDeletes, 0);
  objc_storeStrong((id *)&self->currentInserts, 0);
}

@end