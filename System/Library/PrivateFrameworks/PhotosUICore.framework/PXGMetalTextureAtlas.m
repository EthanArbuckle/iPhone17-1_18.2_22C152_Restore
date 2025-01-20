@interface PXGMetalTextureAtlas
+ (unsigned)maxCapacityForThumbnailSize:(CGSize)a3 pixelFormat:(unint64_t)a4;
- (BOOL)containsSpriteIndex:(unsigned int)a3;
- (BOOL)isAtlas;
- (BOOL)isCaptureTexture;
- (BOOL)isOpaque;
- (BOOL)isUnused;
- (BOOL)mipmapped;
- (BOOL)mipmapsDirty;
- (CGImage)imageRepresentation;
- (CGSize)pixelSize;
- (CGSize)thumbnailSize;
- (MTLTexture)chromaTexture;
- (MTLTexture)texture;
- (NSIndexSet)renderedSpriteIndexes;
- (NSIndexSet)skipRenderSpriteIndexes;
- (NSIndexSet)thumbnailIndexesUsedBySprites;
- (NSString)description;
- (PXGColorProgram)colorProgram;
- (PXGMetalTextureAtlas)init;
- (PXGMetalTextureAtlas)initWithThumbnailSize:(CGSize)a3 pixelFormat:(unint64_t)a4 capacity:(unsigned int)a5 mipmapped:(BOOL)a6 colorProgram:(id)a7 context:(id)a8 layoutQueue:(id)a9;
- (PXGMetalTextureAtlasDelegate)delegate;
- (float)alpha;
- (float)thumbnailCropIn;
- (id)getAndClearDirtySpriteIndexesIntersectingSet:(id)a3;
- (int)shaderFlags;
- (int64_t)estimatedByteSize;
- (int64_t)renderPipelineIndex;
- (unint64_t)pixelFormat;
- (unsigned)_syncQueue_checkoutNextThumbnailIndex;
- (unsigned)capacity;
- (unsigned)count;
- (unsigned)presentationType;
- (unsigned)spriteCount;
- (void)_checkinPendingThumbnailIndexesIfNeeded;
- (void)_invalidateRenderedSpriteIndexes;
- (void)_syncQueue_checkinThumbnailIndex:(unsigned int)a3;
- (void)_syncQueue_releaseThumbnailAtIndex:(int64_t)a3;
- (void)_syncQueue_releaseThumbnailsAtIndexes:(id)a3;
- (void)_syncQueue_resizeStorageIfNeeded;
- (void)_syncQueue_retainThumbnailAtIndex:(int64_t)a3;
- (void)_syncQueue_retainThumbnailsAtIndexes:(id)a3;
- (void)addSpriteWithTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4;
- (void)addSpriteWithTextureRequestID:(int)a3 thumbnailData:(id)a4 size:(CGSize)a5 bytesPerRow:(unint64_t)a6 contentsRect:(CGRect)a7;
- (void)applyChangeDetails:(id)a3;
- (void)cleanupAfterRender:(int64_t)a3;
- (void)dealloc;
- (void)enumerateSpriteIndexes:(id)a3;
- (void)getSpriteIndexes:(unsigned int *)a3 maxSpriteCount:(unsigned int)a4;
- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9;
- (void)prepareForRender:(int64_t)a3;
- (void)processPendingTextureRequestIDsWithHandler:(id)a3;
- (void)processPendingThumbnailRequestIDsWithHandler:(id)a3;
- (void)removeSpriteIndex:(unsigned int)a3;
- (void)removeSpriteIndex:(unsigned int)a3 atThumbnailIndex:(unsigned int)a4;
- (void)setDelegate:(id)a3;
- (void)setMipmapsDirty:(BOOL)a3;
- (void)setRenderPipelineIndex:(int64_t)a3;
- (void)setSkipRenderSpriteIndexes:(id)a3;
@end

@implementation PXGMetalTextureAtlas

uint64_t __62__PXGMetalTextureAtlas__syncQueue_releaseThumbnailsAtIndexes___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
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
      result = objc_msgSend(*(id *)(v11 + 32), "_syncQueue_releaseThumbnailAtIndex:", v10++, v12, v13, v14, v15, v16, v17);
      --v9;
    }
    while (v9);
  }
  return result;
}

- (void)_syncQueue_releaseThumbnailAtIndex:(int64_t)a3
{
  if (!--self->_retainCountByThumbnailIndex[a3])
  {
    -[NSMutableIndexSet addIndex:](self->_syncQueue_availableThumbnailIndexes, "addIndex:");
    if (atomic_fetch_add(&self->_count, 0xFFFFu) == 1)
    {
      objc_initWeak(&location, self);
      layoutQueue = self->_layoutQueue;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __59__PXGMetalTextureAtlas__syncQueue_releaseThumbnailAtIndex___block_invoke;
      v5[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v6, &location);
      dispatch_async(layoutQueue, v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __98__PXGMetalTextureAtlas_addSpriteWithTextureRequestID_thumbnailData_size_bytesPerRow_contentsRect___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_syncQueue_checkoutNextThumbnailIndex");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unsigned)_syncQueue_checkoutNextThumbnailIndex
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  atomic_fetch_add(&self->_count, 1u);
  unsigned int v3 = [(NSMutableIndexSet *)self->_syncQueue_availableThumbnailIndexes firstIndex];
  [(NSMutableIndexSet *)self->_syncQueue_availableThumbnailIndexes removeIndex:v3];
  [(PXGMetalTextureAtlas *)self _syncQueue_retainThumbnailAtIndex:v3];
  return v3;
}

- (void)_syncQueue_retainThumbnailAtIndex:(int64_t)a3
{
}

uint64_t __69__PXGMetalTextureAtlas_processPendingThumbnailRequestIDsWithHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 224);
  if (v2 >= 1)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(*(void *)(v3 + 32) + 216) + v4;
      uint64_t v6 = *(unsigned int *)(v5 + 4);
      unsigned int v7 = (*(uint64_t (**)(double))(*(void *)(v3 + 40) + 16))(*(double *)(v5 + 12));
      uint64_t v8 = *(id **)(v3 + 32);
      if (v7 == -1)
      {
        objc_msgSend(v8, "_syncQueue_checkinThumbnailIndex:", v6);
      }
      else
      {
        [v8[15] addIndex:v7];
        [*(id *)(*(void *)(v3 + 32) + 128) addIndex:v7];
        [*(id *)(*(void *)(v3 + 32) + 112) addIndex:v6];
        *(_DWORD *)(*(void *)(*(void *)(v3 + 32) + 136) + 4 * v6) = v7;
      }
      v4 += 20;
      --v2;
    }
    while (v2);
    uint64_t result = [*(id *)(v3 + 32) _invalidateRenderedSpriteIndexes];
    uint64_t v1 = *(void *)(v3 + 32);
  }
  *(void *)(v1 + 224) = 0;
  return result;
}

void __43__PXGMetalTextureAtlas_cleanupAfterRender___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 208);
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  id v6 = [v2 objectForKeyedSubscript:v3];

  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 208);
  uint64_t v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v4 setObject:0 forKeyedSubscript:v5];

  objc_msgSend(*(id *)(a1 + 32), "_syncQueue_releaseThumbnailsAtIndexes:", v6);
}

- (void)_syncQueue_releaseThumbnailsAtIndexes:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__PXGMetalTextureAtlas__syncQueue_releaseThumbnailsAtIndexes___block_invoke;
  v3[3] = &unk_1E5DCD248;
  v3[4] = self;
  [a3 enumerateRangesUsingBlock:v3];
}

- (BOOL)isCaptureTexture
{
  return 0;
}

- (int64_t)renderPipelineIndex
{
  return self->_renderPipelineIndex;
}

- (BOOL)isOpaque
{
  return 1;
}

- (void)setRenderPipelineIndex:(int64_t)a3
{
  self->_renderPipelineIndex = a3;
}

- (PXGColorProgram)colorProgram
{
  return self->_colorProgram;
}

- (MTLTexture)chromaTexture
{
  return 0;
}

- (void)addSpriteWithTextureRequestID:(int)a3 thumbnailData:(id)a4 size:(CGSize)a5 bytesPerRow:(unint64_t)a6 contentsRect:(CGRect)a7
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  double v9 = a5.height;
  double v10 = a5.width;
  id v12 = a4;
  [(PXGMetalTextureAtlas *)self thumbnailCropIn];
  float v14 = v13;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  int v55 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PXGMetalTextureAtlas_addSpriteWithTextureRequestID_thumbnailData_size_bytesPerRow_contentsRect___block_invoke;
  block[3] = &unk_1E5DD0588;
  block[4] = self;
  block[5] = &v52;
  dispatch_sync(syncQueue, block);
  double v16 = self->_thumbnailSize.width;
  double v17 = self->_thumbnailSize.height;
  uint64_t v18 = *((unsigned int *)v53 + 6);
  int64_t cols = self->_cols;
  unint64_t v20 = [(MTLTexture *)self->_texture width];
  unint64_t v21 = [(MTLTexture *)self->_texture height];
  [(PXGMetalTextureAtlas *)self alpha];
  v22.f64[0] = width;
  v22.f64[1] = height;
  float64x2_t v23 = vsubq_f64(v22, (float64x2_t)vdupq_lane_s64(COERCE__INT64((float)(v14 + v14)), 0));
  *(float *)v22.f64 = v16;
  float v24 = v17;
  *(float *)v22.f64 = *(float *)v22.f64 * (float)(v18 % cols);
  *((float *)v22.f64 + 1) = v24 * (float)(v18 / cols);
  float32x2_t v25 = vcvt_f32_f64(v23);
  v26.f32[0] = x + v14;
  *(float *)v23.f64 = y + v14;
  v26.i32[1] = LODWORD(v23.f64[0]);
  *(float32x2_t *)&v23.f64[0] = vadd_f32(v26, *(float32x2_t *)&v22.f64[0]);
  long long v27 = *(_OWORD *)off_1E5DAAFA0;
  v26.f32[0] = (float)v20;
  v26.f32[1] = (float)v21;
  v28 = &self->_guarded_textureInfoByThumbnailIndex[16 * (unint64_t)*((unsigned int *)v53 + 6)];
  *(float64_t *)&v28->var0 = v23.f64[0];
  *(float32x2_t *)&v28[2].var0 = v25;
  *(float32x2_t *)&v28[4].var0 = v26;
  *(void *)&v28[6].var0 = 0;
  *(_OWORD *)&v28[8].var0 = v27;
  v28[12].var0 = v29;
  *(void *)&v28[13].var0 = 0;
  v28[15].var0 = 0.0;
  int64_t v30 = self->_cols;
  uint64_t v31 = *((unsigned int *)v53 + 6);
  CGSize thumbnailSize = self->_thumbnailSize;
  metalRenderContext = self->_metalRenderContext;
  id v33 = v12;
  uint64_t v34 = [v33 bytes];
  texture = self->_texture;
  uint64_t v36 = [v33 length];
  v37.i64[0] = v31 % v30;
  v37.i64[1] = v31 / v30;
  uint64x2_t v46 = vcvtq_u64_f64(vmulq_f64((float64x2_t)thumbnailSize, vcvtq_f64_s64(v37)));
  uint64_t v47 = 0;
  unint64_t v48 = (unint64_t)v10;
  unint64_t v49 = (unint64_t)v9;
  uint64_t v50 = 1;
  [(PXGMetalRenderContext *)metalRenderContext fastCopyBytes:v34 toTexture:texture inRegion:&v46 length:v36 bytesPerRow:a6 bytesPerImage:0];
  v38 = self->_syncQueue;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __98__PXGMetalTextureAtlas_addSpriteWithTextureRequestID_thumbnailData_size_bytesPerRow_contentsRect___block_invoke_2;
  v44[3] = &unk_1E5DC49C0;
  int v45 = a3;
  v44[4] = self;
  v44[5] = &v52;
  v44[6] = v25;
  dispatch_sync(v38, v44);
  _Block_object_dispose(&v52, 8);
}

- (float)alpha
{
  return 1.0;
}

- (float)thumbnailCropIn
{
  return self->_thumbnailCropIn;
}

- (void)setDelegate:(id)a3
{
}

double __98__PXGMetalTextureAtlas_addSpriteWithTextureRequestID_thumbnailData_size_bytesPerRow_contentsRect___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 224);
  *(void *)(v2 + 224) = v3 + 1;
  objc_msgSend(*(id *)(a1 + 32), "_syncQueue_resizeStorageIfNeeded");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 216) + 20 * v3;
  int v5 = *(_DWORD *)(a1 + 56);
  int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unsigned int add = atomic_fetch_add(PXGMakeNextTextureDeliveryOrderID::lastRequestID, 1u);
  double result = *(double *)(a1 + 48);
  *(_DWORD *)uint64_t v4 = v5;
  *(_DWORD *)(v4 + 4) = v6;
  *(_DWORD *)(v4 + 8) = add;
  *(double *)(v4 + 12) = result;
  return result;
}

- (void)_syncQueue_resizeStorageIfNeeded
{
  unint64_t syncQueue_pendingThumbnailRequestInfoCount = self->_syncQueue_pendingThumbnailRequestInfoCount;
  syncQueue_pendingThumbnailRequestInfoCapacitdouble y = self->_syncQueue_pendingThumbnailRequestInfoCapacity;
  if (syncQueue_pendingThumbnailRequestInfoCount > syncQueue_pendingThumbnailRequestInfoCapacity)
  {
    if (!syncQueue_pendingThumbnailRequestInfoCapacity)
    {
      syncQueue_pendingThumbnailRequestInfoCapacitdouble y = 10;
      self->_syncQueue_pendingThumbnailRequestInfoCapacitdouble y = 10;
      unint64_t syncQueue_pendingThumbnailRequestInfoCount = self->_syncQueue_pendingThumbnailRequestInfoCount;
    }
    if (syncQueue_pendingThumbnailRequestInfoCount > syncQueue_pendingThumbnailRequestInfoCapacity)
    {
      do
      {
        self->_syncQueue_pendingThumbnailRequestInfoCapacitdouble y = 2 * syncQueue_pendingThumbnailRequestInfoCapacity;
        BOOL v4 = self->_syncQueue_pendingThumbnailRequestInfoCount > 2 * syncQueue_pendingThumbnailRequestInfoCapacity;
        syncQueue_pendingThumbnailRequestInfoCapacity *= 2;
      }
      while (v4);
    }
    _PXGArrayResize();
  }
}

- (unsigned)count
{
  return (__int16)atomic_load((unsigned __int16 *)&self->_count);
}

- (unsigned)capacity
{
  return self->_capacity;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (int)shaderFlags
{
  return 0;
}

- (BOOL)isAtlas
{
  return 1;
}

- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9
{
  if ([(PXGMetalTextureAtlas *)self spriteCount] < a9)
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXGMetalTextureAtlasManager.m", 625, @"Invalid parameter not satisfying: %@", @"count <= self.spriteCount" object file lineNumber description];
  }
  guarded_textureInfoByThumbnailIndedouble x = self->_guarded_textureInfoByThumbnailIndex;
  spriteIndexByThumbnailIndedouble x = self->_spriteIndexByThumbnailIndex;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  thumbnailIndexesUsedBySprites = self->_thumbnailIndexesUsedBySprites;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __111__PXGMetalTextureAtlas_getTextureInfos_forSpriteIndexes_geometries_spriteStyles_spriteInfos_screenScale_count___block_invoke;
  v18[3] = &unk_1E5DC4A58;
  v18[4] = v20;
  v18[5] = a4;
  v18[6] = spriteIndexByThumbnailIndex;
  v18[7] = a3;
  v18[8] = guarded_textureInfoByThumbnailIndex;
  unsigned int v19 = a9;
  [(NSMutableIndexSet *)thumbnailIndexesUsedBySprites enumerateRangesUsingBlock:v18];
  _Block_object_dispose(v20, 8);
}

- (void)getSpriteIndexes:(unsigned int *)a3 maxSpriteCount:(unsigned int)a4
{
  if ([(PXGMetalTextureAtlas *)self spriteCount] < a4)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXGMetalTextureAtlasManager.m", 595, @"Invalid parameter not satisfying: %@", @"maxSpriteCount <= self.spriteCount" object file lineNumber description];
  }
  spriteIndexByThumbnailIndedouble x = self->_spriteIndexByThumbnailIndex;
  double v9 = [(PXGMetalTextureAtlas *)self renderedSpriteIndexes];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  thumbnailIndexesUsedBySprites = self->_thumbnailIndexesUsedBySprites;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__PXGMetalTextureAtlas_getSpriteIndexes_maxSpriteCount___block_invoke;
  v13[3] = &unk_1E5DC4A08;
  double v16 = spriteIndexByThumbnailIndex;
  id v11 = v9;
  double v17 = a3;
  id v14 = v11;
  uint64_t v15 = v19;
  unsigned int v18 = a4;
  [(NSMutableIndexSet *)thumbnailIndexesUsedBySprites enumerateRangesUsingBlock:v13];

  _Block_object_dispose(v19, 8);
}

- (unsigned)spriteCount
{
  uint64_t v2 = [(PXGMetalTextureAtlas *)self renderedSpriteIndexes];
  unsigned int v3 = [v2 count];

  return v3;
}

- (NSIndexSet)renderedSpriteIndexes
{
  renderedSpriteIndexes = self->_renderedSpriteIndexes;
  if (!renderedSpriteIndexes)
  {
    BOOL v4 = (NSIndexSet *)[(NSMutableIndexSet *)self->_spriteIndexesUsedBySprites mutableCopy];
    int v5 = [(PXGMetalTextureAtlas *)self skipRenderSpriteIndexes];
    [(NSIndexSet *)v4 removeIndexes:v5];

    int v6 = self->_renderedSpriteIndexes;
    self->_renderedSpriteIndexes = v4;

    renderedSpriteIndexes = self->_renderedSpriteIndexes;
  }
  return renderedSpriteIndexes;
}

- (NSIndexSet)skipRenderSpriteIndexes
{
  return self->_skipRenderSpriteIndexes;
}

- (void)_invalidateRenderedSpriteIndexes
{
  renderedSpriteIndexes = self->_renderedSpriteIndexes;
  self->_renderedSpriteIndexes = 0;
}

- (void)setSkipRenderSpriteIndexes:(id)a3
{
  if (self->_skipRenderSpriteIndexes != a3)
  {
    BOOL v4 = (NSIndexSet *)[a3 copy];
    skipRenderSpriteIndexes = self->_skipRenderSpriteIndexes;
    self->_skipRenderSpriteIndexes = v4;

    [(PXGMetalTextureAtlas *)self _invalidateRenderedSpriteIndexes];
  }
}

- (void)applyChangeDetails:(id)a3
{
  layoutQueue = self->_layoutQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(layoutQueue);
  [v5 applyToSpriteIndexes:self->_spriteIndexByThumbnailIndex atIndexes:self->_thumbnailIndexesUsedBySprites];
  int v6 = [v5 indexSetAfterApplyingChangeDetails:self->_spriteIndexesUsedBySprites];
  unsigned int v7 = (NSMutableIndexSet *)[v6 mutableCopy];
  spriteIndexesUsedBySprites = self->_spriteIndexesUsedBySprites;
  self->_spriteIndexesUsedBySprites = v7;

  double v9 = [v5 indexSetAfterApplyingChangeDetails:self->_dirtySpriteIndexes];

  double v10 = (NSMutableIndexSet *)[v9 mutableCopy];
  dirtySpriteIndexes = self->_dirtySpriteIndexes;
  self->_dirtySpriteIndexes = v10;

  id v12 = [MEMORY[0x1E4F28D60] indexSet];
  [(PXGMetalTextureAtlas *)self setSkipRenderSpriteIndexes:v12];

  [(PXGMetalTextureAtlas *)self _invalidateRenderedSpriteIndexes];
}

- (void)cleanupAfterRender:(int64_t)a3
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PXGMetalTextureAtlas_cleanupAfterRender___block_invoke;
  block[3] = &unk_1E5DD35E0;
  block[4] = self;
  block[5] = a3;
  void block[6] = a2;
  dispatch_async(syncQueue, block);
}

- (void)prepareForRender:(int64_t)a3
{
  int v6 = [(PXGMetalTextureAtlas *)self thumbnailIndexesUsedBySprites];
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__PXGMetalTextureAtlas_prepareForRender___block_invoke;
  v9[3] = &unk_1E5DD05B0;
  int64_t v11 = a3;
  SEL v12 = a2;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(syncQueue, v9);
}

- (NSIndexSet)thumbnailIndexesUsedBySprites
{
  uint64_t v2 = (void *)[(NSMutableIndexSet *)self->_thumbnailIndexesUsedBySprites copy];
  return (NSIndexSet *)v2;
}

uint64_t __61__PXGMetalTextureAtlas__syncQueue_retainThumbnailsAtIndexes___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 < a2 + a3)
  {
    do
    {
      ++*(unsigned char *)(*(void *)(result + 32) + a2++);
      --a3;
    }
    while (a3);
  }
  return result;
}

- (BOOL)isUnused
{
  int v2 = atomic_load((unsigned __int16 *)&self->_count);
  return v2 == 0;
}

- (void)processPendingThumbnailRequestIDsWithHandler:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PXGMetalTextureAtlas_processPendingThumbnailRequestIDsWithHandler___block_invoke;
  block[3] = &unk_1E5DD34C0;
  block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_sync(syncQueue, block);
}

uint64_t __41__PXGMetalTextureAtlas_prepareForRender___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  unsigned int v3 = *(void **)(a1[4] + 208);
  BOOL v4 = [NSNumber numberWithInteger:a1[6]];
  [v3 setObject:v2 forKeyedSubscript:v4];

  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  return objc_msgSend(v5, "_syncQueue_retainThumbnailsAtIndexes:", v6);
}

- (void)_syncQueue_retainThumbnailsAtIndexes:(id)a3
{
  retainCountByThumbnailIndedouble x = self->_retainCountByThumbnailIndex;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PXGMetalTextureAtlas__syncQueue_retainThumbnailsAtIndexes___block_invoke;
  v4[3] = &__block_descriptor_40_e24_v32__0__NSRange_QQ_8_B24l;
  v4[4] = retainCountByThumbnailIndex;
  [a3 enumerateRangesUsingBlock:v4];
}

uint64_t __111__PXGMetalTextureAtlas_getTextureInfos_forSpriteIndexes_geometries_spriteStyles_spriteInfos_screenScale_count___block_invoke(uint64_t result, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2 < a2 + a3)
  {
    uint64_t v4 = *(void *)(result + 32);
    uint64_t v5 = a2 << 6;
    for (uint64_t i = 4 * a2; ; i += 4)
    {
      uint64_t v7 = *(void *)(*(void *)(v4 + 8) + 24);
      if (*(_DWORD *)(*(void *)(result + 48) + i) == *(_DWORD *)(*(void *)(result + 40) + 4 * v7))
      {
        id v8 = (_OWORD *)(*(void *)(result + 56) + (v7 << 6));
        id v9 = (long long *)(*(void *)(result + 64) + v5);
        long long v10 = *v9;
        long long v11 = v9[1];
        long long v12 = v9[3];
        v8[2] = v9[2];
        v8[3] = v12;
        *id v8 = v10;
        v8[1] = v11;
        ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
        uint64_t v4 = *(void *)(result + 32);
        if (*(void *)(*(void *)(v4 + 8) + 24) == *(_DWORD *)(result + 72)) {
          break;
        }
      }
      v5 += 64;
      if (!--a3) {
        return result;
      }
    }
    *a4 = 1;
  }
  return result;
}

uint64_t __56__PXGMetalTextureAtlas_getSpriteIndexes_maxSpriteCount___block_invoke(uint64_t result, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2 < a2 + a3)
  {
    uint64_t v17 = v9;
    uint64_t v18 = v8;
    uint64_t v19 = v7;
    uint64_t v20 = v6;
    uint64_t v21 = v5;
    uint64_t v22 = v4;
    uint64_t v23 = v10;
    uint64_t v24 = v11;
    uint64_t v13 = a3;
    uint64_t v14 = result;
    for (uint64_t i = 4 * a2; ; i += 4)
    {
      unsigned int v16 = *(_DWORD *)(*(void *)(v14 + 48) + i);
      double result = objc_msgSend(*(id *)(v14 + 32), "containsIndex:", v16, v17, v18, v19, v20, v21, v22, v23, v24);
      if (result)
      {
        *(_DWORD *)(*(void *)(v14 + 56) + 4 * (*(void *)(*(void *)(*(void *)(v14 + 40) + 8) + 24))++) = v16;
        if (*(void *)(*(void *)(*(void *)(v14 + 40) + 8) + 24) == *(_DWORD *)(v14 + 64)) {
          break;
        }
      }
      if (!--v13) {
        return result;
      }
    }
    *a4 = 1;
  }
  return result;
}

+ (unsigned)maxCapacityForThumbnailSize:(CGSize)a3 pixelFormat:(unint64_t)a4
{
}

- (PXGMetalTextureAtlas)initWithThumbnailSize:(CGSize)a3 pixelFormat:(unint64_t)a4 capacity:(unsigned int)a5 mipmapped:(BOOL)a6 colorProgram:(id)a7 context:(id)a8 layoutQueue:(id)a9
{
  double height = a3.height;
  double width = a3.width;
  id v16 = a7;
  id v17 = a8;
  id v25 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PXGMetalTextureAtlas;
  uint64_t v18 = [(PXGImageTexture *)&v26 init];
  if (v18)
  {
    if (!a5)
    {
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, v18, @"PXGMetalTextureAtlasManager.m", 297, @"Invalid parameter not satisfying: %@", @"capacity > 0" object file lineNumber description];
    }
    uint64_t v19 = [v17 device];

    if (!v19)
    {
      uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, v18, @"PXGMetalTextureAtlasManager.m", 298, @"Invalid parameter not satisfying: %@", @"context.device != nil" object file lineNumber description];
    }
    if (width > 4096.0)
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v18, @"PXGMetalTextureAtlasManager.m", 299, @"Invalid parameter not satisfying: %@", @"thumbnailSize.width <= kMaxTextureWidth" object file lineNumber description];
    }
    if (height > 4096.0)
    {
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v18, @"PXGMetalTextureAtlasManager.m", 300, @"Invalid parameter not satisfying: %@", @"thumbnailSize.height <= kMaxTextureHeight" object file lineNumber description];
    }
    PXSizeRoundToPixel();
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_skipRenderSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_colorProgram, 0);
  objc_storeStrong((id *)&self->_texture, 0);
  objc_storeStrong((id *)&self->_syncQueue_thumbnailsInUseByRenderPass, 0);
  objc_storeStrong((id *)&self->_syncQueue_availableThumbnailIndexes, 0);
  objc_storeStrong((id *)&self->_thumbnailIndexesBeingCheckedIn, 0);
  objc_storeStrong((id *)&self->_thumbnailIndexesPendingCheckin, 0);
  objc_storeStrong((id *)&self->_renderedSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_dirtySpriteIndexes, 0);
  objc_storeStrong((id *)&self->_spriteIndexesUsedBySprites, 0);
  objc_storeStrong((id *)&self->_thumbnailIndexesUsedBySprites, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
}

- (PXGMetalTextureAtlasDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGMetalTextureAtlasDelegate *)WeakRetained;
}

- (void)setMipmapsDirty:(BOOL)a3
{
  self->_mipmapsDirtdouble y = a3;
}

- (BOOL)mipmapsDirty
{
  return self->_mipmapsDirty;
}

- (BOOL)mipmapped
{
  return self->_mipmapped;
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)_syncQueue_checkinThumbnailIndex:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  [(PXGMetalTextureAtlas *)self _syncQueue_releaseThumbnailAtIndex:a3];
}

- (CGSize)pixelSize
{
  double v3 = (double)(unint64_t)[(MTLTexture *)self->_texture width];
  double v4 = (double)(unint64_t)[(MTLTexture *)self->_texture height];
  double v5 = v3;
  result.double height = v4;
  result.double width = v5;
  return result;
}

- (CGImage)imageRepresentation
{
  return 0;
}

- (unsigned)presentationType
{
  return 0;
}

- (int64_t)estimatedByteSize
{
  return [(MTLTexture *)self->_texture allocatedSize];
}

- (void)removeSpriteIndex:(unsigned int)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(void *)&a3);
  uint64_t v6 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"PXGMetalTextureAtlasManager.m", 663, @"%@ is not available on %@, use the thumbnail variant", v6, self object file lineNumber description];

  abort();
}

- (void)processPendingTextureRequestIDsWithHandler:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"PXGMetalTextureAtlasManager.m", 659, @"%@ is not available on %@, use the thumbnail variant", v7, self object file lineNumber description];

  abort();
}

- (void)addSpriteWithTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(void *)&a3, *(void *)&a4);
  uint64_t v7 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"PXGMetalTextureAtlasManager.m", 655, @"%@ is not available on %@, use the thumbnail variant", v7, self object file lineNumber description];

  abort();
}

- (BOOL)containsSpriteIndex:(unsigned int)a3
{
  double v4 = [(PXGMetalTextureAtlas *)self renderedSpriteIndexes];
  LOBYTE(a3) = [v4 containsIndex:a3];

  return a3;
}

- (void)enumerateSpriteIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGMetalTextureAtlas *)self renderedSpriteIndexes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PXGMetalTextureAtlas_enumerateSpriteIndexes___block_invoke;
  v7[3] = &unk_1E5DC4A30;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateIndexesUsingBlock:v7];
}

uint64_t __47__PXGMetalTextureAtlas_enumerateSpriteIndexes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__PXGMetalTextureAtlas__syncQueue_releaseThumbnailAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained isUnused];

  if (v3)
  {
    id v6 = objc_loadWeakRetained(v1);
    id v4 = [v6 delegate];
    id v5 = objc_loadWeakRetained(v1);
    [v4 textureAtlasDidBecomeUnused:v5];
  }
}

- (void)_checkinPendingThumbnailIndexesIfNeeded
{
  if ([(NSMutableIndexSet *)self->_thumbnailIndexesPendingCheckin count])
  {
    if (!atomic_fetch_or((atomic_uchar *volatile)&self->_isPerformingThumbnailCheckin, 1u))
    {
      int v3 = self->_thumbnailIndexesBeingCheckedIn;
      objc_storeStrong((id *)&self->_thumbnailIndexesBeingCheckedIn, self->_thumbnailIndexesPendingCheckin);
      thumbnailIndexesPendingCheckin = self->_thumbnailIndexesPendingCheckin;
      self->_thumbnailIndexesPendingCheckin = v3;
      id v5 = v3;

      syncQueue = self->_syncQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke;
      block[3] = &unk_1E5DD36F8;
      block[4] = self;
      dispatch_async(syncQueue, block);
    }
  }
}

void __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 168);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_2;
  v8[3] = &unk_1E5DD3010;
  v8[4] = v2;
  [v3 enumerateIndexesUsingBlock:v8];
  [*(id *)(*(void *)(a1 + 32) + 168) removeAllIndexes];
  dispatch_time_t v4 = dispatch_time(0, 5000000);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 96);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_3;
  v7[3] = &unk_1E5DD36F8;
  void v7[4] = v5;
  dispatch_after(v4, v6, v7);
}

uint64_t __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_syncQueue_checkinThumbnailIndex:", a2);
}

void __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_3(uint64_t a1)
{
  atomic_exchange((atomic_uchar *volatile)(*(void *)(a1 + 32) + 176), 0);
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 88);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_4;
  block[3] = &unk_1E5DD36F8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __63__PXGMetalTextureAtlas__checkinPendingThumbnailIndexesIfNeeded__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkinPendingThumbnailIndexesIfNeeded];
}

- (void)removeSpriteIndex:(unsigned int)a3 atThumbnailIndex:(unsigned int)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_layoutQueue);
  [(NSMutableIndexSet *)self->_spriteIndexesUsedBySprites removeIndex:a3];
  [(NSMutableIndexSet *)self->_dirtySpriteIndexes removeIndex:a3];
  [(NSMutableIndexSet *)self->_thumbnailIndexesUsedBySprites removeIndex:a4];
  [(PXGMetalTextureAtlas *)self _invalidateRenderedSpriteIndexes];
  [(NSMutableIndexSet *)self->_thumbnailIndexesPendingCheckin addIndex:a4];
  [(PXGMetalTextureAtlas *)self _checkinPendingThumbnailIndexesIfNeeded];
}

- (id)getAndClearDirtySpriteIndexesIntersectingSet:(id)a3
{
  layoutQueue = self->_layoutQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(layoutQueue);
  id v6 = [(NSMutableIndexSet *)self->_dirtySpriteIndexes px_intersectionWithIndexSet:v5];

  [(NSMutableIndexSet *)self->_dirtySpriteIndexes removeIndexes:v6];
  return v6;
}

- (NSString)description
{
  int v3 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)PXGMetalTextureAtlas;
  dispatch_time_t v4 = [(PXGBaseTexture *)&v15 description];
  [(PXGMetalTextureAtlas *)self thumbnailSize];
  id v5 = NSStringFromCGSize(v17);
  unint64_t v6 = [(PXGMetalTextureAtlas *)self pixelFormat];
  uint64_t v7 = [(PXGMetalTextureAtlas *)self capacity];
  uint64_t v8 = [(PXGMetalTextureAtlas *)self count];
  uint64_t v9 = [(NSMutableIndexSet *)self->_thumbnailIndexesUsedBySprites count];
  unsigned int v10 = [(PXGMetalTextureAtlas *)self count];
  uint64_t v11 = v10 - [(PXGMetalTextureAtlas *)self spriteCount];
  long long v12 = [(PXGMetalTextureAtlas *)self texture];
  uint64_t v13 = [v3 stringWithFormat:@"<%@ thumbnailSize:%@ pixelFormat:%lu capacity:%d count:%d usedBySprites:%lu justRetained:%lu memory:%.2fMB>", v4, v5, v6, v7, v8, v9, v11, (double)(unint64_t)objc_msgSend(v12, "allocatedSize") * 0.0009765625 * 0.0009765625];

  return (NSString *)v13;
}

- (void)dealloc
{
  free(self->_spriteIndexByThumbnailIndex);
  free(self->_retainCountByThumbnailIndex);
  free(self->_guarded_textureInfoByThumbnailIndex);
  free(self->_syncQueue_pendingThumbnailRequestInfo);
  v3.receiver = self;
  v3.super_class = (Class)PXGMetalTextureAtlas;
  [(PXGImageTexture *)&v3 dealloc];
}

- (PXGMetalTextureAtlas)init
{
  dispatch_time_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGMetalTextureAtlasManager.m", 358, @"%s is not available as initializer", "-[PXGMetalTextureAtlas init]");

  abort();
}

@end