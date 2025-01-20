@interface SAUISnippetInteraction
+ (id)snippetInteraction;
- (BOOL)requiresResponse;
- (NSString)requestId;
- (NSString)snippetId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRequestId:(id)a3;
- (void)setSnippetId:(id)a3;
@end

@implementation SAUISnippetInteraction

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SnippetInteraction";
}

+ (id)snippetInteraction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)requestId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestId"];
}

- (void)setRequestId:(id)a3
{
}

- (NSString)snippetId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"snippetId"];
}

- (void)setSnippetId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end