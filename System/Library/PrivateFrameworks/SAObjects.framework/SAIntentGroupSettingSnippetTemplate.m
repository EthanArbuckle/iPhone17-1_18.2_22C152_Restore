@interface SAIntentGroupSettingSnippetTemplate
+ (id)settingSnippetTemplate;
- (NSString)alignment;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlignment:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SAIntentGroupSettingSnippetTemplate

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"SettingSnippetTemplate";
}

+ (id)settingSnippetTemplate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)alignment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"alignment"];
}

- (void)setAlignment:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end