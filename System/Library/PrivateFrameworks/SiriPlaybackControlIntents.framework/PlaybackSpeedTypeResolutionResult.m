@interface PlaybackSpeedTypeResolutionResult
+ (id)confirmationRequiredWithPlaybackSpeedTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedPlaybackSpeedType:(int64_t)a3;
- (PlaybackSpeedTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PlaybackSpeedTypeResolutionResult

+ (id)successWithResolvedPlaybackSpeedType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithPlaybackSpeedTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (PlaybackSpeedTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (PlaybackSpeedTypeResolutionResult *)PlaybackSpeedTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end