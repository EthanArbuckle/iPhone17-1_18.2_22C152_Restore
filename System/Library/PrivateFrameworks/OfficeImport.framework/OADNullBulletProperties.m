@interface OADNullBulletProperties
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation OADNullBulletProperties

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)OADNullBulletProperties;
  return [(OADNullBulletProperties *)&v3 hash];
}

@end