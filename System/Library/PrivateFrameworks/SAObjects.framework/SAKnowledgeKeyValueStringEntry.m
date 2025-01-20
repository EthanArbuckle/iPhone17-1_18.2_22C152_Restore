@interface SAKnowledgeKeyValueStringEntry
+ (id)keyValueStringEntry;
- (BOOL)requiresResponse;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setValue:(id)a3;
@end

@implementation SAKnowledgeKeyValueStringEntry

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"KeyValueStringEntry";
}

+ (id)keyValueStringEntry
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end