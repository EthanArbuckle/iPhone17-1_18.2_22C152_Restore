@interface OADPointTextSpacing
- (BOOL)isEqual:(id)a3;
- (OADPointTextSpacing)initWithPoints:(int)a3;
- (int)points;
- (unint64_t)hash;
@end

@implementation OADPointTextSpacing

- (OADPointTextSpacing)initWithPoints:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADPointTextSpacing;
  result = [(OADPointTextSpacing *)&v5 init];
  if (result) {
    result->mPoints = a3;
  }
  return result;
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

- (int)points
{
  return self->mPoints;
}

- (unint64_t)hash
{
  return self->mPoints;
}

@end