@interface PXGMetalOffscreenTexturesStore
- (PXGMetalOffscreenTexturesStore)init;
- (id)_queue_checkoutOffscreenTextureWithSize:(id *)a3 pixelFormat:(unint64_t)a4;
- (id)_queue_loadTextureWithSize:(id *)a3 pixelFormat:(unint64_t)a4;
- (id)checkoutOffscreenTextureWithSize:(id *)a3 pixelFormat:(unint64_t)a4;
- (void)_queue_preloadTexturesCount:(int64_t)a3;
- (void)_queue_removeAllTextures;
- (void)_queue_willRenderFrameWithDevice:(id)a3 size:(id *)a4 sampleCount:(int64_t)a5 pixelFormat:(unint64_t)a6 preloadTexturesCount:(int64_t)a7;
- (void)removeAllTextures;
- (void)willRenderFrameWithDevice:(id)a3 size:(id *)a4 sampleCount:(int64_t)a5 pixelFormat:(unint64_t)a6 preloadTexturesCount:(int64_t)a7;
@end

@implementation PXGMetalOffscreenTexturesStore

- (void)willRenderFrameWithDevice:(id)a3 size:(id *)a4 sampleCount:(int64_t)a5 pixelFormat:(unint64_t)a6 preloadTexturesCount:(int64_t)a7
{
  id v13 = a3;
  if (a4->var2 != 1)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXGMetalOffscreenTexturesStore.m", 46, @"Invalid parameter not satisfying: %@", @"size.depth == 1" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__PXGMetalOffscreenTexturesStore_willRenderFrameWithDevice_size_sampleCount_pixelFormat_preloadTexturesCount___block_invoke;
  block[3] = &unk_1E5DCA648;
  block[4] = self;
  id v18 = v13;
  long long v19 = *(_OWORD *)&a4->var0;
  unint64_t var2 = a4->var2;
  int64_t v21 = a5;
  unint64_t v22 = a6;
  int64_t v23 = a7;
  id v15 = v13;
  dispatch_async(queue, block);
}

- (PXGMetalOffscreenTexturesStore)init
{
  v14.receiver = self;
  v14.super_class = (Class)PXGMetalOffscreenTexturesStore;
  v2 = [(PXGMetalOffscreenTexturesStore *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photos.metalrenderer-offscreenCache", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    queue_loadedTextures = v2->_queue_loadedTextures;
    v2->_queue_loadedTextures = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    queue_usedTextures = v2->_queue_usedTextures;
    v2->_queue_usedTextures = v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    queue_aliveTextures = v2->_queue_aliveTextures;
    v2->_queue_aliveTextures = (NSHashTable *)v11;
  }
  return v2;
}

uint64_t __110__PXGMetalOffscreenTexturesStore_willRenderFrameWithDevice_size_sampleCount_pixelFormat_preloadTexturesCount___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 88);
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 64);
  return objc_msgSend(v2, "_queue_willRenderFrameWithDevice:size:sampleCount:pixelFormat:preloadTexturesCount:", v1, &v7, v5, v3, v4);
}

- (void)_queue_willRenderFrameWithDevice:(id)a3 size:(id *)a4 sampleCount:(int64_t)a5 pixelFormat:(unint64_t)a6 preloadTexturesCount:(int64_t)a7
{
  v12 = (MTLDevice *)a3;
  id v13 = v12;
  if (self->_queue_device != v12
    || (self->_queue_size.width == a4->var0 ? (BOOL v14 = self->_queue_size.height == a4->var1) : (BOOL v14 = 0),
        v14 ? (BOOL v15 = self->_queue_size.depth == a4->var2) : (BOOL v15 = 0),
        !v15 || self->_queue_sampleCount != a5 || (queue_device = v12, self->_queue_pixelFormat != a6)))
  {
    [(PXGMetalOffscreenTexturesStore *)self _queue_removeAllTextures];
    queue_device = self->_queue_device;
  }
  self->_queue_device = v13;
  v17 = v13;

  unint64_t var2 = a4->var2;
  *(_OWORD *)&self->_queue_size.width = *(_OWORD *)&a4->var0;
  self->_queue_size.depth = var2;
  self->_queue_sampleCount = a5;
  self->_queue_pixelFormat = a6;
  [(NSMutableSet *)self->_queue_usedTextures removeAllObjects];

  [(PXGMetalOffscreenTexturesStore *)self _queue_preloadTexturesCount:a7];
}

- (void)_queue_preloadTexturesCount:(int64_t)a3
{
  p_queue_size = &self->_queue_size;
  if (*(_OWORD *)&self->_queue_size.width != 0)
  {
    v6 = [off_1E5DA9658 sharedInstance];
    [v6 offscreenTextureMaximumLifeTime];
    double v8 = v7;

    if ([(NSMutableSet *)self->_queue_loadedTextures count] > (unint64_t)a3)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      while ([(NSMutableSet *)self->_queue_loadedTextures count] > (unint64_t)a3)
      {
        v10 = [(NSMutableSet *)self->_queue_loadedTextures anyObject];
        [(NSMutableSet *)self->_queue_loadedTextures removeObject:v10];
        [v9 setObject:v10 forKey:v10];
      }
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__PXGMetalOffscreenTexturesStore__queue_preloadTexturesCount___block_invoke;
      block[3] = &unk_1E5DD36F8;
      id v19 = v9;
      id v13 = v9;
      dispatch_after(v11, queue, block);
    }
    do
    {
      if ([(NSMutableSet *)self->_queue_loadedTextures count] >= (unint64_t)a3) {
        break;
      }
      unint64_t queue_pixelFormat = self->_queue_pixelFormat;
      long long v16 = *(_OWORD *)&p_queue_size->width;
      unint64_t depth = p_queue_size->depth;
      BOOL v15 = [(PXGMetalOffscreenTexturesStore *)self _queue_loadTextureWithSize:&v16 pixelFormat:queue_pixelFormat];
    }
    while (v15);
  }
}

- (void)_queue_removeAllTextures
{
  [(NSMutableSet *)self->_queue_usedTextures removeAllObjects];
  [(NSMutableSet *)self->_queue_loadedTextures removeAllObjects];
  queue_aliveTextures = self->_queue_aliveTextures;
  [(NSHashTable *)queue_aliveTextures removeAllObjects];
}

- (id)_queue_loadTextureWithSize:(id *)a3 pixelFormat:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v7 = self->_queue_aliveTextures;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v12)
        {
          *(_OWORD *)buf = *(_OWORD *)&a3->var0;
          unint64_t var2 = a3->var2;
          if (_textureMatchesSize(v12, buf, a4)
            && (-[NSMutableSet containsObject:](self->_queue_loadedTextures, "containsObject:", v12, (void)v18) & 1) == 0
            && ![(NSMutableSet *)self->_queue_usedTextures containsObject:v12])
          {
            id v16 = v12;
            goto LABEL_23;
          }
        }
      }
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  int v13 = [MEMORY[0x1E4F29060] isMainThread];
  unint64_t var0 = a3->var0;
  if (v13
    && var0 == self->_queue_size.width
    && a3->var1 == self->_queue_size.height
    && a3->var2 == self->_queue_size.depth)
  {
    PXGTungstenGetLog();
  }
  objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a4, var0, a3->var1, 0, (void)v18);
  double v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  [(NSHashTable *)v7 setSampleCount:self->_queue_sampleCount];
  if (self->_queue_sampleCount >= 2) {
    uint64_t v15 = 4;
  }
  else {
    uint64_t v15 = 2;
  }
  [(NSHashTable *)v7 setTextureType:v15];
  [(NSHashTable *)v7 setStorageMode:2];
  [(NSHashTable *)v7 setUsage:7];
  id v16 = (id)[(MTLDevice *)self->_queue_device newTextureWithDescriptor:v7];
  [v16 setLabel:@"PXGMetalRenderer Offscreen"];
  if (!v16) {
    PXGTungstenGetLog();
  }
  [(NSHashTable *)self->_queue_aliveTextures addObject:v16];
LABEL_23:

  [(NSMutableSet *)self->_queue_loadedTextures addObject:v16];
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_device, 0);
  objc_storeStrong((id *)&self->_queue_aliveTextures, 0);
  objc_storeStrong((id *)&self->_queue_usedTextures, 0);
  objc_storeStrong((id *)&self->_queue_loadedTextures, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_queue_checkoutOffscreenTextureWithSize:(id *)a3 pixelFormat:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v7 = self->_queue_loadedTextures;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      long long v15 = *(_OWORD *)&a3->var0;
      unint64_t var2 = a3->var2;
      if (_textureMatchesSize(v12, &v15, a4)
        && ![(NSMutableSet *)self->_queue_usedTextures containsObject:v12])
      {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v13 = v12;

    if (v13) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_10:
  }
  long long v15 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  id v13 = [(PXGMetalOffscreenTexturesStore *)self _queue_loadTextureWithSize:&v15 pixelFormat:a4];
  if (v13) {
LABEL_13:
  }
    [(NSMutableSet *)self->_queue_usedTextures addObject:v13];
  return v13;
}

uint64_t __62__PXGMetalOffscreenTexturesStore__queue_preloadTexturesCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) countLimit];
}

- (void)removeAllTextures
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PXGMetalOffscreenTexturesStore_removeAllTextures__block_invoke;
  block[3] = &unk_1E5DD36F8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__PXGMetalOffscreenTexturesStore_removeAllTextures__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllTextures");
}

- (id)checkoutOffscreenTextureWithSize:(id *)a3 pixelFormat:(unint64_t)a4
{
  if (a3->var2 != 1)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXGMetalOffscreenTexturesStore.m", 53, @"Invalid parameter not satisfying: %@", @"size.depth == 1" object file lineNumber description];
  }
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__245791;
  long long v20 = __Block_byref_object_dispose__245792;
  id v21 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PXGMetalOffscreenTexturesStore_checkoutOffscreenTextureWithSize_pixelFormat___block_invoke;
  block[3] = &unk_1E5DCC550;
  void block[4] = self;
  void block[5] = &v16;
  long long v13 = *(_OWORD *)&a3->var0;
  unint64_t var2 = a3->var2;
  unint64_t v15 = a4;
  dispatch_sync(queue, block);
  id v8 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __79__PXGMetalOffscreenTexturesStore_checkoutOffscreenTextureWithSize_pixelFormat___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v4 = objc_msgSend(v2, "_queue_checkoutOffscreenTextureWithSize:pixelFormat:", &v7, v3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end