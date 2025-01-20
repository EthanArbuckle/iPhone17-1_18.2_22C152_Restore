@interface MatchedMedNameResolutionResult
+ (id)confirmationRequiredWithMatchedMedNameToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithMatchedMedNamesToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedMatchedMedName:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (MatchedMedNameResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation MatchedMedNameResolutionResult

+ (id)successWithResolvedMatchedMedName:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = static MatchedMedNameResolutionResult.success(with:)((uint64_t)a3);

  return v6;
}

+ (id)disambiguationWithMatchedMedNamesToDisambiguate:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  type metadata accessor for MatchedMedName();
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v7 = static MatchedMedNameResolutionResult.disambiguation(with:)(v5);
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)confirmationRequiredWithMatchedMedNameToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  id v6 = static MatchedMedNameResolutionResult.confirmationRequired(with:)(a3);

  return v6;
}

+ (id)successWithResolvedObject:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  static MatchedMedNameResolutionResult.success(with:)();
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  type metadata accessor for INObject();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  static MatchedMedNameResolutionResult.disambiguation(with:)();
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  swift_getObjCClassMetadata();
  static MatchedMedNameResolutionResult.confirmationRequired(with:)();
}

- (MatchedMedNameResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (MatchedMedNameResolutionResult *)MatchedMedNameResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end