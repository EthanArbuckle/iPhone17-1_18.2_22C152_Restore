@interface SAAppsSearchMarketplace
- (BOOL)requiresResponse;
- (NSString)keyword;
- (NSString)marketplace;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setKeyword:(id)a3;
- (void)setMarketplace:(id)a3;
@end

@implementation SAAppsSearchMarketplace

- (id)groupIdentifier
{
  return @"com.apple.ace.apps";
}

- (id)encodedClassName
{
  return @"SearchMarketplace";
}

- (NSString)keyword
{
  return (NSString *)[(AceObject *)self propertyForKey:@"keyword"];
}

- (void)setKeyword:(id)a3
{
}

- (NSString)marketplace
{
  return (NSString *)[(AceObject *)self propertyForKey:@"marketplace"];
}

- (void)setMarketplace:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end