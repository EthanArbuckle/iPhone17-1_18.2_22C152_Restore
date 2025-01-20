@interface SAVCSVendResultsToSearch
+ (id)vendResultsToSearch;
- (BOOL)requiresResponse;
- (NSArray)shelves;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setShelves:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAVCSVendResultsToSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.videocontent";
}

- (id)encodedClassName
{
  return @"VendResultsToSearch";
}

+ (id)vendResultsToSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)shelves
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"shelves", v3);
}

- (void)setShelves:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end