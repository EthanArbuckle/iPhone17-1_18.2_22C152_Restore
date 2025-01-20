@interface NowPlayingMediaTypeResolutionResult
+ (id)confirmationRequiredWithNowPlayingMediaTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedNowPlayingMediaType:(int64_t)a3;
- (NowPlayingMediaTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation NowPlayingMediaTypeResolutionResult

+ (id)successWithResolvedNowPlayingMediaType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithNowPlayingMediaTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (NowPlayingMediaTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (NowPlayingMediaTypeResolutionResult *)NowPlayingMediaTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end