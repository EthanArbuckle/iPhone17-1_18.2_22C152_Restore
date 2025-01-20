@interface PXGEffectComponent
+ (unint64_t)elementSize;
- (PXGEffectComponent)initWithDataStore:(id)a3;
- (PXGEffectComponentDelegate)delegate;
- (const)effectIds;
- (id)effectForId:(unsigned int)a3;
- (unsigned)mutableEffectIds;
- (void)cleanupUnusedObjects;
- (void)didUseEffect:(id)a3;
- (void)performChanges:(id)a3;
- (void)registerEffect:(id)a3 withEffectId:(unsigned int)a4;
- (void)setContentsFrom:(id)a3;
- (void)setDelegate:(id)a3;
- (void)unregisterEffectId:(unsigned int)a3;
- (void)willDestroyEntities:(id *)a3 count:(int64_t)a4;
@end

@implementation PXGEffectComponent

- (const)effectIds
{
  id v2 = [(PXGComponent *)self dataStore];
  v3 = (const unsigned int *)[v2 contents];

  return v3;
}

- (void)setContentsFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = (PXGEffectComponent *)a3;
  if (self != v4)
  {
    os_unfair_lock_t p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock = &v4->_lock;
    os_unfair_lock_lock(&v4->_lock);
    v5 = self->_lock_effectById;
    v6 = v4->_lock_effectById;
    [(NSMapTable *)v5 removeAllObjects];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = [(NSMapTable *)v6 keyEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v13 = -[NSMapTable objectForKey:](v6, "objectForKey:", v12, lock, p_lock);
          if (v13) {
            [(NSMapTable *)v5 setObject:v13 forKey:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    v14 = [(PXGComponent *)self mutableDataStore];
    v15 = [(PXGComponent *)v4 dataStore];
    [v14 setContentsFrom:v15];

    [(NSMutableSet *)self->_allEffects setSet:v4->_allEffects];
    os_unfair_lock_unlock(lock);
    os_unfair_lock_unlock(p_lock);
  }
}

- (PXGEffectComponent)initWithDataStore:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXGEffectComponent;
  v3 = [(PXGComponent *)&v10 initWithDataStore:a3];
  v4 = v3;
  if (v3)
  {
    v3->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    lock_effectById = v4->_lock_effectById;
    v4->_lock_effectById = (NSMapTable *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    allEffects = v4->_allEffects;
    v4->_allEffects = v7;
  }
  return v4;
}

+ (unint64_t)elementSize
{
  return 4;
}

uint64_t __42__PXGEffectComponent_cleanupUnusedObjects__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 effectId];

  return [v2 containsIndex:v3];
}

- (void)didUseEffect:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGEffectComponent *)self delegate];
  [v5 effectComponent:self prepareForEffect:v4];
}

- (PXGEffectComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PXGEffectComponentDelegate *)WeakRetained;
}

- (void)registerEffect:(id)a3 withEffectId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  os_unfair_lock_t p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  lock_effectById = self->_lock_effectById;
  uint64_t v9 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMapTable *)lock_effectById setObject:v7 forKey:v9];

  [(NSMutableSet *)self->_allEffects addObject:v7];

  os_unfair_lock_unlock(p_lock);
}

- (id)effectForId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  os_unfair_lock_t p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_effectById = self->_lock_effectById;
  id v7 = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v8 = [(NSMapTable *)lock_effectById objectForKey:v7];

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)willDestroyEntities:(id *)a3 count:(int64_t)a4
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__PXGEffectComponent_willDestroyEntities_count___block_invoke;
  v8[3] = &__block_descriptor_48_e55_v16__0__PXGEffectComponent_PXGMutableEffectComponent__8l;
  v8[4] = a4;
  v8[5] = a3;
  [(PXGEffectComponent *)self performChanges:v8];
  v7.receiver = self;
  v7.super_class = (Class)PXGEffectComponent;
  [(PXGComponent *)&v7 willDestroyEntities:a3 count:a4];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXGEffectComponent;
  [(PXGComponent *)&v3 performChanges:a3];
}

uint64_t __48__PXGEffectComponent_willDestroyEntities_count___block_invoke(uint64_t a1, id a2)
{
  uint64_t result = [a2 mutableEffectIds];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 >= 1)
  {
    id v5 = *(unsigned int **)(a1 + 40);
    do
    {
      unsigned int v6 = *v5++;
      *(_DWORD *)(result + 4 * v6) = 0;
      --v4;
    }
    while (v4);
  }
  return result;
}

- (unsigned)mutableEffectIds
{
  id v2 = [(PXGComponent *)self mutableDataStore];
  objc_super v3 = (unsigned int *)[v2 mutableContents];

  return v3;
}

- (void)cleanupUnusedObjects
{
  v16.receiver = self;
  v16.super_class = (Class)PXGEffectComponent;
  [(PXGComponent *)&v16 cleanupUnusedObjects];
  id v3 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v4 = [(PXGComponent *)self dataStore];
  uint64_t v5 = [v4 capacity];

  unsigned int v6 = self;
  uint64_t v7 = [(PXGEffectComponent *)v6 effectIds];
  if (v5 >= 1)
  {
    uint64_t v8 = (_DWORD *)v7;
    do
    {
      if (*v8++) {
        objc_msgSend(v3, "addIndex:");
      }
      --v5;
    }
    while (v5);
  }
  allEffects = v6->_allEffects;
  v11 = (void *)MEMORY[0x263F08A98];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__PXGEffectComponent_cleanupUnusedObjects__block_invoke;
  v14[3] = &unk_265556488;
  id v15 = v3;
  id v12 = v3;
  v13 = [v11 predicateWithBlock:v14];
  [(NSMutableSet *)allEffects filterUsingPredicate:v13];
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allEffects, 0);

  objc_storeStrong((id *)&self->_lock_effectById, 0);
}

- (void)unregisterEffectId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  os_unfair_lock_t p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_effectById = self->_lock_effectById;
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v3];
  [(NSMapTable *)lock_effectById removeObjectForKey:v7];

  os_unfair_lock_unlock(p_lock);
}

@end