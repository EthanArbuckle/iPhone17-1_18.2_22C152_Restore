@interface GetContactAttributeSiriMatchesResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (GetContactAttributeSiriMatchesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation GetContactAttributeSiriMatchesResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  v4 = (void *)static GetContactAttributeSiriMatchesResolutionResult.unsupported(forReason:)(a3);
  return v4;
}

- (GetContactAttributeSiriMatchesResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  return (GetContactAttributeSiriMatchesResolutionResult *)GetContactAttributeSiriMatchesResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end