@interface OADBulletFontSpecification
- (BOOL)isEqual:(id)a3;
- (OADBulletFontSpecification)initWithFont:(id)a3;
- (id)font;
- (unint64_t)hash;
@end

@implementation OADBulletFontSpecification

- (OADBulletFontSpecification)initWithFont:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  mFont = self->mFont;
  self->mFont = v5;

  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    mFont = self->mFont;
    v6 = [v4 font];
    char v7 = [(NSString *)mFont isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)font
{
  return self->mFont;
}

- (unint64_t)hash
{
  return [(NSString *)self->mFont hash];
}

- (void).cxx_destruct
{
}

@end