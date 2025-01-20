@interface PLManagedObjectContextList
- (PLManagedObjectContextList)init;
- (id)allContexts;
- (id)allContextsNotIdenticalTo:(id)a3;
- (void)addContext:(id)a3;
@end

@implementation PLManagedObjectContextList

- (PLManagedObjectContextList)init
{
  v8.receiver = self;
  v8.super_class = (Class)PLManagedObjectContextList;
  v2 = [(PLManagedObjectContextList *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    contexts = v3->_contexts;
    v3->_contexts = (NSHashTable *)v4;

    v6 = v3;
  }

  return v3;
}

- (void).cxx_destruct
{
}

- (id)allContexts
{
  v2 = PLResultWithUnfairLock();
  return v2;
}

id __41__PLManagedObjectContextList_allContexts__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  v3 = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  return v3;
}

- (id)allContextsNotIdenticalTo:(id)a3
{
  id v3 = a3;
  [MEMORY[0x1E4F1CA48] array];
  v7 = v3;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  PLRunWithUnfairLock();
  id v5 = v8;

  return v5;
}

void __56__PLManagedObjectContextList_allContextsNotIdenticalTo___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F38D3B0]();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
        if (v8 && v8 != *(void *)(a1 + 40)) {
          [*(id *)(a1 + 48) addObject:(void)v9];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)addContext:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLRunWithUnfairLock();
}

void __41__PLManagedObjectContextList_addContext___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

@end