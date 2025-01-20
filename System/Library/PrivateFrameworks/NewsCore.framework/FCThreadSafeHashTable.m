@interface FCThreadSafeHashTable
+ (FCThreadSafeHashTable)hashTableWithOptions:(unint64_t)a3;
- (BOOL)containsObject:(id)a3;
- (FCThreadSafeHashTable)init;
- (FCThreadSafeHashTable)initWithOptions:(unint64_t)a3 capacity:(unint64_t)a4;
- (NSArray)allObjects;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
@end

@implementation FCThreadSafeHashTable

+ (FCThreadSafeHashTable)hashTableWithOptions:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithOptions:a3 capacity:0];
  return (FCThreadSafeHashTable *)v3;
}

- (FCThreadSafeHashTable)initWithOptions:(unint64_t)a3 capacity:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)FCThreadSafeHashTable;
  v6 = [(FCThreadSafeHashTable *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    lock = v6->_lock;
    v6->_lock = (NFUnfairLock *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:a3 capacity:a4];
    hashTable = v6->_hashTable;
    v6->_hashTable = (NSHashTable *)v9;
  }
  return v6;
}

- (FCThreadSafeHashTable)init
{
  return [(FCThreadSafeHashTable *)self initWithOptions:0 capacity:0];
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__FCThreadSafeHashTable_count__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__FCThreadSafeHashTable_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__FCThreadSafeHashTable_addObject___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __35__FCThreadSafeHashTable_addObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__FCThreadSafeHashTable_removeObject___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __38__FCThreadSafeHashTable_removeObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)removeAllObjects
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__FCThreadSafeHashTable_removeAllObjects__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(NFUnfairLock *)lock performWithLockSync:v3];
}

uint64_t __41__FCThreadSafeHashTable_removeAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (NSArray)allObjects
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__87;
  v10 = __Block_byref_object_dispose__87;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__FCThreadSafeHashTable_allObjects__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __35__FCThreadSafeHashTable_allObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__FCThreadSafeHashTable_containsObject___block_invoke;
  v8[3] = &unk_1E5B4C230;
  v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(NFUnfairLock *)lock performWithLockSync:v8];
  LOBYTE(lock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

uint64_t __40__FCThreadSafeHashTable_containsObject___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashTable, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end