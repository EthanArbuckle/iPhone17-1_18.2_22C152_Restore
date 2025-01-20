@interface ContactRelationResolutionResult
+ (id)confirmationRequiredWithContactRelationToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithContactRelationsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedContactRelation:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (ContactRelationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ContactRelationResolutionResult

+ (id)successWithResolvedContactRelation:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContactRelationResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithContactRelationsToDisambiguate:(id)a3
{
  type metadata accessor for ContactRelation();
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v4 = static ContactRelationResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithContactRelationToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContactRelationResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id v3 = a3;
  static ContactRelationResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id v3 = a3;
  static ContactRelationResolutionResult.confirmationRequired(with:)();
}

- (ContactRelationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (ContactRelationResolutionResult *)ContactRelationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end