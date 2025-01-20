@interface PXStoryGridTimeline
- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3;
- (CGSize)size;
- (PXExploreLayoutGenerator)layoutGenerator;
- (PXStoryGridTimeline)initWithOriginalTimeline:(id)a3;
- (PXStoryGridTimeline)initWithOriginalTimeline:(id)a3 layoutSpec:(id)a4 viewportSize:(CGSize)a5;
- (void)dealloc;
- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
@end

@implementation PXStoryGridTimeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_rectsStore, 0);
}

- (PXExploreLayoutGenerator)layoutGenerator
{
  return self->_layoutGenerator;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x4010000000;
  v7[3] = &unk_1AB5D584F;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v8 = *MEMORY[0x1E4F1DB28];
  long long v9 = v5;
  v6 = [(PXStoryDerivedTimeline *)self originalTimeline];
  if (v6) {
    [v6 timeRangeForSegmentWithIdentifier:a3];
  }
  [(PXStoryGridTimeline *)self size];
  PXRectWithOriginAndSize();
}

void __53__PXStoryGridTimeline_frameForSegmentWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v5 = a4[1];
  *(_OWORD *)(v4 + 32) = *a4;
  *(_OWORD *)(v4 + 48) = v5;
  if (a2 >= 2)
  {
    uint64_t v7 = a2 - 1;
    long long v8 = (char *)a4 + 56;
    do
    {
      *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), *(CGRect *)(v8 - 24));
      v8 += 32;
      --v7;
    }
    while (v7);
  }
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  id v6 = a5;
  [(PXStoryDerivedTimeline *)self originalTimeline];
  [(id)objc_claimAutoreleasedReturnValue() size];
  PXRectWithOriginAndSize();
}

void __65__PXStoryGridTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PXStoryGridTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2;
  v12[3] = &unk_1E5DC0088;
  uint64_t v14 = a2;
  uint64_t v15 = a5;
  v12[4] = v9;
  long long v11 = *(_OWORD *)(a1 + 64);
  long long v16 = *(_OWORD *)(a1 + 48);
  long long v17 = v11;
  id v13 = *(id *)(a1 + 40);
  uint64_t v18 = a3;
  uint64_t v19 = a6;
  [v10 accessArrayWithElementsCount:a2 accessBlock:v12];
}

uint64_t __65__PXStoryGridTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 48);
  if (v4 < 1)
  {
LABEL_5:
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    id v6 = (void *)(*(void *)(result + 56) + 8);
    while (*v6 != 1)
    {
      v6 += 96;
      if (v4 == ++v5) {
        goto LABEL_5;
      }
    }
  }
  uint64_t v7 = *(void *)(result + 32);
  uint64_t v8 = *(void *)(v7 + 32);
  if (v8 < 1)
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v9 = *(void **)(v7 + 16);
    uint64_t v10 = *(void *)(*(void *)(result + 56) + 768 * v5);
    if (*v9 == v10)
    {
      BOOL v11 = 0;
    }
    else
    {
      uint64_t v12 = 1;
      while (v8 != v12)
      {
        uint64_t v13 = v9[v12++];
        if (v13 == v10)
        {
          uint64_t v14 = v12 - 1;
          goto LABEL_15;
        }
      }
      uint64_t v14 = v8;
LABEL_15:
      BOOL v11 = v14 >= v8;
    }
  }
  if (v4 >= 1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    long long v17 = (_OWORD *)MEMORY[0x1E4F1DB28];
    do
    {
      while (1)
      {
        char v18 = *(void *)(*(void *)(v3 + 56) + 768 * v15 + 8) != 1 || v11;
        if ((v18 & 1) == 0) {
          PXRectWithCenterAndSize();
        }
        uint64_t v19 = (uint64_t *)(a2 + 32 * v15);
        long long v20 = v17[1];
        *(_OWORD *)uint64_t v19 = *v17;
        *((_OWORD *)v19 + 1) = v20;
        uint64_t v21 = *v19;
        *(void *)&long long v20 = v19[1];
        uint64_t v22 = v19[2];
        uint64_t v23 = v19[3];
        CGSize result = CGRectIntersectsRect(*(CGRect *)((char *)&v20 - 8), *(CGRect *)(v3 + 64));
        v16 += result;
        if ((result & 1) != 0 || v16 < 1) {
          break;
        }
        CGSize result = (*(uint64_t (**)(void))(*(void *)(v3 + 40) + 16))();
        if (!**(unsigned char **)(v3 + 104))
        {
          uint64_t v16 = 0;
          if (++v15 < *(void *)(v3 + 48)) {
            continue;
          }
        }
        return result;
      }
      ++v15;
    }
    while (v15 < *(void *)(v3 + 48));
    if (v16 >= 1 && !**(unsigned char **)(v3 + 104))
    {
      v24 = *(uint64_t (**)(void))(*(void *)(v3 + 40) + 16);
      return v24();
    }
  }
  return result;
}

- (void)dealloc
{
  free(self->_assetClipIdentifiers);
  free(self->_assetClipGeometries);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryGridTimeline;
  [(PXStoryGridTimeline *)&v3 dealloc];
}

- (PXStoryGridTimeline)initWithOriginalTimeline:(id)a3 layoutSpec:(id)a4 viewportSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v11 browserGridLayoutMetrics];

  if (!v12)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXStoryGridTimeline.m", 36, @"Invalid parameter not satisfying: %@", @"layoutSpec.browserGridLayoutMetrics" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PXStoryGridTimeline;
  uint64_t v13 = [(PXStoryDerivedTimeline *)&v18 initWithOriginalTimeline:v10];
  if (v13)
  {
    [v11 browserGridLayoutMetrics];
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "setReferenceSize:", width, height);
    size_t v14 = [v10 numberOfClipsWithResourceKind:1];
    v13->_numberOfAssetClips = v14;
    v13->_assetClipIdentifiers = (int64_t *)malloc_type_calloc(v14, 8uLL, 0x100004000313F17uLL);
    v13->_assetClipGeometries = (_PXLayoutGeometry *)malloc_type_calloc(v13->_numberOfAssetClips, 0x98uLL, 0x100004050011849uLL);
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    if (v10) {
      [v10 timeRange];
    }
    [v10 size];
    PXRectWithOriginAndSize();
  }

  return 0;
}

uint64_t __72__PXStoryGridTimeline_initWithOriginalTimeline_layoutSpec_viewportSize___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = (void *)(a5 + 8);
    do
    {
      if (*v5 == 1) {
        *(void *)(*(void *)(*(void *)(result + 32) + 16)
      }
                  + 8 * (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24))++) = *(v5 - 1);
      v5 += 96;
      --a2;
    }
    while (a2);
  }
  return result;
}

id __72__PXStoryGridTimeline_initWithOriginalTimeline_layoutSpec_viewportSize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 < 1) {
    v2 = &PXStoryClipIdentifierNull;
  }
  else {
    v2 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 16) + 8 * a2 - 8);
  }
  objc_super v3 = [*(id *)(a1 + 40) clipWithResourceKind:1 afterClipIdentifier:*v2];
  uint64_t v4 = [v3 resource];

  return v4;
}

- (PXStoryGridTimeline)initWithOriginalTimeline:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryGridTimeline.m", 32, @"%s is not available as initializer", "-[PXStoryGridTimeline initWithOriginalTimeline:]");

  abort();
}

@end