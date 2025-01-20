@interface PXAspectFitLayoutGenerator
- (CGSize)estimatedSize;
- (CGSize)size;
- (PXAspectFitLayoutGenerator)initWithMetrics:(id)a3;
- (_PXLayoutGeometry)_geometryForItemAtIndex:(SEL)a3 atPosition:(unint64_t)a4 withHorizontalGap:(CGPoint)a5;
- (_PXLayoutGeometry)_lastGeometry;
- (double)_rowHeightForItemsInRange:(_NSRange)a3;
- (void)_computeGeometriesIfNeeded;
- (void)_fillRowFromIndex:(int64_t *)a3 withCount:(int64_t)a4;
- (void)_prepareGeometriesForCount:(unint64_t)a3;
- (void)dealloc;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
- (void)invalidate;
@end

@implementation PXAspectFitLayoutGenerator

- (_PXLayoutGeometry)_geometryForItemAtIndex:(SEL)a3 atPosition:(unint64_t)a4 withHorizontalGap:(CGPoint)a5
{
  v7 = [(PXAspectFitLayoutGenerator *)self itemLayoutInfoBlock];
  v7[2](v7, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v9 size];
  PXSizeGetAspectRatio();
}

- (double)_rowHeightForItemsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = [(PXAspectFitLayoutGenerator *)self metrics];
  if (location < location + length)
  {
    v7 = [(PXAspectFitLayoutGenerator *)self itemLayoutInfoBlock];
    v8 = v7[2](v7, location);

    [v8 size];
    PXSizeGetAspectRatio();
  }
  [v6 interTileSpacing];
  double v10 = v9;
  [v6 contentInsets];
  double v12 = v11 + ((double)length + -1.0) * v10;
  [v6 contentInsets];
  double v14 = v12 + v13;
  [v6 referenceSize];
  double v16 = (v15 - v14) / 0.0;

  return v16;
}

- (void)_fillRowFromIndex:(int64_t *)a3 withCount:(int64_t)a4
{
  v7 = [(PXAspectFitLayoutGenerator *)self metrics];
  [(PXAspectFitLayoutGenerator *)self _lastGeometry];
  int64_t v8 = *a3;
  if (*a3 < 1) {
    [v7 contentInsets];
  }
  else {
    [v7 interTileSpacing];
  }
  double v10 = v9;
  -[PXAspectFitLayoutGenerator _rowHeightForItemsInRange:](self, "_rowHeightForItemsInRange:", v8, a4);
  double v12 = v11;
  self->_currentRowUnmodifiedHeight = v11;
  [v7 referenceSize];
  double v14 = v13;
  [v7 minRowAspectRatio];
  double v16 = v14 / v15;
  if (v12 < v16) {
    double v16 = v12;
  }
  self->_currentRowFinalHeight = v16;
  if (a4 >= 1)
  {
    [v7 contentInsets];
    -[PXAspectFitLayoutGenerator _geometryForItemAtIndex:atPosition:withHorizontalGap:](self, "_geometryForItemAtIndex:atPosition:withHorizontalGap:", v8, 0.0, v10 + 0.0 * 0.5 + 0.0, v17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      0);
    v18 = &self->_geometries[v8];
    *(_OWORD *)&v18->var0 = v19;
    *(_OWORD *)&v18->var1.y = v20;
    *(_OWORD *)&v18->var3.d = v23;
    *(_OWORD *)&v18->var3.ty = v24;
    *(_OWORD *)&v18->var2.height = v21;
    *(_OWORD *)&v18->var3.b = v22;
    v18->var7.height = v28;
    *(_OWORD *)&v18->var6.origin.y = v26;
    *(_OWORD *)&v18->var6.size.height = v27;
    *(_OWORD *)&v18->var5 = v25;
    PXRectWithCenterAndSize();
  }
  *a3 = v8 & ~(v8 >> 63);
}

- (void)_computeGeometriesIfNeeded
{
  if (!self->_geometries || [(PXAspectFitLayoutGenerator *)self itemCount] > self->_geometriesCount)
  {
    [(PXAspectFitLayoutGenerator *)self _prepareGeometriesForCount:[(PXAspectFitLayoutGenerator *)self itemCount]];
    v3 = [(PXAspectFitLayoutGenerator *)self metrics];
    self->_lastGeometryIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v4 = [v3 minTilesPerRow];
    *(void *)&long long v17 = 0;
    unint64_t geometriesCount = self->_geometriesCount;
    if (geometriesCount)
    {
      uint64_t v6 = v4;
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = geometriesCount - v7;
        uint64_t v9 = objc_msgSend(v3, "maxTilesPerRow", (void)v17);
        if (v9 >= v8) {
          uint64_t v10 = v8;
        }
        else {
          uint64_t v10 = v9;
        }
        if (v9 < v8)
        {
          uint64_t v11 = v8 - v6;
          if (v6 > v8 - v6) {
            uint64_t v11 = v6;
          }
          if (v10 >= v11) {
            uint64_t v10 = v11;
          }
        }
        [(PXAspectFitLayoutGenerator *)self _fillRowFromIndex:&v17 withCount:v10];
        uint64_t v12 = v17;
        self->_lastGeometryIndex = v17;
        unint64_t v7 = v12 + 1;
        *(void *)&long long v17 = v7;
        unint64_t geometriesCount = self->_geometriesCount;
      }
      while (v7 < geometriesCount);
    }
    uint64_t v26 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    [(PXAspectFitLayoutGenerator *)self _lastGeometry];
    [v3 referenceSize];
    p_contentSize = &self->_contentSize;
    p_contentSize->width = v14;
    double v15 = *(double *)&v18 + *(double *)&v19 * 0.5;
    [v3 contentInsets];
    p_contentSize->height = v15 + v16;
  }
}

- (_PXLayoutGeometry)_lastGeometry
{
  long long v4 = *((_OWORD *)off_1E5DAAFE8 + 7);
  *(_OWORD *)&retstr->var5 = *((_OWORD *)off_1E5DAAFE8 + 6);
  *(_OWORD *)&retstr->var6.origin.y = v4;
  *(_OWORD *)&retstr->var6.size.height = *((_OWORD *)off_1E5DAAFE8 + 8);
  retstr->var7.height = *((CGFloat *)off_1E5DAAFE8 + 18);
  long long v5 = *((_OWORD *)off_1E5DAAFE8 + 3);
  *(_OWORD *)&retstr->var2.height = *((_OWORD *)off_1E5DAAFE8 + 2);
  *(_OWORD *)&retstr->var3.b = v5;
  long long v6 = *((_OWORD *)off_1E5DAAFE8 + 5);
  *(_OWORD *)&retstr->var3.d = *((_OWORD *)off_1E5DAAFE8 + 4);
  *(_OWORD *)&retstr->var3.ty = v6;
  long long v7 = *((_OWORD *)off_1E5DAAFE8 + 1);
  *(_OWORD *)&retstr->var0 = *(_OWORD *)off_1E5DAAFE8;
  *(_OWORD *)&retstr->var1.y = v7;
  CGFloat c = self->var3.c;
  if (c != NAN)
  {
    uint64_t v9 = self;
    if (*(void *)&c >= *(void *)&self->var3.b)
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a3, v9, @"PXAspectFitLayoutGenerator.m", 120, @"last Geometry index is out of bounds %ld >= %ld", *(void *)&v9->var3.c, *(void *)&v9->var3.b);

      CGFloat c = v9->var3.c;
    }
    uint64_t v10 = *(void *)&v9->var3.a + 152 * *(void *)&c;
    long long v11 = *(_OWORD *)(v10 + 112);
    *(_OWORD *)&retstr->var5 = *(_OWORD *)(v10 + 96);
    *(_OWORD *)&retstr->var6.origin.y = v11;
    *(_OWORD *)&retstr->var6.size.height = *(_OWORD *)(v10 + 128);
    retstr->var7.height = *(CGFloat *)(v10 + 144);
    long long v12 = *(_OWORD *)(v10 + 48);
    *(_OWORD *)&retstr->var2.height = *(_OWORD *)(v10 + 32);
    *(_OWORD *)&retstr->var3.b = v12;
    long long v13 = *(_OWORD *)(v10 + 80);
    *(_OWORD *)&retstr->var3.d = *(_OWORD *)(v10 + 64);
    *(_OWORD *)&retstr->var3.ty = v13;
    long long v14 = *(_OWORD *)(v10 + 16);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)v10;
    *(_OWORD *)&retstr->var1.y = v14;
  }
  return self;
}

- (void)_prepareGeometriesForCount:(unint64_t)a3
{
  if (self->_geometriesCount < a3)
  {
    self->_geometries = (_PXLayoutGeometry *)malloc_type_realloc(self->_geometries, 152 * a3, 0x100004050011849uLL);
    self->_unint64_t geometriesCount = a3;
  }
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    int64_t location = a4.location;
    id v28 = [(PXAspectFitLayoutGenerator *)self metrics];
    [v28 referenceSize];
    if (v11 <= 0.0)
    {
      long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"PXAspectFitLayoutGenerator.m" lineNumber:95 description:&stru_1F00B0030];
    }
    if (![(PXAspectFitLayoutGenerator *)self itemCount])
    {
      uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"PXAspectFitLayoutGenerator.m" lineNumber:96 description:&stru_1F00B0030];
    }
    uint64_t v12 = length + location - 1;
    if (v12 < 0 || v12 >= (unint64_t)[(PXAspectFitLayoutGenerator *)self itemCount])
    {
      long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v30.int64_t location = location;
      v30.NSUInteger length = length;
      long long v24 = NSStringFromRange(v30);
      [v23 handleFailureInMethod:a2, self, @"PXAspectFitLayoutGenerator.m", 98, @"range %@ out of bounds %ld", v24, -[PXAspectFitLayoutGenerator itemCount](self, "itemCount") object file lineNumber description];
    }
    [(PXAspectFitLayoutGenerator *)self _computeGeometriesIfNeeded];
    if ([(PXAspectFitLayoutGenerator *)self itemCount] != self->_geometriesCount)
    {
      long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:self file:@"PXAspectFitLayoutGenerator.m" lineNumber:102 description:@"The number of geometries should be the "];
    }
    if (location <= v12)
    {
      int64_t v13 = location;
      do
      {
        long long v14 = &a3[v13];
        double v15 = &self->_geometries[v13];
        long long v17 = *(_OWORD *)&v15->var6.origin.y;
        long long v16 = *(_OWORD *)&v15->var6.size.height;
        CGFloat height = v15->var7.height;
        *(_OWORD *)&v14->var5 = *(_OWORD *)&v15->var5;
        long long v19 = *(_OWORD *)&v15->var1.y;
        *(_OWORD *)&v14->var0 = *(_OWORD *)&v15->var0;
        *(_OWORD *)&v14->var1.y = v19;
        long long v20 = *(_OWORD *)&v15->var2.height;
        long long v21 = *(_OWORD *)&v15->var3.b;
        long long v22 = *(_OWORD *)&v15->var3.ty;
        *(_OWORD *)&v14->var3.d = *(_OWORD *)&v15->var3.d;
        *(_OWORD *)&v14->var3.ty = v22;
        *(_OWORD *)&v14->var2.CGFloat height = v20;
        *(_OWORD *)&v14->var3.b = v21;
        v14->var7.CGFloat height = height;
        *(_OWORD *)&v14->var6.origin.y = v17;
        *(_OWORD *)&v14->var6.size.CGFloat height = v16;
        v14->var5 = a5;
        ++v13;
        --length;
      }
      while (length);
    }
  }
}

- (CGSize)size
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)estimatedSize
{
  v3 = [(PXAspectFitLayoutGenerator *)self metrics];
  if ([(PXAspectFitLayoutGenerator *)self itemCount]) {
    uint64_t v4 = [(PXAspectFitLayoutGenerator *)self itemCount];
  }
  else {
    uint64_t v4 = 10;
  }
  [v3 referenceSize];
  double v6 = v5;
  uint64_t v7 = v4 / [v3 maxTilesPerRow];
  [v3 minRowAspectRatio];
  double v9 = v6 / v8 * (double)v7;

  double v10 = v6;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)PXAspectFitLayoutGenerator;
  [(PXAspectFitLayoutGenerator *)&v3 invalidate];
  self->_unint64_t geometriesCount = 0;
}

- (void)dealloc
{
  geometries = self->_geometries;
  if (geometries)
  {
    free(geometries);
    self->_geometries = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXAspectFitLayoutGenerator;
  [(PXAspectFitLayoutGenerator *)&v4 dealloc];
}

- (PXAspectFitLayoutGenerator)initWithMetrics:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXAspectFitLayoutGenerator;
  CGSize result = [(PXAspectFitLayoutGenerator *)&v4 initWithMetrics:a3];
  if (result)
  {
    result->_geometries = 0;
    result->_lastGeometryIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

@end