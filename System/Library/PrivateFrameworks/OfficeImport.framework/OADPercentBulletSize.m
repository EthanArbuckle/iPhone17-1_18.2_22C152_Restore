@interface OADPercentBulletSize
- (BOOL)isEqual:(id)a3;
- (OADPercentBulletSize)initWithPercent:(float)a3;
- (float)percent;
- (unint64_t)hash;
@end

@implementation OADPercentBulletSize

- (OADPercentBulletSize)initWithPercent:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADPercentBulletSize;
  result = [(OADPercentBulletSize *)&v5 init];
  if (result) {
    result->mPercent = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float mPercent = self->mPercent;
    [v4 percent];
    BOOL v7 = mPercent == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (float)percent
{
  return self->mPercent;
}

- (unint64_t)hash
{
  return (unint64_t)self->mPercent;
}

@end