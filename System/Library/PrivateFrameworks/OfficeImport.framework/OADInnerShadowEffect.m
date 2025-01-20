@interface OADInnerShadowEffect
- (OADInnerShadowEffect)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation OADInnerShadowEffect

- (OADInnerShadowEffect)init
{
  return [(OADShadowEffect *)self initWithType:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithShadowEffect:self type:0];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADInnerShadowEffect;
  v2 = [(OADShadowEffect *)&v4 description];
  return v2;
}

@end