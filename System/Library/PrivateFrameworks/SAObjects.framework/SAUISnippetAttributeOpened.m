@interface SAUISnippetAttributeOpened
+ (id)snippetAttributeOpened;
- (BOOL)requiresResponse;
- (NSString)attributeName;
- (NSString)attributeValue;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAttributeName:(id)a3;
- (void)setAttributeValue:(id)a3;
@end

@implementation SAUISnippetAttributeOpened

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"SnippetAttributeOpened";
}

+ (id)snippetAttributeOpened
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)attributeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"attributeName"];
}

- (void)setAttributeName:(id)a3
{
}

- (NSString)attributeValue
{
  return (NSString *)[(AceObject *)self propertyForKey:@"attributeValue"];
}

- (void)setAttributeValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end