@interface ODICycle5
+ (BOOL)map1NodeWithState:(id)a3;
+ (BOOL)map2NodeWithState:(id)a3;
+ (CGRect)mapGSpaceWithState:(id)a3;
+ (CGSize)nodeSizeWithState:(id)a3;
+ (float)intersectionAngleNextToAngle:(float)a3 isAfter:(BOOL)a4 state:(id)a5;
+ (float)normalizedAngle:(float)a3;
+ (void)addShapeForNode:(id)a3 relativeBounds:(CGRect)a4 state:(id)a5;
+ (void)addShapeForTransition:(id)a3 startAngle:(float)a4 endAngle:(float)a5 state:(id)a6;
+ (void)mapNode:(id)a3 index:(unsigned int)a4 state:(id)a5;
+ (void)mapStyleForTransition:(id)a3 shape:(id)a4 state:(id)a5;
+ (void)mapTransition:(id)a3 index:(unsigned int)a4 state:(id)a5;
@end

@implementation ODICycle5

+ (CGSize)nodeSizeWithState:(id)a3
{
  long double v3 = sin(3.14159265 / (double)(unint64_t)[a1 nodeCountWithState:a3]);
  *(float *)&long double v3 = (v3 + v3) * 0.6;
  float v4 = *(float *)&v3 * 0.7;
  double v5 = *(float *)&v3;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (CGRect)mapGSpaceWithState:(id)a3
{
  [a1 boundingBoxWithIsTight:0 state:a3];
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

+ (float)normalizedAngle:(float)a3
{
  return (float)((float)(a3 / 360.0) - floorf(a3 / 360.0)) * 360.0;
}

+ (void)addShapeForTransition:(id)a3 startAngle:(float)a4 endAngle:(float)a5 state:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  *(float *)&double v12 = a4;
  [a1 normalizedAngle:v12];
  float v14 = v13;
  *(float *)&double v15 = a5;
  [a1 normalizedAngle:v15];
  if (v16 >= v14) {
    float v17 = v16;
  }
  else {
    float v17 = v16 + 360.0;
  }
  v18 = (double *)MEMORY[0x263F00148];
  double v19 = TSURectWithCenterAndSize(*MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 2.0);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = objc_alloc_init(OITSUBezierPath);
  CGAffineTransformMakeRotation(&v29, v14 * 3.14159265 / 180.0);
  [(OITSUBezierPath *)v26 moveToPoint:vaddq_f64(*(float64x2_t *)&v29.tx, vaddq_f64(*(float64x2_t *)&v29.a, vmulq_f64(*(float64x2_t *)&v29.c, (float64x2_t)0)))];
  -[OITSUBezierPath appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:](v26, "appendBezierPathWithArcWithCenter:radius:startAngle:endAngle:clockwise:", v17 < v14, *v18, v18[1], 1.0, v14, v17);
  v27 = +[ODIDrawable shapeGeometryForBezierPath:gSpace:](ODIDrawable, "shapeGeometryForBezierPath:gSpace:", v26, v19, v21, v23, v25);
  v28 = +[ODIDrawable addShapeWithBounds:rotation:geometry:state:](ODIDrawable, "addShapeWithBounds:rotation:geometry:state:", v27, v11, v19, v21, v23, v25, 0.0);
  [a1 mapStyleForTransition:v10 shape:v28 state:v11];
}

+ (void)mapStyleForTransition:(id)a3 shape:(id)a4 state:(id)a5
{
}

+ (float)intersectionAngleNextToAngle:(float)a3 isAfter:(BOOL)a4 state:(id)a5
{
  BOOL v5 = a4;
  v50[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v50[0] = 0;
  *(float *)&double v9 = a3;
  [a1 normalizedAngle:v9];
  float v11 = v10;
  BOOL v46 = v5;
  v47 = v8;
  [a1 nodeSizeWithState:v8];
  double v13 = v12;
  double v15 = v14;
  __double2 v16 = __sincos_stret(v11 * 3.14159265 / 180.0);
  uint64_t v17 = 0;
  int v18 = 0;
  float v19 = v16.__cosval - v13 * 0.5;
  float v20 = v16.__sinval - v15 * 0.5;
  float v21 = v16.__cosval + v13 * 0.5;
  double v22 = v16.__sinval + v15 * 0.5;
  *(float *)&double v22 = v22;
  *(float *)v49 = v19;
  *(float *)&v49[1] = v20;
  char v23 = 1;
  *(float *)&v49[2] = v21;
  v49[3] = LODWORD(v22);
  do
  {
    uint64_t v24 = 0;
    int v48 = *((_DWORD *)&qword_238EDC5E8 + v17);
    uint64_t v25 = v23 & 1;
    if (v23) {
      uint64_t v26 = 3;
    }
    else {
      uint64_t v26 = 2;
    }
    char v27 = 1;
    do
    {
      char v28 = v27;
      float v29 = *(float *)&v49[2 * *((_DWORD *)&qword_238EDC5E8 + v24) + v48];
      if (fabsf(v29) <= 1.0)
      {
        uint64_t v30 = 0;
        float v31 = sqrtf(1.0 - (float)(v29 * v29));
        float v32 = *(float *)&v49[v25];
        char v33 = 1;
        do
        {
          char v34 = v33;
          float v35 = v31 * (float)*((int *)&unk_238EDC438 + v30);
          if (v35 > v32 && v35 < *(float *)&v49[v26])
          {
            if (v25) {
              float v36 = v29;
            }
            else {
              float v36 = v31 * (float)*((int *)&unk_238EDC438 + v30);
            }
            if (!v25) {
              float v35 = v29;
            }
            double v37 = (float)(atan2f(v35, v36) * 180.0) / 3.14159265;
            *(float *)&double v37 = v37;
            [a1 normalizedAngle:v37];
            *((_DWORD *)v50 + v18++) = LODWORD(v22);
          }
          char v33 = 0;
          uint64_t v30 = 1;
        }
        while ((v34 & 1) != 0);
      }
      char v27 = 0;
      uint64_t v24 = 1;
    }
    while ((v28 & 1) != 0);
    char v23 = 0;
    uint64_t v17 = 1;
  }
  while ((v25 & 1) != 0);
  uint64_t v38 = 0;
  LODWORD(v22) = 1135869952;
  if (!v46) {
    *(float *)&double v22 = 0.0;
  }
  char v39 = 1;
  do
  {
    char v40 = v39;
    float v41 = *((float *)v50 + v38) - v11;
    if (v41 < 0.0) {
      float v41 = v41 + 360.0;
    }
    BOOL v42 = v41 >= *(float *)&v22;
    if (!v46) {
      BOOL v42 = v41 <= *(float *)&v22;
    }
    if (!v42) {
      *(float *)&double v22 = v41;
    }
    uint64_t v38 = 1;
    char v39 = 0;
  }
  while ((v40 & 1) != 0);
  *(float *)&double v22 = v11 + *(float *)&v22;
  [a1 normalizedAngle:v22];
  float v44 = v43;

  return v44;
}

+ (void)mapTransition:(id)a3 index:(unsigned int)a4 state:(id)a5
{
  id v17 = a3;
  id v8 = a5;
  double v9 = (double)(unint64_t)[a1 nodeCountWithState:v8];
  double v10 = (double)a4 * 360.0 / v9 + -90.0;
  *(float *)&double v10 = v10;
  [a1 intersectionAngleNextToAngle:1 isAfter:v8 state:v10];
  float v12 = v11;
  double v13 = (double)(a4 + 1) * 360.0 / v9 + -90.0;
  *(float *)&double v13 = v13;
  [a1 intersectionAngleNextToAngle:0 isAfter:v8 state:v13];
  if (*(float *)&v14 < v12) {
    *(float *)&double v14 = *(float *)&v14 + 360.0;
  }
  float v16 = (float)(v12 + *(float *)&v14) * 0.5;
  *(float *)&double v15 = (float)((float)(*(float *)&v14 - v12) * 0.7) * 0.5;
  *(float *)&double v14 = v16 - *(float *)&v15;
  *(float *)&double v15 = v16 + *(float *)&v15;
  [a1 addShapeForTransition:v17 startAngle:v8 endAngle:v14 state:v15];
}

+ (BOOL)map1NodeWithState:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setLogicalBounds:", 0.0, 0.0, 1.0, 0.699999988);
  BOOL v5 = [v4 diagram];
  uint64_t v6 = [v5 documentPoint];
  v7 = [v6 children];
  id v8 = [v7 objectAtIndex:0];

  objc_msgSend(a1, "addShapeForNode:relativeBounds:state:", v8, v4, 0.0, 0.0, 1.0, 0.699999988);
  return 1;
}

+ (BOOL)map2NodeWithState:(id)a3
{
  return 0;
}

@end