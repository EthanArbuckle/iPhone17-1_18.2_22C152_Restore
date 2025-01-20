@interface NTKOlympusMask
+ (CGPoint)convertPoint:(CGPoint)a3 translantedFromFirstToQuadrantIndex:(unint64_t)a4;
+ (CGPoint)convertPoint:(CGPoint)result translantedQuadrantIndex:(unint64_t)a4;
+ (CGPoint)convertPointFromCartesianCoordiatesToViewCoordiates:(CGPoint)a3 centerFromViewCoordinates:(CGPoint)a4;
+ (CGPoint)convertPointFromViewCoordinatesToCartesianCoordiates:(CGPoint)a3 centerFromViewCoordinates:(CGPoint)a4;
+ (CGPoint)nextPointFromStartPoint:(CGPoint)result endPoint:(CGPoint)a4 radius:(double)a5;
+ (CGPoint)pointForAngle:(double)a3 radius:(double)a4 centerPoint:(CGPoint)a5;
+ (CGPoint)roundPoint:(CGPoint)a3;
+ (double)angleForHour:(unint64_t)a3 minutes:(unint64_t)a4;
+ (double)angleForMinute:(unint64_t)a3 seconds:(unint64_t)a4;
+ (double)convertAngleForFirstQuadrant:(double)result;
+ (double)hourHandAngleWithDate:(id)a3;
+ (double)minuteHandAngleWithDate:(id)a3;
+ (double)normalizeAngle:(double)result;
+ (id)clippingPathFromCenterPoint:(CGPoint)a3 startAngle:(double)a4 endAngle:(double)a5 radius:(double)a6;
+ (unint64_t)nextQuadrantIndex:(unint64_t)a3;
+ (unint64_t)quadrantForAngle:(double)a3;
+ (unint64_t)quadrantForPoint:(CGPoint)a3;
@end

@implementation NTKOlympusMask

+ (double)normalizeAngle:(double)result
{
  if (result > 360.0 && result / 360.0 > 1.0)
  {
    do
      result = result + -360.0;
    while (result / 360.0 > 1.0);
  }
  if (result < 0.0) {
    return result + 360.0;
  }
  return result;
}

+ (id)clippingPathFromCenterPoint:(CGPoint)a3 startAngle:(double)a4 endAngle:(double)a5 radius:(double)a6
{
  v9 = +[CLKRenderingContext sharedRenderingContext];
  v10 = [v9 device];

  CLKRoundForDevice();
  double v12 = v11;
  CLKRoundForDevice();
  double v14 = v13;
  CLKRoundForDevice();
  double v16 = v15;
  [a1 normalizeAngle:a4];
  double v18 = v17;
  [a1 normalizeAngle:a5];
  double v20 = v19;
  +[NTKOlympusMask pointForAngle:radius:centerPoint:](NTKOlympusMask, "pointForAngle:radius:centerPoint:", v18, v16, v12, v14);
  double v22 = v21;
  double v59 = v23;
  double v60 = v21;
  double v24 = v23;
  +[NTKOlympusMask pointForAngle:radius:centerPoint:](NTKOlympusMask, "pointForAngle:radius:centerPoint:", v20, v16, v12, v14);
  double v26 = v25;
  double v28 = v27;
  objc_msgSend(a1, "convertPointFromViewCoordinatesToCartesianCoordiates:centerFromViewCoordinates:", v22, v24, v12, v14);
  double v30 = v29;
  double v32 = v31;
  objc_msgSend(a1, "convertPointFromViewCoordinatesToCartesianCoordiates:centerFromViewCoordinates:", v26, v28, v12, v14);
  double v34 = v33;
  double v36 = v35;
  uint64_t v37 = objc_msgSend(a1, "quadrantForPoint:", v30, v32);
  uint64_t v38 = objc_msgSend(a1, "quadrantForPoint:", v34, v36);
  v39 = [MEMORY[0x1E4FB14C0] bezierPath];
  double v40 = v12;
  double v61 = v14;
  objc_msgSend(a1, "roundPoint:", v12, v14);
  objc_msgSend(v39, "moveToPoint:");
  objc_msgSend(a1, "roundPoint:", v60, v59);
  objc_msgSend(v39, "addLineToPoint:");
  if (v34 != v16)
  {
    BOOL v41 = v36 == -v16 || v36 == v16;
    if (!v41 && v34 != -v16) {
      double v34 = v16;
    }
  }
  while (v30 != v34 || v32 != v36)
  {
    objc_msgSend(a1, "convertPoint:translantedQuadrantIndex:", v37, v30, v32);
    double v44 = v43;
    double v46 = v45;
    objc_msgSend(a1, "convertPoint:translantedQuadrantIndex:", v37, v34, v36);
    if (v38 == v37) {
      double v49 = v47;
    }
    else {
      double v49 = v16;
    }
    if (v38 == v37) {
      double v50 = v48;
    }
    else {
      double v50 = 0.0;
    }
    objc_msgSend(a1, "nextPointFromStartPoint:endPoint:radius:", v44, v46, v49, v50, v16);
    double v52 = v51;
    double v54 = v53;
    objc_msgSend(a1, "convertPoint:translantedFromFirstToQuadrantIndex:", v37);
    double v30 = v55;
    double v32 = v56;
    if (v52 == v16 && v54 == 0.0) {
      uint64_t v37 = [a1 nextQuadrantIndex:v37];
    }
    objc_msgSend(a1, "convertPointFromCartesianCoordiatesToViewCoordiates:centerFromViewCoordinates:", v30, v32, v40, v61);
    objc_msgSend(a1, "roundPoint:");
    objc_msgSend(v39, "addLineToPoint:");
  }
  objc_msgSend(a1, "roundPoint:", v40, v61);
  objc_msgSend(v39, "addLineToPoint:");
  [v39 closePath];

  return v39;
}

+ (CGPoint)roundPoint:(CGPoint)a3
{
  v3 = +[CLKRenderingContext sharedRenderingContext];
  v4 = [v3 device];

  CLKRoundForDevice();
  double v6 = v5;
  CLKRoundForDevice();
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

+ (double)angleForHour:(unint64_t)a3 minutes:(unint64_t)a4
{
  return ((double)a4 / 60.0 + (double)a3) * 30.0;
}

+ (double)angleForMinute:(unint64_t)a3 seconds:(unint64_t)a4
{
  return ((double)a4 / 60.0 + (double)a3) * 6.0;
}

+ (double)hourHandAngleWithDate:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  double v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 component:32 fromDate:v5] % 12;

  double v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v9 = [v8 component:64 fromDate:v5];

  [a1 angleForHour:v7 minutes:v9];
  return result;
}

+ (double)minuteHandAngleWithDate:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  double v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 component:64 fromDate:v5];

  double v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v9 = [v8 component:128 fromDate:v5];

  [a1 angleForMinute:v7 seconds:v9];
  return result;
}

+ (CGPoint)pointForAngle:(double)a3 radius:(double)a4 centerPoint:(CGPoint)a5
{
  uint64_t v8 = objc_msgSend(a1, "quadrantForAngle:");
  [a1 convertAngleForFirstQuadrant:a3];
  double v10 = v9;
  double v11 = 90.0 - v9;
  if (v10 <= 45.0) {
    double v11 = v10;
  }
  float v12 = v11 * 3.14159265 / 180.0;
  double v13 = tanf(v12);
  double v14 = v13 * a4;
  if (v10 > 45.0) {
    double v15 = a4;
  }
  else {
    double v15 = v13 * a4;
  }
  if (v10 <= 45.0) {
    double v14 = a4;
  }
  objc_msgSend(a1, "convertPoint:translantedFromFirstToQuadrantIndex:", v8, v15, v14);

  objc_msgSend(a1, "convertPointFromCartesianCoordiatesToViewCoordiates:centerFromViewCoordinates:");
  result.y = v17;
  result.x = v16;
  return result;
}

+ (CGPoint)convertPointFromViewCoordinatesToCartesianCoordiates:(CGPoint)a3 centerFromViewCoordinates:(CGPoint)a4
{
  double v4 = a3.x - a4.x;
  double v5 = a4.y - a3.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)convertPointFromCartesianCoordiatesToViewCoordiates:(CGPoint)a3 centerFromViewCoordinates:(CGPoint)a4
{
  double v4 = a3.x + a4.x;
  double v5 = a4.y - a3.y;
  result.y = v5;
  result.x = v4;
  return result;
}

+ (CGPoint)convertPoint:(CGPoint)result translantedQuadrantIndex:(unint64_t)a4
{
  double v4 = -result.x;
  double v5 = -result.y;
  if (a4 == 2) {
    double x = result.x;
  }
  else {
    double x = result.y;
  }
  if (a4 == 2) {
    result.double x = -result.y;
  }
  if (a4 == 3) {
    result.double x = v4;
  }
  else {
    double v5 = x;
  }
  if (a4 == 4) {
    result.double x = result.y;
  }
  else {
    double v4 = v5;
  }
  double v7 = 0.0;
  if (result.x == 0.0) {
    result.double x = 0.0;
  }
  if (v4 != 0.0) {
    double v7 = v4;
  }
  result.y = v7;
  return result;
}

+ (CGPoint)convertPoint:(CGPoint)a3 translantedFromFirstToQuadrantIndex:(unint64_t)a4
{
  double v4 = -a3.y;
  if (a4 == 2) {
    double y = -a3.x;
  }
  else {
    double y = a3.y;
  }
  if (a4 != 2) {
    a3.double y = a3.x;
  }
  if (a4 == 3)
  {
    double y = v4;
    a3.double y = -a3.x;
  }
  if (a4 == 4) {
    double x = a3.x;
  }
  else {
    double x = y;
  }
  if (a4 == 4) {
    double v7 = v4;
  }
  else {
    double v7 = a3.y;
  }
  double v8 = 0.0;
  if (v7 == 0.0) {
    double v7 = 0.0;
  }
  if (x != 0.0) {
    double v8 = x;
  }
  result.double y = v8;
  result.double x = v7;
  return result;
}

+ (unint64_t)nextQuadrantIndex:(unint64_t)a3
{
  if (a3 + 1 <= 4) {
    return a3 + 1;
  }
  else {
    return 1;
  }
}

+ (CGPoint)nextPointFromStartPoint:(CGPoint)result endPoint:(CGPoint)a4 radius:(double)a5
{
  if (a4.x > a5 || (a4.x >= 0.0 ? (BOOL v5 = a4.y <= a5) : (BOOL v5 = 0), !v5 || a4.y < 0.0))
  {
    a4.double y = 0.0;
    a4.double x = a5;
  }
  if (result.y >= a5 && result.x < a5)
  {
    if (result.y != a4.y || result.x > a4.x)
    {
      result.double x = a5;
    }
    else if (a4.x <= a5)
    {
      result.double x = a4.x;
    }
    else
    {
      result.double x = a5;
    }
  }
  else if (result.x == a4.x && result.y >= a4.y)
  {
    result.double y = fmax(a4.y, 0.0);
  }
  else
  {
    result.double y = 0.0;
  }
  return result;
}

+ (double)convertAngleForFirstQuadrant:(double)result
{
  for (; result / 90.0 > 1.0; CGPoint result = result + -90.0)
    ;
  return result;
}

+ (unint64_t)quadrantForAngle:(double)a3
{
  if (a3 >= 0.0 && a3 <= 90.0) {
    return 1;
  }
  if (a3 > 90.0 && a3 <= 180.0) {
    return 2;
  }
  if (a3 > 180.0 && a3 <= 270.0) {
    return 3;
  }
  if (a3 > 360.0 || a3 <= 270.0) {
    return 1;
  }
  else {
    return 4;
  }
}

+ (unint64_t)quadrantForPoint:(CGPoint)a3
{
  if (a3.x >= 0.0 && a3.y < 0.0) {
    return 2;
  }
  if (a3.x < 0.0 && a3.y < 0.0) {
    return 3;
  }
  if (a3.y >= 0.0 && a3.x < 0.0) {
    return 4;
  }
  else {
    return 1;
  }
}

@end