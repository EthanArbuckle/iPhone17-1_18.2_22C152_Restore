@interface CAMediaTimingFunction(TSDAdditions)
- (id)bezierPath;
- (uint64_t)solveForTime:()TSDAdditions;
@end

@implementation CAMediaTimingFunction(TSDAdditions)

- (id)bezierPath
{
  v12[1] = *MEMORY[0x263EF8340];
  id v2 = +[TSDBezierPath bezierPath];
  v12[0] = 0;
  [a1 getControlPointAtIndex:0 values:v12];
  double v3 = *(float *)v12;
  double v4 = *((float *)v12 + 1);
  [a1 getControlPointAtIndex:1 values:v12];
  double v5 = *(float *)v12;
  double v6 = *((float *)v12 + 1);
  [a1 getControlPointAtIndex:2 values:v12];
  double v7 = *(float *)v12;
  double v8 = *((float *)v12 + 1);
  [a1 getControlPointAtIndex:3 values:v12];
  double v9 = *(float *)v12;
  double v10 = *((float *)v12 + 1);
  objc_msgSend(v2, "moveToPoint:", v3, v4);
  objc_msgSend(v2, "curveToPoint:controlPoint1:controlPoint2:", v9, v10, v5, v6, v7, v8);
  return v2;
}

- (uint64_t)solveForTime:()TSDAdditions
{
  v1 = (void *)[a1 bezierPath];
  TSUClamp();

  return objc_msgSend(v1, "yValueFromXValue:");
}

@end