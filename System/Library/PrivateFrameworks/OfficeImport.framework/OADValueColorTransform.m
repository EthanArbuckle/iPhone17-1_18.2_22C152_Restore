@interface OADValueColorTransform
- (BOOL)isEqual:(id)a3;
- (float)value;
- (unint64_t)hash;
- (void)setValue:(float)a3;
@end

@implementation OADValueColorTransform

- (void)setValue:(float)a3
{
  *((float *)&self->super.mType + 1) = a3;
}

- (float)value
{
  return *((float *)&self->super.mType + 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (([v4 isMemberOfClass:objc_opt_class()] & 1) != 0
    && (float v5 = *((float *)&self->super.mType + 1), [v4 value], v5 == v6))
  {
    v9.receiver = self;
    v9.super_class = (Class)OADValueColorTransform;
    BOOL v7 = [(OADColorTransform *)&v9 isEqual:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)*((float *)&self->super.mType + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADValueColorTransform;
  return [(OADColorTransform *)&v4 hash] ^ v2;
}

@end