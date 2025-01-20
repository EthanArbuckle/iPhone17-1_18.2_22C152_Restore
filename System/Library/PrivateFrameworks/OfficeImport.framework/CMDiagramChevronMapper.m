@interface CMDiagramChevronMapper
- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4;
- (id)_suggestedBoundsForNodeAtIndex:(unint64_t)a3;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
- (void)setIsHChevron:(BOOL)a3;
@end

@implementation CMDiagramChevronMapper

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
  [(CMDiagramChevronMapper *)self mapChildrenAt:v10 withState:v6];
  [(CMDrawingContext *)self->super.super.mDrawingContext restoreLastTransform];
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  v4 = -[CMDiagramChevronMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", 0, a4);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7 * 0.7;

  double v9 = v8;
  double v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_suggestedBoundsForNodeAtIndex:(unint64_t)a3
{
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  unint64_t mChildCount = self->super.mChildCount;
  CGFloat v10 = CGRectGetWidth(v27) / (double)mChildCount;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat v11 = v10 / CGRectGetHeight(v28);
  double v12 = (float)(1.0 / (float)mChildCount);
  double v13 = v12 / 10.0;
  double v14 = sqrt(v11 * v12 * 0.5);
  if (v11 <= 2.0) {
    double v15 = v14;
  }
  else {
    double v15 = 1.0;
  }
  double v16 = v12 * 0.5 + (double)a3 * v12 - v12 * 0.5;
  double v17 = v13 / 3.0;
  double v18 = v13 / 3.0 + v12;
  if (a3) {
    double v19 = v13 / 3.0;
  }
  else {
    double v19 = 0.0;
  }
  double v20 = v16 - v19;
  if (a3) {
    double v17 = 0.0;
  }
  double v21 = v18 - v17;
  BOOL v22 = mChildCount - 1 <= a3 || *((unsigned char *)&self->super.mDefaultScale + 4) == 0;
  double v23 = v21 + v13 * 1.1;
  if (!v22) {
    double v21 = v23;
  }
  mOrientedBounds = self->super.super.super.mOrientedBounds;
  return +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", mOrientedBounds, v20, (1.0 - v15) * 0.5, v21);
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  double v7 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  double v8 = [v7 children];

  uint64_t v9 = [v8 count];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      CGFloat v11 = [v8 objectAtIndex:i];
      double v12 = [(CMDiagramChevronMapper *)self _suggestedBoundsForNodeAtIndex:i];
      double v13 = [(CMDiagramPointMapper *)[CMDiagramPointChevronMapper alloc] initWithPoint:v11 drawingContext:self->super.super.mDrawingContext orientedBounds:v12 parent:self];
      double v14 = v13;
      if (i) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = *((unsigned char *)&self->super.mDefaultScale + 4) == 0;
      }
      uint64_t v16 = !v15;
      [(CMDiagramPointChevronMapper *)v13 setIsHomePlate:v16];
      [(CMDiagramPointChevronMapper *)v14 mapAt:v17 withState:v6];
    }
  }
}

- (void)setIsHChevron:(BOOL)a3
{
  *((unsigned char *)&self->super.mDefaultScale + 4) = a3;
}

@end