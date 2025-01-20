@interface PXGGeneratedLayout
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius;
- (BOOL)useSaliency;
- (CGSize)sizeForItem:(int64_t)a3;
- (NSString)diagnosticDescription;
- (PXGGeneratedLayout)init;
- (PXGLayoutGuide)headerLayoutGuide;
- (PXLayoutGenerator)generator;
- (UIEdgeInsets)padding;
- (double)interitemSpacing;
- (id)newGenerator;
- (id)objectReferenceForSpriteIndex:(unsigned int)a3;
- (int64_t)defaultSpriteTag;
- (int64_t)keyItemIndex;
- (int64_t)keyItemSpriteTag;
- (unsigned)mediaKind;
- (void)_resizeGeometryBufferForSpriteCount:(int64_t)a3;
- (void)_updateContentSize;
- (void)_updateGenerator;
- (void)_updateSprites;
- (void)dealloc;
- (void)didApplySpriteChangeDetails:(id)a3;
- (void)displayScaleDidChange;
- (void)enumerateItemsInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)getSpriteZPosition:(float *)a3 clippingRect:(CGRect *)a4 forSpriteKind:(int64_t)a5;
- (void)metricsDidChange;
- (void)paddingDidChange;
- (void)referenceSizeDidChange;
- (void)setCornerRadius:(id)a3;
- (void)setDefaultSpriteTag:(int64_t)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setKeyItemIndex:(int64_t)a3;
- (void)setKeyItemSpriteTag:(int64_t)a3;
- (void)setMediaKind:(unsigned __int8)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setUseSaliency:(BOOL)a3;
- (void)update;
@end

@implementation PXGGeneratedLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_generator, 0);
}

- (PXGLayoutGuide)headerLayoutGuide
{
  return self->_headerLayoutGuide;
}

- (int64_t)keyItemSpriteTag
{
  return self->_keyItemSpriteTag;
}

- (int64_t)defaultSpriteTag
{
  return self->_defaultSpriteTag;
}

- (void)setCornerRadius:(id)a3
{
  self->_cornerRadius.var0.var0.topLeft = v3;
  self->_cornerRadius.var0.var0.topRight = v4;
  self->_cornerRadius.var0.var0.bottomLeft = v5;
  self->_cornerRadius.var0.var0.bottomRight = v6;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (BOOL)useSaliency
{
  return self->_useSaliency;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

- (int64_t)keyItemIndex
{
  return self->_keyItemIndex;
}

- (NSString)diagnosticDescription
{
  v17.receiver = self;
  v17.super_class = (Class)PXGGeneratedLayout;
  float v3 = [(PXGLayout *)&v17 diagnosticDescription];
  [(PXGLayout *)self referenceSize];
  uint64_t v5 = v4;
  [(PXGLayout *)self referenceSize];
  uint64_t v7 = v6;
  [(PXGGeneratedLayout *)self padding];
  v8 = NSStringFromUIEdgeInsets(v19);
  int64_t v9 = [(PXGItemsLayout *)self numberOfItems];
  [(PXGGeneratedLayout *)self interitemSpacing];
  uint64_t v11 = v10;
  [(PXGLayout *)self displayScale];
  uint64_t v13 = v12;
  v14 = [(PXLayoutGenerator *)self->_generator diagnosticDescription];
  objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", @"; size: {%.3f, %.3f}; padding: %@; items: %li; interItemSpacing: %.3f; screenScale: %.3f; generator: %@",
    v5,
    v7,
    v8,
    v9,
    v11,
    v13,
  v15 = v14);

  return (NSString *)v15;
}

- (CGSize)sizeForItem:(int64_t)a3
{
  uint64_t v4 = [(PXGGeneratedLayout *)self generator];
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  objc_msgSend(v4, "getGeometries:inRange:withKind:", &v9, a3, 1, 0);
  double v5 = *((double *)&v10 + 1);
  double v6 = *(double *)&v11;

  double v7 = v5;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_updateSprites
{
  uint64_t v4 = [(PXGGeneratedLayout *)self generator];
  int64_t v5 = [(PXGItemsLayout *)self numberOfItems];
  unsigned int v6 = [(PXGLayout *)self numberOfSprites];
  if ([(PXGItemsLayout *)self numberOfItems] != v6)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PXGGeneratedLayout.m", 213, @"Invalid parameter not satisfying: %@", @"self.numberOfSprites == self.numberOfItems" object file lineNumber description];
  }
  [v4 setItemCount:v5];
  [(PXGGeneratedLayout *)self _resizeGeometryBufferForSpriteCount:v5];
  objc_msgSend(v4, "getGeometries:inRange:withKind:", self->_generatorGeometryBuffer, 0, v5, 0);
  v31 = v4;
  uint64_t v7 = [v4 cornerSpriteIndexes];
  uint64_t v29 = v8;
  uint64_t v30 = v7;
  self->_isUpdatingSprites = 1;
  unsigned __int8 v9 = [(PXGGeneratedLayout *)self mediaKind];
  long long v10 = [(PXGItemsLayout *)self delegate];
  if ([(PXGItemsLayout *)self delegateRespondsTo:1024]) {
    long long v11 = v10;
  }
  else {
    long long v11 = 0;
  }
  id v12 = v11;
  if ([(PXGItemsLayout *)self delegateRespondsTo:256]) {
    long long v13 = v10;
  }
  else {
    long long v13 = 0;
  }
  id v14 = v13;
  long long v15 = [(PXGItemsLayout *)self insetDelegate];
  [(PXGLayout *)self displayScale];
  float v17 = v16;
  int64_t v18 = [(PXGGeneratedLayout *)self keyItemIndex];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __36__PXGGeneratedLayout__updateSprites__block_invoke;
  v33[3] = &unk_1E5DB9BE8;
  v33[4] = self;
  id v19 = v10;
  id v34 = v19;
  int64_t v38 = v18;
  id v20 = v14;
  id v35 = v20;
  id v21 = v15;
  id v36 = v21;
  id v22 = v12;
  id v37 = v22;
  unsigned __int8 v43 = v9;
  float v39 = v17;
  int v40 = v5;
  uint64_t v41 = v30;
  uint64_t v42 = v29;
  [(PXGLayout *)self modifySpritesInRange:v5 << 32 state:v33];
  if (v5) {
    PXRectWithCenterAndSize();
  }
  uint64_t v23 = *MEMORY[0x1E4F1DB20];
  uint64_t v24 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
  uint64_t v25 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
  uint64_t v26 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  v27 = [(PXGGeneratedLayout *)self headerLayoutGuide];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __36__PXGGeneratedLayout__updateSprites__block_invoke_3;
  v32[3] = &unk_1E5DB9C10;
  v32[5] = v23;
  v32[6] = v24;
  v32[7] = v25;
  v32[8] = v26;
  v32[4] = self;
  [v27 performChanges:v32];

  self->_isUpdatingSprites = 0;
  [(PXGGeneratedLayout *)self spritesDidUpdate];
}

void __36__PXGGeneratedLayout__updateSprites__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v18 = a5;
  int v5 = HIDWORD(a2);
  uint64_t v7 = 0;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int8x16_t v30 = *(int8x16_t *)off_1E5DAAF30;
  char v8 = 1;
  long long v28 = *((_OWORD *)off_1E5DAAF90 + 7);
  long long v29 = *((_OWORD *)off_1E5DAAF90 + 6);
  long long v26 = *((_OWORD *)off_1E5DAAF90 + 9);
  long long v27 = *((_OWORD *)off_1E5DAAF90 + 8);
  long long v24 = *((_OWORD *)off_1E5DAAF90 + 3);
  long long v25 = *((_OWORD *)off_1E5DAAF90 + 2);
  long long v22 = *((_OWORD *)off_1E5DAAF90 + 5);
  long long v23 = *((_OWORD *)off_1E5DAAF90 + 4);
  long long v20 = *((_OWORD *)off_1E5DAAF90 + 1);
  long long v21 = *(_OWORD *)off_1E5DAAF90;
  unsigned __int8 v9 = (float64x2_t *)MEMORY[0x1E4F1DB20];
  do
  {
    char v10 = v8;
    float64x2_t v11 = v9[1];
    float64x2_t v33 = *v9;
    float64x2_t v34 = v11;
    objc_msgSend(*(id *)(a1 + 32), "getSpriteZPosition:clippingRect:forSpriteKind:", (char *)&v35[20] + 4 * v7 + 8, &v33, v7, v18);
    id v12 = &v35[10 * v7];
    v12[6] = v29;
    v12[7] = v28;
    v12[8] = v27;
    v12[9] = v26;
    v12[2] = v25;
    v12[3] = v24;
    v12[4] = v23;
    v12[5] = v22;
    *id v12 = v21;
    v12[1] = v20;
    v37.origin = (CGPoint)v33;
    v37.size = (CGSize)v34;
    BOOL IsNull = CGRectIsNull(v37);
    char v8 = 0;
    int8x16_t v14 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v33), v34);
    if (IsNull) {
      unsigned int v15 = -1;
    }
    else {
      unsigned int v15 = 0;
    }
    *(int8x16_t *)((char *)v12 + 20) = vbslq_s8((int8x16_t)vdupq_n_s32(v15), v30, v14);
    uint64_t v7 = 1;
  }
  while ((v10 & 1) != 0);
  *(void *)&v33.f64[0] = [*(id *)(a1 + 32) defaultSpriteTag];
  *(void *)&v33.f64[1] = [*(id *)(a1 + 32) keyItemSpriteTag];
  if (v5) {
    PXSizeGetAspectRatio();
  }
  if ([*(id *)(a1 + 32) delegateRespondsTo:32])
  {
    double v16 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v16, "itemsLayout:updateTagsInSpriteInfos:forItemsInRange:", *(void *)(a1 + 32), v18, 0, *(unsigned int *)(a1 + 84));
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PXGGeneratedLayout__updateSprites__block_invoke_2;
  aBlock[3] = &unk_1E5DB9BC0;
  int v32 = *(_DWORD *)(a1 + 84);
  aBlock[4] = *(void *)(a1 + 32);
  aBlock[5] = a4;
  float v17 = _Block_copy(aBlock);
  (*((void (**)(void *, void, void))v17 + 2))(v17, 0, *(unsigned int *)(a1 + 88));
  (*((void (**)(void *, uint64_t, void))v17 + 2))(v17, 1, *(unsigned int *)(a1 + 92));
  (*((void (**)(void *, uint64_t, void))v17 + 2))(v17, 2, *(unsigned int *)(a1 + 96));
  (*((void (**)(void *, uint64_t, void))v17 + 2))(v17, 3, *(unsigned int *)(a1 + 100));
}

uint64_t __36__PXGGeneratedLayout__updateSprites__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRect:inLayout:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

float32x4_t __36__PXGGeneratedLayout__updateSprites__block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (*(_DWORD *)(a1 + 48) > a3)
  {
    uint64_t v7 = a1 + 32;
    unsigned int v6 = *(void **)(a1 + 32);
    float32x4_t v15 = *(float32x4_t *)(*(void *)(v7 + 8) + 160 * a3 + 36);
    [v6 cornerRadius];
    v14[0] = v8;
    v14[1] = v9;
    v14[2] = v10;
    v14[3] = v11;
    v15.i32[a2] = v14[a2];
    uint64_t v12 = *(void *)(a1 + 40) + 160 * a3;
    float32x4_t result = vmaxnmq_f32(v15, *(float32x4_t *)(v12 + 36));
    *(float32x4_t *)(v12 + 36) = result;
  }
  return result;
}

- (void)_resizeGeometryBufferForSpriteCount:(int64_t)a3
{
  int64_t generatorGeometryBufferCount = self->_generatorGeometryBufferCount;
  if (generatorGeometryBufferCount < a3)
  {
    if (generatorGeometryBufferCount)
    {
      do
        generatorGeometryBufferCount *= 2;
      while (generatorGeometryBufferCount < a3);
    }
    else
    {
      int64_t generatorGeometryBufferCount = a3;
    }
    self->_int64_t generatorGeometryBufferCount = generatorGeometryBufferCount;
    _PXGArrayResize();
  }
}

- (void)_updateContentSize
{
  id v3 = [(PXGGeneratedLayout *)self generator];
  [v3 size];
  -[PXGLayout setContentSize:](self, "setContentSize:");
}

- (void)_updateGenerator
{
  id v3 = [(PXGGeneratedLayout *)self newGenerator];
  generator = self->_generator;
  self->_generator = v3;
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      int v8 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout update]"];
      [v7 handleFailureInFunction:v8, @"PXGGeneratedLayout.m", 170, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGGeneratedLayout *)self _updateGenerator];
      if (!p_updateFlags->isPerformingUpdate)
      {
        long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
        int8x16_t v14 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout update]"];
        [v13 handleFailureInFunction:v14, @"PXGGeneratedLayout.m", 174, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXGGeneratedLayout *)self _updateContentSize];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      int v9 = [MEMORY[0x1E4F28B00] currentHandler];
      int v10 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXGGeneratedLayout.m", 177, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXGGeneratedLayout *)self _updateSprites];
      [(PXGItemsLayout *)self invalidateStylableType:1];
      unint64_t v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      int v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout update]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXGGeneratedLayout.m", 181, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXGGeneratedLayout;
  [(PXGItemsLayout *)&v15 update];
}

- (PXLayoutGenerator)generator
{
  generator = self->_generator;
  if (!generator)
  {
    uint64_t v4 = [(PXGGeneratedLayout *)self newGenerator];
    unint64_t v5 = self->_generator;
    self->_generator = v4;

    generator = self->_generator;
  }
  return generator;
}

- (void)setUseSaliency:(BOOL)a3
{
  if (self->_useSaliency != a3)
  {
    self->_useSaliency = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 7;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 7) != 0)
      {
        unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout setUseSaliency:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGeneratedLayout.m", 155, @"invalidating %lu after it already has been updated", 7);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 7;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setInteritemSpacing:(double)a3
{
  if (self->_interitemSpacing != a3)
  {
    self->_interitemSpacing = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 7;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 7) != 0)
      {
        unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout setInteritemSpacing:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGeneratedLayout.m", 147, @"invalidating %lu after it already has been updated", 7);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 7;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
}

- (void)setKeyItemSpriteTag:(int64_t)a3
{
  if (self->_keyItemSpriteTag != a3)
  {
    self->_keyItemSpriteTag = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout setKeyItemSpriteTag:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGeneratedLayout.m", 131, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setDefaultSpriteTag:(int64_t)a3
{
  if (self->_defaultSpriteTag != a3)
  {
    self->_defaultSpriteTag = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout setDefaultSpriteTag:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGeneratedLayout.m", 123, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setMediaKind:(unsigned __int8)a3
{
  if (self->_mediaKind != a3)
  {
    self->_mediaKind = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout setMediaKind:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGeneratedLayout.m", 115, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setKeyItemIndex:(int64_t)a3
{
  if (self->_keyItemIndex != a3)
  {
    self->_keyItemIndex = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 7;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 7) != 0)
      {
        unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout setKeyItemIndex:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGeneratedLayout.m", 107, @"invalidating %lu after it already has been updated", 7);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 7;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)didApplySpriteChangeDetails:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGGeneratedLayout;
  [(PXGLayout *)&v10 didApplySpriteChangeDetails:v4];
  if (!self->_isUpdatingSprites
    && ![(PXGLayout *)self isUpdatingSpriteStyling]
    && (!v4 || [v4 hasAnyChanges]))
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_10:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 7;
        goto LABEL_11;
      }
LABEL_9:
      if ((self->_updateFlags.updated & 7) != 0)
      {
        int v8 = [MEMORY[0x1E4F28B00] currentHandler];
        int v9 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout didApplySpriteChangeDetails:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGGeneratedLayout.m", 98, @"invalidating %lu after it already has been updated", 7);

        abort();
      }
      goto LABEL_10;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_9;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 7;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_11:
}

- (void)paddingDidChange
{
  [(PXGLayout *)self setNeedsUpdate];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 7;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 7) != 0)
    {
      unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout paddingDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGeneratedLayout.m", 92, @"invalidating %lu after it already has been updated", 7);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 7;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)metricsDidChange
{
  [(PXGLayout *)self setNeedsUpdate];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 7;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 7) != 0)
    {
      unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout metricsDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGeneratedLayout.m", 87, @"invalidating %lu after it already has been updated", 7);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 7;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGeneratedLayout;
  [(PXGLayout *)&v8 displayScaleDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 5;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 5) != 0)
    {
      unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout displayScaleDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGeneratedLayout.m", 82, @"invalidating %lu after it already has been updated", 5);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 5;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)referenceSizeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGeneratedLayout;
  [(PXGLayout *)&v8 referenceSizeDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 7;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 7) != 0)
    {
      unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGeneratedLayout referenceSizeDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGeneratedLayout.m", 77, @"invalidating %lu after it already has been updated", 7);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 7;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = [(PXGItemsLayout *)self delegate];
  unint64_t v6 = [v5 generatedLayout:self objectReferenceAtIndex:v3];

  return v6;
}

- (void)enumerateItemsInRect:(CGRect)a3 usingBlock:(id)a4
{
  id v5 = a4;
  if (self->_generatorGeometryBufferCount >= 1) {
    PXRectWithCenterAndSize();
  }
}

- (void)getSpriteZPosition:(float *)a3 clippingRect:(CGRect *)a4 forSpriteKind:(int64_t)a5
{
  *a3 = 0.0;
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  a4->origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  a4->size = v5;
}

- (id)newGenerator
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  CGSize v5 = (objc_class *)objc_opt_class();
  unint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGGeneratedLayout.m", 47, @"Method %s is a responsibility of subclass %@", "-[PXGGeneratedLayout newGenerator]", v6 object file lineNumber description];

  abort();
}

- (void)dealloc
{
  free(self->_generatorGeometryBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PXGGeneratedLayout;
  [(PXGItemsLayout *)&v3 dealloc];
}

- (PXGGeneratedLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGeneratedLayout;
  v2 = [(PXGItemsLayout *)&v8 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_interitemSpacing = 1.0;
    long long v4 = *((_OWORD *)off_1E5DAAF10 + 1);
    *(_OWORD *)&v2->_padding.double top = *(_OWORD *)off_1E5DAAF10;
    *(_OWORD *)&v2->_padding.double bottom = v4;
    v2->_useSaliency = 0;
    v2->_keyItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    CGSize v5 = objc_alloc_init(PXGLayoutGuide);
    headerLayoutGuide = v3->_headerLayoutGuide;
    v3->_headerLayoutGuide = v5;
  }
  return v3;
}

@end