@interface ModifyContactAttributeModifyRelationshipResolutionResult
- (ModifyContactAttributeModifyRelationshipResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ModifyContactAttributeModifyRelationshipResolutionResult

- (ModifyContactAttributeModifyRelationshipResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (ModifyContactAttributeModifyRelationshipResolutionResult *)ModifyContactAttributeModifyRelationshipResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end