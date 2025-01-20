@interface OADForegroundColorEffect
- (BOOL)isEqual:(id)a3;
- (OADForegroundColorEffect)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)foregroundColor;
- (unint64_t)hash;
- (void)setForegroundColor:(id)a3;
- (void)setStyleColor:(id)a3;
@end

@implementation OADForegroundColorEffect

- (OADForegroundColorEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)OADForegroundColorEffect;
  return [(OADBlipEffect *)&v3 initWithType:6];
}

- (void)setForegroundColor:(id)a3
{
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADColor *)self->mForegroundColor hash];
  v5.receiver = self;
  v5.super_class = (Class)OADForegroundColorEffect;
  return [(OADBlipEffect *)&v5 hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    mForegroundColor = self->mForegroundColor;
    v6 = [v4 foregroundColor];
    if ([(OADColor *)mForegroundColor isEqual:v6])
    {
      v9.receiver = self;
      v9.super_class = (Class)OADForegroundColorEffect;
      BOOL v7 = [(OADBlipEffect *)&v9 isEqual:v4];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)foregroundColor
{
  return self->mForegroundColor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(OADColor *)self->mForegroundColor copyWithZone:a3];
  [v5 setForegroundColor:v6];

  return v5;
}

- (void)setStyleColor:(id)a3
{
  id v4 = [(OADColor *)self->mForegroundColor colorForStyleColor:a3];
  -[OADForegroundColorEffect setForegroundColor:](self, "setForegroundColor:");
}

- (void).cxx_destruct
{
}

@end