@interface OADAlphaModFixEffect
- (BOOL)isEqual:(id)a3;
- (OADAlphaModFixEffect)init;
- (float)alpha;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAlpha:(float)a3;
@end

@implementation OADAlphaModFixEffect

- (OADAlphaModFixEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADAlphaModFixEffect;
  result = [(OADBlipEffect *)&v3 initWithType:4];
  if (result) {
    *(&result->super.mType + 1) = 1065353216;
  }
  return result;
}

- (void)setAlpha:(float)a3
{
  *((float *)&self->super.mType + 1) = a3;
}

- (float)alpha
{
  return *((float *)&self->super.mType + 1);
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)*((float *)&self->super.mType + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADAlphaModFixEffect;
  return [(OADBlipEffect *)&v4 hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (float v5 = *((float *)&self->super.mType + 1), [v4 alpha], v5 == v6))
  {
    v9.receiver = self;
    v9.super_class = (Class)OADAlphaModFixEffect;
    BOOL v7 = [(OADBlipEffect *)&v9 isEqual:v4];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  LODWORD(v5) = *(&self->super.mType + 1);
  [v4 setAlpha:v5];
  return v4;
}

@end