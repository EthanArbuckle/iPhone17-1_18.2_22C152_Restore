@interface PIAutoCalculatorUtils
+ (CGPoint)averageCGPoints:(const CGPoint *)a3 pointCount:(unint64_t)a4;
+ (CGPoint)averagePoints:(const CGPoint *)a3 pointCount:(unint64_t)a4;
+ (CGPoint)convertFacePoint:(CGPoint)a3 toImagePointWithFaceRect:(CGRect)a4 orientation:(int64_t)a5;
@end

@implementation PIAutoCalculatorUtils

+ (CGPoint)averageCGPoints:(const CGPoint *)a3 pointCount:(unint64_t)a4
{
  float64x2_t v4 = 0uLL;
  if (a4)
  {
    unint64_t v5 = a4;
    do
    {
      float64x2_t v6 = *(float64x2_t *)a3++;
      float64x2_t v4 = vaddq_f64(v4, v6);
      --v5;
    }
    while (v5);
  }
  float64x2_t v7 = vdivq_f64(v4, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a4), 0));
  double v8 = v7.f64[1];
  result.x = v7.f64[0];
  result.y = v8;
  return result;
}

+ (CGPoint)averagePoints:(const CGPoint *)a3 pointCount:(unint64_t)a4
{
  float64x2_t v4 = 0uLL;
  if (a4)
  {
    unint64_t v5 = a4;
    do
    {
      float64x2_t v6 = *(float64x2_t *)a3++;
      float64x2_t v4 = vaddq_f64(v4, v6);
      --v5;
    }
    while (v5);
  }
  float64x2_t v7 = vdivq_f64(v4, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a4), 0));
  double v8 = v7.f64[1];
  result.x = v7.f64[0];
  result.y = v8;
  return result;
}

+ (CGPoint)convertFacePoint:(CGPoint)a3 toImagePointWithFaceRect:(CGRect)a4 orientation:(int64_t)a5
{
  MEMORY[0x1F4130A00](a5, 1, 1, *MEMORY[0x1E4F7A318], *(void *)(MEMORY[0x1E4F7A318] + 8), a4.origin.x + a3.x * a4.size.width, a4.origin.y + a3.y * a4.size.height);
  result.y = v6;
  result.x = v5;
  return result;
}

@end