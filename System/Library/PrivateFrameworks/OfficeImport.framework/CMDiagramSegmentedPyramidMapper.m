@interface CMDiagramSegmentedPyramidMapper
- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4;
- (id)_suggestedBoundsForPyramidLayerWithIndex:(unint64_t)a3 inLayer:(unint64_t)a4 andSlice:(unint64_t)a5;
- (unint64_t)layerCount;
- (unint64_t)pointCount;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
@end

@implementation CMDiagramSegmentedPyramidMapper

- (unint64_t)pointCount
{
  if (self->super.mChildCount >= 9) {
    return 9;
  }
  else {
    return self->super.mChildCount;
  }
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  [(CMDiagramShapeMapper *)self setDefaultFonSize];
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  if (v9 <= v10)
  {
    if (v9 >= v10) {
      goto LABEL_6;
    }
    double v8 = v8 + (v10 - v9) * 0.5;
    double v10 = v9;
  }
  else
  {
    double v7 = v7 + (v9 - v10) * 0.5;
  }
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", v7, v8, v10);
  v11 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mOrientedBounds = self->super.super.super.mOrientedBounds;
  self->super.super.super.mOrientedBounds = v11;

LABEL_6:
  v13 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v15 = v14;
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  objc_msgSend(v13, "translateXBy:yBy:", v15);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v13];
  [(CMDiagramSegmentedPyramidMapper *)self mapChildrenAt:v16 withState:v6];
  [(CMDrawingContext *)self->super.super.mDrawingContext restoreLastTransform];
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  double v7 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  double v8 = [v7 children];

  unint64_t v9 = [(CMDiagramSegmentedPyramidMapper *)self pointCount];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    do
    {
      v13 = [v8 objectAtIndex:v10];
      double v14 = [(CMDiagramSegmentedPyramidMapper *)self _suggestedBoundsForPyramidLayerWithIndex:v10 inLayer:v11 andSlice:v12];
      double v15 = v14;
      if (v12) {
        [v14 setFlipY:1];
      }
      id v16 = [(CMDiagramPointMapper *)[CMDiagramPointSegmentedPyramidLayerMapper alloc] initWithPoint:v13 drawingContext:self->super.super.mDrawingContext orientedBounds:v15 parent:self];
      [(CMDiagramPointSegmentedPyramidLayerMapper *)v16 mapAt:v23 withState:v6];
      BOOL v17 = v12 + 1 > (unint64_t)(2 * v11);
      if (v12 + 1 <= (unint64_t)(2 * v11)) {
        ++v12;
      }
      else {
        uint64_t v12 = 0;
      }
      if (v17) {
        ++v11;
      }

      ++v10;
    }
    while (v9 != v10);
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  if (v12 - 1 < (unint64_t)(2 * v11))
  {
    do
    {
      v18 = [(CMDiagramSegmentedPyramidMapper *)self _suggestedBoundsForPyramidLayerWithIndex:v9 inLayer:v11 andSlice:v12];
      v19 = v18;
      if (v12) {
        [v18 setFlipY:1];
      }
      v20 = [CMDiagramPointSegmentedPyramidLayerMapper alloc];
      v21 = [v8 objectAtIndex:0];
      v22 = [(CMDiagramPointMapper *)v20 initWithPoint:v21 drawingContext:self->super.super.mDrawingContext orientedBounds:v19 parent:self];

      [(CMDiagramPointSegmentedPyramidLayerMapper *)v22 setIsPlaceholder:1];
      [(CMDiagramPointSegmentedPyramidLayerMapper *)v22 mapAt:v23 withState:v6];

      ++v12;
      ++v9;
    }
    while (((2 * v11) | 1) != v12);
  }
}

- (unint64_t)layerCount
{
  unint64_t v2 = [(CMDiagramSegmentedPyramidMapper *)self pointCount];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  do
  {
    if (v3 + 1 <= ((2 * v4) | 1uLL))
    {
      ++v3;
    }
    else
    {
      ++v4;
      uint64_t v3 = 0;
    }
    --v2;
  }
  while (v2);
  return v4 + 1;
}

- (id)_suggestedBoundsForPyramidLayerWithIndex:(unint64_t)a3 inLayer:(unint64_t)a4 andSlice:(unint64_t)a5
{
  unint64_t v8 = [(CMDiagramSegmentedPyramidMapper *)self layerCount];
  double v9 = (float)(1.0 / (float)v8);
  double v10 = (double)(a4 + 1);
  double v11 = v10 * v9;
  if (a4)
  {
    double v12 = 0.5 - v10 * v9 * 0.5;
    double v13 = (double)a4 * v9;
    double v14 = (float)(1.0 / (float)v8);
    double v11 = CGRectGetWidth(*(CGRect *)(&v11 - 2)) / v10;
  }
  mOrientedBounds = self->super.super.super.mOrientedBounds;
  return +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", mOrientedBounds, 0.5 - v10 * v9 * 0.5 + v11 * (double)a5 * 0.5, (double)a4 * v9);
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4 = [(CMDiagramSegmentedPyramidMapper *)self _suggestedBoundsForPyramidLayerWithIndex:0 inLayer:0 andSlice:0];
  [v4 bounds];
  double v6 = v5 * 0.5;
  double v8 = v7 / 3.0;

  double v9 = v8;
  double v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

@end