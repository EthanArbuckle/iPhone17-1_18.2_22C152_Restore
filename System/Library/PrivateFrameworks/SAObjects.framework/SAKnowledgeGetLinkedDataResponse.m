@interface SAKnowledgeGetLinkedDataResponse
+ (id)getLinkedDataResponse;
- (BOOL)requiresResponse;
- (NSArray)result;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResult:(id)a3;
@end

@implementation SAKnowledgeGetLinkedDataResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"GetLinkedDataResponse";
}

+ (id)getLinkedDataResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)result
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"result"];
}

- (void)setResult:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end