@interface SAKnowledgeGetLinkedData
+ (id)getLinkedData;
- (BOOL)requiresResponse;
- (NSString)sparqlQuery;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSparqlQuery:(id)a3;
@end

@implementation SAKnowledgeGetLinkedData

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"GetLinkedData";
}

+ (id)getLinkedData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)sparqlQuery
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sparqlQuery"];
}

- (void)setSparqlQuery:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end