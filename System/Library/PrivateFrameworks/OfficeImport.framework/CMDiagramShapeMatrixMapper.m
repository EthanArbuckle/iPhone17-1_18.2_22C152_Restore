@interface CMDiagramShapeMatrixMapper
- (CGRect)circumscribedBounds;
- (CGSize)gapSize;
- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4;
- (CMDiagramShapeMatrixMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7;
- (double)gapRatio;
- (unint64_t)columnCount;
- (void)mapChildrenAt:(id)a3 withState:(id)a4;
- (void)setColumnsAndRowsCount;
@end

@implementation CMDiagramShapeMatrixMapper

- (CMDiagramShapeMatrixMapper)initWithOddDiagram:(id)a3 drawingContext:(id)a4 orientedBounds:(id)a5 identifier:(id)a6 parent:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CMDiagramShapeMatrixMapper;
  v17 = [(CMDiagramShapeMapper *)&v20 initWithOddDiagram:v12 drawingContext:v13 orientedBounds:v14 identifier:v15 parent:v16];
  v18 = v17;
  if (v17)
  {
    v17->mColumnCount = 0;
    v17->mRowCount = 0;
    v17->mIsSnake = 0;
    v17->mHasArrows = 0;
    v17->mIsHorizontal = 1;
    v17->mIsLinear = 0;
    v17->mRectWidth = 1.0;
    v17->mRectHeight = 1.0;
    if ([v15 isEqualToString:@"default"])
    {
      v18->mIsSnake = 0;
      v18->mHasArrows = 0;
    }
    else if ([v15 hasPrefix:@"bProcess"])
    {
      v18->mHasArrows = 1;
      v18->mIsSnake = 1;
    }
    else if ([v15 isEqualToString:@"process1"])
    {
      v18->mHasArrows = 1;
      v18->mIsSnake = 0;
      v18->mIsLinear = 1;
    }
    [(CMDiagramShapeMatrixMapper *)v18 setColumnsAndRowsCount];
  }

  return v18;
}

- (void)setColumnsAndRowsCount
{
  if (self->mIsHorizontal)
  {
    unint64_t v3 = [(CMDiagramShapeMatrixMapper *)self columnCount];
    self->mColumnCount = v3;
    if (v3) {
      unint64_t v4 = (v3 + self->super.mChildCount - 1) / v3;
    }
    else {
      unint64_t v4 = 0;
    }
    self->mRowCount = v4;
  }
}

- (unint64_t)columnCount
{
  unint64_t mChildCount = self->super.mChildCount;
  if (!self->mIsLinear)
  {
    [(CMDiagramShapeMatrixMapper *)self circumscribedBounds];
    double v5 = v4;
    double v7 = v6;
    [(OADOrientedBounds *)self->super.super.super.mOrientedBounds bounds];
    CGFloat x = v26.origin.x;
    CGFloat y = v26.origin.y;
    CGFloat width = v26.size.width;
    CGFloat height = v26.size.height;
    double v12 = CGRectGetWidth(v26);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double v13 = CGRectGetHeight(v27);
    self->mRectWidth = 0.0;
    unsigned int v14 = 0;
    if (mChildCount)
    {
      float v15 = v13;
      if ((mChildCount + 1) > 2) {
        uint64_t v17 = (mChildCount + 1);
      }
      else {
        uint64_t v17 = 2;
      }
      float v18 = 0.0;
      unint64_t v19 = 1;
      float v16 = v12;
      float v20 = v16 / v15;
      do
      {
        double v21 = (double)(v19 - 1) * 0.100000001;
        float v22 = v21 + (double)v19 * v5;
        float v23 = (double)((v19 - 1 + mChildCount) / v19 - 1) * 0.100000001 + (double)((v19 - 1 + mChildCount) / v19) * v7;
        float v24 = fminf((float)(v22 / v23) / v20, 1.0) / (v21 / v5 + (double)v19);
        if (v18 * 0.999 < v24)
        {
          self->mRectWidth = v24;
          float v18 = v24;
          unsigned int v14 = v19;
        }
        ++v19;
      }
      while (v17 != v19);
    }
    return v14;
  }
  return mChildCount;
}

- (CGRect)circumscribedBounds
{
  double v2 = 0.600000024;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 1.0;
  result.size.CGFloat height = v2;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)mapChildrenAt:(id)a3 withState:(id)a4
{
  id v40 = a3;
  id v39 = a4;
  double v6 = [MEMORY[0x263F08680] transform];
  uint64_t v7 = 208;
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double v9 = v8;
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  objc_msgSend(v6, "translateXBy:yBy:", v9);
  [(CMDrawingContext *)self->super.super.mDrawingContext addTransform:v6];
  [(CMDiagramShapeMatrixMapper *)self circumscribedBounds];
  double v11 = v10;
  [(CMDiagramShapeMatrixMapper *)self gapSize];
  double v13 = v12;
  double v15 = v14;
  unint64_t mColumnCount = self->mColumnCount;
  [(CMDiagramShapeMatrixMapper *)self gapRatio];
  unint64_t v36 = mColumnCount - 1;
  *(float *)&double v17 = 1.0 / (v17 * (double)(mColumnCount - 1) / v11 + (double)mColumnCount);
  self->mRectWidth = *(float *)&v17;
  self->mRectHeight = *(float *)&v17;
  [(CMDiagramShapeMapper *)self setDefaultFonSize];
  float v18 = [(ODDDiagram *)self->super.super.mDiagram documentPoint];
  v35 = v6;
  v38 = [v18 children];

  if (!LODWORD(self->super.mChildCount))
  {
LABEL_26:
    [(CMDrawingContext *)self->super.super.mDrawingContext restoreLastTransform];
    goto LABEL_28;
  }
  unint64_t v19 = 0;
  unint64_t v37 = mColumnCount;
  while (1)
  {
    unint64_t v20 = v19 / mColumnCount;
    unint64_t v21 = v19 % mColumnCount;
    if (((v19 / mColumnCount) & 1) != 0 && self->mIsSnake) {
      unint64_t v21 = mColumnCount + ~v21;
    }
    float v22 = [v38 objectAtIndex:v19];
    float v23 = +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", *(Class *)((char *)&self->super.super.super.super.super.isa + v7), (self->mRectWidth + v13 * self->mRectWidth) * (double)v21, (self->mRectHeight + v15 * self->mRectHeight) * (double)v20);
    float v24 = [[CMDiagramPointMapper alloc] initWithPoint:v22 drawingContext:self->super.super.mDrawingContext orientedBounds:v23 parent:self];
    [(CMDiagramPointMapper *)v24 mapAt:v40 withState:v39];
    if (!self->mHasArrows) {
      goto LABEL_25;
    }
    uint64_t v25 = [v22 siblingTransition];
    CGRect v26 = (void *)v25;
    if (!v25) {
      break;
    }
    uint64_t v27 = v7;
    if (v20)
    {
      BOOL v28 = !self->mIsSnake;
      if (v21)
      {
        if (self->mIsSnake) {
          BOOL v28 = 0;
        }
        else {
LABEL_15:
        }
          BOOL v28 = 1;
        int v29 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (v21 != v36) {
        goto LABEL_15;
      }
      BOOL v28 = 1;
    }
    int v29 = 1;
LABEL_17:
    TSURectWithOriginAndSize(v25);
    v30 = +[CMShapeUtils internalBoundsWithBounds:scaleBounds:](CMShapeUtils, "internalBoundsWithBounds:scaleBounds:", *(Class *)((char *)&self->super.super.super.super.super.isa + v27));
    v31 = v30;
    if (v29) {
      [v30 setFlipY:1];
    }
    if (!v28) {
      [v31 setFlipX:1];
    }
    v32 = [CMDiagramPointTransitionMapper alloc];
    if (v29) {
      uint64_t v33 = 248;
    }
    else {
      uint64_t v33 = 247;
    }
    v34 = [(CMDiagramPointTransitionMapper *)v32 initWithPoint:v26 drawingContext:self->super.super.mDrawingContext orientedBounds:v31 shapeType:v33 parent:self];
    [(CMDiagramPointTransitionMapper *)v34 mapAt:v40 withState:v39];

    uint64_t v7 = v27;
    unint64_t mColumnCount = v37;
LABEL_25:

    if (++v19 >= LODWORD(self->super.mChildCount)) {
      goto LABEL_26;
    }
  }

LABEL_28:
}

- (CGSize)gapSize
{
  [(CMDiagramShapeMatrixMapper *)self gapRatio];
  double v4 = v3;
  [(CMDiagramShapeMatrixMapper *)self circumscribedBounds];
  float v6 = v4 / v5;
  [(CMDiagramShapeMatrixMapper *)self gapRatio];
  double v8 = v7;
  [(CMDiagramShapeMatrixMapper *)self circumscribedBounds];
  float v10 = v8 / v9;
  double v11 = v6;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (double)gapRatio
{
  double result = 0.100000001;
  if (self->mHasArrows) {
    return 0.5;
  }
  return result;
}

- (CGSize)sizeForNode:(id)a3 atIndex:(unint64_t)a4
{
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  double Width = CGRectGetWidth(v13);
  mRectdouble Width = self->mRectWidth;
  [(OADOrientedBounds *)self->super.mDiagramShapeBounds bounds];
  CGFloat Height = CGRectGetHeight(v14);
  float v8 = Width * mRectWidth;
  float v9 = Height * self->mRectHeight;
  double v10 = v8;
  double v11 = v9;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

@end