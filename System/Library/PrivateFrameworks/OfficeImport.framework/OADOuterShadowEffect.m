@interface OADOuterShadowEffect
- (BOOL)isEqual:(id)a3;
- (BOOL)rotateWithShape;
- (OADOuterShadowEffect)init;
- (float)xScale;
- (float)xSkew;
- (float)yScale;
- (float)ySkew;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)alignment;
- (unint64_t)hash;
- (void)setAlignment:(int)a3;
- (void)setRotateWithShape:(BOOL)a3;
- (void)setXScale:(float)a3;
- (void)setXSkew:(float)a3;
- (void)setYScale:(float)a3;
- (void)setYSkew:(float)a3;
@end

@implementation OADOuterShadowEffect

- (OADOuterShadowEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADOuterShadowEffect;
  result = [(OADShadowEffect *)&v3 initWithType:1];
  if (result)
  {
    *((_DWORD *)&result->super.mAngle + 1) = 1065353216;
    result->mXScale = 1.0;
    result->mYScale = 0.0;
    result->mXSkew = 0.0;
    LODWORD(result->mYSkew) = 8;
    LOBYTE(result->mAlignment) = 0;
  }
  return result;
}

- (void)setRotateWithShape:(BOOL)a3
{
  LOBYTE(self->mAlignment) = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADOuterShadowEffect;
  if ([(OADShadowEffect *)&v8 isEqual:v4])
  {
    v5 = (float *)v4;
    BOOL v6 = *(&self->super.mAngle + 1) == v5[9]
      && self->mXScale == v5[10]
      && self->mYScale == v5[11]
      && self->mXSkew == v5[12]
      && LODWORD(self->mYSkew) == *((_DWORD *)v5 + 13)
      && LOBYTE(self->mAlignment) == *((unsigned __int8 *)v5 + 56);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)self->mXScale ^ (unint64_t)*(&self->super.mAngle + 1) ^ (unint64_t)self->mYScale ^ (unint64_t)self->mXSkew;
  unint64_t v3 = LODWORD(self->mYSkew) ^ (unint64_t)LOBYTE(self->mAlignment);
  v5.receiver = self;
  v5.super_class = (Class)OADOuterShadowEffect;
  return v2 ^ v3 ^ [(OADShadowEffect *)&v5 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithShadowEffect:type:", self, 1);
  *((_DWORD *)result + 9) = *((_DWORD *)&self->super.mAngle + 1);
  *((_DWORD *)result + 10) = LODWORD(self->mXScale);
  *((_DWORD *)result + 11) = LODWORD(self->mYScale);
  *((_DWORD *)result + 12) = LODWORD(self->mXSkew);
  *((_DWORD *)result + 13) = LODWORD(self->mYSkew);
  *((unsigned char *)result + 56) = self->mAlignment;
  return result;
}

- (void)setAlignment:(int)a3
{
  LODWORD(self->mYSkew) = a3;
}

- (void)setYSkew:(float)a3
{
  self->mXSkew = a3;
}

- (void)setXScale:(float)a3
{
  *(&self->super.mAngle + 1) = a3;
}

- (void)setYScale:(float)a3
{
  self->mXScale = a3;
}

- (void)setXSkew:(float)a3
{
  self->mYScale = a3;
}

- (float)xScale
{
  return *(&self->super.mAngle + 1);
}

- (float)yScale
{
  return self->mXScale;
}

- (float)xSkew
{
  return self->mYScale;
}

- (float)ySkew
{
  return self->mXSkew;
}

- (int)alignment
{
  return LODWORD(self->mYSkew);
}

- (BOOL)rotateWithShape
{
  return self->mAlignment;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADOuterShadowEffect;
  unint64_t v2 = [(OADShadowEffect *)&v4 description];
  return v2;
}

@end