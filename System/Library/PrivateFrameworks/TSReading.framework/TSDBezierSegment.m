@interface TSDBezierSegment
+ (id)segmentFromPoint:(CGPoint)a3 outPoint:(CGPoint)a4 inPoint:(CGPoint)a5 toPoint:(CGPoint)a6;
- (BOOL)bogusSegment;
- (CGPoint)closestPointToPoint:(CGPoint)a3;
- (CGPoint)fromPoint;
- (CGPoint)inPoint;
- (CGPoint)outPoint;
- (CGPoint)pointAtParametricValue:(double)a3;
- (CGPoint)toPoint;
- (double)parametricValueForPoint:(CGPoint)a3;
- (id)description;
- (id)initFromPoint:(CGPoint)a3 outPoint:(CGPoint)a4 inPoint:(CGPoint)a5 toPoint:(CGPoint)a6;
- (void)splitAtParametricValue:(double)a3 left:(id *)a4 right:(id *)a5;
@end

@implementation TSDBezierSegment

+ (id)segmentFromPoint:(CGPoint)a3 outPoint:(CGPoint)a4 inPoint:(CGPoint)a5 toPoint:(CGPoint)a6
{
  id v6 = -[TSDBezierSegment initFromPoint:outPoint:inPoint:toPoint:]([TSDBezierSegment alloc], "initFromPoint:outPoint:inPoint:toPoint:", a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y);

  return v6;
}

- (id)description
{
  v3 = NSString;
  v4 = NSStringFromCGPoint(self->mA);
  v5 = NSStringFromCGPoint(self->mOut);
  id v6 = NSStringFromCGPoint(self->mIn);
  return (id)[v3 stringWithFormat:@"%@ - %@ - %@ - %@", v4, v5, v6, NSStringFromCGPoint(self->mB)];
}

- (BOOL)bogusSegment
{
  double x = self->mOut.x;
  double y = self->mOut.y;
  BOOL result = 0;
  if (TSDNearlyEqualPoints(self->mA.x, self->mA.y, x, y))
  {
    double v5 = self->mIn.x;
    double v6 = self->mIn.y;
    if (TSDNearlyEqualPoints(x, y, v5, v6) && TSDNearlyEqualPoints(v5, v6, self->mB.x, self->mB.y)) {
      return 1;
    }
  }
  return result;
}

- (id)initFromPoint:(CGPoint)a3 outPoint:(CGPoint)a4 inPoint:(CGPoint)a5 toPoint:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)TSDBezierSegment;
  id result = [(TSDBezierSegment *)&v15 init];
  if (result)
  {
    *((CGFloat *)result + 1) = v13;
    *((CGFloat *)result + 2) = v12;
    *((CGFloat *)result + 3) = v11;
    *((CGFloat *)result + 4) = v10;
    *((CGFloat *)result + 5) = v9;
    *((CGFloat *)result + 6) = v8;
    *((CGFloat *)result + 7) = x;
    *((CGFloat *)result + 8) = y;
  }
  return result;
}

- (CGPoint)fromPoint
{
  double x = self->mA.x;
  double y = self->mA.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)toPoint
{
  double x = self->mB.x;
  double y = self->mB.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)inPoint
{
  double x = self->mIn.x;
  double y = self->mIn.y;
  double v5 = self->mB.x;
  double v6 = self->mB.y;
  if (TSDNearlyEqualPoints(x, y, v5, v6))
  {
    double x = self->mOut.x;
    double y = self->mOut.y;
    if (TSDNearlyEqualPoints(x, y, v5, v6))
    {
      double x = self->mA.x;
      double y = self->mA.y;
    }
  }
  double v7 = x;
  double v8 = y;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)outPoint
{
  double x = self->mOut.x;
  double y = self->mOut.y;
  double v5 = self->mA.x;
  double v6 = self->mA.y;
  if (TSDNearlyEqualPoints(x, y, v5, v6))
  {
    double x = self->mIn.x;
    double y = self->mIn.y;
    if (TSDNearlyEqualPoints(x, y, v5, v6))
    {
      double x = self->mB.x;
      double y = self->mB.y;
    }
  }
  double v7 = x;
  double v8 = y;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (double)parametricValueForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGPoint mOut = self->mOut;
  CGPoint mA = self->mA;
  CGPoint mB = self->mB;
  CGPoint mIn = self->mIn;
  double v5 = 0.0;
  int v6 = 1001;
  double v7 = 1000000.0;
  double v8 = 0.0;
  do
  {
    double v8 = v8 + 0.001;
    float64x2_t v9 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)mOut, v8 * 3.0 * ((1.0 - v8) * (1.0 - v8))), (float64x2_t)mA, (1.0 - v8) * ((1.0 - v8) * (1.0 - v8))), (float64x2_t)mIn, (1.0 - v8) * (v8 * v8 * 3.0)), (float64x2_t)mB, v8 * (v8 * v8));
    double v10 = TSDDistance(v9.f64[0], v9.f64[1], x, y);
    if (v10 < v7)
    {
      double v7 = v10;
      double v5 = v8;
    }
    --v6;
  }
  while (v6);
  return v5;
}

- (void)splitAtParametricValue:(double)a3 left:(id *)a4 right:(id *)a5
{
  double x = self->mOut.x;
  double y = self->mOut.y;
  double v11 = self->mA.x;
  double v12 = self->mA.y;
  double v50 = v12;
  double v51 = v11;
  double v13 = TSDSubtractPoints(x, y, v11);
  double v15 = TSDMultiplyPointScalar(v13, v14, a3);
  double v52 = TSDAddPoints(v11, v12, v15);
  double v17 = v16;
  double v19 = self->mIn.x;
  double v18 = self->mIn.y;
  double v20 = TSDSubtractPoints(v19, v18, x);
  double v22 = TSDMultiplyPointScalar(v20, v21, a3);
  double v23 = TSDAddPoints(x, y, v22);
  double v25 = v24;
  double v26 = TSDSubtractPoints(self->mB.x, self->mB.y, v19);
  double v28 = TSDMultiplyPointScalar(v26, v27, a3);
  double v49 = TSDAddPoints(v19, v18, v28);
  double v30 = v29;
  double v31 = TSDSubtractPoints(v23, v25, v52);
  double v33 = TSDMultiplyPointScalar(v31, v32, a3);
  double v34 = TSDAddPoints(v52, v17, v33);
  double v36 = v35;
  double v37 = TSDSubtractPoints(v49, v30, v23);
  double v39 = TSDMultiplyPointScalar(v37, v38, a3);
  double v40 = TSDAddPoints(v23, v25, v39);
  double v42 = v41;
  double v43 = TSDSubtractPoints(v40, v41, v34);
  double v45 = TSDMultiplyPointScalar(v43, v44, a3);
  double v46 = TSDAddPoints(v34, v36, v45);
  double v48 = v47;
  *a4 = +[TSDBezierSegment segmentFromPoint:outPoint:inPoint:toPoint:](TSDBezierSegment, "segmentFromPoint:outPoint:inPoint:toPoint:", v51, v50, v52, v17, v34, v36, v46, v47);
  *a5 = +[TSDBezierSegment segmentFromPoint:outPoint:inPoint:toPoint:](TSDBezierSegment, "segmentFromPoint:outPoint:inPoint:toPoint:", v46, v48, v40, v42, v49, v30, self->mB.x, self->mB.y);
}

- (CGPoint)pointAtParametricValue:(double)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CGPoint mOut = self->mOut;
  v7[0] = (float64x2_t)self->mA;
  v7[1] = (float64x2_t)mOut;
  CGPoint mB = self->mB;
  v7[2] = (float64x2_t)self->mIn;
  v7[3] = (float64x2_t)mB;
  double v5 = TSDPointOnCurve(v7, a3);
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)closestPointToPoint:(CGPoint)a3
{
  -[TSDBezierSegment parametricValueForPoint:](self, "parametricValueForPoint:", a3.x, a3.y);

  -[TSDBezierSegment pointAtParametricValue:](self, "pointAtParametricValue:");
  result.double y = v5;
  result.double x = v4;
  return result;
}

@end