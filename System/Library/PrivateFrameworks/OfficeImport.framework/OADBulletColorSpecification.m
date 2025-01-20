@interface OADBulletColorSpecification
- (BOOL)isEqual:(id)a3;
- (OADBulletColorSpecification)initWithBulletColor:(id)a3;
- (id)color;
- (unint64_t)hash;
@end

@implementation OADBulletColorSpecification

- (OADBulletColorSpecification)initWithBulletColor:(id)a3
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    mColor = self->mColor;
    v6 = [v4 color];
    BOOL v7 = [(OADColor *)mColor isEqual:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)color
{
  return self->mColor;
}

- (unint64_t)hash
{
  return [(OADColor *)self->mColor hash];
}

- (void).cxx_destruct
{
}

@end