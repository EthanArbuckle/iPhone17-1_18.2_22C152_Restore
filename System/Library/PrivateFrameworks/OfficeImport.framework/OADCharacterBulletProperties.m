@interface OADCharacterBulletProperties
- (BOOL)isEqual:(id)a3;
- (OADCharacterBulletProperties)initWithBullet:(id)a3;
- (id)bullet;
- (unint64_t)hash;
@end

@implementation OADCharacterBulletProperties

- (OADCharacterBulletProperties)initWithBullet:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  mBullet = self->mBullet;
  self->mBullet = v5;

  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSString *)self->mBullet isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)bullet
{
  return self->mBullet;
}

- (unint64_t)hash
{
  return [(NSString *)self->mBullet hash];
}

- (void).cxx_destruct
{
}

@end