@interface SAAssistantCreated
+ (id)assistantCreated;
- (BOOL)requiresResponse;
- (NSString)assistantId;
- (NSString)speechId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssistantId:(id)a3;
- (void)setSpeechId:(id)a3;
@end

@implementation SAAssistantCreated

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AssistantCreated";
}

+ (id)assistantCreated
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)assistantId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"assistantId"];
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)speechId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speechId"];
}

- (void)setSpeechId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end