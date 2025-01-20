@interface ODIVenn1
+ (CGRect)mapGSpaceWithState:(id)a3;
+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5;
@end

@implementation ODIVenn1

+ (CGRect)mapGSpaceWithState:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [a1 nodeCountWithState:v4];
  unint64_t v6 = v5;
  float v7 = -180.0;
  if (v5 != 2) {
    float v7 = -90.0;
  }
  double v8 = ODIRegularPolygonBounds(v5, 1.0, v7);
  if (v6 < 5) {
    CGRect v20 = CGRectInset(*(CGRect *)&v8, -1.20000005, -1.20000005);
  }
  else {
    CGRect v20 = CGRectInset(*(CGRect *)&v8, -0.300000012, -0.180000007);
  }
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  id v43 = a3;
  id v8 = a5;
  unint64_t v9 = [a1 nodeCountWithState:v8];
  uint64_t v10 = a4 + 1;
  if (v9 < 5)
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"circ%d", a4 + 1);
    [v8 setPresentationName:v11 forPointType:2];
    float v33 = -(dbl_238EDC6D0[v9 == 2] - (double)a4 * (6.28318531 / (double)v9));
    __float2 v34 = __sincosf_stret(v33);
    double v35 = TSURectWithCenterAndSize(v34.__cosval, v34.__sinval, 2.4000001);
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v42 = +[ODIDrawable shapeGeometryForEllipse];
    v22 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v42, v8, v35, v37, v39, v41, 0.0);

    +[ODIDrawable mapStyleAndTextFromPoint:v43 shape:v22 state:v8];
  }
  else
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"circ%dTx", a4 + 1);
    [v8 setPresentationName:v11 forPointType:2];
    float v12 = (double)a4 * (6.28318531 / (double)v9) + -1.57079633;
    __float2 v13 = __sincosf_stret(v12);
    double v14 = TSURectWithCenterAndSize(v13.__cosval, v13.__sinval, 0.600000024);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = +[ODIDrawable shapeGeometryForRectangle];
    v22 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v21, v8, v14, v16, v18, v20, 0.0);

    +[ODIDrawable mapStyleAndTextFromPoint:v43 shape:v22 state:v8];
    [v43 setText:0];
    double v23 = TSURectWithCenterAndSize((float)(v13.__cosval * 0.25), (float)(v13.__sinval * 0.25), 0.699999988);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    v30 = +[ODIDrawable shapeGeometryForEllipse];
    v31 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v30, v8, v23, v25, v27, v29, 0.0);

    v32 = objc_msgSend(NSString, "stringWithFormat:", @"circ%d", v10);
    +[ODIDrawable mapStyleForPresentationName:v32 point:v43 shape:v31 state:v8];
  }
}

@end