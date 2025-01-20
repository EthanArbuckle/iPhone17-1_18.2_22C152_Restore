@interface SASettingSnippet
+ (id)snippet;
- (NSArray)settingKeys;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSettingKeys:(id)a3;
@end

@implementation SASettingSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"Snippet";
}

+ (id)snippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)settingKeys
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"settingKeys"];
}

- (void)setSettingKeys:(id)a3
{
}

@end