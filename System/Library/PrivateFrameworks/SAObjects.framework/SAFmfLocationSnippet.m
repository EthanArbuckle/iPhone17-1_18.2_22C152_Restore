@interface SAFmfLocationSnippet
+ (id)locationSnippet;
- (NSArray)locations;
- (NSNumber)atRequestedLocation;
- (NSString)proximity;
- (NSURL)searchContext;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAtRequestedLocation:(id)a3;
- (void)setLocations:(id)a3;
- (void)setProximity:(id)a3;
- (void)setSearchContext:(id)a3;
@end

@implementation SAFmfLocationSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"LocationSnippet";
}

+ (id)locationSnippet
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

- (NSArray)locations
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"locations", v3);
}

- (void)setLocations:(id)a3
{
}

- (NSString)proximity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"proximity"];
}

- (void)setProximity:(id)a3
{
}

- (NSURL)searchContext
{
  return (NSURL *)AceObjectURLForProperty(self, @"searchContext");
}

- (void)setSearchContext:(id)a3
{
}

@end