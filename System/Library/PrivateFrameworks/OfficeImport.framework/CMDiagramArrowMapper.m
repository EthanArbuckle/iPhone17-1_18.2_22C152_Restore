@interface CMDiagramArrowMapper
+ (void)initialize;
- (CGRect)circumscribedBounds;
- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4;
- (CGSize)textSizeForShapeSize:(CGSize)a3;
- (CMDiagramArrowMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
@end

@implementation CMDiagramArrowMapper

+ (void)initialize
{
  _MergedGlobals_25 = 0x3F8000003F000000;
  *(void *)&dword_2689BCBC0 = 0x3EB333333F800000;
  qword_2689BCBC8 = 0x3D4CCCCD3F266666;
  *(void *)&dword_2689BCBD0 = 0x3F6666663F333333;
}

- (CMDiagramArrowMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7
{
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CMDiagramArrowMapper;
  v13 = [(CMDiagramShapeMapper *)&v24 initWithOddDiagram:a3 drawingContext:a4 orientedBounds:a5 identifier:v12 parent:a7];
  v14 = v13;
  if (v13)
  {
    v13->super.mDefaultFontSize = 65.0;
    v13->super.mMaxMappableTreeDepth = 0;
    unint64_t mChildCount = v13->super.mChildCount;
    *((unsigned char *)&v13->super.mDefaultScale + 4) = mChildCount == 1;
    float v16 = *(float *)&dword_2689BCBD4;
    int v17 = [v12 isEqualToString:@"arrow5"];
    float v18 = tan(v16 * 3.14159265 / (double)mChildCount);
    float v19 = v18 + v18;
    if (v17)
    {
      char v20 = 0;
      float v21 = (float)(*((float *)&_MergedGlobals_25 + 1) / v19) - *(float *)&dword_2689BCBC4;
    }
    else
    {
      float v22 = *(float *)&_MergedGlobals_25 / v19;
      float v21 = (float)(*((float *)&_MergedGlobals_25 + 1) / v19) - *(float *)&qword_2689BCBC8;
      if (v22 > v21) {
        float v21 = v22;
      }
      char v20 = 1;
    }
    *((unsigned char *)&v14->super.mDefaultScale + 5) = v20;
    *(float *)&v14->mIsVertical = v21 + (float)(*(float *)&dword_2689BCBC0 * 0.5);
  }

  return v14;
}

- (CGRect)circumscribedBounds
{
  unint64_t mChildCount = self->super.mChildCount;
  CGFloat v4 = 0.0;
  if (mChildCount == 1)
  {
    double v5 = 1.0;
    double v7 = 0.0;
    double v6 = 1.0;
  }
  else if (mChildCount == 2)
  {
    double v5 = (float)(*((float *)&qword_2689BCBC8 + 1) + (float)(*(float *)&dword_2689BCBC0 * 2.0));
    double v6 = *((float *)&_MergedGlobals_25 + 1);
    double v7 = 0.0;
  }
  else
  {
    v8.origin.x = ODIRegularPolygonBoundsMapper(mChildCount, *(float *)&self->mIsVertical, -90.0);
    *(CGRect *)&CGFloat v4 = CGRectInset(v8, (float)(*(float *)&dword_2689BCBC0 * -0.5), (float)(*(float *)&dword_2689BCBC0 * -0.5));
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v7;
  result.origin.x = v4;
  return result;
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v50 = a3;
  id v49 = a4;
  double v6 = [MEMORY[0x263F08680] transform];
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double v8 = v7;
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  objc_msgSend(v6, "translateXBy:yBy:", v8);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v6];
  [(CMDiagramShapeMapper *)self setDefaultFonSize];
  unint64_t mChildCount = self->super.mChildCount;
  v48 = v6;
  if (mChildCount == 2)
  {
    float v16 = *(float *)&dword_2689BCBC0;
    [(CMDiagramArrowMapper *)self circumscribedBounds];
    double Width = CGRectGetWidth(v52);
    float v18 = *((float *)&qword_2689BCBC8 + 1);
    [(CMDiagramArrowMapper *)self circumscribedBounds];
    double v19 = CGRectGetWidth(v53);
    float v20 = *((float *)&_MergedGlobals_25 + 1);
    [(CMDiagramArrowMapper *)self circumscribedBounds];
    CGFloat Height = CGRectGetHeight(v54);
    uint64_t v22 = 0;
    float v23 = v16 / Width;
    float v24 = v18 / v19;
    *(float *)&CGFloat Height = v20 / Height;
    float v25 = v23 + v24;
    double v26 = v23;
    char v27 = 1;
    double v28 = *(float *)&Height;
    do
    {
      char v29 = v27;
      v30 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
      v31 = [v30 children];
      v32 = [v31 objectAtIndex:v22];

      LODWORD(v31) = *((unsigned __int8 *)&self->super.mDefaultScale + 5);
      v33 = +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", self->super.mDiagramShapeBounds, (float)(v25 * (float)(int)v22), 0.0, v26, v28);
      v34 = v33;
      int v35 = 180 * v22 - 90;
      *(float *)&double v36 = (float)v35;
      if (!v31) {
        *(float *)&double v36 = -(float)v35;
      }
      [v33 setRotation:v36];
      v37 = [[CMDiagramPointArrowMapper alloc] initWithPoint:v32 drawingContext:self->super.super.mDrawingContext orientedBounds:v34 parent:self];
      [(CMDiagramPointArrowMapper *)v37 mapAt:v50 withState:v49];

      char v27 = 0;
      uint64_t v22 = 1;
    }
    while ((v29 & 1) != 0);
  }
  else if (mChildCount == 1)
  {
    v10 = +[CMShapeUtils relatvieBoundsWithAbsoluteInnerBounds:self->super.mDiagramShapeBounds parentBounds:self->super.mDiagramShapeBounds];
    [v10 setRotation:0.0];
    v11 = [CMDiagramPointArrowMapper alloc];
    id v12 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
    v13 = [v12 children];
    v14 = [v13 objectAtIndex:0];
    v15 = [(CMDiagramPointArrowMapper *)v11 initWithPoint:v14 drawingContext:self->super.super.mDrawingContext orientedBounds:v10 parent:self];

    [(CMDiagramShapeMapper *)self setDefaultFonSize];
    [(CMDiagramPointArrowMapper *)v15 mapAt:v50 withState:v49];
  }
  else if (mChildCount)
  {
    uint64_t v38 = 0;
    do
    {
      v39 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
      v40 = [v39 children];
      v41 = [v40 objectAtIndex:v38];

      if (mChildCount == 2)
      {
        float v42 = (double)v38 * 360.0 / (double)2u;
        float v43 = v42 + -90.0;
      }
      else
      {
        float v43 = (double)v38 * 360.0 / (double)mChildCount;
      }
      cos((float)(v43 + -90.0) * 3.14159265 / 180.0);
      [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
      CGRectGetWidth(v55);
      sin((float)(v43 + -90.0) * 3.14159265 / 180.0);
      [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
      CGRectGetHeight(v56);
      TSURectWithOriginAndSize(v44);
      v45 = +[OADOrientedBounds orientedBoundsWithBounds:rotation:flipX:flipY:](OADOrientedBounds, "orientedBoundsWithBounds:rotation:flipX:flipY:", 0, 0);
      v46 = [[CMDiagramPointArrowMapper alloc] initWithPoint:v41 drawingContext:self->super.super.mDrawingContext orientedBounds:v45 parent:self];
      [(CMDiagramPointArrowMapper *)v46 mapAt:v50 withState:v49];

      ++v38;
    }
    while (mChildCount != v38);
  }
  v47 = v48;
  [(CMDrawingContext *)self->super.super.mDrawingContext restoreLastTransform];
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double Width = CGRectGetWidth(v13);
  [(CMDiagramArrowMapper *)self circumscribedBounds];
  float v6 = Width / CGRectGetWidth(v14);
  float v7 = *(float *)&_MergedGlobals_25;
  if (*((unsigned char *)&self->super.mDefaultScale + 4)) {
    float v8 = *(float *)&dword_2689BCBD0;
  }
  else {
    float v8 = *(float *)&_MergedGlobals_25;
  }
  float v9 = v8 * v6;
  if (!*((unsigned char *)&self->super.mDefaultScale + 4)) {
    float v7 = *(float *)&dword_2689BCBD0;
  }
  double v10 = (float)(v7 * v6);
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)textSizeForShapeSize:(CGSize)a3
{
  float v3 = *(float *)&dword_2689BCBD0;
  if (*((unsigned char *)&self->super.mDefaultScale + 4)) {
    float v4 = *(float *)&_MergedGlobals_25;
  }
  else {
    float v4 = *(float *)&dword_2689BCBD0;
  }
  if (!*((unsigned char *)&self->super.mDefaultScale + 4)) {
    float v3 = *(float *)&_MergedGlobals_25;
  }
  float v5 = *(float *)&dword_2689BCBC0;
  if (*((unsigned char *)&self->super.mDefaultScale + 4)) {
    float v6 = *((float *)&_MergedGlobals_25 + 1);
  }
  else {
    float v6 = *(float *)&dword_2689BCBC0;
  }
  if (!*((unsigned char *)&self->super.mDefaultScale + 4)) {
    float v5 = *((float *)&_MergedGlobals_25 + 1);
  }
  float v7 = a3.width * v4 / v6;
  float v8 = a3.height * v3 / v5;
  double v9 = v7;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end