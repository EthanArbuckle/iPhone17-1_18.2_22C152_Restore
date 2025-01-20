@interface FxTransform
+ (id)identity;
+ (id)transformWithCGAffineTransform:(CGAffineTransform *)a3;
+ (id)transformWithScale:(CGPoint)a3 rotate:(float)a4 translate:(CGPoint)a5 shear:(CGPoint)a6;
- (CGAffineTransform)cgAffineTransform;
- (CGPoint)scale;
- (CGPoint)shear;
- (CGPoint)translation;
- (FxTransform)initWithCGAffineTransform:(CGAffineTransform *)a3;
- (FxTransform)initWithScale:(CGPoint)a3 rotate:(float)a4 translate:(CGPoint)a5 shear:(CGPoint)a6;
- (float)rotation;
- (void)dealloc;
- (void)setCGAffineTransform:(CGAffineTransform *)a3;
- (void)setRotation:(float)a3;
- (void)setScale:(CGPoint)a3;
- (void)setShear:(CGPoint)a3;
- (void)setTranslation:(CGPoint)a3;
@end

@implementation FxTransform

- (void)dealloc
{
  FxDebugAssert(self->_priv != 0, &cfstr_PrivNull.isa, v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_priv);
  v9.receiver = self;
  v9.super_class = (Class)FxTransform;
  [(FxTransform *)&v9 dealloc];
}

- (FxTransform)initWithCGAffineTransform:(CGAffineTransform *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FxTransform;
  uint64_t v4 = [(FxTransform *)&v9 init];
  if (v4)
  {
    uint64_t v5 = (FxTransformPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x100004095CF6A33uLL);
    v4->_priv = v5;
    if (v5)
    {
      long long v6 = *(_OWORD *)&a3->c;
      v8[0] = *(_OWORD *)&a3->a;
      v8[1] = v6;
      v8[2] = *(_OWORD *)&a3->tx;
      [(FxTransform *)v4 setCGAffineTransform:v8];
    }
  }
  return v4;
}

+ (id)identity
{
  id v2 = objc_alloc((Class)objc_opt_class());
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return (id)[v2 initWithCGAffineTransform:v5];
}

+ (id)transformWithCGAffineTransform:(CGAffineTransform *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  long long v5 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->tx;
  return (id)[v4 initWithCGAffineTransform:v7];
}

- (FxTransform)initWithScale:(CGPoint)a3 rotate:(float)a4 translate:(CGPoint)a5 shear:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v11 = a3.y;
  CGFloat v12 = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)FxTransform;
  v13 = [(FxTransform *)&v16 init];
  if (v13)
  {
    v14 = (FxTransformPriv *)malloc_type_calloc(1uLL, 0x38uLL, 0x100004095CF6A33uLL);
    v13->_priv = v14;
    if (v14)
    {
      v14->var0.CGFloat x = v12;
      v14->var0.CGFloat y = v11;
      v14->var1 = a4;
      v14->var2.CGFloat x = v9;
      v14->var2.CGFloat y = v8;
      v14->var3.CGFloat x = x;
      v14->var3.CGFloat y = y;
    }
  }
  return v13;
}

+ (id)transformWithScale:(CGPoint)a3 rotate:(float)a4 translate:(CGPoint)a5 shear:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  double v11 = a3.y;
  double v12 = a3.x;
  id v13 = objc_alloc((Class)objc_opt_class());
  *(float *)&double v14 = a4;
  v15 = objc_msgSend(v13, "initWithScale:rotate:translate:shear:", v12, v11, v14, v9, v8, x, y);

  return v15;
}

- (void)setScale:(CGPoint)a3
{
  self->_priv->var0 = a3;
}

- (CGPoint)scale
{
  priv = self->_priv;
  double x = priv->var0.x;
  double y = priv->var0.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRotation:(float)a3
{
  self->_priv->var1 = a3;
}

- (float)rotation
{
  return self->_priv->var1;
}

- (void)setTranslation:(CGPoint)a3
{
  self->_priv->var2 = a3;
}

- (CGPoint)translation
{
  priv = self->_priv;
  double x = priv->var2.x;
  double y = priv->var2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setShear:(CGPoint)a3
{
  self->_priv->var3 = a3;
}

- (CGPoint)shear
{
  priv = self->_priv;
  double x = priv->var3.x;
  double y = priv->var3.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCGAffineTransform:(CGAffineTransform *)a3
{
  priv = self->_priv;
  priv->var2 = (CGPoint)vbicq_s8(*(int8x16_t *)&a3->tx, (int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x3E45798EE0000000uLL), vabsq_f64(*(float64x2_t *)&a3->tx)));
  double d = a3->d;
  double a = a3->a;
  double b = a3->b;
  float v7 = a3->a * d - d * b;
  if (fabsf(v7) >= 0.00000001)
  {
    float v8 = sqrt(a * a + b * b);
    double v9 = v8;
    if (v8 >= 0.00000001) {
      double v10 = v8;
    }
    else {
      double v10 = 0.0;
    }
    CGFloat v11 = a / v9;
    CGFloat v12 = b / v9;
    a3->double a = v11;
    a3->double b = v12;
    double c = a3->c;
    float v14 = d * v12 + v11 * c;
    double v15 = c - v11 * v14;
    double v16 = d - v12 * v14;
    float v17 = sqrt(v15 * v15 + v16 * v16);
    double v18 = v17;
    if (v17 >= 0.00000001) {
      double v19 = v17;
    }
    else {
      double v19 = 0.0;
    }
    double v20 = v16 / v18;
    a3->double c = v15 / v18;
    a3->double d = v20;
    if (fabsf(v14 / v17) >= 0.00000001) {
      float v21 = v14 / v17;
    }
    else {
      float v21 = 0.0;
    }
    float v22 = v11 * v20 - v12 * (v15 / v18);
    float v23 = atan2(v12, v11);
    if (v23 < 0.0) {
      float v23 = v23 + 6.2832;
    }
    if (v23 < 0.00000001) {
      float v23 = 0.0;
    }
    if (v23 >= 3.1416)
    {
      float v23 = v23 + -3.1416;
      if (v22 < 0.0) {
        double v10 = -v10;
      }
    }
    else if (v22 < 0.0)
    {
      double v19 = -v19;
    }
    priv->var0.double x = v10;
    priv->var0.double y = v19;
    priv->var1 = v23;
    priv->var3.double x = v21;
    priv->var3.double y = 0.0;
  }
  else
  {
    priv->var0.double x = 0.0;
    priv->var0.double y = 0.0;
    priv->var1 = 0.0;
    priv->var3.double x = 0.0;
    priv->var3.double y = 0.0;
  }
}

- (CGAffineTransform)cgAffineTransform
{
  priv = self->_priv;
  int8x16_t var3 = (int8x16_t)priv->var3;
  retstr->tCGFloat y = 0.0;
  retstr->double a = 1.0;
  *(int8x16_t *)&retstr->double b = vextq_s8(var3, var3, 8uLL);
  retstr->double d = 1.0;
  retstr->tCGFloat x = 0.0;
  var3.i64[0] = *(void *)&priv->var0.x;
  CGFloat y = priv->var0.y;
  long long v7 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.double a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.double c = v7;
  *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(retstr, &v16, *(CGFloat *)var3.i64, y);
  CGFloat var1 = priv->var1;
  long long v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.double a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.double c = v9;
  *(_OWORD *)&v15.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformRotate(&v16, &v15, var1);
  long long v10 = *(_OWORD *)&v16.c;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&v16.a;
  *(_OWORD *)&retstr->double c = v10;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v16.tx;
  CGFloat x = priv->var2.x;
  *(CGFloat *)&long long v10 = priv->var2.y;
  long long v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.double a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.double c = v12;
  *(_OWORD *)&v15.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGPoint result = CGAffineTransformTranslate(&v16, &v15, x, *(CGFloat *)&v10);
  long long v14 = *(_OWORD *)&v16.c;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&v16.a;
  *(_OWORD *)&retstr->double c = v14;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v16.tx;
  return result;
}

@end