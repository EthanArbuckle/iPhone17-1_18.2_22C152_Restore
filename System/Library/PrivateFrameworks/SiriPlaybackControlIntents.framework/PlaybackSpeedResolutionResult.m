@interface PlaybackSpeedResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithPlaybackSpeedToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithPlaybackSpeedsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedPlaybackSpeed:(id)a3;
- (PlaybackSpeedResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PlaybackSpeedResolutionResult

+ (id)successWithResolvedPlaybackSpeed:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A63F98((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithPlaybackSpeedsToDisambiguate:(id)a3
{
  type metadata accessor for PlaybackSpeed();
  unint64_t v3 = sub_232A68658();
  swift_getObjCClassMetadata();
  id v4 = sub_232A6404C(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithPlaybackSpeedToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A641B0((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
}

- (PlaybackSpeedResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (PlaybackSpeedResolutionResult *)PlaybackSpeedResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end