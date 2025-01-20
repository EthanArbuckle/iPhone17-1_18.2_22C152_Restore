@interface OADTheme
- (BOOL)isEmpty;
- (NSString)name;
- (OADBaseStyles)baseStyles;
- (OADDrawableDefaults)drawableDefaults;
- (OADTheme)init;
- (id)description;
- (void)setBaseStyles:(id)a3;
- (void)setName:(id)a3;
- (void)validateTheme;
@end

@implementation OADTheme

- (OADTheme)init
{
  v8.receiver = self;
  v8.super_class = (Class)OADTheme;
  v2 = [(OADTheme *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(OADBaseStyles);
    mBaseStyles = v2->mBaseStyles;
    v2->mBaseStyles = v3;

    uint64_t v5 = objc_opt_new();
    mDrawableDefaults = v2->mDrawableDefaults;
    v2->mDrawableDefaults = (OADDrawableDefaults *)v5;
  }
  return v2;
}

- (OADBaseStyles)baseStyles
{
  return self->mBaseStyles;
}

- (BOOL)isEmpty
{
  return [(OADBaseStyles *)self->mBaseStyles isEmpty]
      && [(OADDrawableDefaults *)self->mDrawableDefaults isEmpty];
}

- (void)validateTheme
{
  v3 = [(OADTheme *)self name];
  uint64_t v4 = [v3 length];

  if (!v4) {
    [(OADTheme *)self setName:@"Office"];
  }
  mBaseStyles = self->mBaseStyles;
  [(OADBaseStyles *)mBaseStyles validateBaseStyles];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTheme;
  v2 = [(OADTheme *)&v4 description];
  return v2;
}

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
}

- (void)setBaseStyles:(id)a3
{
}

- (OADDrawableDefaults)drawableDefaults
{
  return self->mDrawableDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawableDefaults, 0);
  objc_storeStrong((id *)&self->mBaseStyles, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end