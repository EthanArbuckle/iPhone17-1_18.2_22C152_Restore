@interface SASettingAppearanceEntity
+ (id)appearanceEntity;
- (NSString)previousValue;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPreviousValue:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SASettingAppearanceEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"AppearanceEntity";
}

+ (id)appearanceEntity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)previousValue
{
  return (NSString *)[(AceObject *)self propertyForKey:@"previousValue"];
}

- (void)setPreviousValue:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end