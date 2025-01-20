@interface CMDiagramShapeCycleMapper
- (CGRect)circumscribedBounds;
- (CGRect)nodeBoundsWithIndex:(unint64_t)a3;
- (CGSize)nodeSize;
- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4;
- (CMDiagramShapeCycleMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
- (void)mapTransitionArrowsAt:(id)a3 index:(unsigned int)a4 withState:(id)a5;
- (void)mapTransitionPointAt:(id)a3 index:(unsigned int)a4 withState:(id)a5;
@end

@implementation CMDiagramShapeCycleMapper

- (CMDiagramShapeCycleMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CMDiagramShapeCycleMapper;
  v17 = [(CMDiagramShapeMapper *)&v23 initWithOddDiagram:v12 drawingContext:v13 orientedBounds:v14 identifier:v15 parent:v16];
  v18 = v17;
  if (v17)
  {
    LOBYTE(v17->mScale) = 0;
    if ([v15 isEqualToString:@"cycle1"])
    {
      LOBYTE(v18->mScale) = 0;
      *(_DWORD *)&v18->mCircularArrows = 6;
      v18->mDiagramType = 251;
    }
    if ([v15 isEqualToString:@"cycle2"])
    {
      LOBYTE(v18->mScale) = 0;
      int v19 = 247;
      int v20 = 7;
    }
    else if ([v15 isEqualToString:@"cycle5"])
    {
      int v19 = 251;
      int v20 = 8;
    }
    else
    {
      if (![v15 isEqualToString:@"cycle7"])
      {
LABEL_11:
        *((_DWORD *)&v18->super.mDefaultScale + 1) = 1065353216;
        v21 = v18;
        goto LABEL_12;
      }
      int v19 = 247;
      int v20 = 9;
    }
    *(_DWORD *)&v18->mCircularArrows = v20;
    v18->mDiagramType = v19;
    goto LABEL_11;
  }
LABEL_12:

  return v18;
}

- (CGRect)circumscribedBounds
{
  double v3 = ODIRegularPolygonBoundsMapper(self->super.mChildCount, 0.5, -90.0);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  [(CMDiagramShapeCycleMapper *)self nodeSize];
  double v11 = v10 * 0.5;
  double v13 = v12 * 0.5;
  if (v11 <= v13) {
    double v11 = v13;
  }
  float v14 = v11;
  double v15 = (float)-v14;
  double v16 = v3;
  uint64_t v17 = v5;
  uint64_t v18 = v7;
  uint64_t v19 = v9;
  return CGRectInset(*(CGRect *)&v16, v15, v15);
}

- (CGSize)nodeSize
{
  switch(*(_DWORD *)&self->mCircularArrows)
  {
    case 6:
    case 8:
      double v2 = sin(3.14159265 / (double)self->super.mChildCount) * 0.6;
      double v3 = 0.699999988;
      goto LABEL_6;
    case 7:
      long double v5 = sin(2.19911482 / (double)self->super.mChildCount);
      double v2 = v5 * 0.5 + v5 * 0.5;
      double v4 = v2;
      break;
    case 9:
      double v2 = sin(3.14159265 / (double)self->super.mChildCount) * 0.6;
      double v3 = 0.5;
LABEL_6:
      double v4 = v2 * v3;
      break;
    default:
      double v2 = *MEMORY[0x263F001B0];
      double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
      break;
  }
  result.height = v4;
  result.width = v2;
  return result;
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  uint64_t v7 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  v21 = [v7 children];

  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  CGRectGetWidth(v24);
  [(CMDiagramShapeCycleMapper *)self circumscribedBounds];
  CGRectGetWidth(v25);
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  CGRectGetWidth(v26);
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  CGRectGetHeight(v27);
  int v20 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double v9 = v8;
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  objc_msgSend(v20, "translateXBy:yBy:", v9);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v20];
  [(CMDiagramShapeMapper *)self setDefaultFonSize];
  if (self->super.mChildCount)
  {
    uint64_t v10 = 0;
    while (1)
    {
      double v11 = [v21 objectAtIndex:v10];
      [(CMDiagramShapeCycleMapper *)self nodeBoundsWithIndex:v10];
      +[CMShapeUtils transformRect:scale:offsetX:offsetY:](CMShapeUtils, "transformRect:scale:offsetX:offsetY:");
      double v16 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v12, v13, v14, v15);
      uint64_t v17 = v16;
      unsigned int v18 = *(_DWORD *)&self->mCircularArrows - 6;
      if (v18 >= 4) {
        break;
      }
      uint64_t v19 = (void *)[objc_alloc(*off_264D68AD8[v18]) initWithPoint:v11 drawingContext:self->super.super.mDrawingContext orientedBounds:v16 parent:self];
      [v19 mapAt:v22 withState:v6];
      [(CMDiagramShapeCycleMapper *)self mapTransitionPointAt:v22 index:v10 withState:v6];

      if (self->super.mChildCount <= ++v10) {
        goto LABEL_7;
      }
    }
  }
LABEL_7:
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double Width = CGRectGetWidth(v20);
  [(CMDiagramShapeCycleMapper *)self circumscribedBounds];
  double v7 = CGRectGetWidth(v21);
  [(CMDiagramShapeCycleMapper *)self nodeBoundsWithIndex:a4];
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat v10 = v22.size.width;
  CGFloat height = v22.size.height;
  double v12 = CGRectGetWidth(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.width = v10;
  v23.size.CGFloat height = height;
  CGFloat v13 = CGRectGetHeight(v23);
  float v14 = Width / v7;
  double v15 = v14;
  double v16 = v12 * v15 * 0.707106781;
  double v17 = v13 * v15 * 0.707106781;
  double v18 = v16;
  result.CGFloat height = v17;
  result.width = v18;
  return result;
}

- (CGRect)nodeBoundsWithIndex:(unint64_t)a3
{
  float v4 = (double)(2 * a3) * 3.14159265 / (double)self->super.mChildCount + -1.57079633;
  __float2 v5 = __sincosf_stret(v4);
  [(CMDiagramShapeCycleMapper *)self nodeSize];
  double v7 = TSURectWithCenterAndSize((float)(v5.__cosval * 0.5), (float)(v5.__sinval * 0.5), v6);
  result.size.CGFloat height = v10;
  result.size.width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)mapTransitionPointAt:(id)a3 index:(unsigned int)a4 withState:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v22 = a3;
  id v8 = a5;
  int v9 = *(_DWORD *)&self->mCircularArrows;
  if (v9 == 8 || v9 == 6)
  {
    [(CMDiagramShapeCycleMapper *)self mapTransitionArrowsAt:v22 index:v6 withState:v8];
  }
  else
  {
    double v11 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
    double v12 = [v11 children];
    CGFloat v13 = [v12 objectAtIndex:v6];
    float v14 = [v13 siblingTransition];

    [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
    [(CMDiagramShapeCycleMapper *)self circumscribedBounds];
    CGRectGetWidth(v25);
    double mChildCount = (double)self->super.mChildCount;
    sin(2.19911482 / mChildCount);
    unsigned int v16 = (2 * v6) | 1;
    cos(3.14159265 / mChildCount);
    float v17 = (double)v16 * 3.14159265 / mChildCount + -1.57079633;
    cosf(v17);
    [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
    CGRectGetWidth(v26);
    float v18 = (double)v16 * 3.14159265 / mChildCount + -1.57079633;
    sinf(v18);
    [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
    CGRectGetHeight(v27);
    sin(3.14159265 / (double)self->super.mChildCount);
    TSURectWithOriginAndSize(v19);
    CGRect v20 = +[OADOrientedBounds orientedBoundsWithBounds:rotation:flipX:flipY:](OADOrientedBounds, "orientedBoundsWithBounds:rotation:flipX:flipY:", 0, 0);
    CGRect v21 = [[CMDiagramPointTransitionMapper alloc] initWithPoint:v14 drawingContext:self->super.super.mDrawingContext orientedBounds:v20 shapeType:self->mDiagramType adjustValues:0 parent:self];
    [(CMDiagramPointTransitionMapper *)v21 mapAt:v22 withState:v8];
  }
}

- (void)mapTransitionArrowsAt:(id)a3 index:(unsigned int)a4 withState:(id)a5
{
  id v56 = a3;
  id v55 = a5;
  id v8 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  int v9 = [v8 children];
  double v10 = [v9 objectAtIndex:a4];
  double v11 = [v10 siblingTransition];

  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double Width = CGRectGetWidth(v58);
  [(CMDiagramShapeCycleMapper *)self circumscribedBounds];
  double v13 = CGRectGetWidth(v59);
  unint64_t mChildCount = self->super.mChildCount;
  [(CMDiagramShapeCycleMapper *)self nodeSize];
  double v16 = v15;
  double v17 = (double)a4 * 360.0 / (double)mChildCount + -90.0;
  *(float *)&double v17 = v17;
  +[CMShapeUtils intersectionAngleNextToAngle:isAfter:nodeSize:](CMShapeUtils, "intersectionAngleNextToAngle:isAfter:nodeSize:", 1, v17, v16, v18);
  float v20 = v19;
  unint64_t v21 = self->super.mChildCount;
  [(CMDiagramShapeCycleMapper *)self nodeSize];
  double v23 = v22;
  double v24 = (double)(a4 + 1) * 360.0 / (double)v21 + -90.0;
  *(float *)&double v24 = v24;
  +[CMShapeUtils intersectionAngleNextToAngle:isAfter:nodeSize:](CMShapeUtils, "intersectionAngleNextToAngle:isAfter:nodeSize:", 0, v24, v23, v25);
  float v27 = Width / v13;
  if (v26 < v20) {
    float v26 = v26 + 360.0;
  }
  float v28 = v26 - v20;
  float v29 = (float)(v20 + v26) * 0.5;
  float v30 = (float)(v28 * 0.7) * 0.5;
  float v31 = (float)((float)(v29 - v30) + 180.0) * 3.14159265 / 180.0;
  double v32 = (float)((float)(v29 + v30) + 180.0) * 3.14159265 / 180.0;
  float v33 = v32;
  float v34 = 1.0;
  if (*(_DWORD *)&self->mCircularArrows != 8)
  {
    *(float *)&double v32 = sinf((float)(v33 - v31) * 0.5);
    float v34 = (float)((float)((float)(*(float *)&v32 * 0.5) + (float)(*(float *)&v32 * 0.5)) * v27) * 0.1;
  }
  v35 = NSDictionary;
  *(float *)&double v32 = v33;
  v36 = [NSNumber numberWithFloat:v32];
  v37 = [NSNumber numberWithInt:0];
  *(float *)&double v38 = v31;
  v39 = [NSNumber numberWithFloat:v38];
  v40 = [NSNumber numberWithInt:1];
  *(float *)&double v41 = v34;
  v42 = [NSNumber numberWithFloat:v41];
  v43 = [NSNumber numberWithInt:2];
  v44 = objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v36, v37, v39, v40, v42, v43, 0);

  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v49 = *MEMORY[0x263F00148];
  CGFloat v50 = *(double *)(MEMORY[0x263F00148] + 8);
  [(CMDiagramShapeCycleMapper *)self nodeSize];
  *(float *)&double v51 = v51 * v27 * 0.5 + (float)(v34 * 0.5);
  CGFloat v52 = *(float *)&v51;
  v60.origin.CGFloat x = v49;
  v60.origin.CGFloat y = v50;
  v60.size.width = v46;
  v60.size.CGFloat height = v48;
  CGRect v61 = CGRectInset(v60, v52, v52);
  v53 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height);
  v54 = [[CMDiagramPointTransitionMapper alloc] initWithPoint:v11 drawingContext:self->super.super.mDrawingContext orientedBounds:v53 shapeType:self->mDiagramType adjustValues:v44 parent:self];
  [(CMDiagramPointTransitionMapper *)v54 mapAt:v56 withState:v55];
}

@end