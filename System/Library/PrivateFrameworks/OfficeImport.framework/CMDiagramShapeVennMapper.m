@interface CMDiagramShapeVennMapper
- (CGRect)circumscribedBounds;
- (CGRect)nodeBoundsWithIndex:(unsigned int)a3;
- (CGSize)textSizeForShapeSize:(CGSize)a3;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
@end

@implementation CMDiagramShapeVennMapper

- (CGRect)circumscribedBounds
{
  unint64_t mChildCount = self->super.mChildCount;
  double v3 = ODIRegularPolygonBoundsMapper(mChildCount, 1.0, -90.0);
  if (mChildCount < 5)
  {
    CGFloat v7 = -1.20000005;
    CGFloat v8 = -1.20000005;
  }
  else
  {
    CGFloat v7 = -0.300000012;
    CGFloat v8 = -0.180000007;
  }
  return CGRectInset(*(CGRect *)&v3, v7, v8);
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v20 = a3;
  id v19 = a4;
  v6 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  v21 = [v6 children];

  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  CGRectGetWidth(v23);
  [(CMDiagramShapeVennMapper *)self circumscribedBounds];
  CGRectGetWidth(v24);
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  CGRectGetWidth(v25);
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  CGRectGetHeight(v26);
  CGFloat v7 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double v9 = v8;
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  objc_msgSend(v7, "translateXBy:yBy:", v9);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v7];
  [(CMDiagramShapeMapper *)self setDefaultFonSize];
  if (self->super.mChildCount)
  {
    unint64_t v10 = 0;
    do
    {
      v11 = [v21 objectAtIndex:v10];
      [(CMDiagramShapeVennMapper *)self nodeBoundsWithIndex:v10];
      +[CMShapeUtils transformRect:scale:offsetX:offsetY:](CMShapeUtils, "transformRect:scale:offsetX:offsetY:");
      v16 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v12, v13, v14, v15);
      v17 = [(CMDiagramPointMapper *)[CMDiagramPointEllipseMapper alloc] initWithPoint:v11 drawingContext:self->super.super.mDrawingContext orientedBounds:v16 parent:self];
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"circ%d", ++v10);
      [(CMDiagramPointMapper *)v17 setPresentationName:v18];

      [(CMDiagramPointEllipseMapper *)v17 mapAt:v20 withState:v19];
    }
    while (self->super.mChildCount > v10);
  }
}

- (CGSize)textSizeForShapeSize:(CGSize)a3
{
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double v4 = v3 * 0.4;
  double v6 = v5 * 0.4;
  result.height = v6;
  result.width = v4;
  return result;
}

- (CGRect)nodeBoundsWithIndex:(unsigned int)a3
{
  unint64_t mChildCount = self->super.mChildCount;
  double v4 = dbl_238EF1660[mChildCount > 4];
  if (mChildCount <= 4) {
    float v5 = 1.0;
  }
  else {
    float v5 = 0.25;
  }
  float v6 = (double)(2 * a3) * 3.14159265 / (double)mChildCount + -1.57079633;
  __float2 v7 = __sincosf_stret(v6);
  double v8 = TSURectWithCenterAndSize((float)(v5 * v7.__cosval), (float)(v5 * v7.__sinval), v4);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

@end