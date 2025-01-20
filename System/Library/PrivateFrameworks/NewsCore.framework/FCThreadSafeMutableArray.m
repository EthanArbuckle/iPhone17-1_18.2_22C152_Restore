@interface FCThreadSafeMutableArray
- (FCThreadSafeMutableArray)init;
- (NSArray)readOnlyArray;
- (id)firstObject;
- (id)firstObjectPassingTest:(id)a3;
- (id)lastObject;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)readWriteWithAccessor:(id)a3;
- (void)removeAllObjects;
- (void)removeFirstObject;
@end

@implementation FCThreadSafeMutableArray

uint64_t __38__FCThreadSafeMutableArray_addObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

uint64_t __50__FCThreadSafeMutableArray_readWriteWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 16));
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

uint64_t __41__FCThreadSafeMutableArray_readOnlyArray__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __39__FCThreadSafeMutableArray_firstObject__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) firstObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (FCThreadSafeMutableArray)init
{
  v8.receiver = self;
  v8.super_class = (Class)FCThreadSafeMutableArray;
  uint64_t v2 = [(FCThreadSafeMutableArray *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (NFUnfairLock *)objc_alloc_init(MEMORY[0x1E4F81C18]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    array = v2->_array;
    v2->_array = v5;
  }
  return v2;
}

uint64_t __48__FCThreadSafeMutableArray_addObjectsFromArray___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObjectsFromArray:*(void *)(a1 + 40)];
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__FCThreadSafeMutableArray_addObject___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

- (NSArray)readOnlyArray
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
  v5[2] = __41__FCThreadSafeMutableArray_readOnlyArray__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)readWriteWithAccessor:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__FCThreadSafeMutableArray_readWriteWithAccessor___block_invoke;
  v7[3] = &unk_1E5B4C7C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

- (id)firstObject
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
  v5[2] = __39__FCThreadSafeMutableArray_firstObject__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addObjectsFromArray:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__FCThreadSafeMutableArray_addObjectsFromArray___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

- (void)removeFirstObject
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__FCThreadSafeMutableArray_removeFirstObject__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(NFUnfairLock *)lock performWithLockSync:v3];
}

uint64_t __45__FCThreadSafeMutableArray_removeFirstObject__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "fc_removeFirstObject");
}

- (void)removeAllObjects
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__FCThreadSafeMutableArray_removeAllObjects__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(NFUnfairLock *)lock performWithLockSync:v3];
}

uint64_t __44__FCThreadSafeMutableArray_removeAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FCThreadSafeMutableArray_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E5B4CC80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __55__FCThreadSafeMutableArray_enumerateObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) enumerateObjectsUsingBlock:*(void *)(a1 + 40)];
}

- (id)lastObject
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
  v5[2] = __38__FCThreadSafeMutableArray_lastObject__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __38__FCThreadSafeMutableArray_lastObject__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) lastObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)firstObjectPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__87;
  v16 = __Block_byref_object_dispose__87;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__FCThreadSafeMutableArray_firstObjectPassingTest___block_invoke;
  v9[3] = &unk_1E5B567E8;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(NFUnfairLock *)lock performWithLockSync:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __51__FCThreadSafeMutableArray_firstObjectPassingTest___block_invoke(void *a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 16), "fc_firstObjectPassingTest:", a1[5]);
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

@end