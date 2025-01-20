@interface PeriodFlowResolutionResult
+ (id)confirmationRequiredWithPeriodFlowToConfirm:(int64_t)a3;
+ (id)successWithResolvedPeriodFlow:(int64_t)a3;
- (PeriodFlowResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PeriodFlowResolutionResult

+ (id)successWithResolvedPeriodFlow:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static PeriodFlowResolutionResult.success(with:)();
  return v3;
}

+ (id)confirmationRequiredWithPeriodFlowToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static PeriodFlowResolutionResult.confirmationRequired(with:)();
  return v3;
}

- (PeriodFlowResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (PeriodFlowResolutionResult *)PeriodFlowResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end