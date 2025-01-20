@interface SAKnowledgeKeyValueBlobEntry
+ (id)keyValueBlobEntry;
- (BOOL)requiresResponse;
- (NSData)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setValue:(id)a3;
@end

@implementation SAKnowledgeKeyValueBlobEntry

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"KeyValueBlobEntry";
}

+ (id)keyValueBlobEntry
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)value
{
  return (NSData *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end