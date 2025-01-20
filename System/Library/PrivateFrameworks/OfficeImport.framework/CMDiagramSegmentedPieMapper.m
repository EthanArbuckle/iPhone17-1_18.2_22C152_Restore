@interface CMDiagramSegmentedPieMapper
- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4;
- (id)_suggestedBoundsForNodeAtIndex:(unint64_t)a3;
- (int)pointCount;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
- (void)setDrawArrows:(BOOL)a3;
@end

@implementation CMDiagramSegmentedPieMapper

- (int)pointCount
{
  if (self->super.mChildCount >= 7) {
    LODWORD(v2) = 7;
  }
  else {
    return self->super.mChildCount;
  }
  return v2;
}

- (void)setDrawArrows:(BOOL)a3
{
  *((unsigned char *)&self->super.mDefaultScale + 4) = a3;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  [(CMDiagramShapeMapper *)self setDefaultFonSize];
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v11 = v7;
  double v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  if (v9 <= v10)
  {
    if (v9 < v10)
    {
      double v12 = v8 + (v10 - v9) * 0.5;
      CGFloat v14 = v9;
    }
  }
  else
  {
    double v11 = v7 + (v9 - v10) * 0.5;
    CGFloat v13 = v10;
  }
  v24.origin.x = v11;
  v24.origin.y = v12;
  v24.size.width = v13;
  v24.size.height = v14;
  double Width = CGRectGetWidth(v24);
  v25.origin.x = v11;
  v25.origin.y = v12;
  v25.size.width = v13;
  v25.size.height = v14;
  CGFloat v16 = (Width + CGRectGetHeight(v25)) * 0.04;
  v26.origin.x = v11;
  v26.origin.y = v12;
  v26.size.width = v13;
  v26.size.height = v14;
  CGRect v27 = CGRectInset(v26, v16, v16);
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height);
  v17 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
  mOrientedBounds = self->super.super.super.mOrientedBounds;
  self->super.super.super.mOrientedBounds = v17;

  v19 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  double v21 = v20;
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  objc_msgSend(v19, "translateXBy:yBy:", v21);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v19];
  [(CMDiagramSegmentedPieMapper *)self mapChildrenAt:v22 withState:v6];
  [(CMDrawingContext *)self->super.super.mDrawingContext restoreLastTransform];
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  double v7 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  double v8 = [v7 children];

  int v9 = [(CMDiagramSegmentedPieMapper *)self pointCount];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v9;
    double v12 = (double)(unint64_t)v9;
    unint64_t v13 = 2;
    do
    {
      CGFloat v14 = [v8 objectAtIndex:v10];
      v15 = [(CMDiagramSegmentedPieMapper *)self _suggestedBoundsForNodeAtIndex:v10];
      CGFloat v16 = [(CMDiagramPointMapper *)[CMDiagramPointSegmentedPieMapper alloc] initWithPoint:v14 drawingContext:self->super.super.mDrawingContext orientedBounds:v15 parent:self];
      [(CMDiagramPointSegmentedPieMapper *)v16 setStartAngle:1.57079633 - (double)(v13 - 2) * 3.14159265 / v12];
      [(CMDiagramPointSegmentedPieMapper *)v16 setStopAngle:1.57079633 - (double)v13 * 3.14159265 / v12];
      [(CMDiagramPointSegmentedPieMapper *)v16 setDrawArrows:*((unsigned __int8 *)&self->super.mDefaultScale + 4)];
      uint64_t v17 = v10 + 1;
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"wedge%lu", v10 + 1);
      [(CMDiagramPointMapper *)v16 setPresentationName:v18];

      [(CMDiagramPointSegmentedPieMapper *)v16 setSegmentIndex:v17 - 1];
      [(CMDiagramPointSegmentedPieMapper *)v16 setSegmentCount:v11];
      [(CMDiagramPointSegmentedPieMapper *)v16 mapAt:v19 withState:v6];

      v13 += 2;
      uint64_t v10 = v17;
    }
    while (v17 != v11);
  }
}

- (id)_suggestedBoundsForNodeAtIndex:(unint64_t)a3
{
  [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
  return +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", 0.0, 0.0);
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  v4 = -[CMDiagramSegmentedPieMapper _suggestedBoundsForNodeAtIndex:](self, "_suggestedBoundsForNodeAtIndex:", 0, a4);
  [v4 bounds];
  double v6 = v5 / 6.0;
  double v8 = v7 / 6.0;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end