@interface TSDTileStorage
- (TSDTileStorage)init;
- (id)contentsInRect:(CGRect)a3 contentsScale:(double)a4 forTileAtLocation:(id)a5 inBucket:(id)a6;
- (id)p_cacheKeyForImageInRect:(CGRect)a3 contentsScale:(double)a4 tileLocation:(id)a5;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)dealloc;
- (void)removeAllContents;
- (void)removeImagesInBucket:(id)a3;
- (void)storeContents:(id)a3 inRect:(CGRect)a4 contentsScale:(double)a5 forTileAtLocation:(id)a6 inBucket:(id)a7;
@end

@implementation TSDTileStorage

- (TSDTileStorage)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSDTileStorage;
  v2 = [(TSDTileStorage *)&v5 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    v2->mCache = v3;
    [(NSCache *)v3 setDelegate:v2];
    v2->mReverseCacheKeys = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8A8]);
    v2->mReverseCacheKeysLock = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v2->mCacheKeysByBucket = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v2->mCacheKeysQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iwork.TSDTileStorage.cache-keys", 0);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->mCacheKeysQueue);
  dispatch_release((dispatch_object_t)self->mReverseCacheKeysLock);

  v3.receiver = self;
  v3.super_class = (Class)TSDTileStorage;
  [(TSDTileStorage *)&v3 dealloc];
}

- (void)storeContents:(id)a3 inRect:(CGRect)a4 contentsScale:(double)a5 forTileAtLocation:(id)a6 inBucket:(id)a7
{
  id v10 = -[TSDTileStorage p_cacheKeyForImageInRect:contentsScale:tileLocation:](self, "p_cacheKeyForImageInRect:contentsScale:tileLocation:", a6.var0, a6.var1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
  if (!v10)
  {
    v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDTileStorage storeContents:inRect:contentsScale:forTileAtLocation:inBucket:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTileStorage.m"), 61, @"invalid nil value for '%s'", "imageKey");
  }
  uint64_t v13 = [a7 stringByAppendingPathComponent:v10];
  mCacheKeysQueue = self->mCacheKeysQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__TSDTileStorage_storeContents_inRect_contentsScale_forTileAtLocation_inBucket___block_invoke;
  block[3] = &unk_2646B2310;
  block[4] = self;
  block[5] = a3;
  block[6] = v13;
  block[7] = a7;
  block[8] = v10;
  dispatch_async(mCacheKeysQueue, block);
}

uint64_t __80__TSDTileStorage_storeContents_inRect_contentsScale_forTileAtLocation_inBucket___block_invoke(void *a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 24), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 24));
  if (v2) {
    [*(id *)(a1[4] + 8) removeObjectForKey:v2];
  }
  [*(id *)(a1[4] + 8) setObject:a1[5] forKey:a1[6]];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 24), 0xFFFFFFFFFFFFFFFFLL);
  [*(id *)(a1[4] + 16) setObject:a1[6] forKey:a1[5]];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 24));
  objc_super v3 = (void *)[*(id *)(a1[4] + 40) objectForKey:a1[7]];
  if (!v3)
  {
    objc_super v3 = (void *)[MEMORY[0x263EFF9C0] set];
    [*(id *)(a1[4] + 40) setObject:v3 forKey:a1[7]];
  }
  uint64_t v4 = a1[8];

  return [v3 addObject:v4];
}

- (id)contentsInRect:(CGRect)a3 contentsScale:(double)a4 forTileAtLocation:(id)a5 inBucket:(id)a6
{
  id v8 = -[TSDTileStorage p_cacheKeyForImageInRect:contentsScale:tileLocation:](self, "p_cacheKeyForImageInRect:contentsScale:tileLocation:", a5.var0, a5.var1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  if (!v8)
  {
    v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDTileStorage contentsInRect:contentsScale:forTileAtLocation:inBucket:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTileStorage.m"), 97, @"invalid nil value for '%s'", "imageFileName");
  }
  uint64_t v11 = [a6 stringByAppendingPathComponent:v8];
  mCache = self->mCache;

  return [(NSCache *)mCache objectForKey:v11];
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mReverseCacheKeysLock, 0xFFFFFFFFFFFFFFFFLL);
  [(TSUPointerKeyDictionary *)self->mReverseCacheKeys removeObjectForKey:a4];
  mReverseCacheKeysLock = self->mReverseCacheKeysLock;

  dispatch_semaphore_signal(mReverseCacheKeysLock);
}

- (void)removeImagesInBucket:(id)a3
{
  mCacheKeysQueue = self->mCacheKeysQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__TSDTileStorage_removeImagesInBucket___block_invoke;
  v4[3] = &unk_2646B0750;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(mCacheKeysQueue, v4);
}

uint64_t __39__TSDTileStorage_removeImagesInBucket___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    objc_super v3 = v2;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", *(void *)(*((void *)&v9 + 1) + 8 * v7++)));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeAllContents
{
  mCacheKeysQueue = self->mCacheKeysQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__TSDTileStorage_removeAllContents__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = self;
  dispatch_sync(mCacheKeysQueue, block);
}

uint64_t __35__TSDTileStorage_removeAllContents__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);

  return [v2 removeAllObjects];
}

- (id)p_cacheKeyForImageInRect:(CGRect)a3 contentsScale:(double)a4 tileLocation:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu_%lu", a5.var0, a5.var1);
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld_%ld_%ld_%ld", (uint64_t)x, (uint64_t)y, (uint64_t)width, (uint64_t)height);
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (uint64_t)a4);
  return (id)[NSString stringWithFormat:@"%@-%@-%@", v10, v11, v12];
}

@end