@interface PXSmallCollectionLayoutGenerator
+ (int64_t)maximumNumberOfItemsSupportedForStyle:(unint64_t)a3;
- (CGSize)estimatedSize;
- (CGSize)size;
- (PXSmallCollectionLayoutGenerator)initWithMetrics:(id)a3;
- (PXSmallCollectionLayoutGenerator)initWithNumberOfItems:(int64_t)a3 metrics:(id)a4;
- (_PXCornerSpriteIndexes)cornerSpriteIndexes;
- (int64_t)numberOfItems;
- (unint64_t)keyItemIndex;
- (void)_fillEquallyRect:(CGRect)a3 numberOfItems:(int64_t)a4 axis:(int64_t)a5 resultHandler:(id)a6;
- (void)_prepareEditorialStyle;
- (void)_prepareHighQualityAggregationStyle;
- (void)_prepareIfNeeded;
- (void)_prepareLowQualityAggregationStyle;
- (void)_sliceItemFromRect:(CGRect)a3 itemAspectRatio:(double)a4 axis:(int64_t)a5 sliceHandler:(id)a6 remainderHandler:(id)a7;
- (void)dealloc;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
@end

@implementation PXSmallCollectionLayoutGenerator

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)_sliceItemFromRect:(CGRect)a3 itemAspectRatio:(double)a4 axis:(int64_t)a5 sliceHandler:(id)a6 remainderHandler:(id)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v16 = (void (**)(void, double, double, double, double))a6;
  v17 = (void (**)(void, double, double, double, double))a7;
  switch(a5)
  {
    case 1:
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      double v19 = floor(CGRectGetWidth(v25) / a4);
      CGRectEdge v18 = CGRectMinYEdge;
      break;
    case 2:
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      CGRectEdge v18 = CGRectMinXEdge;
      double v19 = floor(CGRectGetHeight(v26) / a4);
      break;
    case 0:
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"PXSmallCollectionLayoutGenerator.m" lineNumber:300 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      CGRectEdge v18 = CGRectMinXEdge;
      double v19 = 0.0;
      break;
  }
  memset(&slice, 0, sizeof(slice));
  memset(&v23, 0, sizeof(v23));
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGRectDivide(v27, &slice, &v23, v19, v18);
  v16[2](v16, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  v20 = [(PXSmallCollectionLayoutGenerator *)self metrics];
  [v20 interitemSpacing];
  CGRectDivide(v23, &slice, &v23, v21, v18);

  v17[2](v17, v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
}

- (void)_fillEquallyRect:(CGRect)a3 numberOfItems:(int64_t)a4 axis:(int64_t)a5 resultHandler:(id)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v14 = (void (**)(id, void, double, double, double, double))a6;
  v15 = [(PXSmallCollectionLayoutGenerator *)self metrics];
  [v15 interitemSpacing];
  double v17 = v16;

  switch(a5)
  {
    case 1:
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      double v19 = (v17 + CGRectGetHeight(v24)) / (double)a4 - v17;
      CGRectEdge v18 = CGRectMinYEdge;
      break;
    case 2:
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      CGRectEdge v18 = CGRectMinXEdge;
      double v19 = (v17 + CGRectGetWidth(v25)) / (double)a4 - v17;
      break;
    case 0:
      CGFloat v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"PXSmallCollectionLayoutGenerator.m" lineNumber:273 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      CGRectEdge v18 = CGRectMinXEdge;
      double v19 = 0.0;
      break;
  }
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  remainder.size.CGFloat width = width;
  remainder.size.CGFloat height = height;
  memset(&v22, 0, sizeof(v22));
  if (a4 >= 1)
  {
    uint64_t v20 = 0;
    do
    {
      CGRectDivide(remainder, &v22, &remainder, v19, v18);
      v14[2](v14, v20, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
      if (a4 - 1 != v20) {
        CGRectDivide(remainder, &v22, &remainder, v17, v18);
      }
      ++v20;
    }
    while (a4 != v20);
  }
}

- (void)_prepareHighQualityAggregationStyle
{
}

void __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke()
{
}

uint64_t __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_3;
  v6[3] = &unk_1E5DC5BC0;
  v6[6] = *(void *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 1, v6, &__block_literal_global_213615, a2, a3, a4, a5, 2.0);
}

uint64_t __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_4;
  v2[3] = &unk_1E5DC5B98;
  v2[6] = *(void *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "_fillEquallyRect:numberOfItems:axis:resultHandler:", 2, 2, v2);
}

uint64_t __71__PXSmallCollectionLayoutGenerator__prepareHighQualityAggregationStyle__block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2 + 1 < *(void *)(result + 48)) {
    PXRectGetCenter();
  }
  return result;
}

- (void)_prepareLowQualityAggregationStyle
{
}

void __70__PXSmallCollectionLayoutGenerator__prepareLowQualityAggregationStyle__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PXSmallCollectionLayoutGenerator__prepareLowQualityAggregationStyle__block_invoke_2;
  v11[3] = &unk_1E5DC5AF8;
  long long v10 = *(_OWORD *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 32);
  long long v13 = v10;
  objc_msgSend((id)v12, "_fillEquallyRect:numberOfItems:axis:resultHandler:", 2, 2, v11, a2, a3);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v14.origin.CGFloat x = a2;
    v14.origin.CGFloat y = a3;
    v14.size.CGFloat width = a4;
    v14.size.CGFloat height = a5;
    *(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8)+ 32), v14);
  }
}

uint64_t __70__PXSmallCollectionLayoutGenerator__prepareLowQualityAggregationStyle__block_invoke_3(uint64_t result, double a2, double a3, double a4, double a5)
{
  v5 = *(double **)(*(void *)(result + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return result;
}

uint64_t __70__PXSmallCollectionLayoutGenerator__prepareLowQualityAggregationStyle__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 + 2 * *(void *)(result + 48) < *(void *)(result + 56)) {
    PXRectGetCenter();
  }
  return result;
}

- (void)_prepareEditorialStyle
{
}

void __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke()
{
}

void __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_2()
{
}

void __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_3()
{
}

uint64_t __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_5;
  v3[3] = &unk_1E5DC5AD0;
  v3[4] = v1;
  return objc_msgSend(v1, "_fillEquallyRect:numberOfItems:axis:resultHandler:", 2, 2, v3);
}

void __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_6()
{
}

uint64_t __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_7(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v7 = *(id *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_8;
  v8[3] = &unk_1E5DC5AA8;
  v8[4] = v7;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_9;
  v6[3] = &unk_1E5DC5AA8;
  return objc_msgSend(v7, "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 2, v8, v6, a2, a3, a4, a5, 1.0);
}

void __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_11()
{
}

uint64_t __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_12(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v7 = *(id *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_13;
  v8[3] = &unk_1E5DC5AA8;
  v8[4] = v7;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_15;
  v6[3] = &unk_1E5DC5AA8;
  return objc_msgSend(v7, "_sliceItemFromRect:itemAspectRatio:axis:sliceHandler:remainderHandler:", 1, v8, v6, a2, a3, a4, a5, 3.0);
}

uint64_t __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_13(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_14;
  v3[3] = &unk_1E5DC5AD0;
  v3[4] = v1;
  return objc_msgSend(v1, "_fillEquallyRect:numberOfItems:axis:resultHandler:", 3, 2, v3);
}

void __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_15()
{
}

void __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_14()
{
}

void __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_8()
{
}

uint64_t __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_9(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_10;
  v3[3] = &unk_1E5DC5AD0;
  v3[4] = v1;
  return objc_msgSend(v1, "_fillEquallyRect:numberOfItems:axis:resultHandler:", 2, 1, v3);
}

void __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_10()
{
}

void __58__PXSmallCollectionLayoutGenerator__prepareEditorialStyle__block_invoke_5()
{
}

- (void)_prepareIfNeeded
{
  if (!self->_isPrepared)
  {
    v3 = [(PXSmallCollectionLayoutGenerator *)self metrics];
    uint64_t v4 = [v3 style];

    if (v4 == 2)
    {
      if ([(PXSmallCollectionLayoutGenerator *)self numberOfItems] != 2)
      {
        [(PXSmallCollectionLayoutGenerator *)self _prepareHighQualityAggregationStyle];
        goto LABEL_9;
      }
    }
    else if (v4 != 1)
    {
      if (!v4) {
        [(PXSmallCollectionLayoutGenerator *)self _prepareEditorialStyle];
      }
      goto LABEL_9;
    }
    [(PXSmallCollectionLayoutGenerator *)self _prepareLowQualityAggregationStyle];
LABEL_9:
    self->_isPrepared = 1;
  }
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length = a4.length;
  [(PXSmallCollectionLayoutGenerator *)self _prepareIfNeeded];
  if (length)
  {
    uint64_t v8 = 0;
    for (int64_t i = 0; i != length; ++i)
    {
      long long v10 = (_PXLayoutGeometry *)off_1E5DAAFE8;
      if (i < self->_numberOfItems) {
        long long v10 = &self->_geometries[v8];
      }
      v11 = &a3[v8];
      long long v12 = *(_OWORD *)&v10->var1.y;
      *(_OWORD *)&v11->var0 = *(_OWORD *)&v10->var0;
      *(_OWORD *)&v11->var1.CGFloat y = v12;
      long long v13 = *(_OWORD *)&v10->var2.height;
      long long v14 = *(_OWORD *)&v10->var3.b;
      long long v15 = *(_OWORD *)&v10->var3.ty;
      *(_OWORD *)&v11->var3.d = *(_OWORD *)&v10->var3.d;
      *(_OWORD *)&v11->var3.tCGFloat y = v15;
      *(_OWORD *)&v11->var2.CGFloat height = v13;
      *(_OWORD *)&v11->var3.b = v14;
      long long v16 = *(_OWORD *)&v10->var5;
      long long v17 = *(_OWORD *)&v10->var6.origin.y;
      long long v18 = *(_OWORD *)&v10->var6.size.height;
      v11->var7.CGFloat height = v10->var7.height;
      *(_OWORD *)&v11->var6.origin.CGFloat y = v17;
      *(_OWORD *)&v11->var6.size.CGFloat height = v18;
      *(_OWORD *)&v11->var5 = v16;
      ++v8;
    }
  }
}

- (_PXCornerSpriteIndexes)cornerSpriteIndexes
{
  [(PXSmallCollectionLayoutGenerator *)self _prepareIfNeeded];
  uint64_t v3 = *(void *)&self->_cornerSpriteIndexes.topLeft;
  uint64_t v4 = *(void *)&self->_cornerSpriteIndexes.bottomLeft;
  result.bottomLeft = v4;
  result.bottomRight = HIDWORD(v4);
  result.topLeft = v3;
  result.topRight = HIDWORD(v3);
  return result;
}

- (CGSize)size
{
  [(PXSmallCollectionLayoutGenerator *)self _prepareIfNeeded];
  double width = self->_pageRect.size.width;
  double height = self->_pageRect.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)estimatedSize
{
  v2 = [(PXSmallCollectionLayoutGenerator *)self metrics];
  [v2 referenceSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (unint64_t)keyItemIndex
{
  if ([(PXSmallCollectionLayoutGenerator *)self numberOfItems] <= 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  free(self->_geometries);
  v3.receiver = self;
  v3.super_class = (Class)PXSmallCollectionLayoutGenerator;
  [(PXSmallCollectionLayoutGenerator *)&v3 dealloc];
}

- (PXSmallCollectionLayoutGenerator)initWithMetrics:(id)a3
{
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSmallCollectionLayoutGenerator.m", 38, @"%s is not available as initializer", "-[PXSmallCollectionLayoutGenerator initWithMetrics:]");

  abort();
}

- (PXSmallCollectionLayoutGenerator)initWithNumberOfItems:(int64_t)a3 metrics:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXSmallCollectionLayoutGenerator;
  double v7 = [(PXSmallCollectionLayoutGenerator *)&v11 initWithMetrics:v6];
  if (v7)
  {
    int64_t v8 = objc_msgSend((id)objc_opt_class(), "maximumNumberOfItemsSupportedForStyle:", objc_msgSend(v6, "style"));
    if (v8 >= a3) {
      int64_t v9 = a3;
    }
    else {
      int64_t v9 = v8;
    }
    v7->_numberOfItems = v9;
  }

  return v7;
}

+ (int64_t)maximumNumberOfItemsSupportedForStyle:(unint64_t)a3
{
  if (a3 - 1 < 2) {
    return 3;
  }
  else {
    return 4;
  }
}

@end