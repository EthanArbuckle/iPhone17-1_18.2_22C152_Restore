@interface CRLBezierNode
+ (CRLBezierNode)bezierNodeWithPoint:(CGPoint)a3;
+ (CRLBezierNode)bezierNodeWithPoint:(CGPoint)a3 inControlPoint:(CGPoint)a4 outControlPoint:(CGPoint)a5;
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
- (int64_t)type;
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
- (void)setType:(int64_t)a3;
- (void)swapControlPoints;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
- (void)updateReflectedState;
@end

@implementation CRLBezierNode

+ (CRLBezierNode)bezierNodeWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = objc_alloc_init(CRLBezierNode);
  -[CRLBezierNode setNodePoint:](v5, "setNodePoint:", x, y);
  -[CRLBezierNode setInControlPoint:](v5, "setInControlPoint:", x, y);
  -[CRLBezierNode setOutControlPoint:](v5, "setOutControlPoint:", x, y);
  [(CRLBezierNode *)v5 setType:1];

  return v5;
}

+ (CRLBezierNode)bezierNodeWithPoint:(CGPoint)a3 inControlPoint:(CGPoint)a4 outControlPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  v11 = objc_alloc_init(CRLBezierNode);
  -[CRLBezierNode setNodePoint:](v11, "setNodePoint:", v10, v9);
  -[CRLBezierNode setInControlPoint:](v11, "setInControlPoint:", v8, v7);
  -[CRLBezierNode setOutControlPoint:](v11, "setOutControlPoint:", x, y);
  [(CRLBezierNode *)v11 setType:2];
  double v12 = sub_100064680(x, y, v10);
  double v14 = v13;
  double v15 = sub_100064680(v10, v9, v8);
  if (sub_100064084(v12, v14, v15, v16)) {
    [(CRLBezierNode *)v11 setReflectedState:1];
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  [(CRLBezierNode *)self nodePoint];
  [v4 setNodePoint:];
  [(CRLBezierNode *)self inControlPoint];
  [v4 setInControlPoint:];
  [(CRLBezierNode *)self outControlPoint];
  [v4 setOutControlPoint:];
  [v4 setReflectedState:[self reflectedState]];
  [v4 setSelected:[self isSelected]];
  [v4 setType:[self type]];
  return v4;
}

- (void)balanceControlPoints
{
  double x = self->mNode.x;
  long double v4 = sub_100064680(self->mIn.x, self->mIn.y, x);
  long double v6 = v5;
  long double v7 = sub_100064680(self->mOut.x, self->mOut.y, x);
  long double v9 = v8;
  double v10 = sub_100065398(v4, v6);
  double v11 = sub_100065C1C(v4, v6);
  double v12 = sub_100065398(v7, v9);
  double v13 = sub_100065C1C(v7, v9);
  if (v10 > 0.001 || v12 > 0.001)
  {
    if (v10 >= 0.001)
    {
      if (v12 >= 0.001) {
        double v13 = sub_100065DCC(v11, v13 + 3.14159265, v12 / (v10 + v12));
      }
      else {
        double v13 = v11;
      }
    }
    double v14 = sub_1000662E0(v13);
    double v16 = sub_1000646A4(v14, v15, v10);
    self->mIn.double x = sub_100064698(v16, v17, x);
    self->mIn.double y = v18;
    double v19 = sub_1000662E0(v13 + 3.14159265);
    double v21 = sub_1000646A4(v19, v20, v12);
    self->mOut.double x = sub_100064698(v21, v22, x);
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
  double v7 = sub_100064680(self->mIn.x, self->mIn.y, v6);
  double v8 = sub_100064680(self->mOut.x, self->mOut.y, v6);
  self->mNode.double x = x;
  self->mNode.double y = y;
  self->mIn.double x = sub_100064698(x, y, v7);
  self->mIn.double y = v9;
  self->mOut.double x = sub_100064698(x, y, v8);
  self->mOut.double y = v10;
}

- (void)setInControlPoint:(CGPoint)a3 reflect:(int)a4 constrain:(BOOL)a5
{
  BOOL v5 = a5;
  double x = self->mNode.x;
  double y = self->mNode.y;
  long double v10 = sub_100064680(x, y, a3.x);
  double v12 = v10;
  double v13 = v11;
  if (v5)
  {
    double v12 = sub_10006631C(v10, v11);
    double v13 = v14;
  }
  double v15 = CGPointZero.y;
  if (!sub_100064084(v12, v13, CGPointZero.x, v15))
  {
    self->mIn.double x = sub_100064680(x, y, v12);
    self->mIn.double y = v16;
    if (a4)
    {
      if (a4 == 1)
      {
        double v17 = sub_1000653B4(x, y, self->mOut.x, self->mOut.y);
        double v18 = sub_1000653B4(CGPointZero.x, v15, v12, v13);
        double v12 = sub_1000646A4(v12, v13, v17 / v18);
      }
      self->mOut.double x = sub_100064698(x, y, v12);
      self->mOut.double y = v19;
    }
  }
  self->mReflectedState = a4;
}

- (void)setOutControlPoint:(CGPoint)a3 reflect:(int)a4 constrain:(BOOL)a5
{
  BOOL v5 = a5;
  double x = self->mNode.x;
  double y = self->mNode.y;
  long double v10 = sub_100064680(x, y, a3.x);
  double v12 = v10;
  double v13 = v11;
  if (v5)
  {
    double v12 = sub_10006631C(v10, v11);
    double v13 = v14;
  }
  double v15 = CGPointZero.y;
  if (!sub_100064084(v12, v13, CGPointZero.x, v15))
  {
    self->mOut.double x = sub_100064680(x, y, v12);
    self->mOut.double y = v16;
    if (a4)
    {
      if (a4 == 1)
      {
        double v17 = sub_1000653B4(x, y, self->mIn.x, self->mIn.y);
        double v18 = sub_1000653B4(CGPointZero.x, v15, v12, v13);
        double v12 = sub_1000646A4(v12, v13, v17 / v18);
      }
      self->mIn.double x = sub_100064698(x, y, v12);
      self->mIn.double y = v19;
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
  long double v10 = sub_100064680(v8, v9, a3.x);
  double v12 = v10;
  if (v4) {
    double v12 = sub_10006631C(v10, v11);
  }
  double v13 = sub_100064698(v8, v9, v12);
  self->mIn.double x = v13;
  self->mIn.double y = v14;
  if (self->mReflectedState)
  {
    double v15 = v13;
    double v16 = v14;
    double v17 = sub_1000653B4(self->mOut.x, self->mOut.y, v8, v9);
    double v18 = sub_1000653B4(v15, v16, v8, v9);
    if (v18 != 0.0)
    {
      double v19 = v18;
      long double v20 = sub_100064680(x, y, v8);
      if (v4) {
        long double v20 = sub_10006631C(v20, v21);
      }
      double v22 = sub_1000646A4(v20, v21, 1.0 / v19);
      double v24 = sub_1000646A4(v22, v23, v17);
      self->mOut.double x = sub_100064698(v8, v9, v24);
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
  BOOL v5 = sub_100064084(self->mIn.x, self->mIn.y, x, y);
  if (v5)
  {
    double v6 = self->mOut.x;
    double v7 = self->mOut.y;
    LOBYTE(v5) = sub_100064084(v6, v7, x, y);
  }
  return v5;
}

- (void)updateReflectedState
{
  double x = self->mNode.x;
  double y = self->mNode.y;
  double v5 = sub_100064680(self->mOut.x, self->mOut.y, x);
  double v7 = v6;
  double v8 = CGPointZero.y;
  double v9 = sub_1000653B4(v5, v6, CGPointZero.x, v8);
  double v10 = sub_1000646A4(v5, v7, 1.0 / v9);
  double v12 = v11;
  double v13 = sub_100064680(x, y, self->mIn.x);
  double v15 = v14;
  double v16 = sub_1000653B4(v13, v14, CGPointZero.x, v8);
  double v17 = sub_1000646A4(v13, v15, 1.0 / v16);
  BOOL v19 = sub_100064084(v10, v12, v17, v18);
  if (vabdd_f64(v9, v16) >= 0.01) {
    unsigned int v20 = 1;
  }
  else {
    unsigned int v20 = 2;
  }
  if (v19) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }

  [(CRLBezierNode *)self setReflectedState:v21];
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
  if (sub_1000653B4(a3.x, a3.y, v12.f64[0], v12.f64[1]) < a5)
  {
    int64_t v13 = 0;
    if (!a6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  BOOL v14 = [(CRLBezierNode *)self isSelected];
  if (v14)
  {
    double a = a4->a;
    double c = a4->c;
    double d = a4->d;
    tdouble x = a4->tx;
    tdouble y = a4->ty;
    double b = a4->b;
    if (sub_1000653B4(x, y, tx + self->mIn.y * c + a4->a * self->mIn.x, ty + self->mIn.y * d + b * self->mIn.x) < a5)
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
    if (sub_1000653B4(x, y, tx + c * self->mOut.y + a * self->mOut.x, ty + d * self->mOut.y + b * self->mOut.x) < a5)
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
    return &stru_101538650;
  }
  else {
    return *(&off_1014DC2B0 + mReflectedState);
  }
}

- (id)typeString
{
  unint64_t mType = self->mType;
  if (mType > 4) {
    return &stru_101538650;
  }
  else {
    return *(&off_1014DC2C8 + mType);
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  double v5 = NSStringFromCGPoint(self->mNode);
  double v6 = NSStringFromCGPoint(self->mIn);
  double v7 = NSStringFromCGPoint(self->mOut);
  double v8 = [(CRLBezierNode *)self reflectedStateString];
  if (self->mSelected) {
    CFStringRef v9 = @" selected";
  }
  else {
    CFStringRef v9 = &stru_101538650;
  }
  double v10 = [(CRLBezierNode *)self typeString];
  double v11 = +[NSString stringWithFormat:@"<%@ %p node=%@ in=%@ out=%@ reflected=%@%@ %@>", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
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

- (int64_t)type
{
  return self->mType;
}

- (void)setType:(int64_t)a3
{
  self->unint64_t mType = a3;
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