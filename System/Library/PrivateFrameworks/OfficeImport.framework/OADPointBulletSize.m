@interface OADPointBulletSize
- (BOOL)isEqual:(id)a3;
- (OADPointBulletSize)initWithPoints:(int)a3;
- (int)points;
- (unint64_t)hash;
@end

@implementation OADPointBulletSize

- (OADPointBulletSize)initWithPoints:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADPointBulletSize;
  result = [(OADPointBulletSize *)&v5 init];
  if (result) {
    result->mPoints = a3;
  }
  return result;
}

- (int)points
{
  return self->mPoints;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int mPoints = self->mPoints;
    BOOL v6 = mPoints == [v4 points];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->mPoints;
}

@end