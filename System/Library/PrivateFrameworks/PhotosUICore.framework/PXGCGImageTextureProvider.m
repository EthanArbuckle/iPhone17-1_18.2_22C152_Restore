@interface PXGCGImageTextureProvider
- (PXGCGImageTextureProvider)init;
- (void)_clearStrongCaches;
- (void)_updateCacheLimit;
- (void)cacheAdditionalInfo:(id)a3 withKey:(id)a4;
- (void)invalidateCache;
- (void)lowMemoryModeDidChange;
- (void)releaseCachedResources;
- (void)requestCGImageAndAdditionalInfoWithCacheKey:(id)a3 imageProvider:(id)a4 resultHandler:(id)a5;
- (void)requestCGImageWithCacheKey:(id)a3 imageProvider:(id)a4 resultHandler:(id)a5;
@end

@implementation PXGCGImageTextureProvider

uint64_t __44__PXGCGImageTextureProvider_invalidateCache__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 248) removeAllObjects];
}

- (PXGCGImageTextureProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXGCGImageTextureProvider;
  v2 = [(PXGTextureProvider *)&v8 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;

    [(NSCache *)v2->_imageCache setTotalCostLimit:15728640];
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    aliveImagesCache = v2->_aliveImagesCache;
    v2->_aliveImagesCache = (NSMapTable *)v5;

    [(PXGCGImageTextureProvider *)v2 _updateCacheLimit];
  }
  return v2;
}

- (void)_updateCacheLimit
{
  if ([(PXGTextureProvider *)self lowMemoryMode]) {
    uint64_t v3 = 5242880;
  }
  else {
    uint64_t v3 = 15728640;
  }
  imageCache = self->_imageCache;
  [(NSCache *)imageCache setTotalCostLimit:v3];
}

- (void)requestCGImageAndAdditionalInfoWithCacheKey:(id)a3 imageProvider:(id)a4 resultHandler:(id)a5
{
  id v18 = a3;
  v9 = (uint64_t (**)(void))a4;
  v10 = (void (**)(id, id, void *))a5;
  v11 = [(PXGCGImageTextureProvider *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(NSCache *)self->_imageCache objectForKey:v18];
  v13 = [(NSCache *)self->_additionalInfoCache objectForKey:v18];
  if (v12)
  {
    v10[2](v10, v12, v13);
  }
  else
  {
    kdebug_trace();
    v14 = (CGImage *)v9[2](v9);
    if (!v14)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"PXGCGImageTextureProvider.m", 67, @"Invalid parameter not satisfying: %@", @"imageRef != nil" object file lineNumber description];
    }
    CGImageGetWidth(v14);
    CGImageGetHeight(v14);
    kdebug_trace();
    size_t Width = CGImageGetWidth(v14);
    [(NSCache *)self->_imageCache setObject:v14 forKey:v18 cost:4 * Width * CGImageGetHeight(v14)];
    uint64_t v16 = [(NSCache *)self->_additionalInfoCache objectForKey:v18];

    v10[2](v10, v14, (void *)v16);
    CGImageRelease(v14);
    v13 = (void *)v16;
  }
}

- (void)invalidateCache
{
  [(PXGCGImageTextureProvider *)self _clearStrongCaches];
  uint64_t v3 = [(PXGCGImageTextureProvider *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PXGCGImageTextureProvider_invalidateCache__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)requestCGImageWithCacheKey:(id)a3 imageProvider:(id)a4 resultHandler:(id)a5
{
  id v17 = a3;
  v9 = (uint64_t (**)(void))a4;
  v10 = (void (**)(id, id))a5;
  v11 = [(PXGCGImageTextureProvider *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(NSCache *)self->_imageCache objectForKey:v17];
  if (v12 || (id v12 = [(NSMapTable *)self->_aliveImagesCache objectForKey:v17]) != 0)
  {
    v10[2](v10, v12);
  }
  else
  {
    kdebug_trace();
    v13 = (CGImage *)v9[2](v9);
    if (!v13)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PXGCGImageTextureProvider.m", 46, @"Invalid parameter not satisfying: %@", @"imageRef != nil" object file lineNumber description];
    }
    size_t Width = CGImageGetWidth(v13);
    size_t Height = CGImageGetHeight(v13);
    kdebug_trace();
    [(NSCache *)self->_imageCache setObject:v13 forKey:v17 cost:4 * Width * Height];
    [(NSMapTable *)self->_aliveImagesCache setObject:v13 forKey:v17];
    v10[2](v10, v13);
    CGImageRelease(v13);
  }
}

- (void)_clearStrongCaches
{
  [(NSCache *)self->_imageCache removeAllObjects];
  additionalInfoCache = self->_additionalInfoCache;
  [(NSCache *)additionalInfoCache removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aliveImagesCache, 0);
  objc_storeStrong((id *)&self->_additionalInfoCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

- (void)releaseCachedResources
{
  v3.receiver = self;
  v3.super_class = (Class)PXGCGImageTextureProvider;
  [(PXGTextureProvider *)&v3 releaseCachedResources];
  [(PXGCGImageTextureProvider *)self _clearStrongCaches];
}

- (void)lowMemoryModeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGCGImageTextureProvider;
  [(PXGTextureProvider *)&v3 lowMemoryModeDidChange];
  [(PXGCGImageTextureProvider *)self _updateCacheLimit];
}

- (void)cacheAdditionalInfo:(id)a3 withKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(PXGCGImageTextureProvider *)self workQueue];
  dispatch_assert_queue_V2(v7);

  additionalInfoCache = self->_additionalInfoCache;
  if (!additionalInfoCache)
  {
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    v10 = self->_additionalInfoCache;
    self->_additionalInfoCache = v9;

    additionalInfoCache = self->_additionalInfoCache;
  }
  [(NSCache *)additionalInfoCache setObject:v11 forKey:v6];
}

@end