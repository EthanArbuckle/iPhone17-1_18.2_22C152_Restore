@interface OADOrientedBounds
+ (BOOL)directionCloserToVerticalThanToHorizontal:(float)a3;
+ (OADOrientedBounds)orientedBoundsWithBounds:(CGRect)a3;
+ (OADOrientedBounds)orientedBoundsWithBounds:(CGRect)a3 rotation:(float)a4 flipX:(BOOL)a5 flipY:(BOOL)a6;
- (BOOL)flipX;
- (BOOL)flipY;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOrientedBounds:(id)a3;
- (CGRect)boundingBox;
- (CGRect)bounds;
- (CGSize)boundingBoxSize;
- (OADOrientedBounds)init;
- (OADOrientedBounds)initWithBounds:(CGRect)a3;
- (OADOrientedBounds)initWithBounds:(CGRect)a3 rotation:(float)a4 flipX:(BOOL)a5 flipY:(BOOL)a6;
- (float)rotation;
- (id)description;
- (int)xMode;
- (int)yMode;
- (unint64_t)hash;
- (void)setBounds:(CGRect)a3;
- (void)setFlipX:(BOOL)a3;
- (void)setFlipY:(BOOL)a3;
- (void)setOrientedBounds:(id)a3;
- (void)setRotation:(float)a3;
- (void)setXMode:(int)a3;
- (void)setYMode:(int)a3;
@end

@implementation OADOrientedBounds

- (OADOrientedBounds)initWithBounds:(CGRect)a3
{
  return -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](self, "initWithBounds:rotation:flipX:flipY:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (OADOrientedBounds)initWithBounds:(CGRect)a3 rotation:(float)a4 flipX:(BOOL)a5 flipY:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)OADOrientedBounds;
  result = [(OADOrientedBounds *)&v15 init];
  if (result)
  {
    result->mBounds.origin.CGFloat x = x;
    result->mBounds.origin.CGFloat y = y;
    result->mBounds.size.CGFloat width = width;
    result->mBounds.size.CGFloat height = height;
    result->mRotation = a4;
    if (v6) {
      char v14 = 2;
    }
    else {
      char v14 = 0;
    }
    *((unsigned char *)result + 44) = v14 | a5 | *((unsigned char *)result + 44) & 0xFC;
    *(void *)&result->mModeX = 0;
  }
  return result;
}

- (OADOrientedBounds)init
{
  return -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](self, "initWithBounds:rotation:flipX:flipY:", 0, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), 0.0);
}

- (void)setRotation:(float)a3
{
  self->mRotation = a3;
}

- (void)setFlipX:(BOOL)a3
{
  *((unsigned char *)self + 44) = *((unsigned char *)self + 44) & 0xFE | a3;
}

- (void)setFlipY:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 44) = *((unsigned char *)self + 44) & 0xFD | v3;
}

- (float)rotation
{
  return self->mRotation;
}

+ (BOOL)directionCloserToVerticalThanToHorizontal:(float)a3
{
  unsigned int v3 = vcvts_n_s32_f32(a3, 0x10uLL);
  if ((v3 & 0x80000000) != 0) {
    v3 += 23592960 * ((95443718 * (unint64_t)(-v3 >> 19)) >> 32) + 23592960;
  }
  return ((95443718 * (unint64_t)((v3 + 2949120) >> 17)) >> 32) & 1;
}

- (void)setBounds:(CGRect)a3
{
  self->mBounds = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    CGFloat x = self->mBounds.origin.x;
    CGFloat y = self->mBounds.origin.y;
    CGFloat width = self->mBounds.size.width;
    CGFloat height = self->mBounds.size.height;
    [v5 bounds];
    v24.origin.CGFloat x = v10;
    v24.origin.CGFloat y = v11;
    v24.size.CGFloat width = v12;
    v24.size.CGFloat height = v13;
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    if (CGRectEqualToRect(v23, v24)
      && (-[OADOrientedBounds rotation](self, "rotation"), float v15 = v14, [v5 rotation], v15 == v16)
      && (int v17 = -[OADOrientedBounds flipX](self, "flipX"), v17 == [v5 flipX])
      && (int v18 = -[OADOrientedBounds flipY](self, "flipY"), v18 == [v5 flipY])
      && (int v19 = -[OADOrientedBounds xMode](self, "xMode"), v19 == [v5 xMode]))
    {
      int v20 = [(OADOrientedBounds *)self yMode];
      BOOL v21 = v20 == [v5 yMode];
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (CGRect)bounds
{
  double x = self->mBounds.origin.x;
  double y = self->mBounds.origin.y;
  double width = self->mBounds.size.width;
  double height = self->mBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

+ (OADOrientedBounds)orientedBoundsWithBounds:(CGRect)a3
{
  return (OADOrientedBounds *)objc_msgSend(a1, "orientedBoundsWithBounds:rotation:flipX:flipY:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

+ (OADOrientedBounds)orientedBoundsWithBounds:(CGRect)a3 rotation:(float)a4 flipX:(BOOL)a5 flipY:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v13 = [OADOrientedBounds alloc];
  *(float *)&double v14 = a4;
  float v15 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v13, "initWithBounds:rotation:flipX:flipY:", v7, v6, x, y, width, height, v14);
  return v15;
}

- (BOOL)flipX
{
  return *((unsigned char *)self + 44) & 1;
}

- (BOOL)flipY
{
  return (*((unsigned __int8 *)self + 44) >> 1) & 1;
}

- (int)xMode
{
  return self->mModeX;
}

- (int)yMode
{
  return self->mModeY;
}

- (void)setXMode:(int)a3
{
  self->mModeX = a3;
}

- (void)setYMode:(int)a3
{
  self->mModeY = a3;
}

- (void)setOrientedBounds:(id)a3
{
  CGPoint v3 = *(CGPoint *)((char *)a3 + 8);
  self->mBounds.size = *(CGSize *)((char *)a3 + 24);
  self->mBounds.origin = v3;
  self->mRotation = *((float *)a3 + 10);
  char v4 = *((unsigned char *)self + 44) & 0xFE | *((unsigned char *)a3 + 44) & 1;
  *((unsigned char *)self + 44) = v4;
  *((unsigned char *)self + 44) = v4 & 0xFD | *((unsigned char *)a3 + 44) & 2;
  self->mModeX = *((_DWORD *)a3 + 12);
  self->mModeY = *((_DWORD *)a3 + 13);
}

- (CGSize)boundingBoxSize
{
  [(OADOrientedBounds *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(OADOrientedBounds *)self rotation];
  float v8 = v7 * 3.14159265 / 180.0;
  __float2 v9 = __sincosf_stret(v8);
  double v10 = fabsf(v9.__cosval);
  double v11 = fabsf(v9.__sinval);
  float v12 = v6 * v11 + v10 * v4;
  *(float *)&double v10 = v4 * v11 + v10 * v6;
  double v13 = v12;
  double v14 = *(float *)&v10;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGRect)boundingBox
{
  double v3 = TSUCenterOfRect(self->mBounds.origin.x, self->mBounds.origin.y, self->mBounds.size.width, self->mBounds.size.height);
  double v5 = v4;
  [(OADOrientedBounds *)self boundingBoxSize];
  double v7 = TSURectWithCenterAndSize(v3, v5, v6);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (BOOL)isEqualToOrientedBounds:(id)a3
{
  double v4 = (char *)a3;
  double v5 = (float *)v4;
  BOOL v6 = v4
    && CGRectEqualToRect(self->mBounds, *(CGRect *)(v4 + 8))
    && self->mRotation == v5[10]
    && ((*((unsigned char *)v5 + 44) ^ *((unsigned char *)self + 44)) & 3) == 0
    && self->mModeX == *((_DWORD *)v5 + 12)
    && self->mModeY == *((_DWORD *)v5 + 13);

  return v6;
}

- (unint64_t)hash
{
  int8x16_t v2 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->mBounds.origin), (int8x16_t)vcvtq_u64_f64((float64x2_t)self->mBounds.size));
  return *(unint64_t *)&veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)) ^ *((unsigned char *)self + 44) & 1 ^ ((unint64_t)*((unsigned __int8 *)self + 44) >> 1) & 1 ^ (unint64_t)self->mRotation;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADOrientedBounds;
  int8x16_t v2 = [(OADOrientedBounds *)&v4 description];
  return v2;
}

@end