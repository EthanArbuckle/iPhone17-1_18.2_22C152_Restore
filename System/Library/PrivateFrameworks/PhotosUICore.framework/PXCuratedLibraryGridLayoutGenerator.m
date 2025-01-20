@interface PXCuratedLibraryGridLayoutGenerator
- (CGSize)estimatedSize;
- (CGSize)size;
- (PXCuratedLibraryGridLayoutGenerator)initWithMetrics:(id)a3;
- (_NSRange)geometriesRangeCoveringRect:(CGRect)a3;
- (_PXCornerSpriteIndexes)cornerSpriteIndexes;
- (double)lastFullRowBottomEdge;
- (void)_prepareGeometriesBufferForCount:(unint64_t)a3;
- (void)_prepareIfNeeded;
- (void)dealloc;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
- (void)invalidate;
@end

@implementation PXCuratedLibraryGridLayoutGenerator

- (_PXCornerSpriteIndexes)cornerSpriteIndexes
{
  p_cornerSpriteIndexes = &self->_cornerSpriteIndexes;
  uint64_t v3 = *(void *)&self->_cornerSpriteIndexes.topLeft;
  uint64_t v4 = *(void *)&p_cornerSpriteIndexes->bottomLeft;
  result.bottomLeft = v4;
  result.bottomRight = HIDWORD(v4);
  result.topLeft = v3;
  result.topRight = HIDWORD(v3);
  return result;
}

- (_NSRange)geometriesRangeCoveringRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PXCuratedLibraryGridLayoutGenerator *)self _prepareIfNeeded];
  uint64_t v8 = [(PXCuratedLibraryGridLayoutGenerator *)self itemCount];
  uint64_t v9 = v8 - 1;
  if (v8 < 1) {
    goto LABEL_8;
  }
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  unint64_t v10 = vcvtmd_s64_f64((CGRectGetMinY(v21) - self->_insets.top + self->_interItemSpacing)/ (self->_interItemSpacing + self->_itemSize.height));
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  uint64_t v11 = (uint64_t)(ceil((CGRectGetMaxY(v22) - self->_insets.top) / (self->_itemSize.height + self->_interItemSpacing))
                + -1.0);
  v12 = [(PXCuratedLibraryGridLayoutGenerator *)self metrics];
  uint64_t v13 = [v12 numberOfColumns];

  uint64_t v14 = v13 * v10;
  if ((uint64_t)(v13 * v10) >= v9) {
    uint64_t v14 = v9;
  }
  int64_t v15 = v14 & ~(v14 >> 63);
  uint64_t v16 = v13 + v13 * v11 - 1;
  if (v16 >= v9) {
    uint64_t v16 = v9;
  }
  BOOL v17 = v16 < v15;
  uint64_t v18 = v16 - v15;
  if (v17)
  {
LABEL_8:
    NSUInteger v19 = 0;
    int64_t v15 = 0;
  }
  else
  {
    NSUInteger v19 = v18 + 1;
  }
  result.length = v19;
  result.location = v15;
  return result;
}

- (void)_prepareGeometriesBufferForCount:(unint64_t)a3
{
  if (self->_geometriesCount < a3)
  {
    self->_geometries = (_PXLayoutGeometry *)malloc_type_realloc(self->_geometries, 152 * a3, 0x100004050011849uLL);
    self->_geometriesCount = a3;
  }
}

- (void)_prepareIfNeeded
{
  if (self->_isPrepared) {
    return;
  }
  self->_isPrepared = 1;
  uint64_t v3 = [(PXCuratedLibraryGridLayoutGenerator *)self itemCount];
  uint64_t v4 = [(PXCuratedLibraryGridLayoutGenerator *)self keyItemIndex];
  if (v3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v3;
  }
  uint64_t v6 = v5 - 1;
  [(PXCuratedLibraryGridLayoutGenerator *)self _prepareGeometriesBufferForCount:v3];
  id v26 = [(PXCuratedLibraryGridLayoutGenerator *)self metrics];
  uint64_t v7 = [v26 numberOfColumns];
  [v26 referenceSize];
  double top = self->_insets.top;
  double height = self->_itemSize.height;
  double interItemSpacing = self->_interItemSpacing;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = v3;
  }
  double bottom = self->_insets.bottom;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v14 = self->_insets.top;
  }
  else
  {
    double v12 = v8 - self->_insets.left - self->_insets.right;
    [v26 headerAspectRatio];
    double v14 = top + v12 / v13 + self->_interItemSpacing;
  }
  uint64_t v15 = [v26 numberOfPrecedingAssets];
  if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = v15 % v7;
  }
  if (v3 >= 1)
  {
    if (!v4) {
      PXRectGetCenter();
    }
    PXRectGetCenter();
  }
  uint64_t v16 = (v7 + v25 + v6 - 1) / v7;
  double v17 = 0.0;
  if (v16 > 0) {
    double v17 = self->_interItemSpacing;
  }
  double v18 = bottom + v14 + (double)v16 * (height + interItemSpacing) - v17;
  objc_msgSend(v26, "referenceSize", 56);
  self->_actualSize.CGFloat width = v19;
  self->_actualSize.double height = v18;
  if ((v25 + v6) % v7 <= 0) {
    double v20 = 0.0;
  }
  else {
    double v20 = height + interItemSpacing;
  }
  self->_lastFullRowBottomEdge = v18 - bottom - v20;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    unsigned int v21 = v7 - v25;
  }
  else {
    unsigned int v21 = v4;
  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    unsigned int v22 = v25;
  }
  else {
    unsigned int v22 = v4;
  }
  self->_cornerSpriteIndexes.topLeft = v22;
  self->_cornerSpriteIndexes.topRight = v21;
  if (v16)
  {
    self->_cornerSpriteIndexes.bottomLeft = (v16 - 1) * v7 - v25;
    self->_cornerSpriteIndexes.bottomRight = v3;
    if (v4 <= ((v16 - 1) * v7 - v25)) {
      self->_cornerSpriteIndexes.bottomLeft = (v16 - 1) * v7 - v25 + 1;
    }
    if (v4 > v3) {
      goto LABEL_36;
    }
    uint64_t v23 = (v3 - 1);
    self->_cornerSpriteIndexes.bottomRight = v23;
    if (v4 != v23) {
      goto LABEL_36;
    }
    unsigned int v22 = v3 - 2;
  }
  else
  {
    self->_cornerSpriteIndexes.bottomLeft = v22;
  }
  self->_cornerSpriteIndexes.bottomRight = v22;
LABEL_36:
}

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v11 = a4.location + a4.length;
  if (a4.location + a4.length > [(PXCuratedLibraryGridLayoutGenerator *)self itemCount])
  {
    unsigned int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryGridLayoutGenerator.m" lineNumber:140 description:@"the range must be <= to the number of itemCount"];
  }
  [(PXCuratedLibraryGridLayoutGenerator *)self _prepareIfNeeded];
  if (location < v11)
  {
    NSUInteger v12 = location;
    do
    {
      double v13 = &a3[v12];
      double v14 = &self->_geometries[v12];
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

- (double)lastFullRowBottomEdge
{
  return self->_lastFullRowBottomEdge;
}

- (CGSize)size
{
  [(PXCuratedLibraryGridLayoutGenerator *)self _prepareIfNeeded];
  double width = self->_actualSize.width;
  double height = self->_actualSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)estimatedSize
{
  uint64_t v3 = [(PXCuratedLibraryGridLayoutGenerator *)self metrics];
  uint64_t v4 = [v3 numberOfColumns];
  double interItemSpacing = self->_interItemSpacing;
  CGFloat v6 = self->_insets.right
     + self->_insets.left
     + fmax(-(interItemSpacing - (double)v4 * (self->_itemSize.width + interItemSpacing)), 0.0);
  CGFloat v7 = self->_insets.top
     + fmax(-(interItemSpacing - (interItemSpacing + self->_itemSize.height) * 3.0), 0.0)
     + self->_insets.bottom;

  double v8 = v6;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryGridLayoutGenerator;
  [(PXCuratedLibraryGridLayoutGenerator *)&v3 invalidate];
  self->_isPrepared = 0;
}

- (void)dealloc
{
  free(self->_geometries);
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryGridLayoutGenerator;
  [(PXCuratedLibraryGridLayoutGenerator *)&v3 dealloc];
}

- (PXCuratedLibraryGridLayoutGenerator)initWithMetrics:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXCuratedLibraryGridLayoutGenerator;
  uint64_t v5 = [(PXCuratedLibraryGridLayoutGenerator *)&v24 initWithMetrics:v4];
  if (v5)
  {
    [v4 padding];
    CGFloat v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    double v13 = v12;
    [v4 referenceSize];
    double v15 = v14 - v9 - v13;
    uint64_t v16 = [v4 numberOfColumns];
    [v4 interitemSpacing];
    double v18 = v17;
    uint64_t v19 = [v4 style];
    if (v19 == 1)
    {
      [v4 screenScale];
      double v25 = 0.0;
      double v26 = 0.0;
      +[PXLayoutMetricInterpolator bestItemSizeForAvailableWidth:v16 screenScale:&v26 columns:&v25 bestSpacing:v15 bestInset:v22];
      double v18 = v26;
      double v9 = v9 + v25;
      double v13 = v13 + v25;
    }
    else if (v19)
    {
      CGFloat v7 = *(double *)off_1E5DAAF10;
      double v9 = *((double *)off_1E5DAAF10 + 1);
      CGFloat v11 = *((double *)off_1E5DAAF10 + 2);
      double v13 = *((double *)off_1E5DAAF10 + 3);
      double v20 = *MEMORY[0x1E4F1DB30];
      double v21 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else
    {
      double v20 = (v15 - (double)(v16 - 1) * v18) / (double)v16;
      double v21 = v20;
    }
    v5->_itemSize.double width = v20;
    v5->_itemSize.double height = v21;
    v5->_double interItemSpacing = v18;
    v5->_insets.double top = v7;
    v5->_insets.left = v9;
    v5->_insets.double bottom = v11;
    v5->_insets.right = v13;
    *(void *)&v5->_cornerSpriteIndexes.topLeft = -1;
    *(void *)&v5->_cornerSpriteIndexes.bottomLeft = -1;
  }

  return v5;
}

@end