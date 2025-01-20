@interface SAKnowledgeSetLinkedData
+ (id)setLinkedData;
- (BOOL)requiresResponse;
- (NSArray)linkedData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLinkedData:(id)a3;
@end

@implementation SAKnowledgeSetLinkedData

- (id)groupIdentifier
{
  return @"com.apple.ace.knowledgeStore";
}

- (id)encodedClassName
{
  return @"SetLinkedData";
}

+ (id)setLinkedData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)linkedData
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"linkedData", v3);
}

- (void)setLinkedData:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end