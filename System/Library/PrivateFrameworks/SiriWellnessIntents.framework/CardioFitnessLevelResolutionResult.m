@interface CardioFitnessLevelResolutionResult
+ (id)confirmationRequiredWithCardioFitnessLevelToConfirm:(int64_t)a3;
+ (id)successWithResolvedCardioFitnessLevel:(int64_t)a3;
- (CardioFitnessLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation CardioFitnessLevelResolutionResult

+ (id)successWithResolvedCardioFitnessLevel:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static CardioFitnessLevelResolutionResult.success(with:)();
  return v3;
}

+ (id)confirmationRequiredWithCardioFitnessLevelToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static CardioFitnessLevelResolutionResult.confirmationRequired(with:)();
  return v3;
}

- (CardioFitnessLevelResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (CardioFitnessLevelResolutionResult *)CardioFitnessLevelResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end