@interface SANPGetNowPlayingQueueDetailsResponse
+ (id)getNowPlayingQueueDetailsResponse;
- (BOOL)requiresResponse;
- (NSArray)nextItems;
- (NSArray)previousItems;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNextItems:(id)a3;
- (void)setPreviousItems:(id)a3;
@end

@implementation SANPGetNowPlayingQueueDetailsResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"GetNowPlayingQueueDetailsResponse";
}

+ (id)getNowPlayingQueueDetailsResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)nextItems
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"nextItems", v3);
}

- (void)setNextItems:(id)a3
{
}

- (NSArray)previousItems
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"previousItems", v3);
}

- (void)setPreviousItems:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end