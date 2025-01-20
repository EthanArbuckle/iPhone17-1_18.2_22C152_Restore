@interface QualifierResolutionResult
+ (id)confirmationRequiredWithQualifierToConfirm:(int64_t)a3;
+ (id)successWithResolvedQualifier:(int64_t)a3;
- (QualifierResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation QualifierResolutionResult

+ (id)successWithResolvedQualifier:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ContactAttributeTypeResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithQualifierToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ContactAttributeTypeResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (QualifierResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (QualifierResolutionResult *)QualifierResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end