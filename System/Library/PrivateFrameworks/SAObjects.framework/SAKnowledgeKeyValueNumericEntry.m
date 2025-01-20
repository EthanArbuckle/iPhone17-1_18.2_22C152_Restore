@interface SAKnowledgeKeyValueNumericEntry
+ (id)keyValueNumericEntry;
- (BOOL)requiresResponse;
- (NSNumber)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setValue:(id)a3;
@end

@implementation SAKnowledgeKeyValueNumericEntry

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"KeyValueNumericEntry";
}

+ (id)keyValueNumericEntry
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)value
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end