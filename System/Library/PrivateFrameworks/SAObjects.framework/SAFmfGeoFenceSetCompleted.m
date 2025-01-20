@interface SAFmfGeoFenceSetCompleted
+ (id)geoFenceSetCompleted;
- (BOOL)requiresResponse;
- (NSURL)searchContext;
- (SAFmfGeoFence)geoFence;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGeoFence:(id)a3;
- (void)setSearchContext:(id)a3;
@end

@implementation SAFmfGeoFenceSetCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"GeoFenceSetCompleted";
}

+ (id)geoFenceSetCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAFmfGeoFence)geoFence
{
  return (SAFmfGeoFence *)AceObjectAceObjectForProperty(self, @"geoFence");
}

- (void)setGeoFence:(id)a3
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