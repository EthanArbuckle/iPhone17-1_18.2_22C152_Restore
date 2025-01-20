@interface SiriMatchResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithSiriMatchToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithSiriMatchsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedSiriMatch:(id)a3;
- (SiriMatchResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SiriMatchResolutionResult

+ (id)successWithResolvedSiriMatch:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static SiriMatchResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSiriMatchsToDisambiguate:(id)a3
{
  type metadata accessor for SiriMatch();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v4 = static SiriMatchResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithSiriMatchToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static SiriMatchResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id v3 = a3;
  static SiriMatchResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id v3 = a3;
  static SiriMatchResolutionResult.confirmationRequired(with:)();
}

- (SiriMatchResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (SiriMatchResolutionResult *)SiriMatchResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end