@interface SASettingNumericEntity
+ (id)numericEntity;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingNumericEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"NumericEntity";
}

+ (id)numericEntity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end