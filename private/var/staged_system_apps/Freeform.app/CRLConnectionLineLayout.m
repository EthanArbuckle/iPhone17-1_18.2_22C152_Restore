@interface CRLConnectionLineLayout
- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3] clipPath:(BOOL)a6;
- (id)quadraticCurve:(CGPoint)a3[3];
- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4;
@end

@implementation CRLConnectionLineLayout

- (id)quadraticCurve:(CGPoint)a3[3]
{
  double x = a3->x;
  double y = a3->y;
  double v5 = a3[1].x;
  double v6 = a3[1].y;
  double v8 = a3[2].x;
  double v7 = a3[2].y;
  v9 = +[CRLBezierPath bezierPath];
  if (sub_100064374(x, y, v5, v6, v8, v7)
    && (v38.origin.x = sub_100064044(x, y, v8), v37.x = v5, v37.double y = v6, CGRectContainsPoint(v38, v37)))
  {
    [v9 moveToPoint:x, y];
    [v9 lineToPoint:v8, v7];
  }
  else
  {
    double v10 = sub_1000646A4(x, y, 0.25);
    double v11 = sub_100064680(v5, v6, v10);
    double v13 = v12;
    double v14 = sub_1000646A4(v8, v7, 0.25);
    double v15 = sub_100064680(v11, v13, v14);
    double v17 = sub_1000646A4(v15, v16, 2.0);
    double v19 = v18;
    double v20 = sub_1000646A4(x, y, 0.333333333);
    double v35 = y;
    double v21 = v7;
    double v23 = v22;
    double v24 = sub_1000646A4(v17, v19, 0.666666667);
    double v26 = v25;
    double v27 = sub_100064698(v20, v23, v24);
    double v29 = v28;
    double v30 = sub_1000646A4(v8, v21, 0.333333333);
    double v31 = sub_100064698(v24, v26, v30);
    double v33 = v32;
    [v9 moveToPoint:x, v35];
    [v9 curveToPoint:v8 controlPoint1:v21 controlPoint2:v27, v29, v31, v33];
  }

  return v9;
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3] clipPath:(BOOL)a6
{
  BOOL v6 = a6;
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  double v12 = [(CRLConnectionLineLayout *)self quadraticCurve:a5];
  char v29 = 1;
  [(CRLConnectionLineAbstractLayout *)self setTailClipT:0.0];
  [(CRLConnectionLineAbstractLayout *)self setHeadClipT:1.0];
  if (v10)
  {
    [(CRLConnectionLineAbstractLayout *)self outsetFrom];
    double v13 = -[CRLConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:](self, "clipPath:onLayout:outset:reversed:isValid:", v12, v10, 0, &v29);
    double v14 = v13;
    if (v13)
    {
      uint64_t v15 = (uint64_t)[v13 segment];
      [v14 t];
      -[CRLConnectionLineAbstractLayout setTailClipT:](self, "setTailClipT:");
    }
    else
    {
      uint64_t v15 = -1;
    }

    if (v11) {
      goto LABEL_8;
    }
LABEL_5:
    uint64_t v16 = -1;
    goto LABEL_12;
  }
  uint64_t v15 = -1;
  if (!v11) {
    goto LABEL_5;
  }
LABEL_8:
  [(CRLConnectionLineAbstractLayout *)self outsetTo];
  double v17 = -[CRLConnectionLineAbstractLayout clipPath:onLayout:outset:reversed:isValid:](self, "clipPath:onLayout:outset:reversed:isValid:", v12, v11, 1, &v29);
  double v18 = v17;
  if (v17)
  {
    uint64_t v16 = (uint64_t)[v17 segment];
    [v18 t];
    -[CRLConnectionLineAbstractLayout setHeadClipT:](self, "setHeadClipT:");
  }
  else
  {
    uint64_t v16 = -1;
  }

LABEL_12:
  [(CRLConnectionLineAbstractLayout *)self i_setVisibleLine:1];
  if (v15 < 0 && v16 < 0)
  {
    id v19 = v12;
    goto LABEL_38;
  }
  BOOL v20 = 0;
  if ((v15 & 0x8000000000000000) == 0 && (v16 & 0x8000000000000000) == 0 && v15 >= v16)
  {
    if (v15 == v16)
    {
      [(CRLConnectionLineAbstractLayout *)self tailClipT];
      double v22 = v21;
      [(CRLConnectionLineAbstractLayout *)self headClipT];
      BOOL v20 = v22 >= v23;
    }
    else
    {
      BOOL v20 = 1;
    }
  }
  if (v10 && v11)
  {
    if (!v29) {
      BOOL v20 = 1;
    }
    if (v20)
    {
      id v19 = v12;
      [(CRLConnectionLineAbstractLayout *)self i_setVisibleLine:0];
      goto LABEL_38;
    }
  }
  else if (v10 | v11 && !v29)
  {
    id v19 = v12;
    [(CRLConnectionLineAbstractLayout *)self setTailClipT:0.0];
    [(CRLConnectionLineAbstractLayout *)self setHeadClipT:1.0];
    goto LABEL_38;
  }
  if (![(CRLConnectionLineAbstractLayout *)self clipTail]) {
    [(CRLConnectionLineAbstractLayout *)self setTailClipT:0.0];
  }
  if (![(CRLConnectionLineAbstractLayout *)self clipHead]) {
    [(CRLConnectionLineAbstractLayout *)self setHeadClipT:1.0];
  }
  if (v6)
  {
    [(CRLConnectionLineAbstractLayout *)self tailClipT];
    double v25 = v24;
    [(CRLConnectionLineAbstractLayout *)self headClipT];
    double v27 = v26;
  }
  else
  {
    double v27 = 1.0;
    double v25 = 0.0;
  }
  id v19 = +[CRLBezierPath bezierPath];
  [v19 appendBezierPath:v12 fromSegment:v15 t:v16 toSegment:0 t:v25 withoutMove:v27];
LABEL_38:

  return v19;
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
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = v15;
  double v17 = *(CRLEditableBezierPathSource **)((char *)&self->super.super.mCachedEditableBezierPathSource + 3);
  if (v17)
  {
    double v18 = sub_1002469D0(v15, v17);
  }
  else
  {
    id v19 = [(CRLShapeLayout *)self shapeInfo];
    BOOL v20 = [v19 pathSource];
    double v18 = sub_1002469D0(v16, v20);
  }
  double v21 = *(CRLPathSource **)((char *)&self->super.super.mCachedPathSource + 3);
  if (v21)
  {
    id v22 = v21;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
LABEL_7:
    [v22 transform];

    goto LABEL_8;
  }
  double v23 = [(CRLCanvasLayout *)self info];
  id v22 = [v23 geometry];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  if (v22) {
    goto LABEL_7;
  }
LABEL_8:
  float64x2_t v30 = 0u;
  float64x2_t v31 = 0u;
  float64x2_t v29 = 0u;
  sub_10007FD8C(1, (uint64_t)&v29, v9, v8, x, y, v13, v12, v11, v10);
  [v18 getControlKnobPosition:12];
  float64x2_t v28 = vaddq_f64(v31, vmlaq_n_f64(vmulq_n_f64(v30, *((double *)&v34 + 1) + v24 * *((double *)&v33 + 1) + *((double *)&v32 + 1) * v25), v29, *(double *)&v34 + v24 * *(double *)&v33 + *(double *)&v32 * v25));

  double v27 = v28.f64[1];
  double v26 = v28.f64[0];
  result.double y = v27;
  result.double x = v26;
  return result;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  v4 = [(CRLConnectionLineAbstractLayout *)self connectedPathSource];
  [v4 getControlKnobPosition:10];
  double v6 = v5;
  double v8 = v7;
  v38.f64[0] = v5;
  v38.f64[1] = v7;
  [v4 getControlKnobPosition:12];
  double v10 = v9;
  double v12 = v11;
  [v4 getControlKnobPosition:11];
  double v14 = v13;
  double v16 = v15;
  double v41 = v13;
  double v42 = v15;
  double v17 = sub_1000646A4(v6, v8, 0.25);
  double v18 = sub_100064680(v10, v12, v17);
  double v20 = v19;
  double v21 = sub_1000646A4(v14, v16, 0.25);
  double v22 = sub_100064680(v18, v20, v21);
  double v39 = sub_1000646A4(v22, v23, 2.0);
  uint64_t v40 = v24;
  if ([(CRLConnectionLineAbstractLayout *)self hasControlKnobsInStraightLine])
  {
    [(CRLConnectionLineAbstractLayout *)self tailClipT];
    double v26 = v25;
    [(CRLConnectionLineAbstractLayout *)self headClipT];
    double v28 = (v26 + v27) * 0.5;
  }
  else
  {
    unsigned int v29 = [(CRLConnectionLineAbstractLayout *)self i_visibleLine];
    double v28 = 0.5;
    if (v29)
    {
      [(CRLConnectionLineAbstractLayout *)self tailClipT];
      double v31 = v30;
      [(CRLConnectionLineAbstractLayout *)self headClipT];
      double v28 = fmax(v31, fmin(v32, 0.5));
    }
  }
  double v33 = sub_100347D08(&v38, v28);
  double v35 = v34;

  double v36 = v33;
  double v37 = v35;
  result.double y = v37;
  result.double x = v36;
  return result;
}

- (void)dynamicallyMovedSmartShapeKnobTo:(CGPoint)a3 withTracker:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v5 = a4;
  double v6 = [v5 knob];
  id v7 = [v6 tag];

  if (v7 == (id)12)
  {
    double v8 = [(CRLCanvasLayout *)self originalGeometry];
    double v9 = v8;
    if (v8)
    {
      [v8 transform];
      float64x2_t v10 = v51;
      float64x2_t v11 = v52;
      float64x2_t v35 = v53;
    }
    else
    {
      float64x2_t v11 = 0uLL;
      float64x2_t v52 = 0u;
      float64x2_t v53 = 0u;
      float64x2_t v10 = 0uLL;
      float64x2_t v35 = 0u;
      float64x2_t v51 = 0u;
    }
    float64x2_t v39 = vmlaq_n_f64(vmulq_n_f64(v11, y), v10, x);

    CGPoint v49 = CGPointZero;
    float64x2_t v50 = (float64x2_t)v49;
    double v12 = [(CRLConnectionLineAbstractLayout *)self i_originalPathSource];
    double v13 = [v12 bezierPath];
    [v13 getStartPoint:&v50 andEndPoint:&v49];

    double v14 = [(CRLCanvasLayout *)self originalPureGeometry];
    double v15 = v14;
    if (v14)
    {
      [v14 transform:*(_OWORD *)&v35];
      float64x2_t v16 = v46;
      float64x2_t v17 = v47;
      float64x2_t v18 = v48;
    }
    else
    {
      float64x2_t v18 = 0uLL;
      float64x2_t v47 = 0u;
      float64x2_t v48 = 0u;
      float64x2_t v46 = 0u;
      float64x2_t v16 = 0uLL;
      float64x2_t v17 = 0uLL;
    }
    float64x2_t v37 = vaddq_f64(v35, v39);
    float64x2_t v50 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, v50.f64[1]), v16, v50.f64[0]));

    double v19 = [(CRLCanvasLayout *)self originalPureGeometry];
    double v20 = v19;
    if (v19)
    {
      [v19 transform];
      float64x2_t v21 = v43;
      float64x2_t v22 = v44;
      float64x2_t v23 = v45;
    }
    else
    {
      float64x2_t v23 = 0uLL;
      float64x2_t v44 = 0u;
      float64x2_t v45 = 0u;
      float64x2_t v43 = 0u;
      float64x2_t v21 = 0uLL;
      float64x2_t v22 = 0uLL;
    }
    CGPoint v49 = (CGPoint)vaddq_f64(v23, vmlaq_n_f64(vmulq_n_f64(v22, v49.y), v21, v49.x));

    float64x2_t v54 = v50;
    CGPoint v55 = v49;
    double v24 = v37.f64[1];
    double v25 = sub_100347F0C(v54.f64, v37.f64[0], v37.f64[1]);
    double v26 = sub_100065E00(v54.f64[0], v54.f64[1], v55.x, v55.y, v25);
    double v28 = sub_1000653B4(v26, v27, v37.f64[0], v37.f64[1]);
    unsigned int v29 = [v5 icc];
    [v29 viewScale];
    double v31 = (double)7 / v30;

    if (v28 < v31)
    {
      v37.f64[0] = sub_100065E00(v54.f64[0], v54.f64[1], v55.x, v55.y, 0.5);
      double v24 = v32;
    }
    double v33 = [(CRLCanvasLayout *)self originalGeometry];
    double v34 = v33;
    if (v33) {
      [v33 transform];
    }
    else {
      memset(&v41, 0, sizeof(v41));
    }
    CGAffineTransformInvert(&v42, &v41);
    double x = v42.tx + v24 * v42.c + v42.a * v37.f64[0];
    double y = v42.ty + v24 * v42.d + v42.b * v37.f64[0];
  }
  v40.receiver = self;
  v40.super_class = (Class)CRLConnectionLineLayout;
  -[CRLConnectionLineAbstractLayout dynamicallyMovedSmartShapeKnobTo:withTracker:](&v40, "dynamicallyMovedSmartShapeKnobTo:withTracker:", v5, x, y);
}

@end