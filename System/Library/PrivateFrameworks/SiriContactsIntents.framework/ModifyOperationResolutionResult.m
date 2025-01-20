@interface ModifyOperationResolutionResult
+ (id)confirmationRequiredWithModifyOperationToConfirm:(int64_t)a3;
+ (id)successWithResolvedModifyOperation:(int64_t)a3;
- (ModifyOperationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ModifyOperationResolutionResult

+ (id)successWithResolvedModifyOperation:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ContactAttributeTypeResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithModifyOperationToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ContactAttributeTypeResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (ModifyOperationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (ModifyOperationResolutionResult *)ModifyOperationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end