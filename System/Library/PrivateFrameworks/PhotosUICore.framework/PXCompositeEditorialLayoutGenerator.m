@interface PXCompositeEditorialLayoutGenerator
- (CGSize)estimatedSize;
- (CGSize)size;
- (PXCompositeEditorialLayoutGenerator)initWithMetrics:(id)a3;
- (_PXLayoutGeometry)_geometryFromFrame:(SEL)a3 index:(CGRect)a4;
- (id)_layoutInputsInRange:(_NSRange)a3;
- (id)_minCostingTemplateAmongTemplates:(id)a3 forFittingInputItems:(id)a4 inRange:(_NSRange)a5 minCost:(double *)a6;
- (void)_computeTemplatesByTileCountIfNeeded;
- (void)_enumerateTemplatesWithBlock:(id)a3;
- (void)_normalizeWeightsForInputItems:(id)a3;
- (void)_prepareGeometriesBufferForCount:(unint64_t)a3;
- (void)_prepareIfNeeded;
- (void)_prepareLayoutItemWeightsBufferForCount:(unint64_t)a3;
- (void)dealloc;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
- (void)invalidate;
@end

@implementation PXCompositeEditorialLayoutGenerator

- (void).cxx_destruct
{
}

- (_PXLayoutGeometry)_geometryFromFrame:(SEL)a3 index:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v11 = [(PXCompositeEditorialLayoutGenerator *)self metrics];
  [v11 padding];
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRectOffset(v17, v15, v13);
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  *(_OWORD *)&retstr->var3.tCGFloat x = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  retstr->var6.origin = 0u;
  retstr->var6.size = 0u;
  retstr->var7 = 0u;
  retstr->var0 = a5;
  PXRectGetCenter();
}

- (id)_layoutInputsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = [MEMORY[0x1E4F1CA48] array];
  if (location < location + length)
  {
    do
    {
      v7 = [(PXCompositeEditorialLayoutGenerator *)self itemLayoutInfoBlock];
      v8 = v7[2](v7, location);
      [v6 addObject:v8];

      ++location;
      --length;
    }
    while (length);
  }
  v9 = (void *)[v6 copy];

  return v9;
}

- (void)_prepareGeometriesBufferForCount:(unint64_t)a3
{
  if (self->_geometriesCount < a3)
  {
    self->_geometries = (_PXLayoutGeometry *)malloc_type_realloc(self->_geometries, 152 * a3, 0x100004050011849uLL);
    self->_geometriesCount = a3;
  }
}

- (void)_prepareLayoutItemWeightsBufferForCount:(unint64_t)a3
{
  if (self->_layoutItemWeightsCount < a3)
  {
    self->_layoutItemWeights = (double *)malloc_type_realloc(self->_layoutItemWeights, 8 * a3, 0x100004000313F17uLL);
    self->_layoutItemWeightsCount = a3;
  }
}

- (void)_normalizeWeightsForInputItems:(id)a3
{
  id v4 = a3;
  -[PXCompositeEditorialLayoutGenerator _prepareLayoutItemWeightsBufferForCount:](self, "_prepareLayoutItemWeightsBufferForCount:", [v4 count]);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0x47EFFFFFE0000000;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__PXCompositeEditorialLayoutGenerator__normalizeWeightsForInputItems___block_invoke;
  v6[3] = &unk_1E5DB0510;
  v6[4] = v8;
  v6[5] = v7;
  [v4 enumerateObjectsUsingBlock:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PXCompositeEditorialLayoutGenerator__normalizeWeightsForInputItems___block_invoke_2;
  v5[3] = &unk_1E5DB0538;
  v5[4] = self;
  v5[5] = v7;
  v5[6] = v8;
  [v4 enumerateObjectsUsingBlock:v5];
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v8, 8);
}

void __70__PXCompositeEditorialLayoutGenerator__normalizeWeightsForInputItems___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  [v4 weight];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  [v4 weight];
  double v8 = v7;

  if (v6 >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = v6;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

double __70__PXCompositeEditorialLayoutGenerator__normalizeWeightsForInputItems___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  [a2 weight];
  double v5 = *(double *)(*(void *)(a1[5] + 8) + 24);
  double result = (v6 - v5) / (*(double *)(*(void *)(a1[6] + 8) + 24) - v5);
  *(double *)(*(void *)(a1[4] + 56) + 8 * a3) = result;
  return result;
}

- (id)_minCostingTemplateAmongTemplates:(id)a3 forFittingInputItems:(id)a4 inRange:(_NSRange)a5 minCost:(double *)a6
{
  v26 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = [(PXCompositeEditorialLayoutGenerator *)self itemCount];
  v10 = [(PXCompositeEditorialLayoutGenerator *)self metrics];
  uint64_t v11 = [v10 useSaliency];

  double v12 = self;
  [(PXCompositeEditorialLayoutGenerator *)self _normalizeWeightsForInputItems:v9];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    v16 = 0;
    uint64_t v17 = *(void *)v30;
    double v18 = 3.40282347e38;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v13);
        }
        v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        unint64_t v21 = objc_msgSend(v20, "numberOfRects", v26);
        if (v21 <= [v9 count])
        {
          objc_msgSend(v20, "costForFittingLayoutItemInputs:inRange:ofTotalItemCount:normalizedWeights:useSaliency:", v9, a5.location, a5.length, v27, v12->_layoutItemWeights, v11);
          double v23 = v22;
          if (!v16 || v22 < v18)
          {
            id v24 = v20;

            double v18 = v23;
            v16 = v24;
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }
  else
  {
    v16 = 0;
    double v18 = 3.40282347e38;
  }

  if (v26) {
    double *v26 = v18;
  }

  return v16;
}

- (void)_enumerateTemplatesWithBlock:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t, void *, void *))a3;
  [(PXCompositeEditorialLayoutGenerator *)self _computeTemplatesByTileCountIfNeeded];
  if ([(NSDictionary *)self->_templatesByTileCount count])
  {
    double v5 = [(PXCompositeEditorialLayoutGenerator *)self metrics];
    double v6 = [v5 editorialLayoutSpec];

    v33 = v6;
    uint64_t v7 = [v6 templates];
    int64_t v8 = [(PXCompositeEditorialLayoutGenerator *)self itemCount];
    int64_t v9 = v8;
    if (v8 >= self->_maxTemplateItemCount) {
      int64_t maxTemplateItemCount = self->_maxTemplateItemCount;
    }
    else {
      int64_t maxTemplateItemCount = v8;
    }
    uint64_t v11 = -[PXCompositeEditorialLayoutGenerator _layoutInputsInRange:](self, "_layoutInputsInRange:", 0, maxTemplateItemCount);
    long long v32 = (void *)v7;
    double v12 = -[PXCompositeEditorialLayoutGenerator _minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:](self, "_minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:", v7, v11, 0, maxTemplateItemCount, 0);
    uint64_t v13 = [v12 numberOfRects];
    uint64_t v14 = objc_msgSend(v11, "subarrayWithRange:", 0, v13);
    v4[2](v4, 0, v13, v14, v12);
    int64_t v15 = v9 - v13;

    if (v9 - v13 <= self->_minTemplateItemCount)
    {
      v19 = v12;
    }
    else
    {
      do
      {
        if (v15 >= self->_maxTemplateItemCount) {
          int64_t v16 = self->_maxTemplateItemCount;
        }
        else {
          int64_t v16 = v15;
        }
        uint64_t v17 = [v33 preferredNextTemplatesForTemplate:v12];
        double v18 = -[PXCompositeEditorialLayoutGenerator _layoutInputsInRange:](self, "_layoutInputsInRange:", v13, v16);
        double v34 = 3.40282347e38;
        v19 = -[PXCompositeEditorialLayoutGenerator _minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:](self, "_minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:", v17, v18, v13, v16, &v34);
        if (v19) {
          BOOL v20 = v34 < 0.5;
        }
        else {
          BOOL v20 = 0;
        }
        if (!v20)
        {
          uint64_t v21 = -[PXCompositeEditorialLayoutGenerator _minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:](self, "_minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:", v32, v18, v13, v16, &v34, v34);

          v19 = (void *)v21;
        }
        uint64_t v22 = [v19 numberOfRects];
        double v23 = objc_msgSend(v18, "subarrayWithRange:", 0, v22);
        v4[2](v4, v13, v22, v23, v19);
        v15 -= v22;
        v13 += v22;

        double v12 = v19;
      }
      while (v15 > self->_minTemplateItemCount);
    }
    if (v15 >= 1)
    {
      if (v15 >= self->_maxTemplateItemCount) {
        int64_t v24 = self->_maxTemplateItemCount;
      }
      else {
        int64_t v24 = v15;
      }
      v25 = [v33 preferredNextTemplatesForTemplate:v19];
      v26 = -[PXCompositeEditorialLayoutGenerator _layoutInputsInRange:](self, "_layoutInputsInRange:", v13, v24);
      double v34 = 3.40282347e38;
      uint64_t v27 = -[PXCompositeEditorialLayoutGenerator _minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:](self, "_minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:", v25, v26, v13, v24, &v34);
      if (v27) {
        BOOL v28 = v34 <= 0.5;
      }
      else {
        BOOL v28 = 0;
      }
      if (!v28)
      {
        uint64_t v29 = -[PXCompositeEditorialLayoutGenerator _minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:](self, "_minCostingTemplateAmongTemplates:forFittingInputItems:inRange:minCost:", v32, v26, v13, v24, 0, v34);

        uint64_t v27 = (void *)v29;
      }
      uint64_t v30 = [v27 numberOfRects];
      long long v31 = objc_msgSend(v26, "subarrayWithRange:", 0, v30);
      v4[2](v4, v13, v30, v31, v27);
    }
  }
}

- (void)_computeTemplatesByTileCountIfNeeded
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self->_templatesByTileCount)
  {
    double v3 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v18 = self;
    id v4 = [(PXCompositeEditorialLayoutGenerator *)self metrics];
    double v5 = [v4 editorialLayoutSpec];
    double v6 = [v5 templates];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v12 = [v11 numberOfRects];
          uint64_t v13 = [NSNumber numberWithInteger:v12];
          uint64_t v14 = [v3 objectForKeyedSubscript:v13];

          if (!v14)
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
            int64_t v15 = [NSNumber numberWithInteger:v12];
            [v3 setObject:v14 forKeyedSubscript:v15];
          }
          [v14 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    uint64_t v16 = [v3 copy];
    templatesByTileCount = v18->_templatesByTileCount;
    v18->_templatesByTileCount = (NSDictionary *)v16;
  }
}

- (void)_prepareIfNeeded
{
  if (!self->_isPrepared)
  {
    self->_isPrepared = 1;
    [(PXCompositeEditorialLayoutGenerator *)self _prepareGeometriesBufferForCount:[(PXCompositeEditorialLayoutGenerator *)self itemCount]];
    id v4 = [(PXCompositeEditorialLayoutGenerator *)self metrics];
    [v4 referenceSize];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    [v4 interTileSpacing];
    uint64_t v19 = 0;
    long long v20 = (double *)&v19;
    uint64_t v21 = 0x3010000000;
    long long v22 = &unk_1AB5D584F;
    long long v23 = *MEMORY[0x1E4F1DAD8];
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__PXCompositeEditorialLayoutGenerator__prepareIfNeeded__block_invoke;
    v13[3] = &unk_1E5DB04E8;
    v13[7] = &v19;
    v13[8] = a2;
    v13[4] = self;
    v13[5] = v14;
    v13[9] = v6;
    v13[10] = v8;
    v13[11] = v9;
    v13[6] = &v15;
    [(PXCompositeEditorialLayoutGenerator *)self _enumerateTemplatesWithBlock:v13];
    free((void *)v16[3]);
    v10 = [(PXCompositeEditorialLayoutGenerator *)self metrics];
    [v10 referenceSize];
    CGFloat v11 = v20[5];
    self->_contentSize.CGFloat width = v12;
    self->_contentSize.CGFloat height = v11;

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }
}

void __55__PXCompositeEditorialLayoutGenerator__prepareIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  uint64_t v8 = [v7 numberOfRects];
  if (v8 <= 0)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"PXCompositeEditorialLayoutGenerator.m", 133, @"no rects in template %@", v7 object file lineNumber description];
  }
  long long v30 = *MEMORY[0x1E4F1DB30];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void *)(v9 + 24);
  if (v10 < v8)
  {
    if (!v10)
    {
      *(void *)(v9 + 24) = 10;
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void *)(v9 + 24);
    }
    if (v10 < v8)
    {
      CGFloat v11 = (void *)(v9 + 24);
      do
      {
        void *v11 = 2 * v10;
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v13 = *(void *)(v12 + 24);
        CGFloat v11 = (void *)(v12 + 24);
        uint64_t v10 = v13;
      }
      while (v13 < v8);
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = malloc_type_realloc(*(void **)(*(void *)(*(void *)(a1 + 48) + 8)+ 24), 32 * v10, 0x1000040E0EAB150uLL);
  }
  objc_msgSend(v7, "getComputedRects:contentSize:forReferenceSize:interTileSpacing:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), &v30, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  if (v8 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 152 * a2;
    do
    {
      CGRect v31 = CGRectOffset(*(CGRect *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + v14), 0.0, *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
      uint64_t v16 = *(void **)(a1 + 32);
      uint64_t v17 = v16[5] + v15;
      objc_msgSend(v16, "_geometryFromFrame:index:", a2, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
      *(_OWORD *)uint64_t v17 = v20;
      *(_OWORD *)(v17 + 16) = v21;
      *(_OWORD *)(v17 + 64) = v24;
      *(_OWORD *)(v17 + 80) = v25;
      *(_OWORD *)(v17 + 32) = v22;
      *(_OWORD *)(v17 + 48) = v23;
      *(void *)(v17 + 144) = v29;
      *(_OWORD *)(v17 + 112) = v27;
      *(_OWORD *)(v17 + 128) = v28;
      *(_OWORD *)(v17 + 96) = v26;
      ++a2;
      v15 += 152;
      v14 += 32;
      --v8;
    }
    while (v8);
  }
  double v18 = *((double *)&v30 + 1);
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = *(double *)&v30
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 32);
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v18
                                                              + *(double *)(a1 + 88)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 40);
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v11 = a4.location + a4.length;
  if (a4.location + a4.length > [(PXCompositeEditorialLayoutGenerator *)self itemCount])
  {
    long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PXCompositeEditorialLayoutGenerator.m" lineNumber:106 description:@"the range must be <= to the number of itemCount"];
  }
  [(PXCompositeEditorialLayoutGenerator *)self _prepareIfNeeded];
  if (location < v11)
  {
    NSUInteger v12 = location;
    do
    {
      uint64_t v13 = &a3[v12];
      uint64_t v14 = &self->_geometries[v12];
      long long v16 = *(_OWORD *)&v14->var6.origin.y;
      long long v15 = *(_OWORD *)&v14->var6.size.height;
      CGFloat height = v14->var7.height;
      *(_OWORD *)&v13->var5 = *(_OWORD *)&v14->var5;
      long long v18 = *(_OWORD *)&v14->var1.y;
      *(_OWORD *)&v13->var0 = *(_OWORD *)&v14->var0;
      *(_OWORD *)&v13->var1.CGFloat y = v18;
      long long v19 = *(_OWORD *)&v14->var2.height;
      long long v20 = *(_OWORD *)&v14->var3.b;
      long long v21 = *(_OWORD *)&v14->var3.ty;
      *(_OWORD *)&v13->var3.d = *(_OWORD *)&v14->var3.d;
      *(_OWORD *)&v13->var3.tCGFloat y = v21;
      *(_OWORD *)&v13->var2.CGFloat height = v19;
      *(_OWORD *)&v13->var3.b = v20;
      v13->var7.CGFloat height = height;
      *(_OWORD *)&v13->var6.origin.CGFloat y = v16;
      *(_OWORD *)&v13->var6.size.CGFloat height = v15;
      v13->var5 = a5;
      ++v12;
      --length;
    }
    while (length);
  }
}

- (CGSize)size
{
  [(PXCompositeEditorialLayoutGenerator *)self _prepareIfNeeded];
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)estimatedSize
{
  double v3 = [(PXCompositeEditorialLayoutGenerator *)self metrics];
  [v3 referenceSize];
  double v5 = v4;
  int64_t v6 = self->_maxTemplateItemCount / self->_minNumberOfColumns;
  id v7 = [v3 editorialLayoutSpec];
  uint64_t v8 = [v7 templates];
  uint64_t v9 = [v8 firstObject];
  [v9 tileAspectRatio];
  double v11 = v10;

  double v12 = 0.25;
  if (v11 >= 0.25) {
    double v12 = v11;
  }
  double v13 = v5 / v12 * (double)v6;

  double v14 = v5;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)PXCompositeEditorialLayoutGenerator;
  [(PXCompositeEditorialLayoutGenerator *)&v3 invalidate];
  self->_geometriesCount = 0;
}

- (void)dealloc
{
  free(self->_geometries);
  free(self->_layoutItemWeights);
  v3.receiver = self;
  v3.super_class = (Class)PXCompositeEditorialLayoutGenerator;
  [(PXCompositeEditorialLayoutGenerator *)&v3 dealloc];
}

- (PXCompositeEditorialLayoutGenerator)initWithMetrics:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCompositeEditorialLayoutGenerator;
  double v5 = [(PXCompositeEditorialLayoutGenerator *)&v9 initWithMetrics:v4];
  int64_t v6 = v5;
  if (v5)
  {
    v5->_geometries = 0;
    id v7 = [v4 editorialLayoutSpec];
    v6->_minNumberOfColumns = [v7 minNumberOfColumns];
    v6->_minTemplateItemCount = [v7 minNumberOfRects];
    v6->_int64_t maxTemplateItemCount = [v7 maxNumberOfRects];
  }
  return v6;
}

@end