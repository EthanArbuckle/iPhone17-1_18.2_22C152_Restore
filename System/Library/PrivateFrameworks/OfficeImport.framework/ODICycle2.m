@interface ODICycle2
+ (BOOL)map1NodeWithState:(id)a3;
+ (BOOL)map2NodeWithState:(id)a3;
+ (CGRect)mapGSpaceWithState:(id)a3;
+ (CGSize)nodeSizeWithState:(id)a3;
+ (float)nodeRadiusWithState:(id)a3;
+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5;
+ (void)mapTransition:(id)a3 index:(unsigned int)a4 state:(id)a5;
@end

@implementation ODICycle2

+ (float)nodeRadiusWithState:(id)a3
{
  return sin(2.19911482 / (double)(unint64_t)[a1 nodeCountWithState:a3]);
}

+ (CGSize)nodeSizeWithState:(id)a3
{
  [a1 nodeRadiusWithState:a3];
  double v4 = (float)(v3 + v3);
  double v5 = v4;
  result.height = v5;
  result.width = v4;
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

+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v19 = a3;
  id v8 = a5;
  [a1 nodeBoundsWithIndex:v6 state:v8];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = +[ODIDrawable shapeGeometryForEllipse];
  v18 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v17, v8, v10, v12, v14, v16, 0.0);

  +[ODIDrawable mapStyleAndTextFromPoint:v19 shape:v18 state:v8];
}

+ (void)mapTransition:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  id v27 = a3;
  id v8 = a5;
  unint64_t v9 = [a1 nodeCountWithState:v8];
  [a1 nodeRadiusWithState:v8];
  float v11 = v10;
  LODWORD(a1) = (2 * a4) | 1;
  __double2 v13 = __sincos_stret(3.14159265 / (double)v9);
  float cosval = v13.__cosval;
  float v12 = (double)a1 * 3.14159265 / (double)v9 + -1.57079633;
  __float2 v15 = __sincosf_stret(v12);
  float v16 = -((float)(v11 + v11) - v13.__sinval * 2.0) * 0.55;
  double v17 = TSURectWithCenterAndSize((float)(v15.__cosval * cosval), (float)(v15.__sinval * cosval), v16);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.5, 0.15);
  *(float *)&double v25 = (float)((180 * a1) / v9);
  v26 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v24, v8, v17, v19, v21, v23, v25);
  +[ODIDrawable mapStyleAndTextFromPoint:v27 shape:v26 state:v8];
}

+ (BOOL)map1NodeWithState:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "setLogicalBounds:", 0.0, 0.0, 1.0, 1.0);
  double v4 = [v3 diagram];
  double v5 = [v4 documentPoint];
  uint64_t v6 = [v5 children];
  v7 = [v6 objectAtIndex:0];

  id v8 = +[ODIDrawable shapeGeometryForEllipse];
  unint64_t v9 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v8, v3, 0.0, 0.0, 1.0, 1.0, 0.0);

  +[ODIDrawable mapStyleAndTextFromPoint:v7 shape:v9 state:v3];
  return 1;
}

+ (BOOL)map2NodeWithState:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "setLogicalBounds:", TSURectWithCenterAndSize(*MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 4.80000019));
  uint64_t v4 = 0;
  char v5 = 1;
  double v33 = 0.9;
  do
  {
    char v6 = v5;
    objc_msgSend(v3, "setPointIndex:", v4, *(void *)&v33);
    v7 = [v3 diagram];
    id v8 = [v7 documentPoint];
    unint64_t v9 = [v8 children];
    float v10 = [v9 objectAtIndex:v4];

    if (v6) {
      int v11 = -1;
    }
    else {
      int v11 = 1;
    }
    double v12 = TSURectWithCenterAndSize((float)((float)v11 * 1.4), 0.0, 2.0);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = +[ODIDrawable shapeGeometryForEllipse];
    double v20 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v19, v3, v12, v14, v16, v18, 0.0);

    +[ODIDrawable mapStyleAndTextFromPoint:v10 shape:v20 state:v3];
    double v21 = TSURectWithCenterAndSize(0.0, (double)v11 * v33, 1.20000001);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = +[ODIDrawable shapeGeometryForRightArrowWithControlPoint:](ODIDrawable, "shapeGeometryForRightArrowWithControlPoint:", 0.35, 0.2);
    if (v6) {
      *(float *)&double v29 = 0.0;
    }
    else {
      *(float *)&double v29 = 180.0;
    }
    v30 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v28, v3, v21, v23, v25, v27, v29);
    v31 = [v10 siblingTransition];
    +[ODIDrawable mapStyleAndTextFromPoint:v31 shape:v30 state:v3];

    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);

  return 1;
}

@end