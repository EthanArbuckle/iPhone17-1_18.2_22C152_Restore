@interface SAStockDelete
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)stocks;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStocks:(id)a3;
@end

@implementation SAStockDelete

- (id)groupIdentifier
{
  return @"com.apple.ace.stock";
}

- (id)encodedClassName
{
  return @"Delete";
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

- (BOOL)mutatingCommand
{
  return 1;
}

@end