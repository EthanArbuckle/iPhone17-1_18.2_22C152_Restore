@interface CRLWPPadding
+ (id)padding;
+ (id)paddingWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6;
- (BOOL)isEqual:(id)a3;
- (CRLWPPadding)init;
- (CRLWPPadding)initWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6;
- (UIEdgeInsets)edgeInsets;
- (double)bottomInset;
- (double)leftInset;
- (double)rightInset;
- (double)topInset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)paddingByMirroringHorizontal;
- (unint64_t)hash;
- (void)setBottomInset:(double)a3;
- (void)setLeftInset:(double)a3;
- (void)setRightInset:(double)a3;
- (void)setTopInset:(double)a3;
- (void)transform:(CGAffineTransform *)a3;
@end

@implementation CRLWPPadding

+ (id)padding
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

+ (id)paddingWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6
{
  id v6 = [objc_alloc((Class)a1) initWithTopInset:a3 leftInset:a4 bottomInset:a5 rightInset:a6];

  return v6;
}

- (CRLWPPadding)init
{
  return [(CRLWPPadding *)self initWithTopInset:0.0 leftInset:0.0 bottomInset:0.0 rightInset:0.0];
}

- (CRLWPPadding)initWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6
{
  v24.receiver = self;
  v24.super_class = (Class)CRLWPPadding;
  id v6 = [(CRLWPPadding *)&v24 init];
  if (v6)
  {
    double v7 = a3;
    if (a3 > 50000000.0 || (double v7 = a4, a4 > 50000000.0) || (double v7 = a5, a5 > 50000000.0) || (double v7 = a6, a6 > 50000000.0))
    {
      int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E9170);
      }
      v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101096E54(v8, v9);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E9190);
      }
      v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        v11 = +[CRLAssertionHandler packedBacktraceString];
        sub_10106CDAC(v11, buf, v8, (os_log_t)v10);
      }

      v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPPadding initWithTopInset:leftInset:bottomInset:rightInset:]");
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPPadding.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:53 isFatal:0 description:"Illegal huge padding value"];
    }
    v14.f64[0] = a3;
    v14.f64[1] = a4;
    float64x2_t v15 = vmaxnmq_f64(v14, (float64x2_t)0);
    float64x2_t v16 = (float64x2_t)vdupq_n_s64(0x4187D78400000000uLL);
    *(int8x16_t *)(v6 + 8) = vbslq_s8((int8x16_t)vcgtq_f64(v15, v16), (int8x16_t)v16, (int8x16_t)v15);
    v17.f64[0] = a5;
    v17.f64[1] = a6;
    float64x2_t v18 = vmaxnmq_f64(v17, (float64x2_t)0);
    *(int8x16_t *)(v6 + 24) = vbslq_s8((int8x16_t)vcgtq_f64(v18, v16), (int8x16_t)v16, (int8x16_t)v18);
  }
  return (CRLWPPadding *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  double topInset = self->_topInset;
  double leftInset = self->_leftInset;
  double bottomInset = self->_bottomInset;
  double rightInset = self->_rightInset;

  return [v4 initWithTopInset:topInset leftInset:leftInset bottomInset:bottomInset rightInset:rightInset];
}

- (void)transform:(CGAffineTransform *)a3
{
  double a = a3->a;
  if (a3->a >= a3->d) {
    double a = a3->d;
  }
  *(float64x2_t *)&self->_double topInset = vmulq_n_f64(*(float64x2_t *)&self->_topInset, a);
  *(float64x2_t *)&self->_double bottomInset = vmulq_n_f64(*(float64x2_t *)&self->_bottomInset, a);
}

- (id)paddingByMirroringHorizontal
{
  [(CRLWPPadding *)self topInset];
  double v4 = v3;
  [(CRLWPPadding *)self rightInset];
  double v6 = v5;
  [(CRLWPPadding *)self bottomInset];
  double v8 = v7;
  [(CRLWPPadding *)self leftInset];

  return +[CRLWPPadding paddingWithTopInset:v4 leftInset:v6 bottomInset:v8 rightInset:v9];
}

- (UIEdgeInsets)edgeInsets
{
  [(CRLWPPadding *)self topInset];
  double v4 = v3;
  [(CRLWPPadding *)self leftInset];
  double v6 = v5;
  [(CRLWPPadding *)self bottomInset];
  double v8 = v7;
  [(CRLWPPadding *)self rightInset];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.right = v10;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v5 = (double *)v4;
    double v6 = v5[1];
    double topInset = self->_topInset;
    if ((v6 == topInset || vabdd_f64(v6, topInset) < fabs(topInset * 0.000000999999997))
      && ((double v8 = v5[2], leftInset = self->_leftInset, v8 == leftInset)
       || vabdd_f64(v8, leftInset) < fabs(leftInset * 0.000000999999997))
      && ((v10 = v5[3], double bottomInset = self->_bottomInset, v10 == bottomInset)
       || vabdd_f64(v10, bottomInset) < fabs(bottomInset * 0.000000999999997)))
    {
      double v12 = v5[4];
      double rightInset = self->_rightInset;
      BOOL v14 = v12 == rightInset || vabdd_f64(v12, rightInset) < fabs(rightInset * 0.000000999999997);
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  return 0;
}

- (id)description
{
  double v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(%@*)%p { topInset=%f; leftInset=%f; bottomInset=%f; rightInset=%f }",
    v4,
    self,
    *(void *)&self->_topInset,
    *(void *)&self->_leftInset,
    *(void *)&self->_bottomInset,
  double v5 = *(void *)&self->_rightInset);

  return v5;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  self->_double topInset = a3;
}

- (double)leftInset
{
  return self->_leftInset;
}

- (void)setLeftInset:(double)a3
{
  self->_double leftInset = a3;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (void)setBottomInset:(double)a3
{
  self->_double bottomInset = a3;
}

- (double)rightInset
{
  return self->_rightInset;
}

- (void)setRightInset:(double)a3
{
  self->_double rightInset = a3;
}

@end