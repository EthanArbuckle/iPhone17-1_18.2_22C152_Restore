@interface PXMemoriesFeedEntryLayoutGenerator
- (CGSize)estimatedSize;
- (CGSize)size;
- (PXMemoriesFeedEntryLayoutGenerator)initWithMetrics:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)geometryKinds;
- (int64_t)layoutAxis;
- (unint64_t)numberOfGeometriesWithKind:(int64_t)a3;
- (void)_prepareLayoutIfNeeded;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
- (void)invalidate;
- (void)setLayoutAxis:(int64_t)a3;
@end

@implementation PXMemoriesFeedEntryLayoutGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectsByIndexByKind, 0);
  objc_storeStrong((id *)&self->_geometryKinds, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (int64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXMemoriesFeedEntryLayoutGenerator;
  id result = [(PXMemoriesFeedEntryLayoutGenerator *)&v5 copyWithZone:a3];
  *((void *)result + 16) = self->_layoutAxis;
  return result;
}

- (void)_prepareLayoutIfNeeded
{
  if (!self->_isPrepared)
  {
    self->_isPrepared = 1;
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(PXMemoriesFeedEntryLayoutGenerator *)self itemCount];
    [(PXMemoriesSpec *)self->_spec feedInteritemSpacing];
    [(PXMemoriesSpec *)self->_spec feedEntryEdgeInsets];
    v4 = [(PXMemoriesFeedEntryLayoutGenerator *)self metrics];
    [v4 referenceSize];

    PXEdgeInsetsInsetSize();
  }
}

void __60__PXMemoriesFeedEntryLayoutGenerator__prepareLayoutIfNeeded__block_invoke(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  CGRect v19 = CGRectIntegral(*(CGRect *)&a3);
  double x = v19.origin.x;
  double y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  v12 = (void *)a1[4];
  v13 = [NSNumber numberWithInteger:a2];
  id v17 = [v12 objectForKeyedSubscript:v13];

  if (!v17)
  {
    id v17 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[7]];
    v14 = (void *)a1[4];
    v15 = [NSNumber numberWithInteger:a2];
    [v14 setObject:v17 forKeyedSubscript:v15];
  }
  v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
  [v17 addObject:v16];

  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (CGRectGetMaxY(v20) > *(double *)(*(void *)(a1[5] + 8) + 24))
  {
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.double width = width;
    v21.size.double height = height;
    *(CGFloat *)(*(void *)(a1[5] + 8) + 24) = CGRectGetMaxY(v21);
  }
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  if (CGRectGetMaxX(v22) > *(double *)(*(void *)(a1[6] + 8) + 24))
  {
    v23.origin.double x = x;
    v23.origin.double y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    *(CGFloat *)(*(void *)(a1[6] + 8) + 24) = CGRectGetMaxX(v23);
  }
}

void __60__PXMemoriesFeedEntryLayoutGenerator__prepareLayoutIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    if (v2 == 2)
    {
      double v5 = *(double *)(a1 + 80);
      (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5, v5);
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v5
                                                                  + *(double *)(a1 + 96)
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 32);
    }
    else if (v2 == 1)
    {
      double v3 = *(double *)(a1 + 72) / *(double *)(a1 + 88);
      (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v3
                                                                  + *(double *)(a1 + 96)
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 40);
    }
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 104) object:*(void *)(a1 + 32) file:@"PXMemoriesFeedEntryLayoutGenerator.m" lineNumber:195 description:@"Unexpected layout axis"];
  }
  --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

void __60__PXMemoriesFeedEntryLayoutGenerator__prepareLayoutIfNeeded__block_invoke_3(void *a1)
{
  uint64_t v2 = a1[8];
  if (v2)
  {
    if (v2 == 2) {
      PXPointAdd();
    }
    if (v2 == 1) {
      PXPointAdd();
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:a1[13] object:a1[4] file:@"PXMemoriesFeedEntryLayoutGenerator.m" lineNumber:244 description:@"Unexpected layout axis"];
  }
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)PXMemoriesFeedEntryLayoutGenerator;
  [(PXMemoriesFeedEntryLayoutGenerator *)&v3 invalidate];
  self->_isPrepared = 0;
}

- (void)setLayoutAxis:(int64_t)a3
{
  if (self->_layoutAxis != a3)
  {
    self->_layoutAxis = a3;
    [(PXMemoriesFeedEntryLayoutGenerator *)self invalidate];
  }
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length = a4.length;
  int64_t location = a4.location;
  [(PXMemoriesFeedEntryLayoutGenerator *)self _prepareLayoutIfNeeded];
  if (a5)
  {
    if (a5 == 2 && !location && length)
    {
      if ([(PXMemoriesFeedLayoutGenerator *)self includeDateHeader]) {
        PXRectGetCenter();
      }
    }
  }
  else
  {
    unint64_t v9 = [(PXMemoriesFeedEntryLayoutGenerator *)self itemCount];
    rectsByIndexByKind = self->_rectsByIndexByKind;
    v11 = [NSNumber numberWithInteger:0];
    id v14 = [(NSDictionary *)rectsByIndexByKind objectForKeyedSubscript:v11];

    if (v9 >= location + length) {
      unint64_t v12 = location + length;
    }
    else {
      unint64_t v12 = v9;
    }
    if (location <= (uint64_t)(v12 - 1))
    {
      v13 = objc_msgSend(v14, "objectAtIndexedSubscript:", location, *(void *)off_1E5DAB010, *((void *)off_1E5DAB010 + 1), *((void *)off_1E5DAB010 + 2), *((void *)off_1E5DAB010 + 3), *(void *)(MEMORY[0x1E4F1DAB8] + 32), *(void *)(MEMORY[0x1E4F1DAB8] + 40), *(void *)(MEMORY[0x1E4F1DAB8] + 16), *(void *)(MEMORY[0x1E4F1DAB8] + 24), *MEMORY[0x1E4F1DAB8], *(void *)(MEMORY[0x1E4F1DAB8] + 8));
      [v13 CGRectValue];

      PXRectGetCenter();
    }
  }
}

- (unint64_t)numberOfGeometriesWithKind:(int64_t)a3
{
  [(PXMemoriesFeedEntryLayoutGenerator *)self _prepareLayoutIfNeeded];
  if (a3 == 2) {
    return [(PXMemoriesFeedLayoutGenerator *)self includeDateHeader];
  }
  if (a3) {
    return 0;
  }
  return [(PXMemoriesFeedEntryLayoutGenerator *)self itemCount];
}

- (id)geometryKinds
{
  return self->_geometryKinds;
}

- (CGSize)size
{
  [(PXMemoriesFeedEntryLayoutGenerator *)self _prepareLayoutIfNeeded];
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)estimatedSize
{
  [(PXMemoriesFeedEntryLayoutGenerator *)self _prepareLayoutIfNeeded];
  [(PXMemoriesFeedEntryLayoutGenerator *)self size];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (PXMemoriesFeedEntryLayoutGenerator)initWithMetrics:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXMemoriesFeedEntryLayoutGenerator;
  double v5 = [(PXMemoriesFeedLayoutGenerator *)&v11 initWithMetrics:v4];
  if (v5)
  {
    uint64_t v6 = [v4 spec];
    spec = v5->_spec;
    v5->_spec = (PXMemoriesSpec *)v6;

    v8 = [MEMORY[0x1E4F28E60] indexSetWithIndex:0];
    [(NSIndexSet *)v8 addIndex:2];
    geometryKinds = v5->_geometryKinds;
    v5->_geometryKinds = v8;

    v5->_layoutAxis = 1;
  }

  return v5;
}

@end