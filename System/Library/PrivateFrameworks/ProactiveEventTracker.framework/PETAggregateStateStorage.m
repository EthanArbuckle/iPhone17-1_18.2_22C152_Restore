@interface PETAggregateStateStorage
+ (id)storageInMemory;
+ (id)storageOnDisk:(id)a3;
- (void)expand:(unint64_t)a3 andRunWithLock:(id)a4;
- (void)runWithLock:(id)a3;
@end

@implementation PETAggregateStateStorage

- (void)runWithLock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PETAggregateStateStorage.m", 49, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PETAggregateStateStorage_runWithLock___block_invoke;
  v8[3] = &unk_1E56C3EC8;
  id v9 = v5;
  id v6 = v5;
  [(PETAggregateStateStorage *)self expand:0 andRunWithLock:v8];
}

uint64_t __40__PETAggregateStateStorage_runWithLock___block_invoke(uint64_t a1)
{
  return 0;
}

- (void)expand:(unint64_t)a3 andRunWithLock:(id)a4
{
  id v4 = a4;
  __break(1u);
}

+ (id)storageOnDisk:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PETAggregateStateStorage.m", 38, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  id v6 = [[PETAggregateStateStorageOnDisk alloc] initWithPath:v5];

  return v6;
}

+ (id)storageInMemory
{
  v2 = objc_opt_new();

  return v2;
}

@end