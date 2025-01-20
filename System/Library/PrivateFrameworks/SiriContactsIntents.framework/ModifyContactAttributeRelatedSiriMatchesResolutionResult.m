@interface ModifyContactAttributeRelatedSiriMatchesResolutionResult
- (ModifyContactAttributeRelatedSiriMatchesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ModifyContactAttributeRelatedSiriMatchesResolutionResult

- (ModifyContactAttributeRelatedSiriMatchesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (ModifyContactAttributeRelatedSiriMatchesResolutionResult *)ModifyContactAttributeRelatedSiriMatchesResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end