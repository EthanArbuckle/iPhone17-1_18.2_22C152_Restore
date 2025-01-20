@interface PXGridLayoutGenerator
- (CGSize)estimatedSize;
- (CGSize)size;
- (PXGridLayoutGenerator)initWithMetrics:(id)a3;
- (id)geometryKinds;
- (unint64_t)numberOfGeometriesWithKind:(int64_t)a3;
- (void)_getAdditionalGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4;
- (void)_getContentGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4;
- (void)_getHeaderGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
- (void)getGeometry:(_PXLayoutGeometry *)a3 forItemAtIndex:(unint64_t)a4;
@end

@implementation PXGridLayoutGenerator

- (void).cxx_destruct
{
}

- (void)getGeometry:(_PXLayoutGeometry *)a3 forItemAtIndex:(unint64_t)a4
{
  id v13 = [(PXGridLayoutGenerator *)self metrics];
  [v13 headerSize];
  [v13 headerSpacing];
  if (![v13 axis])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXGridLayoutGenerator.m" lineNumber:302 description:@"axis == PXAxisUndefined"];
  }
  [v13 itemSize];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v13 interItemSpacing];
  [v13 contentInsets];
  a3->var2.width = v10;
  a3->var2.height = v12;
  a3->var0 = a4;
  PXRectGetCenter();
}

- (void)_getAdditionalGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = [(PXGridLayoutGenerator *)self itemCount];
  id v17 = [(PXGridLayoutGenerator *)self metrics];
  unint64_t v10 = [v17 additionalTileCount];
  [v17 referenceSize];
  if (v11 <= 0.0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXGridLayoutGenerator.m", 262, @"Invalid parameter not satisfying: %@", @"[metrics referenceSize].width > 0" object file lineNumber description];
  }
  unint64_t v12 = length + location - 1;
  if ((v12 & 0x8000000000000000) != 0 || v12 >= v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v19.NSUInteger location = location;
    v19.NSUInteger length = length;
    v16 = NSStringFromRange(v19);
    [v15 handleFailureInMethod:a2, self, @"PXGridLayoutGenerator.m", 264, @"range %@ out of bounds %lu", v16, v10 object file lineNumber description];
  }
  if (location <= v12)
  {
    id v13 = &a3[location];
    do
    {
      [(PXGridLayoutGenerator *)self getGeometry:v13 forItemAtIndex:v9 + location];
      v13->var5 = 1;
      ++location;
      ++v13;
    }
    while (location <= v12);
  }
}

- (void)_getHeaderGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4
{
  if (a4.length != 1)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4.location);
    [v6 handleFailureInMethod:a2, self, @"PXGridLayoutGenerator.m", 225, @"Invalid parameter not satisfying: %@", @"range.length == 1" object file lineNumber description];
  }
  id v7 = [(PXGridLayoutGenerator *)self metrics];
  [v7 headerSize];
  [v7 contentInsets];
  [v7 referenceSize];
  PXEdgeInsetsInsetSize();
}

- (void)_getContentGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v9 = [(PXGridLayoutGenerator *)self itemCount];
  id v17 = [(PXGridLayoutGenerator *)self metrics];
  [v17 referenceSize];
  if (v10 <= 0.0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXGridLayoutGenerator.m", 212, @"Invalid parameter not satisfying: %@", @"[metrics referenceSize].width > 0" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_12:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXGridLayoutGenerator.m", 213, @"Invalid parameter not satisfying: %@", @"itemCount > 0" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_12;
  }
LABEL_3:
  unint64_t v11 = length + location - 1;
  if ((v11 & 0x8000000000000000) != 0 || v11 >= v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v19.NSUInteger location = location;
    v19.NSUInteger length = length;
    v16 = NSStringFromRange(v19);
    [v15 handleFailureInMethod:a2, self, @"PXGridLayoutGenerator.m", 215, @"range %@ out of bounds %lu", v16, v9 object file lineNumber description];
  }
  if (location <= v11)
  {
    unint64_t v12 = &a3[location];
    do
    {
      [(PXGridLayoutGenerator *)self getGeometry:v12 forItemAtIndex:location];
      v12->var5 = 0;
      ++location;
      ++v12;
    }
    while (location <= v11);
  }
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  if (a4.length)
  {
    switch(a5)
    {
      case 0:
        [(PXGridLayoutGenerator *)self _getContentGeometries:a3 inRange:a4.location];
        break;
      case 1:
        [(PXGridLayoutGenerator *)self _getAdditionalGeometries:a3 inRange:a4.location];
        break;
      case 2:
        [(PXGridLayoutGenerator *)self _getHeaderGeometries:a3 inRange:a4.location];
        break;
      case 3:
        objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4.location);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        [v7 handleFailureInMethod:a2 object:self file:@"PXGridLayoutGenerator.m" lineNumber:204 description:@"Footer tiles not supported"];

        break;
      default:
        return;
    }
  }
}

- (CGSize)size
{
  v4 = [(PXGridLayoutGenerator *)self metrics];
  double v6 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  [v4 itemSize];
  double v39 = v8;
  double v40 = v7;
  [v4 interItemSpacing];
  double v10 = v9;
  double v12 = v11;
  [v4 contentInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v4 axis];
  uint64_t v22 = [(PXGridLayoutGenerator *)self itemCount];
  v23 = [(PXGridLayoutGenerator *)self metrics];
  uint64_t v24 = [v23 additionalTileCount];

  if (v21)
  {
    unint64_t v25 = v24 + v22;
    if (v21 == 2)
    {
      int64_t numberOfItemsWide = self->_numberOfItemsWide;
      [v4 referenceSize];
      double v5 = v33;
      if (numberOfItemsWide >= 1) {
        double v6 = v20 + v16 - (v10 - ceil((double)v25 / (double)numberOfItemsWide) * (v40 + v10));
      }
      [v4 headerSize];
      double v35 = v34;
      [v4 footerSize];
      double v6 = v6 + v35 + v36;
    }
    else if (v21 == 1)
    {
      double v26 = ceil((double)v25 / (double)self->_numberOfItemsWide);
      [v4 referenceSize];
      double v6 = v27;
      if (v26 > 0.0) {
        double v5 = v18 + v14 - (v12 - v26 * (v39 + v12));
      }
      [v4 headerSize];
      double v29 = v28;
      [v4 footerSize];
      double v5 = v5 + v29 + v30;
    }
  }
  else
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2 object:self file:@"PXGridLayoutGenerator.m" lineNumber:174 description:@"axis == PXAxisUndefined"];
  }
  double v37 = v6;
  double v38 = v5;
  result.height = v38;
  result.width = v37;
  return result;
}

- (CGSize)estimatedSize
{
  v4 = [(PXGridLayoutGenerator *)self metrics];
  double v5 = *MEMORY[0x1E4F1DB30];
  double v38 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  [v4 itemSize];
  double v7 = v6;
  double v37 = v8;
  [v4 interItemSpacing];
  double v10 = v9;
  double v12 = v11;
  [v4 contentInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v4 axis];
  if (v21)
  {
    if (v21 == 2)
    {
      [v4 referenceSize];
      double v29 = v28;
      double v30 = v20 + v16 - (v10 - (v7 + v10) * 3.0);
      [v4 headerSize];
      double v32 = v31;
      [v4 footerSize];
      double v34 = v32 + v33;
      double v22 = v29;
      double v5 = v30 + v34;
    }
    else
    {
      double v22 = v38;
      if (v21 == 1)
      {
        [v4 referenceSize];
        double v5 = v23;
        [v4 headerSize];
        double v25 = v24;
        [v4 footerSize];
        double v22 = v18 + v14 - (v12 - (v37 + v12) * 3.0) + v25 + v26;
      }
    }
  }
  else
  {
    double v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"PXGridLayoutGenerator.m" lineNumber:130 description:@"axis == PXAxisUndefined"];

    double v22 = v38;
  }

  double v35 = v5;
  double v36 = v22;
  result.height = v36;
  result.width = v35;
  return result;
}

- (unint64_t)numberOfGeometriesWithKind:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v11.receiver = self;
      v11.super_class = (Class)PXGridLayoutGenerator;
      return [(PXGridLayoutGenerator *)&v11 numberOfGeometriesWithKind:0];
    case 1:
      double v5 = [(PXGridLayoutGenerator *)self metrics];
      unint64_t v6 = [v5 additionalTileCount];

      return v6;
    case 2:
      double v8 = [(PXGridLayoutGenerator *)self metrics];
      unint64_t v4 = [v8 displaysHeaderTile];

      return v4;
    case 3:
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXGridLayoutGenerator.m" lineNumber:100 description:@"Footer tiles not supported"];

      return 0;
    default:
      return 0;
  }
}

- (id)geometryKinds
{
  return self->_geometrySet;
}

- (PXGridLayoutGenerator)initWithMetrics:(id)a3
{
  v34.receiver = self;
  v34.super_class = (Class)PXGridLayoutGenerator;
  v3 = [(PXGridLayoutGenerator *)&v34 initWithMetrics:a3];
  unint64_t v4 = v3;
  if (!v3) {
    return v4;
  }
  double v5 = [(PXGridLayoutGenerator *)v3 metrics];
  [v5 contentInsets];
  double v7 = v6;
  double v33 = v8;
  double v10 = v9;
  double v12 = v11;
  [v5 itemSize];
  double v32 = v13;
  double v15 = v14;
  [v5 interItemSpacing];
  double v17 = v16;
  double v19 = v18;
  [v5 referenceSize];
  double v21 = v20;
  double v23 = v22;
  uint64_t v24 = [v5 axis];
  if (v24 == 2)
  {
    double v25 = v19 + v23 - (v7 + v10) + 0.00000999999975;
    double v26 = v15 + v19;
  }
  else
  {
    if (v24 != 1)
    {
      unint64_t v27 = 1;
      goto LABEL_8;
    }
    double v25 = v17 + v21 - (v33 + v12) + 0.00000999999975;
    double v26 = v32 + v17;
  }
  unint64_t v27 = vcvtmd_s64_f64(v25 / v26);
LABEL_8:
  v4->_int64_t numberOfItemsWide = v27;
  double v28 = [MEMORY[0x1E4F28E60] indexSetWithIndex:0];
  if ([v5 displaysHeaderTile]) {
    [v28 addIndex:2];
  }
  if ([v5 additionalTileCount]) {
    [v28 addIndex:1];
  }
  uint64_t v29 = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndexSet:v28];
  geometrySet = v4->_geometrySet;
  v4->_geometrySet = (NSIndexSet *)v29;

  return v4;
}

@end