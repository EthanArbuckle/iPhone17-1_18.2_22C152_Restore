@interface OADBiLevelEffect
- (BOOL)isEqual:(id)a3;
- (OADBiLevelEffect)init;
- (float)threshold;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setThreshold:(float)a3;
@end

@implementation OADBiLevelEffect

- (OADBiLevelEffect)init
{
  return [(OADBlipEffect *)self initWithType:1];
}

- (void)setThreshold:(float)a3
{
  *((float *)&self->super.mType + 1) = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  LODWORD(v5) = *(&self->super.mType + 1);
  [v4 setThreshold:v5];
  return v4;
}

- (float)threshold
{
  return *((float *)&self->super.mType + 1);
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)*((float *)&self->super.mType + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADBiLevelEffect;
  return [(OADBlipEffect *)&v4 hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (float v5 = *((float *)&self->super.mType + 1), [v4 threshold], v5 == v6))
  {
    v9.receiver = self;
    v9.super_class = (Class)OADBiLevelEffect;
    BOOL v7 = [(OADBlipEffect *)&v9 isEqual:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end