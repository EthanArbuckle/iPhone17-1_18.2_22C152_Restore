@interface TSULogCatThreadSafeMutableSet
- (BOOL)containsObject:(id)a3;
- (TSULogCatThreadSafeMutableSet)init;
- (TSULogCatThreadSafeMutableSet)initWithArray:(id)a3;
- (id)allObjects;
- (id)description;
- (id)immutableSet;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)removeObject:(id)a3;
@end

@implementation TSULogCatThreadSafeMutableSet

- (TSULogCatThreadSafeMutableSet)initWithArray:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TSULogCatThreadSafeMutableSet;
  v5 = [(TSULogCatThreadSafeMutableSet *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v4];
    objects = v5->_objects;
    v5->_objects = (NSMutableSet *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("TSULogCatQueue", 0);
    logCatQueue = v5->_logCatQueue;
    v5->_logCatQueue = (OS_dispatch_queue *)v8;
  }
  return v5;
}

- (TSULogCatThreadSafeMutableSet)init
{
  v3 = [MEMORY[0x263EFF8C0] array];
  id v4 = [(TSULogCatThreadSafeMutableSet *)self initWithArray:v3];

  return v4;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  logCatQueue = self->_logCatQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__TSULogCatThreadSafeMutableSet_containsObject___block_invoke;
  block[3] = &unk_264D61298;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(logCatQueue, block);
  LOBYTE(logCatQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)logCatQueue;
}

uint64_t __48__TSULogCatThreadSafeMutableSet_containsObject___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__TSULogCatThreadSafeMutableSet_count__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__TSULogCatThreadSafeMutableSet_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)allObjects
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__TSULogCatThreadSafeMutableSet_allObjects__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__TSULogCatThreadSafeMutableSet_allObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)immutableSet
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__TSULogCatThreadSafeMutableSet_immutableSet__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__TSULogCatThreadSafeMutableSet_immutableSet__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFFA08] setWithSet:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  logCatQueue = self->_logCatQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__TSULogCatThreadSafeMutableSet_addObject___block_invoke;
  v7[3] = &unk_264D612E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(logCatQueue, v7);
}

uint64_t __43__TSULogCatThreadSafeMutableSet_addObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  logCatQueue = self->_logCatQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__TSULogCatThreadSafeMutableSet_removeObject___block_invoke;
  v7[3] = &unk_264D612E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(logCatQueue, v7);
}

uint64_t __46__TSULogCatThreadSafeMutableSet_removeObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (id)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  logCatQueue = self->_logCatQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__TSULogCatThreadSafeMutableSet_description__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(logCatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__TSULogCatThreadSafeMutableSet_description__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) description];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logCatQueue, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end