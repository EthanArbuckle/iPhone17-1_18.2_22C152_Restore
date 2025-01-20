@interface NPKObserverManager
- (BOOL)_hasObservers;
- (NPKObserverManager)init;
- (void)_enumerateObserversTablesCopy:(BOOL)a3 withBlock:(id)a4;
- (void)_enumerateObserversUsingBlock:(id)a3;
- (void)_registerObserver:(id)a3;
- (void)_registerObserver:(id)a3 withRelativePriority:(unint64_t)a4;
- (void)_unregisterObserver:(id)a3;
@end

@implementation NPKObserverManager

- (NPKObserverManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NPKObserverManager;
  v2 = [(NPKObserverManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    priorityIndexSet = v2->_priorityIndexSet;
    v2->_priorityIndexSet = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    observersTables = v2->_observersTables;
    v2->_observersTables = v5;
  }
  return v2;
}

- (void)_registerObserver:(id)a3 withRelativePriority:(unint64_t)a4
{
  id v6 = a3;
  [(NPKObserverManager *)self _unregisterObserver:v6];
  if ([(NSMutableIndexSet *)self->_priorityIndexSet containsIndex:a4])
  {
    observersTables = self->_observersTables;
    objc_super v8 = [NSNumber numberWithUnsignedInteger:a4];
    id v11 = [(NSMutableDictionary *)observersTables objectForKeyedSubscript:v8];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F088B0], "pk_weakObjectsHashTableUsingPointerPersonality");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = self->_observersTables;
    v10 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v9 setObject:v11 forKeyedSubscript:v10];

    [(NSMutableIndexSet *)self->_priorityIndexSet addIndex:a4];
  }
  [v11 addObject:v6];
}

- (void)_registerObserver:(id)a3
{
}

- (void)_unregisterObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__NPKObserverManager__unregisterObserver___block_invoke;
  v6[3] = &unk_2644D4B28;
  id v7 = v4;
  id v5 = v4;
  [(NPKObserverManager *)self _enumerateObserversTablesCopy:0 withBlock:v6];
}

void __42__NPKObserverManager__unregisterObserver___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  *a3 = [v6 containsObject:v5];
  [v6 removeObject:*(void *)(a1 + 32)];
}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__NPKObserverManager__enumerateObserversUsingBlock___block_invoke;
  v6[3] = &unk_2644D4B50;
  id v7 = v4;
  id v5 = v4;
  [(NPKObserverManager *)self _enumerateObserversTablesCopy:1 withBlock:v6];
}

void __52__NPKObserverManager__enumerateObserversUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)_hasObservers
{
  return [(NSMutableDictionary *)self->_observersTables count] != 0;
}

- (void)_enumerateObserversTablesCopy:(BOOL)a3 withBlock:(id)a4
{
  id v6 = a4;
  priorityIndexSet = self->_priorityIndexSet;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__NPKObserverManager__enumerateObserversTablesCopy_withBlock___block_invoke;
  v9[3] = &unk_2644D4B78;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(NSMutableIndexSet *)priorityIndexSet enumerateIndexesWithOptions:2 usingBlock:v9];
}

void __62__NPKObserverManager__enumerateObserversTablesCopy_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v7 = [v3 objectForKeyedSubscript:v4];

  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v5 = [v7 copy];

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersTables, 0);
  objc_storeStrong((id *)&self->_priorityIndexSet, 0);
}

@end