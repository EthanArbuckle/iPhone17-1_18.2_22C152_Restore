@interface ModifyContactAttributeModifyNickNameResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (ModifyContactAttributeModifyNickNameResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ModifyContactAttributeModifyNickNameResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  v4 = (void *)static GetContactAttributeSiriMatchesResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (ModifyContactAttributeModifyNickNameResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (ModifyContactAttributeModifyNickNameResolutionResult *)ModifyContactAttributeModifyNickNameResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end