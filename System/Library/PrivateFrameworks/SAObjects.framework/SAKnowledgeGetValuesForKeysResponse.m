@interface SAKnowledgeGetValuesForKeysResponse
+ (id)getValuesForKeysResponse;
- (BOOL)requiresResponse;
- (NSArray)entries;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEntries:(id)a3;
@end

@implementation SAKnowledgeGetValuesForKeysResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"GetValuesForKeysResponse";
}

+ (id)getValuesForKeysResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)entries
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"entries", v3);
}

- (void)setEntries:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end