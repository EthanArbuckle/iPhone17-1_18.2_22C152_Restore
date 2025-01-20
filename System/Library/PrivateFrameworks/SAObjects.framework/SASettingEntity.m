@interface SASettingEntity
+ (id)entity;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"Entity";
}

+ (id)entity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end