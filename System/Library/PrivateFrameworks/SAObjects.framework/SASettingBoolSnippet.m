@interface SASettingBoolSnippet
+ (id)BOOLSnippet;
- (BOOL)toggle;
- (NSNumber)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setToggle:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation SASettingBoolSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"BoolSnippet";
}

+ (id)BOOLSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)toggle
{
  return AceObjectBoolForProperty(self, @"toggle");
}

- (void)setToggle:(BOOL)a3
{
}

- (NSNumber)value
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end