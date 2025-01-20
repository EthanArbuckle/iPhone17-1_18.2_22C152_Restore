@interface SAFmfGeoFenceSnippet
+ (id)geoFenceSnippet;
- (NSNumber)enable;
- (NSNumber)oneTimeOnly;
- (NSString)fenceType;
- (NSURL)searchContext;
- (SAFmfGeoFence)aceFmfGeoFence;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAceFmfGeoFence:(id)a3;
- (void)setEnable:(id)a3;
- (void)setFenceType:(id)a3;
- (void)setOneTimeOnly:(id)a3;
- (void)setSearchContext:(id)a3;
@end

@implementation SAFmfGeoFenceSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"GeoFenceSnippet";
}

+ (id)geoFenceSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAFmfGeoFence)aceFmfGeoFence
{
  return (SAFmfGeoFence *)AceObjectAceObjectForProperty(self, @"aceFmfGeoFence");
}

- (void)setAceFmfGeoFence:(id)a3
{
}

- (NSNumber)enable
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"enable"];
}

- (void)setEnable:(id)a3
{
}

- (NSString)fenceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fenceType"];
}

- (void)setFenceType:(id)a3
{
}

- (NSNumber)oneTimeOnly
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"oneTimeOnly"];
}

- (void)setOneTimeOnly:(id)a3
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