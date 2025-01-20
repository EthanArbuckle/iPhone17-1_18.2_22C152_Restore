@interface OADDashStop
+ (void)addStopWithDash:(float)a3 space:(float)a4 toArray:(id)a5;
- (BOOL)isEqual:(id)a3;
- (OADDashStop)initWithDash:(float)a3 space:(float)a4;
- (float)dash;
- (float)space;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation OADDashStop

- (OADDashStop)initWithDash:(float)a3 space:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)OADDashStop;
  result = [(OADDashStop *)&v7 init];
  if (result)
  {
    result->mDash = a3;
    result->mSpace = a4;
  }
  return result;
}

- (float)dash
{
  return self->mDash;
}

- (float)space
{
  return self->mSpace;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  *(float *)&double v5 = self->mDash;
  *(float *)&double v6 = self->mSpace;
  return (id)[v4 initWithDash:v5 space:v6];
}

- (unint64_t)hash
{
  return (unint64_t)self->mSpace ^ (unint64_t)self->mDash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (float *)a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class() && self->mDash == v4[2] && self->mSpace == v4[3];

  return v6;
}

+ (void)addStopWithDash:(float)a3 space:(float)a4 toArray:(id)a5
{
  id v11 = a5;
  objc_super v7 = [OADDashStop alloc];
  *(float *)&double v8 = a3;
  *(float *)&double v9 = a4;
  v10 = [(OADDashStop *)v7 initWithDash:v8 space:v9];
  [v11 addObject:v10];
}

@end