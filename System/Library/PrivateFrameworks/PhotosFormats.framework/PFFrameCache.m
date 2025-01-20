@interface PFFrameCache
+ (id)sharedFrameGenerationQueue;
- (CGImage)_createPredrawnImage:(CGImage *)a3;
- (CGImage)_frameAtIndex:(unint64_t)a3 allowLazy:(BOOL)a4;
- (CGImage)frameAtIndex:(unint64_t)a3;
- (CGImage)frameAtIndexIfReady:(unint64_t)a3;
- (PFFrameCache)initWithImageSource:(CGImageSource *)a3;
- (PFFrameCache)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4;
- (PFFrameCache)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4 useGlobalDecodeQueue:(BOOL)a5;
- (int64_t)cacheStrategy;
- (void)_frameGenerationQueue_cacheFrameAtIndex:(unint64_t)a3;
- (void)_frameGenerationQueue_updateFrameCache;
- (void)_invalidateCache;
- (void)_invalidateCacheSize;
- (void)_updateDesiredCacheSize;
- (void)_updateFrameCache;
- (void)_updateIfNeeded;
- (void)dealloc;
- (void)setCacheStrategy:(int64_t)a3;
@end

@implementation PFFrameCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIndexes, 0);
  objc_storeStrong((id *)&self->_frameCache, 0);
  objc_storeStrong((id *)&self->_cacheIsolationQueue, 0);

  objc_storeStrong((id *)&self->_frameGenerationQueue, 0);
}

- (CGImage)_createPredrawnImage:(CGImage *)a3
{
  unint64_t Width = CGImageGetWidth(a3);
  unint64_t Height = CGImageGetHeight(a3);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  size_t BytesPerRow = CGImageGetBytesPerRow(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
  uint32_t v10 = AlphaInfo;
  if (AlphaInfo <= kCGImageAlphaOnly && ((0x99u >> AlphaInfo) & 1) != 0) {
    uint32_t v10 = dword_1A42D389C[AlphaInfo];
  }
  v11 = CGBitmapContextCreate(0, Width, Height, BitsPerComponent, BytesPerRow, ColorSpace, v10);
  if (v11)
  {
    v12 = v11;
    v16.size.width = (double)Width;
    v16.size.height = (double)Height;
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    CGContextDrawImage(v11, v16, a3);
    Image = CGBitmapContextCreateImage(v12);
    CGContextRelease(v12);
    return Image;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PFFrameCache: Failed to create pre-drawing context", v15, 2u);
    }
    return 0;
  }
}

- (void)_frameGenerationQueue_updateFrameCache
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5023;
  v23 = __Block_byref_object_dispose__5024;
  id v24 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3010000000;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  CGRect v16 = &unk_1A42EF38E;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint32_t v10 = &unk_1A42EF38E;
  cacheIsolationQueue = self->_cacheIsolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke;
  block[3] = &unk_1E5B2DEC8;
  block[4] = self;
  block[5] = &v19;
  block[6] = &v13;
  block[7] = &v7;
  dispatch_sync(cacheIsolationQueue, block);
  if ([(id)v20[5] count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke_3;
    v5[3] = &unk_1E5B2DEF0;
    v5[4] = self;
    v4 = (void *)MEMORY[0x1A6259AE0](v5);
    objc_msgSend((id)v20[5], "enumerateRangesInRange:options:usingBlock:", v14[4], v14[5], 0, v4);
    objc_msgSend((id)v20[5], "enumerateRangesInRange:options:usingBlock:", v8[4], v8[5], 0, v4);
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

void __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (!*(unsigned char *)(v1 + 81))
  {
    *(unsigned char *)(v1 + 81) = 1;
    v3 = (void *)a1[4];
    unint64_t v4 = v3[2];
    if (v4 >= v3[6]) {
      unint64_t v5 = v3[6];
    }
    else {
      unint64_t v5 = v3[2];
    }
    uint64_t v6 = v3[8];
    unint64_t v7 = v4 - v6;
    if (v5 >= v4 - v6) {
      unint64_t v8 = v4 - v6;
    }
    else {
      unint64_t v8 = v5;
    }
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:");
    uint32_t v10 = v9;
    if (v5 > v7) {
      objc_msgSend(v9, "addIndexesInRange:", 0, v5 - v8);
    }
    if (([*(id *)(a1[4] + 72) isEqualToIndexSet:v10] & 1) == 0)
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndexSet:*(void *)(a1[4] + 72)];
      [v11 removeIndexes:v10];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke_2;
      v18[3] = &unk_1E5B2DEA0;
      v18[4] = a1[4];
      [v11 enumerateIndexesUsingBlock:v18];
      [*(id *)(a1[4] + 72) removeIndexes:v11];
      [v10 removeIndexes:*(void *)(a1[4] + 72)];
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v10);
      uint64_t v12 = a1[4];
      uint64_t v13 = *(void *)(v12 + 64);
      uint64_t v14 = *(void *)(v12 + 16) - v13;
      uint64_t v15 = *(void *)(a1[6] + 8);
      *(void *)(v15 + 32) = v13;
      *(void *)(v15 + 40) = v14;
      uint64_t v16 = *(void *)(a1[4] + 64);
      uint64_t v17 = *(void *)(a1[7] + 8);
      *(void *)(v17 + 32) = 0;
      *(void *)(v17 + 40) = v16;
    }
  }
}

uint64_t __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke_3(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 < a2 + a3)
  {
    uint64_t v12 = v6;
    uint64_t v13 = v5;
    uint64_t v14 = v4;
    uint64_t v15 = v3;
    uint64_t v16 = v7;
    uint64_t v17 = v8;
    uint64_t v9 = a3;
    uint64_t v10 = a2;
    uint64_t v11 = result;
    do
    {
      result = objc_msgSend(*(id *)(v11 + 32), "_frameGenerationQueue_cacheFrameAtIndex:", v10++, v12, v13, v14, v15, v16, v17);
      --v9;
    }
    while (v9);
  }
  return result;
}

void __54__PFFrameCache__frameGenerationQueue_updateFrameCache__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 removeObjectForKey:v3];
}

- (void)_frameGenerationQueue_cacheFrameAtIndex:(unint64_t)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = *MEMORY[0x1E4F2FF08];
  v15[0] = MEMORY[0x1E4F1CC28];
  CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(self->_gifSource, a3, v5);
  if (ImageAtIndex)
  {
    uint64_t v7 = ImageAtIndex;
    uint64_t v8 = [(PFFrameCache *)self _createPredrawnImage:ImageAtIndex];
    if (v8)
    {
      uint64_t v9 = v8;
      CGImageRelease(v7);
      uint64_t v7 = v9;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v13 = a3;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PFFrameCache: Predrawing failed for image at index %lu", buf, 0xCu);
    }
    cacheIsolationQueue = self->_cacheIsolationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PFFrameCache__frameGenerationQueue_cacheFrameAtIndex___block_invoke;
    block[3] = &unk_1E5B2F020;
    block[4] = self;
    block[5] = a3;
    block[6] = v7;
    dispatch_sync(cacheIsolationQueue, block);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = a3;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PFFrameCache: Unable to create image for index %lu", buf, 0xCu);
  }
}

void __56__PFFrameCache__frameGenerationQueue_cacheFrameAtIndex___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 56);
  id v3 = [NSNumber numberWithUnsignedInteger:a1[5]];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    CFDictionaryRef v5 = (CGImage *)a1[6];
    CGImageRelease(v5);
  }
  else
  {
    uint64_t v6 = *(void **)(a1[4] + 56);
    uint64_t v7 = (void *)a1[6];
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:a1[5]];
    [v6 setObject:v7 forKey:v8];

    uint64_t v9 = a1[5];
    uint64_t v10 = *(void **)(a1[4] + 72);
    [v10 addIndex:v9];
  }
}

- (void)dealloc
{
  gifSource = self->_gifSource;
  if (gifSource) {
    CFRelease(gifSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)PFFrameCache;
  [(PFFrameCache *)&v4 dealloc];
}

- (void)_updateFrameCache
{
  objc_initWeak(&location, self);
  frameGenerationQueue = self->_frameGenerationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__PFFrameCache__updateFrameCache__block_invoke;
  v4[3] = &unk_1E5B2DF48;
  objc_copyWeak(&v5, &location);
  dispatch_async(frameGenerationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __33__PFFrameCache__updateFrameCache__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_frameGenerationQueue_updateFrameCache");
}

- (void)_updateDesiredCacheSize
{
  cacheIsolationQueue = self->_cacheIsolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PFFrameCache__updateDesiredCacheSize__block_invoke;
  block[3] = &unk_1E5B2F5F0;
  block[4] = self;
  dispatch_sync(cacheIsolationQueue, block);
}

uint64_t __39__PFFrameCache__updateDesiredCacheSize__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 80))
  {
    *(unsigned char *)(v1 + 80) = 1;
    v2 = *(void **)(result + 32);
    uint64_t v3 = v2[11];
    uint64_t v4 = 5;
    if (v3 != 2) {
      uint64_t v4 = 1;
    }
    if (v3 == 1) {
      uint64_t v4 = 2;
    }
    if (v2[3] >> 22 <= 4uLL && v3 != 0) {
      uint64_t v4 = v2[2];
    }
    if (v2[6] != v4)
    {
      v2[6] = v4;
      return [*(id *)(result + 32) _invalidateCacheSize];
    }
  }
  return result;
}

- (void)_updateIfNeeded
{
  [(PFFrameCache *)self _updateDesiredCacheSize];

  [(PFFrameCache *)self _updateFrameCache];
}

- (void)_invalidateCache
{
  self->_isValid.frameCache = 0;
}

- (void)_invalidateCacheSize
{
  self->_isValid.cacheSize = 0;
}

- (void)setCacheStrategy:(int64_t)a3
{
  cacheIsolationQueue = self->_cacheIsolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__PFFrameCache_setCacheStrategy___block_invoke;
  v5[3] = &unk_1E5B2DE78;
  v5[4] = self;
  void v5[5] = a3;
  dispatch_sync(cacheIsolationQueue, v5);
  [(PFFrameCache *)self _updateIfNeeded];
}

uint64_t __33__PFFrameCache_setCacheStrategy___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (*(void *)(v1 + 88) != v2)
  {
    *(void *)(v1 + 88) = v2;
    return [*(id *)(result + 32) _invalidateCacheSize];
  }
  return result;
}

- (int64_t)cacheStrategy
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 2;
  cacheIsolationQueue = self->_cacheIsolationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PFFrameCache_cacheStrategy__block_invoke;
  v5[3] = &unk_1E5B2F690;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(cacheIsolationQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__PFFrameCache_cacheStrategy__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 88);
  return result;
}

- (CGImage)_frameAtIndex:(unint64_t)a3 allowLazy:(BOOL)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  cacheIsolationQueue = self->_cacheIsolationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PFFrameCache__frameAtIndex_allowLazy___block_invoke;
  v8[3] = &unk_1E5B2DE50;
  v8[5] = &v10;
  v8[6] = a3;
  v8[4] = self;
  BOOL v9 = a4;
  dispatch_sync(cacheIsolationQueue, v8);
  [(PFFrameCache *)self _updateFrameCache];
  uint64_t v6 = (CGImage *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __40__PFFrameCache__frameAtIndex_allowLazy___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = *(void *)(a1 + 48);
  if (v3 != v4)
  {
    *(void *)(v2 + 64) = v4;
    [*(id *)(a1 + 32) _invalidateCache];
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 48);
  }
  id v5 = *(void **)(v2 + 56);
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v3];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 objectForKey:v6];

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 56))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = v7;
        _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "PFFrameCache: Requested unavailable frame at index %lu (ahead of ourselves!!)", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v14 = *MEMORY[0x1E4F2FF08];
      uint64_t v15 = MEMORY[0x1E4F1CC28];
      CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGImageSourceCreateImageAtIndex(*(CGImageSourceRef *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 48), v8);
      BOOL v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (v9)
      {
        uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 56);
        uint64_t v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
        [v10 setObject:v9 forKey:v11];

        [*(id *)(*(void *)(a1 + 32) + 72) addIndex:*(void *)(a1 + 48)];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 134217984;
          uint64_t v17 = v12;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "PFFrameCache: Returning undrawn frame at index %lu", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = v13;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PFFrameCache: Failed to create image for undrawn frame at index %lu", buf, 0xCu);
      }
    }
  }
}

- (CGImage)frameAtIndexIfReady:(unint64_t)a3
{
  return [(PFFrameCache *)self _frameAtIndex:a3 allowLazy:1];
}

- (CGImage)frameAtIndex:(unint64_t)a3
{
  return [(PFFrameCache *)self _frameAtIndex:a3 allowLazy:0];
}

- (PFFrameCache)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4 useGlobalDecodeQueue:(BOOL)a5
{
  BOOL v5 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PFFrameCache;
  CFDictionaryRef v8 = [(PFFrameCache *)&v19 init];
  if (v8)
  {
    v8->_gifSource = (CGImageSource *)CFRetain(a3);
    v8->_frameCount = CGImageSourceGetCount(a3);
    BOOL v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    frameCache = v8->_frameCache;
    v8->_frameCache = v9;

    v8->_fullCachingCost = pf_estimateFullAnimatedImageMemoryCost(a3);
    uint64_t v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.PFFrameCache.cacheIsolationQueue", v11);
    cacheIsolationQueue = v8->_cacheIsolationQueue;
    v8->_cacheIsolationQueue = (OS_dispatch_queue *)v12;

    if (v5)
    {
      uint64_t v14 = [(id)objc_opt_class() sharedFrameGenerationQueue];
    }
    else
    {
      uint64_t v14 = (uint64_t)dispatch_queue_create("com.apple.PFFrameCache.frameGenerationQueue", v11);
    }
    frameGenerationQueue = v8->_frameGenerationQueue;
    v8->_frameGenerationQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28E60] indexSet];
    cachedIndexes = v8->_cachedIndexes;
    v8->_cachedIndexes = (NSMutableIndexSet *)v16;

    v8->_cacheStrategy = a4;
    [(PFFrameCache *)v8 _updateIfNeeded];
  }
  return v8;
}

- (PFFrameCache)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4
{
  return [(PFFrameCache *)self initWithImageSource:a3 cachingStrategy:a4 useGlobalDecodeQueue:0];
}

- (PFFrameCache)initWithImageSource:(CGImageSource *)a3
{
  return [(PFFrameCache *)self initWithImageSource:a3 cachingStrategy:2];
}

+ (id)sharedFrameGenerationQueue
{
  if (sharedFrameGenerationQueue_onceToken != -1) {
    dispatch_once(&sharedFrameGenerationQueue_onceToken, &__block_literal_global_5048);
  }
  uint64_t v2 = (void *)sharedFrameGenerationQueue__sharedQueue;

  return v2;
}

void __42__PFFrameCache_sharedFrameGenerationQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PFFrameCache.frameGenerationQueue", v2);
  uint64_t v1 = (void *)sharedFrameGenerationQueue__sharedQueue;
  sharedFrameGenerationQueue__sharedQueue = (uint64_t)v0;
}

@end