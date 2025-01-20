@interface ContactAttributeResolutionResult
+ (id)confirmationRequiredWithContactAttributeToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithContactAttributesToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedContactAttribute:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (ContactAttributeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ContactAttributeResolutionResult

+ (id)successWithResolvedContactAttribute:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContactAttributeResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithContactAttributesToDisambiguate:(id)a3
{
  type metadata accessor for ContactAttribute();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v4 = static ContactAttributeResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithContactAttributeToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContactAttributeResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id v3 = a3;
  static ContactAttributeResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id v3 = a3;
  static ContactAttributeResolutionResult.confirmationRequired(with:)();
}

- (ContactAttributeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (ContactAttributeResolutionResult *)ContactAttributeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end