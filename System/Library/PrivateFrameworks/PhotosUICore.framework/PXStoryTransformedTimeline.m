@interface PXStoryTransformedTimeline
- (CGAffineTransform)transform;
- (CGRect)_untransformRect:(CGRect)a3;
- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3;
- (CGRect)transformedRectForOriginalClipInfo:(id *)a3 originalRect:(CGRect)a4;
- (CGSize)originalSize;
- (CGSize)size;
- (PXCArrayStore)transformedClipInfosStore;
- (PXCArrayStore)transformedRectsStore;
- (PXStoryTransformedTimeline)initWithOriginalTimeline:(id)a3;
- (PXStoryTransformedTimeline)initWithOriginalTimeline:(id)a3 transform:(CGAffineTransform *)a4;
- (id)clipWithIdentifier:(int64_t)a3;
- (id)description;
- (void)_transformRects:(const CGRect *)a3 clipInfos:(id *)a4 count:(int64_t)a5 resultHandler:(id)a6;
- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
@end

@implementation PXStoryTransformedTimeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformedClipInfosStore, 0);
  objc_storeStrong((id *)&self->_transformedRectsStore, 0);
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].c;
  return self;
}

- (PXCArrayStore)transformedClipInfosStore
{
  return self->_transformedClipInfosStore;
}

- (PXCArrayStore)transformedRectsStore
{
  return self->_transformedRectsStore;
}

- (CGSize)originalSize
{
  v2 = [(PXStoryDerivedTimeline *)self originalTimeline];
  [v2 originalSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  double v5 = [(PXStoryDerivedTimeline *)self originalTimeline];
  [v5 frameForSegmentWithIdentifier:a3];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(PXStoryTransformedTimeline *)self transform];
  v23.origin.CGFloat x = v7;
  v23.origin.CGFloat y = v9;
  v23.size.CGFloat width = v11;
  v23.size.CGFloat height = v13;
  CGRect v24 = CGRectApplyAffineTransform(v23, &v22);
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (id)clipWithIdentifier:(int64_t)a3
{
  v49.receiver = self;
  v49.super_class = (Class)PXStoryTransformedTimeline;
  double v4 = [(PXStoryDerivedTimeline *)&v49 clipWithIdentifier:a3];
  double v5 = v4;
  memset(v48, 0, 512);
  if (v4) {
    [v4 info];
  }
  else {
    bzero(v48, 0x300uLL);
  }
  uint64_t v12 = 0;
  CGFloat v13 = &v12;
  uint64_t v14 = 0x32010000000;
  v15 = &unk_1AB5D584F;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  v11[0] = *MEMORY[0x1E4F1DB20];
  v11[1] = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PXStoryTransformedTimeline_clipWithIdentifier___block_invoke;
  v10[3] = &unk_1E5DBC450;
  v10[4] = &v12;
  [(PXStoryTransformedTimeline *)self _transformRects:v11 clipInfos:v48 count:1 resultHandler:v10];
  memcpy(__dst, v13 + 4, sizeof(__dst));
  CGFloat v7 = (void *)[v5 copyWithInfo:__dst];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void *__49__PXStoryTransformedTimeline_clipWithIdentifier___block_invoke(uint64_t a1, int a2, void *__src)
{
  return memcpy((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), __src, 0x300uLL);
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  uint64_t v12 = [(PXStoryDerivedTimeline *)self originalTimeline];
  -[PXStoryTransformedTimeline _untransformRect:](self, "_untransformRect:", x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__PXStoryTransformedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke;
  v24[3] = &unk_1E5DBC428;
  v24[4] = self;
  id v25 = v11;
  long long v21 = *(_OWORD *)&a3->var0.var3;
  v23[0] = *(_OWORD *)&a3->var0.var0;
  v23[1] = v21;
  v23[2] = *(_OWORD *)&a3->var1.var1;
  id v22 = v11;
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v23, v24, v14, v16, v18, v20);
}

void __72__PXStoryTransformedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PXStoryTransformedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2;
  v12[3] = &unk_1E5DBC400;
  id v11 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  uint64_t v16 = a6;
  [v11 _transformRects:a4 clipInfos:a5 count:a2 resultHandler:v12];
}

uint64_t __72__PXStoryTransformedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t, void))(a1[4] + 16))(a1[4], a1[5], a1[6], a2, a3, a1[7]);
}

- (CGSize)size
{
  double v3 = [(PXStoryDerivedTimeline *)self originalTimeline];
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  [(PXStoryTransformedTimeline *)self transform];

  double v8 = v7 * v12 + v10 * v5;
  double v9 = v7 * v13 + v11 * v5;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)_transformRects:(const CGRect *)a3 clipInfos:(id *)a4 count:(int64_t)a5 resultHandler:(id)a6
{
  id v10 = a6;
  double v11 = [(PXStoryTransformedTimeline *)self transformedRectsStore];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PXStoryTransformedTimeline__transformRects_clipInfos_count_resultHandler___block_invoke;
  v13[3] = &unk_1E5DBC3D8;
  int64_t v15 = a5;
  uint64_t v16 = a4;
  double v17 = a3;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 accessArrayWithElementsCount:a5 accessBlock:v13];
}

void __76__PXStoryTransformedTimeline__transformRects_clipInfos_count_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4 = [*(id *)(a1 + 32) transformedClipInfosStore];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PXStoryTransformedTimeline__transformRects_clipInfos_count_resultHandler___block_invoke_2;
  v7[3] = &unk_1E5DBC3B0;
  double v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  uint64_t v9 = v6;
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = a2;
  id v8 = v5;
  [v4 accessArrayWithElementsCount:v6 accessBlock:v7];
}

uint64_t __76__PXStoryTransformedTimeline__transformRects_clipInfos_count_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4 = *(void **)(a1 + 32);
  if (v4) {
    [v4 transform];
  }
  if (*(uint64_t *)(a1 + 48) >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = (double *)(*(void *)(a1 + 64) + v5);
      double v10 = *v9;
      double v11 = v9[1];
      double v12 = v9[2];
      double v13 = v9[3];
      v23.origin.double x = *v9;
      v23.origin.double y = v11;
      v23.size.double width = v12;
      v23.size.double height = v13;
      if (CGRectIsNull(v23)) {
        PXRectWithOriginAndSize();
      }
      objc_msgSend(*(id *)(a1 + 32), "transformedRectForOriginalClipInfo:originalRect:", v8 + v6, v10, v11, v12, v13);
      uint64_t v15 = v14;
      uint64_t v17 = v16;
      double v18 = (void *)(*(void *)(a1 + 72) + v5);
      *double v18 = v19;
      v18[1] = v20;
      v18[2] = v14;
      v18[3] = v16;
      uint64_t v21 = a2 + v6;
      memcpy((void *)(a2 + v6), (const void *)(v8 + v6), 0x300uLL);
      *(void *)(v21 + 16) = v15;
      *(void *)(v21 + 24) = v17;
      if (*(void *)(v8 + v6 + 8) == 1) {
        PXStoryRectOuterBounds();
      }
      ++v7;
      v6 += 768;
      v5 += 32;
    }
    while (v7 < *(void *)(a1 + 48));
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (CGRect)transformedRectForOriginalClipInfo:(id *)a3 originalRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(PXStoryTransformedTimeline *)self transform];
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (CGRect)_untransformRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PXStoryTransformedTimeline *)self transform];
  CGAffineTransformInvert(&v8, &v7);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (id)description
{
  double v3 = [(PXStoryDerivedTimeline *)self originalTimeline];
  [(PXStoryTransformedTimeline *)self transform];
  id v4 = [NSString alloc];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v3 size];
  v13.CGFloat height = v7 * 0.0 + 0.0 * v8;
  v13.CGFloat width = v13.height;
  CGRect v9 = NSStringFromCGSize(v13);
  double v10 = objc_msgSend(v4, "initWithFormat:", @"<%@ %p; Transform: [%g %g %g %g %g %g]; Size: %@; Original Timeline:\n\t%@>",
                  v6,
                  self,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  v9,
                  v3);

  return v10;
}

- (PXStoryTransformedTimeline)initWithOriginalTimeline:(id)a3 transform:(CGAffineTransform *)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PXStoryTransformedTimeline;
  uint64_t v5 = [(PXStoryDerivedTimeline *)&v14 initWithOriginalTimeline:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v8 = *(_OWORD *)&a4->c;
    long long v7 = *(_OWORD *)&a4->tx;
    *(_OWORD *)&v5->_transform.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v5->_transform.c = v8;
    *(_OWORD *)&v5->_transform.tCGFloat x = v7;
    uint64_t v9 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:32];
    transformedRectsStore = v6->_transformedRectsStore;
    v6->_transformedRectsStore = (PXCArrayStore *)v9;

    uint64_t v11 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:768];
    transformedClipInfosStore = v6->_transformedClipInfosStore;
    v6->_transformedClipInfosStore = (PXCArrayStore *)v11;
  }
  return v6;
}

- (PXStoryTransformedTimeline)initWithOriginalTimeline:(id)a3
{
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [(PXStoryTransformedTimeline *)self initWithOriginalTimeline:a3 transform:v5];
}

@end