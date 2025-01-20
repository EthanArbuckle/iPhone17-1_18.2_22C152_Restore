@interface ODIVenn3
+ (CGRect)mapGSpaceWithState:(id)a3;
+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5;
@end

@implementation ODIVenn3

+ (CGRect)mapGSpaceWithState:(id)a3
{
  double v3 = (float)((float)((float)(unint64_t)([a1 nodeCountWithState:a3] - 1) * 1.6) + 2.0);
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 2.0;
  result.size.height = v6;
  result.size.width = v3;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  id v17 = a3;
  id v7 = a5;
  double v8 = TSURectWithCenterAndSize((float)((float)((float)a4 * 1.6) + 1.0), 1.0, 2.0);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = +[ODIDrawable shapeGeometryForEllipse];
  v16 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v15, v7, v8, v10, v12, v14, 0.0);

  +[ODIDrawable mapStyleAndTextFromPoint:v17 shape:v16 state:v7];
}

@end