@interface NowPlayingStateResolutionResult
+ (id)confirmationRequiredWithNowPlayingStateToConfirm:(int64_t)a3;
+ (id)successWithResolvedNowPlayingState:(int64_t)a3;
- (NowPlayingStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation NowPlayingStateResolutionResult

+ (id)successWithResolvedNowPlayingState:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithNowPlayingStateToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (NowPlayingStateResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (NowPlayingStateResolutionResult *)NowPlayingStateResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end