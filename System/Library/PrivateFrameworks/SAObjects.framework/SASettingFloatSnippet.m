@interface SASettingFloatSnippet
+ (id)floatSnippet;
- (NSNumber)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setValue:(id)a3;
@end

@implementation SASettingFloatSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"FloatSnippet";
}

+ (id)floatSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)value
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end