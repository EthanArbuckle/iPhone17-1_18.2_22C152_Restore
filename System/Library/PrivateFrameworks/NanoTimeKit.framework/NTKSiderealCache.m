@interface NTKSiderealCache
+ (id)sharedCache;
- (float)aplForDate:(id)a3 generationBlock:(id)a4;
- (id)_init;
- (id)imageDataForKey:(id)a3 generationBlock:(id)a4;
- (void)_purgeEverything;
- (void)purgeAPLCache;
- (void)purgeCachedKey:(id)a3;
@end

@implementation NTKSiderealCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_0 != -1) {
    dispatch_once(&sharedCache_onceToken_0, &__block_literal_global_37);
  }
  v2 = (void *)sharedCache_sharedCache;
  return v2;
}

void __31__NTKSiderealCache_sharedCache__block_invoke()
{
  id v0 = [[NTKSiderealCache alloc] _init];
  v1 = (void *)sharedCache_sharedCache;
  sharedCache_sharedCache = (uint64_t)v0;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)NTKSiderealCache;
  v2 = [(NTKSiderealCache *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("NTKSiderealCache Queue", MEMORY[0x1E4F14430]);
    readerWriterQueue = v2->_readerWriterQueue;
    v2->_readerWriterQueue = (OS_dispatch_queue *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    dataCache = v2->_dataCache;
    v2->_dataCache = v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    aplCache = v2->_aplCache;
    v2->_aplCache = v7;

    [(NSCache *)v2->_aplCache setCountLimit:64];
    [(NTKSiderealCache *)v2 _purgeEverything];
  }
  return v2;
}

- (void)_purgeEverything
{
  readerWriterQueue = self->_readerWriterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__NTKSiderealCache__purgeEverything__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_barrier_async(readerWriterQueue, block);
}

uint64_t __36__NTKSiderealCache__purgeEverything__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v2 removeAllObjects];
}

- (void)purgeCachedKey:(id)a3
{
  id v4 = a3;
  readerWriterQueue = self->_readerWriterQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__NTKSiderealCache_purgeCachedKey___block_invoke;
  v7[3] = &unk_1E62C09C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(readerWriterQueue, v7);
}

uint64_t __35__NTKSiderealCache_purgeCachedKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)purgeAPLCache
{
  readerWriterQueue = self->_readerWriterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__NTKSiderealCache_purgeAPLCache__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_barrier_async(readerWriterQueue, block);
}

uint64_t __33__NTKSiderealCache_purgeAPLCache__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
}

- (id)imageDataForKey:(id)a3 generationBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  id v27 = 0;
  readerWriterQueue = self->_readerWriterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NTKSiderealCache_imageDataForKey_generationBlock___block_invoke;
  block[3] = &unk_1E62C2810;
  v21 = &v22;
  block[4] = self;
  id v9 = v6;
  id v20 = v9;
  dispatch_sync(readerWriterQueue, block);
  if (!v23[5])
  {
    uint64_t v10 = v7[2](v7);
    v11 = (void *)v23[5];
    v23[5] = v10;

    if (v23[5])
    {
      v12 = self->_readerWriterQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __52__NTKSiderealCache_imageDataForKey_generationBlock___block_invoke_2;
      v16[3] = &unk_1E62C2838;
      v16[4] = self;
      v18 = &v22;
      id v17 = v9;
      dispatch_barrier_async(v12, v16);
    }
    else
    {
      v13 = _NTKLoggingObjectForDomain(36, (uint64_t)"NTKLoggingDomainSidereal");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[NTKSiderealCache imageDataForKey:generationBlock:]((uint64_t)v9, v13);
      }
    }
  }
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __52__NTKSiderealCache_imageDataForKey_generationBlock___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __52__NTKSiderealCache_imageDataForKey_generationBlock___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[5]];
}

- (float)aplForDate:(id)a3 generationBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__9;
  v32 = __Block_byref_object_dispose__9;
  id v33 = 0;
  readerWriterQueue = self->_readerWriterQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NTKSiderealCache_aplForDate_generationBlock___block_invoke;
  block[3] = &unk_1E62C2810;
  id v27 = &v28;
  block[4] = self;
  id v9 = v6;
  id v26 = v9;
  dispatch_sync(readerWriterQueue, block);
  uint64_t v10 = (void *)v29[5];
  if (!v10)
  {
    v11 = NSNumber;
    v7[2](v7);
    uint64_t v12 = objc_msgSend(v11, "numberWithFloat:");
    v13 = (void *)v29[5];
    v29[5] = v12;

    if (v29[5])
    {
      id v14 = self->_readerWriterQueue;
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __47__NTKSiderealCache_aplForDate_generationBlock___block_invoke_2;
      v21 = &unk_1E62C2838;
      uint64_t v22 = self;
      uint64_t v24 = &v28;
      id v23 = v9;
      dispatch_barrier_async(v14, &v18);

      uint64_t v10 = (void *)v29[5];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  objc_msgSend(v10, "floatValue", v18, v19, v20, v21, v22);
  float v16 = v15;

  _Block_object_dispose(&v28, 8);
  return v16;
}

void __47__NTKSiderealCache_aplForDate_generationBlock___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __47__NTKSiderealCache_aplForDate_generationBlock___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 24) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[5]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aplCache, 0);
  objc_storeStrong((id *)&self->_readerWriterQueue, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
}

- (void)imageDataForKey:(uint64_t)a1 generationBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[NTKSiderealCache imageDataForKey:generationBlock:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "%s received nil imageData for key:%@", (uint8_t *)&v2, 0x16u);
}

@end