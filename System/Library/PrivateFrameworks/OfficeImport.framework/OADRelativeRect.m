@interface OADRelativeRect
- (BOOL)isEqual:(id)a3;
- (OADRelativeRect)init;
- (OADRelativeRect)initWithLeft:(float)a3 top:(float)a4 right:(float)a5 bottom:(float)a6;
- (float)bottom;
- (float)left;
- (float)right;
- (float)top;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setBottom:(float)a3;
- (void)setLeft:(float)a3;
- (void)setRight:(float)a3;
- (void)setTop:(float)a3;
@end

@implementation OADRelativeRect

- (OADRelativeRect)initWithLeft:(float)a3 top:(float)a4 right:(float)a5 bottom:(float)a6
{
  v11.receiver = self;
  v11.super_class = (Class)OADRelativeRect;
  result = [(OADRelativeRect *)&v11 init];
  if (result)
  {
    result->mLeft = a3;
    result->mTop = a4;
    result->mRight = a5;
    result->mBottom = a6;
  }
  return result;
}

- (float)left
{
  return self->mLeft;
}

- (float)right
{
  return self->mRight;
}

- (float)top
{
  return self->mTop;
}

- (float)bottom
{
  return self->mBottom;
}

- (OADRelativeRect)init
{
  return [(OADRelativeRect *)self initWithLeft:0.0 top:0.0 right:0.0 bottom:0.0];
}

- (void)setLeft:(float)a3
{
  self->mLeft = a3;
}

- (void)setRight:(float)a3
{
  self->mRight = a3;
}

- (void)setTop:(float)a3
{
  self->mTop = a3;
}

- (void)setBottom:(float)a3
{
  self->mBottom = a3;
}

- (unint64_t)hash
{
  int8x16_t v2 = veorq_s8((int8x16_t)vcvtq_u64_f64(vcvtq_f64_f32(*(float32x2_t *)&self->mLeft)), (int8x16_t)vcvtq_u64_f64(vcvt_hight_f64_f32(*(float32x4_t *)&self->mLeft)));
  return (unint64_t)veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (float mTop = self->mTop, [v4 top], mTop == v6)
    && (float mBottom = self->mBottom, [v4 bottom], mBottom == v8)
    && (float mLeft = self->mLeft, [v4 left], mLeft == v10))
  {
    float mRight = self->mRight;
    [v4 right];
    BOOL v13 = mRight == v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  *(float *)&double v5 = self->mLeft;
  *(float *)&double v6 = self->mTop;
  *(float *)&double v7 = self->mRight;
  *(float *)&double v8 = self->mBottom;
  return (id)[v4 initWithLeft:v5 top:v6 right:v7 bottom:v8];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADRelativeRect;
  int8x16_t v2 = [(OADRelativeRect *)&v4 description];
  return v2;
}

@end