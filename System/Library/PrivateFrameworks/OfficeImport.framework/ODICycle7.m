@interface ODICycle7
+ (BOOL)map1NodeWithState:(id)a3;
+ (BOOL)map2NodeWithState:(id)a3;
+ (CGRect)mapGSpaceWithState:(id)a3;
+ (CGSize)nodeSizeWithState:(id)a3;
+ (void)addShapeForNode:(id)a3 relativeBounds:(CGRect)a4 state:(id)a5;
+ (void)addShapeForTransition:(id)a3 relativeBounds:(CGRect)a4 rotation:(float)a5 state:(id)a6;
+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5;
+ (void)mapTransition:(id)a3 index:(unsigned int)a4 state:(id)a5;
@end

@implementation ODICycle7

+ (CGSize)nodeSizeWithState:(id)a3
{
  long double v3 = sin(3.14159265 / (double)(unint64_t)[a1 nodeCountWithState:a3]);
  *(float *)&long double v3 = (v3 + v3) * 0.6;
  float v4 = *(float *)&v3 * 0.5;
  double v5 = *(float *)&v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (CGRect)mapGSpaceWithState:(id)a3
{
  [a1 boundingBoxWithIsTight:1 state:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (void)addShapeForNode:(id)a3 relativeBounds:(CGRect)a4 state:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a3;
  id v10 = a5;
  LODWORD(v11) = 1045220557;
  v12 = +[ODIDrawable shapeGeometryForRoundedRectangleWithRadius:v11];
  v13 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v12, v10, x, y, width, height, 0.0);
  +[ODIDrawable mapStyleAndTextFromPoint:v14 shape:v13 state:v10];
}

+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  id v8 = a5;
  [a1 nodeBoundsWithIndex:v6 state:v8];
  objc_msgSend(a1, "addShapeForNode:relativeBounds:state:", v9, v8);
}

+ (void)addShapeForTransition:(id)a3 relativeBounds:(CGRect)a4 rotation:(float)a5 state:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v16 = a3;
  id v12 = a6;
  v13 = +[ODIDrawable shapeGeometryForDoubleArrowWithControlPoint:](ODIDrawable, "shapeGeometryForDoubleArrowWithControlPoint:", 0.1, 0.15);
  *(float *)&double v14 = a5;
  v15 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v13, v12, x, y, width, height, v14);
  +[ODIDrawable mapStyleAndTextFromPoint:v16 shape:v15 state:v12];
}

+ (void)mapTransition:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  unint64_t v9 = [a1 nodeCountWithState:v8];
  float v10 = (double)((2 * a4) | 1) * 3.14159265 / (double)v9 + -1.57079633;
  __double2 v11 = __sincos_stret(3.14159265 / (double)v9);
  float cosval = v11.__cosval;
  __float2 v13 = __sincosf_stret(v10);
  float v14 = (v11.__sinval + v11.__sinval) * 0.4;
  objc_msgSend(a1, "addShapeForTransition:relativeBounds:rotation:state:", v15, v8, TSURectWithCenterAndSize((float)(v13.__cosval * cosval), (float)(v13.__sinval * cosval), v14));
}

+ (BOOL)map1NodeWithState:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setLogicalBounds:", 0.0, 0.0, 1.0, 0.5);
  double v5 = [v4 diagram];
  uint64_t v6 = [v5 documentPoint];
  v7 = [v6 children];
  id v8 = [v7 objectAtIndex:0];

  objc_msgSend(a1, "addShapeForNode:relativeBounds:state:", v8, v4, 0.0, 0.0, 1.0, 0.5);
  return 1;
}

+ (BOOL)map2NodeWithState:(id)a3
{
  id v4 = a3;
  double v5 = (double *)MEMORY[0x263F00148];
  objc_msgSend(v4, "setLogicalBounds:", TSURectWithCenterAndSize(*MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 1.0));
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    [v4 setPointIndex:v6];
    unint64_t v9 = [v4 diagram];
    float v10 = [v9 documentPoint];
    __double2 v11 = [v10 children];
    id v12 = [v11 objectAtIndex:v6];

    if (v8) {
      double v13 = -0.625;
    }
    else {
      double v13 = 0.625;
    }
    objc_msgSend(a1, "addShapeForNode:relativeBounds:state:", v12, v4, TSURectWithCenterAndSize(0.0, v13, 1.0));
    double v14 = TSURectWithCenterAndSize(*v5, v5[1], 0.5625);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [v12 siblingTransition];
    if (v8) {
      *(float *)&double v22 = 90.0;
    }
    else {
      *(float *)&double v22 = 270.0;
    }
    objc_msgSend(a1, "addShapeForTransition:relativeBounds:rotation:state:", v21, v4, v14, v16, v18, v20, v22);

    char v7 = 0;
    uint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);

  return 1;
}

@end