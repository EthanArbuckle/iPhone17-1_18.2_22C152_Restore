@interface PXGGeneratedSublayoutComposition
- (CGRect)contentBounds;
- (PXLayoutGenerator)configuredLayoutGenerator;
- (void)dealloc;
- (void)referenceSizeDidChange;
- (void)updateEstimatedSublayoutGeometries;
- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4;
@end

@implementation PXGGeneratedSublayoutComposition

- (void).cxx_destruct
{
}

- (PXLayoutGenerator)configuredLayoutGenerator
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGGeneratedSublayoutComposition.m", 89, @"Method %s is a responsibility of subclass %@", "-[PXGGeneratedSublayoutComposition configuredLayoutGenerator]", v6 object file lineNumber description];

  abort();
}

- (CGRect)contentBounds
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PXLayoutGenerator *)self->_layoutGenerator size];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__PXGGeneratedSublayoutComposition_updateSublayoutGeometriesFromAnchorSublayoutIndex_usingSublayoutUpdateBlock___block_invoke;
  aBlock[3] = &unk_1E5DD36A0;
  id v7 = v6;
  id v14 = v7;
  double v8 = (void (**)(void *, int64_t))_Block_copy(aBlock);
  v8[2](v8, a3);
  if (a3 >= 1)
  {
    int64_t v9 = 0;
    do
      v8[2](v8, v9++);
    while (a3 != v9);
  }
  int64_t v10 = [(PXGSublayoutComposition *)self numberOfSublayouts];
  int64_t v11 = a3 + 1;
  if (v11 < v10)
  {
    int64_t v12 = v10;
    do
      v8[2](v8, v11++);
    while (v12 != v11);
  }
}

uint64_t __112__PXGGeneratedSublayoutComposition_updateSublayoutGeometriesFromAnchorSublayoutIndex_usingSublayoutUpdateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateEstimatedSublayoutGeometries
{
  double v4 = [(PXGGeneratedSublayoutComposition *)self configuredLayoutGenerator];
  layoutGenerator = self->_layoutGenerator;
  self->_layoutGenerator = v4;

  uint64_t v6 = [(PXGSublayoutComposition *)self numberOfSublayouts];
  id v7 = self;
  [(PXGSublayoutComposition *)v7 sublayoutGeometries];
  if ([(PXLayoutGenerator *)self->_layoutGenerator numberOfGeometriesWithKind:0] != v6)
  {
    int64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:v7 file:@"PXGGeneratedSublayoutComposition.m" lineNumber:44 description:@"count mismatch"];
  }
  uint64_t layoutGeometriesCapacity = v7->_layoutGeometriesCapacity;
  if (v6 > layoutGeometriesCapacity)
  {
    int64_t v9 = v6;
    if (layoutGeometriesCapacity >= 1)
    {
      int64_t v9 = v7->_layoutGeometriesCapacity;
      do
        v9 *= 2;
      while (v9 < v6);
    }
    v7->_uint64_t layoutGeometriesCapacity = v9;
    _PXGArrayResize();
  }
  -[PXLayoutGenerator getGeometries:inRange:withKind:](self->_layoutGenerator, "getGeometries:inRange:withKind:", v7->_layoutGeometries, 0, v6, 0);
  if (v6 >= 1) {
    PXRectWithCenterAndSize();
  }
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGGeneratedSublayoutComposition;
  [(PXGSublayoutComposition *)&v3 referenceSizeDidChange];
  [(PXGSublayoutComposition *)self invalidateEstimatedSublayoutGeometries];
}

- (void)dealloc
{
  free(self->_layoutGeometries);
  v3.receiver = self;
  v3.super_class = (Class)PXGGeneratedSublayoutComposition;
  [(PXGGeneratedSublayoutComposition *)&v3 dealloc];
}

@end