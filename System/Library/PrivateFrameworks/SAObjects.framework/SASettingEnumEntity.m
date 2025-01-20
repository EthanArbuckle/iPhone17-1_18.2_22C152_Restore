@interface SASettingEnumEntity
+ (id)enumEntity;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingEnumEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"EnumEntity";
}

+ (id)enumEntity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end