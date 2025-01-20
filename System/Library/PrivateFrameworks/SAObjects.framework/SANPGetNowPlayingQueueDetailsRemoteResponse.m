@interface SANPGetNowPlayingQueueDetailsRemoteResponse
+ (id)getNowPlayingQueueDetailsRemoteResponse;
- (BOOL)requiresResponse;
- (NSDictionary)routeResponses;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRouteResponses:(id)a3;
@end

@implementation SANPGetNowPlayingQueueDetailsRemoteResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"GetNowPlayingQueueDetailsRemoteResponse";
}

+ (id)getNowPlayingQueueDetailsRemoteResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)routeResponses
{
  uint64_t v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, @"routeResponses", v3);
}

- (void)setRouteResponses:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end