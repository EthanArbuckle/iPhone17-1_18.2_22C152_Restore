@interface ODIPyramid
+ (BOOL)mapIdentifier:(id)a3 state:(id)a4;
+ (BOOL)verticalFlipWithState:(id)a3;
+ (unint64_t)nodeCountWithState:(id)a3;
+ (void)addTrapezoidForNode:(id)a3 top:(float)a4 height:(float)a5 topBase:(float)a6 bottomBase:(float)a7 state:(id)a8;
+ (void)mapWithState:(id)a3 apexUp:(BOOL)a4;
@end

@implementation ODIPyramid

+ (BOOL)mapIdentifier:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 verticalFlipWithState:v7];
  if (([v6 isEqualToString:@"pyramid1"] & 1) != 0
    || ([v6 isEqualToString:@"pyramid2"] & 1) != 0
    || [v6 isEqualToString:@"pyramid4"])
  {
    uint64_t v8 = v8 ^ 1;
  }
  else if (![v6 isEqualToString:@"pyramid3"])
  {
    BOOL v9 = 0;
    goto LABEL_6;
  }
  +[ODIPyramid mapWithState:v7 apexUp:v8];
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

+ (void)addTrapezoidForNode:(id)a3 top:(float)a4 height:(float)a5 topBase:(float)a6 bottomBase:(float)a7 state:(id)a8
{
  id v23 = a3;
  id v13 = a8;
  v14 = objc_alloc_init(OITSUBezierPath);
  double v15 = a4;
  -[OITSUBezierPath moveToPoint:](v14, "moveToPoint:", (float)(a6 * 0.5), a4);
  double v16 = (float)(a4 + a5);
  -[OITSUBezierPath lineToPoint:](v14, "lineToPoint:", (float)(a7 * 0.5), v16);
  -[OITSUBezierPath lineToPoint:](v14, "lineToPoint:", (float)(a7 * -0.5), v16);
  -[OITSUBezierPath lineToPoint:](v14, "lineToPoint:", (float)(a6 * -0.5), v15);
  [(OITSUBezierPath *)v14 closePath];
  if (a6 >= a7) {
    float v17 = a6;
  }
  else {
    float v17 = a7;
  }
  double v18 = v17;
  double v19 = v17 * -0.5;
  double v20 = a5;
  v21 = +[ODIDrawable shapeGeometryForBezierPath:gSpace:](ODIDrawable, "shapeGeometryForBezierPath:gSpace:", v14, v19, v15, v17, v20);
  v22 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v21, v13, v19, v15, v18, v20, 0.0);
  +[ODIDrawable mapStyleAndTextFromPoint:v23 shape:v22 state:v13];
}

+ (void)mapWithState:(id)a3 apexUp:(BOOL)a4
{
  id v29 = a3;
  unint64_t v6 = objc_msgSend(a1, "nodeCountWithState:");
  unint64_t v7 = v6 + 1;
  objc_msgSend(v29, "setLogicalBounds:maintainAspectRatio:", 0, -1.0, 0.0, 2.0, (double)(v6 + 1));
  uint64_t v8 = [v29 diagram];
  BOOL v9 = [v8 documentPoint];
  v10 = [v9 children];

  if (a4)
  {
    if (v6)
    {
      uint64_t v11 = 0;
      float v12 = (float)v7;
      unsigned int v13 = 1;
      do
      {
        v14 = [v10 objectAtIndex:v11];
        if (v13 == 1) {
          unsigned int v19 = 0;
        }
        else {
          unsigned int v19 = v13;
        }
        *(float *)&double v15 = (float)v19;
        if (v13 == 1) {
          int v20 = 2;
        }
        else {
          int v20 = 1;
        }
        *(float *)&double v16 = (float)v20;
        *(float *)&double v18 = (float)((float)(*(float *)&v15 + (float)v20) / v12) * 1.36;
        *(float *)&double v17 = (float)(*(float *)&v15 / v12) * 1.36;
        [a1 addTrapezoidForNode:v14 top:v29 height:v15 topBase:v16 bottomBase:v17 state:v18];

        uint64_t v11 = v13;
      }
      while (v6 > v13++);
    }
  }
  else if (v6)
  {
    unint64_t v22 = 0;
    float v23 = (float)v7;
    do
    {
      v24 = [v10 objectAtIndex:v22];
      if (v6 - 1 == v22) {
        *(float *)&double v26 = 2.0;
      }
      else {
        *(float *)&double v26 = 1.0;
      }
      *(float *)&double v25 = (float)v22;
      *(float *)&double v28 = (float)(1.0 - (float)((float)(*(float *)&v26 + (float)v22) / v23)) * 1.36;
      *(float *)&double v27 = (float)(1.0 - (float)((float)v22 / v23)) * 1.36;
      [a1 addTrapezoidForNode:v24 top:v29 height:v25 topBase:v26 bottomBase:v27 state:v28];

      ++v22;
    }
    while (v6 != v22);
  }
}

+ (unint64_t)nodeCountWithState:(id)a3
{
  v3 = [a3 diagram];
  v4 = [v3 documentPoint];
  v5 = [v4 children];
  unint64_t v6 = [v5 count];

  return v6;
}

+ (BOOL)verticalFlipWithState:(id)a3
{
  id v3 = a3;
  v4 = [v3 diagram];
  v5 = [v4 documentPoint];
  unint64_t v6 = [v5 presentations];

  for (unsigned int i = 0; ; unsigned int i = v8 + 1)
  {
    unsigned int v8 = i;
    if ([v6 count] <= (unint64_t)i)
    {
      char v13 = 0;
      goto LABEL_7;
    }
    BOOL v9 = [v6 objectAtIndex:i];
    v10 = [v9 propertySet];
    uint64_t v11 = [v10 presentationName];
    int v12 = [v11 isEqualToString:@"pyramid"];

    if (v12) {
      break;
    }
  }
  char v13 = [v10 customVerticalFlip];

LABEL_7:
  return v13;
}

@end