@interface OADTextBodyAutoFit
- (BOOL)isEqual:(id)a3;
- (OADTextBodyAutoFit)initWithType:(unsigned __int8)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)type;
@end

@implementation OADTextBodyAutoFit

- (OADTextBodyAutoFit)initWithType:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADTextBodyAutoFit;
  result = [(OADTextBodyAutoFit *)&v5 init];
  if (result) {
    result->mType = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int mType = self->mType;
    BOOL v6 = mType == [v4 type];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unsigned)type
{
  return self->mType;
}

- (unint64_t)hash
{
  return self->mType;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTextBodyAutoFit;
  v2 = [(OADTextBodyAutoFit *)&v4 description];
  return v2;
}

@end