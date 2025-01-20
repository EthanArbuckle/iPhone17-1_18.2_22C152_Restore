@interface ODIHorizonalList3
+ (BOOL)mapIdentifier:(id)a3 state:(id)a4;
- (ODIHorizonalList3)initWithState:(id)a3;
- (void)map;
- (void)mapBaseStyleFromPoint:(id)a3 shape:(id)a4;
- (void)mapOnePillarStyleFromPoint:(id)a3 shape:(id)a4;
- (void)mapPillarPoints:(id)a3 bounds:(CGRect)a4;
- (void)mapRoofStyleFromPoint:(id)a3 shape:(id)a4;
- (void)setMaxPointCount:(unsigned int)a3;
@end

@implementation ODIHorizonalList3

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"hList3"])
  {
    v8 = (ODITitlePoint *)[objc_alloc((Class)a1) initWithState:v7];
    goto LABEL_12;
  }
  if (![v6 isEqualToString:@"matrix1"])
  {
    if (([v6 isEqualToString:@"radial1"] & 1) == 0
      && ([v6 isEqualToString:@"radial3"] & 1) == 0
      && ([v6 isEqualToString:@"radial4"] & 1) == 0
      && ([v6 isEqualToString:@"radial5"] & 1) == 0
      && ![v6 isEqualToString:@"radial6"])
    {
      BOOL v10 = 0;
      v9 = 0;
      goto LABEL_14;
    }
    v8 = [[ODITitlePoint alloc] initWithTitlePointPresentationName:@"centerShape" state:v7];
LABEL_12:
    v9 = v8;
    if (!v8) {
      goto LABEL_13;
    }
    goto LABEL_5;
  }
  v9 = [[ODITitlePoint alloc] initWithTitlePointPresentationName:@"centerTile" state:v7];
  [(ODIHorizonalList3 *)v9 setMaxPointCount:4];
  if (!v9)
  {
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }
LABEL_5:
  [(ODIHorizonalList3 *)v9 map];
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (void).cxx_destruct
{
}

- (ODIHorizonalList3)initWithState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ODIHorizonalList3;
  id v6 = [(ODIHorizonalList3 *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    v6->mMaxPointCount = -1;
    objc_storeStrong((id *)&v6->mState, a3);
  }

  return v7;
}

- (void)setMaxPointCount:(unsigned int)a3
{
  self->mMaxPointCount = a3;
}

- (void)map
{
  id v19 = [(ODIState *)self->mState diagram];
  v3 = [v19 documentPoint];
  v4 = [v3 children];
  if ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
    +[ODIDrawable sizeOfDiagram:v19];
    float v8 = v7 / v6;
    -[ODIState setLogicalBounds:maintainAspectRatio:](self->mState, "setLogicalBounds:maintainAspectRatio:", 0, 0.0, 0.0, 1.0, v8);
    [(ODIState *)self->mState setPresentationName:@"roof" forPointType:2];
    objc_super v9 = +[ODIDrawable shapeGeometryForRectangle];
    BOOL v10 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v9, self->mState, 0.0, 0.0, 1.0, (float)(v8 * 0.29), 0.0);

    [(ODIHorizonalList3 *)self mapRoofStyleFromPoint:v5 shape:v10];
    +[ODIText mapTextFromPoint:v5 toShape:v10 isCentered:1 includeChildren:0 state:self->mState];
    v11 = [v5 children];
    if ([v11 count])
    {
      CGFloat v12 = 1.0;
      -[ODIHorizonalList3 mapPillarPoints:bounds:](self, "mapPillarPoints:bounds:", v11, 0.0, (float)((float)(v8 * 0.29) + 0.003), 1.0, (float)(v8 * 0.62));
    }
    else
    {
      v13 = +[ODIDrawable shapeGeometryForRectangle];
      CGFloat v12 = 1.0;
      v14 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v13, self->mState, 0.0, (float)((float)(v8 * 0.29) + 0.003), 1.0, (float)(v8 * 0.62), 0.0);

      [(ODIHorizonalList3 *)self mapOnePillarStyleFromPoint:v3 shape:v14];
    }
    v21.origin.x = 0.0;
    v21.origin.y = (float)((float)(v8 * 0.29) + 0.003);
    v21.size.width = v12;
    v21.size.height = (float)(v8 * 0.62);
    double MaxY = CGRectGetMaxY(v21);
    v16 = +[ODIDrawable shapeGeometryForRectangle];
    float v17 = MaxY + 0.00300000003;
    v18 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v16, self->mState, 0.0, v17, 1.0, (float)(v8 - v17), 0.0);

    [(ODIHorizonalList3 *)self mapBaseStyleFromPoint:v3 shape:v18];
  }
}

- (void)mapPillarPoints:(id)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v16 = a3;
  unsigned int v8 = [v16 count];
  unsigned int mMaxPointCount = self->mMaxPointCount;
  if (mMaxPointCount >= v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = mMaxPointCount;
  }
  [(ODIState *)self->mState setPresentationName:0 forPointType:2];
  if (v10)
  {
    uint64_t v11 = 0;
    double v12 = 0.00300000003;
    do
    {
      v13 = objc_msgSend(v16, "objectAtIndex:", v11, v12);
      v14 = +[ODIDrawable shapeGeometryForRectangle];
      v15 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v14, self->mState, x, y, (float)((float)((float)((float)(v10 - 1) * -0.003) + 1.0) / (float)v10), height, 0.0);

      +[ODIDrawable mapStyleFromPoint:v13 shape:v15 state:self->mState];
      +[ODIText mapTextFromPoint:v13 toShape:v15 isCentered:1 includeChildren:1 state:self->mState];
      double x = (float)((float)((float)((float)(v10 - 1) * -0.003) + 1.0) / (float)v10)
        + 0.00300000003
        + x;

      ++v11;
    }
    while (v10 != v11);
  }
}

- (void)mapRoofStyleFromPoint:(id)a3 shape:(id)a4
{
}

- (void)mapOnePillarStyleFromPoint:(id)a3 shape:(id)a4
{
}

- (void)mapBaseStyleFromPoint:(id)a3 shape:(id)a4
{
}

@end