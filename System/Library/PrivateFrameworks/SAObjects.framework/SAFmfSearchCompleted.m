@interface SAFmfSearchCompleted
+ (id)searchCompleted;
- (BOOL)requiresResponse;
- (NSArray)fmfLocations;
- (NSNumber)atRequestedLocation;
- (NSURL)searchContext;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAtRequestedLocation:(id)a3;
- (void)setFmfLocations:(id)a3;
- (void)setSearchContext:(id)a3;
@end

@implementation SAFmfSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
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

- (NSNumber)atRequestedLocation
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"atRequestedLocation"];
}

- (void)setAtRequestedLocation:(id)a3
{
}

- (NSArray)fmfLocations
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"fmfLocations", v3);
}

- (void)setFmfLocations:(id)a3
{
}

- (NSURL)searchContext
{
  return (NSURL *)AceObjectURLForProperty(self, @"searchContext");
}

- (void)setSearchContext:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end