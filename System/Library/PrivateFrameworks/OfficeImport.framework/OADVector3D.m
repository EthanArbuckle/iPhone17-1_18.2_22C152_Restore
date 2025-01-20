@interface OADVector3D
- (BOOL)isEqual:(id)a3;
- (OADVector3D)initWithDx:(float)a3 dy:(float)a4 dz:(float)a5;
- (float)dx;
- (float)dy;
- (float)dz;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation OADVector3D

- (OADVector3D)initWithDx:(float)a3 dy:(float)a4 dz:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)OADVector3D;
  result = [(OADVector3D *)&v9 init];
  if (result)
  {
    result->mDx = a3;
    result->mDy = a4;
    result->mDz = a5;
  }
  return result;
}

- (float)dx
{
  return self->mDx;
}

- (float)dy
{
  return self->mDy;
}

- (float)dz
{
  return self->mDz;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  *(float *)&double v5 = self->mDx;
  *(float *)&double v6 = self->mDy;
  *(float *)&double v7 = self->mDz;
  return (id)[v4 initWithDx:v5 dy:v6 dz:v7];
}

- (unint64_t)hash
{
  return (unint64_t)self->mDy ^ (unint64_t)self->mDx ^ (unint64_t)self->mDz;
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
  float mDx = self->mDx;
  [v5 dx];
  if (mDx != v8) {
    goto LABEL_7;
  }
  float mDy = self->mDy;
  [v6 dy];
  if (mDy != v10) {
    goto LABEL_7;
  }
  float mDz = self->mDz;
  [v6 dz];
  BOOL v13 = mDz == v12;
LABEL_8:

  return v13;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADVector3D;
  v2 = [(OADVector3D *)&v4 description];
  return v2;
}

@end