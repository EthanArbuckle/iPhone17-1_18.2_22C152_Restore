@interface CMDiagramPyramidMapper
- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4;
- (id)_suggestedBoundsForNodeAtIndex:(unint64_t)a3;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
- (void)setIsFlipped:(BOOL)a3;
@end

@implementation CMDiagramPyramidMapper

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(CMDiagramShapeMapper *)self setDefaultFonSize];
  v7 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v9 = v8;
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  objc_msgSend(v7, "translateXBy:yBy:", v9);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v7];
  [(CMDiagramPyramidMapper *)self mapChildrenAt:v10 withState:v6];
  [(CMDrawingContext *)self->super.super.mDrawingContext restoreLastTransform];
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  v4 = [(CMDiagramPyramidMapper *)self _suggestedBoundsForNodeAtIndex:a4];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7 * 0.9;

  double v9 = v8;
  double v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_suggestedBoundsForNodeAtIndex:(unint64_t)a3
{
  unint64_t mChildCount = self->super.mChildCount;
  if (*((unsigned char *)&self->super.mDefaultScale + 4)) {
    unint64_t v4 = mChildCount - a3;
  }
  else {
    unint64_t v4 = a3 + 1;
  }
  return +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", self->super.super.super.mOrientedBounds, 0.5 - (float)(1.0 / (float)mChildCount) * (double)v4 * 0.5, (double)a3 * (float)(1.0 / (float)mChildCount));
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  double v7 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  double v8 = [v7 children];

  uint64_t v9 = [v8 count];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v11 = [v8 objectAtIndex:i];
      v12 = [(CMDiagramPyramidMapper *)self _suggestedBoundsForNodeAtIndex:i];
      v13 = [(CMDiagramPointMapper *)[CMDiagramPointPyramidLayerMapper alloc] initWithPoint:v11 drawingContext:self->super.super.mDrawingContext orientedBounds:v12 parent:self];
      [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
      double Height = CGRectGetHeight(v18);
      [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
      double v15 = Height / CGRectGetWidth(v19);
      if (*((unsigned char *)&self->super.mDefaultScale + 4)) {
        double v15 = -v15;
      }
      [(CMDiagramPointPyramidLayerMapper *)v13 setPyramidAspectRatio:v15];
      [(CMDiagramPointPyramidLayerMapper *)v13 mapAt:v16 withState:v6];
    }
  }
}

- (void)setIsFlipped:(BOOL)a3
{
  *((unsigned char *)&self->super.mDefaultScale + 4) = a3;
}

@end