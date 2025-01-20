@interface SUUISettingValueStore
- (BOOL)hasChanges;
- (SUUISettingValueStore)init;
- (id)modifiedKeys;
- (id)originalValueForKey:(id)a3;
- (id)resolvedValueForKey:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (void)clearValueForKey:(id)a3;
- (void)commitChanges;
- (void)discardChanges;
- (void)setModifiedValue:(id)a3 forKey:(id)a4;
- (void)setOriginalValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation SUUISettingValueStore

- (SUUISettingValueStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUUISettingValueStore;
  v2 = [(SUUISettingValueStore *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUISettingValueStore", 0);
    mutexQueue = v2->_mutexQueue;
    v2->_mutexQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)clearValueForKey:(id)a3
{
  id v4 = a3;
  mutexQueue = self->_mutexQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SUUISettingValueStore_clearValueForKey___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, v7);
}

void *__42__SUUISettingValueStore_clearValueForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 16);
  if (v3)
  {
    [v3 removeObjectForKey:*(void *)(a1 + 40)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  result = *(void **)(v2 + 24);
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    return (void *)[result removeObjectForKey:v5];
  }
  return result;
}

- (void)commitChanges
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SUUISettingValueStore_commitChanges__block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

void __38__SUUISettingValueStore_commitChanges__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 24);
  if (v3)
  {
    if (!*(void *)(v2 + 16))
    {
      id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v4;

      uint64_t v2 = *(void *)(a1 + 32);
      dispatch_queue_t v3 = *(void **)(v2 + 24);
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__SUUISettingValueStore_commitChanges__block_invoke_2;
    v9[3] = &unk_265407FA0;
    v9[4] = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v9];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = 0;
  }
}

uint64_t __38__SUUISettingValueStore_commitChanges__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:a3 forKey:a2];
}

- (void)discardChanges
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SUUISettingValueStore_discardChanges__block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

void __39__SUUISettingValueStore_discardChanges__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (BOOL)hasChanges
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__SUUISettingValueStore_hasChanges__block_invoke;
  v5[3] = &unk_2654008E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__SUUISettingValueStore_hasChanges__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24) != 0;
  return result;
}

- (id)modifiedKeys
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__86;
  v10 = __Block_byref_object_dispose__86;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SUUISettingValueStore_modifiedKeys__block_invoke;
  v5[3] = &unk_265407FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void *__37__SUUISettingValueStore_modifiedKeys__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 24);
  if (result)
  {
    uint64_t v3 = [result allKeys];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    *(void *)(v4 + 40) = v3;
    return (void *)MEMORY[0x270F9A758](v3, v5);
  }
  return result;
}

- (id)originalValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__86;
  v16 = __Block_byref_object_dispose__86;
  id v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUUISettingValueStore_originalValueForKey___block_invoke;
  block[3] = &unk_265407FF0;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void *__45__SUUISettingValueStore_originalValueForKey___block_invoke(void *a1)
{
  result = *(void **)(a1[4] + 16);
  if (result)
  {
    uint64_t v3 = [result objectForKey:a1[5]];
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    *(void *)(v4 + 40) = v3;
    return (void *)MEMORY[0x270F9A758](v3, v5);
  }
  return result;
}

- (id)resolvedValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__86;
  v16 = __Block_byref_object_dispose__86;
  id v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUUISettingValueStore_resolvedValueForKey___block_invoke;
  block[3] = &unk_265407FF0;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__SUUISettingValueStore_resolvedValueForKey___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 24);
  if (v2)
  {
    uint64_t v3 = [v2 objectForKey:a1[5]];
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v6 = *(void **)(a1[4] + 16);
    if (v6)
    {
      uint64_t v7 = [v6 objectForKey:a1[5]];
      uint64_t v8 = *(void *)(a1[6] + 8);
      uint64_t v9 = *(void *)(v8 + 40);
      *(void *)(v8 + 40) = v7;
      MEMORY[0x270F9A758](v7, v9);
    }
  }
}

- (void)setModifiedValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUUISettingValueStore_setModifiedValue_forKey___block_invoke;
  block[3] = &unk_265400958;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(mutexQueue, block);
}

uint64_t __49__SUUISettingValueStore_setModifiedValue_forKey___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 24))
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v2;
  }
  uint64_t v5 = *(void **)(a1[4] + 24);
  uint64_t v6 = a1[6];
  if (a1[5])
  {
    return objc_msgSend(v5, "setObject:forKey:");
  }
  else
  {
    uint64_t v8 = a1[6];
    return objc_msgSend(v5, "removeObjectForKey:", v8, v6);
  }
}

- (void)setOriginalValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SUUISettingValueStore_setOriginalValue_forKey___block_invoke;
  block[3] = &unk_265400958;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(mutexQueue, block);
}

uint64_t __49__SUUISettingValueStore_setOriginalValue_forKey___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 16))
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v2;
  }
  uint64_t v5 = *(void **)(a1[4] + 16);
  uint64_t v6 = a1[6];
  if (a1[5])
  {
    return objc_msgSend(v5, "setObject:forKey:");
  }
  else
  {
    uint64_t v8 = a1[6];
    return objc_msgSend(v5, "removeObjectForKey:", v8, v6);
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"SUUISettingValueStore.m" lineNumber:146 description:@"setValue:forKey: is unimplemented. Use setOriginalValue:forKey: or setModifiedValue:forKey: instead."];
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"SUUISettingValueStore.m" lineNumber:150 description:@"setValue:forKeyPath: is unimplemented. Use setOriginalValue:forKey: or setModifiedValue:forKey: instead."];
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"SUUISettingValueStore.m" lineNumber:154 description:@"setValue:forUndefinedKey: is unimplemented. Use setOriginalValue:forKey: or setModifiedValue:forKey: instead."];
}

- (id)valueForKey:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SUUISettingValueStore.m" lineNumber:158 description:@"valueForKey: is unimplemented. Use resolvedValueForKey: instead."];

  return 0;
}

- (id)valueForKeyPath:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SUUISettingValueStore.m" lineNumber:163 description:@"valueForKeyPath: is unimplemented. Use resolvedValueForKey: instead."];

  return 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SUUISettingValueStore.m" lineNumber:168 description:@"valueForUndefinedKey: is unimplemented. Use resolvedValueForKey: instead."];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedValues, 0);
  objc_storeStrong((id *)&self->_originalValues, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end