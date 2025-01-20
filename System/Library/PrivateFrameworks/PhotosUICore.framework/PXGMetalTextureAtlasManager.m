@interface PXGMetalTextureAtlasManager
- (BOOL)mipmapped;
- (CGSize)thumbnailSize;
- (NSArray)atlasTextures;
- (NSIndexSet)skipRenderSpriteIndexes;
- (NSString)description;
- (OS_dispatch_queue)layoutQueue;
- (PXGColorProgram)colorProgram;
- (PXGMetalTextureAtlasManager)init;
- (PXGMetalTextureAtlasManager)initWithThumbnailSize:(CGSize)a3 pixelFormat:(unint64_t)a4 capacityPerAtlas:(unsigned int)a5 mipmapped:(BOOL)a6 requestQueue:(id)a7 layoutQueue:(id)a8 colorProgram:(id)a9 context:(id)a10;
- (PXGTextureAtlasManagerDelegate)delegate;
- (PXGTextureConverter)textureConverter;
- (unint64_t)pixelFormat;
- (unsigned)capacityPerAtlas;
- (void)_getAtlas:(id *)a3 localThumbnailIndex:(unsigned int *)a4 forGlobalThumbnailIndex:(unsigned int)a5;
- (void)_requestQueue_getNextAvailableAtlas:(id *)a3 thumbnailOffset:(unsigned int *)a4;
- (void)_updateAtlasSpriteIndexSkips;
- (void)addSpriteWithTextureRequestID:(int)a3 thumbnailData:(id)a4 size:(CGSize)a5 bytesPerRow:(unint64_t)a6 contentsRect:(CGRect)a7;
- (void)applyChangeDetails:(id)a3;
- (void)processPendingThumbnailRequestIDsWithHandler:(id)a3;
- (void)pruneUnusedTextures;
- (void)removeSpriteIndex:(unsigned int)a3 atThumbnailIndex:(unsigned int)a4;
- (void)setAtlasTextures:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMipmapped:(BOOL)a3;
- (void)setSkipRenderSpriteIndexes:(id)a3;
- (void)setTextureConverter:(id)a3;
- (void)textureAtlasDidBecomeUnused:(id)a3;
@end

@implementation PXGMetalTextureAtlasManager

uint64_t __76__PXGMetalTextureAtlasManager_processPendingThumbnailRequestIDsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addSpriteWithTextureRequestID:(int)a3 thumbnailData:(id)a4 size:(CGSize)a5 bytesPerRow:(unint64_t)a6 contentsRect:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  double v12 = a5.height;
  double v13 = a5.width;
  uint64_t v14 = *(void *)&a3;
  requestQueue = self->_requestQueue;
  id v17 = a4;
  dispatch_assert_queue_V2(requestQueue);
  int v20 = 0;
  id v19 = 0;
  [(PXGMetalTextureAtlasManager *)self _requestQueue_getNextAvailableAtlas:&v19 thumbnailOffset:&v20];
  id v18 = v19;
  objc_msgSend(v18, "addSpriteWithTextureRequestID:thumbnailData:size:bytesPerRow:contentsRect:", v14, v17, a6, v13, v12, x, y, width, height);
}

- (void)_requestQueue_getNextAvailableAtlas:(id *)a3 thumbnailOffset:(unsigned int *)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__205300;
  v23 = __Block_byref_object_dispose__205301;
  id v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  v7 = [(PXGMetalTextureAtlasManager *)self atlasTextures];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__PXGMetalTextureAtlasManager__requestQueue_getNextAvailableAtlas_thumbnailOffset___block_invoke;
  v14[3] = &unk_1E5DC4998;
  v14[5] = &v19;
  v14[6] = &v15;
  v14[4] = self;
  [v7 enumerateObjectsUsingBlock:v14];
  v8 = [(PXGMetalTextureAtlasManager *)self textureConverter];
  v9 = (void *)v20[5];
  if (!v9 && v8)
  {
    uint64_t v10 = [v8 createAtlasForTextureAtlasManager:self];
    v11 = (void *)v20[5];
    v20[5] = v10;

    [(id)v20[5] setDelegate:self];
    int v12 = [v7 count];
    *((_DWORD *)v16 + 6) = self->_capacityPerAtlas * v12;
    double v13 = [v7 arrayByAddingObject:v20[5]];
    [(PXGMetalTextureAtlasManager *)self setAtlasTextures:v13];

    v9 = (void *)v20[5];
  }
  *a3 = v9;
  *a4 = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (NSArray)atlasTextures
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (PXGTextureConverter)textureConverter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textureConverter);
  return (PXGTextureConverter *)WeakRetained;
}

- (void)setAtlasTextures:(id)a3
{
}

void __83__PXGMetalTextureAtlasManager__requestQueue_getNextAvailableAtlas_thumbnailOffset___block_invoke(void *a1, void *a2, int a3, unsigned char *a4)
{
  id v9 = a2;
  unsigned int v8 = [v9 count];
  if (v8 < [v9 capacity])
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = *(_DWORD *)(a1[4] + 36) * a3;
    *a4 = 1;
  }
}

- (void)setSkipRenderSpriteIndexes:(id)a3
{
  if (self->_skipRenderSpriteIndexes != a3)
  {
    v4 = (NSIndexSet *)[a3 copy];
    skipRenderSpriteIndexes = self->_skipRenderSpriteIndexes;
    self->_skipRenderSpriteIndexes = v4;

    [(PXGMetalTextureAtlasManager *)self _updateAtlasSpriteIndexSkips];
  }
}

- (void)_updateAtlasSpriteIndexSkips
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(PXGMetalTextureAtlasManager *)self atlasTextures];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [(PXGMetalTextureAtlasManager *)self skipRenderSpriteIndexes];
        [v8 setSkipRenderSpriteIndexes:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (NSIndexSet)skipRenderSpriteIndexes
{
  return self->_skipRenderSpriteIndexes;
}

- (void)pruneUnusedTextures
{
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PXGMetalTextureAtlasManager_pruneUnusedTextures__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(requestQueue, block);
}

- (void)applyChangeDetails:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(PXGMetalTextureAtlasManager *)self atlasTextures];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) applyChangeDetails:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  long long v10 = [MEMORY[0x1E4F28D60] indexSet];
  [(PXGMetalTextureAtlasManager *)self setSkipRenderSpriteIndexes:v10];
}

void __50__PXGMetalTextureAtlasManager_pruneUnusedTextures__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) atlasTextures];
  v2 = [v8 lastObject];
  int v3 = [v2 isUnused];

  if (v3)
  {
    id v4 = (void *)[v8 mutableCopy];
    uint64_t v5 = [v8 count];
    if (v5 - 1 >= 0)
    {
      uint64_t v6 = v5;
      while ([v8 count])
      {
        uint64_t v7 = [v8 objectAtIndexedSubscript:--v6];
        if (![v7 isUnused])
        {

          break;
        }
        [v4 removeObjectAtIndex:v6];

        if (v6 <= 0) {
          break;
        }
      }
    }
    [*(id *)(a1 + 32) setAtlasTextures:v4];
  }
}

void __76__PXGMetalTextureAtlasManager_processPendingThumbnailRequestIDsWithHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 36) * a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__PXGMetalTextureAtlasManager_processPendingThumbnailRequestIDsWithHandler___block_invoke_2;
  v5[3] = &unk_1E5DC4948;
  int v7 = v4;
  id v6 = *(id *)(a1 + 40);
  [a2 processPendingThumbnailRequestIDsWithHandler:v5];
}

- (void)processPendingThumbnailRequestIDsWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGMetalTextureAtlasManager *)self layoutQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PXGMetalTextureAtlasManager *)self atlasTextures];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PXGMetalTextureAtlasManager_processPendingThumbnailRequestIDsWithHandler___block_invoke;
  v8[3] = &unk_1E5DC4970;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTextureConverter:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (BOOL)mipmapped
{
  return self->_mipmapped;
}

- (PXGMetalTextureAtlasManager)initWithThumbnailSize:(CGSize)a3 pixelFormat:(unint64_t)a4 capacityPerAtlas:(unsigned int)a5 mipmapped:(BOOL)a6 requestQueue:(id)a7 layoutQueue:(id)a8 colorProgram:(id)a9 context:(id)a10
{
  double width = a3.width;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)PXGMetalTextureAtlasManager;
  uint64_t v19 = [(PXGMetalTextureAtlasManager *)&v26 init];
  if (v19)
  {
    double v20 = 4096.0 / width;
    if (4096.0 / width > (double)a5) {
      double v20 = (double)a5;
    }
    if (!(vcvtpd_s64_f64((double)a5 / (double)(uint64_t)v20) * (uint64_t)v20))
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v19, @"PXGMetalTextureAtlasManager.m", 63, @"Invalid parameter not satisfying: %@", @"capacityPerAtlas > 0" object file lineNumber description];
    }
    uint64_t v21 = [v18 device];

    if (!v21)
    {
      id v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v19, @"PXGMetalTextureAtlasManager.m", 64, @"Invalid parameter not satisfying: %@", @"context.device != nil" object file lineNumber description];
    }
    PXSizeRoundToPixel();
  }

  return 0;
}

- (PXGColorProgram)colorProgram
{
  return self->_colorProgram;
}

- (unsigned)capacityPerAtlas
{
  return self->_capacityPerAtlas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atlasTextures, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_colorProgram, 0);
  objc_destroyWeak((id *)&self->_textureConverter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skipRenderSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
}

- (void)setMipmapped:(BOOL)a3
{
  self->_mipmapped = a3;
}

- (PXGTextureAtlasManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGTextureAtlasManagerDelegate *)WeakRetained;
}

- (void)textureAtlasDidBecomeUnused:(id)a3
{
  uint64_t v4 = [(PXGMetalTextureAtlasManager *)self delegate];
  if (!v4
    || (uint64_t v5 = (void *)v4,
        [(PXGMetalTextureAtlasManager *)self delegate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 textureAtlasManagerShouldPruneUnusedTextures:self],
        v6,
        v5,
        v7))
  {
    [(PXGMetalTextureAtlasManager *)self pruneUnusedTextures];
  }
}

- (void)_getAtlas:(id *)a3 localThumbnailIndex:(unsigned int *)a4 forGlobalThumbnailIndex:(unsigned int)a5
{
  long long v10 = [(PXGMetalTextureAtlasManager *)self atlasTextures];
  unint64_t v11 = [v10 count] * self->_capacityPerAtlas;

  if (v11 <= a5)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXGMetalTextureAtlasManager.m", 211, @"Invalid parameter not satisfying: %@", @"globalThumbnailIndex < self.atlasTextures.count * _capacityPerAtlas" object file lineNumber description];
  }
  unsigned int capacityPerAtlas = self->_capacityPerAtlas;
  uint64_t v13 = a5 / capacityPerAtlas;
  unsigned int v14 = a5 % capacityPerAtlas;
  id v15 = [(PXGMetalTextureAtlasManager *)self atlasTextures];
  id v16 = [v15 objectAtIndexedSubscript:v13];

  id v17 = v16;
  *a3 = v17;
  *a4 = v14;
}

- (void)removeSpriteIndex:(unsigned int)a3 atThumbnailIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  unsigned int v7 = 0;
  id v6 = 0;
  [(PXGMetalTextureAtlasManager *)self _getAtlas:&v6 localThumbnailIndex:&v7 forGlobalThumbnailIndex:*(void *)&a4];
  id v5 = v6;
  [v5 removeSpriteIndex:v4 atThumbnailIndex:v7];
}

- (NSString)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v3 = [(PXGMetalTextureAtlasManager *)self atlasTextures];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v3);
        }
        long long v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v7 += [v10 count];
        unint64_t v11 = [v10 texture];
        v6 += [v11 allocatedSize];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
    double v12 = (double)v6 * 0.0009765625 * 0.0009765625;
  }
  else
  {
    uint64_t v7 = 0;
    double v12 = 0.0;
  }

  uint64_t v13 = NSString;
  v20.receiver = self;
  v20.super_class = (Class)PXGMetalTextureAtlasManager;
  unsigned int v14 = [(PXGMetalTextureAtlasManager *)&v20 description];
  [(PXGMetalTextureAtlasManager *)self thumbnailSize];
  id v15 = NSStringFromCGSize(v28);
  unint64_t v16 = [(PXGMetalTextureAtlasManager *)self pixelFormat];
  id v17 = [(PXGMetalTextureAtlasManager *)self atlasTextures];
  id v18 = [v13 stringWithFormat:@"<%@ thumbnailSize:%@ pixelFormat:%lu count:%ld memory:%.2fMB textureAtlases:%@>", v14, v15, v16, v7, *(void *)&v12, v17];

  return (NSString *)v18;
}

- (PXGMetalTextureAtlasManager)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGMetalTextureAtlasManager.m", 84, @"%s is not available as initializer", "-[PXGMetalTextureAtlasManager init]");

  abort();
}

@end