@interface SAPhoneSearchCompleted
+ (id)searchCompleted;
- (BOOL)requiresResponse;
- (NSArray)phoneSearchResults;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPhoneSearchResults:(id)a3;
@end

@implementation SAPhoneSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"SearchCompleted";
}

+ (id)searchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)phoneSearchResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"phoneSearchResults", v3);
}

- (void)setPhoneSearchResults:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end