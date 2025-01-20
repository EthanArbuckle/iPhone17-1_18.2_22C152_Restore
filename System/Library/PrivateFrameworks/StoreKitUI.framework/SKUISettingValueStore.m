@interface SKUISettingValueStore
- (BOOL)hasChanges;
- (SKUISettingValueStore)init;
- (id)modifiedKeys;
- (id)originalValueForKey:(id)a3;
- (id)resolvedValueForKey:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (void)clearValueForKey:(id)a3;
- (void)commitChanges;
- (void)discardChanges;
- (void)init;
- (void)setModifiedValue:(id)a3 forKey:(id)a4;
- (void)setOriginalValue:(id)a3 forKey:(id)a4;
@end

@implementation SKUISettingValueStore

- (SKUISettingValueStore)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingValueStore init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUISettingValueStore;
  v3 = [(SKUISettingValueStore *)&v7 init];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StoreKitUI.SKUISettingValueStore", 0);
    mutexQueue = v3->_mutexQueue;
    v3->_mutexQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)clearValueForKey:(id)a3
{
  id v4 = a3;
  mutexQueue = self->_mutexQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SKUISettingValueStore_clearValueForKey___block_invoke;
  v7[3] = &unk_1E6421FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(mutexQueue, v7);
}

void *__42__SKUISettingValueStore_clearValueForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SKUISettingValueStore_commitChanges__block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

void __38__SKUISettingValueStore_commitChanges__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {
    if (!*(void *)(v2 + 16))
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v4;

      uint64_t v2 = *(void *)(a1 + 32);
      v3 = *(void **)(v2 + 24);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__SKUISettingValueStore_commitChanges__block_invoke_2;
    v9[3] = &unk_1E6425BF0;
    v9[4] = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v9];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = 0;
  }
}

uint64_t __38__SKUISettingValueStore_commitChanges__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:a3 forKey:a2];
}

- (void)discardChanges
{
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SKUISettingValueStore_discardChanges__block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

void __39__SKUISettingValueStore_discardChanges__block_invoke(uint64_t a1)
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
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SKUISettingValueStore_hasChanges__block_invoke;
  v5[3] = &unk_1E6422538;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__SKUISettingValueStore_hasChanges__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24) != 0;
  return result;
}

- (id)modifiedKeys
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__25;
  v10 = __Block_byref_object_dispose__25;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__SKUISettingValueStore_modifiedKeys__block_invoke;
  v5[3] = &unk_1E6423848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void *__37__SKUISettingValueStore_modifiedKeys__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 24);
  if (result)
  {
    uint64_t v3 = [result allKeys];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    *(void *)(v4 + 40) = v3;
    return (void *)MEMORY[0x1F41817F8](v3, v5);
  }
  return result;
}

- (id)originalValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__25;
  v16 = __Block_byref_object_dispose__25;
  id v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SKUISettingValueStore_originalValueForKey___block_invoke;
  block[3] = &unk_1E6425C18;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void *__45__SKUISettingValueStore_originalValueForKey___block_invoke(void *a1)
{
  result = *(void **)(a1[4] + 16);
  if (result)
  {
    uint64_t v3 = [result objectForKey:a1[5]];
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void *)(v4 + 40);
    *(void *)(v4 + 40) = v3;
    return (void *)MEMORY[0x1F41817F8](v3, v5);
  }
  return result;
}

- (id)resolvedValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__25;
  v16 = __Block_byref_object_dispose__25;
  id v17 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SKUISettingValueStore_resolvedValueForKey___block_invoke;
  block[3] = &unk_1E6425C18;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(mutexQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__SKUISettingValueStore_resolvedValueForKey___block_invoke(void *a1)
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
      MEMORY[0x1F41817F8](v7, v9);
    }
  }
}

- (void)setModifiedValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SKUISettingValueStore_setModifiedValue_forKey___block_invoke;
  block[3] = &unk_1E64225B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(mutexQueue, block);
}

uint64_t __49__SKUISettingValueStore_setModifiedValue_forKey___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 24))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
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
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SKUISettingValueStore_setOriginalValue_forKey___block_invoke;
  block[3] = &unk_1E64225B0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(mutexQueue, block);
}

uint64_t __49__SKUISettingValueStore_setOriginalValue_forKey___block_invoke(void *a1)
{
  if (!*(void *)(a1[4] + 16))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
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

- (id)valueForKey:(id)a3
{
  return 0;
}

- (id)valueForKeyPath:(id)a3
{
  return 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedValues, 0);
  objc_storeStrong((id *)&self->_originalValues, 0);

  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUISettingValueStore init]";
}

@end