@interface OADPoint3D
- (BOOL)isEqual:(id)a3;
- (OADPoint3D)initWithX:(float)a3 y:(float)a4 z:(float)a5;
- (float)x;
- (float)y;
- (float)z;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation OADPoint3D

- (OADPoint3D)initWithX:(float)a3 y:(float)a4 z:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)OADPoint3D;
  result = [(OADPoint3D *)&v9 init];
  if (result)
  {
    result->mX = a3;
    result->mY = a4;
    result->mZ = a5;
  }
  return result;
}

- (float)x
{
  return self->mX;
}

- (float)y
{
  return self->mY;
}

- (float)z
{
  return self->mZ;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  *(float *)&double v5 = self->mX;
  *(float *)&double v6 = self->mY;
  *(float *)&double v7 = self->mZ;
  return (id)[v4 initWithX:v5 y:v6 z:v7];
}

- (unint64_t)hash
{
  return (unint64_t)self->mY ^ (unint64_t)self->mX ^ (unint64_t)self->mZ;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v6 = 0;
LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  id v5 = v4;
  double v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  float mX = self->mX;
  [v5 x];
  if (mX != v8) {
    goto LABEL_7;
  }
  float mY = self->mY;
  [v6 y];
  if (mY != v10) {
    goto LABEL_7;
  }
  float mZ = self->mZ;
  [v6 z];
  BOOL v13 = mZ == v12;
LABEL_8:

  return v13;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADPoint3D;
  v2 = [(OADPoint3D *)&v4 description];
  return v2;
}

@end