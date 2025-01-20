@interface SAKnowledgeSetValuesForKeys
+ (id)setValuesForKeys;
- (BOOL)requiresResponse;
- (NSArray)entries;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEntries:(id)a3;
@end

@implementation SAKnowledgeSetValuesForKeys

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"SetValuesForKeys";
}

+ (id)setValuesForKeys
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
  return 1;
}

@end