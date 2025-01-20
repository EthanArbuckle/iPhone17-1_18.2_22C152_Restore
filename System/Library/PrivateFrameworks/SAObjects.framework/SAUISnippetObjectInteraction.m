@interface SAUISnippetObjectInteraction
+ (id)snippetObjectInteraction;
- (BOOL)requiresResponse;
- (SADomainObject)object;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setObject:(id)a3;
@end

@implementation SAUISnippetObjectInteraction

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SnippetObjectInteraction";
}

+ (id)snippetObjectInteraction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SADomainObject)object
{
  return (SADomainObject *)AceObjectAceObjectForProperty(self, @"object");
}

- (void)setObject:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end