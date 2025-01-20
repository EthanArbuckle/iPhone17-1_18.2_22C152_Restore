@interface PXMessagesStackItemsLayoutHelper
- ($559C86641F1F299F94BFFDDA7F58F470)baseGeometryForIndex:(SEL)a3 visibleRect:(int64_t)a4;
- (CGSize)maxItemSizeForReferenceSize:(CGSize)a3;
- (NSArray)normalizedStackHorizontalOffsets;
- (PXMessagesStackItemsLayoutHelper)init;
- (double)horizontalContentMarginForReferenceSize:(CGSize)a3 itemAspect:(double)a4;
- (double)normalizedContentInsets;
- (double)normalizedStackSizeTransform;
- (double)normalizedStackVerticalOffset;
- (double)rotationAngle;
- (unint64_t)stackedItemsCount;
- (unint64_t)zOrderArchSide;
- (void)_swapBaseZPositions;
- (void)_updateInternalState;
- (void)dealloc;
- (void)getGeometries:(id *)a3 count:(unint64_t)a4 forVisibleRect:(CGRect)a5 focus:(double)a6 archSide:(unint64_t)a7 keyframeOverride:(int64_t)a8;
- (void)performChanges:(id)a3;
- (void)setNormalizedContentInsets:(double)a3;
- (void)setNormalizedStackHorizontalOffsets:(id)a3;
- (void)setNormalizedStackSizeTransform:(double)a3;
- (void)setNormalizedStackVerticalOffset:(double)a3;
- (void)setRotationAngle:(double)a3;
- (void)setStackedItemsCount:(unint64_t)a3;
- (void)setZOrderArchSide:(unint64_t)a3;
@end

@implementation PXMessagesStackItemsLayoutHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedStackHorizontalOffsets, 0);
  objc_storeStrong((id *)&self->_frameSolver, 0);
}

- (unint64_t)zOrderArchSide
{
  return self->_zOrderArchSide;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setNormalizedContentInsets:(double)a3
{
  self->_normalizedContentInsets = a3;
}

- (double)normalizedContentInsets
{
  return self->_normalizedContentInsets;
}

- (void)setNormalizedStackVerticalOffset:(double)a3
{
  self->_normalizedStackVerticalOffset = a3;
}

- (double)normalizedStackVerticalOffset
{
  return self->_normalizedStackVerticalOffset;
}

- (void)setNormalizedStackHorizontalOffsets:(id)a3
{
}

- (NSArray)normalizedStackHorizontalOffsets
{
  return self->_normalizedStackHorizontalOffsets;
}

- (void)setNormalizedStackSizeTransform:(double)a3
{
  self->_normalizedStackSizeTransform = a3;
}

- (double)normalizedStackSizeTransform
{
  return self->_normalizedStackSizeTransform;
}

- (void)setStackedItemsCount:(unint64_t)a3
{
  self->_stackedItemsCount = a3;
}

- (unint64_t)stackedItemsCount
{
  return self->_stackedItemsCount;
}

- ($559C86641F1F299F94BFFDDA7F58F470)baseGeometryForIndex:(SEL)a3 visibleRect:(int64_t)a4
{
  double y = a5.origin.y;
  double x = a5.origin.x;
  v9 = self;
  if (a4 < 0 || *(void *)&self->var1.width <= (unint64_t)a4)
  {
    CGFloat width = a5.size.width;
    CGFloat height = a5.size.height;
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a3, v9, @"PXMessagesStackItemsLayoutHelper.m", 279, @"Invalid parameter not satisfying: %@", @"index >= 0 && index < _baseGeometriesSize" object file lineNumber description];

    a5.size.CGFloat width = width;
    a5.size.CGFloat height = height;
  }
  int64_t v11 = *(void *)&v9->var1.height + 80 * a4;
  CGSize v12 = *(CGSize *)(v11 + 16);
  retstr->var0 = *(CGPoint *)v11;
  retstr->var1 = v12;
  long long v13 = *(_OWORD *)(v11 + 32);
  long long v14 = *(_OWORD *)(v11 + 64);
  *(_OWORD *)&retstr->var4 = *(_OWORD *)(v11 + 48);
  *(_OWORD *)&retstr->var6 = v14;
  *(double *)&long long v14 = y + retstr->var0.y * a5.size.height;
  retstr->var0.double x = x + retstr->var0.x * a5.size.width;
  *(void *)&retstr->var0.double y = v14;
  CGFloat v15 = a5.size.height;
  retstr->var1 = (CGSize)vmulq_f64((float64x2_t)a5.size, (float64x2_t)retstr->var1);
  *(_OWORD *)&retstr->var2 = v13;
  return self;
}

- (double)horizontalContentMarginForReferenceSize:(CGSize)a3 itemAspect:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v9 = [(PXMessagesStackItemsLayoutHelper *)self stackedItemsCount] + 1;
  if (v9 >= self->_baseGeometriesSize)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayoutHelper.m", 270, @"Invalid parameter not satisfying: %@", @"centralIndex < _baseGeometriesSize" object file lineNumber description];
  }
  MEMORY[0x1AD10BC20](a4, width * self->_baseGeometries[v9].var1.width, height * self->_baseGeometries[v9].var1.height);
  PXRectWithCenterAndSize();
}

- (CGSize)maxItemSizeForReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v7 = [(PXMessagesStackItemsLayoutHelper *)self stackedItemsCount] + 1;
  if (v7 >= self->_baseGeometriesSize)
  {
    int64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayoutHelper.m", 262, @"Invalid parameter not satisfying: %@", @"centralIndex < _baseGeometriesSize" object file lineNumber description];
  }
  v8 = &self->_baseGeometries[v7];
  double v9 = width * v8->var1.width;
  double v10 = height * v8->var1.height;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)getGeometries:(id *)a3 count:(unint64_t)a4 forVisibleRect:(CGRect)a5 focus:(double)a6 archSide:(unint64_t)a7 keyframeOverride:(int64_t)a8
{
  int64_t v13 = 2 * [(PXMessagesStackItemsLayoutHelper *)self stackedItemsCount] + 3;
  unint64_t v14 = [(PXMessagesStackItemsLayoutHelper *)self stackedItemsCount];
  if (v13 != a4)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayoutHelper.m", 182, @"Invalid parameter not satisfying: %@", @"totalItemCount == count" object file lineNumber description];
  }
  if (v13 > self->_baseGeometriesSize)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayoutHelper.m", 183, @"Invalid parameter not satisfying: %@", @"totalItemCount <= _baseGeometriesSize" object file lineNumber description];
  }
  if (a7 - 1 <= 1) {
    [(PXMessagesStackItemsLayoutHelper *)self setZOrderArchSide:a7];
  }
  if (v13 >= 1)
  {
    unint64_t v15 = v14 + 1;
    if (a6 <= 0.0)
    {
      uint64_t v16 = 0;
      if (a6 < 0.0) {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = v13 > 1;
    }
    if (a7 == 2)
    {
      if (!v15) {
        goto LABEL_18;
      }
    }
    else if (a7 == 1 && v16 == v15)
    {
LABEL_18:
      PXFloatByParabolicallyInterpolatingFloats();
    }
    PXFloatByLinearlyInterpolatingFloats();
  }
}

- (void)setZOrderArchSide:(unint64_t)a3
{
  if (self->_zOrderArchSide != a3)
  {
    self->_zOrderArchSide = a3;
    [(PXMessagesStackItemsLayoutHelper *)self _swapBaseZPositions];
  }
}

- (void)_swapBaseZPositions
{
  unint64_t v4 = [(PXMessagesStackItemsLayoutHelper *)self stackedItemsCount];
  uint64_t v5 = 2 * v4;
  if (2 * v4 + 3 > self->_baseGeometriesSize)
  {
    int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayoutHelper.m", 96, @"Invalid parameter not satisfying: %@", @"expectedCount <= _baseGeometriesSize" object file lineNumber description];
  }
  uint64_t v6 = v5 + 2;
  if (v5 + 2 >= 1)
  {
    baseGeometries = self->_baseGeometries;
    p_var2 = (uint64_t *)&baseGeometries[2 * v4 + 2].var2;
    double v9 = (uint64_t *)&baseGeometries->var2;
    uint64_t v10 = 1;
    do
    {
      uint64_t v11 = *v9;
      uint64_t *v9 = *p_var2;
      v9 += 10;
      uint64_t *p_var2 = v11;
      p_var2 -= 10;
    }
    while (v10++ < --v6);
  }
}

- (void)_updateInternalState
{
  unint64_t v4 = [(PXMessagesStackItemsLayoutHelper *)self stackedItemsCount];
  unint64_t v5 = 2 * v4 + 3;
  if (v5 > self->_baseGeometriesSize)
  {
    self->_baseGeometriesSize = v5;
    uint64_t v6 = ($559C86641F1F299F94BFFDDA7F58F470 *)malloc_type_realloc(self->_baseGeometries, 80 * v5, 0x10000404247E4FDuLL);
    self->_baseGeometries = v6;
    if (!v6)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"PXMessagesStackItemsLayoutHelper.m" lineNumber:72 description:@"Unable to reallocate memory for geometries"];
    }
  }
  [(PXMessagesStackItemsLayoutHelper *)self rotationAngle];
  double v8 = v7;
  [(PFMessagesStackLayoutFrameSolver *)self->_frameSolver setStackedItemsCount:v4];
  [(PXMessagesStackItemsLayoutHelper *)self normalizedContentInsets];
  -[PFMessagesStackLayoutFrameSolver setNormalizedVerticalInsets:](self->_frameSolver, "setNormalizedVerticalInsets:");
  [(PXMessagesStackItemsLayoutHelper *)self normalizedStackVerticalOffset];
  -[PFMessagesStackLayoutFrameSolver setNormalizedVerticalOffset:](self->_frameSolver, "setNormalizedVerticalOffset:");
  [(PXMessagesStackItemsLayoutHelper *)self normalizedStackSizeTransform];
  -[PFMessagesStackLayoutFrameSolver setNormalizedSizeTransform:](self->_frameSolver, "setNormalizedSizeTransform:");
  [(PFMessagesStackLayoutFrameSolver *)self->_frameSolver setRotationAngle:v8];
  double v9 = [(PXMessagesStackItemsLayoutHelper *)self normalizedStackHorizontalOffsets];
  [(PFMessagesStackLayoutFrameSolver *)self->_frameSolver setNormalizedHorizontalOffsets:v9];

  [(PFMessagesStackLayoutFrameSolver *)self->_frameSolver getGeometries:self->_baseGeometries count:self->_baseGeometriesSize];
  self->_zOrderArchSide = 2;
  uint64_t v10 = &self->_baseGeometries[v4];
  self->_initialItemCentralGeometry.center = v10[1].var0;
  CGSize var1 = v10[1].var1;
  long long v12 = *(_OWORD *)&v10[1].var2;
  long long v13 = *(_OWORD *)&v10[1].var6;
  *(_OWORD *)&self->_initialItemCentralGeometry.alpha = *(_OWORD *)&v10[1].var4;
  *(_OWORD *)&self->_initialItemCentralGeometry.tapbackScale = v13;
  self->_initialItemCentralGeometry.size = var1;
  *(_OWORD *)&self->_initialItemCentralGeometry.zPos = v12;
  long long v15 = *(_OWORD *)&v10[1].var4;
  long long v14 = *(_OWORD *)&v10[1].var6;
  long long v16 = *(_OWORD *)&v10[1].var2;
  self->_finalItemCentralGeometry.size = v10[1].var1;
  *(_OWORD *)&self->_finalItemCentralGeometry.zPos = v16;
  *(_OWORD *)&self->_finalItemCentralGeometry.alpha = v15;
  *(_OWORD *)&self->_finalItemCentralGeometry.tapbackScale = v14;
  self->_finalItemCentralGeometry.center = v10[1].var0;
  v17 = +[PXMessagesUISettings sharedInstance];
  LODWORD(v9) = [v17 applyRotationToFirstAndLast];

  if (v9)
  {
    self->_initialItemCentralGeometry.rotationAngle = -v8;
    self->_finalItemCentralGeometry.rotationAngle = v8;
  }
}

- (void)performChanges:(id)a3
{
  ++self->_nestedChanges;
  (*((void (**)(id, PXMessagesStackItemsLayoutHelper *))a3 + 2))(a3, self);
  unint64_t v4 = self->_nestedChanges - 1;
  self->_nestedChanges = v4;
  if (!v4)
  {
    [(PXMessagesStackItemsLayoutHelper *)self _updateInternalState];
  }
}

- (void)dealloc
{
  baseGeometries = self->_baseGeometries;
  if (baseGeometries)
  {
    free(baseGeometries);
    self->_baseGeometries = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXMessagesStackItemsLayoutHelper;
  [(PXMessagesStackItemsLayoutHelper *)&v4 dealloc];
}

- (PXMessagesStackItemsLayoutHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXMessagesStackItemsLayoutHelper;
  v2 = [(PXMessagesStackItemsLayoutHelper *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_baseGeometriesSize = 7;
    v2->_baseGeometries = ($559C86641F1F299F94BFFDDA7F58F470 *)malloc_type_calloc(7uLL, 0x50uLL, 0x10000404247E4FDuLL);
    objc_super v4 = (PFMessagesStackLayoutFrameSolver *)objc_alloc_init(MEMORY[0x1E4F8CC40]);
    frameSolver = v3->_frameSolver;
    v3->_frameSolver = v4;
  }
  return v3;
}

@end