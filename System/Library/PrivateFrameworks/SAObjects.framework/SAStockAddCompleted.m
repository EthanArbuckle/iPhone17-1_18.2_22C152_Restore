@interface SAStockAddCompleted
+ (id)addCompleted;
- (BOOL)requiresResponse;
- (NSArray)results;
- (NSArray)stocks;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setResults:(id)a3;
- (void)setStocks:(id)a3;
@end

@implementation SAStockAddCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.stock";
}

- (id)encodedClassName
{
  return @"AddCompleted";
}

+ (id)addCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)results
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"results");
}

- (void)setResults:(id)a3
{
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
  return 0;
}

@end