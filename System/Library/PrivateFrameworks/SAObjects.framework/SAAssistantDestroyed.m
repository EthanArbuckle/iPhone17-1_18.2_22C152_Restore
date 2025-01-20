@interface SAAssistantDestroyed
+ (id)assistantDestroyed;
- (BOOL)requiresResponse;
- (NSString)assistantId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssistantId:(id)a3;
@end

@implementation SAAssistantDestroyed

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AssistantDestroyed";
}

+ (id)assistantDestroyed
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

- (BOOL)requiresResponse
{
  return 0;
}

@end