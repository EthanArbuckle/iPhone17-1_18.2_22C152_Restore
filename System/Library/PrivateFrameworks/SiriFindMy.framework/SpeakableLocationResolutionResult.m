@interface SpeakableLocationResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithSpeakableLocationToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithSpeakableLocationsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedSpeakableLocation:(id)a3;
- (SpeakableLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SpeakableLocationResolutionResult

+ (id)successWithResolvedSpeakableLocation:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static SpeakableLocationResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSpeakableLocationsToDisambiguate:(id)a3
{
  type metadata accessor for SpeakableLocation();
  unint64_t v3 = sub_1D463FAE8();
  swift_getObjCClassMetadata();
  id v4 = static SpeakableLocationResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithSpeakableLocationToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static SpeakableLocationResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (SpeakableLocationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_1D463F868();
  return (SpeakableLocationResolutionResult *)SpeakableLocationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end