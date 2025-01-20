@interface SAUISiriSearchJSONSnippet
+ (id)siriSearchJSONSnippet;
- (NSString)clientTemplate;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientTemplate:(id)a3;
@end

@implementation SAUISiriSearchJSONSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SiriSearchJSONSnippet";
}

+ (id)siriSearchJSONSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)clientTemplate
{
  return (NSString *)[(AceObject *)self propertyForKey:@"clientTemplate"];
}

- (void)setClientTemplate:(id)a3
{
}

@end