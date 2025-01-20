@interface OADRotation3D
- (BOOL)isEqual:(id)a3;
- (OADRotation3D)initWithLatitude:(float)a3 longitude:(float)a4 revolution:(float)a5;
- (float)latitude;
- (float)longitude;
- (float)revolution;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation OADRotation3D

- (OADRotation3D)initWithLatitude:(float)a3 longitude:(float)a4 revolution:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)OADRotation3D;
  result = [(OADRotation3D *)&v9 init];
  if (result)
  {
    result->mLatitude = a3;
    result->mLongitude = a4;
    result->mRevolution = a5;
  }
  return result;
}

- (float)latitude
{
  return self->mLatitude;
}

- (float)longitude
{
  return self->mLongitude;
}

- (float)revolution
{
  return self->mRevolution;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  *(float *)&double v5 = self->mLatitude;
  *(float *)&double v6 = self->mLongitude;
  *(float *)&double v7 = self->mRevolution;
  return (id)[v4 initWithLatitude:v5 longitude:v6 revolution:v7];
}

- (unint64_t)hash
{
  return (unint64_t)self->mLongitude ^ (unint64_t)self->mLatitude ^ (unint64_t)self->mRevolution;
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
  float mLatitude = self->mLatitude;
  [v5 latitude];
  if (mLatitude != v8) {
    goto LABEL_7;
  }
  float mLongitude = self->mLongitude;
  [v6 longitude];
  if (mLongitude != v10) {
    goto LABEL_7;
  }
  float mRevolution = self->mRevolution;
  [v6 revolution];
  BOOL v13 = mRevolution == v12;
LABEL_8:

  return v13;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADRotation3D;
  v2 = [(OADRotation3D *)&v4 description];
  return v2;
}

@end