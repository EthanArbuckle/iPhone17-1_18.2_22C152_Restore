@interface SAMPCreateRadioStation
+ (id)createRadioStation;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (NSNumber)startPlaying;
- (NSString)assetInfo;
- (NSURL)stationUrl;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAssetInfo:(id)a3;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setStartPlaying:(id)a3;
- (void)setStationUrl:(id)a3;
@end

@implementation SAMPCreateRadioStation

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"CreateRadioStation";
}

+ (id)createRadioStation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)assetInfo
{
  return (NSString *)[(AceObject *)self propertyForKey:@"assetInfo"];
}

- (void)setAssetInfo:(id)a3
{
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
}

- (NSNumber)startPlaying
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"startPlaying"];
}

- (void)setStartPlaying:(id)a3
{
}

- (NSURL)stationUrl
{
  return (NSURL *)AceObjectURLForProperty(self, @"stationUrl");
}

- (void)setStationUrl:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end