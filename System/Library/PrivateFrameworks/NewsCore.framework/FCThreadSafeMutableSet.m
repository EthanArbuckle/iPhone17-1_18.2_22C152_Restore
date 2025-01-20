@interface FCThreadSafeMutableSet
- (BOOL)containsObject:(id)a3;
- (BOOL)isEmpty;
- (FCThreadSafeMutableSet)init;
- (NSArray)allObjects;
- (NSSet)readOnlySet;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)readWithAccessor:(id)a3;
- (void)readWriteWithAccessor:(id)a3;
- (void)removeObject:(id)a3;
- (void)removeObjectsInArray:(id)a3;
- (void)removeObjectsInSet:(id)a3;
- (void)unionSet:(id)a3;
@end

@implementation FCThreadSafeMutableSet

uint64_t __35__FCThreadSafeMutableSet_unionSet___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) unionSet:*(void *)(a1 + 40)];
}

- (NSArray)allObjects
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__FCThreadSafeMutableSet_allObjects__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (FCThreadSafeMutableSet)init
{
  v8.receiver = self;
  v8.super_class = (Class)FCThreadSafeMutableSet;
  v2 = [(FCThreadSafeMutableSet *)&v8 init];
  if (v2)
  {
    id v3 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E4F81C18]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    set = v2->_set;
    v2->_set = v5;
  }
  return v2;
}

uint64_t __36__FCThreadSafeMutableSet_allObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSSet)readOnlySet
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__FCThreadSafeMutableSet_readOnlySet__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

uint64_t __37__FCThreadSafeMutableSet_readOnlySet__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)unionSet:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__FCThreadSafeMutableSet_unionSet___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__FCThreadSafeMutableSet_addObject___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __36__FCThreadSafeMutableSet_addObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)addObjectsFromArray:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__FCThreadSafeMutableSet_addObjectsFromArray___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __46__FCThreadSafeMutableSet_addObjectsFromArray___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObjectsFromArray:*(void *)(a1 + 40)];
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__FCThreadSafeMutableSet_removeObject___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __39__FCThreadSafeMutableSet_removeObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)removeObjectsInSet:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__FCThreadSafeMutableSet_removeObjectsInSet___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

void __45__FCThreadSafeMutableSet_removeObjectsInSet___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "removeObject:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)removeObjectsInArray:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__FCThreadSafeMutableSet_removeObjectsInArray___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

void __47__FCThreadSafeMutableSet_removeObjectsInArray___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "removeObject:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__FCThreadSafeMutableSet_containsObject___block_invoke;
  v8[3] = &unk_1E5B4C230;
  long long v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(NFUnfairLock *)lock performWithLockSync:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

uint64_t __41__FCThreadSafeMutableSet_containsObject___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__FCThreadSafeMutableSet_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E5B4CC80;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __53__FCThreadSafeMutableSet_enumerateObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) enumerateObjectsUsingBlock:*(void *)(a1 + 40)];
}

- (void)readWithAccessor:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__FCThreadSafeMutableSet_readWithAccessor___block_invoke;
  v7[3] = &unk_1E5B4C7C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __43__FCThreadSafeMutableSet_readWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 16));
  }
  return result;
}

- (void)readWriteWithAccessor:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__FCThreadSafeMutableSet_readWriteWithAccessor___block_invoke;
  v7[3] = &unk_1E5B4C7C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __48__FCThreadSafeMutableSet_readWriteWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 16));
  }
  return result;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__FCThreadSafeMutableSet_count__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__FCThreadSafeMutableSet_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isEmpty
{
  return [(FCThreadSafeMutableSet *)self count] == 0;
}

@end