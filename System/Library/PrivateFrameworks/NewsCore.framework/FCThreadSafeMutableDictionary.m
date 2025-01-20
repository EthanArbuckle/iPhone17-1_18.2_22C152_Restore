@interface FCThreadSafeMutableDictionary
- (BOOL)isEmpty;
- (FCThreadSafeMutableDictionary)init;
- (FCThreadSafeMutableDictionary)initWithDictionary:(id)a3;
- (NSArray)allKeys;
- (NSArray)allValues;
- (NSDictionary)readOnlyDictionary;
- (id)objectForKey:(id)a3;
- (id)subdictionaryForKeys:(id)a3;
- (id)subdictionaryForKeys:(id)a3 passingTest:(id)a4;
- (unint64_t)count;
- (void)addEntriesFromDictionary:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)readWithAccessor:(id)a3;
- (void)readWriteWithAccessor:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation FCThreadSafeMutableDictionary

- (void)readWriteWithAccessor:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__FCThreadSafeMutableDictionary_readWriteWithAccessor___block_invoke;
  v7[3] = &unk_1E5B4C7C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

- (FCThreadSafeMutableDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)FCThreadSafeMutableDictionary;
  v2 = [(FCThreadSafeMutableDictionary *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    lock = v2->_lock;
    v2->_lock = (NFUnfairLock *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v5;
  }
  return v2;
}

uint64_t __55__FCThreadSafeMutableDictionary_readWriteWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 16));
  }
  return result;
}

uint64_t __50__FCThreadSafeMutableDictionary_setObject_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
}

uint64_t __46__FCThreadSafeMutableDictionary_objectForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  return MEMORY[0x1F41817F8]();
}

uint64_t __58__FCThreadSafeMutableDictionary_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

- (id)objectForKey:(id)a3
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
  v9[2] = __46__FCThreadSafeMutableDictionary_objectForKey___block_invoke;
  v9[3] = &unk_1E5B4C230;
  v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(NFUnfairLock *)lock performWithLockSync:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__FCThreadSafeMutableDictionary_addEntriesFromDictionary___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __42__FCThreadSafeMutableDictionary_allValues__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  return MEMORY[0x1F41817F8]();
}

- (NSArray)allValues
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__87;
  id v10 = __Block_byref_object_dispose__87;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__FCThreadSafeMutableDictionary_allValues__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__FCThreadSafeMutableDictionary_setObject_forKey___block_invoke;
  v11[3] = &unk_1E5B4C738;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NFUnfairLock *)lock performWithLockSync:v11];
}

- (NSDictionary)readOnlyDictionary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__87;
  id v10 = __Block_byref_object_dispose__87;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__FCThreadSafeMutableDictionary_readOnlyDictionary__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__FCThreadSafeMutableDictionary_count__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)allKeys
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__87;
  id v10 = __Block_byref_object_dispose__87;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__FCThreadSafeMutableDictionary_allKeys__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __51__FCThreadSafeMutableDictionary_readOnlyDictionary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __38__FCThreadSafeMutableDictionary_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

uint64_t __40__FCThreadSafeMutableDictionary_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (FCThreadSafeMutableDictionary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(FCThreadSafeMutableDictionary *)self init];
  uint64_t v6 = v5;
  if (v5) {
    [(NSMutableDictionary *)v5->_dictionary addEntriesFromDictionary:v4];
  }

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__FCThreadSafeMutableDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __52__FCThreadSafeMutableDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeAllObjects
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__FCThreadSafeMutableDictionary_removeAllObjects__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(NFUnfairLock *)lock performWithLockSync:v3];
}

uint64_t __49__FCThreadSafeMutableDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__FCThreadSafeMutableDictionary_removeObjectsForKeys___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __54__FCThreadSafeMutableDictionary_removeObjectsForKeys___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectsForKeys:*(void *)(a1 + 40)];
}

- (BOOL)isEmpty
{
  return [(FCThreadSafeMutableDictionary *)self count] == 0;
}

- (id)subdictionaryForKeys:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__87;
  v16 = __Block_byref_object_dispose__87;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__FCThreadSafeMutableDictionary_subdictionaryForKeys___block_invoke;
  v9[3] = &unk_1E5B4C230;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(NFUnfairLock *)lock performWithLockSync:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __54__FCThreadSafeMutableDictionary_subdictionaryForKeys___block_invoke(void *a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 16), "fc_subdictionaryForKeys:", a1[5]);
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)subdictionaryForKeys:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  lock = self->_lock;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__FCThreadSafeMutableDictionary_subdictionaryForKeys_passingTest___block_invoke;
  v16[3] = &unk_1E5B575E8;
  id v17 = v6;
  v18 = self;
  id v20 = v7;
  id v10 = v8;
  id v19 = v10;
  id v11 = v7;
  id v12 = v6;
  [(NFUnfairLock *)lock performWithLockSync:v16];
  id v13 = v19;
  id v14 = v10;

  return v14;
}

void __66__FCThreadSafeMutableDictionary_subdictionaryForKeys_passingTest___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "objectForKeyedSubscript:", v7, (void)v9);
        if (v8 && (*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))()) {
          [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__FCThreadSafeMutableDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E5B4CC80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __67__FCThreadSafeMutableDictionary_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) enumerateKeysAndObjectsUsingBlock:*(void *)(a1 + 40)];
}

- (void)readWithAccessor:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__FCThreadSafeMutableDictionary_readWithAccessor___block_invoke;
  v7[3] = &unk_1E5B4C7C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __50__FCThreadSafeMutableDictionary_readWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 16));
  }
  return result;
}

@end