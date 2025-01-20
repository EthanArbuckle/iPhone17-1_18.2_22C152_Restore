@interface PXGStackedSublayoutComposition
- (CGRect)contentBounds;
- (PXGStackedSublayoutComposition)init;
- (UIEdgeInsets)padding;
- (double)interlayoutSpacing;
- (int64_t)axis;
- (void)referenceSizeDidChange;
- (void)setAxis:(int64_t)a3;
- (void)setInterlayoutSpacing:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)updateEstimatedSublayoutGeometries;
- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4;
@end

@implementation PXGStackedSublayoutComposition

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)interlayoutSpacing
{
  return self->_interlayoutSpacing;
}

- (int64_t)axis
{
  return self->_axis;
}

- (CGRect)contentBounds
{
  if ([(PXGSublayoutComposition *)self numberOfSublayouts])
  {
    v4 = self;
    [(PXGSublayoutComposition *)v4 sublayoutGeometries];
    if (![(PXGStackedSublayoutComposition *)v4 axis])
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:v4 file:@"PXGStackedSublayoutComposition.m" lineNumber:161 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    [(PXGStackedSublayoutComposition *)v4 padding];
    sub_1AB23B20C();
  }
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4
{
  id v5 = a4;
  [(PXGSublayoutComposition *)self numberOfSublayouts];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3010000000;
  v7[3] = &unk_1AB5D584F;
  long long v8 = *MEMORY[0x1E4F1DB30];
  double v6 = self;
  [(PXGSublayoutComposition *)v6 sublayoutGeometries];
  [(PXGStackedSublayoutComposition *)v6 axis];
  PXMinRectEdgeForAxis();
}

void __110__PXGStackedSublayoutComposition_updateSublayoutGeometriesFromAnchorSublayoutIndex_usingSublayoutUpdateBlock___block_invoke(uint64_t a1)
{
}

- (void)updateEstimatedSublayoutGeometries
{
  uint64_t v4 = [(PXGSublayoutComposition *)self numberOfSublayouts];
  id v5 = self;
  uint64_t v6 = [(PXGSublayoutComposition *)v5 sublayoutGeometries];
  double v7 = [(PXGSublayoutComposition *)v5 layout];
  [(PXGSublayoutComposition *)v5 referenceSize];
  double v9 = v8;
  double v11 = v10;
  [(PXGStackedSublayoutComposition *)v5 padding];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [(PXGStackedSublayoutComposition *)v5 axis];
  double v21 = 0.0;
  if (v20 == 1)
  {
    double v9 = v9 - (v15 + v19);
    double v21 = 1.0;
    double v22 = 0.0;
  }
  else if (v20 == 2)
  {
    double v11 = v11 - (v13 + v17);
    double v22 = 1.0;
  }
  else
  {
    double v22 = 0.0;
    if (!v20)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:v5 file:@"PXGStackedSublayoutComposition.m" lineNumber:65 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __68__PXGStackedSublayoutComposition_updateEstimatedSublayoutGeometries__block_invoke;
  v27[3] = &unk_1E5DB41D8;
  uint64_t v29 = v6;
  double v30 = v9;
  double v31 = v11;
  __int16 v32 = 0;
  id v24 = v7;
  id v28 = v24;
  -[PXGSublayoutComposition enumerateSublayoutProvidersForRange:usingBlock:](v5, "enumerateSublayoutProvidersForRange:usingBlock:", 0, v4, v27);
  [(PXGStackedSublayoutComposition *)v5 interlayoutSpacing];
  if (v4 >= 1)
  {
    v26 = (double *)(v6 + 64);
    do
    {
      *(v26 - 2) = v15;
      *(v26 - 1) = v13;
      double *v26 = 0.0;
      double v15 = v15 + v22 * (v25 + *(v26 - 4));
      double v13 = v13 + v21 * (v25 + *(v26 - 3));
      v26 += 17;
      --v4;
    }
    while (v4);
  }
}

void __68__PXGStackedSublayoutComposition_updateEstimatedSublayoutGeometries__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (a3 + a4 >= 1)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)(a1 + 48);
    *(_WORD *)(v7 + 24) = *(_WORD *)(a1 + 64);
    PXSizeIsNull();
  }
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGStackedSublayoutComposition;
  [(PXGSublayoutComposition *)&v3 referenceSizeDidChange];
  [(PXGSublayoutComposition *)self invalidateSublayoutContentSizes];
}

- (void)setPadding:(UIEdgeInsets)a3
{
}

- (void)setInterlayoutSpacing:(double)a3
{
  if (self->_interlayoutSpacing != a3)
  {
    self->_interlayoutSpacing = a3;
    [(PXGSublayoutComposition *)self invalidateEstimatedSublayoutGeometries];
  }
}

- (void)setAxis:(int64_t)a3
{
  if (self->_axis != a3)
  {
    self->_axis = a3;
    if (!a3)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"PXGStackedSublayoutComposition.m", 29, @"Invalid parameter not satisfying: %@", @"axis != PXAxisUndefined" object file lineNumber description];
    }
    [(PXGSublayoutComposition *)self invalidateEstimatedSublayoutGeometries];
  }
}

- (PXGStackedSublayoutComposition)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGStackedSublayoutComposition;
  CGRect result = [(PXGStackedSublayoutComposition *)&v3 init];
  if (result) {
    result->_axis = 1;
  }
  return result;
}

@end