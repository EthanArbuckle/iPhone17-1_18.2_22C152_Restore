@interface SAStockAdd
+ (id)add;
- (BOOL)requiresResponse;
- (NSArray)stocks;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStocks:(id)a3;
@end

@implementation SAStockAdd

- (id)groupIdentifier
{
  return @"com.apple.ace.stock";
}

- (id)encodedClassName
{
  return @"Add";
}

+ (id)add
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)stocks
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"stocks", v3);
}

- (void)setStocks:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end