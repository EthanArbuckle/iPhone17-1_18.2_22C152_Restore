@interface FCThreadSafeMapTable
+ (FCThreadSafeMapTable)mapTableWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4;
+ (id)strongToWeakObjectsMapTable;
- (FCThreadSafeMapTable)init;
- (FCThreadSafeMapTable)initWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4 capacity:(unint64_t)a5;
- (id)objectForKey:(id)a3;
- (id)subdictionaryForKeys:(id)a3;
- (id)subdictionaryForKeys:(id)a3 passingTest:(id)a4;
- (unint64_t)count;
- (void)addEntriesFromDictionary:(id)a3;
- (void)readWithAccessor:(id)a3;
- (void)readWriteWithAccessor:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation FCThreadSafeMapTable

uint64_t __46__FCThreadSafeMapTable_readWriteWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 16));
  }
  return result;
}

- (id)subdictionaryForKeys:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  lock = self->_lock;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__FCThreadSafeMapTable_subdictionaryForKeys_passingTest___block_invoke;
  v16[3] = &unk_1E5B575E8;
  id v17 = v6;
  v18 = self;
  id v20 = v7;
  id v10 = v8;
  id v19 = v10;
  id v11 = v7;
  id v12 = v6;
  [(NFUnfairLock *)lock performWithLockSync:v16];
  v13 = v19;
  id v14 = v10;

  return v14;
}

- (id)subdictionaryForKeys:(id)a3
{
  return [(FCThreadSafeMapTable *)self subdictionaryForKeys:a3 passingTest:&__block_literal_global_186];
}

- (void)readWriteWithAccessor:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__FCThreadSafeMapTable_readWriteWithAccessor___block_invoke;
  v7[3] = &unk_1E5B4C7C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __41__FCThreadSafeMapTable_readWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1 + 32) + 16));
  }
  return result;
}

+ (id)strongToWeakObjectsMapTable
{
  v2 = (void *)[objc_alloc((Class)a1) initWithKeyOptions:0 valueOptions:5 capacity:0];
  return v2;
}

- (FCThreadSafeMapTable)initWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4 capacity:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)FCThreadSafeMapTable;
  id v8 = [(FCThreadSafeMapTable *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    lock = v8->_lock;
    v8->_lock = (NFUnfairLock *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:a3 valueOptions:a4 capacity:a5];
    mapTable = v8->_mapTable;
    v8->_mapTable = (NSMapTable *)v11;
  }
  return v8;
}

- (void)readWithAccessor:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__FCThreadSafeMapTable_readWithAccessor___block_invoke;
  v7[3] = &unk_1E5B4C7C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

void __57__FCThreadSafeMapTable_subdictionaryForKeys_passingTest___block_invoke(uint64_t a1)
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
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "objectForKey:", v7, (void)v9);
        if (v8 && (*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))()) {
          [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (FCThreadSafeMapTable)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCThreadSafeMapTable init]";
    __int16 v9 = 2080;
    long long v10 = "FCThreadSafeCollections.m";
    __int16 v11 = 1024;
    int v12 = 537;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCThreadSafeMapTable init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

+ (FCThreadSafeMapTable)mapTableWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4
{
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithKeyOptions:a3 valueOptions:a4 capacity:0];
  return (FCThreadSafeMapTable *)v4;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__87;
  v16 = __Block_byref_object_dispose__87;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__FCThreadSafeMapTable_objectForKey___block_invoke;
  v9[3] = &unk_1E5B4C230;
  __int16 v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [(NFUnfairLock *)lock performWithLockSync:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __37__FCThreadSafeMapTable_objectForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__FCThreadSafeMapTable_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __43__FCThreadSafeMapTable_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__FCThreadSafeMapTable_setObject_forKey___block_invoke;
  v11[3] = &unk_1E5B4C738;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NFUnfairLock *)lock performWithLockSync:v11];
}

uint64_t __41__FCThreadSafeMapTable_setObject_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__FCThreadSafeMapTable_addEntriesFromDictionary___block_invoke;
  v7[3] = &unk_1E5B4BE70;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(NFUnfairLock *)lock performWithLockSync:v7];
}

uint64_t __49__FCThreadSafeMapTable_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__FCThreadSafeMapTable_addEntriesFromDictionary___block_invoke_2;
  v3[3] = &unk_1E5B54168;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __49__FCThreadSafeMapTable_addEntriesFromDictionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:a3 forKey:a2];
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
  v5[2] = __29__FCThreadSafeMapTable_count__block_invoke;
  v5[3] = &unk_1E5B4C258;
  v5[4] = self;
  v5[5] = &v6;
  [(NFUnfairLock *)lock performWithLockSync:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__FCThreadSafeMapTable_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)removeAllObjects
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__FCThreadSafeMapTable_removeAllObjects__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(NFUnfairLock *)lock performWithLockSync:v3];
}

uint64_t __40__FCThreadSafeMapTable_removeAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

uint64_t __45__FCThreadSafeMapTable_subdictionaryForKeys___block_invoke()
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapTable, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end