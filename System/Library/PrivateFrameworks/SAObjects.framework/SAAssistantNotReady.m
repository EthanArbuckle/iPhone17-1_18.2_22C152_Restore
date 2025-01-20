@interface SAAssistantNotReady
+ (id)assistantNotReady;
- (BOOL)requiresResponse;
- (NSString)language;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLanguage:(id)a3;
@end

@implementation SAAssistantNotReady

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AssistantNotReady";
}

+ (id)assistantNotReady
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end