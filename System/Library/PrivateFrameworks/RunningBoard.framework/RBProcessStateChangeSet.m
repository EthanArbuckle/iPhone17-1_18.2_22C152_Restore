@interface RBProcessStateChangeSet
- (BOOL)hasChanges;
- (RBProcessStateChangeSet)initWithChanges:(id)a3;
- (RBProcessStateChangeSet)initWithOriginalStatesByIdentity:(id)a3 updatedStatesByIdentity:(id)a4;
- (id)processIdentities;
- (id)processStateChangeForIdentity:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_diffOriginalStatesByIdentity:(void *)a3 withUpdatedStatesByIdentity:;
- (void)applyChanges:(id)a3;
@end

@implementation RBProcessStateChangeSet

- (id)processIdentities
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(NSMutableDictionary *)self->_stateChangesByIdentity allKeys];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (void).cxx_destruct
{
}

- (id)processStateChangeForIdentity:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_stateChangesByIdentity objectForKeyedSubscript:a3];
}

- (BOOL)hasChanges
{
  return [(NSMutableDictionary *)self->_stateChangesByIdentity count] != 0;
}

- (RBProcessStateChangeSet)initWithChanges:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RBProcessStateChangeSet;
  v5 = [(RBProcessStateChangeSet *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    stateChangesByIdentity = v5->_stateChangesByIdentity;
    v5->_stateChangesByIdentity = (NSMutableDictionary *)v6;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v14 = v5->_stateChangesByIdentity;
          v15 = objc_msgSend(v13, "identity", (void)v17);
          [(NSMutableDictionary *)v14 setObject:v13 forKey:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }
  }
  return v5;
}

- (void)applyChanges:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        stateChangesByIdentity = self->_stateChangesByIdentity;
        uint64_t v11 = [v9 identity];
        v12 = [(NSMutableDictionary *)stateChangesByIdentity objectForKey:v11];

        if (v12)
        {
          v13 = [v12 changeByApplyingChange:v9];
          v14 = self->_stateChangesByIdentity;
          v15 = [v9 identity];
          if (v13) {
            [(NSMutableDictionary *)v14 setObject:v13 forKey:v15];
          }
          else {
            [(NSMutableDictionary *)v14 removeObjectForKey:v15];
          }
        }
        else
        {
          v16 = self->_stateChangesByIdentity;
          v13 = [v9 identity];
          [(NSMutableDictionary *)v16 setObject:v9 forKey:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = [(NSMutableDictionary *)self->_stateChangesByIdentity allValues];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (RBProcessStateChangeSet)initWithOriginalStatesByIdentity:(id)a3 updatedStatesByIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RBProcessStateChangeSet;
  id v8 = [(RBProcessStateChangeSet *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    stateChangesByIdentity = v8->_stateChangesByIdentity;
    v8->_stateChangesByIdentity = (NSMutableDictionary *)v9;

    -[RBProcessStateChangeSet _diffOriginalStatesByIdentity:withUpdatedStatesByIdentity:]((uint64_t)v8, v6, v7);
  }

  return v8;
}

- (void)_diffOriginalStatesByIdentity:(void *)a3 withUpdatedStatesByIdentity:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = (void *)[a3 mutableCopy];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke;
    v11[3] = &unk_2647C8630;
    id v12 = v6;
    uint64_t v13 = a1;
    id v7 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke_2;
    v8[3] = &unk_2647C8630;
    id v9 = v5;
    uint64_t v10 = a1;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  [*(id *)(a1 + 32) removeObjectForKey:v8];
  if (!v6 || ([v6 isEqual:v5] & 1) == 0)
  {
    id v7 = [[RBProcessStateChange alloc] initWithIdentity:v8 originalState:v5 updatedState:v6];
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v7 forKeyedSubscript:v8];
  }
}

void __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (!v6)
  {
    id v7 = [[RBProcessStateChange alloc] initWithIdentity:v8 originalState:0 updatedState:v5];
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v7 forKeyedSubscript:v8];
  }
}

@end