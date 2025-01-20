@interface ODIState
- (CGRect)logicalBounds;
- (ODIState)initWithDiagram:(id)a3 group:(id)a4 drawingTheme:(id)a5;
- (double)scale;
- (id)defaultStyleLabelNameForPointType:(int)a3;
- (id)diagram;
- (id)diagramOrientedBounds;
- (id)drawingTheme;
- (id)group;
- (id)presentationNameForPointType:(int)a3;
- (id)textStyle;
- (int)pointCount;
- (int)pointIndex;
- (void)setDefaultStyleLabelName:(id)a3 forPointType:(int)a4;
- (void)setGroup:(id)a3;
- (void)setLogicalBounds:(CGRect)a3;
- (void)setLogicalBounds:(CGRect)a3 maintainAspectRatio:(BOOL)a4;
- (void)setPointCount:(int)a3;
- (void)setPointIndex:(int)a3;
- (void)setPresentationName:(id)a3 forPointType:(int)a4;
- (void)setTextStyle:(id)a3;
@end

@implementation ODIState

- (ODIState)initWithDiagram:(id)a3 group:(id)a4 drawingTheme:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)ODIState;
  v12 = [(ODIState *)&v31 init];
  v13 = v12;
  v14 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mDiagram, a3);
    objc_storeStrong((id *)&v13->mGroup, a4);
    objc_storeStrong((id *)&v13->mDrawingTheme, a5);
    uint64_t v15 = +[OAITOrientedBounds absoluteOrientedBoundsOfDrawable:v9];
    mDiagramOrientedBounds = v14->mDiagramOrientedBounds;
    v14->mDiagramOrientedBounds = (OADOrientedBounds *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mPresentationNames = v14->mPresentationNames;
    v14->mPresentationNames = v17;

    int v19 = 6;
    do
    {
      v20 = v14->mPresentationNames;
      v21 = [MEMORY[0x263EFF9D0] null];
      [(NSMutableArray *)v20 addObject:v21];

      --v19;
    }
    while (v19);
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mDefaultStyleLabelNames = v14->mDefaultStyleLabelNames;
    v14->mDefaultStyleLabelNames = v22;

    [(NSMutableArray *)v14->mDefaultStyleLabelNames addObject:@"asst0"];
    v24 = v14->mDefaultStyleLabelNames;
    v25 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableArray *)v24 addObject:v25];

    [(NSMutableArray *)v14->mDefaultStyleLabelNames addObject:@"node1"];
    [(NSMutableArray *)v14->mDefaultStyleLabelNames addObject:@"parChTrans2D1"];
    v26 = v14->mDefaultStyleLabelNames;
    v27 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableArray *)v26 addObject:v27];

    [(NSMutableArray *)v14->mDefaultStyleLabelNames addObject:@"sibTrans2D1"];
    v28 = v14->mDefaultStyleLabelNames;
    v29 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableArray *)v28 addObject:v29];
  }
  return v14;
}

- (id)diagram
{
  return self->mDiagram;
}

- (id)diagramOrientedBounds
{
  return self->mDiagramOrientedBounds;
}

- (CGRect)logicalBounds
{
  double x = self->mLogicalBounds.origin.x;
  double y = self->mLogicalBounds.origin.y;
  double width = self->mLogicalBounds.size.width;
  double height = self->mLogicalBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLogicalBounds:(CGRect)a3 maintainAspectRatio:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    +[ODIDrawable sizeOfDiagram:self->mDiagram];
    float v11 = v10 / v9;
    v29.origin.double x = x;
    v29.origin.double y = y;
    v29.size.double width = width;
    v29.size.double height = height;
    double v12 = CGRectGetHeight(v29);
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    float v13 = v12 / CGRectGetWidth(v30);
    double v14 = v11;
    if (v11 >= v13)
    {
      v33.origin.double x = x;
      v33.origin.double y = y;
      v33.size.double width = width;
      v33.size.double height = height;
      double v17 = CGRectGetWidth(v33);
      v34.origin.double x = x;
      v34.origin.double y = y;
      v34.size.double width = width;
      v34.size.double height = height;
      float v18 = -(CGRectGetHeight(v34) - v17 * v14);
      double y = y + (float)(v18 * -0.5);
      double height = height + v18;
    }
    else
    {
      v31.origin.double x = x;
      v31.origin.double y = y;
      v31.size.double width = width;
      v31.size.double height = height;
      CGFloat v15 = CGRectGetHeight(v31) / v14;
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      float v16 = v15 - CGRectGetWidth(v32);
      double x = x + (float)(v16 * -0.5);
      double width = width + v16;
    }
  }
  self->mLogicalBounds.origin.double x = x;
  self->mLogicalBounds.origin.double y = y;
  self->mLogicalBounds.size.double width = width;
  self->mLogicalBounds.size.double height = height;
  v35.origin.double x = x;
  v35.origin.double y = y;
  v35.size.double width = width;
  v35.size.double height = height;
  double v19 = CGRectGetHeight(v35);
  v36.origin.double x = x;
  v36.origin.double y = y;
  v36.size.double width = width;
  v36.size.double height = height;
  CGFloat v20 = CGRectGetWidth(v36);
  if (v19 >= v20) {
    CGFloat v20 = v19;
  }
  double v21 = floor(log10(v20));
  if (v21 < 4.0) {
    double v21 = 4.0;
  }
  uint64_t v22 = llround(__exp10(v21));
  self->mScale = (double)v22;
  mGroup = self->mGroup;
  double v24 = self->mLogicalBounds.origin.x * (double)v22;
  double v25 = self->mLogicalBounds.origin.y * (double)v22;
  double v26 = self->mLogicalBounds.size.width * (double)v22;
  double v27 = self->mLogicalBounds.size.height * (double)v22;
  -[OADGroup setLogicalBounds:](mGroup, "setLogicalBounds:", v24, v25, v26, v27);
}

- (double)scale
{
  return self->mScale;
}

- (void)setLogicalBounds:(CGRect)a3
{
}

- (id)group
{
  return self->mGroup;
}

- (void)setGroup:(id)a3
{
}

- (id)presentationNameForPointType:(int)a3
{
  v3 = [(NSMutableArray *)self->mPresentationNames objectAtIndex:a3];
  v4 = [MEMORY[0x263EFF9D0] null];

  if (v3 == v4)
  {

    v3 = 0;
  }
  return v3;
}

- (void)setPresentationName:(id)a3 forPointType:(int)a4
{
  id v6 = a3;
  mPresentationNames = self->mPresentationNames;
  id v8 = v6;
  id v10 = v6;
  if (!v6)
  {
    id v8 = [MEMORY[0x263EFF9D0] null];
  }
  [(NSMutableArray *)mPresentationNames replaceObjectAtIndex:a4 withObject:v8];
  double v9 = v10;
  if (!v10)
  {

    double v9 = 0;
  }
}

- (id)defaultStyleLabelNameForPointType:(int)a3
{
  v3 = [(NSMutableArray *)self->mDefaultStyleLabelNames objectAtIndex:a3];
  v4 = [MEMORY[0x263EFF9D0] null];

  if (v3 == v4)
  {

    v3 = 0;
  }
  return v3;
}

- (void)setDefaultStyleLabelName:(id)a3 forPointType:(int)a4
{
}

- (int)pointCount
{
  return self->mPointCount;
}

- (void)setPointCount:(int)a3
{
  self->mPointCount = a3;
}

- (int)pointIndex
{
  return self->mPointIndex;
}

- (void)setPointIndex:(int)a3
{
  self->mPointIndedouble x = a3;
}

- (id)textStyle
{
  return self->mTextStyle;
}

- (void)setTextStyle:(id)a3
{
}

- (id)drawingTheme
{
  return self->mDrawingTheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawingTheme, 0);
  objc_storeStrong((id *)&self->mTextStyle, 0);
  objc_storeStrong((id *)&self->mDefaultStyleLabelNames, 0);
  objc_storeStrong((id *)&self->mPresentationNames, 0);
  objc_storeStrong((id *)&self->mGroup, 0);
  objc_storeStrong((id *)&self->mDiagramOrientedBounds, 0);
  objc_storeStrong((id *)&self->mDiagram, 0);
}

@end