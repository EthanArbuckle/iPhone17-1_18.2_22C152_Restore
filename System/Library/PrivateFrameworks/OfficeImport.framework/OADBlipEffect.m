@interface OADBlipEffect
- (BOOL)isEqual:(id)a3;
- (OADBlipEffect)initWithType:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)type;
- (unint64_t)hash;
@end

@implementation OADBlipEffect

- (OADBlipEffect)initWithType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADBlipEffect;
  result = [(OADBlipEffect *)&v5 init];
  if (result) {
    result->mType = a3;
  }
  return result;
}

- (unint64_t)hash
{
  return self->mType;
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

- (int)type
{
  return self->mType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADBlipEffect;
  v2 = [(OADBlipEffect *)&v4 description];
  return v2;
}

@end