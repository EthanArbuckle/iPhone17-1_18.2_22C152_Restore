@interface OADGlowEffect
- (BOOL)isEqual:(id)a3;
- (OADGlowEffect)init;
- (float)radius;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setColor:(id)a3;
- (void)setRadius:(float)a3;
@end

@implementation OADGlowEffect

- (OADGlowEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADGlowEffect;
  return [(OADEffect *)&v3 initWithType:4];
}

- (void)setRadius:(float)a3
{
  self->mRadius = a3;
}

- (void)setColor:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)[(OADColor *)self->mColor copy];
  [v4 setColor:v5];
  *(float *)&double v6 = self->mRadius;
  [v4 setRadius:v6];

  return v4;
}

- (id)color
{
  return self->mColor;
}

- (float)radius
{
  return self->mRadius;
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADColor *)self->mColor hash];
  unint64_t mRadius = (unint64_t)self->mRadius;
  v6.receiver = self;
  v6.super_class = (Class)OADGlowEffect;
  return v3 ^ [(OADEffect *)&v6 hash] ^ mRadius;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    mColor = self->mColor;
    objc_super v6 = [v4 color];
    if ([(OADColor *)mColor isEqual:v6]
      && (float mRadius = self->mRadius, [v4 radius], mRadius == v8))
    {
      v11.receiver = self;
      v11.super_class = (Class)OADGlowEffect;
      BOOL v9 = [(OADEffect *)&v11 isEqual:v4];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADGlowEffect;
  v2 = [(OADEffect *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end