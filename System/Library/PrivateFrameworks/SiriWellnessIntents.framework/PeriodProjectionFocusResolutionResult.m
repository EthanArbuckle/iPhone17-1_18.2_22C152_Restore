@interface PeriodProjectionFocusResolutionResult
+ (id)confirmationRequiredWithPeriodProjectionFocusToConfirm:(int64_t)a3;
+ (id)successWithResolvedPeriodProjectionFocus:(int64_t)a3;
- (PeriodProjectionFocusResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation PeriodProjectionFocusResolutionResult

+ (id)successWithResolvedPeriodProjectionFocus:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static PeriodProjectionFocusResolutionResult.success(with:)();
  return v3;
}

+ (id)confirmationRequiredWithPeriodProjectionFocusToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v3 = static PeriodProjectionFocusResolutionResult.confirmationRequired(with:)();
  return v3;
}

- (PeriodProjectionFocusResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (PeriodProjectionFocusResolutionResult *)PeriodProjectionFocusResolutionResult.init(JSONDictionary:intent:)(v6, a4);

  return v10;
}

@end