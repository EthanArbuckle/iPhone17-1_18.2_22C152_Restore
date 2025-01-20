@interface TSDBezierNode
+ (id)bezierNodeWithPoint:(CGPoint)a3;
+ (id)bezierNodeWithPoint:(CGPoint)a3 inControlPoint:(CGPoint)a4 outControlPoint:(CGPoint)a5;
- (BOOL)isCollapsed;
- (BOOL)isSelected;
- (BOOL)underPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6;
- (CGPoint)inControlPoint;
- (CGPoint)nodePoint;
- (CGPoint)outControlPoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)reflectedStateString;
- (id)typeString;
- (int)reflectedState;
- (int)type;
- (void)balanceControlPoints;
- (void)collapse;
- (void)moveToPoint:(CGPoint)a3;
- (void)setInControlPoint:(CGPoint)a3;
- (void)setInControlPoint:(CGPoint)a3 reflect:(int)a4 constrain:(BOOL)a5;
- (void)setInControlPointFromReflection:(CGPoint)a3 constrain:(BOOL)a4;
- (void)setNode:(CGPoint)a3;
- (void)setNodePoint:(CGPoint)a3;
- (void)setOutControlPoint:(CGPoint)a3;
- (void)setOutControlPoint:(CGPoint)a3 reflect:(int)a4 constrain:(BOOL)a5;
- (void)setReflectedState:(int)a3;
- (void)setSelected:(BOOL)a3;
- (void)setType:(int)a3;
- (void)swapControlPoints;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
- (void)updateReflectedState;
@end

@implementation TSDBezierNode

+ (id)bezierNodeWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = objc_alloc_init(TSDBezierNode);
  -[TSDBezierNode setNodePoint:](v5, "setNodePoint:", x, y);
  -[TSDBezierNode setInControlPoint:](v5, "setInControlPoint:", x, y);
  -[TSDBezierNode setOutControlPoint:](v5, "setOutControlPoint:", x, y);
  [(TSDBezierNode *)v5 setType:1];

  return v5;
}

+ (id)bezierNodeWithPoint:(CGPoint)a3 inControlPoint:(CGPoint)a4 outControlPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  v11 = objc_alloc_init(TSDBezierNode);
  -[TSDBezierNode setNodePoint:](v11, "setNodePoint:", v10, v9);
  -[TSDBezierNode setInControlPoint:](v11, "setInControlPoint:", v8, v7);
  -[TSDBezierNode setOutControlPoint:](v11, "setOutControlPoint:", x, y);
  [(TSDBezierNode *)v11 setType:2];
  double v12 = TSDSubtractPoints(x, y, v10);
  double v14 = v13;
  double v15 = TSDSubtractPoints(v10, v9, v8);
  if (TSDNearlyEqualPoints(v12, v14, v15, v16)) {
    [(TSDBezierNode *)v11 setReflectedState:1];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(TSDBezierNode *)self nodePoint];
  objc_msgSend(v4, "setNodePoint:");
  [(TSDBezierNode *)self inControlPoint];
  objc_msgSend(v4, "setInControlPoint:");
  [(TSDBezierNode *)self outControlPoint];
  objc_msgSend(v4, "setOutControlPoint:");
  objc_msgSend(v4, "setReflectedState:", -[TSDBezierNode reflectedState](self, "reflectedState"));
  objc_msgSend(v4, "setSelected:", -[TSDBezierNode isSelected](self, "isSelected"));
  objc_msgSend(v4, "setType:", -[TSDBezierNode type](self, "type"));
  return v4;
}

- (void)balanceControlPoints
{
  double x = self->mNode.x;
  long double v4 = TSDSubtractPoints(self->mIn.x, self->mIn.y, x);
  long double v6 = v5;
  long double v7 = TSDSubtractPoints(self->mOut.x, self->mOut.y, x);
  long double v9 = v8;
  double v10 = TSDPointLength(v4, v6);
  double v11 = TSDAngleFromDelta(v4, v6);
  double v12 = TSDPointLength(v7, v9);
  double v13 = TSDAngleFromDelta(v7, v9);
  if (v10 > 0.001 || v12 > 0.001)
  {
    if (v10 >= 0.001)
    {
      if (v12 >= 0.001) {
        double v13 = TSDMixAnglesInRadians(v11, v13 + 3.14159265, v12 / (v10 + v12));
      }
      else {
        double v13 = v11;
      }
    }
    double v14 = TSDDeltaFromAngle(v13);
    double v16 = TSDMultiplyPointScalar(v14, v15, v10);
    self->mIn.double x = TSDAddPoints(v16, v17, x);
    self->mIn.double y = v18;
    double v19 = TSDDeltaFromAngle(v13 + 3.14159265);
    double v21 = TSDMultiplyPointScalar(v19, v20, v12);
    self->mOut.double x = TSDAddPoints(v21, v22, x);
    self->mOut.double y = v23;
    self->mReflectedState = 1;
  }
}

- (void)setNode:(CGPoint)a3
{
  self->mNode = a3;
}

- (void)moveToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = self->mNode.x;
  double v7 = TSDSubtractPoints(self->mIn.x, self->mIn.y, v6);
  double v8 = TSDSubtractPoints(self->mOut.x, self->mOut.y, v6);
  self->mNode.double x = x;
  self->mNode.double y = y;
  self->mIn.double x = TSDAddPoints(x, y, v7);
  self->mIn.double y = v9;
  self->mOut.double x = TSDAddPoints(x, y, v8);
  self->mOut.double y = v10;
}

- (void)setInControlPoint:(CGPoint)a3 reflect:(int)a4 constrain:(BOOL)a5
{
  BOOL v5 = a5;
  double x = self->mNode.x;
  double y = self->mNode.y;
  long double v10 = TSDSubtractPoints(x, y, a3.x);
  double v12 = v10;
  double v13 = v11;
  if (v5)
  {
    double v12 = TSDShiftConstrainDelta(v10, v11);
    double v13 = v14;
  }
  double v15 = *MEMORY[0x263F00148];
  double v16 = *(double *)(MEMORY[0x263F00148] + 8);
  if (!TSDNearlyEqualPoints(v12, v13, *MEMORY[0x263F00148], v16))
  {
    self->mIn.double x = TSDSubtractPoints(x, y, v12);
    self->mIn.double y = v17;
    if (a4)
    {
      if (a4 == 1)
      {
        double v18 = TSDDistance(x, y, self->mOut.x, self->mOut.y);
        double v19 = TSDDistance(v15, v16, v12, v13);
        double v12 = TSDMultiplyPointScalar(v12, v13, v18 / v19);
      }
      self->mOut.double x = TSDAddPoints(x, y, v12);
      self->mOut.double y = v20;
    }
  }
  self->mReflectedState = a4;
}

- (void)setOutControlPoint:(CGPoint)a3 reflect:(int)a4 constrain:(BOOL)a5
{
  BOOL v5 = a5;
  double x = self->mNode.x;
  double y = self->mNode.y;
  long double v10 = TSDSubtractPoints(x, y, a3.x);
  double v12 = v10;
  double v13 = v11;
  if (v5)
  {
    double v12 = TSDShiftConstrainDelta(v10, v11);
    double v13 = v14;
  }
  double v15 = *MEMORY[0x263F00148];
  double v16 = *(double *)(MEMORY[0x263F00148] + 8);
  if (!TSDNearlyEqualPoints(v12, v13, *MEMORY[0x263F00148], v16))
  {
    self->mOut.double x = TSDSubtractPoints(x, y, v12);
    self->mOut.double y = v17;
    if (a4)
    {
      if (a4 == 1)
      {
        double v18 = TSDDistance(x, y, self->mIn.x, self->mIn.y);
        double v19 = TSDDistance(v15, v16, v12, v13);
        double v12 = TSDMultiplyPointScalar(v12, v13, v18 / v19);
      }
      self->mIn.double x = TSDAddPoints(x, y, v12);
      self->mIn.double y = v20;
    }
  }
  self->mReflectedState = a4;
}

- (void)setInControlPointFromReflection:(CGPoint)a3 constrain:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v8 = self->mNode.x;
  double v9 = self->mNode.y;
  long double v10 = TSDSubtractPoints(v8, v9, a3.x);
  double v12 = v10;
  if (v4) {
    double v12 = TSDShiftConstrainDelta(v10, v11);
  }
  double v13 = TSDAddPoints(v8, v9, v12);
  self->mIn.double x = v13;
  self->mIn.double y = v14;
  if (self->mReflectedState)
  {
    double v15 = v13;
    double v16 = v14;
    double v17 = TSDDistance(self->mOut.x, self->mOut.y, v8, v9);
    double v18 = TSDDistance(v15, v16, v8, v9);
    if (v18 != 0.0)
    {
      double v19 = v18;
      long double v20 = TSDSubtractPoints(x, y, v8);
      if (v4) {
        long double v20 = TSDShiftConstrainDelta(v20, v21);
      }
      double v22 = TSDMultiplyPointScalar(v20, v21, 1.0 / v19);
      double v24 = TSDMultiplyPointScalar(v22, v23, v17);
      self->mOut.double x = TSDAddPoints(v8, v9, v24);
      self->mOut.double y = v25;
    }
  }
}

- (void)collapse
{
  CGPoint mNode = self->mNode;
  self->mIn = mNode;
  self->mOut = mNode;
}

- (BOOL)isCollapsed
{
  double x = self->mNode.x;
  double y = self->mNode.y;
  BOOL v5 = TSDNearlyEqualPoints(self->mIn.x, self->mIn.y, x, y);
  if (v5)
  {
    double v6 = self->mOut.x;
    double v7 = self->mOut.y;
    LOBYTE(v5) = TSDNearlyEqualPoints(v6, v7, x, y);
  }
  return v5;
}

- (void)updateReflectedState
{
  double x = self->mNode.x;
  double y = self->mNode.y;
  double v5 = TSDSubtractPoints(self->mOut.x, self->mOut.y, x);
  double v7 = v6;
  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  double v10 = TSDDistance(v5, v6, *MEMORY[0x263F00148], v9);
  double v11 = TSDMultiplyPointScalar(v5, v7, 1.0 / v10);
  double v13 = v12;
  double v14 = TSDSubtractPoints(x, y, self->mIn.x);
  double v16 = v15;
  double v17 = TSDDistance(v14, v15, v8, v9);
  double v18 = TSDMultiplyPointScalar(v14, v16, 1.0 / v17);
  BOOL v20 = TSDNearlyEqualPoints(v11, v13, v18, v19);
  if (vabdd_f64(v10, v17) >= 0.01) {
    unsigned int v21 = 1;
  }
  else {
    unsigned int v21 = 2;
  }
  if (v20) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = 0;
  }

  [(TSDBezierNode *)self setReflectedState:v22];
}

- (void)swapControlPoints
{
  CGPoint mIn = self->mIn;
  self->CGPoint mIn = self->mOut;
  self->mOut = mIn;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  self->CGPoint mNode = (CGPoint)vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, self->mNode.y), *(float64x2_t *)&a3->a, self->mNode.x));
  self->CGPoint mIn = (CGPoint)vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, self->mIn.y), *(float64x2_t *)&a3->a, self->mIn.x));
  self->mOut = (CGPoint)vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, self->mOut.y), *(float64x2_t *)&a3->a, self->mOut.x));
}

- (BOOL)underPoint:(CGPoint)a3 withTransform:(CGAffineTransform *)a4 andTolerance:(double)a5 returningType:(int64_t *)a6
{
  double y = a3.y;
  double x = a3.x;
  float64x2_t v12 = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, self->mNode.y), *(float64x2_t *)&a4->a, self->mNode.x));
  if (TSDDistance(a3.x, a3.y, v12.f64[0], v12.f64[1]) < a5)
  {
    int64_t v13 = 0;
    if (!a6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v14 = [(TSDBezierNode *)self isSelected];
  if (v14)
  {
    double a = a4->a;
    double c = a4->c;
    double d = a4->d;
    tdouble x = a4->tx;
    tdouble y = a4->ty;
    double b = a4->b;
    if (TSDDistance(x, y, tx + self->mIn.y * c + a4->a * self->mIn.x, ty + self->mIn.y * d + b * self->mIn.x) < a5)
    {
      int64_t v13 = 1;
      if (!a6)
      {
LABEL_8:
        LOBYTE(v14) = 1;
        return v14;
      }
LABEL_7:
      *a6 = v13;
      goto LABEL_8;
    }
    if (TSDDistance(x, y, tx + c * self->mOut.y + a * self->mOut.x, ty + d * self->mOut.y + b * self->mOut.x) < a5)
    {
      int64_t v13 = 2;
      if (!a6) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (id)reflectedStateString
{
  uint64_t mReflectedState = self->mReflectedState;
  if (mReflectedState > 2) {
    return &stru_26D688A48;
  }
  else {
    return off_2646B26E0[mReflectedState];
  }
}

- (id)typeString
{
  uint64_t mType = self->mType;
  if (mType > 4) {
    return &stru_26D688A48;
  }
  else {
    return off_2646B26F8[mType];
  }
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = NSStringFromCGPoint(self->mNode);
  double v7 = NSStringFromCGPoint(self->mIn);
  double v8 = NSStringFromCGPoint(self->mOut);
  id v9 = [(TSDBezierNode *)self reflectedStateString];
  if (self->mSelected) {
    double v10 = @" selected";
  }
  else {
    double v10 = &stru_26D688A48;
  }
  return (id)[v3 stringWithFormat:@"<%@ %p node=%@ in=%@ out=%@ reflected=%@%@ %@>", v5, self, v6, v7, v8, v9, v10, -[TSDBezierNode typeString](self, "typeString")];
}

- (CGPoint)nodePoint
{
  double x = self->mNode.x;
  double y = self->mNode.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setNodePoint:(CGPoint)a3
{
  self->CGPoint mNode = a3;
}

- (CGPoint)inControlPoint
{
  double x = self->mIn.x;
  double y = self->mIn.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInControlPoint:(CGPoint)a3
{
  self->CGPoint mIn = a3;
}

- (CGPoint)outControlPoint
{
  double x = self->mOut.x;
  double y = self->mOut.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOutControlPoint:(CGPoint)a3
{
  self->mOut = a3;
}

- (int)reflectedState
{
  return self->mReflectedState;
}

- (void)setReflectedState:(int)a3
{
  self->uint64_t mReflectedState = a3;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->uint64_t mType = a3;
}

- (BOOL)isSelected
{
  return self->mSelected;
}

- (void)setSelected:(BOOL)a3
{
  self->mSelectedouble d = a3;
}

@end