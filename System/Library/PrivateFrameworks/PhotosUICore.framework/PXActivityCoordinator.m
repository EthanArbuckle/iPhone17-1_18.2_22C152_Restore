@interface PXActivityCoordinator
+ (id)coordinatorForActivity:(id)a3;
- (PXActivityCoordinator)init;
- (PXActivityCoordinator)initWithActivityName:(id)a3;
- (id)description;
- (void)_update;
- (void)registerItem:(id)a3;
- (void)unregisterItem:(id)a3;
@end

@implementation PXActivityCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityName, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ %p: %@>", v5, self, self->_activityName];

  return v6;
}

- (void)_update
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  records = self->_records;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __32__PXActivityCoordinator__update__block_invoke;
  v10 = &unk_1E5DCCF80;
  v13 = &v15;
  id v6 = v4;
  SEL v14 = a2;
  id v11 = v6;
  v12 = self;
  [(NSMutableArray *)records enumerateObjectsUsingBlock:&v7];
  if (v16[3] >= 1) {
    -[NSMutableArray removeObjectsAtIndexes:](self->_records, "removeObjectsAtIndexes:", v6, v7, v8, v9, v10);
  }

  _Block_object_dispose(&v15, 8);
}

void __32__PXActivityCoordinator__update__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 item];

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v8 = *(void *)(v7 + 24);
  if (v6)
  {
    if (v8 > a3) {
      PXAssertGetLog();
    }
    uint64_t v9 = a3 - v8;
    v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      v12 = [v5 item];
      int v14 = 138543874;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      __int16 v18 = 2048;
      uint64_t v19 = v9;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ updating item %{public}@ with queue position %ld", (uint8_t *)&v14, 0x20u);
    }
    v13 = [v5 item];
    [v13 setActivityCoordinatorQueuePosition:v9];
  }
  else
  {
    *(void *)(v7 + 24) = v8 + 1;
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

- (void)unregisterItem:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[PXActivityCoordinatorRecord alloc] initWithItem:v4];
  uint64_t v6 = [(NSMutableArray *)self->_records indexOfObject:v5];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    unint64_t v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ unregistering item %{public}@", (uint8_t *)&v9, 0x16u);
    }

    [(NSMutableArray *)self->_records removeObjectAtIndex:v7];
    [(PXActivityCoordinator *)self _update];
  }
}

- (void)registerItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[PXActivityCoordinatorRecord alloc] initWithItem:v4];
  records = self->_records;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__PXActivityCoordinator_registerItem___block_invoke;
  v9[3] = &unk_1E5DCCF58;
  uint64_t v7 = v5;
  v10 = v7;
  if ([(NSMutableArray *)records indexOfObjectPassingTest:v9] == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = self;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ registering item %{public}@", buf, 0x16u);
    }

    [(NSMutableArray *)self->_records addObject:v7];
    [(PXActivityCoordinator *)self _update];
  }
}

uint64_t __38__PXActivityCoordinator_registerItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (PXActivityCoordinator)initWithActivityName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXActivityCoordinator;
  id v5 = [(PXActivityCoordinator *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    activityName = v5->_activityName;
    v5->_activityName = (NSString *)v6;

    unint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    records = v5->_records;
    v5->_records = v8;
  }
  return v5;
}

- (PXActivityCoordinator)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXActivityCoordinator.m", 42, @"%s is not available as initializer", "-[PXActivityCoordinator init]");

  abort();
}

+ (id)coordinatorForActivity:(id)a3
{
  id v3 = a3;
  if (coordinatorForActivity__onceToken != -1) {
    dispatch_once(&coordinatorForActivity__onceToken, &__block_literal_global_258250);
  }
  id v4 = [(id)coordinatorForActivity__coordinators objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = [[PXActivityCoordinator alloc] initWithActivityName:v3];
    [(id)coordinatorForActivity__coordinators setObject:v4 forKeyedSubscript:v3];
  }

  return v4;
}

void __48__PXActivityCoordinator_coordinatorForActivity___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)coordinatorForActivity__coordinators;
  coordinatorForActivity__coordinators = (uint64_t)v0;
}

@end