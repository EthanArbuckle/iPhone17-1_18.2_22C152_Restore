@interface OADBulletSizeFollowText
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation OADBulletSizeFollowText

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 0;
}

@end