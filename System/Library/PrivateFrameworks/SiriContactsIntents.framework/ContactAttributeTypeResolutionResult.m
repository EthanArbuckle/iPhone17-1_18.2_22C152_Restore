@interface ContactAttributeTypeResolutionResult
+ (id)confirmationRequiredWithContactAttributeTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedContactAttributeType:(int64_t)a3;
- (ContactAttributeTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ContactAttributeTypeResolutionResult

+ (id)successWithResolvedContactAttributeType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ContactAttributeTypeResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithContactAttributeTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ContactAttributeTypeResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (ContactAttributeTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (ContactAttributeTypeResolutionResult *)ContactAttributeTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end