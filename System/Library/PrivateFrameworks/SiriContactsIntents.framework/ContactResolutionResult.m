@interface ContactResolutionResult
+ (id)confirmationRequiredWithContactToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithContactsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedContact:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (ContactResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ContactResolutionResult

+ (id)successWithResolvedContact:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContactResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithContactsToDisambiguate:(id)a3
{
  type metadata accessor for Contact();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v4 = static ContactResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithContactToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContactResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id v3 = a3;
  static ContactResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id v3 = a3;
  static ContactResolutionResult.confirmationRequired(with:)();
}

- (ContactResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (ContactResolutionResult *)ContactResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end