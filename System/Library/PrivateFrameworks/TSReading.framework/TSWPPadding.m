@interface TSWPPadding
+ (TSWPPadding)paddingWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6;
+ (id)padding;
- (BOOL)isEqual:(id)a3;
- (TSWPPadding)init;
- (TSWPPadding)initWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6;
- (double)bottomInset;
- (double)leftInset;
- (double)rightInset;
- (double)topInset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBottomInset:(double)a3;
- (void)setLeftInset:(double)a3;
- (void)setRightInset:(double)a3;
- (void)setTopInset:(double)a3;
- (void)transform:(CGAffineTransform *)a3;
@end

@implementation TSWPPadding

- (double)leftInset
{
  return self->_leftInset;
}

- (double)topInset
{
  return self->_topInset;
}

+ (id)padding
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (TSWPPadding)init
{
  return [(TSWPPadding *)self initWithTopInset:0.0 leftInset:0.0 bottomInset:0.0 rightInset:0.0];
}

- (TSWPPadding)initWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6
{
  v20.receiver = self;
  v20.super_class = (Class)TSWPPadding;
  v6 = [(TSWPPadding *)&v20 init];
  if (v6)
  {
    double v8 = a3;
    if (a3 > 50000000.0
      || (v7.f64[0] = a3, double v8 = a4, a4 > 50000000.0)
      || (double v8 = a5, a5 > 50000000.0)
      || (double v8 = a6, a6 > 50000000.0))
    {
      v9 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", 50000000.0, v8, v7.f64[0]);
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPPadding initWithTopInset:leftInset:bottomInset:rightInset:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPPadding.mm"), 68, @"Illegal huge padding value");
      v7.f64[0] = a3;
    }
    v7.f64[1] = a4;
    float64x2_t v11 = vmaxnmq_f64(v7, (float64x2_t)0);
    float64x2_t v12 = (float64x2_t)vdupq_n_s64(0x4187D78400000000uLL);
    *(int8x16_t *)(v6 + 8) = vbslq_s8((int8x16_t)vcgtq_f64(v11, v12), (int8x16_t)v12, (int8x16_t)v11);
    v13.f64[0] = a5;
    v13.f64[1] = a6;
    float64x2_t v14 = vmaxnmq_f64(v13, (float64x2_t)0);
    *(int8x16_t *)(v6 + 24) = vbslq_s8((int8x16_t)vcgtq_f64(v14, v12), (int8x16_t)v12, (int8x16_t)v14);
  }
  return (TSWPPadding *)v6;
}

- (double)rightInset
{
  return self->_rightInset;
}

+ (TSWPPadding)paddingWithTopInset:(double)a3 leftInset:(double)a4 bottomInset:(double)a5 rightInset:(double)a6
{
  v6 = (void *)[objc_alloc((Class)a1) initWithTopInset:a3 leftInset:a4 bottomInset:a5 rightInset:a6];
  return (TSWPPadding *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double topInset = self->_topInset;
  double leftInset = self->_leftInset;
  double bottomInset = self->_bottomInset;
  double rightInset = self->_rightInset;
  return (id)[v4 initWithTopInset:topInset leftInset:leftInset bottomInset:bottomInset rightInset:rightInset];
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

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && *((double *)a3 + 1) == self->_topInset
      && *((double *)a3 + 2) == self->_leftInset
      && *((double *)a3 + 3) == self->_bottomInset
      && *((double *)a3 + 4) == self->_rightInset;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"(%@*)%p { topInset=%f; leftInset=%f; bottomInset=%f; rightInset=%f }",
               NSStringFromClass(v4),
               self,
               *(void *)&self->_topInset,
               *(void *)&self->_leftInset,
               *(void *)&self->_bottomInset,
               *(void *)&self->_rightInset);
}

- (void)setTopInset:(double)a3
{
  self->_double topInset = a3;
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

- (void)setRightInset:(double)a3
{
  self->_double rightInset = a3;
}

@end