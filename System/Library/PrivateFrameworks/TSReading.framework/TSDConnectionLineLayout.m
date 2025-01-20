@interface TSDConnectionLineLayout
- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3];
- (id)quadraticCurve:(CGPoint)a3[3];
@end

@implementation TSDConnectionLineLayout

- (id)quadraticCurve:(CGPoint)a3[3]
{
  double x = a3->x;
  double y = a3->y;
  double v5 = a3[1].x;
  double v6 = a3[1].y;
  double v7 = a3[2].x;
  double v8 = a3[2].y;
  double v34 = a3->x;
  double v9 = TSDMultiplyPointScalar(a3->x, y, 0.25);
  double v10 = TSDSubtractPoints(v5, v6, v9);
  double v12 = v11;
  double v13 = TSDMultiplyPointScalar(v7, v8, 0.25);
  double v14 = TSDSubtractPoints(v10, v12, v13);
  double v16 = TSDMultiplyPointScalar(v14, v15, 2.0);
  double v18 = v17;
  double v19 = TSDMultiplyPointScalar(x, y, 0.333333333);
  double v21 = v20;
  double v22 = TSDMultiplyPointScalar(v16, v18, 0.666666667);
  double v24 = v23;
  double v25 = TSDAddPoints(v19, v21, v22);
  double v27 = v26;
  double v28 = TSDMultiplyPointScalar(v7, v8, 0.333333333);
  double v29 = TSDAddPoints(v22, v24, v28);
  double v31 = v30;
  id v32 = +[TSDBezierPath bezierPath];
  objc_msgSend(v32, "moveToPoint:", v34, y);
  objc_msgSend(v32, "curveToPoint:controlPoint1:controlPoint2:", v7, v8, v25, v27, v29, v31);
  return v32;
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3]
{
  id v8 = [(TSDConnectionLineLayout *)self quadraticCurve:a5];
  self->mStartClipT = 0.0;
  char v20 = 1;
  self->mEndClipT = 1.0;
  if (a3
    && ([(TSDConnectionLineAbstractLayout *)self outsetFrom],
        (id v9 = -[TSDConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:](self, "clipPath:onLayout:outset:reversed:isValid:", v8, a3, 0, &v20)) != 0))
  {
    double v10 = v9;
    uint64_t v11 = [v9 segment];
    [v10 t];
    self->mStartClipT = v12;
    if (!a4) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v11 = -1;
    if (!a4)
    {
LABEL_8:
      uint64_t v15 = -1;
      goto LABEL_9;
    }
  }
  [(TSDConnectionLineAbstractLayout *)self outsetTo];
  id v13 = -[TSDConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:](self, "clipPath:onLayout:outset:reversed:isValid:", v8, a4, 1, &v20);
  if (!v13) {
    goto LABEL_8;
  }
  double v14 = v13;
  uint64_t v15 = [v13 segment];
  [v14 t];
  self->mEndClipT = v16;
LABEL_9:
  self->super.mVisibleLine = 1;
  if ((v11 & 0x8000000000000000) == 0 || (v15 & 0x8000000000000000) == 0)
  {
    BOOL v17 = 0;
    if ((v11 & 0x8000000000000000) == 0 && (v15 & 0x8000000000000000) == 0 && v11 >= v15) {
      BOOL v17 = v11 != v15 || self->mStartClipT >= self->mEndClipT;
    }
    if (a3 && a4)
    {
      if (!v20) {
        BOOL v17 = 1;
      }
      if (v17)
      {
        self->super.mVisibleLine = 0;
        return v8;
      }
    }
    else if ((unint64_t)a3 | (unint64_t)a4 && !v20)
    {
      self->mStartClipT = 0.0;
      self->mEndClipT = 1.0;
      return v8;
    }
    id v18 = +[TSDBezierPath bezierPath];
    [v18 appendBezierPath:v8 fromSegment:v11 t:v15 toSegment:0 t:self->mStartClipT withoutMove:self->mEndClipT];
    return v18;
  }
  return v8;
}

- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  double v10 = a4.y;
  double v11 = a4.x;
  double v12 = a3.y;
  CGFloat v13 = a3.x;
  objc_opt_class();
  if (!self->super.super.mResizePathSource) {
    objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
  }
  uint64_t v15 = (void *)TSUDynamicCast();
  mResizeInfoGeometrdouble y = self->super.super.mResizeInfoGeometry;
  if (mResizeInfoGeometry)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
LABEL_6:
    [(TSDInfoGeometry *)mResizeInfoGeometry transform];
    goto LABEL_7;
  }
  mResizeInfoGeometrdouble y = (TSDInfoGeometry *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  if (mResizeInfoGeometry) {
    goto LABEL_6;
  }
LABEL_7:
  float64x2_t v22 = 0u;
  float64x2_t v23 = 0u;
  float64x2_t v21 = 0u;
  TSDTransformMakeFree(1, (uint64_t)&v21, v9, v8, x, y, v13, v12, v11, v10);
  [v15 getControlKnobPosition:12];
  float64x2_t v19 = vaddq_f64(v23, vmlaq_n_f64(vmulq_n_f64(v22, *((double *)&v26 + 1) + v17 * *((double *)&v25 + 1) + *((double *)&v24 + 1) * v18), v21, *(double *)&v26 + v17 * *(double *)&v25 + *(double *)&v24 * v18));
  double v20 = v19.f64[1];
  result.double x = v19.f64[0];
  result.double y = v20;
  return result;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v4 = [(TSDConnectionLineAbstractLayout *)self connectedPathSource];
  [(TSDConnectionLinePathSource *)v4 getControlKnobPosition:10];
  double v6 = v5;
  double v8 = v7;
  v28.f64[0] = v5;
  v28.f64[1] = v7;
  [(TSDConnectionLinePathSource *)v4 getControlKnobPosition:12];
  double v10 = v9;
  double v12 = v11;
  [(TSDConnectionLinePathSource *)v4 getControlKnobPosition:11];
  double v14 = v13;
  double v16 = v15;
  double v31 = v13;
  double v32 = v15;
  double v17 = TSDMultiplyPointScalar(v6, v8, 0.25);
  double v18 = TSDSubtractPoints(v10, v12, v17);
  double v20 = v19;
  double v21 = TSDMultiplyPointScalar(v14, v16, 0.25);
  double v22 = TSDSubtractPoints(v18, v20, v21);
  double v29 = TSDMultiplyPointScalar(v22, v23, 2.0);
  uint64_t v30 = v24;
  if ([(TSDConnectionLineAbstractLayout *)self isStraightLine])
  {
    double v25 = (self->mStartClipT + self->mEndClipT) * 0.5;
  }
  else if (self->super.mVisibleLine)
  {
    double v25 = fmax(self->mStartClipT, fmin(self->mEndClipT, 0.5));
  }
  else
  {
    double v25 = 0.5;
  }
  double v26 = TSDPointOnQuadraticCurve(&v28, v25);
  result.double y = v27;
  result.double x = v26;
  return result;
}

@end