@interface OADTableBackground
- (BOOL)hasEffects;
- (NSString)description;
- (id)effects;
- (id)fill;
- (void)setEffects:(id)a3;
- (void)setFill:(id)a3;
@end

@implementation OADTableBackground

- (void)setFill:(id)a3
{
}

- (void)setEffects:(id)a3
{
}

- (id)fill
{
  return self->mFill;
}

- (id)effects
{
  return self->mEffects;
}

- (BOOL)hasEffects
{
  return self->mEffects != 0;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTableBackground;
  v2 = [(OADTableBackground *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mFill, 0);
}

@end