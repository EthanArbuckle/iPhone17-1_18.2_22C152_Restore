@interface TSUConcurrentMutableDictionaryCache
- (OITSUReadWriteQueue)readWriteQueue;
- (TSUConcurrentMutableDictionaryCache)init;
- (TSUConcurrentMutableDictionaryCache)initWithName:(id)a3;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4;
- (unint64_t)count;
- (void)addEntriesFromDictionary:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)performSyncWriteWithUnderlyingDictionary:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3 andWait:(BOOL)a4;
- (void)removeObjectsForKeys:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation TSUConcurrentMutableDictionaryCache

- (TSUConcurrentMutableDictionaryCache)init
{
  return [(TSUConcurrentMutableDictionaryCache *)self initWithName:@"Unnamed TSUConcurrentMutableDictionaryCache"];
}

- (TSUConcurrentMutableDictionaryCache)initWithName:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TSUConcurrentMutableDictionaryCache;
  v5 = [(TSUConcurrentMutableDictionaryCache *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [OITSUReadWriteQueue alloc];
    v9 = [NSString stringWithFormat:@"TSUConcurrentMutableDictionaryCache:%@", v4];
    uint64_t v10 = [(OITSUReadWriteQueue *)v8 initWithIdentifier:v9];
    readWriteQueue = v5->_readWriteQueue;
    v5->_readWriteQueue = (OITSUReadWriteQueue *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cache = v5->_cache;
    v5->_cache = v12;

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v15 = *MEMORY[0x263F1D060];
    v16 = [MEMORY[0x263F1C408] sharedApplication];
    [v14 addObserver:v5 selector:sel_p_didReceiveMemoryWarning_ name:v15 object:v16];

    uint64_t v17 = *MEMORY[0x263F1D050];
    v18 = [MEMORY[0x263F1C408] sharedApplication];
    [v14 addObserver:v5 selector:sel_p_didEnterBackground_ name:v17 object:v18];
  }
  return v5;
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__TSUConcurrentMutableDictionaryCache_removeObjectForKey___block_invoke;
  v7[3] = &unk_264D612E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsyncWrite:v7];
}

uint64_t __58__TSUConcurrentMutableDictionaryCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__TSUConcurrentMutableDictionaryCache_setObject_forKey___block_invoke;
  v11[3] = &unk_264D62050;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performAsyncWrite:v11];
}

uint64_t __56__TSUConcurrentMutableDictionaryCache_setObject_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[5] forKey:a1[6]];
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__TSUConcurrentMutableDictionaryCache_addEntriesFromDictionary___block_invoke;
  v7[3] = &unk_264D612E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsyncWrite:v7];
}

uint64_t __64__TSUConcurrentMutableDictionaryCache_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

- (void)removeAllObjects
{
  v3 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__TSUConcurrentMutableDictionaryCache_removeAllObjects__block_invoke;
  v4[3] = &unk_264D61310;
  v4[4] = self;
  [v3 performAsyncWrite:v4];
}

uint64_t __55__TSUConcurrentMutableDictionaryCache_removeAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  v5 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__TSUConcurrentMutableDictionaryCache_removeObjectsForKeys___block_invoke;
  v7[3] = &unk_264D612E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performAsyncWrite:v7];
}

uint64_t __60__TSUConcurrentMutableDictionaryCache_removeObjectsForKeys___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectsForKeys:*(void *)(a1 + 40)];
}

- (void)removeObjectForKey:(id)a3 andWait:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __66__TSUConcurrentMutableDictionaryCache_removeObjectForKey_andWait___block_invoke;
  id v13 = &unk_264D612E8;
  v14 = self;
  id v15 = v6;
  id v8 = v6;
  [v7 performAsyncWrite:&v10];

  if (v4)
  {
    id v9 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
    [v9 waitOnInFlightWriters];
  }
}

uint64_t __66__TSUConcurrentMutableDictionaryCache_removeObjectForKey_andWait___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)description
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__21;
  uint64_t v11 = __Block_byref_object_dispose__21;
  id v12 = 0;
  v3 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__TSUConcurrentMutableDictionaryCache_description__block_invoke;
  v6[3] = &unk_264D612C0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performSyncRead:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__TSUConcurrentMutableDictionaryCache_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) description];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  id v17 = 0;
  v5 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__TSUConcurrentMutableDictionaryCache_objectForKey___block_invoke;
  v9[3] = &unk_264D61298;
  uint64_t v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 performSyncRead:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__TSUConcurrentMutableDictionaryCache_objectForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  objc_super v20 = __Block_byref_object_copy__21;
  v21 = __Block_byref_object_dispose__21;
  id v22 = 0;
  id v8 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__TSUConcurrentMutableDictionaryCache_objectsForKeys_notFoundMarker___block_invoke;
  v13[3] = &unk_264D62078;
  v16 = &v17;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  [v8 performSyncRead:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __69__TSUConcurrentMutableDictionaryCache_objectsForKeys_notFoundMarker___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectsForKeys:a1[5] notFoundMarker:a1[6]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__TSUConcurrentMutableDictionaryCache_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_264D618F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performSyncRead:v7];
}

uint64_t __73__TSUConcurrentMutableDictionaryCache_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) enumerateKeysAndObjectsUsingBlock:*(void *)(a1 + 40)];
}

- (void)performSyncWriteWithUnderlyingDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(TSUConcurrentMutableDictionaryCache *)self readWriteQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__TSUConcurrentMutableDictionaryCache_performSyncWriteWithUnderlyingDictionary___block_invoke;
  v7[3] = &unk_264D616F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performSyncWrite:v7];
}

uint64_t __80__TSUConcurrentMutableDictionaryCache_performSyncWriteWithUnderlyingDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8));
}

- (OITSUReadWriteQueue)readWriteQueue
{
  return self->_readWriteQueue;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_readWriteQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end