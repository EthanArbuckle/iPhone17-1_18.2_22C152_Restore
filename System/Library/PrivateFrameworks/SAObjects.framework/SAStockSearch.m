@interface SAStockSearch
+ (id)search;
- (BOOL)requiresResponse;
- (NSArray)stockReferences;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStockReferences:(id)a3;
@end

@implementation SAStockSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.stock";
}

- (id)encodedClassName
{
  return @"Search";
}

+ (id)search
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)stockReferences
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"stockReferences", v3);
}

- (void)setStockReferences:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end