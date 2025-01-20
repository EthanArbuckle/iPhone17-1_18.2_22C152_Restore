@interface SAStockReference
+ (id)reference;
- (NSString)companyName;
- (NSString)symbol;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCompanyName:(id)a3;
- (void)setSymbol:(id)a3;
@end

@implementation SAStockReference

- (id)groupIdentifier
{
  return @"com.apple.ace.stock";
}

- (id)encodedClassName
{
  return @"Reference";
}

+ (id)reference
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)companyName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"companyName"];
}

- (void)setCompanyName:(id)a3
{
}

- (NSString)symbol
{
  return (NSString *)[(AceObject *)self propertyForKey:@"symbol"];
}

- (void)setSymbol:(id)a3
{
}

@end